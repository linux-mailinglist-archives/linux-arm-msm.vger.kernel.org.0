Return-Path: <linux-arm-msm+bounces-35363-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD389A9C96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 10:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B6E9283B7E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 08:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E6AF193092;
	Tue, 22 Oct 2024 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DjTlnATo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31040191F8D
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585777; cv=none; b=WhlrpUbGhgMAnTJt7ufPqnRoblkcRS7rSTnXcwWEqztvqLVSshbCYewvHtXj/NCAcRoU8gjKKVZwoc119hhrQGFZ7OJxmFxAuCFcNpWssJtOYBy6E2XjyFP8LpAWFRShIMXPQgy/f2cAolJD4DD786VF+RiXWClHIYw23mLF+oE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585777; c=relaxed/simple;
	bh=bEKAEeDjsfkpr3NXf7w6RwcSc/+oBytWAMh+Aw1PHdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sU5VsZ9ppKg2yW5KxFlgsixK9sKAdHBfdgBaaKSLAeWq3EwsWrWpQZkwIe9gLMJ09uxd3V2AStLIaQ8dC1eTQyNpoD76X/dJNMVzegIfHLbwBxG9lMF9aWJtLMbftl73vnVrt7/DnHh6rZlIIKZAtxGUJkNYEEBYvA6W3ubpLzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DjTlnATo; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so40568195e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Oct 2024 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729585773; x=1730190573; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HjDsS+1q07DHK+ymYm6GkZX2xnCRVZpDlWCzY/btsRo=;
        b=DjTlnATopK3LAp4B+C7Lk76+DAinha90NdCnVnQY/xXsMir7sYe5t56DdeiHZPFx2+
         Yau/n7vbH1PERND7D294K7K4kCGXC9p9HFvrEsYIQgEgQwGcc9hU4QrF+n72wzeKxoB0
         awVEp/AKsbyrmvUlw5IVfK67HVCNe+Zo2HP8ASKXaewTD0vBjJEj2gH9wxAe7FFsbbp/
         okyCF9Wj9zPDc4n8ZagzYM/TTZmhvRx6V3Pn4XKs/g6zCkGOmvUGb0ktevi05/NFG4Ld
         KxJcgV49nze9F0/pUSVmwwAYHiOvi2Sf3N7FQWpDhK8/2W+e+2ipT+aFKmPJhYPLiMDI
         k03A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585773; x=1730190573;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HjDsS+1q07DHK+ymYm6GkZX2xnCRVZpDlWCzY/btsRo=;
        b=FU5S45tnNfXGzbe6Ri2kiGhtgOP6VpvFJ1Gy96CVLT7HwEr73h2pqWSC/Q08A6vO6L
         LuGmgxR4ATsNxVcvngGAXSqHWaL1C8XBnlf7z2VPhnIPPQe/QhfTCZTZwLIb1Ylw5BWr
         NN+IK0tM8tSa+T8+E/91xR0XgzxgIj6RgJzA+AZKzV08aM4SvDEAlEJhvJkCTjXEYkYA
         KSAhjSjwdJaI8lRiaKfukr/eyQspMnZ8Jj+hnARLrclmw7s39KQ+QE5MSbUf7ftp/QKp
         M27dW9NcHHEPBOQH5NAr8fAF4QMsWhiBtbhVrbgx4ip8i5OM6ajwLXPeJT4bKNDP2CAJ
         mUiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv1iPcxDxtH/jN+NCJyD/ZA/tKZrG/hSOJMWmbXjUMl+8ly2xLlI/nUKaHRjZ8NGQHKINpou/w1NB53VDg@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg6q9r3+ZnCAcm6Clk5OWaDgEDfZUG5yc/Mvap4VDbQVpDQuti
	1cIcwbRxchaEeWLFWzEVR3S7yTBFou+5tgVE963eb9TWRGP7f9CSlbt0ccKlPPo=
X-Google-Smtp-Source: AGHT+IE+SNDjL4952t77e0RAt7JLi2MDieoW4JvDW20v/QUsIp9vmzVn/LMvIVc+mnRMKtbJnNHGnQ==
X-Received: by 2002:a05:600c:3151:b0:431:588a:4498 with SMTP id 5b1f17b1804b1-4317b8dfcfcmr23701415e9.14.1729585773420;
        Tue, 22 Oct 2024 01:29:33 -0700 (PDT)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c2cb8sm82100105e9.31.2024.10.22.01.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 01:29:32 -0700 (PDT)
Date: Tue, 22 Oct 2024 11:29:30 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Trilok Soni <quic_tsoni@quicinc.com>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <ZxdialY3h9YW2NdL@linaro.org>
References: <20241004-x1e80100-ps8830-v2-0-5cd8008c8c40@linaro.org>
 <20241004-x1e80100-ps8830-v2-2-5cd8008c8c40@linaro.org>
 <133f0232-6e62-4532-bdeb-85b5927fddc8@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <133f0232-6e62-4532-bdeb-85b5927fddc8@wanadoo.fr>

