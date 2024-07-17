Return-Path: <linux-arm-msm+bounces-26428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 48806933A4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 11:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD7431F22944
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 09:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8601CA96;
	Wed, 17 Jul 2024 09:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyWj77tN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D389C17E8FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721209801; cv=none; b=VxOJrIMCPNBOGGVWWbpOINsnnZb9jGGdFhiAIM6WtakcsNN7ztL0vSJOTaM1+wyjYei7q5RfHMBsYhtTQqB3N7BIwFsleZMndMBcxxnTYnQ0ZbPTVPsvnmGb6HH+cc6y0dhUOVEik8pXfA2cPr4WPwkHAQxdFKHS+65klI0HSJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721209801; c=relaxed/simple;
	bh=H5PoAttukPkaOiwXWePhqYK3ZaPP5UucflmTGihpw98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCVCUWcccqfsB1p810Tt80ygMbplsQcwZdgMpzawquwvmwDe5EXZNIgQsjRfG6toX4kXP++nbmXuWvttN+uDwZXiudYe7X160cg/rYpSdHy+qSDYjSuYCEXFa6USmt9BKbiKmWne1ID+GOEJbKFUa3xzV41hC2RFd/zOn+Ll1yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyWj77tN; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e05eccfcdb3so484137276.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 02:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721209799; x=1721814599; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dfAvVWLrB3F7/a07jguYyX27pLY+S5GzkT3MriOJkc0=;
        b=iyWj77tNSpn4+oDU5y3bsCZSrpd3zDl7mTugJlLNZghh4NHMRgHP+seaoDT+X6Zp50
         a9WE2gfNg/fgsmpoChdh44cCB9HZKKllzj287Cg0/bw99mPAX4SmKdOLFEhXGc6DnNNn
         lsqLcRXZgzUimky24JoYcovDd2Kjia/ICstpky8kBPVY/zGhvZzRluC24t3Ic9CfKAD/
         /F3A7qd8dp8VfR/xfCXQ/jDiuntJlYZYpQyg2LLwwvehoWBa90r/fPeZQLbiW0HWGv6k
         oxYc/mwJ9+B7hJNhxsAiZ8fDByyOT3NmizKPUzl7Q0Lpu0p/CKcrWUZPLBCD+JcTyGYo
         /7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721209799; x=1721814599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dfAvVWLrB3F7/a07jguYyX27pLY+S5GzkT3MriOJkc0=;
        b=sdBf0d2tFA8ONdc97Va/o3VLrFIn+FlMJ39nWL0/fsjnXw+wamKxG08+JiQEUl0Spu
         B43TVsxkuLPy8kHqk8ncUsp4MM8s0u1gORwdCZksz1TRZAW/joNg2lr8mH0a4nrwGEQt
         8xAABSrXUkUGyRnJIQgndCc9sI9btPKJ24WMv2AVZ9S8RoFVlRU4Yl95IfDHagYCznVY
         aoyTYXFjdK+giC77BU+NtAeNeEOlj6S806K/VGJb+ntqok2YGpQvkVtXyIzY6BwH5umE
         uxPvpIltFEzFVs5smuhj2VHi8VxKnoszyYILB27hbOHdOIUFrS1N7wpVvweMhCyb1U3+
         pRgQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/EwVTE6NFU+XY/8sjaCwWYqpAe4jrz6xIdFXxf1o8bLRyhLlodkJGd10MoC83Rl77F4A0QCPCT5g7bBjehrRbC6Kl6rhX8RYSOz2p2Q==
X-Gm-Message-State: AOJu0Yz+51ufvZdpxSJF3XQ9Yxstoi9ZXGh1sA/Y8DSYBd2S6vqbNebj
	HtyNhyNdi0E3I8rlL8bZLk4aXgIMcC82iLhl8TacmPPIvpImYZUKk5EmT2avydryGkiOOFT4baM
	CQ2XDgOgXZ08IZhhRyjCVDevbZvECPQn8q3PjsA==
X-Google-Smtp-Source: AGHT+IF6nCzOpXaRWt9Ib3jOdlVzNTPk85lJ7twhcXVYMp8Nqyhe17ix7FKx2TyF92rD+HSwMWfOHwxPHQk1Q1iI7IA=
X-Received: by 2002:a05:6902:1692:b0:e02:b9ac:1486 with SMTP id
 3f1490d57ef6-e05ed82f82emr1265122276.57.1721209798862; Wed, 17 Jul 2024
 02:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
 <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
 <9ad10d92-d755-4fae-b206-6e8648be6d48@linaro.org> <CAA8EJpr9L+AKDhuHfQa=Nco7fvG9vLH3a+gxVhENrhz12b3n=Q@mail.gmail.com>
 <278354ec-532b-48de-8ee1-5477ddb4a285@linaro.org> <kxrhhb3vdojbnqfbwks2qmob55fwm3onleood73qfk6esl7g2c@q66kw5am4emc>
 <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
In-Reply-To: <94e48e19-781e-4de3-a4e6-da8e923a1294@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 12:49:48 +0300
Message-ID: <CAA8EJpomVKiVrRxSEJmjvNXLGGKVvcr2wGWtE129eUoUfgYC4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: neil.armstrong@linaro.org, Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 17 Jul 2024 at 12:47, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 16.07.2024 6:46 PM, Dmitry Baryshkov wrote:
> > On Tue, Jul 16, 2024 at 03:46:24PM GMT, neil.armstrong@linaro.org wrote:
> >> On 16/07/2024 15:44, Dmitry Baryshkov wrote:
> >>> On Tue, 16 Jul 2024 at 15:32, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>>>
> >>>> On 16/07/2024 13:20, Dmitry Baryshkov wrote:
> >>>>> On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> >>>>>> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> >>>>>> and byte1_div_clk_src, the clock rate should propagate to
> >>>>>> the corresponding _clk_src.
> >>>>>>
> >>>>>> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> >>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >>>>>> ---
> >>>>>>    drivers/clk/qcom/dispcc-sm8650.c | 2 ++
> >>>>>>    1 file changed, 2 insertions(+)
> >>>>>
> >>>>> This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
> >>>>> rate should not be propagated. Other platforms don't set this flag.
> >>>>>
> >>>>
> >>>> Why not ? the disp_cc_mdss_byte1_clk_src has CLK_SET_RATE_PARENT and a div_table,
> >>>> and we only pass DISP_CC_MDSS_BYTE1_CLK to the dsi controller.
> >>>
> >>> Yes, the driver sets byte_clk with the proper rate, then it sets
> >>> byte_intf_clk, which results in a proper divisor.
> >>> If we have CLK_SET_RATE_PARENT for byte1_div_clk_src, then setting
> >>> byte_intf_clk rate will also result in a rate change for the byte_clk
> >>> rate.
> >>>
> >>> Note, all other platforms don't set that flag for this reason (I think
> >>> I had to remove it during sm8450 development for this reason).
> >>>
> >>
> >> Ack, I think this deserves a comment explaining this, I'll add it.
> >
> > But where to place it? This applies to _all_ dispcc controllers.
>
> Commit message

It is already committed.

-- 
With best wishes
Dmitry

