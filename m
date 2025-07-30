Return-Path: <linux-arm-msm+bounces-67200-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 634FCB16864
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 23:45:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8567B1AA53FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 21:45:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2909F224B15;
	Wed, 30 Jul 2025 21:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NefG+6+A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B71B22172C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 21:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753911898; cv=none; b=bIFsv8w7pgFMBusTusd4RjvQVfe1D6laVvFqhZU8iwV1zS0uE9L5T/WShpm8LGILmynggpt2JUjA6Qpehrp463tkrddbr6r6NydfX9MClyo84TqH0YOJvkJ99szOT1vScOGgE5Cxzo1lqMN1OpoW7aKobouV6VYHpg+DZJNt5QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753911898; c=relaxed/simple;
	bh=PPRlwx1CPANTimR56E3Tq9xJjZZGDr/ycInC7SqiA7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X2eD2pm+SZiz3VriR7Sw9Wfbpq9qy1oKDO0KYlpFG7oCKImRlGjinY6pQB6y7QqNTDGQ0c2Duel7VomrvjShSebFWKdxQpSubJ9eTErbKC1XlmBuFFxImq3GcYFndXROC6kxDwFaiyJg68nb18N9PFbtIxofpHoe4TFBQ0O80GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NefG+6+A; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753911895;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
	b=NefG+6+AoB+nFdpZ+Mvu2NIzuXZlagaCp//jX+1tbnrdjPncw7v6yX2nAiBAio1zkx6niJ
	gUHhSY3aAFEOzAafEwReh8wVfBbiY6PRCmjRy2pqoIkoRfBRl6CzHHeh/74hcaFFuKN+Lj
	YirNP4/+yqXVhT4auVKrq63d+e1PXqY=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-DgTE93oJOB2fbTjIbgDUlQ-1; Wed, 30 Jul 2025 17:44:54 -0400
X-MC-Unique: DgTE93oJOB2fbTjIbgDUlQ-1
X-Mimecast-MFC-AGG-ID: DgTE93oJOB2fbTjIbgDUlQ_1753911893
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-af905b8978dso13308866b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 14:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753911893; x=1754516693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etY/MDRGFrNa3/NcGdo98kEahLCyg5BbKHxxOTQSp/k=;
        b=HGiKfw7rLBdr5X4TvPmZyx1SZYbzgWUzcBUyeMqLJhdHcqYdFrKZZDoY38gptWdPA1
         8lBfPmzsohrboiWhF6VTevmk9rYACTZVPGWoC46zJayWf2jHl3FN7oeiXhyfMF1vKEbK
         Bnku16ZW4clQ3Uw0fvH8E544wKNrztCFKhwU68CPu1/K2H6yIpO3Zs/NyxdZVctiyXPi
         v375Z9iAT2WEWim7G25mPJBPO85jfwXxdFJBS9KZwS0j42icRobU3trRNSG/ZrFAVkLz
         BEfJRP1DekHkD1sNDnZn9mZJdGKaOmEDUVvutGuv+63y/oPLPy/L49bJAwNnCHSKiQx/
         jyOw==
X-Forwarded-Encrypted: i=1; AJvYcCUUmeUTcvEBTF3FGdX9+KgTsa2nofoYJetJDLk6yToVnuUDIb5LepKAlIdmxU/YzFGI5Zkc1B8OvaNW6Ace@vger.kernel.org
X-Gm-Message-State: AOJu0YyXCLAxoCJyE+s2UPqVW4LW1L4HSRgSdt/p4qwX/CjYpi14eBXw
	b0NQamJisKOfHHN68MJ1IoqNsQZWV1pP5XhZuKIBbTUM/4+Lz8X6z004+NX9nE6Z2O3736Ry7om
	ka+nM22lBtZZ4m6KeqBCl0xf0BPjBtXkFHYGpodapagqKpt/9LkOBjWRAccnxt7iT67sRTOacnJ
	YqMVlHAEipaVNWaybqSaJmASEdmGTQriiecfCO/F6+Tw==
X-Gm-Gg: ASbGncstx2DxcBvNm9/oiiKwLgO6RbfPflqq9IH+QZT8ArJ+1zxUYXtQ6ArJ4w5chbH
	52kMBzO877RBCg9FEGcpz4SfR+k/QdL0iQyg0PNiJfrgepY3Be4z9iNREliG7e4oAIlO/HT09Yt
	afE578iiRYc7RK7POmn+mD
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id a640c23a62f3a-af8fd95983cmr588747766b.28.1753911892804;
        Wed, 30 Jul 2025 14:44:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETx/Q8z8JkM7YCT5hwYxMVdj/tg+Mt8q7qzSVGG/eKji/F1PzdcrMN7TdxkQSZqczHP8nko8qLTPufvPgLTYo=
X-Received: by 2002:a17:906:478c:b0:aec:4881:6e2b with SMTP id
 a640c23a62f3a-af8fd95983cmr588742766b.28.1753911892317; Wed, 30 Jul 2025
 14:44:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com>
 <20250710-drm-clk-round-rate-v1-9-601b9ea384c3@redhat.com> <20250711-adorable-winged-petrel-3a55df@houat>
In-Reply-To: <20250711-adorable-winged-petrel-3a55df@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Wed, 30 Jul 2025 17:44:40 -0400
X-Gm-Features: Ac12FXzMGo-MKds2pkAwVkvrlMlbQL40TOGBvmpmqZ_c-U-gdfMUVGNxYave4ac
Message-ID: <CABx5tqKuOcE83t+BVz=1WudVtBxJYTzcjWJ_n4se0JQWeU_Y1w@mail.gmail.com>
Subject: Re: [PATCH 9/9] drm/sun4i/sun4i_tcon_dclk: convert from round_rate()
 to determine_rate()
To: Maxime Ripard <mripard@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 11, 2025 at 3:05=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Thu, Jul 10, 2025 at 01:43:10PM -0400, Brian Masney wrote:
> > -static long sun4i_dclk_round_rate(struct clk_hw *hw, unsigned long rat=
e,
> > -                               unsigned long *parent_rate)
> > +static int sun4i_dclk_determine_rate(struct clk_hw *hw,
> > +                                  struct clk_rate_request *req)
> >  {
> >       struct sun4i_dclk *dclk =3D hw_to_dclk(hw);
> >       struct sun4i_tcon *tcon =3D dclk->tcon;
> > @@ -77,7 +77,7 @@ static long sun4i_dclk_round_rate(struct clk_hw *hw, =
unsigned long rate,
> >       int i;
> >
> >       for (i =3D tcon->dclk_min_div; i <=3D tcon->dclk_max_div; i++) {
> > -             u64 ideal =3D (u64)rate * i;
> > +             u64 ideal =3D (u64) req->rate * i;
>
> There shouldn't be any space after the cast.
>
> Once fixed,
> Acked-by: Maxime Ripard <mripard@kernel.org>

OK. I'm planning to submit a v2 of this series on August 11th when
v6.17rc1 is out. Unless the maintainer that picks up this whole series
plans to drop the space on merge.

Brian


