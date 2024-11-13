Return-Path: <linux-arm-msm+bounces-37736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5779C699B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 08:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A7BD1283EF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 07:01:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2111A7081F;
	Wed, 13 Nov 2024 07:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ituE1g7E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3CA230996;
	Wed, 13 Nov 2024 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731481293; cv=none; b=iIkCRWMSRcqdI1ea1ygFQnJXH+cVPu7riVmHWFRC3gEwg+ssNhks1+B8QB8o3aoqa2d/bS71j2u/UVydYEBq+UNO1MYapWCsjoOmQZsnzsgJTHJnYGsKIgZ1c2XGyp/qaoednGd3j+emRENFx8TstWLGTSIgCk5MQp59aTwvCQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731481293; c=relaxed/simple;
	bh=OvoSxzFMjVXNWYaaBPZgty5xhAMgNhyNp01kIt1x0h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Cxf4h8vbkQ8s3s0h/EDwnMp78bLqvseh95U7qhh0WAWYb0D4ZJqC4wRrsFDppaG9uJI57pNAHNhfYsbwan4u67uZsWLxTlzavmyzdrtyCQZKNBbkb+ecfZhnStxLrn5cRX1J117uto2spQTINoGH5AIPVkXwmTQfz2hswGO/OYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ituE1g7E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACMRV8W014618;
	Wed, 13 Nov 2024 07:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xl+qy1frg7iRHr/ziTCUZNvFk33aKR2/mfAVqlVLUHU=; b=ituE1g7EBOlpTFX6
	dg6ruD5kD20UY79UJJYErruIB8Pin4tM772gzCFbgrcfnkjJYOR3BNpSoeSoHJ79
	CZORsemxtv/xdv9ha1lHH3R/S6Cfy8dmUmWkIFxwziqpuvNMCh67cyHY2B5Z9oBo
	zFY9E0Mx1AxqRoF7zqtd9NackE3M68XCGLHSAcip1MVYp5HSVpcvu8Yg0YRlcB4y
	j+PVXLlZ/wVcXT2Dvwxe4+jBO0CZof/6PLaRhZBCLmOkOvRet+7O+YQouQNIkv50
	4F7QW9Xrrb82jFGRm7cp+bwHWWJWSnHbbWPayMSqCEX6bzNo4BP8O5l2wZ8+9ieW
	+ycPug==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v47y35cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:01:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD71LNU006382
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:01:21 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 12 Nov
 2024 23:01:17 -0800
Message-ID: <39206687-6fb3-434f-b2ba-a028cf6f8ed3@quicinc.com>
Date: Wed, 13 Nov 2024 12:31:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc7280: enable venus node
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: <cros-qcom-dts-watchers@chromium.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vikash Garodia
 (QUIC)" <quic_vgarodia@quicinc.com>
References: <20241004-venus_sc7280-v1-1-4d7d8fd7e95b@quicinc.com>
 <kezh3lmysij56g2tjwwuas5r26ro5i777yxxitsdcjeg7zp67v@oknrdbkzison>
 <78e6ff6b-efe1-496c-a1fb-c9a0a4aba2d2@quicinc.com>
 <CAA8EJpqqZL7xybcbJMsbTQB+ht5-A+ocNs+Sq30j=v1zM3JL9g@mail.gmail.com>
 <fbba794a-ba04-4790-b5e9-b4df3cba35b2@quicinc.com>
 <D5KAUZHYJHFS.1NXF5SVWYL03G@fairphone.com>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <D5KAUZHYJHFS.1NXF5SVWYL03G@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: b-dCiHkLTLHLX5ozQ9EC3OQzwfqLeP6F
X-Proofpoint-GUID: b-dCiHkLTLHLX5ozQ9EC3OQzwfqLeP6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=513 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411130061

Hi Luca,
On 11/12/2024 8:49 PM, Luca Weiss wrote:
> Hi Vedang,
> 
> On Tue Nov 12, 2024 at 3:39 PM CET, Vedang Nagar wrote:
>>
>>
>> On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
>>> On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com> wrote:
>>>>
>>>>
>>>>
>>>> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
>>>>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
>>>>>> Enable the venus node on Qualcomm sc7280. It was made disabled
>>>>>> earlier to avoid bootup crash, which is fixed now with [1].
>>>>>
>>>>> NAK, there might be other reasons to keep venus disabled, like the lack
>>>>> of the vendor-signed firmware for the particular device.
>>>> Can you pls elaborate more on this? Any device with sc7280 SOC can use
>>>> venus.mbn which is already present in linux-firmware git.
>>>
>>> Can it though if the device is fused to use vendor keys and to check
>>> the trust chain?
>> Yes, infact the existing ones are signed and works with trustzone authentication.
> 
> No, the venus firmware from linux-firmware does not work on a device
> with secure boot on, like the (QCM6490) Fairphone 5 smartphone.
Are you saying even after applying this [1] you are seeing the same ?

[1]
https://patchwork.kernel.org/project/linux-media/patch/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> 
> $ rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
> $ cp /lib/firmware/qcom/vpu-2.0/venus.mbn.zst /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn.zst
> 
> leads to
> 
> [   10.848191] qcom-venus aa00000.video-codec: Adding to iommu group 13
> [   10.863062] qcom-venus aa00000.video-codec: non legacy binding
> [   10.909555] qcom-venus aa00000.video-codec: error -22 initializing firmware qcom/qcm6490/fairphone5/venus.mbn
> [   10.910099] qcom-venus aa00000.video-codec: fail to load video firmware
> [   10.910849] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -22
> 
> It's the same with e.g. adsp firmware, modem firmware, etc.
> 
> With secure boot off, yes, the hardware will load any firmware
> regardless of the signature.
> 
> Regards
> Luca
> 
>>>
>>>>
>>>> Regards,
>>>> Vedang Nagar
>>>>>
>>>>>>
>>>>>> [1]
>>>>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
>>>>>>
>>>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>>>>>> ---
>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>>>>>>  1 file changed, 2 deletions(-)
>>>>>
>>>
>>>
>>>
> 

