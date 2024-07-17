Return-Path: <linux-arm-msm+bounces-26445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A25B933AD2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 12:06:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AB191C212D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 10:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96C6017F4E7;
	Wed, 17 Jul 2024 10:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MHgaUbjT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A449B17E8F6
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 10:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721210750; cv=none; b=SWNVQWL3CTHq4VtecloP5VqRreBi/h49uCrxuglCpvfoQILtxEqzfv5TgjSAAfcrJuKtf7lWT4cCDL7btDyPykV1/XxgYE2G2t5iXHByjrOe7qYaQ8f1h+FpHqpGy5WIuIZ01CzRfFzWjIEUig0qvtgNJSfvdoF1QfKPS6FQccQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721210750; c=relaxed/simple;
	bh=chH+ucYVFollBpWofReK7yIO2W2cQCdc+Y402fQusJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+7b5uQlzfQEvpr1qd7KEEVFHkk1cdGy132oLwFH2TI38Wkqpv4PC29qZN+MO8UB04diErCTg2vnahygOelbs33R2ZrK4qAjliKKyMLc489PAMfVKdS6PbSBPeiCtBmhxxoYXF1yDIfvB0gRuY+BzuqBEzSRwnEhlRBBkzsWk2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MHgaUbjT; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e035f4e3473so5987161276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 03:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721210747; x=1721815547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZoUdOZLlQAAmruOrbVsxcaV8sc5lR/mg/6r1PDCx+D4=;
        b=MHgaUbjTxFa4sb3U5Fe1s+s4pJjXrLw7qPqmKCOFZbVB6VLZADtVn+tKOUFmmCxJ3e
         nJ8fRj4TsTJJ0W04Bt+aL+4CUT5wOhEeME9v4GrGoVh1oBStUmYNllqbiAhCVGZkLpxV
         hz//tbw5mCesmkSJZ4mwKppTtAQG+wsSh+5JlXv3/daW29hDSDgh1EkIBnd8vG6Cyls2
         VsBovnQbDH1N6BBC9vWtXsoZDp+ATUlSY9XrOfR5bzsuxELo7EKQWCZLBao+5rDjlGDp
         k437e+X2b/wVjtisDb3bqo+njXYZVUiHrmvsrb/V+RCmql+9LcP6nH2qhdk1t00ergMZ
         mQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721210747; x=1721815547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZoUdOZLlQAAmruOrbVsxcaV8sc5lR/mg/6r1PDCx+D4=;
        b=dNyk/6aHR4WdWXIJAh2y1oPYUsBwsMRmX90VMfA2Wmlc2V4ON0nZQmAOd/stYOsT5m
         YMlbsjizGIKOJD+r81/50oFmEYaSSwsj0HrAoakKKbclcLB4R/CuYTGSxjc5NJ2h8zqS
         vBwNy3F4VwGJ2fbhg1CRGqdN+wCGCwJ30cWyeAfiJKyQRsZufInElGWw4/AQEsU6s5c3
         sHuJQJJjodkOrq3RazVYxO2Sc+/IEZiwZCWcwCa6cpImnfvhfuIeEVDlW5JQJJA0RkNE
         h0d9hdfSyMH3CNDxDiUwe7dg2eHYAE8j6wdl9hicWa0wHyRr6ZkcLk1UVLynYl1XbIH0
         xm9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVp5vI51ArQvVefm0HzvFOiKZnrmxtKMadJu80o30IqANF+BjcnSG8LBCIfYUv20hYrzsKTcOYzzrGpaNDhjv0RDFJWIg57NVv9XrNSrg==
X-Gm-Message-State: AOJu0Yykddst7SFB9392GW4BtdVCpQ7UNPdKNQ0xRsalRHdyOz30Hk3c
	zJ26kxtwHPbTGVxdoLmV3EgqGpsG+gZK1zK6cZ3Jctq4JnXOmLzUOdm1mTK9vnnhhL8DaIKm9r4
	bgq9cj3vAWWdkF2DaCQpmw36VSqGSw6ID3vcM4g==
X-Google-Smtp-Source: AGHT+IHYh/6i/8hq7tpOwurvTcspC0p58XaYzPylkrOGMSKDPt0iy/Je6Pf446cf1ZySUgGleEGSE6zosAzFkMtIqyk=
X-Received: by 2002:a05:6902:1102:b0:e03:4ead:a32c with SMTP id
 3f1490d57ef6-e05ed6ed999mr1472948276.30.1721210746690; Wed, 17 Jul 2024
 03:05:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240717-dispcc-sm8550-fixes-v1-0-efb4d927dc9a@linaro.org>
 <20240717-dispcc-sm8550-fixes-v1-2-efb4d927dc9a@linaro.org> <ef1e4d78-7e94-4853-90c0-73f0b80f9a63@linaro.org>
In-Reply-To: <ef1e4d78-7e94-4853-90c0-73f0b80f9a63@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 13:05:35 +0300
Message-ID: <CAA8EJpoCtEOK=qgqKqFENiu1zCdXsBpR5EXzPZMrQQnuVMqnCQ@mail.gmail.com>
Subject: Re: [PATCH 2/7] clk: qcom: dispcc-sm8550: use rcg2_ops for mdss_dptx1_aux_clk_src
To: neil.armstrong@linaro.org
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 11:09, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 16/07/2024 23:13, Dmitry Baryshkov wrote:
> > clk_dp_ops should only be used for DisplayPort pixel clocks. Use
> > clk_rcg2_ops for disp_cc_mdss_dptx1_aux_clk_src.
> >
> > Fixes: 90114ca11476 ("clk: qcom: add SM8550 DISPCC driver")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/clk/qcom/dispcc-sm8550.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/qcom/dispcc-sm8550.c b/drivers/clk/qcom/dispcc-sm8550.c
> > index 09e4b1e40e20..8ceeb17bbb37 100644
> > --- a/drivers/clk/qcom/dispcc-sm8550.c
> > +++ b/drivers/clk/qcom/dispcc-sm8550.c
> > @@ -400,7 +400,7 @@ static struct clk_rcg2 disp_cc_mdss_dptx1_aux_clk_src = {
> >               .parent_data = disp_cc_parent_data_0,
> >               .num_parents = ARRAY_SIZE(disp_cc_parent_data_0),
> >               .flags = CLK_SET_RATE_PARENT,
> > -             .ops = &clk_dp_ops,
> > +             .ops = &clk_rcg2_ops,
> >       },
> >   };
> >
> >
>
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Oops... Neil, excuse me, I didn't pick up your R-B tags for v2. I'll
send v3 tomorrow, with your tags fixed.

-- 
With best wishes
Dmitry

