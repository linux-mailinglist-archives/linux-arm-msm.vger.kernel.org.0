Return-Path: <linux-arm-msm+bounces-67116-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9CAB15F4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 13:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5219175EDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D4D2294A1B;
	Wed, 30 Jul 2025 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ROHC3poY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFF52110E
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:25:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753874716; cv=none; b=E1NtO4OD55Hdg2hygFY3lQ5pCtyrskZjdFaSOOD39Haec6tCiPiqpRW80qHNKDBa3ydQpctOZcwk73ayKN/iE6JLmJK46J009pZguyzypYMeNVZptYICapCJVZRjJSoRFnuoJbSJiLCZfJzij+Uh6q+VuKsjfKzO8cmd3E/QCvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753874716; c=relaxed/simple;
	bh=AaXLhjZNOuZ+t/gYKYez9Mw6H6FQBgt8vwLmFSdxjLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kpwnVMe83zU2c7aI4bAErH04SCup7M3Xh8ldcmcuT8aG1Glmhe7i0jWT/P29gEdKbQCwhGeDXGmt/lvit/0r7gd56rUcx77DEAsf0zFj1HmOuERNpCiMbrHuVERRaLAObHcUQ/0lHDA6/tIlx7sMctiKI764ecQkFI2759r8XOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ROHC3poY; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3b7910123a0so1729074f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 04:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753874712; x=1754479512; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qWnAgYumacwqqXMAwkn/jSAKd2nQaF00yjwz3QS2yE=;
        b=ROHC3poYJfjmj44dpKbRbnCQUqpYIxEOrPlr+qzOFIG4otBK5vEdp91b/r4SnhgMIm
         kgC7/vCPrQuUvqgPLs92gqlHhsrgh7y72DpeIE3RDLQ0KvdZpUDo1jQ8Ql4pQImqhnxO
         k4UBNKitvcWMK0sR5Evtrze66F/K4DP7dhUZptsCkL0QYgRo4Y6f88aKOZv4oCayp2HM
         pWfOy+vu6m0yh3u751Q8MTbaOHRsXYGkiXIkXcHAdRrsPkPU6BzcjKM3QCix8WgS6EuZ
         VzSIHzk8cxLU3QWBFVVP0FuGHWYWNiStk+nOptyj1KMG7n5DTZCA6lJgVoKaUgeaYE0s
         MBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753874712; x=1754479512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+qWnAgYumacwqqXMAwkn/jSAKd2nQaF00yjwz3QS2yE=;
        b=MMbqqRwz3YTNPTTorkY+GW6Bmcv7pnjYVUJFmUu34mkQmJP71cC3Qi2+h1hX1868Uw
         ueD7Ju+lqzLl6jfeo/ildgtIF+GSJ+9ONoUcCWntupxaBRgfQquIe97t8jmzEy2RdY0e
         Mcbk2ZI1K+L3EcdTUwcgH0bIvpMFEa6Pii8VChbPMnDjlXQ75eRVNFoLYKADyN7jsXSq
         6Dohvgis5Kcxfq82yEsCNPAwEEK0gO+vTJ5uD5KYWPaPWdGalnEKH0klOgKEJfITTf4t
         s0sO6C+BCVrmxTzL1pWyFqSpq+XoGmOTRIdH7Y33GqGzj7mcLj1qUreK0N+lUB3EUPmR
         KFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWipuyOETaknYMokjsz3bSqWM81GzTZQHsLBQSc2HjhAmjC5kYN6sy5S34ZuEyoLhILRbYpghjtJE5zcEu8@vger.kernel.org
X-Gm-Message-State: AOJu0YzoTdiReq+vYAle+RZzzA+lknWLdGE0LUluJSY3il2Dd15B7Ip9
	q5FkncyAXUWK5GEo8WrjOniN09J2SdvtVsG2ERwRB0u+2wdfG36hmrpfP4fhVPdrTao=
X-Gm-Gg: ASbGncvkkMktlh+PFyRGOXVs9RghoUimLpJBWbsIiGcNrh7vwmbqpq0mxXBSIo1QAXe
	sm8ZkyYWAfD2rymj5X9lP5nFbBDHHKEE2/loJp5Ky0D2xSTWhoKiC7jWFxkcDtyYPPv3SDDLmWb
	YiaJAk69ILFWFGPdYuvm4nFdA5JOj14H91CaRG61/voK4t9ZyASBp/FkbVKeCYijn/taWrJxNtY
	fWNHDLbNhELDJkUZBY9L1WqKxDmsiSVSLa6aruJ6Pjt0NMASxBhKYXx5tK8UlH44jfb+XGTzI5a
	fvybTWVN497db0aWVKG/LiS0p64JPuxGl+GyG2vF82qMY9owYL/W3pVyUBOTAs3CWfVCnB4xuoT
	VYJRJImkAtmtu730/OgTZNAPchgCPnQ==
X-Google-Smtp-Source: AGHT+IGQQWsegZemm4F84iyOeDGl9Tnw8iV4E/j71ZP2nFqvNfy276zfwZeEv0tcaCBJzz3K3Y6agg==
X-Received: by 2002:a05:6000:22c1:b0:3b7:8ddc:8773 with SMTP id ffacd0b85a97d-3b79503cb44mr2603491f8f.52.1753874712030;
        Wed, 30 Jul 2025 04:25:12 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78acd884dsm8352303f8f.33.2025.07.30.04.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 04:25:11 -0700 (PDT)
Date: Wed, 30 Jul 2025 14:25:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, Pankaj Patil <quic_pankpati@quicinc.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/7] clk: qcom: Add TCSR clock driver for Glymur
Message-ID: <aIoBFeo00PPZncCs@linaro.org>
References: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com>
 <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729-glymur-gcc-tcsrcc-rpmhcc-v3-3-227cfe5c8ef4@oss.qualcomm.com>

On 25-07-29 11:12:37, Taniya Das wrote:
> Add a clock driver for the TCSR clock controller found on Glymur, which
> provides refclks for PCIE, USB, and UFS.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig         |   8 ++
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/tcsrcc-glymur.c | 257 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 266 insertions(+)
> 

[...]

> +
> +static struct clk_branch tcsr_edp_clkref_en = {
> +	.halt_reg = 0x1c,
> +	.halt_check = BRANCH_HALT_DELAY,
> +	.clkr = {
> +		.enable_reg = 0x1c,
> +		.enable_mask = BIT(0),
> +		.hw.init = &(const struct clk_init_data) {
> +			.name = "tcsr_edp_clkref_en",
> +			.ops = &clk_branch2_ops,

As discussed off-list, these clocks need to have the bi_tcxo as parent.

Otherwise, as far as the CCF is concerned these clocks will have rate 0,
which is obviously not the case.

Bringing this here since there is a disconnect between X Elite and
Glymur w.r.t this now.

