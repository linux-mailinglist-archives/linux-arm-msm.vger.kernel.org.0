Return-Path: <linux-arm-msm+bounces-44155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 689D5A043BE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:08:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5BB83A2DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 15:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181F71CF8B;
	Tue,  7 Jan 2025 15:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rz3HMfrs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C421E377F
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jan 2025 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736262499; cv=none; b=us44RU3nSOnzUrWTYHAKQpV20rvDYudJZai2HN1fAqhM6a1vnIyoQH3LetH/YAR2klx7B6K+J1Vr76zeKpMI5Mpok2Kzq2Zzlrmf1mzVmeFZRhGpUv/W1iIpQ6UldCWZ4Lnfi9QwKJqgy+eaf9xOTVc4+8IidA6taa08saeujGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736262499; c=relaxed/simple;
	bh=H4Po+ktV8RJfLI2aiKBBLF7B66OItjKhIeLDcfHIOJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lgt2ayDATByTxeSBlmfAdNA5udOIecKaNi20QuZy9i/VUCSDIgVzGcNkLQg3aFF7c4q4nSuqj5MGjBe9PaWsfSPGzO+mqHLr/zkMUf46tK//zOL+Gsb3227qsoQgai5O+WkcizKqgca2c9fw8gsC0QVzyPPkeqeQvIDpwyWVNv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rz3HMfrs; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3003c82c95cso129908671fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jan 2025 07:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736262493; x=1736867293; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EGS97pbxNDak3PjLjbFbzZDijN6wmGKok7vATq0Z2z0=;
        b=Rz3HMfrsIAMsixzSWpoQ/HLiY3tr4iRcBShhvT3OFJmK2qEkkIQFfmS9+adpa2dppi
         qcM3rX1kt+l+Yb+eOmlAISGubox7R5WnqF4bKik77Gj5EaQushzpEgMuRq+Nsu9NJRN7
         S0xt60ASxQYPOfHTlgrB67KwS5gFgRkh6/cGMemVyeFRrRa/Ie9wgDj0lGK8Ur5PiGdK
         2RlbhTesCLUyof8/6PSWrKixVVLvsdNrM512U6dGChuEkz0mY7qCu1gZHM6gCExf0x33
         SrRHQLlUp6j9GGvhyZoEcsNqUQyhavhl0v9PnF4V7NDilZEaX/36ilUFdy5BOeaY9xil
         EMYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736262493; x=1736867293;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EGS97pbxNDak3PjLjbFbzZDijN6wmGKok7vATq0Z2z0=;
        b=H8SKaGKUlzi11Oas74kOCb8NcMOZEnKWhb0PwNM524xsmsffT468c2VVHk5AdwpeOV
         zWcjfnuqr4Pldn06wNcGb+Nv4DsfXOBjXjostvq6Y0Ylg4Q5p4EavJy5uD0oTT7uT3xE
         xMR1myIYzCm1IfoPSPYX7rxvM1+VfBscO47yLjELBin5K2ajZ4Mo70sWUuUjnHhVhbSL
         JRLB3bpaQomgp6+GQX0djdx2+lkxzJbnZawCv0j0uBfBg/oPX2amPV0LsDaM4gZAmN9x
         ca/JlJKAiPNA3yjMkcLX4bTT/AGBxnGJ7tdt8rGNjMz0AYrVs7vNhfaJc//G8mJ8SfoX
         w9Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXO6zpOKwvoTY+QGrarmT53/MNGCaacNPVloR9zavA6wUb+3StEzFbTTlfiIVPKoeYVZnZuGrzMTv4u9Wza@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+U13TK4NR/dRls9TXqIwoH7E2zFOWN/AxDBiWc5UZ8eBr2yXq
	u3eQfHhbvBDvp+1w0Eb1rmzQYneI3k8+wgdvuch0MNt3kUIS0zMJPajtUMyCQDk=
X-Gm-Gg: ASbGncuxzNVgP5/rQOVlIxTnZHyPkl7V8zm2APGKwt9+MVaL2IfzmtucfA4knsEpvlD
	EDXMtwCVgZM8OrZXVtdLsahuvd9ufX/MMWcTUdg7t8wP83s8yjUDMhxEUWVPWyAt6H27NysNnli
	JpX7yiaEguNefrxQQXwyLjRnoB5MSN1CHYaPQjtlShaB9sIA69SV5Qm0w3V/uxUstjmkPVrp1bA
	ggjLf3YtVFRjejPFCdkTNjaxdmpHN5aSvLiyzTfd87iBShPxQQ+JxAF65AaWggRcj4Ym7MkfqKQ
	S1gaTjy+C1CRKr4ewdW/O9hqhxESHoC6IBoJ
