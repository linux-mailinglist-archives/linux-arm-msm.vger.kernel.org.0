Return-Path: <linux-arm-msm+bounces-80410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A446C34A2B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 10:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6FCA04F81EA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 08:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B292EC0AA;
	Wed,  5 Nov 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bg52srM7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="drY92I5w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728032EBDE5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762332968; cv=none; b=pIoGCzWKOAyKWbd9VGHns8SeVoezBTxxIkLxbEiwZm6CETLDtNiO20iAci6ImZlsVSnzRBOsu+VWXdeC3x/nCyzVRZm5Ib7ZEibwBMj32vONUEK6Mj9OaVevrVEhBW6Q2/Ls2bnbCihclQyG1Kx9xg2guSB5o6I5fu3LFkjwQqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762332968; c=relaxed/simple;
	bh=oJGJS4nXaQ61TXEogNa9taQo9bk8Fwfzwr2oTD4WwYM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QMQmDgOUmbcsntm7UMi9tH0vInMplJpS3RS+i0VU07K7s4FS0rRCxOn3sQQ0njUf+oeb4oatGpXjINJO6pBYzXmOfN8ugtzz5mxlfW60t14AjijdQs6y78DMuv/zf5dLAYswRvaGsy1Vk2OrgkD9cA0qmydbGLlADQC0HDy7nco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bg52srM7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=drY92I5w; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57uXMv159501
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 08:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+4r01cBcj0AKibi5Hc2qNneGYRhe8Tf+S2yS7RxAZTY=; b=bg52srM7OBz0Xfa1
	aJMvl8svOyOEtbuEnl8D69t0dknhlONY6LVll+Egfyqsl4LHKXYwWlZ4WiWeWh9z
	9xhp+/EKeX57LdQ7SG2mfRP4qvKTq/rmSfcOnfRYYvRvqoBp1UdtO1x9J3cSyItW
	gjph+ma26clSHCQXKGyt+qgt05nun/QcOERLWWVSQ1b7wwlIj5z8B1Xkttly3Nt6
	Rej1/W6yXYxdTiDSGUU187+Q1At4dRfgifTy6Fay1PzZKgqRrZJCgKOH2bz0wqND
	qKITDcgH6WUuSZTPe5IHeua4ovg7sCxds4l87Vef1isQxgJ0L+HQ2eUpFYXEOZ/1
	YbcaaA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt05na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 08:56:05 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340c0604e3dso3860361a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 00:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762332965; x=1762937765; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+4r01cBcj0AKibi5Hc2qNneGYRhe8Tf+S2yS7RxAZTY=;
        b=drY92I5wzxXT90YazT8M/Fs4zG5TnYKO17hMwO9DcaWKvktbPd/LyMo6IzC0ZeidGg
         9AqtyT0KnNH49Mped4/HDTjwWV/fW8kxkRD6f7+6cdCslhhMBZQg9ycvBvsf+Gf2VmBx
         tnsQmjebLFJIJShQVaV+u7QJJ42kJTC+bkDljz3OV3tt+v3OqSvT2AB6IM5f1vo6Ech4
         eTf3BNP/zHKQDvcGdlWn3yHBQHFFR6/yI+Ag+XGu2t/QVuuufgC6jdJlwV03FdaYVapm
         oGNRjpd4pWqGUxjJn4Vvc1IU0tbUVRiu/gy48T8O4xfnmJfKSup5+oGDWZQNtJmnHoje
         PRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762332965; x=1762937765;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+4r01cBcj0AKibi5Hc2qNneGYRhe8Tf+S2yS7RxAZTY=;
        b=q5cVmnfX2QItxLQG+BDQ9yQarxrG3Q4Cu4d3MFhlN92v4emO9mqCQdkO2xGYzA/8cd
         ORe+4YzLyRU/6Bo1hmPjsRwLUYAaS8wCFtk+UMFe1NL5JQuGIlaW90ZtEQSlmWNjrrad
         hyChHPEKxfy4DTlmt3pni1bZtZkA5z8omDinBdkiMOGK2hOWke9cqsmuPJd/Rn27GYE4
         fK5ghH2IhpnIcghsH13XV82poq6WrUQymJfhStXr8ig5Hw9++80WeW3aY0kt52agm0e9
         ZDrZdfNMfzD//CTx916l5wx3SeE4nJRXSeMe2gM0BoUTy71fU0SXSTpRLMIBatgnS9xM
         PSuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkaPMyn+YvuhDHrGuERyz/IzjsSPREUAlrJxVu6AzK7pJo1vGQPX+JyNgv/DQ6o5jxM+TunCM5ianB5w98@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1jmOL7ofB/gmPPt/fN/5oPYMaD7J8leNqUuN+l/qyWF7Lz47j
	iF62N8KxX46LEgO4OyQ/Mg04qdWP47ic3i9Vhyyc8JydTvF6O8wLneqJX8d8lL8kPJ1PZJMpD70
	Vi4zDgQrwH/DWg8wiitRPre92ivCmtDKYKQ+Iw5rV5aIylt2JasD/2DXt45S3NPhUuWfn
