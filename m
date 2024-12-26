Return-Path: <linux-arm-msm+bounces-43419-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62E39FCD34
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 19:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 427F21632A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Dec 2024 18:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577E4145A17;
	Thu, 26 Dec 2024 18:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VyN3zGCu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E5118E1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 18:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735239200; cv=none; b=Lql4rfeRI3lvVMyCkK8FsZmaclWIekP6v/UebmxCr54PkOwVxnE/A88u9GFVPYRv9xqhk4w3pAo3ffcJgZX0bG+17CHjFutsRqFND3pnzxDXAPv1V4zAHSvKouNcQR+DDY4sEb+axo8sewp2kN8HmdIOaLMUF3v80grTibAceMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735239200; c=relaxed/simple;
	bh=13Z8GaRHU4/OT9CQhwEKHJIYxYX3FGNMThTdgKVmNl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukYyE95rJh9MBQQ3he/KOsp+XAjwBkLn2Jpnkb1to3ntHMSGPx9abm5UgiI2Nz7AqPLlmRmO0GF3QXurMTmvoygPug2han6SIoWU7VdNQTL6UPCH9US8XjnR+Ww791ETB3y+4AsIYTrLCknoE/I+Q4hgWzZI4ZodRdxttMyjxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VyN3zGCu; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3003c0c43c0so76304521fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Dec 2024 10:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735239196; x=1735843996; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a0OvlSSe3WP6bZwJY44cWLBcqnhffi0ZNEXsKquszlk=;
        b=VyN3zGCu8+2uyTFR+0sQUW/59qrE4Wt1HHcrZ86QjgozczUQL/sZHvYgZpB0pwTtcF
         D3V+GQbkbd/dSvQLcJUT4+40sAlbiRntbejVCDE4Ctk+Fm5+lh1S5xim4ZGjxPUvdeKw
         pIEW/w2j8sP9Zh/EKMeMfHUeONPyBTe0R6jRnevkyerZ1YcouJ26yZsVKxwXdG5vyOk+
         ExL4zZzZsDHcCDFygbpNkH9mCApbaZYyDNrYXzXUrp0PHNn7mzACi4vSU9prWniDXDJF
         3MKuRi4QOyTiMavOVuPNguiPHjnca3SqX9Pnu3GvOdrMRfvgg0a6YxzjcrYbz4fTXjeC
         2c/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735239196; x=1735843996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0OvlSSe3WP6bZwJY44cWLBcqnhffi0ZNEXsKquszlk=;
        b=s69HejbfRALT/NemSBQh+u3+wy53telFtUipdK/Iq6WnsXsYVkNT2hujWfE9hkpZvX
         GeNqgJetI9j3rj9BaWCRBTzQ5G6l9WgAh17+WL76M7pLIKEtKuRU0U8vn+/aJLc0rtvK
         +HW8x6shg6ZxXK+jMcPCg2aJgmcCQ0Np8suIGBdAdebeRwVrf5Vvl6NsyaztmhCIzDJH
         PnaExOAW+c7lMPD9kXF2+O1JLG3XkQWabN/B5DF0jelU+meYdq2RrH0IGaV5GWA3RAfO
         eWBcSMtm/rWmLEfzXEQBb4Uxp9bXG3YYDUJpO86I/YvxpIt8hjJ+M1tfsm0bqikq0TYM
         ktUg==
X-Forwarded-Encrypted: i=1; AJvYcCWdL8EeHhhLQqXK9jAyxQnvHaquakPEDWL3TSWAMUCny0DF8UQJjlWjDKWnJDyn0zn4wMxg7dLer/j9mHo4@vger.kernel.org
X-Gm-Message-State: AOJu0YxrUeXafn4dmgDGErtDccsc9R2gxrvwm7T5xgbTmQWALIfGWV/V
	WX5xiP5QY81zJxoZgqMfidwN2xbqzE+IS1rrpM0/iE+7AX0cs3d5Y9oOaAHtf6Lykku2RXfEIPR
	d
X-Gm-Gg: ASbGncvBcjr4y9qIIllUhStiP2Ff5ek8WiLRuDhDlT/I324r5pNJwRqcxJvjOgJ+cMJ
	TakBRXOuJn8nLncGmlsNZElem/tstnDutOvRT6aODQjR8+vYqnZfPnmC5SYNlnGz6MvL8ae3di1
	0YO7AsbbUPottedk1VqqkwWxqshXlFDJcP+kcFvX3pPMZAtfVeQatHlnDZz492yS7Fneuas2/SN
	WjdaPKnCf7+jMY0QJC31gBwQhV/LJyDwGw/TPlNCEsedltvKqnc3YoDtd1ecLUztiiqJuT6hLvg
	k31u6EYxwkypSJxOgaawgwT0WSIRvjUQA63j
