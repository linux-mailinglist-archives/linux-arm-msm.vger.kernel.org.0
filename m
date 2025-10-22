Return-Path: <linux-arm-msm+bounces-78287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5924EBFAC12
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 10:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D97284F7CAB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99C22FFF9C;
	Wed, 22 Oct 2025 08:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a933Yhqn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F1E2FFF84
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761120135; cv=none; b=AL8h1AwOsVcFk1RXUSsAcWBCd+oStBOV+0V17gfggIsoUt+hBeVMLBfFvvPbojR1iNoVowqTj2fGGu7G//ZTxJzjqHGnFGb3Sp+ZojETrYwAOAV5zQ9tgBQXM1y4nByenn4rb9TpcP7/ivhu4Zbiho79dQ2cxv/aI9973yjjhws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761120135; c=relaxed/simple;
	bh=RSN3cKeL/wrLTfUe/iXDZXDZWNlHU8sIpfbOMxyuaEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVAWmulrdkjOXKIGus53B5l5QhyAnE0x0Z5OVgeaMABc4MsYNymk8dcFM5AIX4dn/eywSLN3TCHDlM0y9Yt8dgQUCcOxlE9BPrsATKMB9ViDU/LarjgILvlbRTSu50cjLocxsw9/TLAfb/Y+5/mQL2RrAlvnxMGLA3DxpT3fV64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a933Yhqn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M390KS024200
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PrWXaHujYM83EP0v/kYGdvqS+OMzRONuhcXEsIZpib8=; b=a933Yhqncla2BaC7
	L9lRvvEr6BQynRuJh5NPCYWspxlHRnkPfv53Zp+fyH7Uk+RmYn7Zanrkftl7tfSr
	s39XL88omoVCmp0u9RqvUtg2Ki2O/AljEUN9lclP2n6uSvC5FDfZ/7fyGv10ohy4
	zalcxXIhxDPIUxg/DsbriYDyBWbU2JMae+d8p3tkVTDQXy1AZisu0HvLAdBEt5rF
	LwvKoa+8q1SMqGRot58so87dH7d+QCDBjh9ywt4+bdBg+b1+0NMfpwchkij8xZwm
	oXvjuCaW2adBDl18ch6g4F/nZFrMc+3sX9cW5JsfFQyA1NMX1jAdqYfP0opOw0+s
	uDJCHw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w83usd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:02:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27ee41e062cso83781695ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 01:02:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761120128; x=1761724928;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrWXaHujYM83EP0v/kYGdvqS+OMzRONuhcXEsIZpib8=;
        b=vh9cugl4NsPMYRTdN/2kIJEQl2/HERBJRsMWx6hnRFig27tab51z/wtMfrd84UhVAe
         OF53CfpFvYUrVexJ5W7Z9Ff5zz99mFg4ngrBHNkaj/Ht8cLO+Aon0s7OgiyJEeeFGSHP
         fHNjxHP4McmWcRosr8CxAzDWClZcRmH3bwj0VJISAbBXXV8dgLi1P+Epl7m3CjXTtD0g
         N0vmQncf9rUX0CYkyYqMd7LvPBBbeFoj0Lkcz5xWEd4apUUDZPCwe7LZwOc7qRACmDY3
         VbW0mWkl4NpuW8jpyt27C/IOC4sVvjcxUzj2XwPGXGlM/RHf4lOKh1OYModutPvpHc2y
         AFvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrAFaQTJDqe+ixHO09ypvtndY1M5WJIbVxOGe/NmUrsuS0cKPAwHKicLiE89NSmm7ePIv5dMdtG4hRxdd+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd1hIJ67zUeUg2tWVHDDzrP5ZeyIWo7iGBtkuSCvTCSxzQW/1Z
	HXz2ahZ+sBmqvzTlBbv/1yW9y4ZZ58UglCD4rIWrB3Ow5Buq/LC9beTnc34OU7vghh5SXaxanQp
	JqnNOJxNv8cUbCANewzi3gtvsunwHC50vkD5T5HIWcbabxnuWHxG/TDFGfEZh4QEiM1W/
X-Gm-Gg: ASbGncvOcBOfpijsoePbpNXHe4qtgvSwdVD+hkFB5FixfDuL51X01H5TLPCdqCdhC3m
	2MprUuxY7qJXHYFng/45joD8NBrUFwc6fzLN1+lCtEnUncg7qMasHQTDcfxnZJ8bJhSlwt9UvBD
	EozPrONGl+ho7erSIrGEgBy/I/z/Ro/BYRFtCJFW8cyFFv9dnNW2iZwW6ASoWoLaFLjig+sQsjf
	Ox0cnFll410wV/jhu+1Km3MIpD/UeJ3lxsGeIIvPs2vH9eEiHpAi1S7G7iN0GOPgrc7NSrvdkLi
	fHA+EKbjQZtd6NXmukezs8TCGaQd2U0GYopQZ7AwlrUD5xej3gGzgjJVIZWw0LxoadpdScjreZT
	QBFo+6SnX7qziEs4k8nkb47PekgHjBJnD70KL/zbMXbHwsOo8Cw==
X-Received: by 2002:a17:902:e5cf:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-290cb6619aemr257341565ad.52.1761120127769;
        Wed, 22 Oct 2025 01:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcRm1cmQAZ79KpbmBiXAz/1hTG8MAAUjPR7k1568+fHx4n3Z3tvlMw2nwNPvdqpf8/BIpXNw==
X-Received: by 2002:a17:902:e5cf:b0:269:b2e5:ee48 with SMTP id d9443c01a7336-290cb6619aemr257341145ad.52.1761120127228;
        Wed, 22 Oct 2025 01:02:07 -0700 (PDT)
