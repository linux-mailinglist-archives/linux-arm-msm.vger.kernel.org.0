Return-Path: <linux-arm-msm+bounces-47581-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14916A30C8B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 14:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C65353A6638
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 13:11:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58517214811;
	Tue, 11 Feb 2025 13:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MbvFltSY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A529A1F152B;
	Tue, 11 Feb 2025 13:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739279524; cv=none; b=AOtuCPq2iwvxI+0Kip2TSZ09SPSlaA2jE/nTPG+zX0uyFnbcR09lcNio35i1B7pGjnk2niVLDkdGWfme+I0q670R1A/wxrmbwP730GUk4DGkY/blRB1vjcfYgSawE0QqdV7LW4OLBaFK/36WkbNw0Ef16MfE1nORGFqYqJxxNeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739279524; c=relaxed/simple;
	bh=P6B2BgV8kUxtH3yNi8dAVWWVraMhOlq9aqsEI+/qs7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=YXqu1ZwqXwF4PmsNREQKNb+IvBm1RjKqLpcVbHqKDHGLBoML6vD7P/hDOzEiNx0Vkrvb0Dkv62NXSKpozogQnpzqfeu6F+joQgA0ZMgP+F7C3XtR2lizXuMzqA5gY1xTRwQQEubA0UQAgzRo3g2Vx7U4nVYrYGI4uSODkpIhytE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MbvFltSY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BBHiaZ025705;
	Tue, 11 Feb 2025 13:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lVfdPTi5nRQrjao5/LJHP9xj6vjgUkDKr7iUSnXniTw=; b=MbvFltSYav3ESbcQ
	vCIrklwr7yndHppcL3ex6xY1sw2XYGCLqYwGDRW3fMoX3kMMpRwXOWgELsHVhwrf
	Bxyd2b33TX6bGTHKPa2lauJC8/W4cO+/RoSLac8+LMgo4jt/uRRmVP/XXzs1dQQd
	ynZKOZNw6AUdDpLMAqZkGvEvVBE9VVRMqL47+uI4SImPRAnyhbMzQQoqFYVDZ5W6
	/q83sXS1Ifjne7AZkgn7F/ktojccwvgJUTLedH3p1F5SKrRUN+UO3vSIwP0P4NEk
	TskuWfs2ukylSgV5lvzBAQ1vzw1b3VOFvQzL0JOW/qjK+K6kgYZOCKCe0ZSUkBhX
	H73gpg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44r5j58c6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 13:11:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51BDBn3k009230
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 13:11:49 GMT
Received: from [10.216.36.40] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Feb
 2025 05:11:42 -0800
Message-ID: <271e7b4f-454c-426e-a3f6-dcb55389374e@quicinc.com>
Date: Tue, 11 Feb 2025 18:41:39 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p-ride: Enable Adreno 663
 GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20241030-a663-gpu-support-v3-0-bdf1d9ce6021@quicinc.com>
 <20241030-a663-gpu-support-v3-2-bdf1d9ce6021@quicinc.com>
 <4cfd1ebc-1a95-43d4-b36a-8b183c6dfd16@quicinc.com>
 <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Language: en-US
In-Reply-To: <ah6nusoouth7ziu3iscxmafm6cxuwwebxt44ixsjmesp5adwc4@e5lnbztds2xd>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pcXLBtDW7afzte1pcPYanHTRHxKleuwW
X-Proofpoint-GUID: pcXLBtDW7afzte1pcPYanHTRHxKleuwW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_05,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=957 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110087

On 2/9/2025 9:59 PM, Dmitry Baryshkov wrote:
> On Wed, Nov 13, 2024 at 02:18:43AM +0530, Akhil P Oommen wrote:
>> On 10/30/2024 12:32 PM, Akhil P Oommen wrote:
>>> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>>
>>> Enable GPU for sa8775p-ride platform and provide path for zap
>>> shader.
>>>
>>> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
>>> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>> index 0c1b21def4b6..4901163df8f3 100644
>>> --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
>>> @@ -407,6 +407,14 @@ queue3 {
>>>  	};
>>>  };
>>>  
>>> +&gpu {
>>> +	status = "okay";
>>> +};
>>> +
>>> +&gpu_zap_shader {
>>> +	firmware-name = "qcom/sa8775p/a663_zap.mbn";
>>> +};
>>> +
>>>  &i2c11 {
>>>  	clock-frequency = <400000>;
>>>  	pinctrl-0 = <&qup_i2c11_default>;
>>>
>>
>> Bjorn,
>>
>> Please ignore this patch for now. This is probably not the right
>> platform dtsi file where gpu should be enabled. I am discussing about
>> this internally. Will send a revision or a new patch based on the
>> conclusion.
> 
> Akhil, any updates on this?
> 

I am still waiting for the discussion about QCS9075 board dts files [1]
to conclude.

[1]
https://lore.kernel.org/lkml/Z3eMxl1Af8TOAQW%2F@hu-wasimn-hyd.qualcomm.com/T/

-Akhil

