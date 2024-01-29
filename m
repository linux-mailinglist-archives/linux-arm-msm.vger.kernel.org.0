Return-Path: <linux-arm-msm+bounces-8795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D049A840109
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 10:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00C831C22704
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jan 2024 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5FC955760;
	Mon, 29 Jan 2024 09:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sUdoJOuW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7D5576D
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 09:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706519559; cv=none; b=jDcmJUidHvfSxERud83P151VesMp0fFOV3SGp6gaCfEOPq3EyUj7UT33BmlC0haT7UXeiEx4PPZ2UxlJ9BvG4PPMO6EFuTUn0LzDyx2Q5ZiAWOCHG0KSRwRFqNUrvNyMxdg99duNqC4DZ5i81FuSoUEwX1BkEW9FtNo6KJT523k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706519559; c=relaxed/simple;
	bh=rSAO/O6+umbrgd625fyX9lN1JsZGRi7oML/1lCK3Zdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oYmMm4OL4ILT1nhAVs/alMPinmgMUfkYO10+02fv4GN0fa0bTxDJDbJUPI+JGmV8ADDztxM0FfjQdiKljR4ZXs1rkaG9her/GgK9dYwhWGVuXWo4ZGnoGzSdkcsht9IaCdDqV/L5eTFX9RxUZlcmTPdVZe0dB06yypyjz6pfG8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sUdoJOuW; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-556c3f0d6c5so2240352a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jan 2024 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706519556; x=1707124356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DzmEE3sbclmUATMScojHedeM2sKzcii3Wnflm1xNamI=;
        b=sUdoJOuWilAjvF0mJAR/uLLMEfzGzzZQs0YTGf0qVpb+wYgwgoZo2v3hRjHe/N2xqr
         iLCq4P8zx87a826Wfm63dkkN5oswTQ3S1F4QClJuikgVdhFIiW6XqD8Z9+6bs4BnB+Dm
         MJOopuzA4pdyy0bMNQI9vm6reHBcu4TTVryHZjgX1sYOUnQsbhz8mJ3O+MHvddxvihi4
         Rw+wPsqIK15Od6lLoMmDlcHZm5BofPZkkKmHmr0TZV/LvQE53LIhe3KyIRfxxePFHzuV
         0sWPuiYEjfqrEsuMw5nMelnBps9DPLCEdxSMtf3V7ZWj5hSW2kOgB+c5Ugcx4TDYFF9G
         DbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706519556; x=1707124356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzmEE3sbclmUATMScojHedeM2sKzcii3Wnflm1xNamI=;
        b=rN3f34c6eFmN/GG8EnH+5eeqfucWdun6gqNvU+eGxpa/hpdLytJ27MsQgj854Fl+5X
         9oH6t4mynIRMc97axluc12ttCtK6q2OVxpAnHnJrGaFYDLYZuoEinvs41TQdo6Nv4uM+
         MbJu8Q/zWlAa+r32jG+DFb/7oXe0tsnqmZImgqWg3QVVmz0YaxPU32zrD1vTpjvSex5h
         /u6zFqxjJ3qH/5WhyZFGW+X8ASTgI480qPMQGlRhyKnpa1t+oCjo9AYFN3NgqaaasWb0
         S+0zGvxGb0AGF7HlEoYtMSNkZhrXmfxpNWFisbZAXiJfv48WYDaR2VBmPi0D1ZSEg5Cv
         JdDw==
X-Gm-Message-State: AOJu0YzfaeK2VGDv8Qit2K2K0Lxp3x+l0+urAVtiU+iAgqY+OPwA0Ykd
	QIf5eh5Gdlr+WXxNeQ4f1d2OUvdaLar+8JSz+lDBrw7dNz4a6u1jfbN3HGMuA8I=
X-Google-Smtp-Source: AGHT+IH3bYxGtQbKypj/MyXK97fooPCFKCw9B5cHUZDtMi3ZqPCsEZOXb3u4vb5R841JOlG+KCniVw==
X-Received: by 2002:aa7:d95a:0:b0:558:252c:2776 with SMTP id l26-20020aa7d95a000000b00558252c2776mr3271974eds.16.1706519555928;
        Mon, 29 Jan 2024 01:12:35 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id fj11-20020a0564022b8b00b0055c69e0751fsm3475745edb.3.2024.01.29.01.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 01:12:35 -0800 (PST)
Date: Mon, 29 Jan 2024 11:12:33 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v3 06/10] clk: qcom: clk-alpha-pll: Add support for zonda
 ole pll configure
Message-ID: <ZbdsAfLcx4CoJQY7@linaro.org>
References: <20240129-x1e80100-clock-controllers-v3-0-d96dacfed104@linaro.org>
 <20240129-x1e80100-clock-controllers-v3-6-d96dacfed104@linaro.org>
 <CAA8EJppBtc2HKcZ2sAgBm=+sxtisp-hsADp-ui6PRTRRixB8xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppBtc2HKcZ2sAgBm=+sxtisp-hsADp-ui6PRTRRixB8xw@mail.gmail.com>

