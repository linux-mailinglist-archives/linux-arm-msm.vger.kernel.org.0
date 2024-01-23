Return-Path: <linux-arm-msm+bounces-7938-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DCC838DDD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 12:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBD201C212D3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jan 2024 11:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BE55D8F5;
	Tue, 23 Jan 2024 11:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NmfyhidD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09B5D8F1
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 11:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706010600; cv=none; b=Uo6CjlIE/GuOxuHEykHm6a/EZkLKQwwbhDG11FFEZk4N1oMMFvW8nifHXe1KK1/ZH/lGNU1Se75rt/lYDzi+Yry6mQGwSiSPQWU02fsV5UAWQV4iCncli4jiJGol6tDRqg7yXxFzqOiGxod9hVZN7olXliLmLW8SLWzQUx45BnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706010600; c=relaxed/simple;
	bh=5bC09vgD7VmrESs1alLhu6EpMuDiGscc90Ewm/A6g1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GBAk+cRtDXPCS/rZogIRbn8vT2miNfuERXlmo3BboWqCF9rRGFQOoac27OPTkoN5pS4ICqNBUhOtcOj6mHoc5EwvF1Qfzkx9E8HN1LtXOJb19CujO1qm6M7sL8+j5O1Z3Ax9fTEvJuoKYdkmN8+NM3SUrIRZsMCg1ExV5u+0GVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NmfyhidD; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a28a6cef709so417964466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jan 2024 03:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706010597; x=1706615397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Nl5aSgUhW5224Zb5I6h7KA4cDC9AhC2LWUB6hKUEnbY=;
        b=NmfyhidDi7pfjvIDWileBSr6xJX2+TiBCgHE4fjgI3IoD3sovX+0yL91dT+83OsZ1h
         LXt9d79yMLy/50uBuIiQ3kG0cb+0y6T7eOqcgXweXSihBEVNmpMJFVwj81TR7UWZ75jM
         V4QU+4lLBEq/ZpACpNTjLA4JAMj7qyWuKvrghPWfHqUqA+1teVfwYQ4siazilG93etn4
         XeG68TOPfEBDimlAkFQfz084a92idhGbu63SeBa/k9pK3oA7dQuH52agwyGIQtRxzQFW
         xk4F/ji4d5rJbzvdFkDcInE6AF+DvZKsVyWnU+tlLRkHY9wFm0C2GnK3bCEmcfKe24D8
         fQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706010597; x=1706615397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nl5aSgUhW5224Zb5I6h7KA4cDC9AhC2LWUB6hKUEnbY=;
        b=B9A+Xhr6y94+g80B/FAYLfHp3bmH6aXBh3MjII3J/HUTe8y7qsVLRbef/pi1c442u3
         C4pwWdhcxVIC97X3XtMh1qV8wUwgIvl2titpYmFZi7O/p62PluLYs6VBtsAKl/QIM6RP
         bhT0LXHxQknr/nEScPxzD5qJCGz4ILfiqCCq2VcvSFvBcTUbjSsMcqgeGTLDb5pa+LXn
         ATcx2BTO1syff3ba/bO0ONBOxdMoxOEfS4dz5FzoalhQjb60Fv4w1grTESb9O9flFQEG
         M/s7RDlBGXNxXPVjGG0HpoVRnCZi1FtpIQXRSsmz1iPtkjztcKgsG+6SpRzuBVGrYHUZ
         Hb7w==
X-Gm-Message-State: AOJu0YwD1ve+uG3zfhoqydgnlCb+QWVbb5nSAmYU3OK4z4VYTXkpuJkK
	IbC1ACv/VkSflbpLJ/tzT1ZczTD6kd6xeVBqHTSgxyguOg12rHlrMPW0iN14pyo=
X-Google-Smtp-Source: AGHT+IGMqxSLffD7NLcEGQBjjhAZx//MLEVRpkbTYe3+mhpWdIhi1Dk8+v4AX01N6tjRbyCraj7Yhg==
X-Received: by 2002:a17:907:1dc8:b0:a28:bdbb:dca7 with SMTP id og8-20020a1709071dc800b00a28bdbbdca7mr40934ejc.15.1706010597194;
        Tue, 23 Jan 2024 03:49:57 -0800 (PST)
Received: from linaro.org ([79.115.23.25])
        by smtp.gmail.com with ESMTPSA id vk6-20020a170907cbc600b00a2ecec00a88sm7357656ejc.99.2024.01.23.03.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 03:49:56 -0800 (PST)
Date: Tue, 23 Jan 2024 13:49:55 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Rajendra Nayak <quic_rjendra@quicinc.com>
Subject: Re: [PATCH v2 10/10] clk: qcom: Add camcc clock driver for x1e80100
Message-ID: <Za+n4zfzoZFhhLIa@linaro.org>
References: <20231214-x1e80100-clock-controllers-v2-0-2b0739bebd27@linaro.org>
 <20231214-x1e80100-clock-controllers-v2-10-2b0739bebd27@linaro.org>
 <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <624956b6-d7ea-43da-bb8d-32d9166a0272@linaro.org>

On 23-12-16 14:39:48, Konrad Dybcio wrote:
> On 14.12.2023 17:49, Abel Vesa wrote:
> > From: Rajendra Nayak <quic_rjendra@quicinc.com>
> > 
> > Add the camcc clock driver for x1e80100
> > 
> > Signed-off-by: Rajendra Nayak <quic_rjendra@quicinc.com>
> > Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> > ---
> [...]
> 
> > +enum {
> > +	DT_BI_TCXO,
> > +	DT_BI_TCXO_AO,
> > +	DT_SLEEP_CLK,
> > +};
> > +
> > +enum {
> > +	P_BI_TCXO,
> Please don't overload this define with DT_BI_TCXO_AO, add a new one
> for the active-only clock. Please also do this in other drivers in
> this series.

Nope, that needs to stay if we want to align the dt bindings between
SM8550, SM8650 and this. At least for dispcc. But I would like to have
the same dt schema for the rest of the clock controller drivers between
platforms that share basically the same ip block.

> 
> [...]
> 
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll0, regmap, &cam_cc_pll0_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll1, regmap, &cam_cc_pll1_config);
> > +	clk_rivian_evo_pll_configure(&cam_cc_pll2, regmap, &cam_cc_pll2_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll6, regmap, &cam_cc_pll6_config);
> > +	clk_lucid_ole_pll_configure(&cam_cc_pll8, regmap, &cam_cc_pll8_config);
> Do we know whether these configure calls are actually necessary?
> > +
> > +	/*
> > +	 * Keep clocks always enabled:
> > +	 *	cam_cc_gdsc_clk
> > +	 *	cam_cc_sleep_clk
> > +	 */
> > +	regmap_update_bits(regmap, 0x13a9c, BIT(0), BIT(0));
> > +	regmap_update_bits(regmap, 0x13ab8, BIT(0), BIT(0));
> Please make the comments inline with each line
> 
> Konrad

