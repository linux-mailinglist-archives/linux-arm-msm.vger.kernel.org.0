Return-Path: <linux-arm-msm+bounces-27146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD9F93E589
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 15:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2C50B2192E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jul 2024 13:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47F11B86C2;
	Sun, 28 Jul 2024 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="fgeUYvKj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED49F38396
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jul 2024 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722174058; cv=none; b=IK+0n9Lplbkh8xwkog6tGiID4V5J108ZEZpwDjSPv+TliCGcJxKT5SUkvI7IH+hmqOywd7lY/K4N0+mcrTeYcJ1fXAyvbmkzoQ0y2w4xbeAfzKw60juq//EZNpKZ/x9bf8oe5IS4b+S58ROQRIcQt6bVfRELwu79ypzUiUlcXZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722174058; c=relaxed/simple;
	bh=qQRUW6Vi3t/sLxUhqvlcmtzeAFbV14FvlLcpvdrkbSI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:CC:References:
	 In-Reply-To:Content-Type; b=QrcbU2uWiLCry0ksXvMzAXqxLYrVcSWSZCSl7mcDrsX7nyuJ0o82OSG60DrpAfOP83t3E5oOFC3Xve9U5BLMMk0xUwd5w+AsjvPWPSG+j5hUShdBZ8NDmiWgvPsjHEVyMOUJkTX5RLJZNUID2WUq1k5wUEnpIVn6YWdPO366iDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=fgeUYvKj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46S8xAJs031924;
	Sun, 28 Jul 2024 13:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PtM198zXdH2Rn0jOAgmlbOza0bJ7Hm22KDjZXWZGj60=; b=fgeUYvKjbQEpEnxB
	uxxg1Sm3dGBke0IJKjoWL//RIfmsTsYQXBCJUthwWWqpTzTWWIZGS/1xOC5+YtI0
	H8uCnIIj8B9Fug7eX/8hPYP5mUZiQtunHL63snXFF2PrRtmE5Uawk54nLWzK1cEG
	B/EUDr8IJf2sdG2k28nw6sxU4CSb41kS4AZEGtafsgbb+7moA9Dn4rdr5hNoEuVd
	g0hQVgOWrge9DwiCABjkjlAz272BGyJ0Rvjc6IglddmmzkH0Uyf5C/BSvThvP9Wu
	BR83JMu+yIkj3jZ/UUAHiHq4iaB3/9NEItXUS+oVVXvGLbZLH56K59+V2oMWkp2o
	DFho/w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40mt2khua4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:40:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46SDejQA018894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Jul 2024 13:40:45 GMT