On 24-01-29 06:08:38, Dmitry Baryshkov wrote:
> On Mon, 29 Jan 2024 at 00:52, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> >
> > Zonda ole pll has as extra PLL_OFF_CONFIG_CTL_U2 register, hence add
> > support for it.
> >
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> >  drivers/clk/qcom/clk-alpha-pll.c | 26 ++++++++++++++++++++++++++
> >  drivers/clk/qcom/clk-alpha-pll.h |  4 ++++
> >  2 files changed, 30 insertions(+)
> >
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> > index 05898d2a8b22..85f8e2ad0b37 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.c
> > +++ b/drivers/clk/qcom/clk-alpha-pll.c
> > @@ -52,6 +52,7 @@
> >  #define PLL_CONFIG_CTL(p)      ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL])
> >  #define PLL_CONFIG_CTL_U(p)    ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U])
> >  #define PLL_CONFIG_CTL_U1(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U1])
> > +#define PLL_CONFIG_CTL_U2(p)   ((p)->offset + (p)->regs[PLL_OFF_CONFIG_CTL_U2])
> >  #define PLL_TEST_CTL(p)                ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL])
> >  #define PLL_TEST_CTL_U(p)      ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U])
> >  #define PLL_TEST_CTL_U1(p)     ((p)->offset + (p)->regs[PLL_OFF_TEST_CTL_U1])
> > @@ -228,6 +229,21 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
> >                 [PLL_OFF_ALPHA_VAL] = 0x24,
> >                 [PLL_OFF_ALPHA_VAL_U] = 0x28,
> >         },
> > +       [CLK_ALPHA_PLL_TYPE_ZONDA_OLE] =  {
> > +               [PLL_OFF_L_VAL] = 0x04,
> > +               [PLL_OFF_ALPHA_VAL] = 0x08,
> > +               [PLL_OFF_USER_CTL] = 0x0c,
> > +               [PLL_OFF_USER_CTL_U] = 0x10,
> > +               [PLL_OFF_CONFIG_CTL] = 0x14,
> > +               [PLL_OFF_CONFIG_CTL_U] = 0x18,
> > +               [PLL_OFF_CONFIG_CTL_U1] = 0x1c,
> > +               [PLL_OFF_CONFIG_CTL_U2] = 0x20,
> > +               [PLL_OFF_TEST_CTL] = 0x24,
> > +               [PLL_OFF_TEST_CTL_U] = 0x28,
> > +               [PLL_OFF_TEST_CTL_U1] = 0x2c,
> > +               [PLL_OFF_OPMODE] = 0x30,
> > +               [PLL_OFF_STATUS] = 0x3c,
> > +       },
> >  };
> >  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
> >
> > @@ -2093,6 +2109,16 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
> >  };
> >  EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
> >
> > +const struct clk_ops clk_alpha_pll_zonda_ole_ops = {
> > +       .enable = clk_zonda_pll_enable,
> > +       .disable = clk_zonda_pll_disable,
> > +       .is_enabled = clk_trion_pll_is_enabled,
> > +       .recalc_rate = clk_trion_pll_recalc_rate,
> > +       .round_rate = clk_alpha_pll_round_rate,
> > +       .set_rate = clk_zonda_pll_set_rate,
> > +};
> > +EXPORT_SYMBOL(clk_alpha_pll_zonda_ole_ops);
> 
> Let's maybe follow the existing example and #define
> clk_alpha_pll_zonda_ole_ops clk_alpha_pl_zonda_ops ?
> See the defines at clk-alpha-pll.h

Thanks for reviewing.

Will do that in the new version.

> 
> LGTM otherwise
> 
> > +
> >  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> >                                  const struct alpha_pll_config *config)
> >  {
> > diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> > index a1a75bb12fe8..99a3db9de4a1 100644
> > --- a/drivers/clk/qcom/clk-alpha-pll.h
> > +++ b/drivers/clk/qcom/clk-alpha-pll.h
> > @@ -21,6 +21,7 @@ enum {
> >         CLK_ALPHA_PLL_TYPE_LUCID = CLK_ALPHA_PLL_TYPE_TRION,
> >         CLK_ALPHA_PLL_TYPE_AGERA,
> >         CLK_ALPHA_PLL_TYPE_ZONDA,
> > +       CLK_ALPHA_PLL_TYPE_ZONDA_OLE,
> >         CLK_ALPHA_PLL_TYPE_LUCID_EVO,
> >         CLK_ALPHA_PLL_TYPE_LUCID_OLE,
> >         CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
> > @@ -42,6 +43,7 @@ enum {
> >         PLL_OFF_CONFIG_CTL,
> >         PLL_OFF_CONFIG_CTL_U,
> >         PLL_OFF_CONFIG_CTL_U1,
> > +       PLL_OFF_CONFIG_CTL_U2,
> >         PLL_OFF_TEST_CTL,
> >         PLL_OFF_TEST_CTL_U,
> >         PLL_OFF_TEST_CTL_U1,
> > @@ -119,6 +121,7 @@ struct alpha_pll_config {
> >         u32 config_ctl_val;
> >         u32 config_ctl_hi_val;
> >         u32 config_ctl_hi1_val;
> > +       u32 config_ctl_hi2_val;
> >         u32 user_ctl_val;
> >         u32 user_ctl_hi_val;
> >         u32 user_ctl_hi1_val;
> > @@ -173,6 +176,7 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
> >
> >  extern const struct clk_ops clk_alpha_pll_zonda_ops;
> >  #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
> > +extern const struct clk_ops clk_alpha_pll_zonda_ole_ops;
> >
> >  extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
> >  extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
> >
> > --
> > 2.34.1
> >
> 
> 
> -- 
> With best wishes
> Dmitry

