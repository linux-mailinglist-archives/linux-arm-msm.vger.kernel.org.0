Return-Path: <linux-arm-msm+bounces-35427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A55D89AB07D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 16:12:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E40FB1F21C99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 14:11:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FBAC19F47E;
	Tue, 22 Oct 2024 14:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faZ/P8XJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE0C19E96A;
	Tue, 22 Oct 2024 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729606313; cv=none; b=sTFID2yP+1LBacYvpeUdZYTIn2kmVGr6Jvqdvf5E5OcxjFqq/+VYR0jo2MVu981uxh41VxjTnVudQXrRYR8d8k3APXmE73EwBGZXypWJ+D4oAQAMOFN9MtsVaDP+j6C/i4GLmYJACSNU2sVEHLxsMcM4iFc82k37Qfr7O7GaTXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729606313; c=relaxed/simple;
	bh=98iJScxQ5+xWTfcAyb0DIQja42BOHYt0I6p6JMozmpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXepJhRrClyiGuWlNpuczFStxWiDpXZVww7ON3OmomtrnPts8o/hdmONkmWt+HDFjEDrFHT9WeGZIRJVBtOtgP8VxPhxCnR8crh1u51CQilUZ378Gp5aIivJiXAQhBHahpMPE8KfnykpFPlmkm1/91AxxoNnk9KFKp9w85of7VA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faZ/P8XJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729606311; x=1761142311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=98iJScxQ5+xWTfcAyb0DIQja42BOHYt0I6p6JMozmpY=;
  b=faZ/P8XJdXXwnVi7jihDA5t4IlXPjzCIif2FpZrlUIxWGfGo7AxZtcCJ
   Mc00Q9kCJBWnuU1i/Cb/IIKziGOZUsWcrWouLLaiZ0RCe2waICP7Yq4G0
   dHwLlfOftT1RP0+0knfuCIElKrK+xgZ2TUXRN2WUDFAF5qidf/5ojIn3o
   npaYAAz1OsyvKyOwFqm7Z+OjCUxcwlK4gA0dC2OcnFYBgFxb6IjCCJr5s
   xxvs8AwTpAcr5ZUqYzra7+ITvDq+1ytHg7GYJyVD7kNFVYhyRVK0CUYm4
   pw5nWEg8uiYy745A8pYHZ1xgPDyc3PDp8mVdjSzODQFiQyrzQBVQE9HqK
   w==;
X-CSE-ConnectionGUID: JoENZd9GSHWWaie42rLh0w==
X-CSE-MsgGUID: RGxeN4xOQNKixWEFm+VDrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="39761579"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="39761579"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 07:11:50 -0700
X-CSE-ConnectionGUID: La+zPVeBSeOmWFkXwGEz8Q==
X-CSE-MsgGUID: EGreTNpuRkiixkh4YmEXrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="83862597"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa003.fm.intel.com with SMTP; 22 Oct 2024 07:11:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 22 Oct 2024 17:11:45 +0300
Date: Tue, 22 Oct 2024 17:11:45 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v3 2/4] usb: typec: Add support for Parade PS8830 Type-C
 Retimer
Message-ID: <ZxeyoRYPZP3Feg6T@kuha.fi.intel.com>
References: <20241022-x1e80100-ps8830-v3-0-68a95f351e99@linaro.org>
 <20241022-x1e80100-ps8830-v3-2-68a95f351e99@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-x1e80100-ps8830-v3-2-68a95f351e99@linaro.org>

Hi,

Couple of nitpicks.

