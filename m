Return-Path: <linux-arm-msm+bounces-63290-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE2AF052E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 22:56:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D37253A5200
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 20:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E67D72FE33C;
	Tue,  1 Jul 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kbWFsTLK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B638E266560;
	Tue,  1 Jul 2025 20:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403383; cv=none; b=XwucOHVMfJXGSjNhUMPIBJJUJgGxpgQDOH2cIBwUb3hjGI91N64EwQkWUqSSRpRHxGoJxa8GfD0ZOJeKK7EsXwc1DQK/p4B+yXcL68ITuiIO+88fLkXZU/Pow0dqmbxyQaFp4qSb3FeCgDyKDOp8/HqN/GjEe8s1Zheku1eZ81E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403383; c=relaxed/simple;
	bh=y5wwDYXuc6Vw2z4nsQx8Z6oOr8liqV38GCIpo1HQsuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXtKeeKUJRJRfLrmf0tVzFCrx5oN0AiVThMNrh9dzVDF/pUQhStDGBsjQThCNd/LYenUAYQW/ZkNcx2eEPnEzyVl9apM7Kl1oEOu48ZDiCR7t1ePMIQMIGl3U4lPNYhTLkg0VfXrR13L+l9j9BX53Ca9p+pZZ4O65U67hPQHKV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kbWFsTLK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DD7C4CEEB;
	Tue,  1 Jul 2025 20:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751403383;
	bh=y5wwDYXuc6Vw2z4nsQx8Z6oOr8liqV38GCIpo1HQsuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbWFsTLKXGAe7ycsuFsAOLYv4wrMjHzmUmFG01DNYp/nlLcmt9NwIr7BEvSl2HEgC
	 VO65bTmvJdPY3be1brPOWRSF6GfBXTWGPqHKyZaW/zwCUPF3lsBEaaKhEWckMaD8qv
	 awxor2r1H6LZ+Hbp8Qc3iNk2KFfuuTyXFB2NK7drHSj2AU1U6z+4TNEUSm4xeWVnti
	 JoaNmme0FQ4yoLnShN25h9yzcS1ymUQhPy/sfgDo4/INQsCHFYmgK/yMaibr2WizS1
	 5pCwqTXkJ8Pv4qokQH/iuCz/4MwRX1r1qN4VIRo5ZFksgD0NjTSir+PvUKlgq8rpQk
	 QRFy6MP+oSqRQ==
Date: Tue, 1 Jul 2025 15:56:20 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, jarkko.nikula@linux.intel.com, linux-i3c@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frank.Li@nxp.com, wsa+renesas@sang-engineering.com, alok.a.tiwari@oracle.com, 
	konradybcio@kernel.org
Subject: Re: [PATCH v6 2/3] i3c: master: Add Qualcomm I3C controller driver
Message-ID: <h4c5oybkuxf2wmja2osm73ntpolx2ap3csskipbuyoks6xtdsi@5ihhj6ztn7mq>
References: <20250701071852.2107800-1-mukesh.savaliya@oss.qualcomm.com>
 <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701071852.2107800-3-mukesh.savaliya@oss.qualcomm.com>

On Tue, Jul 01, 2025 at 12:48:51PM +0530, Mukesh Kumar Savaliya wrote:
> Add support for the Qualcomm I3C controller driver, which implements
> I3C master functionality as defined in the MIPI Alliance Specification
> for I3C, Version 1.0.
> 
> This driver supports master role in SDR mode.
> 
> Unlike some other I3C master controllers, this implementation
> does not support In-Band Interrupts (IBI) and Hot-join requests.

I believe the capitalization of the last feature is "Hot-Join"

It's not entirely clear from this sentence if it's the controller or the
driver that doesn't support these features. Please update to make it
clear.

