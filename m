Return-Path: <linux-arm-msm+bounces-17545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF08A627E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 06:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8DC51C21812
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 04:39:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 281753A1BC;
	Tue, 16 Apr 2024 04:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cuePyVKv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CCD39AE3
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 04:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713242370; cv=none; b=diYuYmKbrMFblFfYtWS6nkT+ErxKBkkw/oHDc4gvjiP4iOQtf4vAW6He7kzkjgs5loNBkqaw/OUcOwMKn8crIR7NnprADUyEPO7evfxe8aj6isFnK4E3S5ZxBbjd5zkQWb08LR9h068EgRLG6PwgwJMmBjbtJvyFdQ++N+BpCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713242370; c=relaxed/simple;
	bh=5PbOnqT31q7bJvtyCBHwTsPiD0wb0iv6/vtz4oxAlr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ms9PgHgU6vK2Xi5kfy/jPPqOC+rhR8n+gAqs7sj9rAXvdxj2WaCvEpd9zmdwOP5VWfEi7KBQ5D9lA+bLuHXnPqVdWwrZuYumKd7vnHkQ4edjHxvmFUybWQ3eaCWBiFERKOAdUSAZuMoQDoQtx81mGy+HUynODRAy1lRuXOsM+8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cuePyVKv; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6ea26393116so3227809a34.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Apr 2024 21:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713242367; x=1713847167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=cuePyVKv3DGJ/nFLG5QvC8sL/8WdTgU3tN86JAmS+BbM6GTJL+xezvrAsWBOz/FuQd
         0GBe+QYEyRgxZldi4iMrKxhsB8TBfrKP+3JkeOAErxyDJh0nfEMwq06aW8R6V2klvRgb
         Ro3PkrUva+VL5EFN6RRyVcCyCZxWLx1jnYW3w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713242367; x=1713847167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSyiMdTHrk1JwFRWNfMWMCAnJIqFPtjB/dNBg4kU2zU=;
        b=xHXzKpfIRFM4TeIJgW3ahTdaT1RGPBm49ezZAW5FAwe+wEXYh/VErcQonDZuhV56cQ
         uDNgUrxMhXPp6R50iZHcQXu2AXHeVd4J3GzbLM/ENnjnEDCKXx0iT4YHu96led6uZeFn
         Fa9w9z6/qr9mM3FNXzjLpZOSBcJ1MmsTYcnOb7FkqjJD5IYDD3nAIL04Pw7YswJAOaWx
         wjiF2ZcuIdL63jX29S4ViC4KJTDqJmTmHM/tCAA/yPYcCpr6lD0jz5WD7WqwSdorPh4B
         7MUFP2ezBHgJ511xamnzI42UqvmVrSkQyZUG9Ml0G715YRgP3CsDc5mCsDHPvcrxq9Eg
         7/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXpCRdAKr3H8C2xyluxeYSsMYKegt6b5Tl2z52vQisZGur5lbo+6Uxg4FTOFi/JvHoN6/+9exqGCF4S9/H2iggUincXtpX5NJ8VPY/LBQ==
X-Gm-Message-State: AOJu0Yw/TetfWVZb2wH30RCFDKSi6m+NkWgOE64qS7n9HbmfwCOKgeIS
	FxaoFOj5ofkXhtu/7MxSQ+IH/osZ/x7LGEFXcOgSlxyNzHvaZwB75dSWrU6hfg==
X-Google-Smtp-Source: AGHT+IG0ppjZwpHlNVZUS9DrO9z9Zt+G6PVBJT/QRsW763QY2rUFepRZ7LeeiLPVtOHJ43Afq2vK7g==
X-Received: by 2002:a9d:7f8a:0:b0:6ea:23af:2bcb with SMTP id t10-20020a9d7f8a000000b006ea23af2bcbmr12688528otp.32.1713242366850;
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:1137:d3d7:a09d:5379])
        by smtp.gmail.com with ESMTPSA id b65-20020a633444000000b005dccf48e2a5sm7898637pga.54.2024.04.15.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:39:26 -0700 (PDT)
Date: Tue, 16 Apr 2024 13:39:16 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
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
Subject: Re: [PATCH 03/35] media: uvcvideo: Refactor iterators
Message-ID: <20240416043916.GA14947@google.com>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-3-477afb23728b@chromium.org>

On (24/04/15 19:34), Ricardo Ribalda wrote:
[..]
> @@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
>  int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	struct uvc_xu_control_query *xqry)
>  {
> -	struct uvc_entity *entity;
> +	struct uvc_entity *entity, *iter;
>  	struct uvc_control *ctrl;
>  	unsigned int i;
>  	bool found;

Is `found` still used?

> @@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
>  	int ret;
>  
>  	/* Find the extension unit. */
> -	found = false;
> -	list_for_each_entry(entity, &chain->entities, chain) {
> -		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
> -		    entity->id == xqry->unit) {
> -			found = true;
> +	entity = NULL;
> +	list_for_each_entry(iter, &chain->entities, chain) {
> +		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
> +		    iter->id == xqry->unit) {
> +			entity = iter;
>  			break;
>  		}
>  	}
>  
> -	if (!found) {
> +	if (!entity) {
>  		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
>  			xqry->unit);
>  		return -ENOENT;

