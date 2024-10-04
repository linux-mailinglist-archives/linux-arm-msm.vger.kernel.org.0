Return-Path: <linux-arm-msm+bounces-33094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C9C98FFC4
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 11:31:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 017781C22076
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 09:31:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AEE41459F7;
	Fri,  4 Oct 2024 09:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZAQ0vilV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B621465AB;
	Fri,  4 Oct 2024 09:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034303; cv=none; b=bWFl8C9zAsllqDP2OckTaKa5z6fyrl8iJ9eny3Bk3mugClhUcogLtHgIKFXDQ6CdAJKUb+4Hwf6k9LbrenVCMycdviHEPpbUaHHIwEEUpgL5IkYBP8uhkUaT0T70yRrzMp5alNsGx16lP2jsZnFZxHrZ7ZuYR1y2jXgiDNcaDLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034303; c=relaxed/simple;
	bh=WCbBCAGratKHLCu4IdtoLMnHCiK7fyEbq5IcXUoRtNw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:CC:References:
	 In-Reply-To:Content-Type; b=OJOB0SouJxUpg2WYyKSsM0W5Qt76shXBYgO4ZvUdRjes166mgeWGFEnwYHP/4fIinfSxyX+6Lgn9JY8ogxZ8RFprgZOctaiV+bHt6qMhIoeM3+RGCkHhMrFdElZskWJ/7abTxrbXc4ESs9qmyYDw0xvtHgWLvt61FmHL+OsaNLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZAQ0vilV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 493Hxacw014201;
	Fri, 4 Oct 2024 09:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcAGaUrfE5HhvhY3mAhAI1Izzrh/AkDt/uOAIu8VL4A=; b=ZAQ0vilV0hYSdAg+
	nB07/CKc1UNCUt6Vq7w0prlO6hCm6R7GaqEyD4LkrfzfdnJTOkpLlweM1502rN+/
	w/kVP2CyjUMdPVsSgKmHcyWRCuB8svP9LwRw8emjKwgVAOXmjOix7OgL9zMgaz2v
	9RURZ+rgcF63glLm7YDnPHEfNf8Y0bYkYCLIp/KG8kLq1pdGENFe/8x8FP9EI7m4
	vHWnHechI+yqUL+3J1mFORpVNNdyiKp3jgs2/fZdYutOoo/tGtrWPZUXZYMRL3/S
	AJzOO5eD10iZ4IHwKoACZQSYsvS4h6B+Z7fbpftlIZKMFmJNNXOtL35HtjajQRgi
	+p3lmA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205e1nnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Oct 2024 09:31:38 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4949VauM016682
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 4 Oct 2024 09:31:36 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 4 Oct 2024
 02:31:28 -0700
Message-ID: <7ebe76e5-ed89-4ebd-bf3d-6b130b79c811@quicinc.com>
Date: Fri, 4 Oct 2024 15:01:25 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] dt-bindings: clock: qcom: Add SA8775P display
 clock controllers
From: Taniya Das <quic_tdas@quicinc.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "Bartosz
 Golaszewski" <bartosz.golaszewski@linaro.org>,
        <quic_imrashai@quicinc.com>, <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com>
 <20240816-sa8775p-mm-v3-v1-5-77d53c3c0cef@quicinc.com>
 <5kaz5wcvxhjtny5yy5i2e63ylzpor74lknvtvdkgpygxkf7yim@m6p5zof755lp>
 <65d129b5-088e-4cdb-a2fa-62448cfd2ad6@kernel.org>
 <52d2ee37-5a83-4ca2-902c-8e48b63b93b3@quicinc.com>
Content-Language: en-US
In-Reply-To: <52d2ee37-5a83-4ca2-902c-8e48b63b93b3@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: UK1e4zrFCPIwI3Bls8PaozyQQOHNmD1x
X-Proofpoint-ORIG-GUID: UK1e4zrFCPIwI3Bls8PaozyQQOHNmD1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1011
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040068



On 9/13/2024 10:35 AM, Taniya Das wrote:
> 
> 
> On 9/6/2024 5:54 PM, Krzysztof Kozlowski wrote:
>> On 18/08/2024 20:02, Krzysztof Kozlowski wrote:
>>> On Fri, Aug 16, 2024 at 12:01:47PM +0530, Taniya Das wrote:
>>>> Add device tree bindings for the display clock controllers
>>>> on Qualcomm SA8775P platform.
>>>>
>>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>>> ---
>>>>   .../bindings/clock/qcom,sa8775p-dispcc.yaml        | 79 
>>>> ++++++++++++++++++++
>>>>   include/dt-bindings/clock/qcom,sa8775p-dispcc.h    | 87 
>>>> ++++++++++++++++++++++
>>>>   2 files changed, 166 insertions(+)
>>>>
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Un-reviewed.
>>
>> We achieved consensus allowing sa8775p to stay, but now Qualcomm changes
>> point of view and insists on new approach of dropping sa8775p. Therefore
>> this change does not make much sense in the new approach.
>>
> 
> Krzysztof could you please re-review the patches again? As I understand 
> that Qualcomm will support both SA8775p and QCS9100 in Kernel. There’s 
> no plan to drop SA8775p support. These two SoCs will keep compatible.
> 
Krzysztof, Could you please help reviewing the patches again?

-- 
Thanks & Regards,
Taniya Das.