X-Gm-Gg: ASbGnctanThHX04Xld+gS40b5SyqZyp0/7dfUDyP9bIBD496wjTk1QyJ9Mmb91kFouW
	1o16jiOoz+0UVnpt3LBfne1N8aD9t6hRhSDOjQWQ33chXXxBh35VXVYKsb2z+9fTaTSLw6sP/el
	hdXQBAp+KwDWBndZg62vRCavCLYKzv9aCFAOXew3iIIKhOAAzzi7NcATfonpt+GWdsZMPZFC+66
	YV7kY05hzubZ428g+mTcNm7VfilBf/ZP9G0PT0vAf86kCA5BNe2p+ACH0r4O6wmOHTo4MlYSd4x
	gjR4zI2Y6PisSuLIf0ECGoP+NUF6rQvrG1drgCKOTVbl4Q2yJePdT0pztJ0KBED4d52bPSDcR5j
	jIGsFGJ4vFwcgA2VwSI06zbub3ousmLdvWcZmK8kjQ46DfYBAgQ==
X-Received: by 2002:a17:90b:3a05:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-341a6c49502mr3114065a91.14.1762332964793;
        Wed, 05 Nov 2025 00:56:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHwKiJ7zgSa+228im7zp+Q42NqbROs8wd+PnIwXJA8GHjOS9VLD4PkkXBCe8JYBWhPvt4X5LQ==
X-Received: by 2002:a17:90b:3a05:b0:340:b501:7b7d with SMTP id 98e67ed59e1d1-341a6c49502mr3114013a91.14.1762332964143;
        Wed, 05 Nov 2025 00:56:04 -0800 (PST)
Received: from [10.53.169.133] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417bcc031bsm3012089a91.2.2025.11.05.00.56.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 00:56:03 -0800 (PST)
Message-ID: <8910d20d-dc47-4a12-9e83-204174154663@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 16:56:01 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio_blk: NULL out vqs to avoid double free on failed
 resume
From: Cong Zhang <cong.zhang@oss.qualcomm.com>
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
 <f7401703-e912-4d61-b206-f9f1de930092@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <f7401703-e912-4d61-b206-f9f1de930092@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA2NSBTYWx0ZWRfX5VUxldDpi94+
 n7HsOHimDmpi31CEYMdMKKUZucOVMdPN/vhe0bL6E1H5f5MVnS2hTHyt+EZkpfIdfvZdtJD9hL5
 cgy0uLe5LIiWr5Cgxu5ZJZISicWuNUfAHYvr0SUGRecfAiklu995nwNr9vxP0rL3k1sa+42GhwA
 Yamsxts9yXWOHE7N7m7dm8stUSjiRXKi85t5FunH87wQKssX6kTUthsgBuizdQicguzUaA4L1WH
 OyTpbTwGBpnYYlTywAMHWBc3w+BAssqclnVIc6/dbZCfBSY8WdSfJFUV7bEAx1cfQ8PWvSI7Xbd
 5zFp7TmFKOv1VjnI8jVtw0gD226YyoeMMo+YpL7cEYkqRI6CZTNo7JUGUEMSD4IzYGTOQswtHU0
 Zm9cO7ymzxuTgh+6CFn8+JxYm8vGJg==
X-Proofpoint-GUID: K9X4EPLrK4IahNFnJ0-RstEWpQ4_Mkg2
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b1125 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=0_t0tbNFZAkfsDOXaUgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: K9X4EPLrK4IahNFnJ0-RstEWpQ4_Mkg2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050065



