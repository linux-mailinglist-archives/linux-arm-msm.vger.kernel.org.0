Return-Path: <linux-arm-msm+bounces-35892-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 209A29B0648
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 16:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA2B4283D69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Oct 2024 14:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7891914A09E;
	Fri, 25 Oct 2024 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oCWnncXf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3972C853
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 14:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729867999; cv=none; b=cVnDVU6VPUs6qUbXXQHLKzGnRNnaeGvfP3jKvadZxRx7oxJqo2g81ZpTP8HlQs8iOuAC0uCWgzLp9cZv2wHyVN3AyCF3R70cIZdJqgEr3W9Nazu6602sZn0Gm8RsS2bnZPOI3BNfriMgSyZWgYPFlJ92m+iX17IjmUwkOGgm/cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729867999; c=relaxed/simple;
	bh=RkxaRv1gHOBT5sh/vvRuNysi24qX6kjeWyH6s3MjGn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BytdgrurFqI96ACSjByQvl1h5FGy+I/Y9yWG3rOLocqpgTO/Qam131+/wHkxEJ7woR18US1ABJ0crLDfPcTj00sVQ5HkGD/+JA/kcpNFiFGD1Wg/1OPDRJLzH1ECkmglaAmToBwt/iute1e1m1Yxj8iGsJa280Cr2Yteqf44l18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oCWnncXf; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2384845e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Oct 2024 07:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729867994; x=1730472794; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TlD/UX/UlEtCuduPsSkXnCNtF99PZp3JNh+pZLqHh0U=;
        b=oCWnncXfiu5uT5bc5lDFE3Z0rcAr0v3+EpE2fytXfG5HI9U7VhV2aZ5C3em6GCtyOO
         jGloDYv0pe8Dz0W7wFa3sfIVN2ZtFNbLHsFO8SPXBTxGtjiYtkPr4XJDR9mnbOCofF/9
         5ooEsgraIevam5zHluy7Y6DjruMJRsd9nhaPynsVcbc9aqFRfrfulnUoYIdHQ9oAOkNW
         4IFAvOAIUfSNZyoqD+M+ROWNgIoI7f9eFjiIKMFUAOTqprwYbjxRlchLrGcWvQyLUjOW
         lmCSaX9+duYuY/MiqN5hrDjWEh6yhGCCktsGQD9H3hmJqFHt1DfqGTD7jN/F7LO15vOK
         6RMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729867994; x=1730472794;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlD/UX/UlEtCuduPsSkXnCNtF99PZp3JNh+pZLqHh0U=;
        b=uTVk9K3kyRHk6BYEVjn9r7II+IE2KNkYchOh2az6UgQLzWUITIDcyz+G141sBRmoYe
         WJQa5hQyoT/7c4IVEnFdEp6iwHgkJysblXhbJtibacHU/ALtktfjnnL/5uBXlKmAJMl/
         GNk0EGcxxtoSSpi9kp98spH1aVyzmnYhztP6nDBc4TWUo5H+EodeBoPJ4/YnZymnqQau
         +tq+rGHIc0K31JfV1gnOEBdbA2xTvjiQjd8iWMIiBJ6cbU1qBkKF9nqj65w9ngs/MRRc
         sgw5qhOwOs6rChInvSNTVTwSIUVh0A6pH9qvPokAWIoUTI0J/d83s7l16arrI7565cGR
         B12g==
X-Forwarded-Encrypted: i=1; AJvYcCXd3OQCwZl3jiwUP2MQ3NXTUvok81Bz+6s7d6VJpMdYqFRvWbVCbFuvoLMVivimEIuOYjPdXyNdGCt2RiH0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh2vmQTbQaxVdY2JOu9lQDzIAqxcRixH7AZURNB2kxcdlPH6zK
	CddmU3u3RFe6Y92cE6p3XCo4fHq0PC209dKdTS1Jid8avAus+cjBIIXHZLmu9pg=
X-Google-Smtp-Source: AGHT+IGYL7YFASRGtXttT1u3S3dz3+QkWO94FgOJfA6qslUxvxu3N5rdwJmVrNF6PekjkBHAAKd4gw==
X-Received: by 2002:a05:6512:31c1:b0:52b:de5b:1b30 with SMTP id 2adb3069b0e04-53b1a36196amr5948206e87.44.1729867994390;
        Fri, 25 Oct 2024 07:53:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e1dcbbdsm208100e87.236.2024.10.25.07.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 07:53:13 -0700 (PDT)
Date: Fri, 25 Oct 2024 17:53:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] clk: qcom: rpmh: add support for SAR2130P
Message-ID: <as72zsmycangcy7yyivavpwb2p5wptvbnvyfycrdoaz3kqrcle@luj3hgoqffri>
References: <20241021-sar2130p-clocks-v2-0-383e5eb123a2@linaro.org>
 <20241021-sar2130p-clocks-v2-7-383e5eb123a2@linaro.org>
 <73abe2b9-ad72-449f-b3e3-a96128cf75a4@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73abe2b9-ad72-449f-b3e3-a96128cf75a4@quicinc.com>

On Tue, Oct 22, 2024 at 12:03:57PM +0530, Taniya Das wrote:
> 
> 
> On 10/21/2024 4:00 PM, Dmitry Baryshkov wrote:
> > Define clocks as supported by the RPMh on the SAR2130P platform. It
> > seems that on this platform RPMh models only CXO clock.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/clk-rpmh.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> > index 4acde937114af3d7fdc15f3d125a72d42d0fde21..8cb15430d0171a8ed6b05e51d1901af63a4564c4 100644
> > --- a/drivers/clk/qcom/clk-rpmh.c
> > +++ b/drivers/clk/qcom/clk-rpmh.c
> > @@ -389,6 +389,16 @@ DEFINE_CLK_RPMH_BCM(ipa, "IP0");
> >   DEFINE_CLK_RPMH_BCM(pka, "PKA0");
> >   DEFINE_CLK_RPMH_BCM(qpic_clk, "QP0");
> > +static struct clk_hw *sar2130p_rpmh_clocks[] = {
> > +	[RPMH_CXO_CLK]		= &clk_rpmh_bi_tcxo_div1.hw,
> > +	[RPMH_CXO_CLK_A]	= &clk_rpmh_bi_tcxo_div1_ao.hw,
> > +};
> > +
> 
> Dimtry, could you please add these clocks as well?
> 
> DEFINE_CLK_RPMH_VRM-- > rf_clk1, rf_clk1_ao, "clka1", 1
> DEFINE_CLK_RPMH_VRM --> ln_bb_clk7, ln_bb_clk7_ao, "clka7", 2
> DEFINE_CLK_RPMH_VRM --> ln_bb_clk8, ln_bb_clk8_ao, "clka8", 4
> DEFINE_CLK_RPMH_VRM --> ln_bb_clk9, ln_bb_clk9_ao, "clka9", 2

After checking the CMD-DB, I can see "rfclka1", which I can add, but I
don't see clka7/clka8/clka9. Are you sure they are present on the
platform?

I'll add rfclka1 only for now and skip the rest.

> 
> > +static const struct clk_rpmh_desc clk_rpmh_sar2130p = {
> > +	.clks = sar2130p_rpmh_clocks,
> > +	.num_clks = ARRAY_SIZE(sar2130p_rpmh_clocks),
> > +};
> > +
> 
> 
> -- 
> Thanks & Regards,
> Taniya Das.

-- 
With best wishes
Dmitry

