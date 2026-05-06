Return-Path: <linux-arm-msm+bounces-106142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNTINTRp+2miawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:15:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E17EC4DDF38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 18:15:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 004C53015089
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 16:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE074963AD;
	Wed,  6 May 2026 16:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oqAg1DQL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB72A4921B6
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 May 2026 16:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778084063; cv=none; b=NnFy5rIoAa2lEQXmJSVvicdFOTojuNYhrKowA62OO9c5rMvdBZcErQt5hDstjTn7ASwZCoS6/uEoZZIHcf4OyJ+pdpWB0DC3XnQMAICKy9rsrm3kr5He/5tfPB3mmQBn5IlyvkRah83+JXh1k7qMFl2M/0pLZQn7AxBlwPKKBok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778084063; c=relaxed/simple;
	bh=T+hwVHoy+/HW70H4b4ny1tz+u9z10JcY5ob6OwvauXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i09QBIsaUcFudWskchTf1axjdDl0rgYoue9bFk+E+o4XsrBwHgorjdFUkYnyPN1ZoWx/Rl4W+7sxO0w3P9ygf271UjJXOYfvdNDnFg3kG8uXOS6cO2t6EuQAXFhySbQqpiFWgu1yb+VUtVZeK7Wddiu3JhDI/86q2Kw+JqrsObM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oqAg1DQL; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a887ebb416so1128259e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 May 2026 09:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778084056; x=1778688856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=oqAg1DQLyT1XmAPaltQ+v5D5NGDIUFmqL8DMIIgdEXMsXXu8D11qsPAtu7mycGuWIN
         u2jGvpcEqLaxG2CqMcsBt6HFrhfmjqQJif2P/CjuB1e2CLyomhLQ58/A/mq3aBtNC0ra
         FjL4kjdxZh9uUrx97XmXVPvgxEb2You1mx9bPwdAekIi8rnbh77547Htce3/Pm+T8af/
         4ArDZwLqL/XaEKpR9AT7GlNzyACVwwrpT49MNaVbgGO2Viku2SMFqhM4OGfTKkd3aAuL
         LMqZdQ0GKmgsiOZszGaknj/YovO8af3f65RcEoq+gAFf8t0gTMSOvEYDv3PX8huWQQdR
         rEWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778084056; x=1778688856;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QpS9p5To8P4BftdAlsDaBegfX21bw2fBoqWrx1dYiXE=;
        b=d8VVquXS0onNVxuCPfdXAcKlbg7FpznjSDqpK2N6S4Nyr/IWr2NZI6A8VTNe1XXN3f
         o85ObL5N6+mC4DFO8QhSgof3U1yfwGFg4Y/v5Ko3oFpjF9qTZgtspHbZVrQyzrcZRZLA
         fesHgp+bi3R90rgPmw9Ttlp4Hkfwq1ZVfVgefZtzlxwElPkmxx2SShfaC+4QvvUpKi1X
         qNEVVWParPvnENMvN9jwx+It3WA9O2hgYk1zcKoqdEII6K2mPsQg3zj4hn1xuQlQj/rv
         sF0crNFMdF0UuZ0j8p9mfeZpcH8A2TspUQRju0bPavUuSq76ofiW7OROJ0Sw3du8Zz9h
         2png==
X-Forwarded-Encrypted: i=1; AFNElJ/92ZpoN4gS/PbsCurLfLex3OjBgxKj3a1jfWpUiL2fG3DpIWmPo9/YlZMv9R6yy7wK7eYbxAM8r4SSBPT8@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqF7eBpCP/zmu+m17VplZI8xrmG2pQ/vwXNB/u/RYSBqYKQEt
	9IhB7ifQmxXqUGN5SiynZEmsnxKqpTF2lv1/wJXZ+CDzEHq33g8Doly2