[..]
> diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> index 3e97960160bc..0e3ad9d96424 100644
> --- a/drivers/i3c/master/Makefile
> +++ b/drivers/i3c/master/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_CDNS_I3C_MASTER)		+= i3c-master-cdns.o
> +obj-$(CONFIG_I3C_QCOM_GENI)		+= i3c-qcom-geni.o
>  obj-$(CONFIG_DW_I3C_MASTER)		+= dw-i3c-master.o
>  obj-$(CONFIG_AST2600_I3C_MASTER)	+= ast2600-i3c-master.o
>  obj-$(CONFIG_SVC_I3C_MASTER)		+= svc-i3c-master.o
> diff --git a/drivers/i3c/master/i3c-qcom-geni.c b/drivers/i3c/master/i3c-qcom-geni.c
[..]
> +
> +struct geni_i3c_i2c_dev_data {
> +	u32 ibi_keeping;  /* Plan to save IBI information, keep as dummy for now */

Commit message says that QUP doesn't support IBI, so what is this?

Also, why "keep as dummy"?

> +};
> +
[..]
> +static void qcom_geni_i3c_conf(struct geni_i3c_dev *gi3c, enum i3c_bus_phase bus_phase)
> +{
> +	const struct geni_i3c_clk_settings *clk_idx = gi3c->clk_cfg;
> +	unsigned long freq;
> +	u32 val, dfs_idx;
> +	int ret;
> +
> +	if (bus_phase == OPEN_DRAIN_MODE)
> +		clk_idx = gi3c->clk_od_cfg;
> +
> +	ret = geni_se_clk_freq_match(&gi3c->se, clk_idx->clk_src_freq,
> +				     &dfs_idx, &freq, false);
> +	if (ret)
> +		dfs_idx = 0;
> +
> +	writel_relaxed(dfs_idx, gi3c->se.base + SE_GENI_CLK_SEL);
> +
> +	val = FIELD_PREP(CLK_DIV_VALUE_MASK, clk_idx->clk_div);
> +	val |= SER_CLK_EN;
> +	writel_relaxed(val, gi3c->se.base + GENI_SER_M_CLK_CFG);
> +
> +	val = FIELD_PREP(I2C_SCL_HIGH_COUNTER_MASK, clk_idx->i2c_t_high_cnt);
> +	val |= FIELD_PREP(I2C_SCL_LOW_COUNTER_MASK, clk_idx->i2c_t_low_cnt);
> +	val |= FIELD_PREP(I2C_SCL_CYCLE_COUNTER_MASK, clk_idx->i2c_t_cycle_cnt);
> +	writel_relaxed(val, gi3c->se.base + SE_I2C_SCL_COUNTERS);
> +
> +	writel_relaxed(clk_idx->i3c_t_cycle_cnt, gi3c->se.base + SE_I3C_SCL_CYCLE);
> +	writel_relaxed(clk_idx->i3c_t_high_cnt, gi3c->se.base + SE_I3C_SCL_HIGH);
> +
> +	writel_relaxed(M_IBI_IRQ_IGNORE, gi3c->se.base + SE_GENI_HW_IRQ_IGNORE_ON_ACTIVE);
> +
> +	val = M_IBI_IRQ_PARAM_STOP_STALL | M_IBI_IRQ_PARAM_7E;
> +	writel_relaxed(val, gi3c->se.base + SE_GENI_HW_IRQ_CMD_PARAM_0);
> +
> +	writel_relaxed(M_IBI_IRQ_EN, gi3c->se.base + SE_GENI_HW_IRQ_EN);

Don't you want a non-relaxed write here, to clarify that the ordering of
this write and the previous are significant?


As above, the commit message says the controller doesn't do IBI, so why
are we enabling IBI interrupts? (Just guessing based on the IRQ names)

> +}
> +
[..]
> +static int geni_i3c_master_attach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i2c_dev_set_master_data(dev, data);

As far as I can tell, the master_data is private to the controller
driver, and the only thing I can find you do with it to free it again on
detach.

Am I missing something or can these 4 optional functions be removed?

> +
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i2c_dev(struct i2c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i2c_dev_get_master_data(dev);
> +
> +	i2c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +
> +static int geni_i3c_master_attach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data;
> +
> +	data = kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	i3c_dev_set_master_data(dev, data);
> +
> +	return 0;
> +}
> +
> +static void geni_i3c_master_detach_i3c_dev(struct i3c_dev_desc *dev)
> +{
> +	struct geni_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
> +
> +	i3c_dev_set_master_data(dev, NULL);
> +	kfree(data);
> +}
> +

Regards,
Bjorn

