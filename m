Return-Path: <linux-arm-msm+bounces-66952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 104EFB1468C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 05:03:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 291A4189DF66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Jul 2025 03:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 702F220551C;
	Tue, 29 Jul 2025 03:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BeOOw+Nh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3291B3925;
	Tue, 29 Jul 2025 03:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758191; cv=none; b=E9i1psZUlvGJJxgDwvWrRlQXlsGLM/dN5scz/Jk0FzYNwQf+8flSpfI0OdRejY02aOz+24JbB59p4eh4gsw9rY4a8GsTrBMStAx+OaW0s6HwdNNkR/DGGIsYRSypDAOOEK8HSysqK/x3k5Hu3Q9JnyAcC8hdz3x+YSnKD7Lt4QQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758191; c=relaxed/simple;
	bh=sp7iLHloZjdg7rwEqiCwYlJKLtp/Z0ijU0agxJPsu24=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oqi5jO3PU7+xKoOPG/HI8AikJNan4hOBLypHFbmCrG2bpQjN7b5W9ANezFReZuI44itQNMFC8VIaIuXBUWkBUXhj8RwpSjSe+NRpsin5RtkDfiGfvSSuMbM3s/TL/P4pCzq3vyZl/aX7vo7KQM/n8iBjrVDxiI/JXPPI/WlbFJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BeOOw+Nh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SLGXGX027612;
	Tue, 29 Jul 2025 03:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KNm0SjZMV0U4DCtXxFzwow3nn9+wL8wF7qiKjSXa9Q0=; b=BeOOw+Nhty0uz9Db
	ojvT0tXuni8RhQJyHmNCMYvT0O/mQqJ9qmxbVeH9MtywOp1hQ8x+W0wffTvbmUB0
	Cgxv/QgHpM9c3kCQL8AtI4zP7qgms0dSZ8BwjtwtI5zCw0dM5Vng7zqjClA8cOnb
	z/w+iKHmM3wva2VBS3nDcSIc5BEtgRTdv95v018VCJAWKBIh5ztbZMM+KszwEapE
	OObkdnr/cGjp8VGU+Evm8LBm+0FF4o0gBQiLQEKtv4tHDDh0l/lOme31mzw3wPCj
	pNZCMJOf5QTRjErhW4rj3NLAd8exylXdSQeK6jr07QmblTX/yltYvFPz+MB9y6YF
	oh+6HA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4860enusms-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 03:02:51 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56T32p6i010375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 03:02:51 GMT
Received: from [10.239.155.136] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 28 Jul
 2025 20:02:46 -0700
Message-ID: <673e1960-f911-451d-ab18-3dc30abddd79@quicinc.com>
Date: Tue, 29 Jul 2025 11:02:43 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] scsi: ufs: core: Don't perform UFS clkscale if host
 asyn scan in progress
To: =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
        "beanhuo@micron.com" <beanhuo@micron.com>,
        "avri.altman@wdc.com"
	<avri.altman@wdc.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "quic_cang@quicinc.com" <quic_cang@quicinc.com>,
        "quic_nguyenb@quicinc.com" <quic_nguyenb@quicinc.com>,
        "quic_nitirawa@quicinc.com" <quic_nitirawa@quicinc.com>,
        "bvanassche@acm.org"
	<bvanassche@acm.org>,
        "luca.weiss@fairphone.com" <luca.weiss@fairphone.com>,
        "konrad.dybcio@oss.qualcomm.com" <konrad.dybcio@oss.qualcomm.com>,
        "martin.petersen@oracle.com" <martin.petersen@oracle.com>,
        "quic_rampraka@quicinc.com" <quic_rampraka@quicinc.com>,
        "junwoo80.lee@samsung.com" <junwoo80.lee@samsung.com>,
        "mani@kernel.org"
	<mani@kernel.org>
CC: "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        =?UTF-8?B?VHplLW5hbiBXdSAo5ZCz5r6k5Y2XKQ==?= <Tze-nan.Wu@mediatek.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>,
        "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
        "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20250522081233.2358565-1-quic_ziqichen@quicinc.com>
 <5f3911ffd2c09b6d86300c3905e9c760698df069.camel@mediatek.com>
 <1989e794-6539-4875-9e87-518da0715083@acm.org>
 <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
Content-Language: en-US
From: Ziqi Chen <quic_ziqichen@quicinc.com>
In-Reply-To: <10b41d77c287393d4f6e50e712c3713839cb6a8c.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: STDA2jS3gUkIovD3RfH9BVov-SEhutH1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMSBTYWx0ZWRfX+lysptxrXbyW
 fFVlq/IJ412xp85PYhekCv7qBzu7zjHfn8cp87KEMJ9ke0g67gNDbRzNz6djFQOULgB56LCKY9B
 P9vaEfG0nEWEkgkabBkU9Xbr3cb/U5kuXYsPuxy1LzI5m3kx+S8E3t9gLkw31xR9pQDCOXDD8nH
 0M7EMiNYNw+vgJkcSns3LR0Cp1NiKTRlE73DkqdZbM2JFAntLM8vbVUQuVYYMRH1NN5d7b/KDEK
 QMsjrbYdSWU6YY+i+8DqScRe/KQzS3BnGoKoXH4J8oZNRsZoWIeb7pj9J4tinZNvlJ7M7HhqM6O
 PU1O+uihlRoCYOQHyByR6hMB0Dr3DLBe1aKRHG7Ur0GNo4696dQXdoA0C7euxuLRgX859DXTnpC
 JsuHe/edDCWaXcPChFr4k8hM9sMb7//qWhggJtqbQ4+OMeXcHYnrvxqqP0dt0cfGlerO5V2W