X-Gm-Gg: AeBDietxDdx6kRmKZc/cMjFaxwYvtzX5VtodbGY2pmVIOG75YVT6vG9DQuA7dlpYWkn
	wnX2IHkpEdhd1VuSeqmAVGyz21idjCFFArRvnLrlF4TYXjcBZgj1puY4ghZBQYLnkHPlKtS1rAk
	mr4doWSjJJoJO2eQ6YNhl0ODQp4MASzDXyysLolayiG4jnumxYc0VHoZD/oJpepmPH/LwnYvlhd
	/4/FDtOwmCh7JEzCK3w1myq8lckNiYr5SQgHUQDi7QbbrTFxdl9n1IEvMDJeo0OV0A7ZPk3OIQv
	VVaMvFhFYrMdXGw13cTHMjOlMVr1sdWmJcMH9/6RKeSbILzNyihpb92PzB+U4LmuDGmRTkWPmmK
	OnvVHMl08mXPBbHhoC6S7UiF5qhqlJNFhQEMXSwDjwx7AyJQVWG9LEs84Q6tdnH8hO9A3mmPSyg
	laDRSR5sUTgRx9MNGBub3iJDwowUPDOFzXTZqnfbZg6sxzevr+su+t/FFnPXZtYjA4M5Ho5RgtF
	Q==
X-Received: by 2002:a05:6512:308b:b0:5a8:89c5:2c0f with SMTP id 2adb3069b0e04-5a889c52e35mr1306160e87.25.1778084055726;
        Wed, 06 May 2026 09:14:15 -0700 (PDT)
Received: from [192.168.2.20] (109-252-156-195.dynamic.spd-mgts.ru. [109.252.156.195])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a86aa3d540sm3844372e87.17.2026.05.06.09.14.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 09:14:14 -0700 (PDT)
Message-ID: <9af23def-ffa7-4f68-8aa1-ab080b6c1c4f@gmail.com>
Date: Wed, 6 May 2026 19:14:07 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: nvidia: tegra-vde: Fix iommu_map_sgtable()
 return value check
To: Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20260421-iommu_map_sgtable-return-v1-0-fb484c07d2a1@nvidia.com>
 <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Content-Language: en-US
In-Reply-To: <20260421-iommu_map_sgtable-return-v1-4-fb484c07d2a1@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E17EC4DDF38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106142-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[nvidia.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,linux.dev,poorly.run,somainline.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[digetx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,nvidia.com:email]

21.04.2026 07:02, Mikko Perttunen пишет:
> Commit "iommu: return full error code from iommu_map_sg[_atomic]()"
> changed iommu_map_sgtable() to return an ssize_t and negative values
> in error cases, rather than a size_t and a zero.
> 
> Update tegra_vde_iommu_map() to correctly check for errors from
> iommu_map_sgtable.
> 
> Fixes: ad8f36e4b6b1 ("iommu: return full error code from iommu_map_sg[_atomic]()")
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/media/platform/nvidia/tegra-vde/iommu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/nvidia/tegra-vde/iommu.c b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> index b1d9d841d944..824d2aa80a43 100644
> --- a/drivers/media/platform/nvidia/tegra-vde/iommu.c
> +++ b/drivers/media/platform/nvidia/tegra-vde/iommu.c
> @@ -25,6 +25,7 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  	unsigned long shift;
>  	unsigned long end;
>  	dma_addr_t addr;
> +	ssize_t map_err;
>  
>  	end = vde->domain->geometry.aperture_end;
>  	size = iova_align(&vde->iova, size);
> @@ -36,11 +37,11 @@ int tegra_vde_iommu_map(struct tegra_vde *vde,
>  
>  	addr = iova_dma_addr(&vde->iova, iova);
>  
> -	size = iommu_map_sgtable(vde->domain, addr, sgt,
> -				 IOMMU_READ | IOMMU_WRITE);
> -	if (!size) {
> +	map_err = iommu_map_sgtable(vde->domain, addr, sgt,
> +				    IOMMU_READ | IOMMU_WRITE);
> +	if (map_err < 0) {
>  		__free_iova(&vde->iova, iova);
> -		return -ENXIO;
> +		return map_err;
>  	}
>  
>  	*iovap = iova;
> 

Acked-by: Dmitry Osipenko <digetx@gmail.com>