Received: from [10.53.169.133] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29246ebcce8sm131876805ad.18.2025.10.22.01.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 01:02:06 -0700 (PDT)
Message-ID: <f7401703-e912-4d61-b206-f9f1de930092@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 16:02:05 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed
 resume
To: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Stefan Hajnoczi <stefanha@redhat.com>, Jens Axboe <axboe@kernel.dk>,
        linux-arm-msm@vger.kernel.org, virtualization@lists.linux.dev,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavan.kondeti@oss.qualcomm.com
References: <20251021-virtio_double_free-v1-1-4dd0cfd258f1@oss.qualcomm.com>
 <20251021085030-mutt-send-email-mst@kernel.org>
 <CACGkMEsU3+OWv=6mvQgP2iGL3Pe09=8PkTVA=2d9DPQ_SbTNSA@mail.gmail.com>
 <20251022014453-mutt-send-email-mst@kernel.org>
 <20251022030050-mutt-send-email-mst@kernel.org>
Content-Language: en-US
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
In-Reply-To: <20251022030050-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX4Qt0WVnmMP8o
 5dqW112yN0l001OVMzGteRURF/3UDceCRdle9mzdgkrDVqWcyUrAHpD0AYoReG+WwifeoTt6WcQ
 M4gpc4wDfupUUONdp86BV8irjRhmHFtxaOUFD2MC4wGj++q3VWKzkVzl7TrIDxcw8HbB2nAL87+
 tHKOVdUXjyKr7NISUZs+yUAv6NUdWp0ZxgJP9TgTGx2hXRVG0uKzBHtuQZqboePnK64h6FYr/Mo
 QHM3Z8kWgdklGNFEkB5T8xrcs7bU6/epYBhpB7spGfliYwIfbs9BFoTaN7+Q3oTi2qii0q7+63q
 PaDlGBUKdHUD/Ga2L8MeCoYQVCxTkOWVVlTkwWcqUN6K30ab4ci9sivE/Wl/I/YOQdH8uEXj0h6
 9DAKU/PprCG+63ZiLR0jd6o+hdSpBA==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f88f81 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=EF7p3n4rWrlDlfIrDsgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Q6zovKLr4psF0td4VB_bMyWVlDpH7-x5
X-Proofpoint-ORIG-GUID: Q6zovKLr4psF0td4VB_bMyWVlDpH7-x5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015



On 10/22/2025 3:01 PM, Michael S. Tsirkin wrote:
> On Wed, Oct 22, 2025 at 01:45:38AM -0400, Michael S. Tsirkin wrote:
>> On Wed, Oct 22, 2025 at 12:19:19PM +0800, Jason Wang wrote:
>>> On Tue, Oct 21, 2025 at 8:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>
>>>> On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
>>>>> The vblk->vqs releases during freeze. If resume fails before vblk->vqs
>>>>> is allocated, later freeze/remove may attempt to free vqs again.
>>>>> Set vblk->vqs to NULL after freeing to avoid double free.
>>>>>
>>>>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
>>>>> ---
>>>>> The patch fixes a double free issue that occurs in virtio_blk during
>>>>> freeze/resume.
>>>>> The issue is caused by:
>>>>> 1. During the first freeze, vblk->vqs is freed but pointer is not set to
>>>>>    NULL.
>>>>> 2. Virtio block device fails before vblk->vqs is allocated during resume.
>>>>> 3. During the next freeze, vblk->vqs gets freed again, causing the
>>>>>    double free crash.
>>>>
>>>> this part I don't get. if restore fails, how can freeze be called
>>>> again?
>>>
>>> For example, could it be triggered by the user?
>>>
>>> Thanks
>>
>> I don't know - were you able to trigger it? how?
> 
> Sorry I mean the submitter of course.
> 

Let me add more details:
Autosleep is enabled in this case. When the system wakes up from
suspend, it will call virtio_device_restore. The failure happens in the
virtio_device_restore function before vblk->vqs has been allocated. The
system still gets woken up after the failure happens. Since autosleep is
enabled and there is no wakelock being held, the system will try to
suspend again. Then virtio_device_freeze will be called and causes the
issue.

>>
>>>>
>>>>> ---
>>>>>  drivers/block/virtio_blk.c | 13 ++++++++++++-
>>>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>>>>> index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
>>>>> --- a/drivers/block/virtio_blk.c
>>>>> +++ b/drivers/block/virtio_blk.c
>>>>> @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
>>>>>  out:
>>>>>       kfree(vqs);
>>>>>       kfree(vqs_info);
>>>>> -     if (err)
>>>>> +     if (err) {
>>>>>               kfree(vblk->vqs);
>>>>> +             /*
>>>>> +              * Set to NULL to prevent freeing vqs again during freezing.
>>>>> +              */
>>>>> +             vblk->vqs = NULL;
>>>>> +     }
>>>>>       return err;
>>>>>  }
>>>>>
>>>>
>>>>> @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>>>>>
>>>>>       vdev->config->del_vqs(vdev);
>>>>>       kfree(vblk->vqs);
>>>>> +     /*
>>>>> +      * Set to NULL to prevent freeing vqs again after a failed vqs
>>>>> +      * allocation during resume. Note that kfree() already handles NULL
>>>>> +      * pointers safely.
>>>>> +      */
>>>>> +     vblk->vqs = NULL;
>>>>>
>>>>>       return 0;
>>>>>  }
>>>>>
>>>>> ---
>>>>> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
>>>>> change-id: 20250926-virtio_double_free-7ab880d82a17
>>>>>
>>>>> Best regards,
>>>>> --
>>>>> Cong Zhang <cong.zhang@oss.qualcomm.com>
>>>>
> 