On 10/22/2025 4:02 PM, Cong Zhang wrote:
> 
> 
> On 10/22/2025 3:01 PM, Michael S. Tsirkin wrote:
>> On Wed, Oct 22, 2025 at 01:45:38AM -0400, Michael S. Tsirkin wrote:
>>> On Wed, Oct 22, 2025 at 12:19:19PM +0800, Jason Wang wrote:
>>>> On Tue, Oct 21, 2025 at 8:58 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>>>>>
>>>>> On Tue, Oct 21, 2025 at 07:07:56PM +0800, Cong Zhang wrote:
>>>>>> The vblk->vqs releases during freeze. If resume fails before vblk->vqs
>>>>>> is allocated, later freeze/remove may attempt to free vqs again.
>>>>>> Set vblk->vqs to NULL after freeing to avoid double free.
>>>>>>
>>>>>> Signed-off-by: Cong Zhang <cong.zhang@oss.qualcomm.com>
>>>>>> ---
>>>>>> The patch fixes a double free issue that occurs in virtio_blk during
>>>>>> freeze/resume.
>>>>>> The issue is caused by:
>>>>>> 1. During the first freeze, vblk->vqs is freed but pointer is not set to
>>>>>>    NULL.
>>>>>> 2. Virtio block device fails before vblk->vqs is allocated during resume.
>>>>>> 3. During the next freeze, vblk->vqs gets freed again, causing the
>>>>>>    double free crash.
>>>>>
>>>>> this part I don't get. if restore fails, how can freeze be called
>>>>> again?
>>>>
>>>> For example, could it be triggered by the user?
>>>>
>>>> Thanks
>>>
>>> I don't know - were you able to trigger it? how?
>>
>> Sorry I mean the submitter of course.
>>
> 
> Let me add more details:
> Autosleep is enabled in this case. When the system wakes up from
> suspend, it will call virtio_device_restore. The failure happens in the
> virtio_device_restore function before vblk->vqs has been allocated. The
> system still gets woken up after the failure happens. Since autosleep is
> enabled and there is no wakelock being held, the system will try to
> suspend again. Then virtio_device_freeze will be called and causes the
> issue.
> 

Gentle reminder.
Please let me know if you need any additional information.

>>>
>>>>>
>>>>>> ---
>>>>>>  drivers/block/virtio_blk.c | 13 ++++++++++++-
>>>>>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
>>>>>> index f061420dfb10c40b21765b173fab7046aa447506..746795066d7f56a01c9a9c0344d24f9fa06841eb 100644
>>>>>> --- a/drivers/block/virtio_blk.c
>>>>>> +++ b/drivers/block/virtio_blk.c
>>>>>> @@ -1026,8 +1026,13 @@ static int init_vq(struct virtio_blk *vblk)
>>>>>>  out:
>>>>>>       kfree(vqs);
>>>>>>       kfree(vqs_info);
>>>>>> -     if (err)
>>>>>> +     if (err) {
>>>>>>               kfree(vblk->vqs);
>>>>>> +             /*
>>>>>> +              * Set to NULL to prevent freeing vqs again during freezing.
>>>>>> +              */
>>>>>> +             vblk->vqs = NULL;
>>>>>> +     }
>>>>>>       return err;
>>>>>>  }
>>>>>>
>>>>>
>>>>>> @@ -1598,6 +1603,12 @@ static int virtblk_freeze_priv(struct virtio_device *vdev)
>>>>>>
>>>>>>       vdev->config->del_vqs(vdev);
>>>>>>       kfree(vblk->vqs);
>>>>>> +     /*
>>>>>> +      * Set to NULL to prevent freeing vqs again after a failed vqs
>>>>>> +      * allocation during resume. Note that kfree() already handles NULL
>>>>>> +      * pointers safely.
>>>>>> +      */
>>>>>> +     vblk->vqs = NULL;
>>>>>>
>>>>>>       return 0;
>>>>>>  }
>>>>>>
>>>>>> ---
>>>>>> base-commit: 8e2755d7779a95dd61d8997ebce33ff8b1efd3fb
>>>>>> change-id: 20250926-virtio_double_free-7ab880d82a17
>>>>>>
>>>>>> Best regards,
>>>>>> --
>>>>>> Cong Zhang <cong.zhang@oss.qualcomm.com>
>>>>>
>>
> 


