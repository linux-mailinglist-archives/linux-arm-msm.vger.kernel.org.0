Return-Path: <linux-arm-msm+bounces-55765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CA65AA9D2E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 22:24:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 621FA7B42C1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 20:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D728A221DA4;
	Fri, 25 Apr 2025 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="QgoWR/5G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6D022068B;
	Fri, 25 Apr 2025 20:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612635; cv=none; b=kg/vk3SL3nZfvQmSrjNXyjLP3sblcs+5QNDkE5LgYE0M06Leu0SmGfFtO5IsGSme7I0H63MinDcssjcj4ul5yJz9WYm5UZZWfKl5aBdIZZWVdK1Uai2dkZmLOcdJd86L1cylUhEZfsE3Hh2ymVVcBk9JGbVFGVHSQV/lqoyGm5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612635; c=relaxed/simple;
	bh=fFcoNC3wwJ0Lu5h30CTNGVUIXvy6TKiZTNXR8Bhuzls=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=d8a4Na6sCC691goh0ULUQ3hweN0tcRFUjYoqfxjUkJjEsvU1K7v3f51V2qCceYPgIjCpau9gCFs6ZL4H5W9Hn7SDIzIfYlUj4gMgiq9RhdOf0hvPi+7cpM6O5MeOVjThErlbfyHW9QUtcbYBm41iANk/AjF2uBfjDBB8hBDGULc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=QgoWR/5G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJuSZ024795;
	Fri, 25 Apr 2025 20:23:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/KDwDEpdnUNXRKrqruKzxT8foB1gE1Od/isNWuMdQt4=; b=QgoWR/5Gsg3wamjI
	c5bhzpaYD4wbByWq7WwPw3I6Nd2Kk8MsXRZ7/CB4+Mix1peWzRUo/TV2KraFyx5t
	gJ7C3wH4t3OPBJIsTzC2kUpfvlmlxqhI+/ElSbt7PdwW3D8BtUDdPgU5sHh8h1Sm
	abafLHHf9O2zmRtXQZVz60qN1Mb6mcYxkKbenqBKqQ7Ht6ud4WIyOcdJVhKV0967
	XO7l8fGCHnxtKeMHvIwS8QqtBp2kcbqjfECXb2FxzHuTFNscKr7YNaibbt3p64JI
	oP4lXMoklvz6fKIjzENY6NihJPrZFbwBHnb14rTut3r4sHmnbo5zKvP/RISCWi5f
	0jtFWA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0t35f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 20:23:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53PKN2P8007707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 20:23:02 GMT
Received: from [10.216.35.110] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 25 Apr
 2025 13:22:56 -0700
Message-ID: <c95c2750-0431-42de-b881-d139d8697d0e@quicinc.com>
Date: Sat, 26 Apr 2025 01:52:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/3] scsi: ufs: qcom: Add support to disable UFS LPM
 Feature
To: Rob Herring <robh@kernel.org>
CC: <alim.akhtar@samsung.com>, <avri.altman@wdc.com>, <bvanassche@acm.org>,
        <krzk+dt@kernel.org>, <mani@kernel.org>, <conor+dt@kernel.org>,
        <James.Bottomley@hansenpartnership.com>, <martin.petersen@oracle.com>,
        <beanhuo@micron.com>, <peter.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
References: <20250417124645.24456-1-quic_nitirawa@quicinc.com>
 <20250417124645.24456-4-quic_nitirawa@quicinc.com>
 <20250422124546.GB896279-robh@kernel.org>
 <06c6c892-c597-4d1f-9d28-52455d6471f9@quicinc.com>
 <20250423135617.GA227946-robh@kernel.org>
