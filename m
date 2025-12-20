Return-Path: <linux-arm-msm+bounces-86014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ECBCCD2CC2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 11:01:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE8E3300889B
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Dec 2025 10:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64E7523EAAE;
	Sat, 20 Dec 2025 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iDve27GU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0D1FF7B3
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 10:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766224910; cv=none; b=b2p7loK/oeaaZtvsqNF193xTooE+Qb10Pk33wXc6fcyQt+ZIG/MVPP15JZgcZBjhHcj1MZPIqvTVEEDJ7vIJwidOnO+3/NHk/MExSa3Hp0eW6P/aiuWr6AWQEYarksmsNJ5xZ9NrRyvbFLST6NDEfCXFYGk55oKJKnvPnv8IEN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766224910; c=relaxed/simple;
	bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Yu6/da+kSVlslGzgylGlyrunBIQ2b/7xm0aij4vUdCTWZFoU/YZ6KhZ1MSTw5kGFJt21G5LgM6MuH0Wr34Qy1cpEOz8MScELmcYJnQh+ExPSxVnQrce+ZDhhOXlh5ewR3LWlvqDBlVveHeRay0tF5ZMPDnKsPmruSzIPYRTnrs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iDve27GU; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-64b756e2fd1so2313448a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Dec 2025 02:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1766224907; x=1766829707; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=iDve27GUkw38lY0+2WnwuPkEeOIQ0ipYYDdG/jAY7DZFIMmPCPQbimEjgxxFm1im5W
         PmxZmGyDh/PEb+8M38T4U8Z0dStqRr2y7X1h/FOr0GjdAwP8xEINlWk3c1XJtdirWEas
         8s8AhTVtWcDopYKFAmkdGMp1KJSYpHtCpKy0VlEE7vBhNWF8iai9EN83kneDvlLaUgRi
         jPGJxg0knV9ZUBFw23L418dVeTWS2bdYOaKSV2gJEUF/Zmd4EiU4vA7VUVTISxHQJ5lU
         qtDy+cpPTGfArRRtTg9IVjeTSdQfeA8If/4c2Ye9bBV47wE/nmjWeAyfvG35dY6uc9rm
         LxbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766224907; x=1766829707;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ocwPq1u4g2mzhV09irHynQ5ZI4NxkFIUPpevQXULN2g=;
        b=twKSZjKGBGOFLpble44UwqHK10gFTKkJ1aMUL/fhfGIVmlr+g1t1TCW11VK+UFMq4i
         ybKwCAUO1I40wFXLQswP5jXQyKrlzC4mj9IuOMD0Yd1pSytgQBTLGM1VPed9dhO6FWAQ
         XNZt87noc3m3xBLSDI6WQTw8a3c705/M6V97pVdsxEyAiGRYgQhc7QN/9l9NeXPpYboo
         nTlsS5LogvKXbdZZv4bjUSbWKCjyS1jdtvLqXh4Uzfk26bnJjZa0aCuNT3Kzchvv79n5
         IpXQ07/PvDDHv95gC1yqKESJRbdlDXbwTg0M9WfClQpT/zcicZBSrCpLtAvkYiIX/mi7
         enlg==
X-Forwarded-Encrypted: i=1; AJvYcCXz6EuIa9QluiDAWb20mjem9B8OCTShrpeWl7X+K7wlSgJYHugbge4Z/1TSRvxsq70usXjpaRYQY6/m9Cte@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm2W/3BmnW1PM86y5cRreD0KmNvxobyYrnTLECvofkaq/TiqMd
	kHF2acVk8oAPWoN5MvUCEqS7f4WWnrvKwWZ6Vgk8a3cxxlTj/xbBiQpp4x/alahE5rWeZ/Dd6uH
	jhhCGpgYLTRJqhHRF3A==
X-Google-Smtp-Source: AGHT+IG5pJx6M7iv4XX9yaURjf8mepTlu7YYJc3wOo7y0QcuEDT1u5dJwGmGqq3CfkKzGEqd1szxRNtAfdZCVwY=
X-Received: from ejdcw8.prod.google.com ([2002:a17:907:1608:b0:b72:41e4:7557])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7e85:b0:b73:4006:1875 with SMTP id a640c23a62f3a-b803719ef9amr511534366b.38.1766224907016;
 Sat, 20 Dec 2025 02:01:47 -0800 (PST)
Date: Sat, 20 Dec 2025 10:01:46 +0000
In-Reply-To: <aUZw4fpWRUWFsb9r@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-4-ebf66bf234e0@google.com> <DF2AXQ67412G.33JOX2CF0VFCK@kernel.org>
 <aUZw4fpWRUWFsb9r@google.com>
Message-ID: <aUZ0CsLrHjP3wMac@google.com>
Subject: Re: [PATCH 4/4] rust: drm: add GPUVM immediate mode abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>, 
	"Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	nouveau@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-media@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="utf-8"

On Sat, Dec 20, 2025 at 09:48:17AM +0000, Alice Ryhl wrote:

Test email

