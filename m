Return-Path: <linux-arm-msm+bounces-11706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2096485A688
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 15:54:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44AFB1C22032
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Feb 2024 14:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB1B381AA;
	Mon, 19 Feb 2024 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V0Hnawn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC037705
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 14:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708354487; cv=none; b=ODovH3c57KOsbil1d7jYM6H8xlxLxDIhDNfLyH1NAM1ihvWTM+AhbeixTB2HWbutkGdsRKndWoDCIbLPFNzU7QUcaaTAJAyDZ/X5SrgUFyFjJlCJfn7PW1dJpJLk5GEbPtDrVfYfKmDQwCq5xcY61X9SlIx0tU+kUWmn2jxJXRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708354487; c=relaxed/simple;
	bh=x7ZHMjwvHc5OwW/GeG4aKlunVNrlvUWIdHCP/cTelGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bBLtDin2khU4lZS2ZMN7ehyhtdgjQ779or+WXGMeud83HuaVKLyBHI1w5VUHET1i/YKwFHJe1ZmS0iqE197S0jKhihrAl/C1Cg5NSRBvdWtfu+0Rm8m9KJmJYTPlEowJarzL52kLFtKIu6HD7cblEvIDgGMQmWcnaUKpVxk1s/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V0Hnawn2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708354484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OMYS7v5Ok4uhxIdc2zHomIdyNjZUgRNIUjrOuStgLv4=;
	b=V0Hnawn2uDs3dvP8AcyV28BeB46TJSL1IASUHhwbTaPL/bE953A4gimP3lJ0sqKWykrzy9
	vtWic+EQFI+Z5mj49c3c2mqXFak4GhKOyByPGSu8OF5pNqVdwzg0iLYzlH1A0rjRdg2zip
	dIPjs0/qVM0m7db7dcpPBu8Ep5LAQ6o=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-524-qzJ8XfNOOzKU41XcBfsWJg-1; Mon, 19 Feb 2024 09:54:42 -0500
X-MC-Unique: qzJ8XfNOOzKU41XcBfsWJg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42c16531c3fso41065841cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Feb 2024 06:54:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708354477; x=1708959277;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMYS7v5Ok4uhxIdc2zHomIdyNjZUgRNIUjrOuStgLv4=;
        b=ik/+vTsAxswJ62nhcmb3/MsklV+X0QyrrEE3XNzXlxWaRTKHmBcEb6vIi3NPaPxIUH
         ktl4NzkaRQpsbMSKhSnRdCUPWZbReYxUV43qymFwtrUGLSCo7qL6Tq26Z54S5GpTBQnZ
         iTaGtnQm/asw+SsnTf/Y5qJU20ONz6smIF3HRO9HRd7SlKmR14n+x+JYVnJrt5Tqy0iN
         6ODkykiUnkihCgKbwafkZmtkjidRuH2TLPiDqvmr40EeMDf3adTIgrpunI0G49NLt6Oc
         OLDy5KuN65BVti1JKCpkUHuf1XgnGhCRFGV/Q8MlgzdcnzpjdFZ8PxZ33g6Z5LA+JFBO
         wZSg==
X-Forwarded-Encrypted: i=1; AJvYcCWO8Zz10RPyWxUAsd8eTrL/j69e1tiv/3JO5ZqhIzhLj7jmQIMB6SEeHQvB/69X5jN2aNXRpKVvHvLhiYnrmYgSnjuh+m7QVtz3hoJCDg==
X-Gm-Message-State: AOJu0Yw/P+Ecf3eeXfMBGy1eFQd7Y8457QQ9g5PJm+YnVyZbTVWJYuqU
	sa0ZoUB3/+2rQHjef7FS6s6GsKIX7AWQQXVjkxdFmF+auAi7KtafoV7D0TP8zc3GLnVVOuzxzAO
	0sTfzc43lHz0CTidr8fDCSVu9NltPzLOM0mJ6vRzdW1iAyxPfQMrm3efePlRxi8o=
X-Received: by 2002:a05:622a:4c9:b0:42c:6efe:bd18 with SMTP id q9-20020a05622a04c900b0042c6efebd18mr16322030qtx.66.1708354477406;
        Mon, 19 Feb 2024 06:54:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2SRj7oP99HukQNscKw184xu2cciwlZWte3i1zo3pAwLyipyYhg0yaFUb6YVYkigJP95EVrg==
