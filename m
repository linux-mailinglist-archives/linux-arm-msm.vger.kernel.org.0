Return-Path: <linux-arm-msm+bounces-26324-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1993257D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 13:22:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F23AB23C3B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2024 11:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24951199393;
	Tue, 16 Jul 2024 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qM2oJ7fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552C1991D4
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721128856; cv=none; b=vERcDhyl5M+xep3EoWeIoy9/QDAZgrXMDk0dtyAebozxQ4fmFy7RMtokh8e1Ib3yjwKd1zPHvuKHT+dsvQBk9VB0U6Pn7kX9rBTVk4Mpt+nYgPAu+QAwnJuZjHYEq3XWStq6OEmBtpCOqA4s86cydgVg4dNAifRZLmhrl9kNYDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721128856; c=relaxed/simple;
	bh=fDsipehTFQ1zqnPAjs6XM+Km5Z6Ld2LCDihrL1BOuaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pr0TDoiIijFRlhZGFVPafE+0OLh2iuQEjjn3i0plzwixQyfah+lxZRo8ngBsU0QdzjYm9zsHYdPilZ34vX/Sqgb9w7I+fqsXP8FsPNqq81JG4v0XJ5x8yVE/sPWPRAVQGfHhzdgTSG8EM9clStZVcQXzq7owsFEuQNLrifrk9Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qM2oJ7fj; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eee083c044so33627421fa.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jul 2024 04:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721128852; x=1721733652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8MB8dWskGGog6BZUIVGbqIDdq5qdkeZBw32MBXf2k8U=;
        b=qM2oJ7fjytmbT16YSpv8rM47gCQOSAX/8JzHL05YSFLNrBZcQYiTn9J+QYvLW1nhTZ
         1vjcbFS3lFDvUGgt8j/KUOaB6qbpJHLl6u5og/OLYmjpt+GimT36SrUhxe65UPD6zgo4
         ZlNgMcoAKBXhjLKprNoa7l+iK9cQ/EC7aBsspxdktbge/IFDoSOqe7nwaeqHtQbrjHnp
         gNC6pyPT79KSmWKINa4nBghXmsMVl19rz3TxOVDn55LVJlQDOA06zznVO3bZhzcKbliT
         aXve1MivGXpOaYLk4n0uGcQzAgtPIf4u1JV7SnQEAeNK9IgXLMG4GYEuoRIlc1uxqRwM
         JjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721128852; x=1721733652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MB8dWskGGog6BZUIVGbqIDdq5qdkeZBw32MBXf2k8U=;
        b=K2nzuYfHSL8Cd2Jw/9MldHMIwDkh9/3cTer05oUattrHm6wBIy1yf9UsFDsjxPUNVv
         hV9vD5GB/R2LbbAKLs5/gHdpl9S8obq++JsPvoHMH1fHEiKm+Ni04Q2P2CREEovXt1u8
         //V+1qiWRcJmgt9WXQmS6SXQy8t309mhrWcubOgWpFkAsoApRbf/QETrr6ZhxDGv9PCE
         m+kHbXXD31Ijk+HToCoFZewmJY5nfRWSd0fOCFnfh7/LA3Sms3bxFJiZcxGPzFLKT+A7
         l95DsqtzoqlG2ASEF/spOb4zqRhQhjDIzEytMcthmDKx9oGyouqg99yGhIvWmT1Ra8Ag
         HQaA==
X-Forwarded-Encrypted: i=1; AJvYcCUloATs1QVxZXcYdLAB42OkkzWXraNBGXnuKnO7tR78lR4Bbe30uJJ8dgouK2Z4hDY4XSBYAPzP/DR3jOMfBTI7hIOXqNMq2PBBJHT9aw==
X-Gm-Message-State: AOJu0YxG7tkM5Xsk8fGDxnWBBCyv+6j1MqXAz17zwAKt2+Tma1As96q3
	4dqWJ6syR7XH95ov8HjKYKSBNuanpZsCmK+P5MrEoAd45iYcUNnaoPYIRp9iKIS1QqCGaIFbiwQ
	1
X-Google-Smtp-Source: AGHT+IHei+Ksc0Jgp1d9PgvEAOF1zzPbcYMBjOQLNyF9dppFt3bYWZTsQzp8tH4DhPGsjVWbMYFMkg==
X-Received: by 2002:a2e:9f48:0:b0:2ec:59d8:a7e6 with SMTP id 38308e7fff4ca-2eef41d7646mr12595601fa.30.1721128852263;
        Tue, 16 Jul 2024 04:20:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee1940db3sm11336981fa.128.2024.07.16.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 04:20:51 -0700 (PDT)
Date: Tue, 16 Jul 2024 14:20:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Taniya Das <quic_tdas@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: qcom: dispcc-sm8650: add missing
 CLK_SET_RATE_PARENT flag
Message-ID: <dccttz5b44bl3lwmcaqz6wjx3n4sv3eq4yh6276vzwrtkcvqcw@qxhbo7bylnsg>
References: <20240716-topic-sm8650-upstream-fix-dispcc-v3-0-5bfd56c899da@linaro.org>
 <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716-topic-sm8650-upstream-fix-dispcc-v3-2-5bfd56c899da@linaro.org>

On Tue, Jul 16, 2024 at 11:05:22AM GMT, Neil Armstrong wrote:
> Add the missing CLK_SET_RATE_PARENT for the byte0_div_clk_src
> and byte1_div_clk_src, the clock rate should propagate to
> the corresponding _clk_src.
> 
> Fixes: 9e939f008338 ("clk: qcom: add the SM8650 Display Clock Controller driver")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/clk/qcom/dispcc-sm8650.c | 2 ++
>  1 file changed, 2 insertions(+)

This doesn't seem correct, the byte1_div_clk_src is a divisor, so the
rate should not be propagated. Other platforms don't set this flag.

-- 
With best wishes
Dmitry

