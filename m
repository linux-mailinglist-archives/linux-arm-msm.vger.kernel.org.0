Return-Path: <linux-arm-msm+bounces-17562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7388A6516
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 09:30:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A9811F22DC1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 07:30:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 060F17F48E;
	Tue, 16 Apr 2024 07:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNlf7vio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073CD6DCE8
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713252619; cv=none; b=GBTF39yZvqjPrWOVwq858vwTFjkiopSYeW4t/BzyLf5v+bikzl8eanC/T46RqM3k9zNfPbY+0JcfZWmt/uorDA/ykRLmamc41FxxMSzvLtnaUkxSitdMfJ23dl8OskXz1nKyJIi0D7d2Sa+t6a8hv7KMiqT6Hib5TPozQBWB3lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713252619; c=relaxed/simple;
	bh=3EBKV7AoYCxlJECmklFzoEXRovNanxjXalvsVOT4m+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gGS631JD9WDFZ/nUg/Ab/cBb6+vjf/fhwTr0CGxFuj3pRXMKjrZFNTB6sNlsqKpmS0sqOZiqHgL5eb2QMV8oJTfM3DNuGebMVx+P+zEScUTGO9RyIlPk/GWzuDDl9c8duxW9GuB5NHCreoOlhgQMctSrhbpq7VwEYosDCuJoIBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNlf7vio; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4715991c32so515466666b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 00:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713252616; x=1713857416; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
        b=SNlf7vioxt9kCwvhEUN8obQyhDYbHdl4mPQtUdgYuiGObRsj3s3lTmyk/rgfuO9C0b
         G/go3KPIiKXe8EL7p2wymeks0Ne2COByut5L6T4WRBNrmkwvDXUMfIYeCaaHBXelPe+z
         6XNJdOsb275n+a2dt0ntwxe+TEOwv4IwBgUdks0IiqLlrWd85B3RoNpJazutUQIc1wxC
         sz1XqbKDXYN84YdAWzEWn0OrUHfuvgBavPzJU8YjCcZmbUNz/tnjrtDE94ylLfSPr6ei
         Po0ST2OC1kThPV2sUV4K3rGk8Lv/QKQdR9a41Wocb6oTxU35MJ+2E8qhC2dmJGK1n4IZ
         Rkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713252616; x=1713857416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQoXqxQGz5UdNS/uHt9iOu3c65OCBEQl1AjepevvRYw=;
        b=Buqfj1cgRHOFpInb1Blk9XMUDP1upAwyCfe2dJypZVghv3er4PVGXA8rZsO0+yob73
         9viVVeNtqrlWpky1oJMetXLmJAnf/OsOHY/u1OUy5TcJgY69sj+1i/kqdFdZ6wfiNaQ4
         PvJBFA69a56j2jZewcfVjTpatZDugApAV+yrs36GcGB2rgwtui6e5NjYQB5aLkAxnN5O
         RhrBLfm80MU+qnAzExVAGL2o2ux3c/+1N6gU+d/rKJWOwqppRjwXiWL+PasEZaeu41yS
         Xl7NbD9a6rr2rQ/DwLC+5ZW9B1QoZKpGqCVg8KFabHEF2RsgaqErTtAMe+1dl9aETnYb
         pKCw==
X-Forwarded-Encrypted: i=1; AJvYcCXf+1Xpw5faN5JbujiTbiu8grq53OeSvVJmbBFuhXEPd3sem1xzwr3sPmmef2GHiW2qmvqz721cCPW6AZ2eOMZ+Fq+kiGpK0jdiw64s9g==
X-Gm-Message-State: AOJu0YyMcVY7IEMXRFMR8qhF7yYNFqbIe/sAHydhE8T6oM3S0y74Dhi7
	s40Is3crcUboYRZW0h2gjbpYFQk6jCAa8261PxrtA/PLhXjGOFJ2e15QGPT1/qI=
X-Google-Smtp-Source: AGHT+IES0flyaPsDqcItqmrdcMlT/9HhmNC59nIBd1+qe6iKBoJLQjAdExVi7n8xHc0r8DPQuGmsnQ==
X-Received: by 2002:a17:906:fd89:b0:a52:24b7:b4fc with SMTP id xa9-20020a170906fd8900b00a5224b7b4fcmr9643955ejb.72.1713252616011;
        Tue, 16 Apr 2024 00:30:16 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id h14-20020a1709070b0e00b00a518c69c4e3sm6421654ejl.23.2024.04.16.00.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:30:15 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:30:11 +0300
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
Subject: Re: [PATCH 06/35] media: stm32-dcmipp: Remove redundant printk
Message-ID: <cd4aac19-c4cf-4db0-a18c-42f1bf1441a8@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-6-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:23PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error message.
> 
> Found by cocci:
> drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c:444:3-10: line 444 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> index bce821eb71ce..c25027b0ca32 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
> @@ -439,11 +439,8 @@ static int dcmipp_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq <= 0) {
> -		if (irq != -EPROBE_DEFER)
> -			dev_err(&pdev->dev, "Could not get irq\n");
> +	if (irq <= 0)
>  		return irq ? irq : -ENXIO;

platform_get_irq() can never return zero so this should be written as:

	irq = platform_get_irq(pdev, 0);
	if (irq < 0)
		return irq;

There is a comment next to platform_get_irq() which documents this.

regards,
dan carpenter