X-Google-Smtp-Source: AGHT+IHEi8/cI87WGWJgu4gckVq1L7RYuZHRWkxxOgrltPbE8cIJ+eeTHQTSspRb57LykTpxVe2nsg==
X-Received: by 2002:a2e:bc23:0:b0:300:31db:a770 with SMTP id 38308e7fff4ca-3046860d416mr234391261fa.26.1736262493316;
        Tue, 07 Jan 2025 07:08:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad6cb7fsm58845061fa.19.2025.01.07.07.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 07:08:11 -0800 (PST)
Date: Tue, 7 Jan 2025 17:08:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sachin Gupta <quic_sachgupt@quicinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_mapa@quicinc.com, quic_narepall@quicinc.com, 
	quic_nitirawa@quicinc.com, quic_rampraka@quicinc.com, quic_sartgarg@quicinc.com
Subject: Re: [PATCH V2 2/2] mmc: sdhci-msm: Rectify DLL programming sequence
 for SDCC
Message-ID: <mpuyg4ndd7xvfpwd6oubn7zmzkuienyrig5pmkrd4badlpebvf@h6weyimpcfv2>
References: <20241218091057.15625-1-quic_sachgupt@quicinc.com>
 <20241218091057.15625-3-quic_sachgupt@quicinc.com>
 <a2mnkliubpdryxdwsd33kccvnlb4fnyzik5ywxw4xhnimwdwsm@oxe34zogzfot>
 <bb60a145-1e8f-4004-b266-9f26a11440b9@quicinc.com>
 <otfof56qvqxyjaq6onor2f3egrt57h2xazncias72qnn4xjgz5@2aj2pyj5xmyl>
 <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a885b32c-c59f-4fb6-b2cb-7955d2d3ae69@quicinc.com>

On Tue, Jan 07, 2025 at 11:13:32AM +0530, Sachin Gupta wrote:
> 
> 
> On 12/27/2024 12:23 AM, Dmitry Baryshkov wrote:
> > On Thu, Dec 26, 2024 at 11:22:40AM +0530, Sachin Gupta wrote:
> > > 
> > > 
> > > On 12/19/2024 11:24 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Dec 18, 2024 at 02:40:57PM +0530, Sachin Gupta wrote:
> > > > > With the current DLL sequence stability issues for data
> > > > > transfer seen in HS400 and HS200 modes.
> > > > > 
> > > > > "mmc0: cqhci: error IRQ status: 0x00000000 cmd error -84
> > > > > data error 0"
> > > > > 
> > > > > Rectify the DLL programming sequence as per latest hardware
> > > > > programming guide and also incorporate support for HS200 and
> > > > > HS400 DLL settings using the device tree.
> > > > 
> > > > "foo also bar" usually points out that there should be two separate
> > > > commits.
> > > 
> > > Thanks for review. I will split it into two patches.
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Sachin Gupta <quic_sachgupt@quicinc.com>
> > > > > Signed-off-by: Bao D. Nguyen <nguyenb@codeaurora.org>
> > > > > Signed-off-by: Sarthak Garg <sartgarg@codeaurora.org>
> > > > > Signed-off-by: Jun Li <liju@codeaurora.org>
> > > > 
> > > > This is very strange and incorrect.
> > > 
> > > Thanks for review. I will fix the format.
> > 
> > Well. If you write that you will fix the format, may I ask, how or what
> > do you plan to fix?
> > 
> 
> I will add Co-developed-by and Signed-off-by for co-authors and add
> signed-off-by for author at the last.
> 
> > > 
> > > > 
> > > > > ---
> > > > >    drivers/mmc/host/sdhci-msm.c | 372 +++++++++++++++++++++++++++++++++--
> > > > >    1 file changed, 353 insertions(+), 19 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> > > > > index 2a5e588779fc..4ecb362f7f2a 100644
> > > > > --- a/drivers/mmc/host/sdhci-msm.c
> > > > > +++ b/drivers/mmc/host/sdhci-msm.c
> > > > > @@ -28,6 +28,7 @@
> > > > >    #define CORE_VERSION_MAJOR_SHIFT	28
> > > > >    #define CORE_VERSION_MAJOR_MASK		(0xf << CORE_VERSION_MAJOR_SHIFT)
> > > > >    #define CORE_VERSION_MINOR_MASK		0xff
> > > > > +#define SDHCI_MSM_MIN_V_7FF		0x6e
> > > > >    #define CORE_MCI_GENERICS		0x70
> > > > >    #define SWITCHABLE_SIGNALING_VOLTAGE	BIT(29)
> > > > > @@ -118,7 +119,8 @@
> > > > >    #define CORE_PWRSAVE_DLL	BIT(3)
> > > > >    #define DDR_CONFIG_POR_VAL	0x80040873
> > > > > -
> > > > > +#define DLL_CONFIG_3_POR_VAL	0x10
> > > > > +#define TCXO_FREQ               19200000
> > > > 
> > > > What about the platforms where TCXO has different frequency?
> > > > 
> > > 
> > > All emmc targets have 192 Mhz as TCXO freq.
> > 
> > So, it's not a TCXO freq, but some other base freq?
> > 
> 
> It’s a TCXO frequency, this is as per hardware team recommendation.

