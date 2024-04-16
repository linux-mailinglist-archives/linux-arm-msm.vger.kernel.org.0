Return-Path: <linux-arm-msm+bounces-17564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D64608A6539
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 09:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E502C1C20753
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Apr 2024 07:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052166F069;
	Tue, 16 Apr 2024 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9+WlSdS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C861DFEA
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 07:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713253041; cv=none; b=Le5vTnWjWwdBBnOwmHzdmufg0nq2RtSBCPOS+RNrVrTT9CsuC8EobTWXj7wbbCbI8iTDIkHKajpd+C82jq7dnd+r7JPorQV5Oy/l9pJVc1MAwM6b1Yw4GTLGUi9+Gt+mEem3opFr//kten1yfjCTLfSddOlBLuW1lIaT41pSQRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713253041; c=relaxed/simple;
	bh=BIpOJSTxOK0JfNqFwhleSJ0Efyt0sHPGszihSmkHs2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bLzikkkNYpcm4nWhWXlLXBvwL2K7SX+Qx2PwwZDdCE3Y8butPnhGL2WQHpetC6QbzVUzLsIW/OCzAZHb21d6Q/d9coE5oCuZkIpuNg5Yq3nzMZh+zoqmStvy/ITSjAz3z62wK7JmOAI2+/zIkt/Wj3xCYrmc3m2AgrMAOQSbSII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9+WlSdS; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4715991c32so516340266b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Apr 2024 00:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713253039; x=1713857839; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=b9+WlSdSiA5XyauSwQE5H9UMIrdQO+qgy9vXhMooxlkNWj7lPNWRENP1vRvJTZ48Jv
         Cmz3hPo4dfQoMFwERWiBfSnjJGHOf1O41S/J7g/ExXuusCXjX85bP8l1CfojFRt080Q+
         Ebt18aRnezj5aZdTWSNNjdALJ97ZEO3hyXgqBJx9CwbgU1TxaTBFw9YySmRzVCXtz4lG
         ye9WtUzkRUFrAJjYUnTAXeSH+VnbhKKwZ4Z0+QM7cRMj9DiehaeGohhS8IB1DTtIxf9l
         rBH5F9j2PkVWOUDer8bH+oKBql3Vc0AyQH7Yq2qg9aztgmQ8nluh0roA5IGZN8dBWW2Y
         iAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713253039; x=1713857839;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vz5EFUG61C/PsBsUPlDK2q+AUqaXZYNi38q3WlwiS3E=;
        b=xRC92s/JZ6w0fGm7QuRP2BNzP68JnTAYFBzCajIdQ3pUKrtiG/HB7UkBf/PjpX1BPa
         yd9MP3sNfkyL1FCJOrQ3GxqZm1HNvyIpUqCFgPICW4VTE3Oy1MunxjcQdJUaGTlW94PL
         3l6EmPWPszraz+lL5+Hubp7NSY/6L+XTJ3RpHxmxT5FSAyrayKrVLBYP1qY11Em1Tzg0
         FMf9cEZqHl8cLT4yyFu/ESWJ44TG6rI3+opgSXiINanto9zpR+W05Z3kTZHfzjZ2C+Hg
         DD/bHMrWSDd41R0UQbLyPv585aboDOmLsarYu1HpsCg90DxwaKi1wVbwMwQnvgbsgkwL
         eO3w==
X-Forwarded-Encrypted: i=1; AJvYcCXFL9+SVbAeuRkBBcRDZE2J3LK4ouyzrBdKNgqV4osdvW+u7DgAaaeEgve8NYhuaU6WqBIDH0sNukomJr3Zb275N8/yZqITu33Tj75Xmg==
X-Gm-Message-State: AOJu0YzEw4cXqAihIOzFutL3p6corQEX4Tptw2nt+/vDH9NixyBFpnhX
	PgY+9ZF37vkUfgRB97/6WccADcKuUS+e2JZnsu6F0S7gQ70NY3l1BXS44TySfKw=
X-Google-Smtp-Source: AGHT+IF7djK9Gp7QvHWuOZzhp3iyt4a4kh6gE+5Chee7fTPBiXusYHzH5iP8LrBy89Sq7/Zoad7L6g==
X-Received: by 2002:a17:906:3488:b0:a52:e86:ae62 with SMTP id g8-20020a170906348800b00a520e86ae62mr7767532ejb.54.1713253038496;
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gt43-20020a1709072dab00b00a5242ec4573sm4507206ejc.29.2024.04.16.00.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 00:37:18 -0700 (PDT)
Date: Tue, 16 Apr 2024 10:37:14 +0300
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
Subject: Re: [PATCH 07/35] media: staging: sun6i-isp: Remove redundant printk
Message-ID: <b8a5cc23-240f-4fe9-9b25-b534f618506e@moroto.mountain>
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240415-fix-cocci-v1-7-477afb23728b@chromium.org>

On Mon, Apr 15, 2024 at 07:34:24PM +0000, Ricardo Ribalda wrote:
> platform_get_irq() already prints an error for us.
> 
> Found by cocci:
> drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c:389:2-9: line 389 is redundant because platform_get_irq() already prints an error
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> index 5c0a45394cba..a6424fe7023b 100644
> --- a/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> +++ b/drivers/staging/media/sunxi/sun6i-isp/sun6i_isp.c
> @@ -386,7 +386,6 @@ static int sun6i_isp_resources_setup(struct sun6i_isp_device *isp_dev,
>  
>  	irq = platform_get_irq(platform_dev, 0);
>  	if (irq < 0) {
> -		dev_err(dev, "failed to get interrupt\n");
>  		ret = -ENXIO;

This is more fall out from when irq functions used to return zero (16
years ago).  Instead of ret = -ENXIO, set ret = irq.

regards,
dan carpenter