On 24-10-22 09:41:42, Christophe JAILLET wrote:
> Le 04/10/2024 à 15:57, Abel Vesa a écrit :
> > The Parade PS8830 is a Type-C muti-protocol retimer controlled over I2C.
> > It provides both altmode and orientation handling.
> > 
> > Add a driver with support for the following modes:
> >   - DP 4lanes
> >   - DP 2lanes + USB3
> >   - USB3
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> 
> Hi,
> 
> > +static int ps8830_retimer_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev = &client->dev;
> > +	struct typec_switch_desc sw_desc = { };
> > +	struct typec_retimer_desc rtmr_desc = { };
> > +	struct ps8830_retimer *retimer;
> > +	int ret;
> > +
> > +	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
> > +	if (!retimer)
> > +		return -ENOMEM;
> > +
> > +	retimer->client = client;
> > +
> > +	mutex_init(&retimer->lock);
> > +
> > +	retimer->regmap = devm_regmap_init_i2c(client, &ps8830_retimer_regmap);
> > +	if (IS_ERR(retimer->regmap)) {
> > +		dev_err(dev, "failed to allocate register map\n");
> > +		return PTR_ERR(retimer->regmap);
> > +	}
> > +
> > +	ret = ps8830_get_vregs(retimer);
> > +	if (ret)
> > +		return ret;
> > +
> > +	retimer->xo_clk = devm_clk_get(dev, "xo");
> > +	if (IS_ERR(retimer->xo_clk))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> > +				     "failed to get xo clock\n");
> > +
> > +	retimer->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(retimer->reset_gpio))
> > +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +
> > +	retimer->typec_switch = fwnode_typec_switch_get(dev->fwnode);
> > +	if (IS_ERR(retimer->typec_switch)) {
> > +		dev_err(dev, "failed to acquire orientation-switch\n");
> > +		return PTR_ERR(retimer->typec_switch);
> > +	}
> > +
> > +	retimer->typec_mux = fwnode_typec_mux_get(dev->fwnode);
> > +	if (IS_ERR(retimer->typec_mux)) {
> > +		dev_err(dev, "failed to acquire mode-mux\n");
> > +		goto err_switch_put;
> > +	}
> > +
> > +	sw_desc.drvdata = retimer;
> > +	sw_desc.fwnode = dev_fwnode(dev);
> > +	sw_desc.set = ps8830_sw_set;
> > +
> > +	ret = drm_aux_bridge_register(dev);
> > +	if (ret)
> > +		goto err_mux_put;
> > +
> > +	retimer->sw = typec_switch_register(dev, &sw_desc);
> > +	if (IS_ERR(retimer->sw)) {
> > +		dev_err(dev, "failed to register typec switch\n");
> > +		goto err_aux_bridge_unregister;
> > +	}
> > +
> > +	rtmr_desc.drvdata = retimer;
> > +	rtmr_desc.fwnode = dev_fwnode(dev);
> > +	rtmr_desc.set = ps8830_retimer_set;
> > +
> > +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> > +	if (IS_ERR(retimer->retimer)) {
> > +		dev_err(dev, "failed to register typec retimer\n");
> > +		goto err_switch_unregister;
> > +	}
> > +
> > +	ret = clk_prepare_enable(retimer->xo_clk);
> > +	if (ret) {
> > +		dev_err(dev, "failed to enable XO: %d\n", ret);
> > +		goto err_retimer_unregister;
> > +	}
> > +
> > +	ret = ps8830_enable_vregs(retimer);
> > +	if (ret)
> > +		goto err_clk_disable;
> > +
> > +	/* delay needed as per datasheet */
> > +	usleep_range(4000, 14000);
> > +
> > +	gpiod_set_value(retimer->reset_gpio, 1);
> > +
> > +	return 0;
> > +
> > +err_clk_disable:
> > +	clk_disable_unprepare(retimer->xo_clk);
> > +
> > +err_retimer_unregister:
> > +	typec_retimer_unregister(retimer->retimer);
> > +
> > +err_switch_unregister:
> > +	typec_switch_unregister(retimer->sw);
> > +
> > +err_aux_bridge_unregister:
> > +	gpiod_set_value(retimer->reset_gpio, 0);
> 
> Is this called useful here?
> gpiod_set_value(, 1) has not been called yet.
> 
> It made sense to have something like that in v1, but it looks strange in v2.
> 

The devm_gpiod_get() flag sets it to HIGH.

Anyway, this will be reworked in v3 as the reset gpio is active low.

> CJ
> 
> > +	clk_disable_unprepare(retimer->xo_clk);
> > +
> > +err_mux_put:
> > +	typec_mux_put(retimer->typec_mux);
> > +
> > +err_switch_put:
> > +	typec_switch_put(retimer->typec_switch);
> > +
> > +	return ret;
> > +}
> 
> ...

