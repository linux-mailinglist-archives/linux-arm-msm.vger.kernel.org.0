Return-Path: <linux-arm-msm+bounces-36689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 208019B8C61
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 08:51:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEE811F22484
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295BF156220;
	Fri,  1 Nov 2024 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iNau4nSZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5C71553BB
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Nov 2024 07:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730447492; cv=none; b=qwFRQkZxkLsrsJK+mL0JDA4aM5TkDZ7oufB4ik806BPffxq18uMusR1Au3BNzx6L6zLigzFGuoJplrEUvO9dqr32wYhccMyiGZPQHClrgn5STrNB7ROP1tj+z4g1A90MZHd1f/UzLEj3Yj5oFIKtRPZDDPVEBqRImCDn5QJwZ08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730447492; c=relaxed/simple;
	bh=54DqESZlYqBhpdFS4xo9kjRNR1PKQLNseeEa7REG4ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2rB+TLuL4Zx9NIDKY6XV+elciPCVtAb+UW30EuXNmqvJgP4Wlmtj1XfSfr+lXxeg85JNg88fl3WFmFtE/jVgDQPtuCoT2vVW8LbHcoMzxOHwD0v6VSV4F691ssv9pqWfRmmk8HhTlDjKlkur+4EMKisbcyKi3dIwo0dGB3ZJI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iNau4nSZ; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539e63c8678so1988024e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Nov 2024 00:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730447488; x=1731052288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NRkvXPZ8JHdMt1ObYm2diwWTjx5gL9WrGNqbEgY4R18=;
        b=iNau4nSZ75vG5zXbLxkqskJXGHulUbamswDT/7ORZrOJk2Rw9TaQ4jL/lEG5M+38Fw
         v4EDNvvLYuUCtJFZ/kAOmerrfoPl4QAU+kslH7CAL+oILXMQLAx34SJtX2KkqU7jlLIO
         UlQS/jrqgvFKi1VZ+FQr5oSV/VlVNaR26HCvb4sdQ20zIOljRDbbFC646bTEKEWTesnB
         LTsoDFiNaVUlDQwqV8AxsSdoMqjy9XJb2Q29rEiTtqW3KbDMjtZpFPeKf8slV7bXrZvL
         UdnHyL78Odn7YahjV6EB5K7eWa6xn16bx5XN6glcxsHOhjZjKtj7kJsykAmZv6W9OXp6
         dOHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730447488; x=1731052288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRkvXPZ8JHdMt1ObYm2diwWTjx5gL9WrGNqbEgY4R18=;
        b=f14MmzctWrVtCbptg2s2CkpOAsEmIAfFKfzwPdjIln5NK7Eu4FlFRBpsAZMH6dgEjp
         vFRk6vPk++17GZbhN5lyRhliw7c4KW3ZeR052NNMfYUEzbX+Rlwo50dLtzDRd89zO+Yt
         uUpsvj5MUgP7Z/x8JOjKukq5OsOVdL2axlkqmYL9Ss2OE0CfyOsQ+5f+sS2HuAQT55Nt
         WOpa4eW9TSwxGdFhYvLDnBf+GMVnpRHrRCbE/aHy4+xI2wk/cDdQUIJxhLfQg00jPtfu
         D8s9wm1NF03pQalfNddlvkfh9cKeMb78FcPBkQfrsuUg0dFD37T8nbUbGwHC8V+PWhHq
         No6A==
X-Forwarded-Encrypted: i=1; AJvYcCXnIehECBGQLo+ffNMAyLVXFScJg+HW0RNRu679RwokdihO8WnmCkyCw466RUxGwPBKql8M6fIzpee5bXO3@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjuVKg2ABmuxKG/RNVP5DM0CiKjPqJZqqtyrwR5Pr1mNDFlgo
	PsRZx6j6tFQ+2zsp1oWD4P7saS7a8MjdU6/byf9CHmm6cHu74uriB3EteuIjIvY=
X-Google-Smtp-Source: AGHT+IGPOzW7P8Qpqr82hfO5aoQ+d4UH/SQ+8QfM1v/KG/8zonaRCFmqO4N3jsxZsE+G3OdLThdt6Q==
X-Received: by 2002:a05:6512:e9b:b0:539:88f7:d3c4 with SMTP id 2adb3069b0e04-53d65df26f6mr1346486e87.29.1730447487891;
        Fri, 01 Nov 2024 00:51:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bde0c76sm468437e87.265.2024.11.01.00.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 00:51:26 -0700 (PDT)
Date: Fri, 1 Nov 2024 09:51:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
Message-ID: <gc4w2n7zhycgxrv6w2waew7y5lmvxgownqw3vrwnxp7gzgxgez@bmr2s63qcpha>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
 <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
 <2aa768a4-b0e9-4b2f-8d74-736a88cf81cd@quicinc.com>
 <CAA8EJppZyJt_MWrafSKReuCXy0RtEAQ6VE-kt_Fp41eFpsW2SA@mail.gmail.com>
 <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ea32f2b-a765-420d-9cc7-f0d04d27ed6e@quicinc.com>

On Fri, Nov 01, 2024 at 12:45:07PM +0530, Taniya Das wrote:
> 
> 
> On 10/31/2024 8:44 PM, Dmitry Baryshkov wrote:
> > On Wed, 30 Oct 2024 at 20:04, Taniya Das <quic_tdas@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/19/2024 1:58 AM, Dmitry Baryshkov wrote:
> > > > > +static struct gdsc gx_gdsc = {
> > > > > +    .gdscr = 0x100c,
> > > > > +    .en_rest_wait_val = 0x2,
> > > > > +    .en_few_wait_val = 0x2,
> > > > > +    .clk_dis_wait_val = 0x2,
> > > > > +    .pd = {
> > > > > +            .name = "gx_gdsc",
> > > > .power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
> > > > this platform?
> > > > 
> > > 
> > > On QCS615 the GPU clocks are directly controlled by high level OS.
> > 
> > Is it one of the gmu-wrapper platforms?
> > 
> 
> Not, sure of the gmu-wrapper, but this platform does not have GMU.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

