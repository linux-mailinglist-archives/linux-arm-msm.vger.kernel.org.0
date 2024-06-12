Return-Path: <linux-arm-msm+bounces-22485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E2890592B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 18:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7BCC280A83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Jun 2024 16:52:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29339181BAE;
	Wed, 12 Jun 2024 16:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YO5rrW6S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3883317D8B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 16:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718211158; cv=none; b=Lc96r5HI9H41X4/c8I/T0erB5J54Nt9i6BBYFOXow01ZMYSRlaTY249/RG7wZ7hGECvMFT6LNc0FkBCcspFZ01Vo/HTA4hnzzkSfhyp0mPUDSXOzWquQZPK8E443by7Qp/5v7SktxImIMGbtIfzEuSNU5IszGBuTBP3ieIY999A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718211158; c=relaxed/simple;
	bh=jRX/qmYoXzdSA82UM/SQtEUSzxcGm6kdQYYm8JfMCZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRKCEmBS/Nu7I7PV+3TGrsW+9iE29M93XiK6KgEnFKTBmGP8dnnx0WTo5yJ/06657q5exdWO/wkqlMJHE88WvZAWZB8cMo1lefY6XeNZFnVDBGqhDnJGsV8pcCG8qFOLKb7xRJoCyRBju3hw0QDs3WiIDpARur1Dv72E/moqYWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YO5rrW6S; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso141258e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Jun 2024 09:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718211154; x=1718815954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/8+8Gla6AFGKe6u8TRpUpXCdyZGzOpD/BKCYPlj+J4g=;
        b=YO5rrW6SZuzmmcQxQJR9tFODND8jF/qNAuGKMnehKpEs9ESIc5Tt16ckqHd3Y3wWZT
         rSIiWvEgy5sas+iytoXYgei7ShxkojocUtGU3vm81Zo5yWOY8wbz3+gBzG/Kj31H8F3+
         R2WzY/iH9uMUzcxR6hIGkNs/2t5p6W/nH1mpOg7vASrOjs/ACeIX6vyjB+Cwg10EK+KY
         Hu9KJTDcCT3qKinwSLma/MDXDZXwVMYN1hd9NLHEH+mTf8g8VVvyrYxebl1UQs8ArCnJ
         a3KJMCI0Ko0xJ07Z+AZeKUHagKyFYnz1t6Q7np/hAWXh8DkJOouWeQ1ZEQa7xLEnXKRD
         buxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718211154; x=1718815954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8+8Gla6AFGKe6u8TRpUpXCdyZGzOpD/BKCYPlj+J4g=;
        b=lBX3rS8ostGkL9l1yWPlqmQkbNs0ttlDsWXbZCUVj7m9kvyH2aWuG/WxlkLcpMrX/5
         /FZv31vsfZDSPAR1hKUmedqQS+G5GIkeAoTzjHVK2tXZFwmDGIifzHIyUNK8w2G3tRD7
         jKBLHuAGMdtKM0IjGVrdq4RsUX502PoEw/2XU7vRbhcV2pefglY8K5Q7PbfmlySb0M3x
         4YB04t/8fvTZ6WzUfR11XpZrCEqpUAgL6kcmc5rHuoTuHm0g8uAiPF+6cgRZtqmr5otZ
         9kw012qBXg6dxYU3DUb4rt1EilUA7xsFv7XGijQTA+vLlBRWhlRAXYHeOiN7ZMzOeDYU
         BeSw==
X-Forwarded-Encrypted: i=1; AJvYcCUbbqG9vMLIljKr0G41wSfQiGpkjwh4Cj3t18ZErW5rGQvb4zXLrVnyOZLq0BeyHV7Zm7nr1YZKa6BCx6t/0BiiPbt1WC7FDrxZgf9FcA==
X-Gm-Message-State: AOJu0YwZix69/GFBxYB3TUDQ6kQI+YlWuI1C/DT/jepvlKHh6IhSL0jL
	B33Sd6KEJ4up3rIp2RTCUs4Iw7Ezjfuu1o7eEBscebdXyIgQbwvJcH/F2AFtb9k=