Received: from [10.216.18.81] (10.80.80.8) by nasanex01c.na.qualcomm.com
 (10.45.79.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sun, 28 Jul
 2024 06:40:42 -0700
Message-ID: <06d3a928-694c-4775-a5c4-3887bbf6eef9@quicinc.com>
Date: Sun, 28 Jul 2024 19:10:41 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gokul Sriram P <quic_gokulsri@quicinc.com>
Subject: Re: [PATCH 2/6] bus: mhi: add support to allocate rddm memory during
 crash time
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_viswanat@quicinc.com>,
        <quic_gokulsri@quiconc.com>
References: <20240718061344.575653-1-quic_gokulsri@quicinc.com>
 <20240718061344.575653-3-quic_gokulsri@quicinc.com>
 <fe20dad8-d419-79f2-92b5-0154b45eb73e@quicinc.com>
Content-Language: en-US
In-Reply-To: <fe20dad8-d419-79f2-92b5-0154b45eb73e@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GAU_DFanDhpfstIyTtmMvvOP-kCIl1jr
X-Proofpoint-GUID: GAU_DFanDhpfstIyTtmMvvOP-kCIl1jr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-28_10,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407280100


On 7/18/2024 9:52 PM, Jeffrey Hugo wrote:
> On 7/18/2024 12:13 AM, Gokul Sriram Palanisamy wrote:
>> From: Ram Kumar D <quic_ramd@quicinc.com>
>>
>> Currently, MHI bus pre-allocates the RDDM buffer for crash dump
>> collection during MHI power up.
>>
>> To avoid carving out memory for RDDM buffers even if it is unutilized,
>> add support to allocate memory at runtime during the RDDM download
>> after target crash.
>>
>> This feature can be controlled by the client driver registering the MHI
>> controller by setting the rddm_prealloc flag to false in mhi_cntrl.
>> By default rddm_prealloc is true, retaining the existing behaviour.
>>
>> By default, rddm_seg_len will be same as seg_len. The client driver
>> can override the mhi_cntrl->rddm_seg_len.
>>
>> Signed-off-by: Ram Kumar D <quic_ramd@quicinc.com>
>> Co-developed-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
>> Signed-off-by: Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>
>> ---
>>   drivers/bus/mhi/host/boot.c     | 149 +++++++++++++++++++++++++++-----
>>   drivers/bus/mhi/host/init.c     |  19 ++--
>>   drivers/bus/mhi/host/internal.h |  11 ++-
>>   drivers/bus/mhi/host/main.c     |   4 +-
>>   drivers/bus/mhi/host/pm.c       |   2 +-
>>   include/linux/mhi.h             |   2 +
>
> NACK.  None of this gets used, making it dead code.
I didn't get it. Do you mean to say "mhi_cntrl->rddm_prealloc = true"  
by default, so its dead code?
>
>>   6 files changed, 156 insertions(+), 31 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
>> index ca842facf820..1a918e340424 100644
>> --- a/drivers/bus/mhi/host/boot.c
>> +++ b/drivers/bus/mhi/host/boot.c
>> @@ -35,6 +35,16 @@ int mhi_rddm_prepare(struct mhi_controller 
>> *mhi_cntrl,
>>           bhi_vec->size = mhi_buf->len;
>>       }
>>   +    if (!mhi_cntrl->rddm_prealloc) {
>> +        mhi_buf->dma_addr = dma_map_single(mhi_cntrl->cntrl_dev,
>> +                           mhi_buf->buf, mhi_buf->len,
...
>> @@ -312,21 +367,31 @@ void mhi_free_bhie_table(struct mhi_controller 
>> *mhi_cntrl,
>>     int mhi_alloc_bhie_table(struct mhi_controller *mhi_cntrl,
>>                struct image_info **image_info,
>> -             size_t alloc_size)
>> +             size_t alloc_size, enum image_type img_type)
>>   {
>>       size_t seg_size = mhi_cntrl->seg_len;
>> -    int segments = DIV_ROUND_UP(alloc_size, seg_size) + 1;
>> +    int segments;
>>       int i;
>>       struct image_info *img_info;
>>       struct mhi_buf *mhi_buf;
>> +    /* Masked __GFP_DIRECT_RECLAIM flag for non-interrupt context
>> +     * to avoid rcu context sleep issue in kmalloc during kernel panic
>> +     */
>
> Incorrect comment style.
>
Will correct this.


> Also, why would RDDM be relevant to a Linux kernel panic?  This makes 
> me suspect a lot is wrong with this patch.
>
When mhi device crashed, kernel also could be in panic, so during panic, 
its necessary to collect RDDM. This state is already supported in mhi 
driver.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/bus/mhi/host/boot.c?h=v6.10#n163

...

>> +            /* Vector table is the last entry */
>> +            if (i == segments - 1) {
>> +                mhi_buf->buf = kzalloc(PAGE_ALIGN(vec_size),
>> +                               gfp);
>> +                if (!mhi_buf->buf)
>> +                    goto error_alloc_segment;
>> +
>> +                /* Vector table entry will be dma_mapped during
>> +                 * rddm prepare with DMA_TO_DEVICE and unmapped
>> +                 * once the target completes the RDDM XFER.
>
> Incorrect comment style
>
will correct this.

Regards,

Gokul

>> +                 */
>> +                continue;
>> +            }
>> +            mhi_buf->buf = kmalloc(vec_size, gfp);
>> +            if (!mhi_buf->buf)
>> +                goto error_alloc_segment;
>> +