X-Authority-Analysis: v=2.4 cv=DIWP4zNb c=1 sm=1 tr=0 ts=688839db cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8 a=I3z-T-4cxT6kGIpvpuIA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: STDA2jS3gUkIovD3RfH9BVov-SEhutH1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 mlxscore=0 mlxlogscore=843
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290021


On 7/28/2025 2:34 PM, Peter Wang (王信友) wrote:
> On Fri, 2025-07-25 at 07:54 -0700, Bart Van Assche wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
>>
>> On 7/25/25 2:13 AM, Peter Wang (王信友) wrote:
>>> Could consider luns_avail instead mutex?
>>
>> That would be wrong. I think it is essential that scan_mutex is used
>> in
>> this patch. Additionally, the lock inversion is between devfreq->lock
>> and (c->notifiers)->rwsem so it seems unlikely to me that Ziqi's
>> patch
>> is the patch that introduced the reported lock inversion.
>>
>> Bart.
> 
> 
> Hi Bart,
> 
> This is a complex situation involving six locks, which may result in
> a circular locking dependency.
> Let me explain how a new circular locking dependency is formed:
> 
> CPU0: take &(c->notifiers)->rwsem#2, wait &devfreq->lock
> CPU1: take &devfreq->lock, wait &shost->scan_mutex,  <= Lock introduced
> by this patch
> CPU2: take &shost->scan_mutex, wait &q->sysfs_lock
> CPU3: take &q->sysfs_lock, wait cpu_hotplug_lock


Hi Peter,

I Don't think the dependence between CPU2 and CPU3 would happen.

CPU2:
__mutex_lock_common+0x1dc/0x371c  -> (Waiting &q->sysfs_lock)
mutex_lock_nested+0x2c/0x38
blk_mq_realloc_hw_ctxs+0x94/0x9cc
blk_mq_init_allocated_queue+0x31c/0x1020
blk_mq_alloc_queue+0x130/0x214
scsi_alloc_sdev+0x708/0xad4
scsi_probe_and_add_lun+0x20c/0x27b4

CPU3:
pus_read_lock+0x54/0x1e8 -> ( Waiting cpu_hotplug_lock)
__cpuhp_state_add_instance+0x24/0x54
blk_mq_alloc_and_init_hctx+0x940/0xbec
blk_mq_realloc_hw_ctxs+0x290/0x9cc  -> (holding &q->sysfs_lock)
blk_mq_init_allocated_queue+0x31c/0x1020
__blk_mq_alloc_disk+0x138/0x2b0
loop_add+0x2ac/0x840
loop_init+0xe8/0x10c

As my understanding, on single sdev , alloc_disk() and alloc_queue()
is synchronous. On multi sdev , they hold different &q->sysfs_lock
as they would be allocated different request_queue.

In addition to above , if you check the latest version, the function
blk_mq_realloc_hw_ctxs has been changed many times recently. It doesn't
hold &q->sysfs_lock any longer.

https://lore.kernel.org/all/20250304102551.2533767-5-nilay@linux.ibm.com/

-> use &q->elevator_lock instead of  &q->sysfs_lock.

https://lore.kernel.org/all/20250403105402.1334206-1-ming.lei@redhat.com/

-> Don't use &q->elevator_lock in blk_mq_init_allocated_queue context.


> CPU4: take cpu_hotplug_lock, wait subsys mutex#2  > CPU5: take subsys mutex#2, wait &(c->notifiers)->rwsem#2  <= Hold By
> CPU0
> 
> ufshcd_add_lus triggers ufshcd_devfreq_init.
> This means that clock scaling can be performed while scanning LUNs.
> However, this patch adds another lock to prevent clock scaling
> before the LUN scan is complete. This is a paradoxical situation.
> If we cannnot do clock scaling before the LUN scan is complete,
> then why we start clock scaling before it?
> 
> If we don’t put it in luns_avail (start clock scaling after LUNs
> scan complete), do you have a better suggestion
> for where to initialize clock scaling (ufshcd_devfreq_init)?

I have also considered this. you can see my old version of this patch
(patch V2), I moved ufshcd_devfreq_init() out of ufshcd_add_lus().
But due to ufshcd_add_lus() is async, even through move it out , we 
still can not ensure clock scaling be triggered after all lUs probed.

BRs
Ziqi
  >
> Thanks.
> Peter
> 


