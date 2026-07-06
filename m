Return-Path: <linux-arm-msm+bounces-116757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id alF/NrmOS2r2VQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:17:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9F170FBCC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 13:17:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pe9Ac8NI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116757-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116757-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7F61B302BA09
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 11:07:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B13053F44F7;
	Mon,  6 Jul 2026 11:07:43 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293343EDAB3
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 11:07:42 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783336063; cv=none; b=WIQgkABwZPnPsGXkDWat4m4GLFfraRRbWx/yUpazsfjviXyHCtClf9eJaXdBUj0TtTnusUQPDNYfetqOo9+2sg0VerJWhNXGOuaDUr3iWkCrTUFUd2QMIpLi9QaiRairEy8gHu46XJ5If5XzCPxVaMFzI3XqjdoabGVx4JthOpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783336063; c=relaxed/simple;
	bh=Pb7Xc1kKgr/AtADErH7EMWnxZPWuIpL20gPg2uLqnAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euMjzkxl0jSgRziEFlzOhCgMImyjEMWPL2jErmWoXugkbodFxgxgsV69kogV2YLcM/Fu68me4+TQo0NJaOmFIzvxym9kPSw0AC+LCb/RFcDfZt3AU0hP8gZAvhRZbDm6n169yv20Y1rrbaRq0Z0wGDSmNd0tnSnJebZRO01BVyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pe9Ac8NI; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so29223935e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783336060; x=1783940860; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=pe9Ac8NIqGiPpeC9sFton1Q67L/6R1VAiAoK5n/+/gQKQPMabOHcOpEueYGw34Vm0X
         1TSE97ST3V+7+Y4ga525HjMrBsf1Ajg97RURYOe17bY1YBJPSc4zpcCIaX4prMq12Q4F
         7M9v+F1W37SXN9N8P/ot0D4eUU0xVZGtjd1GX5aOg7NroOopIFZBFMjJ6r6m/aEZ0yHB
         2z+Jdn3Hylq4EzbVMDUWOJNC9AscxuFDmagxQb1GqRIl3lRWlh39t0uCR9UMvIZLMqDA
         sVyMvaeSPUimgnqrNkPJf+yx9ECDkEVteGotj3VkHc8653gyMPlwuFs2eMtoNsfSxiGM
         BTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783336060; x=1783940860;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hwdEJkuxK+8pOC6TCcezbBHIneZ4lflSArjit6m0NnA=;
        b=S0LdyixPG0gtl71BRXa3xOgoPRwaw8yHTeZPFAxBSBwcV2iOy0w8pa4U8j1suHKf8+
         vC34B7dPcpMuOqWWJL314U9FW0Cc+Y7w10Wps89l7Z2PjvMT2VKmeuCqR3Dq1TNGggkm
         aESWl4X9pbdJ6h614Kbciby66bSDNdgkRrm4vu9PeQAvEKrQiCuHJX3ivF3IfB04fw2A
         nw17zrDAEpJ4+CjXHNMiBvepiDkougbxMpWpqm8l3N/wZIJLq7/oP60CD/8+3lgpJVaN
         o6/pJVxa+ZqiJYmVhfbfxUDiLww9Od2BtGDP4tAOQLxjlryWaYW68fMCr+iY5uG1QIBD
         GAvg==
X-Forwarded-Encrypted: i=1; AHgh+Royb2l25J6iPVTo0qgmzriTjmjRG0VBcS0Q3Gm3TFyDcoNRd/MQy2lnFu1luyI3mhIpbeT3BOCgQ2Kx4ZC/@vger.kernel.org
X-Gm-Message-State: AOJu0YynX93PhC9gls+wWtMV8jkyFUxQcg4wGazQHGEXv2P6ivK+G++c
	rUMv1/yvnm4uFkW99cIKbopoj0/tZFnHDRPagGK4LqXOvoW74XFN8c0=
X-Gm-Gg: AfdE7ckVMit8R+if8qezCcTsR1pNtr0VH0+t7E7mT5dtTI6NaUcaPOHyIyPaFeAKM4v
	Y1/yv66//ElMnEGTzuZH2A0m82E1Gd0A1AvhxlEWzu3ya0ckfXOlfEgf0HyKIEd/jCFifs0sNh/
	FXFS26hp1DjT3KLxw6cr9iEtku9KwsqcUO+o35K1GiSS1B4/8SbaXw1zUQORcZWvlx+mjNCigZG
	wbtXsTp2aREnNz0OmgUWKn5u9rC6dNqr0qWHRLxWgbSjhTlaalh8BIZSEaj0KZ/amcFWQDljdKK
	xnSzMhGZ22EUxmuBdI9YLIU0xePrwo7OFfDZcrZVHGFkVri/k/zKFlwsLbeeM0UjkUyhzU7u3hl
	Xb98Z4tcqKqkRHGb0ueH1529Dfe10aGqp49UT2i1g+DnThIxnV/czP77eNrqQI5E+a7eNZBII+v
	ujeGQUGhsg4CXdL7AfBgHwzym1rg/U81kZI/fuCvm2qAwE3abe029nQp8zt/mS+4PXs7gE0Q==
X-Received: by 2002:a05:600c:c16f:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493d52ac417mr90419125e9.5.1783336060307;
        Mon, 06 Jul 2026 04:07:40 -0700 (PDT)
Received: from ?IPV6:2001:b07:2ec:601d:4b26:1672:75c7:805a? ([2001:b07:2ec:601d:4b26:1672:75c7:805a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm463102745e9.13.2026.07.06.04.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 04:07:39 -0700 (PDT)
Message-ID: <64a919ab-8b36-45fe-8da8-5eaaf4d55359@gmail.com>
Date: Mon, 6 Jul 2026 13:07:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
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
Content-Language: en-US
From: Anna Maniscalco <anna.maniscalco2000@gmail.com>
In-Reply-To: <93b78299-866f-4a3c-9423-a990d9a7d4cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116757-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:iommu@lists.linux.dev,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC9F170FBCC

On 7/6/26 10:44 AM, Konrad Dybcio wrote:
> On 7/5/26 9:13 PM, Anna Maniscalco wrote:
>> Program all the register needed to start up LPAC and send initialization
>> sequence.
>>
>> Additionally, now that the LPAC ring is live, make the code aware of it.
>>
>> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
>> ---
> I believe some/all of these writes need to be guarded by if (has_lpac),
> as many GPUs lack these registers and there may be side effects on
> others

That's correct yeah. I'm not sure what has_lpac should be though.

Something we add to catalog? Or checking if it is a gen that has LPAC?

>
>
> [...]
>
>>   		a6xx_gpu->shadow = msm_gem_kernel_new(gpu->dev,
>> -						      sizeof(u32) * gpu->nr_rings,
>> +						      sizeof(u32) * (gpu->nr_rings + !!gpu->lpac_rb),
> Should we rename nr_rings to something like nr_XXX_rings
> where XXX is some uarch-generic (i.e. not SQE because we also
> support pre-a6xx) name for the main number cruncher?
Qualcom calls it GC so nr_gc_rings perhaps?
>
> Konrad


Best regards,
-- 
Anna Maniscalco <anna.maniscalco2000@gmail.com>


