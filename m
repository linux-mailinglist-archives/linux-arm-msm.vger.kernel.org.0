Return-Path: <linux-arm-msm+bounces-46021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A291A1AF26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 04:50:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA64A16921E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Jan 2025 03:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7A2B1D63C7;
	Fri, 24 Jan 2025 03:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MdY5fsvG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA67A29A5;
	Fri, 24 Jan 2025 03:50:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737690626; cv=none; b=OvBpRrZaKFyeneiI2SR2Irtn64S9HkbnVINOmdTIWtOVb9RZNA+3IfEbXjsf1Cw6jj5lD0PK7h0o1MadyTbCjUkumrQYx+rPSQR4cdJ9b0UCUdkyhmkK5Ir1d8uqrPqT1iNzvq/PWAd831XlM2aB+6uQWfWXjSyi7AFX3kD88lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737690626; c=relaxed/simple;
	bh=jz/DAF/DOdi7AEjDgAtxUvzHzBqmVOCK9WQo8aVsiCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=jM9y97xo2OKKQevW67aRTu07vBCOXHfc/rxO8qZgSp38h3O0ktHCWjtXVn9NqZ8sPyou9w1yQyDciZw7Z+VZmF+ASDD/nBrbg4696pjf68VR61ykSFRZ1liK44yE/XlFTv6GqEupRA4MLkyL/UxflR4MIEo/1ukHetXNgHyB/nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MdY5fsvG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NK1bwe025017;
	Fri, 24 Jan 2025 03:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UsOSr255hsze50L8MIH369hi7fncpzVLWcWcM0n4BCw=; b=MdY5fsvGqrkk09id
	qu/JAKNKUkXaA0NcuZeQAfZOgUP3XntcdHRl1MgsOM4NCCmNmHgpYL/kQCSZDq0b
	PPuA2I6W7/d+RhU7iO/83Vj3yuGw3uF9pt9G5Ej8YdMiOpkEmroMRPD/7SvPoSS1
	/urid3pcxbBU/hVSaLwMW4vGkQ1ZVWS4Ys5MT0Ln5W1X/mK7Aw9fnUpqEb5J62zY
	N/lqWGNqqBjAHaGW0+OgSkf8DGARWGJ5tlDqaSv3pgDMCbY2Otb/Akz8C4rsjN1z
	3+C3K7efCPj0ZX3Fec1uj89pQLyfprpQatJ/kbIXIsUwvpFy8HRNWXz/yXrDlHiE
	R5jFZQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bvengru6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:50:07 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O3o6bk007904
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:50:06 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 Jan
 2025 19:50:02 -0800
Message-ID: <de0a80f0-f6b8-4213-8687-7111e6ad7aba@quicinc.com>
Date: Fri, 24 Jan 2025 11:50:00 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] Support Multi-frequency scale for UFS
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
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
 <d4881156-a003-41fe-824e-4c29e279fbb7@linaro.org>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <d4881156-a003-41fe-824e-4c29e279fbb7@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LdKnsDhDlDeLqdLLFYQQD0jKSqhLeu_e
X-Proofpoint-ORIG-GUID: LdKnsDhDlDeLqdLLFYQQD0jKSqhLeu_e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240025



On 1/24/2025 4:12 AM, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 22/01/2025 11:02, Ziqi Chen wrote:
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
> 
> Thanks, could you be more precise on how you tested this feature ? how 
> did you exercise the gear changes and check that is cales correctly ?
> 
> Thanks,
> Neil
> 

Hi Neil,

I made a Debugging patch that track the freq and gear in UFS devfreq and 
clkscale path. I do data transfer from userspace and print out devfreq 
target freq , clkscale recommended freq , final clkscale freq and gear 
value of before and after clkscale.

For example, we can get such logs on SM8550 as below:

[    5.424720] [DEBUG]ufshcd_devfreq_target: target freq = 75000000
[    5.509541] [DEBUG]ufshcd_devfreq_target: recommended freq = 75000000
[    5.525463] [DEBUG]ufshcd_devfreq_target: final freq = 75000000
[    5.525464] [DEBUG]ufshcd_devfreq_target: scaling DOWN from freq 
300000000 to freq 75000000
[    5.525468] [DEBUG]ufshcd_devfreq_scale: freq 75000000 mapped to gear 
1 , caller: ufshcd_devfreq_target+0x298/0x3e4
[    5.525531] [DEBUG]ufshcd_devfreq_scale: scaling DOWN gear from 4 -> 1
[    5.728018] [DEBUG]ufshcd_devfreq_target: updated target freq to 75000000


.. G1 -> G4...

