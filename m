Return-Path: <linux-arm-msm+bounces-117058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C0vmMZ4oTGpbhAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117058-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:13:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C5715E9E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 00:13:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=leLpuzmy;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117058-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117058-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CCB283008D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 22:13:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62950414A16;
	Mon,  6 Jul 2026 22:13:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67483F54AE
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 22:13:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783376026; cv=none; b=Pif7IirA+QUoHkjiYTmaUpH6SPPupLnJuVZSrnsLK1aE5aL/1aFMB4mqSBO+0OQH6ub5gBxbBh5rvrT/FJH+W1mjjyUkfaKuJFzmo7blWu49BNWW4dj3R5ukHD0x6dgt9MPMloSDtBd4jRGTya3BDvUBW8ehRJruay8EBc+8HoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783376026; c=relaxed/simple;
	bh=m3kaKDuOinnzWNHwerx5pFFY+Eflp1o8yKhTqlHb8xw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sBQyeaVNBEWfFAxJxHmt/il0dFqEvQZ2U19Ad2foV22uWUo2q+s8Ukx0KPb1I3hmxMoaaFOlYmCMmUbZU3Cy+Z2vF5AphcdaSbg2sYeNCxWUWXF6Z0J+J3caAJnCJ6zDi53Y2dl5s4LWw51QCeLC9LkEwwNB4ozB1tOENRZzCnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=leLpuzmy; arc=none smtp.client-ip=209.85.221.42
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so1555813f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 15:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783376023; x=1783980823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=leLpuzmy1MCQFfJQdZjSGo15S981y1FEu5PVYg8YXgkUIoQ/7LepkVujXJJoQEDxQ3
         kU/hB7Jt8HtgcK2tnysM6bJnBKPyeJGjGTLqtl+PTliQ9XruvHi/h45L58ISLcY2zwR5
         fOQ/DsVFFiuyTcVqC2zTT3kBu6GdXFayg0Em4vaPCUhgxUmg2FdjCwPR5WLbb+GU9MAe
         QPBzP8wNGQLhrCbkN40ju3KgLgD1Sh7uCkzYo7wF+59QVm7EbIqFA8MGJ89j3mrvx30W
         fUyjMyPhJ59Lov7ghR0dwlP+DfwtwKanbQDUdyY0DurTEa1dgHaxmRcnQEY3V4NHDZIY
         xCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783376023; x=1783980823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3VUxjcvyG7o7DixEmYl5pZcfD8TvxQHqFhtXA36U/44=;
        b=WPp0o4TJFodH4eRFgpivZ3XQTEJs2MD/pA3Zwe0AsOLy5g4JRs1n75TqS1pT8RBPIh
         51poyt6OgcASWOSEMONpildkxhiEtOcKicp3dAOOLv3edYn8ql5+U1vOEyprgQVMgwp4
         ezXECzx7CpmprDSeH533qnhxJ1AYzj4jQSdgQlK7USrunzI0qnJDK+Q+PKX8ddAJnvSp
         UAj2XZY3fi4/bJ4KmTZnWgjUzZ8ZEHlj6bN+TwwJXQ1EM+4h3FK1zHcOngRJJS/YqXpW
         TDfi5ItpbiaWqYogickyFrPOKYuKy8D4vU5oqdE/fM47DEYi9aKPcxBAgBKaWNUppOF5
         WRFg==
X-Forwarded-Encrypted: i=1; AHgh+RqDG9Z1hBW1ujvT+nAtKb/baEU8Ax4WUYWayBMLSLQcTCo4YekkZ1nfpYjiEjVRIQ4iQHDH1pUEaNwX40VR@vger.kernel.org
X-Gm-Message-State: AOJu0YwFrvHojcc8s6xHF624WipDqOzLUoYifjeSorZ4ZZ3M+aS83ciO
	9MKiF3Lq1Lc/b857UMPadZyZp0wB+GMgFuWzDx+IRrII3wCnP6d4kPQ=
X-Gm-Gg: AfdE7cl+y9Ia/dKVSLhrOymmzFLSnR9bn2pjY2cKFOM+TAkpIbaBTCXNPcXiZ/Tkbkh
	P0F2fvZkqwjQayHH2Dyvkp2IezEV1W+pVXHRV/TrnUakdMGmRuDBzy23KrPdahQSFeYYLTMTJAK
	0zs6jBa83SJT7UFy5m2IoKXJ0HNMjLNdcsdI3ccTDv3tEjabZCTjLfJto0qrsFXxhvdwPrNSCby
	nS+n2IgKqnksfKT2Q1OVJRDbNCrwPYF6IwRSNSfUU0n7AkKXft8r9l1Tha+OiKFhX3Lp/U2uHoo
	t+eEeeXI2ApTLgm9JziyOviRxkdGTgW3VFiWBWP7sx2ptMBUJE0G2XQww2R8iXusuw7a9Y1AygE
	CS9Q02gZIk1zvmYhMNZqjrqbyDVEgIbvbOIEr/1hxTyoF1yfv+5jPlEQWXHbVuIStRxGkRDOCGK
	M9jR8em+YKsW8UFA8DqTALXrdNL2wnwVXzGVKwVJdDvmbLjj7YSTQTA7QzmafvQvraBiq9Zw==
X-Received: by 2002:a5d:45ce:0:b0:476:c622:d41f with SMTP id ffacd0b85a97d-47de66dd5e9mr1597139f8f.47.1783376022918;
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm26722332f8f.19.2026.07.06.15.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 15:13:42 -0700 (PDT)
Message-ID: <ad91c7ec-83db-402b-bec3-3821dbc607f8@gmail.com>
Date: Tue, 7 Jul 2026 00:13:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
 <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
 <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
 <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <2a556ca0-d276-4c56-a44e-9d8b92a3af6b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117058-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akhilpo@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,arm.com,8bytes.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,linux.intel.com,suse.de];
	RCPT_COUNT_TWELVE(0.00)[28];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[annamaniscalco2000@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 641C5715E9E

On 7/6/26 11:56 PM, Akhil P Oommen wrote:
> On 7/6/2026 4:37 PM, Anna Maniscalco wrote:
>> On 7/6/26 10:44 AM, Konrad Dybcio wrote:
>>> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>>>> Program all the register needed to start up LPAC and send initialization
>>>> sequence.
>>>>
>>>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>>>
>>>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>>>> ---
>>> I believe some/all of these writes need to be guarded by if (has_lpac),
>>> as many GPUs lack these registers and there may be side effects on
>>> others
>> That's correct yeah. I'm not sure what has_lpac should be though.
>>
>> Something we add to catalog? Or checking if it is a gen that has LPAC?
> We can introduce a new QUIRK (ADRENO_QUIRK_LPAC?).
>
>>>
>>> [...]
>>>
>>>>            a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>>>> -                              sizeof(u32) * gpu->nr_rings,
>>>> +                              sizeof(u32) * (gpu->nr_rings + !!gpu-
>>>>> lpac_rb),
>>> Should we rename nr_rings to something like nr_XXX_rings
>>> where XXX is some uarch-generic (i.e. not SQE because we also
>>> support pre-a6xx) name for the main number cruncher?
>> Qualcom calls it GC so nr_gc_rings perhaps?
> How about nr_gfx_rings as those rings can handle graphics workload?
That could be more intuitive yeah
>
> -Akhil.
>
>>> Konrad
>>
>> Best regards,


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


