Return-Path: <linux-arm-msm+bounces-38174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE2A9D09ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D6328255D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F33614BF8F;
	Mon, 18 Nov 2024 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AzLLkMc/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4DD14B092;
	Mon, 18 Nov 2024 06:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731913069; cv=none; b=OtWzWYgDK855Um0N2QByXk4ZMlhToCII0PPsnMgHEhfTBwrAkZOcJ/oSpo/yukitKDkUQmj/ECkvdlriFjlaXRUh8x0pHqkfgxjVdJM0LrTp66GXQW3QGLUCPrZamUI36w6+FxF6DaPZIc0IBjqKrL9xCbLyGkXrzoAjy1N/Tc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731913069; c=relaxed/simple;
	bh=K1qUyK3DCr7kySVsqypCRz/q4FPFum6GHAhp8LI+UVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=qxRXar5C+iX+qpB+qUrzHUVGkqHoWX1+SA+pWAJXeu3Iyl97Hcn9aZEiTAQctjk/z2acRyWhNzQ0lpX9IIF+d4X6N3hikV+z/PI/bE9JciLTV3b+KwELQqWi2nnRbVMwvMj/7ylVLCDrJ3NUjKEi8MK4iNaoH92qoyQTgYDnxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AzLLkMc/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5RdZu001081;
	Mon, 18 Nov 2024 06:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/Enk6OigKE9HeDXJAojnMi3vDdZMDLytoyuoacIrOFI=; b=AzLLkMc/M1NeqmJX
	+2cC3KmRFuFRYzk0cQ9Ah8IOZNNufmh/X/Nx7ItkkPiQDP2Q6iOZkMrVCWdaBIgc
	ywlVzBH6fvw4XNVjzdXwyU7CurYWB8qQezXuD+fGSTLjn2Lzrri4Smay9wMLYr4j
	sgi7KEHYAS0zUff+53a2WKuzIpTkJ7oTDulXVnP6EwZAQSgHj9eDnusx26lh/hB+
	VrBsct6efXjKkQ1q+9V5zVEkEaET2lWrYgsGF3+Jq6XGhEnZcE2R7Csc/W3lv7MZ
	XVWaS8Oi5lKD/RXokEneN4tUoFlqOGBrhrQtvrXQuC1uSXxj1UFjbK3XlIKaa7XE
	sc/dNg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ycuf9n84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:57:30 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6vTCj021226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:57:29 GMT
Received: from [10.64.16.151] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 17 Nov
 2024 22:57:22 -0800
Message-ID: <0f5a1ce9-060b-44d3-b6f0-da88b26fc57d@quicinc.com>
Date: Mon, 18 Nov 2024 14:57:19 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] arm64: defconfig: Enable SX150X for QCS615 ride
 board
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten
	<marijn.suijten@somainline.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Krishna
 Manikandan" <quic_mkrishn@quicinc.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Catalin
 Marinas" <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Li Liu
	<quic_lliu6@quicinc.com>,
        Xiangxu Yin <quic_xiangxuy@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-9-2873eb6fb869@quicinc.com>
 <CAA8EJpok20-7HXJJbcJi8YZYCU68g_DGThR_ckjBEz0e+gGBSA@mail.gmail.com>
Content-Language: en-US
From: fange zhang <quic_fangez@quicinc.com>
In-Reply-To: <CAA8EJpok20-7HXJJbcJi8YZYCU68g_DGThR_ckjBEz0e+gGBSA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VOJNeQms_kWtpsHJqazuKTbSkYBfIOw2
X-Proofpoint-GUID: VOJNeQms_kWtpsHJqazuKTbSkYBfIOw2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 phishscore=0 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411180057



On 2024/11/13 20:21, Dmitry Baryshkov wrote:
> On Wed, 13 Nov 2024 at 13:53, Fange Zhang <quic_fangez@quicinc.com> wrote:
>>
>> From: Li Liu <quic_lliu6@quicinc.com>
>>
>> For the QCS615 ride board, enable the SX150X to activate the ANX7625
>> allowing the DSI to output to the mDP through the external bridge.
>> The ANX7625 relies on the SX150X chip to perform reset and HPD.
>>
>> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
>> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index c0b8482ac6ad7498487718ba01d11b1c95e7543d..599a339a19435efbee7a5ef80c093b0e8c65f7ff 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -631,6 +631,7 @@ CONFIG_PINCTRL_SM8350=y
>>   CONFIG_PINCTRL_SM8450=y
>>   CONFIG_PINCTRL_SM8550=y
>>   CONFIG_PINCTRL_SM8650=y
>> +CONFIG_PINCTRL_SX150X=y
> 
> Your commit message doesn't describe why it needs to be disabled as a
> built-in. You are trying to enable it for all defconfig users.
> Also the placement of the symbol is not correct. You've added it to
> the section with msm pinctrl drivers, while the chip has nothing to do
> with msm.
ok, will remove it from the patch series

> 
>>   CONFIG_PINCTRL_X1E80100=y
>>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>>   CONFIG_PINCTRL_LPASS_LPI=m
>>
>> --
>> 2.34.1
>>
> 
> 