X-Google-Smtp-Source: AGHT+IGcj+8quoP+rn9xJZv2GbaS/NGKXyw6z9f4EKby7freNcstjI0Qc26l47+qfOvgAnsTfTdQ9Q==
X-Received: by 2002:ac2:562a:0:b0:52c:831d:7eb3 with SMTP id 2adb3069b0e04-52c9a3c74b7mr1518949e87.18.1718211154244;
        Wed, 12 Jun 2024 09:52:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423db7dsm2552326e87.224.2024.06.12.09.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 09:52:33 -0700 (PDT)
Date: Wed, 12 Jun 2024 19:52:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com, 
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	krzk+dt@kernel.org, neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
Message-ID: <mpm4pmt5ieofmpxmq5putvytyuiepbmnv5flsfqiwbtc54sb6k@jpoeaeojzzis>
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
 <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
 <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>

On Wed, Jun 12, 2024 at 03:37:56PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 07/06/2024 12:03, Dmitry Baryshkov wrote:
> > On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
> > > From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > 
> > > LPASS Codec v2.5 has significant changes in the rx register offsets.
> > > Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
> > > after SM8450 have only Left working.
> > > 
> > > This patch adjusts the registers to accomdate 2.5 changes. With this
> > > fixed now L and R are functional on Headset playback.
> > > 
> > > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> > > ---
> > >   sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
> > >   1 file changed, 410 insertions(+), 155 deletions(-)
> > > 
> > > diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> > > index f35187d69cac..bb8ede0e7076 100644
> > > --- a/sound/soc/codecs/lpass-rx-macro.c
> > > +++ b/sound/soc/codecs/lpass-rx-macro.c
> > >   static int rx_macro_probe(struct platform_device *pdev)
> > >   {
> > > +	struct reg_default *reg_defaults;
> > >   	struct device *dev = &pdev->dev;
> > >   	kernel_ulong_t flags;
> > >   	struct rx_macro *rx;
> > >   	void __iomem *base;
> > > -	int ret;
> > > +	int ret, def_count;
> > >   	flags = (kernel_ulong_t)device_get_match_data(dev);
> > > @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   		goto err;
> > >   	}
> > > +	rx->codec_version = lpass_macro_get_codec_version();
> > 
> > What guarantees that VA macro has been probed already? If I'm not
> > mistaken, we might easily get a default '0' here instead of a correct
> > version.
> 
> fsgen(Frame sync gen) clk is derived from VA macro, so if we are here that
> means the va macro is probed.

Is this written in stone or is it just a current way how these codecs
are connected?

> > > +	switch (rx->codec_version) {
> > > +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
> > > +		rx->rxn_reg_offset = 0xc0;
> > > +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> > > +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> > > +		if (!reg_defaults)
> > > +			return -ENOMEM;
> > > +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> > > +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> > > +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
> > > +		break;
> > > +	default:
> > > +		rx->rxn_reg_offset = 0x80;
> > > +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
> > > +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
> > > +		if (!reg_defaults)
> > > +			return -ENOMEM;
> > > +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
> > > +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
> > > +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
> > > +		break;
> > > +	}
> > > +
> > > +	rx_regmap_config.reg_defaults = reg_defaults,
> > > +	rx_regmap_config.num_reg_defaults = def_count;
> > > +
> > >   	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
> > >   	if (IS_ERR(rx->regmap)) {
> > >   		ret = PTR_ERR(rx->regmap);
> > > @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   	if (ret)
> > >   		goto err_clkout;
> > > +	kfree(reg_defaults);
> > >   	return 0;
> > >   err_clkout:
> > > @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
> > >   err_dcodec:
> > >   	clk_disable_unprepare(rx->macro);
> > >   err:
> > > +	kfree(reg_defaults);
> > >   	lpass_macro_pds_exit(rx->pds);
> > >   	return ret;
> > > -- 
> > > 2.21.0
> > > 
> > 

-- 
With best wishes
Dmitry

