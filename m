Return-Path: <linux-arm-msm+bounces-17577-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6605D8A6933
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 12:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E841F21DFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 10:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2DAC128376;
	Tue, 16 Apr 2024 10:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r6U+yINx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D79E127E3D
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 10:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713265006; cv=none; b=WlVsxPdqXMf4NxlS+y0taZ1YYzv7lHmObtf9OcNdE1lP5epDQUM0kyk6Wk0/Z/ywP7Z3leb6YwEgkmBOmJMo/dbOZGqFf9/GzzgBKyoisSmC6nwhFDXRNvBl3nl4WGUfxoU+mEnnIjnjEh+z3ogKFt+ys8BbF4pvX9bgSvd0Unc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713265006; c=relaxed/simple;
	bh=HlgZk8CvLNHX7j9hSVFcL16+f4dTN36eZ1Z1lh6hhAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bm5YHkfv13nX+zs4M2NVh964YZmwUNMRPThMMA/6wN9mauB8Ek3u3QXvN4dq/q7XU0ZcqQHSt2DeSQmeF4u03W53fKeIcRGKljuqW88vXklNjz052JMrRJ7i2xeTw8nmxH+ydhx95/QYXQbMnLYZFiIkrhwHmNhhgRRzISSeJhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r6U+yINx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so4545480a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 03:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713265003; x=1713869803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=r6U+yINxFACDakQy+03qXcj6VxcD4ap5W6Fk62p4c94V5dKPPnAfxE9+WeQQAhSKMP
         OjMOuV4kG4Nxhf3BZJ3hDdbVm8YZXmrxrbukZ5A32VIoBbou1Dl0QUJxQBGbudJ5cOyk
         tkSEfcXBkU5CbgvbBGpthGz9MLvUIP8yuzUrXDln/SzxdUmEEvy9j2qPpN3nbzRdC+nJ
         VeNx0lNPgcfsDbp1/XOvYpvREbcMVl9Kk58KHfkQ3Q1wRgfqgnF0rF6E8Cnh0fAS2h25
         Trk0BO7Uo8Jbb0eQ65TlHWPmzAI+ZHbbth42IbF1GJG1WIRhW1NF+1lJGq3R/FzGGPNh
         oMnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713265003; x=1713869803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+LvTU+20katiBQPmXC4bjjTw0g5f/3WkUMY6Jo3I4w=;
        b=YFfEAnOp+YahgEJsRzv++LT2cNX1GKRh2mBV0tTpE9WBO867hoTNkm9jhj4it4lsKm
         2BMu/Ruy3wdZaEwNub/amUwNAnN56M7ZB4vej1Vjh6TEO2KX8MIf+fp8UbRjCeWRXdjh
         47z23j4dQ0KfbhX0dazsRFptI+jIdzQ9jpUtNSCDmuNytuapUA+N+BiosZLxdNxNJJ9a
         //n/p/kjRyQH67zOGU8ARilmSeKOf4py4m7mGdG3oS++BZJhJBrYM99EeUaxHn8OEN/G
         HY83sVv/JEpEItVQSOquCrTROQnKLgymRovcx7Fw0n7S6ghO7Aa9R2F8bKS4dXAVi2eD
         tlPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbRVC4zpFqHtUiNHgDHdDkr2fNbRTwkCqyC820RV08mD/rnTDBur9qc9CfcYx8qGvVR5jC+RXvH1M/sVjYwUn5rrAyEn2P2qCgKi8oDw==
X-Gm-Message-State: AOJu0Yz58gps89IbH8d/FT1Q5zs+J/9UbB5rugbWyCdjM1lM1roXlUAq
	ROQEV1QZ6fBwU7cu1sFJEpSXexj9GdIBcnc+9YrTAIp8ZvoqhZ7834D51AIx3R4=
X-Google-Smtp-Source: AGHT+IFRHzwHYV/k15VsjWZfN2SFFrEwWZL3WX+T78lKXGwI5ZHOHbWBE7IZ649XfmZzZPkChlPXBw==
X-Received: by 2002:a50:8d19:0:b0:570:1161:111f with SMTP id s25-20020a508d19000000b005701161111fmr8339541eds.15.1713265003274;
        Tue, 16 Apr 2024 03:56:43 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u5-20020aa7d985000000b0057000a2cb5bsm4692942eds.18.2024.04.16.03.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 03:56:42 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:56:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Martin Tuma <martin.tuma@digiteqautomotive.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>,
	Abylay Ospan <aospan@netup.ru>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Dmitry Osipenko <digetx@gmail.com>,
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
	Vikash Garodia <quic_vgarodia@quicinc.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 23/35] media: dvb-frontends: tda10048: Use the right div
Message-ID: <bb7d0078-764a-4cf9-9fcf-2e91eaf33e76@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-23-477afb23728b@chromium.org>
 <97f51ae8-6672-4bd4-b55b-f02114e3d8d0@moroto.mountain>
 <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvp9gBo6Oh31GghvcHmgBY1cYqq4uM_njFTTvQOcS1mbw@mail.gmail.com>

On Tue, Apr 16, 2024 at 12:39:33PM +0200, Ricardo Ribalda wrote:
> Hi Dan
> 
> What about going the safe way?
> 
> --- a/drivers/media/dvb-frontends/tda10048.c
> +++ b/drivers/media/dvb-frontends/tda10048.c
> @@ -341,7 +341,7 @@ static int tda10048_set_wref(struct dvb_frontend
> *fe, u32 sample_freq_hz,
>         /* t *= 2147483648 on 32bit platforms */
>         t *= (2048 * 1024);
>         t *= 1024;
> -       z = 7 * sample_freq_hz;
> +       z = (u64)7 * sample_freq_hz;

I think your patch works, but it might be nicer without the casts.  We
end up having the discussion where it's like "Can this hz be above 4GHz?"
And, here, I think we're safe but a lot of stuff is pushing up against
that limit these days...

regards,
dan carpenter


