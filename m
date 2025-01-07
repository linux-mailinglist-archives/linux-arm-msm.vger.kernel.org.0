Return-Path: <linux-arm-msm+bounces-44072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0047EA036DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 05:12:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F05647A1DC8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 04:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C95F154C15;
	Tue,  7 Jan 2025 04:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="M6ZFGZli"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F1E1419A9;
	Tue,  7 Jan 2025 04:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736223133; cv=none; b=HJAYnBppAfWrRkvhTrQLWbmlom/KMKOp8+ZYaoKmLw8eSaFwfdkhTV1Rv/S30uvfNQIq7mg3yI+jpb3q65Tq3lCCJlRC+nGEy24bRQFulfcIcTEPmmjYdaIVkDVU5JnyjuBcSe/kGYtsI14T3tmH3XgBC91ULdJRK97UZm82E5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736223133; c=relaxed/simple;
	bh=WQb+Lg7oHUTCY7usnLhhZDRG4ybHokIAYO+8a0Ja+9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=SOZ43gt/XOmaQRup9Csm4pETnQlu8v0L07g7hBbohvx0v5bK/EeaVOIbIyem/3M6AHUOSAdkThu3d+9i5R1MMDvsyNk5tS8cux9jrQBcjiR/QMBwVAnk1m2VtZTXA2qb8HIeZYPE/h3hdVQJoXXdmacGReggJXZZcxvKej0Pex4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=M6ZFGZli; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 507402i2013939;
	Tue, 7 Jan 2025 04:12:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TEd9I9VSSshyxPbm36jCCoa1Sdl8qgvAkFMjILNPRVQ=; b=M6ZFGZli1u6Ljat7
	O8DAM8sl+/7iTJ1Ms2gff4TgVsW3XCYCjNtI1F2wQtd+iPPbQJ4kuWuM8orN+Jf+
	73hgUZV+JLm0hENDnbJMaP+Bw3viSD/gDdoZydTphsxIRHmtyik+cRJXY6zKLmAh
	r0wXF2XT81xo7VR/kXHVrttfXGi3C3Pvi54/bLEqUJucrf+e0zo3aQhOuSzr00qf
	YoS9PlVW/n7QzlPgbTIT3kv/n1YxUjk6h48G4LiFtDbfzq5Z7/9FoZ9R1UzglDij
	hw8cZ7Qls4qM82G3FiLa0FKPLZ7Kwy4QA8j52FwamZ4ZyUVxDJUxjKIOpXmqiQaP
	fKDAow==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 440vutg0nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 04:12:04 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5074C3G0030197
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 Jan 2025 04:12:03 GMT
Received: from [10.206.111.70] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 6 Jan 2025
 20:11:59 -0800
Message-ID: <26b3aee7-5729-447b-983a-cfa5951595ba@quicinc.com>
Date: Tue, 7 Jan 2025 09:41:56 +0530
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
 <39206687-6fb3-434f-b2ba-a028cf6f8ed3@quicinc.com>
 <D5KW7A8BZG6K.2L7FEV6SWRZ2D@fairphone.com>
Content-Language: en-US
From: Vedang Nagar <quic_vnagar@quicinc.com>
In-Reply-To: <D5KW7A8BZG6K.2L7FEV6SWRZ2D@fairphone.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Znx-Bi8r9-yHM2DrBI7uVvAB1FNqSazo
X-Proofpoint-ORIG-GUID: Znx-Bi8r9-yHM2DrBI7uVvAB1FNqSazo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 mlxlogscore=571 phishscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501070030

Hi Luca,

On 11/13/2024 1:33 PM, Luca Weiss wrote:
> Hi Vedang,
> 
> On Wed Nov 13, 2024 at 8:01 AM CET, Vedang Nagar wrote:
>> Hi Luca,
>> On 11/12/2024 8:49 PM, Luca Weiss wrote:
>>> Hi Vedang,
>>>
>>> On Tue Nov 12, 2024 at 3:39 PM CET, Vedang Nagar wrote:
>>>>
>>>>
>>>> On 11/12/2024 6:43 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 12 Nov 2024 at 08:17, Vedang Nagar <quic_vnagar@quicinc.com> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 10/7/2024 1:20 AM, Dmitry Baryshkov wrote:
>>>>>>> On Fri, Oct 04, 2024 at 04:22:31PM GMT, Vedang Nagar wrote:
>>>>>>>> Enable the venus node on Qualcomm sc7280. It was made disabled
>>>>>>>> earlier to avoid bootup crash, which is fixed now with [1].
>>>>>>>
>>>>>>> NAK, there might be other reasons to keep venus disabled, like the lack
>>>>>>> of the vendor-signed firmware for the particular device.
>>>>>> Can you pls elaborate more on this? Any device with sc7280 SOC can use
>>>>>> venus.mbn which is already present in linux-firmware git.
>>>>>
>>>>> Can it though if the device is fused to use vendor keys and to check
>>>>> the trust chain?
>>>> Yes, infact the existing ones are signed and works with trustzone authentication.
>>>
>>> No, the venus firmware from linux-firmware does not work on a device
>>> with secure boot on, like the (QCM6490) Fairphone 5 smartphone.
>> Are you saying even after applying this [1] you are seeing the same ?
>>
>> [1]
>> https://patchwork.kernel.org/project/linux-media/patch/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
> 
> That patch has been in mainline since v6.9 and my tree is newer, so yes.
> 
> See e.g. Qualcomm doc KBA-161204232438 for some details.
> 
> Regards
> Luca
> 
>>>
>>> $ rm /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn
>>> $ cp /lib/firmware/qcom/vpu-2.0/venus.mbn.zst /lib/firmware/qcom/qcm6490/fairphone5/venus.mbn.zst
>>>
>>> leads to
>>>
>>> [   10.848191] qcom-venus aa00000.video-codec: Adding to iommu group 13
>>> [   10.863062] qcom-venus aa00000.video-codec: non legacy binding
>>> [   10.909555] qcom-venus aa00000.video-codec: error -22 initializing firmware qcom/qcm6490/fairphone5/venus.mbn
>>> [   10.910099] qcom-venus aa00000.video-codec: fail to load video firmware
>>> [   10.910849] qcom-venus aa00000.video-codec: probe with driver qcom-venus failed with error -22
>>>
We have seen similar issue with older firmware present in
linux-firmware git due to a bug in singing of the firmware image.

This issue seems to be resolved with below change:
aeede7afb7a186b62f9e1f959c33fd5f2dea0f7a: qcom: update venus firmware file for SC7280

Can you pls give a try with latest firmware if you still see the same issue?
We tried internally and do not see any such failure now.

Regards,
Vedang Nagar

>>> It's the same with e.g. adsp firmware, modem firmware, etc.
>>>
>>> With secure boot off, yes, the hardware will load any firmware
>>> regardless of the signature.
>>>
>>> Regards
>>> Luca
>>>
>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Vedang Nagar
>>>>>>>
>>>>>>>>
>>>>>>>> [1]
>>>>>>>> https://lore.kernel.org/linux-media/20231201-sc7280-venus-pas-v3-2-bc132dc5fc30@fairphone.com/
>>>>>>>>
>>>>>>>> Signed-off-by: Vedang Nagar <quic_vnagar@quicinc.com>
>>>>>>>> ---
>>>>>>>>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 2 --
>>>>>>>>  1 file changed, 2 deletions(-)
>>>>>>>
>>>>>
>>>>>
>>>>>
>>>