[  261.068843] [DEBUG]ufshcd_devfreq_target: target freq = 300000000
[  261.075242] [DEBUG]ufshcd_devfreq_target: recommended freq = 300000000
[  261.082055] [DEBUG]ufshcd_devfreq_target: final freq = 300000000
[  261.088280] [DEBUG]ufshcd_devfreq_target: scaling UP from freq 
75000000 to freq 300000000
[  261.096743] ufshcd-qcom 1d84000.ufshc: 
ufshcd_is_devfreq_scaling_required: req_freq= 300000000, target_freq = 
75000000
[  261.107814] [DEBUG]ufshcd_devfreq_scale: freq 300000000 mapped to 
gear 4 , caller: ufshcd_devfreq_target+0x298/0x3e4
[  261.126922] [DEBUG]ufshcd_devfreq_scale: scaling UP gear from 1 -> 4
[  261.134810] [DEBUG]ufshcd_devfreq_target: updated target freq to 
300000000
[  261.196460] [DEBUG]ufshcd_devfreq_target: target freq = 244755397
[  261.210039] [DEBUG]ufshcd_devfreq_target: recommended freq = 300000000
[  261.216900] [DEBUG]ufshcd_devfreq_target: final freq = 300000000
[  261.223135] [DEBUG]ufshcd_devfreq_target: scaling DOWN from freq 
300000000 to freq 300000000
[  261.231872] ufshcd-qcom 1d84000.ufshc: 
ufshcd_is_devfreq_scaling_required: req_freq= 300000000, target_freq = 
300000000
[  261.243017] [DEBUG]ufshcd_devfreq_target: scaling DOWN from freq 
300000000 to freq 300000000 not required


.. G4 -> G2...

[  455.604414] [DEBUG]ufshcd_devfreq_target: target freq = 149736604
[  455.617895] [DEBUG]ufshcd_devfreq_target: recommended freq = 150000000
[  455.624702] [DEBUG]ufshcd_devfreq_target: final freq = 150000000
[  455.630936] [DEBUG]ufshcd_devfreq_target: scaling DOWN from freq 
300000000 to freq 150000000
[  455.639656] ufshcd-qcom 1d84000.ufshc: 
ufshcd_is_devfreq_scaling_required: req_freq= 150000000, target_freq = 
300000000
[  455.650838] [DEBUG]ufshcd_devfreq_scale: freq 150000000 mapped to 
gear 2 , caller: ufshcd_devfreq_target+0x298/0x3e4
[  455.661809] [DEBUG]ufshcd_devfreq_scale: scaling DOWN gear from 4 -> 2
[  455.670529] [DEBUG]ufshcd_devfreq_target: updated target freq to 
150000000


...G2 -> G1

[  548.484492] [DEBUG]ufshcd_devfreq_target: target freq = 75000000
[  548.497957] [DEBUG]ufshcd_devfreq_target: recommended freq = 75000000
[  548.504801] [DEBUG]ufshcd_devfreq_target: final freq = 75000000
[  548.510949] [DEBUG]ufshcd_devfreq_target: scaling DOWN from freq 
150000000 to freq 75000000
[  548.519590] ufshcd-qcom 1d84000.ufshc: 
ufshcd_is_devfreq_scaling_required: req_freq= 75000000, target_freq = 
150000000
[  548.530725] [DEBUG]ufshcd_devfreq_scale: freq 75000000 mapped to gear 
1 , caller: ufshcd_devfreq_target+0x298/0x3e4
[  548.552850] [DEBUG]ufshcd_devfreq_scale: scaling DOWN gear from 2 -> 1


-Ziqi

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
>> Can Guo (6):
>>    scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
>>    scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
>>    scsi: ufs: core: Add a vops to map clock frequency to gear speed
>>    scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
>>    scsi: ufs: core: Enable multi-level gear scaling
>>    scsi: ufs: core: Toggle Write Booster during clock scaling base on
>>      gear speed
>>
>> Ziqi Chen (2):
>>    scsi: ufs: core: Check if scaling up is required when disable clkscale
>>    ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes
>>
>>   Documentation/ABI/testing/sysfs-driver-ufs | 31 ++++++++++
>>   drivers/ufs/core/ufshcd-priv.h             | 17 +++++-
>>   drivers/ufs/core/ufshcd.c                  | 71 ++++++++++++++++------
>>   drivers/ufs/host/ufs-mediatek.c            |  1 +
>>   drivers/ufs/host/ufs-qcom.c                | 66 +++++++++++++++-----
>>   include/ufs/ufshcd.h                       |  8 ++-
>>   6 files changed, 159 insertions(+), 35 deletions(-)
>>
> 

