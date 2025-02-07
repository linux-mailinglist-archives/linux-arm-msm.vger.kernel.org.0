Return-Path: <linux-arm-msm+bounces-47071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D43DAA2B9BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 04:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D912F7A3337
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 03:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C08F17AE1D;
	Fri,  7 Feb 2025 03:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="KL/1s30B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57104EB51;
	Fri,  7 Feb 2025 03:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738898972; cv=none; b=WF9XciL4WaIV6jhGekVmvBn68cpxxGYzZEru7IxLaYoC8pCiPGgFqJL+2/oTEbYKSruOSSZpNQH4e34nvVnRNwWDvSJPO2lGC0fW67HRFAf1y6EBGcFFhfma4y5I92jb/ehZBIjT13Drif7bWimudzxPlR30dfDcb1wLXdnJ9Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738898972; c=relaxed/simple;
	bh=wQYy0MLLhPN8ZhFKgW+wijJFfu1s5KWChEuZHpzXf3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=tzaPuFT8CWUEB1KB9afrnD/jWW5FmePiDpc7sGowxCPFibrs4Cdz+hZcz/IYukheVbw5RJw7VTr9TZuZnfI7FU7nAtEAFoP/unKg6I+eMZdNu27Q95UoEReUHiuriaoX2jrFxHP3k5wKBkQJipRttb8sciWtc8oMzlUydWeFPj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=KL/1s30B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172Iu7r003636;
	Fri, 7 Feb 2025 03:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8FLQmQ0c3Vy/txmDNUrwkn1oUQN3GmmHcI49m6qoCV4=; b=KL/1s30BqeE/e0KQ
	TAjUlUp4RS2BRaRAJGnvXiWSv/4CYks/oeCOjHYQ5rajidjkDM850aIzRocOF8yp
	9pB5sv3g8fkM13PwwtfOoFUXxHS5Z2Tx8gKQM5DhKdwR2+dKaAEoNhABtfaRL7eH
	7J70TWlRxz8VppzDd498JBcYgZ1NllwINYTqdyyLNTrV3rPjM5hcTjxhrmL60fyz
	RmT2g/2t/nvQ5F7+ibzaRemPZtZ9NE7nrU+fsk1grirnkxS7ryqKr6xrBj8ZDbEg
	zvBbUzSRKohSJJtLjkOTDraMrL/0Coa83bT2qJS5gjIgRSdmEkYdshg0rKPa/YR0
	w/FsAA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n99e84hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Feb 2025 03:29:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5173TBVV014274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Feb 2025 03:29:11 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 6 Feb 2025
 19:29:07 -0800
Message-ID: <46aa5bbe-a7dd-4561-9d4a-0367779f0680@quicinc.com>
Date: Fri, 7 Feb 2025 11:29:04 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] Support Multi-frequency scale for UFS
To: <neil.armstrong@linaro.org>, <quic_cang@quicinc.com>, <bvanassche@acm.org>,
        <mani@kernel.org>, <beanhuo@micron.com>, <avri.altman@wdc.com>,
        <junwoo80.lee@samsung.com>, <martin.petersen@oracle.com>,
        <quic_nguyenb@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        "open list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-kernel@vger.kernel.org>,
        "moderated
 list:ARM/Mediatek SoC support:Keyword:mediatek"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-mediatek@lists.infradead.org>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
 <63578f71-e5f5-482a-98a7-779053b1caf7@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <63578f71-e5f5-482a-98a7-779053b1caf7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 5Ubfs8AnUQPDeBCS3H14rcbvplXejdNd
X-Proofpoint-GUID: 5Ubfs8AnUQPDeBCS3H14rcbvplXejdNd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070024



On 2/6/2025 5:53 PM, neil.armstrong@linaro.org wrote:
> On 03/02/2025 09:11, Ziqi Chen wrote:
>> With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
>> plans. However, the gear speed is only toggled between min and max during
>> clock scaling. Enable multi-level gear scaling by mapping clock 
>> frequencies
>> to gear speeds, so that when devfreq scales clock frequencies we can put
>> the UFS link at the appropraite gear speeds accordingly.
>>
>> This series has been tested on below platforms -
>> sm8550 mtp + UFS3.1
>> SM8650 MTP + UFS3.1
>> SM8750 MTP + UFS4.0
>>
>> v1 -> v2:
>> 1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for 
>> UFS on SM8650"
>> 2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs 
>> addributes"
>> 3. Modify commit message for  "scsi: ufs: core: Pass target_freq to 
>> clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk 
>> scale pre and post change"
>> 4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post 
>> change", use common Macro HZ_PER_MHZ in function 
>> ufs_qcom_set_core_clk_ctrl()
>> 5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", 
>> print out freq and gear info as debugging message
>> 6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the 
>> lable "do_pmc" to "config_pwr_mode"
>> 7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize 
>> the local variables "wb_en" as "false"
>>
>> v2 -> v3:
>> 1. Change 'vops' to 'vop' in all commit message
>> 2. keep the indentation consistent for clk_scale_notify() definition.
>> 3. In "scsi: ufs: core: Add a vop to map clock frequency to gear 
>> speed", "scsi: ufs: qcom: Implement the freq_to_gear_speed() vop"
>>     and "scsi: ufs: core: Enable multi-level gear scaling", remove the 
>> parameter 'gear' and use it as return result in function 
>> freq_to_gear_speed()
>> 4. In "scsi: ufs: qcom: Implement the freq_to_gear_speed(), removed 
>> the variable 'ret' in function ufs_qcom_freq_to_gear_speed()
>> 5. In "scsi: ufs: core: Enable multi-level gear scaling", use 
>> assignment instead memcpy() in function ufshcd_scale_gear()
>> 6. Improve the grammar of attributes' descriptions in “ABI: sysfs- 
>> driver-ufs: Add missing UFS sysfs attributes”
>> 7. Typo fixed for some commit messages.
>>
>> Can Guo (6):
>>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
>>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>>    scsi: ufs: core: Add a vop to map clock frequency to gear speed
>>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
>>    scsi: ufs: core: Enable multi-level gear scaling
>>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>>      gear speed
>>
>> Ziqi Chen (2):
>>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>>    ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes
>>
>>   Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++
>>   drivers/ufs/core/ufshcd-priv.h             | 15 ++++-
>>   drivers/ufs/core/ufshcd.c                  | 76 +++++++++++++++++-----
>>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>>   drivers/ufs/host/ufs-qcom.c                | 62 ++++++++++++++----
>>   include/ufs/ufshcd.h                       |  9 ++-
>>   6 files changed, 160 insertions(+), 36 deletions(-)
>>
> 
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> 
> I added some traces and played with devfreq max_freq while copying data
> from the UFS disk, no issues observed.
> 
> Neil

Thank Neil for your test result.

-Ziqi