X-Received: by 2002:a05:622a:4c9:b0:42c:6efe:bd18 with SMTP id q9-20020a05622a04c900b0042c6efebd18mr16321995qtx.66.1708354477081;
        Mon, 19 Feb 2024 06:54:37 -0800 (PST)
Received: from fedora ([2600:1700:1ff0:d0e0::37])
        by smtp.gmail.com with ESMTPSA id g6-20020ac80706000000b0042e1a872e54sm432517qth.22.2024.02.19.06.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 06:54:36 -0800 (PST)
Date: Mon, 19 Feb 2024 08:54:33 -0600
From: Andrew Halaney <ahalaney@redhat.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
Message-ID: <u7beg6ui3i6nxoaulc3o7ghfkvcsy46ps53k3jynrurdwn6o7o@ppyqoz4jsotc>
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>

On Mon, Feb 19, 2024 at 02:35:48PM +0100, Konrad Dybcio wrote:
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
> 
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 48 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 8a412ef47e16..61b5abd13782 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -244,6 +244,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>  		[PLL_OFF_OPMODE] = 0x30,
>  		[PLL_OFF_STATUS] = 0x3c,
>  	},
> +	[CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
> +		[PLL_OFF_L_VAL] = 0x04,
> +		[PLL_OFF_ALPHA_VAL] = 0x08,
> +		[PLL_OFF_USER_CTL] = 0x0c,
> +		[PLL_OFF_CONFIG_CTL] = 0x10,
> +		[PLL_OFF_CONFIG_CTL_U] = 0x14,
> +		[PLL_OFF_CONFIG_CTL_U1] = 0x18,
> +		[PLL_OFF_TEST_CTL] = 0x1c,
> +		[PLL_OFF_TEST_CTL_U] = 0x20,
> +		[PLL_OFF_TEST_CTL_U1] = 0x24,
> +		[PLL_OFF_OPMODE] = 0x28,
> +		[PLL_OFF_STATUS] = 0x38,
> +	},
>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>  
> @@ -779,6 +792,38 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>  	return clamp(rate, min_freq, max_freq);
>  }
>  
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +				   const struct alpha_pll_config *config)
> +{
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
> +	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
> +	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> +	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
> +
> +	/* Set PLL_BYPASSNL */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
> +
> +	/* Wait 5 us between setting BYPASS and deasserting reset */
> +	mb();
> +	udelay(5);
> +
> +	/* Take PLL out from reset state */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +
> +	/* Wait 50us for PLL_LOCK_DET bit to go high */
> +	mb();
> +	usleep_range(50, 55);

I *think* you'd want to use a read to ensure your write goes through
prior to your sleep... from memory-barriers.txt:

	5. A readX() by a CPU thread from the peripheral will complete before
	   any subsequent delay() loop can begin execution on the same thread.
	   This ensures that two MMIO register writes by the CPU to a peripheral
	   will arrive at least 1us apart if the first write is immediately read
	   back with readX() and udelay(1) is called prior to the second
	   writeX():

		writel(42, DEVICE_REGISTER_0); // Arrives at the device...
		readl(DEVICE_REGISTER_0);
		udelay(1);
		writel(42, DEVICE_REGISTER_1); // ...at least 1us before this.

also https://youtu.be/i6DayghhA8Q?si=7lp0be35q1HRmlnV&t=1677
for more references on this topic.


> +
> +	/* Enable PLL output */
> +	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> +}
> +EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
> +
>  static unsigned long
>  alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
>  {
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index fb6d50263bb9..91d3d6f19eae 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -29,6 +29,7 @@ enum {
>  	CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
>  	CLK_ALPHA_PLL_TYPE_STROMER,
>  	CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
> +	CLK_ALPHA_PLL_TYPE_HUAYRA_2290,
>  	CLK_ALPHA_PLL_TYPE_MAX,
>  };
>  
> @@ -191,6 +192,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>  
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  			     const struct alpha_pll_config *config);
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +				   const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>  				const struct alpha_pll_config *config);
>  void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> 
> -- 
> 2.43.2
> 
> 