On Tue, Oct 22, 2024 at 01:26:55PM +0300, Abel Vesa wrote:
> +static int ps8830_retimer_probe(struct i2c_client *client)
> +{
> +	struct device *dev = &client->dev;
> +	struct typec_switch_desc sw_desc = { };
> +	struct typec_retimer_desc rtmr_desc = { };
> +	struct ps8830_retimer *retimer;
> +	bool skip_reset = false;
> +	int ret;
> +
> +	retimer = devm_kzalloc(dev, sizeof(*retimer), GFP_KERNEL);
> +	if (!retimer)
> +		return -ENOMEM;
> +
> +	retimer->client = client;
> +
> +	mutex_init(&retimer->lock);
> +
> +	if (of_property_read_bool(dev->of_node, "ps8830,boot-on"))
> +		skip_reset = true;

        skip_reset = device_property_present(dev, "ps8830,boot-on");

> +	retimer->regmap = devm_regmap_init_i2c(client, &ps8830_retimer_regmap);
> +	if (IS_ERR(retimer->regmap)) {
> +		ret = PTR_ERR(retimer->regmap);
> +		dev_err(dev, "failed to allocate register map: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = ps8830_get_vregs(retimer);
> +	if (ret)
> +		return ret;
> +
> +	retimer->xo_clk = devm_clk_get(dev, "xo");
> +	if (IS_ERR(retimer->xo_clk))
> +		return dev_err_probe(dev, PTR_ERR(retimer->xo_clk),
> +				     "failed to get xo clock\n");
> +
> +	retimer->reset_gpio = devm_gpiod_get(dev, "reset",
> +					     skip_reset ? GPIOD_OUT_LOW : GPIOD_OUT_HIGH);
> +	if (IS_ERR(retimer->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(retimer->reset_gpio),
> +				     "failed to get reset gpio\n");
> +
> +	retimer->typec_switch = fwnode_typec_switch_get(dev->fwnode);

	retimer->typec_switch = typec_switch_get(dev);

> +	if (IS_ERR(retimer->typec_switch))
> +		return dev_err_probe(dev, PTR_ERR(retimer->typec_switch),
> +				     "failed to acquire orientation-switch\n");
> +
> +	retimer->typec_mux = fwnode_typec_mux_get(dev->fwnode);

	retimer->typec_mux = typec_mux_get(dev);

> +	if (IS_ERR(retimer->typec_mux)) {
> +		ret = dev_err_probe(dev, PTR_ERR(retimer->typec_mux),
> +				    "failed to acquire mode-mux\n");
> +		goto err_switch_put;
> +	}
> +
> +	sw_desc.drvdata = retimer;
> +	sw_desc.fwnode = dev_fwnode(dev);
> +	sw_desc.set = ps8830_sw_set;
> +
> +	ret = drm_aux_bridge_register(dev);
> +	if (ret)
> +		goto err_mux_put;
> +
> +	retimer->sw = typec_switch_register(dev, &sw_desc);
> +	if (IS_ERR(retimer->sw)) {
> +		ret = PTR_ERR(retimer->sw);
> +		dev_err(dev, "failed to register typec switch: %d\n", ret);
> +		goto err_aux_bridge_unregister;
> +	}
> +
> +	rtmr_desc.drvdata = retimer;
> +	rtmr_desc.fwnode = dev_fwnode(dev);
> +	rtmr_desc.set = ps8830_retimer_set;
> +
> +	retimer->retimer = typec_retimer_register(dev, &rtmr_desc);
> +	if (IS_ERR(retimer->retimer)) {
> +		ret = PTR_ERR(retimer->retimer);
> +		dev_err(dev, "failed to register typec retimer: %d\n", ret);
> +		goto err_switch_unregister;
> +	}
> +
> +	ret = clk_prepare_enable(retimer->xo_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to enable XO: %d\n", ret);
> +		goto err_retimer_unregister;
> +	}
> +
> +	ret = ps8830_enable_vregs(retimer);
> +	if (ret)
> +		goto err_clk_disable;
> +
> +	/* delay needed as per datasheet */
> +	usleep_range(4000, 14000);
> +
> +	if (!skip_reset)
> +		gpiod_set_value(retimer->reset_gpio, 0);
> +
> +	return 0;
> +
> +err_clk_disable:
> +	clk_disable_unprepare(retimer->xo_clk);
> +err_retimer_unregister:
> +	typec_retimer_unregister(retimer->retimer);
> +err_switch_unregister:
> +	typec_switch_unregister(retimer->sw);
> +err_aux_bridge_unregister:
> +	if (!skip_reset)
> +		gpiod_set_value(retimer->reset_gpio, 1);
> +
> +	clk_disable_unprepare(retimer->xo_clk);
> +err_mux_put:
> +	typec_mux_put(retimer->typec_mux);
> +err_switch_put:
> +	typec_switch_put(retimer->typec_switch);
> +
> +	return ret;
> +}

thanks,

-- 
heikki

