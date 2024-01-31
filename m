Return-Path: <linux-arm-msm+bounces-9263-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2F884459C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 18:08:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8771FB30AE2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Jan 2024 17:04:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E7A12CD8E;
	Wed, 31 Jan 2024 17:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zlmPb0pl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F2212CD95
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 17:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706720658; cv=none; b=RjFcpdGLliWpBc4qW+Z93rGMRfsNaBpxScrDAGF579tjQ+64TZCkyiaOuOD2mcF9IZANkwvbLZC9wrjPQhFoq9u22xxQn6cGbAQkHSQpMDddqpH9n3YtqFFffDFbu+iKgn/mTdoCgvdptUv1L57FpIpUCUBDZO021ikMgdncEVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706720658; c=relaxed/simple;
	bh=ZUvoMqLlWwnTNMnys2DYO447gojutJvvOQ3DbVjEF0c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WnLHztrG4R3s7yKKFwVEObo4McMaYbXo/kBZeSbdv2tU0uF0DAHLW5BHlIjX0lmZXEyo0Qe9SSWWzXosWaZXieE+gngytUuJmlWKTzg5DGpLLVMeCN50Vf6tRXY+iBhOFVd9xhUEIJrT3bJuqYc5P0drOhBaFpKtw5StEveFv4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zlmPb0pl; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so691483266b.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Jan 2024 09:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706720654; x=1707325454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BUi9VE3WcG0AerBnR/I4iBGlcSiIv3dP498x8byF2A0=;
        b=zlmPb0plmD6IayCtWTTKJD5uFUT32wBOzoo9K0v1QXxY7Pe/SmDHvxxPcTJWzKtDpA
         vDhneT77fEctQk2dK7dfJ0/vx2k/wBuz2A0eRW6Ke/qZzYYBIv8KGH/g8We1XBYcwnlj
         lgN7CRRZ36mVc3lBaFclAvcApHl5ICMjT8S92zzD3gN/1M9ZR4WDIQg2LOc6P2IjmtHC
         fpd+nfIZl/KlT+jhwbZbC3SnPLyfdU9iH4lS/xoNIa9g6ICVF0qLs6Ems95Tq/6CRsN/
         iVjhkGoqWEoE2axN4O/7lLjc+f5GZv9svys/GGxg7M0S0ko21oQLhc+ZUznh+8R/PNld
         KyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706720654; x=1707325454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUi9VE3WcG0AerBnR/I4iBGlcSiIv3dP498x8byF2A0=;
        b=Z7jxSO7AYlIuqdRKsOYvowsJ99YborArZ5YTiwTn5X86NZlgHIa/f1HcVfHybbbhka
         rKTsjNttMkTmVLwFe34QR54mk0SPFWIG7VhAIm/uJYIaayHjVIJcYb7B4VonrlAKUepA
         UKKRxHN1zcB1BKDvsPlKe1vFmfmitEY9l9TDARPQP1kyZeiP4MREy2dDHj9PhEiIcDLk
         C4y2iLQT0eCROjUmBZFUiRuCr7gkctIupfLRMqOW8HKoPtwgfJCdiQntHJcT87LQaYsr
         37GgzGOu/Mtr4/uZ5+VKnDOLEgOGKYPU1j2JZZyWiClHtxTL1hf12LAN36/7PiBFfL0y
         D0mA==
X-Gm-Message-State: AOJu0YyvJMfxsz+08mOqrjYqinLILTMXJ6CPbd41F63mxcFrs0ENwwF6
	571yjgsT5hx65wB8v9Ad1PLy5ZjGpmTz8BECVHooEGivHYsqIe61gI7nP60Gv6U=
X-Google-Smtp-Source: AGHT+IFV90oJohU7ErajKDUKCpuqHRW982RiDbML/oPjY4Vabr8rn5VWmS27dW3UAmgTq8H7qQnuAQ==
X-Received: by 2002:a17:906:fc26:b0:a35:3152:c46b with SMTP id ov38-20020a170906fc2600b00a353152c46bmr1558869ejb.60.1706720654433;
        Wed, 31 Jan 2024 09:04:14 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id mm15-20020a1709077a8f00b00a363a304c91sm1581384ejc.211.2024.01.31.09.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 09:04:14 -0800 (PST)
Date: Wed, 31 Jan 2024 19:04:12 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dp: Try looking for link-frequencies into
 the port@0's endpoint first
Message-ID: <Zbp9jPF2FspZEk6q@linaro.org>
References: <20240129-x1e80100-display-v1-0-0d9eb8254df0@linaro.org>
 <20240129-x1e80100-display-v1-4-0d9eb8254df0@linaro.org>
 <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJpq1RSi4H6m6UQcyxEr=hip=ypKz9DhHziNKvDjUHsES8Q@mail.gmail.com>

On 24-01-29 17:08:29, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 15:19, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >
> > On platforms where the endpoint used is on port@0, looking for port@1
> > instead results in just ignoring the max link-frequencies altogether.
> > Look at port@0 first, then, if not found, look for port@1.
> 
> NAK. Platforms do not "use port@0". It is for the connection between
> DPU and DP, while the link-frequencies property is for the link
> between DP controller and the actual display.

I messed up. This patch is not needed, plus the author is wrong.

Will drop in the next version.

Sorry about that.

> 
> >
> > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dp/dp_parser.c | 6 +++++-
> >  1 file changed, 5 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> > index 7032dcc8842b..eec5b8b83f4b 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> > @@ -97,7 +97,11 @@ static u32 dp_parser_link_frequencies(struct device_node *of_node)
> >         u64 frequency = 0;
> >         int cnt;
> >
> > -       endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > +       endpoint = of_graph_get_endpoint_by_regs(of_node, 0, 0); /* port@0 */
> > +
> > +       if (!endpoint)
> > +               endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
> > +
> >         if (!endpoint)
> >                 return 0;
> >
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