Content-Language: en-US
From: Nitin Rawat <quic_nitirawa@quicinc.com>
In-Reply-To: <20250423135617.GA227946-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pWmrqGJDax6wB5I_8t4HiPwV4eeTKIF6
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680bef27 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=JAHMj9Iui1wunJY2B10A:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pWmrqGJDax6wB5I_8t4HiPwV4eeTKIF6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0NiBTYWx0ZWRfX23ofCbnAqL4N WQdHyWamX3ZiYeon8PkiwjHc7p62GDOXrDmyFU6hwKpsz9uCnae3ikSA0pRNYZlwj6lecF56wGV p+vk2HA9diGZ0hYldU3wsuzcQ5uHeaYT0HzepTX7DVdxnaw//UAhh0rWB9nadUTXD47GpkH/ZyX
 ecw6qWBG5gt4C8EWAc0v9o0aOs/PPQDcKcGAFM0jA/oN03QMPW1u7qy3ZDNsp7i4LNcrw7e28z7 pjIB1VYwQ4k+ArPnzZPaHQfr6nZbDv8ozSFgsBZ74jtYgie+IVDTnkxHcffApFccrz2BLjwWJTJ 12N5cTpcTpYAq1aOZMYOf2QMwH2qUvFg9aiATZamnS601DybHHDAyYD+dHMBVjjuRpfrUCp17rB
 jKrRVsZg7SG5Lq4Bf3nL/CsHNbLCI75rHLhq56cn/Rs9npL2g+2B7RhFZFImsVTrVkTGhMYt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250146



On 4/23/2025 7:26 PM, Rob Herring wrote:
> On Wed, Apr 23, 2025 at 01:14:27AM +0530, Nitin Rawat wrote:
>>
>>
>> On 4/22/2025 6:15 PM, Rob Herring wrote:
>>> On Thu, Apr 17, 2025 at 06:16:45PM +0530, Nitin Rawat wrote:
>>>> There are emulation FPGA platforms or other platforms where UFS low
>>>> power mode is either unsupported or power efficiency is not a critical
>>>> requirement.
>>>>
>>>> Disable all low power mode UFS feature based on the "disable-lpm" device
>>>> tree property parsed in platform driver.
>>>>
>>>> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
>>>> ---
>>>>    drivers/ufs/host/ufs-qcom.c | 15 ++++++++-------
>>>>    1 file changed, 8 insertions(+), 7 deletions(-)
>>>>
>>>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>>>> index 1b37449fbffc..1024edf36b68 100644
>>>> --- a/drivers/ufs/host/ufs-qcom.c
>>>> +++ b/drivers/ufs/host/ufs-qcom.c
>>>> @@ -1014,13 +1014,14 @@ static void ufs_qcom_set_host_caps(struct ufs_hba *hba)
>>>>
>>>>    static void ufs_qcom_set_caps(struct ufs_hba *hba)
>>>>    {
>>>> -	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>>>> -	hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
>>>> -	hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>>>> -	hba->caps |= UFSHCD_CAP_WB_EN;
>>>> -	hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>>>> -	hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>>>> -
>>>> +	if (!hba->disable_lpm) {
>>>> +		hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
>>>> +		hba->caps |= UFSHCD_CAP_CLK_SCALING | UFSHCD_CAP_WB_WITH_CLK_SCALING;
>>>> +		hba->caps |= UFSHCD_CAP_AUTO_BKOPS_SUSPEND;
>>>> +		hba->caps |= UFSHCD_CAP_WB_EN;
>>>> +		hba->caps |= UFSHCD_CAP_AGGR_POWER_COLLAPSE;
>>>> +		hba->caps |= UFSHCD_CAP_RPM_AUTOSUSPEND;
>>>> +	}
>>>
>>> Doesn't RuntimePM already have userspace controls? And that's a Linux
>>> feature that shouldn't really be controlled by DT. I think this property
>>> should still to things defined by the UFS spec.
>>
>> Hi Rob,
>> Yes userspace has runtime PM control but by the time UFS driver probes
>> completes and userspace is up, there are chances runtime PM may get kicked
>> in.
> 
> That sounds like a problem more than 1 device would have...

Yes, Rob, since there's a possibility that runtime suspend might be 
triggered for some devices before probe completes and userspace is up, 
IMO it's better to disable the runtime PM capability during 
initialization based on the device tree for specific FPGA platforms that 
don't support LPM.

What's your opinion on this?"

Regards,
Nitin



> 
> Rob


