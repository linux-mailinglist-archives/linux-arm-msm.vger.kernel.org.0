Return-Path: <linux-arm-msm+bounces-47606-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C7BA30F1F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 16:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E78153A34C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2025 15:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C393B3C3C;
	Tue, 11 Feb 2025 15:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a38kv9CF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18FF17C91
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 15:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739286225; cv=none; b=Hr8LhPsek7btt9HnrMXV7OvMwcyK7GPLCrmKmlLlkifWevG/zpbSFRm/ip6DkvoxupwSPOpKjoY3v/Avt9kjFfxXsH6IfCYfeIPI9E7juVpwXLmoOmnxc5CVXpICu+Tgqcv6kR0WDULGlQELVLt1ZrM5ZkNSwop5Us1HpQhreCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739286225; c=relaxed/simple;
	bh=TQQAbEM4Lc3ts4bruQy1Ce810J81S59Y8DQr6RiuK2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YV6wEjCa1B0WDlS63JW1xfhyUnRXAjlZnlYfVkGFA+kibv28tbd6frEK1Z2bhjLTA+uUv+F4NRJSY2GrPlOM6Q8SDtMfb/lBh4gBDEN81V/jhs5PsKQqQ0WLSrsr3cG5jjjZuwlqvE9yiuIlKT0I4f2f+Kf6BxEZoAh8hskfe24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a38kv9CF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739286222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
	b=a38kv9CFs1Tdiv9UCWkKAoZn1GRjzub9XvQ/Htqr3Wj94oiJ00nbiGjzLajRC/1NRacxTN
	b4+bCay3YrP9wJx6zrn01Nzgc3kgdB2L5qBeNPrzF8/f7wyvRGh3Z/m/2zzHcg1CtM3usu
	7pAYd9U+E1PU9wwAo+aR3pK+7H/Kbn0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-OuydCyWZOdOtz0vMGpspkw-1; Tue, 11 Feb 2025 10:03:41 -0500
X-MC-Unique: OuydCyWZOdOtz0vMGpspkw-1
X-Mimecast-MFC-AGG-ID: OuydCyWZOdOtz0vMGpspkw
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947979ce8so10286975e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Feb 2025 07:03:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739286220; x=1739891020;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6K127Xqp01kwOLTDIHQix5w2cmmFKXaOgArwWedRCAs=;
        b=DE1MNYVqiTdPeThs3L6K82M5e1KaM38YP/rFMc69YWQF80aobt5JnDnQUeu4F2cscq
         ZxTBUuSVFnjiCfse8Q78Ip14xM9wutZWY7VYrRjuwBqdasjJH3TEaAogcsIt3JHGftfU
         nkygA0l+U+ypcHtokLoiAVK137ASHtJJFyO4+WxYtIy935bqWVvDFDXrwy34ZWoALiyC
         mBYl53LIwuEZqE1s59Pfb1M+woP0XC4VcITcaffaQAoJ4XcYzKC3zRW1N07ux/bes2Le
         C4o6nGIroLT9E01lcK55GAgu7daEmUQ536DEuOi52uvZz8a7iMgfOcqmxHq8gef6QnKW
         Cgeg==
X-Forwarded-Encrypted: i=1; AJvYcCVu3nCPCsLgXsxDOIVgtPSKckXh6i9RWvF/6jmU1ZKWr/QSuAsge54IU3KaVP33HQEC87ZRIbe0BsL0UaW0@vger.kernel.org
X-Gm-Message-State: AOJu0YzTEC3ysKeEXnKdVduMD45jVsOmgdRkINSPgqYz2lqYUv65lnGj
	0PNf78u2oGhvpRzntJBgkBhRfMjHUKc2y6HW3zUgHACUuV6109MDO2ukn2JuWEBTTvy5Ap5jFjG
	0Ubi9lsAtvo7ajNeKUfOAzs+inzUWS2l90XRBcTO6n5sVTyFTpE0O8iN18aZVIQE=
X-Gm-Gg: ASbGnct3BUk6P3UCsQ0MdUB+Z7pDFSCESdUG9cO59xj/RUD2032X1q4izIMYLwJkG0T
	5/tGr+KGjCvSa5uaBNL54Fe3hcaXOOHSAlS/yzKQe5hqnR/VW/BZfjvJ7QvNqjAZv5elb9k0r5G
	T92FcTi8Ehu6lt3BJMz12SMAUvWT9/i1KLxU4hGL7qC0IJFsgOCk72ptO/TOl31+thraCpymKVW
	OhcQwgR6F7B8TMMJdo7FFG/MEZawSR3LE8ksf0wtdL938lu7vzWvKvcLAsdWBeo0ZMHOA==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id 5b1f17b1804b1-4394c853a2dmr42858075e9.29.1739286220076;
        Tue, 11 Feb 2025 07:03:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN7+RaFI8Q1DlET/AqPOd5Q7ETC0Cm6eLK5eh5/vnngjAmjHCWD7Z20lqQzfUQw3dEBz+m0g==
X-Received: by 2002:a05:600c:4448:b0:439:4740:20a2 with SMTP id 5b1f17b1804b1-4394c853a2dmr42856745e9.29.1739286219388;
        Tue, 11 Feb 2025 07:03:39 -0800 (PST)
Received: from pollux ([2a00:79c0:65c:c300:abf:b8ff:feee:998b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc5c8c37esm13267156f8f.2.2025.02.11.07.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:03:38 -0800 (PST)
Date: Tue, 11 Feb 2025 16:03:36 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Philipp Stanner <phasta@kernel.org>
Cc: Min Ma <min.ma@amd.com>, Lizhi Hou <lizhi.hou@amd.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Lucas Stach <l.stach@pengutronix.de>,
	Russell King <linux+etnaviv@armlinux.org.uk>,
	Christian Gmeiner <christian.gmeiner@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Melissa Wen <mwen@igalia.com>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Lijo Lazar <lijo.lazar@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
	lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	Christian Gmeiner <cgmeiner@igalia.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v4] drm/sched: Use struct for drm_sched_init() params
Message-ID: <Z6tmyHpqnpkP2gKq@pollux>
References: <20250211111422.21235-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250211111422.21235-2-phasta@kernel.org>

On Tue, Feb 11, 2025 at 12:14:23PM +0100, Philipp Stanner wrote:
> drm_sched_init() has a great many parameters and upcoming new
> functionality for the scheduler might add even more. Generally, the
> great number of parameters reduces readability and has already caused
> one missnaming, addressed in:
> 
> commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> nouveau_sched_init()").
> 
> Introduce a new struct for the scheduler init parameters and port all
> users.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
> Acked-by: Matthew Brost <matthew.brost@intel.com> # for Xe
> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com> # for Panfrost and Panthor
> Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com> # for Etnaviv
> Reviewed-by: Frank Binns <frank.binns@imgtec.com> # for Imagination
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com> # for Sched
> Reviewed-by: Maíra Canal <mcanal@igalia.com> # for v3d

Reviewed-by: Danilo Krummrich <dakr@kernel.org>


