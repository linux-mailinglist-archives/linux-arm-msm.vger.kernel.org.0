Return-Path: <linux-arm-msm+bounces-19176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F158BABFB
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 13:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECE9A1C21DFD
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 May 2024 11:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6FB152DF9;
	Fri,  3 May 2024 11:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ffe2p48K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4279152179
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 May 2024 11:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714737440; cv=none; b=o2wXtDnK8pMoPB8a6sq4x8BP8ANikJVG15gmzY+CzVSoQw48E7VWC3atb1ZjI4OGW/x2R6m9SDKYk5QahLPwLQTlWle5zSpgh777lQQSir5nIY84391RG6haQ6On7MuVyhMZHA4rhGNFwvMofeTWA6/oBRQdWARNd+uuNSwMkdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714737440; c=relaxed/simple;
	bh=CmcuBbTVhho6EBimKTWKrm1lTdbe7FzUQrr9f+yUs1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aSjCQT7vBBvU/E1Gn6NuABL7WfdWIgZy1Alo+SflLSxZHddCXUq8olOM9wAzMJEHa7N5TiJ3YKeNwB9NPI9dM1Qo4FZmz5rzHj+CzobjqTrp2JJcOKPkuGJ3xsarxD6Wj/nG3/YTTMAq6vriVX9cCh0qt53omsmbFV6P6e1IP0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ffe2p48K; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6ee3042cb98so3179143a34.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 04:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714737437; x=1715342237; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=ffe2p48K+hSTZVKPb/F3E6md1r98yXJX0imudrjeICaxTwGAIfr/y2rsCuAzQiIkq3
         mz+kFuvaoT3htTZ+OnVhVjsMi6gEcrX9P6TNvdrbLDdcFRMbTpYzsGrzfJWdUWwM7EK/
         MnzNjjsnZvDx2TREJnIhpiJWeNiyau3/e916o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714737437; x=1715342237;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K7hPKV3HF7+4pxzh8EgR7k2JkSmFNYuW+tKLwH6I0Lg=;
        b=XgBorsbxLdadTK4m5GL0weR2crsR/ytQ+qAIRUN2trTi14ScHll7G4NljB+As+78a1
         TNgaeqAGPIDMOpMqWGpHYYdMEUp3NbtMNA4t8vvACWprQAtQaX1rZiVA7sM5fmVPMw2Q
         lfzVCEgfbzKYFgCLcKGeBMXVipd1V/R+NV4c9zHsmdNOSXe+ai0GY6c2CDVefLJPW9FM
         QBjFWEzZywieg6pGvHfvrhiVyAfoBXqYfZkgr7kpeuK5DCDOEsyf+slmgeD3Utpitz4I
         GnF1cs0WgiNsI+soOoUPtT84dA4k0spO17+DDpKo2kiCBfweWVZ2lbOZOonkFNaNP4VF
         EmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUET9D643WcFlYi9W5KHlmq/ip90mkhr1itEMwnbXmFuFAstqKlbcwAiybyagKJOOkxkIE7hR5/8hae63Am7MF6F5KmahlFFvahzKWEOA==
X-Gm-Message-State: AOJu0YwK/2xsELBvvPgW81U3BEo3EQmqQWBnBXRpNHMibGqwo+wOQWrt
	rbNBRt/RpuYLmMv3stXgbbKWHTve6GS71ZJq+H5UBTnWo2+3pOv7ZdE4o/stcTL3f5Ca5ZvWP4P
	SzA==