X-Google-Smtp-Source: AGHT+IEZHIrAx82+O02n29SUq8mtNrxqhdAl+c2Di+B8VETON4JDoKRjzks0wD+mTfbVkrQ8dOGgJA==
X-Received: by 2002:a2e:be14:0:b0:302:1c90:58e8 with SMTP id 38308e7fff4ca-30468626193mr91659241fa.33.1735239195429;
        Thu, 26 Dec 2024 10:53:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b069f3csm23220331fa.88.2024.12.26.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 10:53:14 -0800 (PST)
Date: Thu, 26 Dec 2024 20:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>

On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> 
> 
> On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> > On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
> > > With the current DLL sequence stability issues for data
> > > transfer seen in HS400 and HS200 modes.
> > > 
> > > "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> > > data error 0"
> > > 
> > > Rectify the DLL programming sequence as per latest hardware
> > > programming guide and also incorporate support for HS200 and
> > > HS400 DLL settings using the device tree.
> > 
> > "foo also bar" usually points out that there should be two separate
> > commits.
> 
> Thanks for review. I will split it into two patches.
> 
> > 
> > > 
> > > Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> > > Signed-off-by: Jun Li <liju@codeaurora.org>
> > 
> > This is very strange and incorrect.
> 
> Thanks for review. I will fix the format.

Well. If you write that you will fix the format, may I ask, how or what
do you plan to fix?

> 
> > 
> > > ---
> > >   drivers/mmc/host/sdhci-msm.c | 372 +++++++++++++++++++++++++++++++++--
> > >   1 file changed, 353 insertions(+), 19 deletions(-)
> > > 
> > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > index 2a5e588779fc..4ecb362f7f2a 100644
> > > --- a/drivers/mmc/host/sdhci-msm.c
> > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > @@ -28,6 +28,7 @@
> > >   #define CORE_VERSION_MAJOR_SHIFT	28
> > >   #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
> > >   #define CORE_VERSION_MINOR_MASK		0xff
> > > +#define SDHCI_MSM_MIN_V_7FF		0x6e
> > >   #define CORE_MCI_GENERICS		0x70
> > >   #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> > > @@ -118,7 +119,8 @@
> > >   #define CORE_PWRSAVE_DLL	BIT(3)
> > >   #define DDR_CONFIG_POR_VAL	0x80040873
> > > -
> > > +#define DLL_CONFIG_3_POR_VAL	0x10
> > > +#define TCXO_FREQ               19200000
> > 
> > What about the platforms where TCXO has different frequency?
> > 
> 
> All emmc targets have 192 Mhz as TCXO freq.

So, it's not a TCXO freq, but some other base freq?

