Return-Path: <linux-arm-msm+bounces-28723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE99540A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 06:35:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2C211C22008
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Aug 2024 04:35:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5198F763EE;
	Fri, 16 Aug 2024 04:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SFhb4agF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B588433CD2;
	Fri, 16 Aug 2024 04:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723782938; cv=none; b=WGeqnzhL+KTqhmt+AgxRcmYt6IzbFAHozUlUFoKfiaiqCI1pWt3Uz82EmVB3boR2svmLDSwkEtBpf8z8sFPioHDTJojlge8YApoHpLxlZeFYPENlTsW0Qk7hxUwj45EdU58tcfF6EowiPlkbQBE9dZbIba3peKZkY4RV8qJqLyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723782938; c=relaxed/simple;
	bh=pUxFcDaOYFmWHj/r/e/Gqlsqjrkg27PZ3Bsk2rL+VmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=AN2Frj7FmosZ6Rhxbn4/sK+enTANH/s7R2cD05XbI6iSZCkribikNiNZEi1HvB1cFLHeS0ptwTecz7/ffpG7Bw0YICWe87eYqCb8WKnJ69rmgqWuKcdXhISqTPZ00XRIiupoJM7PxBCzctfd+AD2W0/Id3TprBGHJeAcSin9iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SFhb4agF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47FNqEbP000948;
	Fri, 16 Aug 2024 04:35:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGg41Zj6uIzcFj0xSAbwGNEh48EQEXI7APG5R9cae/0=; b=SFhb4agFpoNBsuJo
	pl8kNj86IFeKQCbC9gCmii6F2WbjG0CRQsV9EqVUtuFCBLVKhLcyv3xAvoos1788
	VnCGHMAed0ZIMRH+KnNKwUjyogCfs3S3KtUtKNTBMb7dXfRmSPXRzDt1JswqGWYz
	SStu1h5psMjMf14Dl4nzeGwlDUy95pDRnQWFwYDhaiEfW6XGDaspBa3Gc/ojbERH
	//+J72A3wF/+hySdhHsthlHMGuWaroJkizdQI6HGS9DxV/PDsllGXnlsXeqM4Glq
	wTSRdz91Xx7Jt3vBa/NuE2dO4PYy12xOiLoxiH0N7gwVroLsqeHGnRbLKY2een3G
	0nSX2Q==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m296cju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 04:35:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47G4ZV1m031836
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Aug 2024 04:35:31 GMT
Received: from [10.217.216.152] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 15 Aug
 2024 21:35:26 -0700
Message-ID: <658285b0-9e79-427b-9f68-a8fea0c469ba@quicinc.com>
Date: Fri, 16 Aug 2024 10:05:23 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: clock: qcom: Add SA8775P video clock
 controller
To: Tengfei Fan <quic_tengfan@quicinc.com>,
        Krzysztof Kozlowski
	<krzk@kernel.org>,
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
 <78c07cb4-c630-487d-b437-0aa775d2450c@quicinc.com>
Content-Language: en-US
From: Taniya Das <quic_tdas@quicinc.com>
In-Reply-To: <78c07cb4-c630-487d-b437-0aa775d2450c@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _zBHtok1z9CeYr8vncPayjfJZkqZuYbT
X-Proofpoint-ORIG-GUID: _zBHtok1z9CeYr8vncPayjfJZkqZuYbT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-15_18,2024-08-15_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408160031



On 7/29/2024 4:11 PM, Tengfei Fan wrote:
> 
> 
> On 7/16/2024 3:44 PM, Krzysztof Kozlowski wrote:
>> On 15/07/2024 10:23, Taniya Das wrote:
>>> Add device tree bindings for the video clock controller on Qualcomm
>>> SA8775P platform.
>>>
>>> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
>>> ---
>>>   .../bindings/clock/qcom,sa8775p-videocc.yaml       | 62 
>>> ++++++++++++++++++++++
>>>   include/dt-bindings/clock/qcom,sa8775p-videocc.h   | 47 
>>> ++++++++++++++++
>>>   2 files changed, 109 insertions(+)
>>
>>
>> AFAIK, the sa8775p is being dropped and later re-introduced as quite
>> different device.
>>
>> What will be the use of these bindings after we remove sa8775p? Or
>> rename it? Or after whatever Qualcomm is planning?
>>
>> I am sorry, but at this moment I am reluctant to ack anything related to
>> sa8775p.
>>
>>
>> Best regards,
>> Krzysztof
>>
> 
> After considering the feedback provided on the subject, We have decided
> to keep current SA8775p compatible and ABI compatibility in drivers.
> Therefore, this patch is still needed, please continue to review this
> patch.
> Thank you for your input.
> 

Thank you Tengfei. Will submit the patches for review again.

-- 
Thanks & Regards,
Taniya Das.