X-Google-Smtp-Source: AGHT+IEDTbYIQOf3vJ53H9bUQm3Ndwy6tbPsmMWAIvAk3Rnhc1fzwiVtC4F8s83DrmQy27tGq1EWMg==
X-Received: by 2002:a05:6358:109e:b0:18f:81e1:c4e5 with SMTP id j30-20020a056358109e00b0018f81e1c4e5mr1859364rwi.5.1714737437598;
        Fri, 03 May 2024 04:57:17 -0700 (PDT)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com. [209.85.214.182])
        by smtp.gmail.com with ESMTPSA id b3-20020a636703000000b0061b0c6a56e0sm2288736pgc.56.2024.05.03.04.57.16
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 04:57:16 -0700 (PDT)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1ec92e355bfso28435445ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 May 2024 04:57:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8ZzAY7XjTmM3Rvfb4ZqP8I+fuR3AybHf+ilqY0mbDWlNCeV3AhbQ6E7cIrDu3HCQmxt/A5YSnN1bGCZhgm/hvo1qpKXLH6cY8CF5dfQ==
X-Received: by 2002:a05:6102:2329:b0:47b:d717:b689 with SMTP id
 b9-20020a056102232900b0047bd717b689mr2266975vsa.4.1714737415965; Fri, 03 May
 2024 04:56:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-fix-cocci-v3-0-3c4865f5a4b0@chromium.org>
 <20240429-fix-cocci-v3-26-3c4865f5a4b0@chromium.org> <20240503112758.763d8d31@sal.lan>
 <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
In-Reply-To: <c4287024-8012-458d-9829-15ffbceb25cf@moroto.mountain>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 3 May 2024 13:56:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Message-ID: <CANiDSCsU+jgYkUmHZOC8xPsL2DbgU7_sWrby1bQAXQNnp+g6Bg@mail.gmail.com>
Subject: Re: [PATCH v3 26/26] media: dvb-frontends: tda10048: Make the range
 of z explicit.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I am trying to get the DS, but
https://www.nxp.com/acrobat_download/literature/9397/75015931.pdf is a
dead links now.

Anyone have access to the datasheet?

Thanks!

On Fri, 3 May 2024 at 13:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> On Fri, May 03, 2024 at 11:27:58AM +0100, Mauro Carvalho Chehab wrote:
> > Em Mon, 29 Apr 2024 15:05:05 +0000
> > Ricardo Ribalda <ribalda@chromium.org> escreveu:
> >
> > > We do not expect the sample_freq to be over 613MHz.
> > >
> > > Found by cocci:
> > > drivers/media/dvb-frontends/tda10048.c:345:1-7: WARNING: do_div() does a 64-by-32 division, please consider using div64_u64 instead.
> > >
> > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > ---
> > >  drivers/media/dvb-frontends/tda10048.c | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/media/dvb-frontends/tda10048.c b/drivers/media/dvb-frontends/tda10048.c
> > > index 3e725cdcc66b..1886f733dbbf 100644
> > > --- a/drivers/media/dvb-frontends/tda10048.c
> > > +++ b/drivers/media/dvb-frontends/tda10048.c
> > > @@ -328,7 +328,8 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >                          u32 bw)
> > >  {
> > >     struct tda10048_state *state = fe->demodulator_priv;
> > > -   u64 t, z;
> > > +   u32 z;
> > > +   u64 t;
> > >
> > >     dprintk(1, "%s()\n", __func__);
> > >
> > > @@ -341,6 +342,7 @@ static int tda10048_set_wref(struct dvb_frontend *fe, u32 sample_freq_hz,
> > >     /* t *= 2147483648 on 32bit platforms */
> > >     t *= (2048 * 1024);
> > >     t *= 1024;
> > > +   /* Sample frequency is under 613MHz */
> >
> > Are you sure about that? Some DVB devices have very high frequency
> > clocks, specially if they're also used for satellite, so I can't
> > be sure by just looking at the driver's code.
> >
> > Also, we had already a bunch of regressions with "fixes" like this
> > that actually broke frontend drivers.
>
> This patch preserves the existing behavior. The sample_freq_hz variable
> is a u32 so, in the original code, z couldn't have been more than
> U32_MAX even though it was declared as a u64.
>
> It's possible that the original code was wrong.  We have seen that in
> other places in this patchset.  Adding a note about the datasheet is
> also a good idea.
>
> regards,
> dan carpenter
>


-- 
Ricardo Ribalda

