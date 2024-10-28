Return-Path: <linux-arm-msm+bounces-36139-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEAE9B2CE4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 11:28:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FE211F235B8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 10:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C431D2F6E;
	Mon, 28 Oct 2024 10:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqe04dSJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18260187876
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730111272; cv=none; b=jUTxAhANDekEBe5Fo+U1v3o3FJlC5Zzx0n/hmRoyMzyiwakLZWsqDXy3gL7sQHfxVTMJAEWJ9pFzdTibgfrYVjFARiHbQjbVvk835RbGtE2LrPcBj9cVcE3BtJ2ZBbcUiI3qn9prZDsodsjC5Yg/4ke61DP7h/oVZ0kkcJCqt1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730111272; c=relaxed/simple;
	bh=F0V3V0LcxCXGYV8fDcvvIAkVmPdH9FejZoN4859ONK8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a3HDwwgwG3N7cVfQj9kwg9QbNux7FX1qBw0RN6av0IjrxMct9w+0kE//1n2hYWZ3NueGVW2Iv58ME8VGDIFud2sNeCy64syElu8C6Uf17tH6ik1d3QAftLR4yFTxSNskT1Ha3Edy+oUdQmF/bJw/1kfAA7vzUrKeKFyaAIAbxcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqe04dSJ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-6e9ba45d67fso31921107b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2024 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730111269; x=1730716069; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
        b=fqe04dSJV/m7v0dtRYi5ODIpflzBYSsdICxYZSuAkmCX9aKYqxLrcqbid1e9sWpRVw
         tMXCtDRTdSxOZdS3M5+11uevKszAfzc4YinL8w8tm0/DVJMu09SXYct4CB7WxLmx3EAV
         YR6iwdf2ZY4B2BpaayEpgkVdlGaaUMlNHsriJ3rX1tI76q0M/4+7bHUENXhCYBorJd8X
         xDd0m90XuO156CExX4Jgztq3dvyj2F5jRehfGbz90w4esJWRsH3Wwa2ByOW4QuR8je1U
         fVJHy/Kv664r3moTI+dIlNMX8lKd0g+O+Od86T01OBmcly+3z7YzDGWZjYJbW6u2TtFA
         sdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730111269; x=1730716069;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1hKAuQ0xQZxoyb/tx5eu57U4G9jLofW7PwvgJ3ryko=;
        b=OhJaSk46dW8wyEMcPjRfhW6h0ucp7cqCe/ydMDyHav6C302fP46BtEX03vW2B4f7cM
         YBRlWMlsDx6Tfqk/NFHOCkyn8arih8bXZwgH5vS3Kazn7BySZ5fsDMSQdZ8RtYUYXfNm
         bK0Uqpr76pdK4oyh0XFQqiJg1fxPcp2GM+iOLVRnCPwa/NI+5XxnhmOUlhvn4sVyA569
         4y1XpzRudbZwfbSAeTfEL7edIJ+B5oKK8hLHCHGBxaaxRr9PM4/n3rzlCI2K5KEWopdR
         uYdHrgwrnQ0XF7AbMwL81tR9dkXniEVt4fwN0fX24rNPY8gdm3AYQjeYNUunAfLYjrOC
         7u1w==
X-Forwarded-Encrypted: i=1; AJvYcCWFiGqpj3J+7swbfIWJp4t0+vmXHLRMUAzZ8iOjdbcSuV+wYOOVz39JEiQBlP19wSQRoWKCvvfboy087Eu3@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8HuBYcmlfjrURznYyZAs/UqHwjQoS8Wf4RHaHDd/UENGelzr
	Ityqd+Nm2Myrw0B8mRUHVDxMMMCGHNDz2J4LWiWOlv8mUqK8PYkU/PGJgaVn+Hx0hI50eyTwl/W
	B/kt88j5PT/1wGdkYB381j35l3vxXMwrCWAt4Lw==
X-Google-Smtp-Source: AGHT+IGLe+4t7S9ZSveqwANNEzKdjUad0Z1HtQTFx3PEGKze+pVHMLOD52kyDgR3LowLm6wgDiAgoEwd56iMjidmX78=
X-Received: by 2002:a05:690c:48c1:b0:6dd:beee:9218 with SMTP id
 00721157ae682-6e9d8b1754amr70515197b3.30.1730111269077; Mon, 28 Oct 2024
 03:27:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241027-stack-size-fix-v1-1-764e2e3566cb@quicinc.com>
 <j2qapo66f64y7ddqlu63dqvog2fdbhnaq3t24wp2srvdt4v7xl@fyqu4ry4wmts> <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
In-Reply-To: <6fea85fc-ccdc-46ec-b612-3712e9431301@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Oct 2024 12:27:38 +0200
Message-ID: <CAA8EJpodjP3rY0Twe9sP37LWwk5ppP36dyLC9WKD6CTDOtmwzA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Fix excessive stack usage
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Arnd Bergmann <arnd@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Oct 2024 at 12:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 10/28/2024 1:56 PM, Dmitry Baryshkov wrote:
> > On Sun, Oct 27, 2024 at 11:35:47PM +0530, Akhil P Oommen wrote:
> >> Clang-19 and above sometimes end up with multiple copies of the large
> >> a6xx_hfi_msg_bw_table structure on the stack. The problem is that
> >> a6xx_hfi_send_bw_table() calls a number of device specific functions to
> >> fill the structure, but these create another copy of the structure on
> >> the stack which gets copied to the first.
> >>
> >> If the functions get inlined, that busts the warning limit:
> >>
> >> drivers/gpu/drm/msm/adreno/a6xx_hfi.c:631:12: error: stack frame size (1032) exceeds limit (1024) in 'a6xx_hfi_send_bw_table' [-Werror,-Wframe-larger-than]
> >>
> >> Fix this by kmalloc-ating struct a6xx_hfi_msg_bw_table instead of using
> >> the stack. Also, use this opportunity to skip re-initializing this table
> >> to optimize gpu wake up latency.
> >>
> >> Cc: Arnd Bergmann <arnd@kernel.org>
> >>
> >> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
> >>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 34 ++++++++++++++++++++++------------
> >>  2 files changed, 23 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> index 94b6c5cab6f4..b4a79f88ccf4 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> >> @@ -99,6 +99,7 @@ struct a6xx_gmu {
> >>      struct completion pd_gate;
> >>
> >>      struct qmp *qmp;
> >> +    struct a6xx_hfi_msg_bw_table *bw_table;
> >>  };
> >>
> >>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> >> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> index cdb3f6e74d3e..55e51c81be1f 100644
> >> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> >> @@ -630,32 +630,42 @@ static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> >>
> >>  static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> >>  {
> >> -    struct a6xx_hfi_msg_bw_table msg = { 0 };
> >> +    struct a6xx_hfi_msg_bw_table *msg;
> >>      struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> >>      struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >>
> >> +    if (gmu->bw_table)
> >> +            goto send;
> >> +
> >> +    msg = devm_kzalloc(gmu->dev, sizeof(*msg), GFP_KERNEL);
> >
> > Is it necessary after being sent? Isn't it better to just kzalloc() it
> > and then kfree() it at the end of the function?
>
> Keeping it around will help to cut down unnecessary work during
> subsequent gpu wake ups.

Then, I'd say, it is better to make it a part of the a6xx_gpu struct.


-- 
With best wishes
Dmitry