> 
> > >   #define INVALID_TUNING_PHASE	-1
> > >   #define SDHCI_MSM_MIN_CLOCK	400000
> > > @@ -256,6 +258,19 @@ struct sdhci_msm_variant_info {
> > >   	const struct sdhci_msm_offset *offset;
> > >   };
> > > +/*
> > > + * DLL registers which needs be programmed with HSR settings.
> > > + * Add any new register only at the end and don't change the
> > > + * sequence.
> > 
> > Why?
> 
> I will update the comment message in next patchset.

Well, you can respond to a question first. And once something is settled
you can get that to the commit message. It might save some round-trip
time.

> 
> > 
> > > + */
> > > +struct sdhci_msm_dll {
> > > +	u32 dll_config[2];
> > > +	u32 dll_config_2[2];
> > > +	u32 dll_config_3[2];
> > > +	u32 dll_usr_ctl[2];
> > > +	u32 ddr_config[2];
> > > +};
> > > +
> > >   struct sdhci_msm_host {
> > >   	struct platform_device *pdev;
> > >   	void __iomem *core_mem;	/* MSM SDCC mapped address */
> > > @@ -264,6 +279,7 @@ struct sdhci_msm_host {
> > >   	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
> > >   	/* core, iface, cal and sleep clocks */
> > >   	struct clk_bulk_data bulk_clks[4];
> > > +	struct sdhci_msm_dll dll;
> > >   #ifdef CONFIG_MMC_CRYPTO
> > >   	struct qcom_ice *ice;
> > >   #endif
> > > @@ -292,6 +308,17 @@ struct sdhci_msm_host {
> > >   	u32 dll_config;
> > >   	u32 ddr_config;
> > >   	bool vqmmc_enabled;
> > > +	bool artanis_dll;
> > > +};
> > > +
> > > +enum dll_init_context {
> > > +	DLL_INIT_NORMAL,
> > > +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
> > > +};
> > > +
> > > +enum mode {
> > > +	HS400, // equivalent to SDR104 mode for DLL.
> > > +	HS200, // equivalent to SDR50 mode for DLL.
> > >   };
> > >   static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> > > @@ -778,6 +805,210 @@ static int msm_init_cm_dll(struct sdhci_host *host)
> > >   	return 0;
> > >   }
> > > +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> > > +{
> > > +	return SDHCI_MSM_MIN_CLOCK;
> > > +}
> > 
> > Why??? Why do you need a function to return a static value?
> > 
> 
> This is just rearrangement of the function. This function already exist,
> moving here to avoid predeclaration.

Okay. 

> > > +
> > > +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> > > +{
> > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> > > +	unsigned int sup_clk;
> > > +
> > > +	if (req_clk < sdhci_msm_get_min_clock(host))
> > > +		return sdhci_msm_get_min_clock(host);
> > > +
> > > +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> > > +
> > > +	if (host->clock != msm_host->clk_rate)
> > > +		sup_clk = sup_clk / 2;
> > > +
> > > +	return sup_clk;
> > 
> > Why?
> 
> Sorry, I did not understand your question. Can you please explain in detail.

Please explain the maths. You get the rate from the clock, then you
round it, but it is the rate that has just been returned, so there
should be no need to round it. And after that there a division by two
for some reason. So I've asked for an explanation for that code.

> 
> > 
> > > +}
> > > +
> > > +/* Initialize the DLL (Programmable Delay Line) */
> > > +static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
> > > +				 init_context, enum mode index)
> > > +{
> > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > +	struct mmc_host *mmc = host->mmc;
> > > +	u32 ddr_cfg_offset, core_vendor_spec, config;
> > > +	void __iomem *ioaddr = host->ioaddr;
> > > +	unsigned long flags, dll_clock;
> > > +	int rc = 0, wait_cnt = 50;
> > > +
> > > +	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
> > > +	spin_lock_irqsave(&host->lock, flags);
> > > +
> > > +	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> > > +
> > > +	/*
> > > +	 * Always disable PWRSAVE during the DLL power
> > > +	 * up regardless of its current setting.
> > > +	 */
> > > +	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
> > > +	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
> > > +
> > > +	if (msm_host->use_14lpp_dll_reset) {
> > > +		/* Disable CK_OUT */
> > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > +		config &= ~CORE_CK_OUT_EN;
> > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +		/* Disable the DLL clock */
> > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > +		config |= CORE_DLL_CLOCK_DISABLE;
> > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Write 1 to DLL_RST bit of DLL_CONFIG register
> > > +	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
> > > +	 */
> > > +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > +	config |= (CORE_DLL_RST | CORE_DLL_PDN);
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/*
> > > +	 * Configure DLL_CONFIG_3 and USER_CTRL
> > > +	 * (Only applicable for 7FF projects).
> > > +	 */
> > > +	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
> > > +		writel_relaxed(msm_host->dll.dll_config_3[index],
> > > +				ioaddr + msm_offset->core_dll_config_3);
> > > +		writel_relaxed(msm_host->dll.dll_usr_ctl[index],
> > > +				ioaddr + msm_offset->core_dll_usr_ctl);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
> > > +	 */
> > > +	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
> > > +					: msm_offset->core_ddr_config_old;
> > > +
> > > +	config = msm_host->dll.ddr_config[index];
> > > +	writel_relaxed(config, ioaddr + ddr_cfg_offset);
> > > +
> > > +	/* Set DLL_CONFIG_2 */
> > > +	if (msm_host->use_14lpp_dll_reset) {
> > > +		u32 mclk_freq;
> > > +		int cycle_cnt;
> > > +
> > > +		/*
> > > +		 * Only configure the mclk_freq in normal DLL init
> > > +		 * context. If the DLL init is coming from
> > > +		 * CX Collapse Exit context, the host->clock may be zero.
> > > +		 * The DLL_CONFIG_2 register has already been restored to
> > > +		 * proper value prior to getting here.
> > > +		 */
> > > +		if (init_context == DLL_INIT_NORMAL) {
> > > +			cycle_cnt = readl_relaxed(ioaddr +
> > > +					msm_offset->core_dll_config_2)
> > > +					& CORE_FLL_CYCLE_CNT ? 8 : 4;
> > > +
> > > +			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
> > > +
> > > +			if (dll_clock < 100000000) {
> > > +				pr_err("%s: %s: Non standard clk freq =%u\n",
> > > +				mmc_hostname(mmc), __func__, dll_clock);
> > > +				rc = -EINVAL;
> > > +				goto out;
> > > +			}
> > > +
> > > +			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > +			config = (config & ~(0xFF << 10)) | (mclk_freq << 10);
> > 
> > GENMASK, FIELD_PREP?
> 
> Sure I will use the suggested macros.
> 
> > 
> > > +			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > +		}
> > > +		/* wait for 5us before enabling DLL clock */
> > > +		udelay(5);
> > > +	}
> > > +
> > > +	/*
> > > +	 * Update the lower two bytes of DLL_CONFIG only with
> > > +	 * HSR values. Since these are the static settings.
> > > +	 */
> > > +	config = (readl_relaxed(ioaddr + msm_offset->core_dll_config));
> > > +	config |= (msm_host->dll.dll_config[index] & 0xffff);
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/* Wait for 52us */
> > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > +	udelay(60);
> > > +	spin_lock_irqsave(&host->lock, flags);
> > > +
> > > +	/*
> > > +	 * Write 0 to DLL_RST bit of DLL_CONFIG register
> > > +	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
> > > +	 */
> > > +	config &= ~CORE_DLL_RST;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	config &= ~CORE_DLL_PDN;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
> > > +	config |= CORE_DLL_RST;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
> > > +	config &= ~CORE_DLL_RST;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
> > > +	if (msm_host->use_14lpp_dll_reset) {
> > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > +		config &= ~CORE_DLL_CLOCK_DISABLE;
> > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > +	}
> > > +
> > > +	/* Set DLL_EN bit to 1. */
> > > +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > +	config |= CORE_DLL_EN;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/*
> > > +	 * Wait for 8000 input clock. Here we calculate the
> > > +	 * delay from fixed clock freq 192MHz, which turns out 42us.
> > > +	 */
> > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > +	udelay(50);
> > > +	spin_lock_irqsave(&host->lock, flags);
> > > +
> > > +	/* Set CK_OUT_EN bit to 1. */
> > > +	config |= CORE_CK_OUT_EN;
> > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > +
> > > +	/*
> > > +	 * Wait until DLL_LOCK bit of DLL_STATUS register
> > > +	 * becomes '1'.
> > > +	 */
> > > +	while (!(readl_relaxed(ioaddr + msm_offset->core_dll_status) &
> > > +		 CORE_DLL_LOCK)) {
> > > +		/* max. wait for 50us sec for LOCK bit to be set */
> > > +		if (--wait_cnt == 0) {
> > > +			dev_err(mmc_dev(mmc), "%s: DLL failed to LOCK\n",
> > > +			       mmc_hostname(mmc));
> > > +			rc = -ETIMEDOUT;
> > > +			goto out;
> > > +		}
> > > +		/* wait for 1us before polling again */
> > > +		udelay(1);
> > > +	}
> > > +
> > > +out:
> > > +	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
> > > +		/* Reenable PWRSAVE as needed */
> > > +		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> > > +		config |= CORE_CLK_PWRSAVE;
> > > +		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
> > > +	}
> > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > +	return rc;
> > > +}
> > > +
> > >   static void msm_hc_select_default(struct sdhci_host *host)
> > >   {
> > >   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > @@ -900,14 +1131,35 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
> > >   		msm_hc_select_default(host);
> > >   }
> > > +static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
> > > +{
> > > +	unsigned char timing = host->mmc->ios.timing;
> > > +	int ret;
> > > +
> > > +	if (timing == MMC_TIMING_UHS_SDR104 || timing == MMC_TIMING_MMC_HS400)
> > > +		ret = sdhci_msm_configure_dll(host, DLL_INIT_NORMAL, HS400);
> > > +	else
> > > +		ret = sdhci_msm_configure_dll(host, DLL_INIT_NORMAL, HS200);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
> > > +{
> > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +
> > > +	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
> > > +		msm_init_cm_dll(host);
> > > +}
> > > +
> > >   static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > >   {
> > >   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > >   	u32 config, calib_done;
> > >   	int ret;
> > > -	const struct sdhci_msm_offset *msm_offset =
> > > -					msm_host->offset;
> > >   	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > @@ -915,7 +1167,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > >   	 * Retuning in HS400 (DDR mode) will fail, just reset the
> > >   	 * tuning block and restore the saved tuning phase.
> > >   	 */
> > > -	ret = msm_init_cm_dll(host);
> > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > >   	if (ret)
> > >   		goto out;
> > > @@ -1003,7 +1255,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > >   	return ret;
> > >   }
> > > -static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > > +static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
> > >   {
> > >   	struct mmc_host *mmc = host->mmc;
> > >   	u32 dll_status, config, ddr_cfg_offset;
> > > @@ -1014,7 +1266,6 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > >   					sdhci_priv_msm_offset(host);
> > >   	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > -
> > 
> > Unrelated, please drop.
> 
> I will fix it in next patchset.
> 
> > 
> > >   	/*
> > >   	 * Currently the core_ddr_config register defaults to desired
> > >   	 * configuration on reset. Currently reprogramming the power on
> > > @@ -1026,7 +1277,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > >   		ddr_cfg_offset = msm_offset->core_ddr_config;
> > >   	else
> > >   		ddr_cfg_offset = msm_offset->core_ddr_config_old;
> > > -	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> > > +
> > > +	if (msm_host->artanis_dll)
> > > +		writel_relaxed(msm_host->dll.ddr_config[index], host->ioaddr + ddr_cfg_offset);
> > > +	else
> > > +		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> > >   	if (mmc->ios.enhanced_strobe) {
> > >   		config = readl_relaxed(host->ioaddr +
> > > @@ -1083,11 +1338,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > >   {
> > >   	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > >   	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > >   	struct mmc_host *mmc = host->mmc;
> > > -	int ret;
> > >   	u32 config;
> > > -	const struct sdhci_msm_offset *msm_offset =
> > > -					msm_host->offset;
> > > +	int ret;
> > >   	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > @@ -1095,7 +1349,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > >   	 * Retuning in HS400 (DDR mode) will fail, just reset the
> > >   	 * tuning block and restore the saved tuning phase.
> > >   	 */
> > > -	ret = msm_init_cm_dll(host);
> > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > +
> > >   	if (ret)
> > >   		goto out;
> > > @@ -1115,7 +1370,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > >   	if (msm_host->use_cdclp533)
> > >   		ret = sdhci_msm_cdclp533_calibration(host);
> > >   	else
> > > -		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
> > > +		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
> > >   out:
> > >   	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
> > >   		 __func__, ret);
> > > @@ -1154,7 +1409,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
> > >   		return 0;
> > >   	/* Reset the tuning block */
> > > -	ret = msm_init_cm_dll(host);
> > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > +
> > >   	if (ret)
> > >   		return ret;
> > > @@ -1223,7 +1479,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
> > >   retry:
> > >   	/* First of all reset the tuning block */
> > > -	rc = msm_init_cm_dll(host);
> > > +	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > >   	if (rc)
> > >   		return rc;
> > > @@ -1752,11 +2008,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
> > >   	return clk_round_rate(core_clk, ULONG_MAX);
> > >   }
> > > -static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> > > -{
> > > -	return SDHCI_MSM_MIN_CLOCK;
> > > -}
> > > -
> > >   /*
> > >    * __sdhci_msm_set_clock - sdhci_msm clock control.
> > >    *
> > > @@ -2400,6 +2651,86 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
> > >   	return ret;
> > >   }
> > > +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> > > +					u32 **bw_vecs, int *len, u32 size)
> > > +{
> > > +	struct device_node *np = dev->of_node;
> > > +	u32 *arr = NULL;
> > > +	int ret = 0;
> > > +	size_t sz;
> > > +
> > > +	if (!np) {
> > > +		ret = -ENODEV;
> > > +		goto out;
> > > +	}
> > > +	if (!of_get_property(np, prop_name, len)) {
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +	sz = *len = *len / sizeof(*arr);
> > 
> > You obviously skipped checkpatch run. Please don't do that.
> 
> Before submitting the patchset I have already executed the checkpatch please
> find the output.
> 	 $ ./scripts/checkpatch.pl patch/*
> 	-----------------------------
> 	patch/0000-cover-letter.patch
> 	-----------------------------
> 	total: 0 errors, 0 warnings, 0 lines checked
> 	
> 	patch/0000-cover-letter.patch has no obvious style problems and is ready
> for submission.
> 	---------------------------------------------------------------------
> 	patch/0001-mmc-sdhci-msm-Add-core_major-minor-to-msm_host-struc.patch
> 	---------------------------------------------------------------------
> 	total: 0 errors, 0 warnings, 18 lines checked
> 	
> 	patch/0001-mmc-sdhci-msm-Add-core_major-minor-to-msm_host-struc.patch has
> no obvious style problems and is ready for submission.
> 	---------------------------------------------------------------------
> 	patch/0002-mmc-sdhci-msm-Rectify-DLL-programming-sequence-for-S.patch
> 	---------------------------------------------------------------------
> 	total: 0 errors, 0 warnings, 494 lines checked
> 	
> 	patch/0002-mmc-sdhci-msm-Rectify-DLL-programming-sequence-for-S.patch has
> no obvious style problems and is ready for submission.

Strangely enogh checkpatch.pl doesn't warn about this line, although it
has the check for it:

                if ($line =~ /^.\s*$Lval\s*=\s*$Lval\s*=(?!=)/) {
                        CHK("MULTIPLE_ASSIGNMENTS",
                            "multiple assignments should be avoided\n" . $herecurr);
                }

Running checkpatch.pl --strict will give you more things to fix though.

And anyway, the API not so logical. You pass the size, then you return
the number of elements through the len pointer. Please pass and return
the same thing (e.g. pass the number of elements in the passed array,
return the number of elements retrieved from DT).

> 
> > 
> > > +	if (sz <= 0 || (size > 0 && (sz > size))) {
> > > +		dev_err(dev, "%s invalid size\n", prop_name);
> > > +		ret = -EINVAL;
> > > +		goto out;
> > > +	}
> > > +
> > > +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
> > > +	if (!arr) {
> > > +		ret = -ENOMEM;
> > > +		goto out;
> > > +	}
> > > +
> > > +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
> > > +	if (ret < 0) {
> > > +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
> > > +		goto out;
> > > +	}
> > > +	*bw_vecs = arr;
> > > +out:
> > > +	if (ret)
> > > +		*len = 0;
> > > +	return ret;
> > > +}
> > > +
> > > +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> > > +{
> > > +	int dll_table_len, dll_reg_count;
> > > +	u32 *dll_table = NULL;
> > > +	u32 dll_values[10];
> > > +	int ret = 0, i;
> > > +
> > > +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
> > > +		&dll_table, &dll_table_len, 0))
> > > +		goto skip_dll;
> > 
> > Missing update for the bindings.
> 
> I will update in the next patchset.

Please update your internal upstreaming site: bindings changes MUST
always come before the corresponding driver changes. If it is already
documented there, you probably have a demerit for not following the
documented process.

> 
> > 
> > > +
> > > +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
> > > +
> > > +	if (dll_table_len != dll_reg_count) {
> > > +		dev_err(dev, "Number of HSR entries are not matching\n");
> > > +		ret = -EINVAL;
> > > +		goto skip_dll;
> > > +	}
> > > +
> > > +	for (i = 0; i < 5; i++) {
> > 
> > Magic value 5, replace with ARRAY_SIZE
> 
> I will fix in next patchset.
> 
> > 
> > > +		dll_values[2 * i] = dll_table[i];
> > > +		dll_values[2 * i + 1] = dll_table[i + 5];
> > > +	}
> > > +
> > > +	for (i = 0; i < 10; i++)
> > > +		dll_table[i] = dll_values[i];
> > 
> > So three memory copies to rearrange the order of values? That sounds
> > like a horrible solution.
> 
> I will fix in next patchset.
> 
> > 
> > > +
> > > +	memcpy(&msm_host->dll, dll_table, sizeof(struct sdhci_msm_dll));
> > > +	msm_host->artanis_dll = true;
> > > +
> > > +skip_dll:
> > > +	if (!dll_table) {
> > > +		msm_host->artanis_dll = false;
> > > +		dev_err(dev, "Failed to get dll hsr settings from dt\n");
> > > +	}
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >   static int sdhci_msm_probe(struct platform_device *pdev)
> > >   {
> > >   	struct sdhci_host *host;
> > > @@ -2446,6 +2777,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > >   	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
> > > +	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
> > > +		goto pltfm_free;
> > > +
> > >   	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
> > >   	if (ret)
> > >   		goto pltfm_free;
> > > -- 
> > > 2.17.1
> > > 
> > 
> 

-- 
With best wishes
Dmitry

