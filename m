Return-Path: <linux-arm-msm+bounces-7650-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F383326E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 03:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E6511F22005
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jan 2024 02:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9272310E8;
	Sat, 20 Jan 2024 02:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n8mFTpUu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C4410E1
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jan 2024 02:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705717918; cv=none; b=eMJ4cFrfPVUMpCvEppYs1Apnu6C2pxrAGRV2I2IevdkUc/2UBkkUACVuyb+c67wX67xoICyLMhdyBcQMyfNzszkZjog1gCNh0+KJF9t3Xodh5kgYQtCdswoFLAksMwRCGm+20BEOKykYw4p5CVmtBgxAI/iILVwL0pqmL1hbUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705717918; c=relaxed/simple;
	bh=y7i8+e2UFcVTVb4JKzkr42WjXtrlw8WHyR82aAGSFKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GM6d/9QsXOcsfFhSQN/68YgLGFhKgGPnRGvo5hUTC3q7E0zgSpc27jtm+3ogtLg7hxGGJOytonRBfm5OVOaSMOxBmGQQMm351hmqndF16xC6yIV7vbdXMI6oipHNx61/noQELeTgsw1FVgvNrkWa5TIwl0kB7CBQUet4PI/pSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n8mFTpUu; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbbc6bcc78so1182012b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jan 2024 18:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705717916; x=1706322716; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nyeMNz1BdLz2Zw+KyXoni/RwA4cvZUvIGymiJ063oGg=;
        b=n8mFTpUug4eriK/XbX7K8/PpmbR4d4SzKrJC9GZXrdqieyJMqeS2quTDV8efKBpaz5
         h0FlQiVWABP1t5vqeSexQAn6SCySm8ilkMqJz/ezO9gWKvfKfuOmk8CIlmILrXIZu+eu
         2do1tiaRoA2Sc8wM2CgHdTXcYx4g0AbasLldZGzPjPCR7pZcyHjNl3wKeHKeGl+RHwIv
         t/GwkyL9JZxgs8h0WFT6qLBUyukoWlhd4IUBU/5MDdQ6x+sag54ht5c5DhiwyLyuuStX
         eDVBGSFybw9+UOvEVgxB1CWxtcrGh3jDBPlkMboWOTSnxZyfldqZFhpjYt5yoZQ5F/xX
         KL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705717916; x=1706322716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nyeMNz1BdLz2Zw+KyXoni/RwA4cvZUvIGymiJ063oGg=;
        b=pRF78/gb7gwoUvb5KSQuoySqYaFzMutceh5KlM4FefpnBqMFDoCxnho0ohJ6tCP5nH
         iN4iZQLTTMHLIRxZOZ2Se5t4enl3tRD4Y51in4g+SIOQ+SUy1B/RO25UxoR7R3UmZWGw
         kOu1y6BaVNo5aB2XyEy4GTIOE+dNvp9ETO3l/TIyPV+jOJCgrh7WfHmGrEuXgK1ImUsP
         hHAfR7fujAIsx6LWulfJ6jFwQhjJ15eT9RdK+8DAqD0boeYXfmsbk7lgHG/bzX4La8XU
         7iKm+l7avthjDWpFJtvQx7gX62MlCBQRxtBsF8ktAW+ea+K93itqFSz4zeLn1gmMcXI1
         WGfw==
X-Gm-Message-State: AOJu0YwLPrlc4npxMSq704QLbWkFtS8gMHkDQs9mTlkU8L3PbtV4GSnX
	DHJkeBESCwKyYQhB0Lx8bX/VLPZkmAYINvOtCnEcJ1Gu9J181rVEu/pYt2AxyqjD4OwKl1M/g/0
	0+S3WLvW1I1LjY0hDwJjs+QGPNgeQN513RR1+aQ==
X-Google-Smtp-Source: AGHT+IFOygdynqBpB7ozJkCg4VxzW6Dv2HATIwmVGSa+o7iXXznDuFaSsdJ1/FwKhms3ctO2S0y/hmwnqSi00tKbTuI=
X-Received: by 2002:a05:6808:1595:b0:3bc:15eb:b9bc with SMTP id
 t21-20020a056808159500b003bc15ebb9bcmr900500oiw.73.1705717916033; Fri, 19 Jan
 2024 18:31:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org> <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
In-Reply-To: <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 20 Jan 2024 04:31:45 +0200
Message-ID: <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sankeerth Billakanti <quic_sbillaka@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Dmitry,
>
> I am testing this patch serial with msm-next branch.
>
> This patch cause system crash during booting up for me.
>
> Is this patch work for you?

Yes, tested on top of linux-next. However I only tested it with
DP-over-USBC. What is your testcase? Could you please share the crash
log?

> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
> > Remove two levels of indirection and fetch next bridge directly in
> > dp_display_probe_tail().
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 42 +++++++++--------------------
> >   drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
> >   drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
> >   3 files changed, 13 insertions(+), 57 deletions(-)

-- 
With best wishes
Dmitry

