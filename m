Return-Path: <linux-arm-msm+bounces-27233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DB5A93F2FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E884E1F24266
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 10:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49CE71448D3;
	Mon, 29 Jul 2024 10:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PoHh8lMY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C645C7603A;
	Mon, 29 Jul 2024 10:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722249689; cv=none; b=KZb+FU30JqKiMeymC3IwWfTN+Z8VfSuzZyaYEEEO61IO2wku+xl4FajDM23qmCMlRnYFRM9VE6doU32LvvnRmGhAEhBCIrYExKFfhEMG1dPH+KlOSVlfCRBfj+JinxKRpmCLPtx71galSstMAtc/0Owx8ntx/iRVt4dK3p2BqI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722249689; c=relaxed/simple;
	bh=rJE1/vjmouDYJI41uPkpl27EKBFxDh3CuEPBYVK25Cc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AlYcSV4lYMlVxKbSXbKtVFJa50k8mZWc8GDejv4qQ5EdCLYsCw04OrT0G9svUK5pyXCpzJIOBXFqGautsPrjoM3JQBmgciAhU8WEkxAMFwehLljogFkjlaaUJeosRKNek3FfzpPRYRn1X7mPBRgauHioqpHx12pBgQx9wyv9wXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PoHh8lMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAawWY019111;
	Mon, 29 Jul 2024 10:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJPr/ixXWKZCHke7eyBM18zYg1YmKo/2fpECqx7r7Ts=; b=PoHh8lMYGLNez0Ap
	gzGhnb9Eg6vWCJ6XZ5J5plGnfEmibqKZOpO4tf11i+9laoss6HoGRaYwrdpqNo6x
	2i0V8R7VX4iDtvkdw8TKuNYqgqFezDT0AiKFFltM53ATNpFt3gT5AeSwIMMNG7X7
	iiHmWn2vrvwbTrYn2WtmE78oiDV+NnnQ4NKxbMTv32aBmy1G+LjcMZIpEQqFXcO7
	le65y+nfNu1FCslAkS4ZY1NsbIAxbPe+LeHbOSng/T7fh5qAU5suxjPqoOMMZZYh
	YE/7UHnIcqy1DXNuD5TTP0/+oasgdxSnRjwU0ijQmTSA5abCF6iy7CM/+Jt/4vkw
	p+24Jw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40msne3vcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:41:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46TAfMUU015623
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:41:22 GMT
Received: from [10.239.132.204] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 03:41:17 -0700
Message-ID: <78c07cb4-c630-487d-b437-0aa775d2450c@quicinc.com>
Date: Mon, 29 Jul 2024 18:41:15 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        Tingwei
	<quic_tingweiz@quicinc.com>,
        "Aiqun(Maria) Yu" <quic_aiquny@quicinc.com>
References: <20240715-sa8775p-mm-v3-v1-0-badaf35ed670@quicinc.com>
 <20240715-sa8775p-mm-v3-v1-1-badaf35ed670@quicinc.com>
 <01f041b5-8ae9-4f04-b5cd-22ad39f12da3@kernel.org>
From: Tengfei Fan <quic_tengfan@quicinc.com>
In-Reply-To: <01f041b5-8ae9-4f04-b5cd-22ad39f12da3@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: c8C3ubY3AKiPatrlxOZDB8NtxPLQPrUR
X-Proofpoint-ORIG-GUID: c8C3ubY3AKiPatrlxOZDB8NtxPLQPrUR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_09,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1015
 spamscore=0 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290072



On 7/16/2024 3:44 PM, Krzysztof Kozlowski wrote:
> On 15/07/2024 10:23, Taniya Das wrote:
>> Add device tree bindings for the video clock controller on Qualcomm
>> SA8775P platform.
>>
>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>> ---
>>   .../bindings/clock/qcom,sa8775p-videocc.yaml       | 62 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,sa8775p-videocc.h   | 47 ++++++++++++++++
>>   2 files changed, 109 insertions(+)
> 
> 
> AFAIK, the sa8775p is being dropped and later re-introduced as quite
> different device.
> 
> What will be the use of these bindings after we remove sa8775p? Or
> rename it? Or after whatever Qualcomm is planning?
> 
> I am sorry, but at this moment I am reluctant to ack anything related to
> sa8775p.
> 
> 
> Best regards,
> Krzysztof
> 

After considering the feedback provided on the subject, We have decided
to keep current SA8775p compatible and ABI compatibility in drivers.
Therefore, this patch is still needed, please continue to review this
patch.
Thank you for your input.

-- 
Thx and BRs,
Tengfei Fan