First of all, it's not 192 MHz. Second, is it an actual XO freq or some
other interim frequency? I'm asking since some platforms use higher
frequencies for the XO.

> 
> > > 
> > > > >    #define INVALID_TUNING_PHASE	-1
> > > > >    #define SDHCI_MSM_MIN_CLOCK	400000
> > > > > @@ -256,6 +258,19 @@ struct sdhci_msm_variant_info {
> > > > >    	const struct sdhci_msm_offset *offset;
> > > > >    };
> > > > > +/*
> > > > > + * DLL registers which needs be programmed with HSR settings.
> > > > > + * Add any new register only at the end and don't change the
> > > > > + * sequence.
> > > > 
> > > > Why?
> > > 
> > > I will update the comment message in next patchset.
> > 
> > Well, you can respond to a question first. And once something is settled
> > you can get that to the commit message. It might save some round-trip
> > time.
> > 
> 
> My intention for the comment is that as per Hardware Documents, as part of
> DLL sequence DLL registers should be configured first. My above comment is
> confusing, will remove it.
> 
> > > 
> > > > 
> > > > > + */
> > > > > +struct sdhci_msm_dll {
> > > > > +	u32 dll_config[2];
> > > > > +	u32 dll_config_2[2];
> > > > > +	u32 dll_config_3[2];
> > > > > +	u32 dll_usr_ctl[2];
> > > > > +	u32 ddr_config[2];
> > > > > +};
> > > > > +
> > > > >    struct sdhci_msm_host {
> > > > >    	struct platform_device *pdev;
> > > > >    	void __iomem *core_mem;	/* MSM SDCC mapped address */
> > > > > @@ -264,6 +279,7 @@ struct sdhci_msm_host {
> > > > >    	struct clk *xo_clk;	/* TCXO clk needed for FLL feature of cm_dll*/
> > > > >    	/* core, iface, cal and sleep clocks */
> > > > >    	struct clk_bulk_data bulk_clks[4];
> > > > > +	struct sdhci_msm_dll dll;
> > > > >    #ifdef CONFIG_MMC_CRYPTO
> > > > >    	struct qcom_ice *ice;
> > > > >    #endif
> > > > > @@ -292,6 +308,17 @@ struct sdhci_msm_host {
> > > > >    	u32 dll_config;
> > > > >    	u32 ddr_config;
> > > > >    	bool vqmmc_enabled;
> > > > > +	bool artanis_dll;
> > > > > +};
> > > > > +
> > > > > +enum dll_init_context {
> > > > > +	DLL_INIT_NORMAL,
> > > > > +	DLL_INIT_FROM_CX_COLLAPSE_EXIT,
> > > > > +};
> > > > > +
> > > > > +enum mode {
> > > > > +	HS400, // equivalent to SDR104 mode for DLL.
> > > > > +	HS200, // equivalent to SDR50 mode for DLL.
> > > > >    };
> > > > >    static const struct sdhci_msm_offset *sdhci_priv_msm_offset(struct sdhci_host *host)
> > > > > @@ -778,6 +805,210 @@ static int msm_init_cm_dll(struct sdhci_host *host)
> > > > >    	return 0;
> > > > >    }
> > > > > +static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> > > > > +{
> > > > > +	return SDHCI_MSM_MIN_CLOCK;
> > > > > +}
> > > > 
> > > > Why??? Why do you need a function to return a static value?
> > > > 
> > > 
> > > This is just rearrangement of the function. This function already exist,
> > > moving here to avoid predeclaration.
> > 
> > Okay.
> > 
> > > > > +
> > > > > +static unsigned int sdhci_msm_get_clk_rate(struct sdhci_host *host, u32 req_clk)
> > > > > +{
> > > > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > +	struct clk *core_clk = msm_host->bulk_clks[0].clk;
> > > > > +	unsigned int sup_clk;
> > > > > +
> > > > > +	if (req_clk < sdhci_msm_get_min_clock(host))
> > > > > +		return sdhci_msm_get_min_clock(host);
> > > > > +
> > > > > +	sup_clk = clk_round_rate(core_clk, clk_get_rate(core_clk));
> > > > > +
> > > > > +	if (host->clock != msm_host->clk_rate)
> > > > > +		sup_clk = sup_clk / 2;
> > > > > +
> > > > > +	return sup_clk;
> > > > 
> > > > Why?
> > > 
> > > Sorry, I did not understand your question. Can you please explain in detail.
> > 
> > Please explain the maths. You get the rate from the clock, then you
> > round it, but it is the rate that has just been returned, so there
> > should be no need to round it. And after that there a division by two
> > for some reason. So I've asked for an explanation for that code.
> > 
> 
> clk_round_rate is used in case of over clocking issue we can round it to the
> usable frequency.

If it is a frequency _returned_ by the clock driver, why do you need to
round it? It sounds like that freq should be usable anyway.

> Divide by 2 is used as for HS400 the tuning happens in
> HS200 mode only so to update the frequency to 192 Mhz.

Again, is it really 192 MHz? Or 19.2 MHz?
Also if it is for HS400, then shouldn't /2 be limited to that mode?

> 
> > > 
> > > > 
> > > > > +}
> > > > > +
> > > > > +/* Initialize the DLL (Programmable Delay Line) */
> > > > > +static int sdhci_msm_configure_dll(struct sdhci_host *host, enum dll_init_context
> > > > > +				 init_context, enum mode index)
> > > > > +{
> > > > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > > > +	struct mmc_host *mmc = host->mmc;
> > > > > +	u32 ddr_cfg_offset, core_vendor_spec, config;
> > > > > +	void __iomem *ioaddr = host->ioaddr;
> > > > > +	unsigned long flags, dll_clock;
> > > > > +	int rc = 0, wait_cnt = 50;
> > > > > +
> > > > > +	dll_clock = sdhci_msm_get_clk_rate(host, host->clock);
> > > > > +	spin_lock_irqsave(&host->lock, flags);
> > > > > +
> > > > > +	core_vendor_spec = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> > > > > +
> > > > > +	/*
> > > > > +	 * Always disable PWRSAVE during the DLL power
> > > > > +	 * up regardless of its current setting.
> > > > > +	 */
> > > > > +	core_vendor_spec &= ~CORE_CLK_PWRSAVE;
> > > > > +	writel_relaxed(core_vendor_spec, ioaddr + msm_offset->core_vendor_spec);
> > > > > +
> > > > > +	if (msm_host->use_14lpp_dll_reset) {
> > > > > +		/* Disable CK_OUT */
> > > > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > > > +		config &= ~CORE_CK_OUT_EN;
> > > > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +		/* Disable the DLL clock */
> > > > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > > > +		config |= CORE_DLL_CLOCK_DISABLE;
> > > > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Write 1 to DLL_RST bit of DLL_CONFIG register
> > > > > +	 * and Write 1 to DLL_PDN bit of DLL_CONFIG register.
> > > > > +	 */
> > > > > +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > > > +	config |= (CORE_DLL_RST | CORE_DLL_PDN);
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/*
> > > > > +	 * Configure DLL_CONFIG_3 and USER_CTRL
> > > > > +	 * (Only applicable for 7FF projects).
> > > > > +	 */
> > > > > +	if (msm_host->core_minor >= SDHCI_MSM_MIN_V_7FF) {
> > > > > +		writel_relaxed(msm_host->dll.dll_config_3[index],
> > > > > +				ioaddr + msm_offset->core_dll_config_3);
> > > > > +		writel_relaxed(msm_host->dll.dll_usr_ctl[index],
> > > > > +				ioaddr + msm_offset->core_dll_usr_ctl);
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Set DDR_CONFIG since step 7 is setting TEST_CTRL that can be skipped.
> > > > > +	 */
> > > > > +	ddr_cfg_offset = msm_host->updated_ddr_cfg ? msm_offset->core_ddr_config
> > > > > +					: msm_offset->core_ddr_config_old;
> > > > > +
> > > > > +	config = msm_host->dll.ddr_config[index];
> > > > > +	writel_relaxed(config, ioaddr + ddr_cfg_offset);
> > > > > +
> > > > > +	/* Set DLL_CONFIG_2 */
> > > > > +	if (msm_host->use_14lpp_dll_reset) {
> > > > > +		u32 mclk_freq;
> > > > > +		int cycle_cnt;
> > > > > +
> > > > > +		/*
> > > > > +		 * Only configure the mclk_freq in normal DLL init
> > > > > +		 * context. If the DLL init is coming from
> > > > > +		 * CX Collapse Exit context, the host->clock may be zero.
> > > > > +		 * The DLL_CONFIG_2 register has already been restored to
> > > > > +		 * proper value prior to getting here.
> > > > > +		 */
> > > > > +		if (init_context == DLL_INIT_NORMAL) {
> > > > > +			cycle_cnt = readl_relaxed(ioaddr +
> > > > > +					msm_offset->core_dll_config_2)
> > > > > +					& CORE_FLL_CYCLE_CNT ? 8 : 4;
> > > > > +
> > > > > +			mclk_freq = DIV_ROUND_CLOSEST_ULL(dll_clock * cycle_cnt, TCXO_FREQ);
> > > > > +
> > > > > +			if (dll_clock < 100000000) {
> > > > > +				pr_err("%s: %s: Non standard clk freq =%u\n",
> > > > > +				mmc_hostname(mmc), __func__, dll_clock);
> > > > > +				rc = -EINVAL;
> > > > > +				goto out;
> > > > > +			}
> > > > > +
> > > > > +			config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > > > +			config = (config & ~(0xFF << 10)) | (mclk_freq << 10);
> > > > 
> > > > GENMASK, FIELD_PREP?
> > > 
> > > Sure I will use the suggested macros.
> > > 
> > > > 
> > > > > +			writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > > > +		}
> > > > > +		/* wait for 5us before enabling DLL clock */
> > > > > +		udelay(5);
> > > > > +	}
> > > > > +
> > > > > +	/*
> > > > > +	 * Update the lower two bytes of DLL_CONFIG only with
> > > > > +	 * HSR values. Since these are the static settings.
> > > > > +	 */
> > > > > +	config = (readl_relaxed(ioaddr + msm_offset->core_dll_config));
> > > > > +	config |= (msm_host->dll.dll_config[index] & 0xffff);
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/* Wait for 52us */
> > > > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > > > +	udelay(60);
> > > > > +	spin_lock_irqsave(&host->lock, flags);
> > > > > +
> > > > > +	/*
> > > > > +	 * Write 0 to DLL_RST bit of DLL_CONFIG register
> > > > > +	 * and Write 0 to DLL_PDN bit of DLL_CONFIG register.
> > > > > +	 */
> > > > > +	config &= ~CORE_DLL_RST;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	config &= ~CORE_DLL_PDN;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +	/* Write 1 to DLL_RST bit of DLL_CONFIG register */
> > > > > +	config |= CORE_DLL_RST;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/* Write 0 to DLL_RST bit of DLL_CONFIG register */
> > > > > +	config &= ~CORE_DLL_RST;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/* Set CORE_DLL_CLOCK_DISABLE to 0 */
> > > > > +	if (msm_host->use_14lpp_dll_reset) {
> > > > > +		config = readl_relaxed(ioaddr + msm_offset->core_dll_config_2);
> > > > > +		config &= ~CORE_DLL_CLOCK_DISABLE;
> > > > > +		writel_relaxed(config, ioaddr + msm_offset->core_dll_config_2);
> > > > > +	}
> > > > > +
> > > > > +	/* Set DLL_EN bit to 1. */
> > > > > +	config = readl_relaxed(ioaddr + msm_offset->core_dll_config);
> > > > > +	config |= CORE_DLL_EN;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/*
> > > > > +	 * Wait for 8000 input clock. Here we calculate the
> > > > > +	 * delay from fixed clock freq 192MHz, which turns out 42us.
> > > > > +	 */
> > > > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > > > +	udelay(50);
> > > > > +	spin_lock_irqsave(&host->lock, flags);
> > > > > +
> > > > > +	/* Set CK_OUT_EN bit to 1. */
> > > > > +	config |= CORE_CK_OUT_EN;
> > > > > +	writel_relaxed(config, ioaddr + msm_offset->core_dll_config);
> > > > > +
> > > > > +	/*
> > > > > +	 * Wait until DLL_LOCK bit of DLL_STATUS register
> > > > > +	 * becomes '1'.
> > > > > +	 */
> > > > > +	while (!(readl_relaxed(ioaddr + msm_offset->core_dll_status) &
> > > > > +		 CORE_DLL_LOCK)) {
> > > > > +		/* max. wait for 50us sec for LOCK bit to be set */
> > > > > +		if (--wait_cnt == 0) {
> > > > > +			dev_err(mmc_dev(mmc), "%s: DLL failed to LOCK\n",
> > > > > +			       mmc_hostname(mmc));
> > > > > +			rc = -ETIMEDOUT;
> > > > > +			goto out;
> > > > > +		}
> > > > > +		/* wait for 1us before polling again */
> > > > > +		udelay(1);
> > > > > +	}
> > > > > +
> > > > > +out:
> > > > > +	if (core_vendor_spec & CORE_CLK_PWRSAVE) {
> > > > > +		/* Reenable PWRSAVE as needed */
> > > > > +		config = readl_relaxed(ioaddr + msm_offset->core_vendor_spec);
> > > > > +		config |= CORE_CLK_PWRSAVE;
> > > > > +		writel_relaxed(config, ioaddr + msm_offset->core_vendor_spec);
> > > > > +	}
> > > > > +	spin_unlock_irqrestore(&host->lock, flags);
> > > > > +	return rc;
> > > > > +}
> > > > > +
> > > > >    static void msm_hc_select_default(struct sdhci_host *host)
> > > > >    {
> > > > >    	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > > @@ -900,14 +1131,35 @@ static void sdhci_msm_hc_select_mode(struct sdhci_host *host)
> > > > >    		msm_hc_select_default(host);
> > > > >    }
> > > > > +static int sdhci_msm_init_dll(struct sdhci_host *host, enum dll_init_context init_context)
> > > > > +{
> > > > > +	unsigned char timing = host->mmc->ios.timing;
> > > > > +	int ret;
> > > > > +
> > > > > +	if (timing == MMC_TIMING_UHS_SDR104 || timing == MMC_TIMING_MMC_HS400)
> > > > > +		ret = sdhci_msm_configure_dll(host, DLL_INIT_NORMAL, HS400);
> > > > > +	else
> > > > > +		ret = sdhci_msm_configure_dll(host, DLL_INIT_NORMAL, HS200);
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int sdhci_msm_dll_config(struct sdhci_host *host, enum dll_init_context init_context)
> > > > > +{
> > > > > +	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > > +	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > +
> > > > > +	return msm_host->artanis_dll ? sdhci_msm_init_dll(host, init_context) :
> > > > > +		msm_init_cm_dll(host);
> > > > > +}
> > > > > +
> > > > >    static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > > > >    {
> > > > >    	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > >    	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > > >    	u32 config, calib_done;
> > > > >    	int ret;
> > > > > -	const struct sdhci_msm_offset *msm_offset =
> > > > > -					msm_host->offset;
> > > > >    	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > > > @@ -915,7 +1167,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > > > >    	 * Retuning in HS400 (DDR mode) will fail, just reset the
> > > > >    	 * tuning block and restore the saved tuning phase.
> > > > >    	 */
> > > > > -	ret = msm_init_cm_dll(host);
> > > > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > > >    	if (ret)
> > > > >    		goto out;
> > > > > @@ -1003,7 +1255,7 @@ static int sdhci_msm_cdclp533_calibration(struct sdhci_host *host)
> > > > >    	return ret;
> > > > >    }
> > > > > -static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > > > > +static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host, enum mode index)
> > > > >    {
> > > > >    	struct mmc_host *mmc = host->mmc;
> > > > >    	u32 dll_status, config, ddr_cfg_offset;
> > > > > @@ -1014,7 +1266,6 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > > > >    					sdhci_priv_msm_offset(host);
> > > > >    	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > > > -
> > > > 
> > > > Unrelated, please drop.
> > > 
> > > I will fix it in next patchset.
> > > 
> > > > 
> > > > >    	/*
> > > > >    	 * Currently the core_ddr_config register defaults to desired
> > > > >    	 * configuration on reset. Currently reprogramming the power on
> > > > > @@ -1026,7 +1277,11 @@ static int sdhci_msm_cm_dll_sdc4_calibration(struct sdhci_host *host)
> > > > >    		ddr_cfg_offset = msm_offset->core_ddr_config;
> > > > >    	else
> > > > >    		ddr_cfg_offset = msm_offset->core_ddr_config_old;
> > > > > -	writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> > > > > +
> > > > > +	if (msm_host->artanis_dll)
> > > > > +		writel_relaxed(msm_host->dll.ddr_config[index], host->ioaddr + ddr_cfg_offset);
> > > > > +	else
> > > > > +		writel_relaxed(msm_host->ddr_config, host->ioaddr + ddr_cfg_offset);
> > > > >    	if (mmc->ios.enhanced_strobe) {
> > > > >    		config = readl_relaxed(host->ioaddr +
> > > > > @@ -1083,11 +1338,10 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > > > >    {
> > > > >    	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > > > >    	struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
> > > > > +	const struct sdhci_msm_offset *msm_offset = msm_host->offset;
> > > > >    	struct mmc_host *mmc = host->mmc;
> > > > > -	int ret;
> > > > >    	u32 config;
> > > > > -	const struct sdhci_msm_offset *msm_offset =
> > > > > -					msm_host->offset;
> > > > > +	int ret;
> > > > >    	pr_debug("%s: %s: Enter\n", mmc_hostname(host->mmc), __func__);
> > > > > @@ -1095,7 +1349,8 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > > > >    	 * Retuning in HS400 (DDR mode) will fail, just reset the
> > > > >    	 * tuning block and restore the saved tuning phase.
> > > > >    	 */
> > > > > -	ret = msm_init_cm_dll(host);
> > > > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > > > +
> > > > >    	if (ret)
> > > > >    		goto out;
> > > > > @@ -1115,7 +1370,7 @@ static int sdhci_msm_hs400_dll_calibration(struct sdhci_host *host)
> > > > >    	if (msm_host->use_cdclp533)
> > > > >    		ret = sdhci_msm_cdclp533_calibration(host);
> > > > >    	else
> > > > > -		ret = sdhci_msm_cm_dll_sdc4_calibration(host);
> > > > > +		ret = sdhci_msm_cm_dll_sdc4_calibration(host, HS400);
> > > > >    out:
> > > > >    	pr_debug("%s: %s: Exit, ret %d\n", mmc_hostname(host->mmc),
> > > > >    		 __func__, ret);
> > > > > @@ -1154,7 +1409,8 @@ static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
> > > > >    		return 0;
> > > > >    	/* Reset the tuning block */
> > > > > -	ret = msm_init_cm_dll(host);
> > > > > +	ret = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > > > +
> > > > >    	if (ret)
> > > > >    		return ret;
> > > > > @@ -1223,7 +1479,7 @@ static int sdhci_msm_execute_tuning(struct mmc_host *mmc, u32 opcode)
> > > > >    retry:
> > > > >    	/* First of all reset the tuning block */
> > > > > -	rc = msm_init_cm_dll(host);
> > > > > +	rc = sdhci_msm_dll_config(host, DLL_INIT_NORMAL);
> > > > >    	if (rc)
> > > > >    		return rc;
> > > > > @@ -1752,11 +2008,6 @@ static unsigned int sdhci_msm_get_max_clock(struct sdhci_host *host)
> > > > >    	return clk_round_rate(core_clk, ULONG_MAX);
> > > > >    }
> > > > > -static unsigned int sdhci_msm_get_min_clock(struct sdhci_host *host)
> > > > > -{
> > > > > -	return SDHCI_MSM_MIN_CLOCK;
> > > > > -}
> > > > > -
> > > > >    /*
> > > > >     * __sdhci_msm_set_clock - sdhci_msm clock control.
> > > > >     *
> > > > > @@ -2400,6 +2651,86 @@ static int sdhci_msm_gcc_reset(struct device *dev, struct sdhci_host *host)
> > > > >    	return ret;
> > > > >    }
> > > > > +static int sdhci_msm_dt_get_array(struct device *dev, const char *prop_name,
> > > > > +					u32 **bw_vecs, int *len, u32 size)
> > > > > +{
> > > > > +	struct device_node *np = dev->of_node;
> > > > > +	u32 *arr = NULL;
> > > > > +	int ret = 0;
> > > > > +	size_t sz;
> > > > > +
> > > > > +	if (!np) {
> > > > > +		ret = -ENODEV;
> > > > > +		goto out;
> > > > > +	}
> > > > > +	if (!of_get_property(np, prop_name, len)) {
> > > > > +		ret = -EINVAL;
> > > > > +		goto out;
> > > > > +	}
> > > > > +	sz = *len = *len / sizeof(*arr);
> > > > 
> > > > You obviously skipped checkpatch run. Please don't do that.
> > > 
> > > Before submitting the patchset I have already executed the checkpatch please
> > > find the output.
> > > 	 $ ./scripts/checkpatch.pl patch/*
> > > 	-----------------------------
> > > 	patch/0000-cover-letter.patch
> > > 	-----------------------------
> > > 	total: 0 errors, 0 warnings, 0 lines checked
> > > 	
> > > 	patch/0000-cover-letter.patch has no obvious style problems and is ready
> > > for submission.
> > > 	---------------------------------------------------------------------
> > > 	patch/0001-mmc-sdhci-msm-Add-core_major-minor-to-msm_host-struc.patch
> > > 	---------------------------------------------------------------------
> > > 	total: 0 errors, 0 warnings, 18 lines checked
> > > 	
> > > 	patch/0001-mmc-sdhci-msm-Add-core_major-minor-to-msm_host-struc.patch has
> > > no obvious style problems and is ready for submission.
> > > 	---------------------------------------------------------------------
> > > 	patch/0002-mmc-sdhci-msm-Rectify-DLL-programming-sequence-for-S.patch
> > > 	---------------------------------------------------------------------
> > > 	total: 0 errors, 0 warnings, 494 lines checked
> > > 	
> > > 	patch/0002-mmc-sdhci-msm-Rectify-DLL-programming-sequence-for-S.patch has
> > > no obvious style problems and is ready for submission.
> > 
> > Strangely enogh checkpatch.pl doesn't warn about this line, although it
> > has the check for it:
> > 
> >                  if ($line =~ /^.\s*$Lval\s*=\s*$Lval\s*=(?!=)/) {
> >                          CHK("MULTIPLE_ASSIGNMENTS",
> >                              "multiple assignments should be avoided\n" . $herecurr);
> >                  }
> > 
> > Running checkpatch.pl --strict will give you more things to fix though.
> > 
> 
> Sorry, even with the --strict checkpatch does not throw error or warning.
> But I will modify the line to make it simple assignment.

And all other checkpatch issues too, please.

> 
> > And anyway, the API not so logical. You pass the size, then you return
> > the number of elements through the len pointer. Please pass and return
> > the same thing (e.g. pass the number of elements in the passed array,
> > return the number of elements retrieved from DT).
> > 
> 
> Thank you for the comment,  I will modify the API and remove size input
> variable. we can use only data and length.
> 
> 
> > > 
> > > > 
> > > > > +	if (sz <= 0 || (size > 0 && (sz > size))) {
> > > > > +		dev_err(dev, "%s invalid size\n", prop_name);
> > > > > +		ret = -EINVAL;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	arr = devm_kzalloc(dev, sz * sizeof(*arr), GFP_KERNEL);
> > > > > +	if (!arr) {
> > > > > +		ret = -ENOMEM;
> > > > > +		goto out;
> > > > > +	}
> > > > > +
> > > > > +	ret = of_property_read_u32_array(np, prop_name, arr, sz);
> > > > > +	if (ret < 0) {
> > > > > +		dev_err(dev, "%s failed reading array %d\n", prop_name, ret);
> > > > > +		goto out;
> > > > > +	}
> > > > > +	*bw_vecs = arr;
> > > > > +out:
> > > > > +	if (ret)
> > > > > +		*len = 0;
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > > +static int sdhci_msm_dt_parse_dll_info(struct device *dev, struct sdhci_msm_host *msm_host)
> > > > > +{
> > > > > +	int dll_table_len, dll_reg_count;
> > > > > +	u32 *dll_table = NULL;
> > > > > +	u32 dll_values[10];
> > > > > +	int ret = 0, i;
> > > > > +
> > > > > +	if (sdhci_msm_dt_get_array(dev, "qcom,dll-hsr-list",
> > > > > +		&dll_table, &dll_table_len, 0))
> > > > > +		goto skip_dll;
> > > > 
> > > > Missing update for the bindings.
> > > 
> > > I will update in the next patchset.
> > 
> > Please update your internal upstreaming site: bindings changes MUST
> > always come before the corresponding driver changes. If it is already
> > documented there, you probably have a demerit for not following the
> > documented process.
> > 
> 
> Sure I will push DT binding change as a first patch in a new patch series.
> 
> > > 
> > > > 
> > > > > +
> > > > > +	dll_reg_count = sizeof(struct sdhci_msm_dll) / sizeof(u32);
> > > > > +
> > > > > +	if (dll_table_len != dll_reg_count) {
> > > > > +		dev_err(dev, "Number of HSR entries are not matching\n");
> > > > > +		ret = -EINVAL;
> > > > > +		goto skip_dll;
> > > > > +	}
> > > > > +
> > > > > +	for (i = 0; i < 5; i++) {
> > > > 
> > > > Magic value 5, replace with ARRAY_SIZE
> > > 
> > > I will fix in next patchset.
> > > 
> > > > 
> > > > > +		dll_values[2 * i] = dll_table[i];
> > > > > +		dll_values[2 * i + 1] = dll_table[i + 5];
> > > > > +	}
> > > > > +
> > > > > +	for (i = 0; i < 10; i++)
> > > > > +		dll_table[i] = dll_values[i];
> > > > 
> > > > So three memory copies to rearrange the order of values? That sounds
> > > > like a horrible solution.
> > > 
> > > I will fix in next patchset.
> > > 
> > > > 
> > > > > +
> > > > > +	memcpy(&msm_host->dll, dll_table, sizeof(struct sdhci_msm_dll));
> > > > > +	msm_host->artanis_dll = true;
> > > > > +
> > > > > +skip_dll:
> > > > > +	if (!dll_table) {
> > > > > +		msm_host->artanis_dll = false;
> > > > > +		dev_err(dev, "Failed to get dll hsr settings from dt\n");
> > > > > +	}
> > > > > +
> > > > > +	return ret;
> > > > > +}
> > > > > +
> > > > >    static int sdhci_msm_probe(struct platform_device *pdev)
> > > > >    {
> > > > >    	struct sdhci_host *host;
> > > > > @@ -2446,6 +2777,9 @@ static int sdhci_msm_probe(struct platform_device *pdev)
> > > > >    	msm_host->saved_tuning_phase = INVALID_TUNING_PHASE;
> > > > > +	if (sdhci_msm_dt_parse_dll_info(&pdev->dev, msm_host))
> > > > > +		goto pltfm_free;
> > > > > +
> > > > >    	ret = sdhci_msm_gcc_reset(&pdev->dev, host);
> > > > >    	if (ret)
> > > > >    		goto pltfm_free;
> > > > > -- 
> > > > > 2.17.1
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry

