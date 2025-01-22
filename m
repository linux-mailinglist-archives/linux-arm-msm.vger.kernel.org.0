Return-Path: <linux-arm-msm+bounces-45839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE40A19575
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 16:39:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196811882A34
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jan 2025 15:38:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98D02147FD;
	Wed, 22 Jan 2025 15:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsNU0d96"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8E038DC0
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 15:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560326; cv=none; b=rO37y4S2e1YR8jQ89pHXbgTIxkmbx5WdLXkjfsRPhjWfUhHQddPE8GMCzsySFdUwdLw0yvsBNS8RQddZrmxt9lwSIJjaP2bNnKv5H1RHxcQagZEKycI3jkZ3Ji8JiVm0Tv8dsq7elNu4VVtXX7HOQblzP0xGXKSrUzGuNpHs7rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560326; c=relaxed/simple;
	bh=xYKMPTuBDts6tsHI2iDmnq6xesXtDwIjCgZNrXOuqTs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyH5CYedppUB2SK2x1r9LVZKhTFCBiSwlkGwIkR0fsYyomlGlZeill8IdlBmvb08lRyhPs7yXQR83RPPwxy7VlR8+Nd2CwohWOKXR0jIkafPVL8xvzofZXiNLoATUlCHc9KhKMNjotSXLWDs4R9YDgIyCKR3qW77B2PNqW2pdlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HsNU0d96; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ab39f84cbf1so906727866b.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2025 07:38:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737560322; x=1738165122; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bQ/UGr0IGpTF4zgyCNABJQGGulQl+wyvTdTpCyzBgc0=;
        b=HsNU0d96PQS+ZT4c9eN0c/wBr+SYlqRgsDow7XI3TVwQXJllZcr100P8FBOXNE3Hzh
         gKSm94nYCu3k7OXEIv/Rt5c+ZJcg/zRZijfoQfilfnU26vyKWEvmgwXTjs8g7lXfNXPI
         4MNShqvEbQcs7uv2Mt2g6/biURv5W0G1i0N9okzuczyRIzgY2UN6TPFaF7TV84mfbyeX
         fExCjV64evwDvsA/gPZR+8nrer7Ljtw+2bzoV02fjS0n+0vjR906BSAjQP4H+A92pTzf
         4BFGA4YlGMs0JUybjVp/iDc7UHuKJLFC2H/91AIdnblnP00OpktOVGuRx4nJOwFJsAa3
         pqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737560322; x=1738165122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQ/UGr0IGpTF4zgyCNABJQGGulQl+wyvTdTpCyzBgc0=;
        b=AS428LIibp0HK4o6D6yLekjUI57MGJkkcuAYIZN8En0co0zFWOYmcr2bRUEZfQWcF0
         LTQ9hB3F3wmwoVLDk19ffUk/qA0ZuElfPfx/Kr6CJ6DJt5adLi2jwRNj87kYYyINBMKs
         AEsI7TATSmUmd4YOZ6Hj3HU3YLmIy5R8UD+NRFZJtFrNou80n0JFz1e/Sj0zGg2slF+m
         xVy3Af30wDZo/pEGUfd6On6y/eIzF7K5ZXI8QaZetHIu4kdHy+3c51vv2JdPcrtOf3zo
         EPdLCNRafpp9A66nOOcLMn+EqQxSMuSzKuKEnNBPia48zIs5WcsO23WsG5d1MeSsgiB4
         kOHg==
X-Forwarded-Encrypted: i=1; AJvYcCWG3+3RDz9lC8pXa+TiDGKk+dPBzit/utSwV478bpyygOOQuVR5owX2yarGKaCoYXS1Q9e6NlhCjNT13uWs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6VFP8d2WvPxz/qUEOAulzJuGp6CYjHtGSDHZbKvtGsKP3iH0d
	jZwNG7ZwB27IU8iR37ieSzlugUtj429me2XYMJVMQRD0HAIKy1qEjfLFTqMnfs09IYI7mIGcdcG
	0RitLg1fcPaTvq/C1JalVkUK49hNPnJ7H0DucHQ==
X-Gm-Gg: ASbGnctWoxoJ7JgvUsvZ1uVX3lC5kZXMnrjQvJjZY5Ump9Kmm/+4ar2vojWpVNIUhDS
	2QqD1f94UP/ScAo+zk8pxs2hLOudg6Hs+FDTN3XQvZxu2TFYmXjQ=
X-Google-Smtp-Source: AGHT+IETe7thCSCpbowi9b632hZFutI2WPKAcE0XCFKit3ktxcH+m2wBt0ggMcEmf46PQAkItYj8rzjojIKKysN3liI=
X-Received: by 2002:a17:907:980b:b0:ab3:61e1:9b06 with SMTP id
 a640c23a62f3a-ab38b0a2221mr2259438766b.5.1737560322096; Wed, 22 Jan 2025
 07:38:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
In-Reply-To: <20250113-support-pll-reconfigure-v1-0-1fae6bc1062d@quicinc.com>
From: Stefan Schmidt <stefan.schmidt@linaro.org>
Date: Wed, 22 Jan 2025 16:38:31 +0100
X-Gm-Features: AbW1kvZRlPPxGJ_AeXkZFPES8Z8xuCbPMXteMeA5f4p_3jWBu1lE4xY8dVXg-1U
Message-ID: <CAEvtbuviH+bGNz1dEPKXTbBD582hu=us4aiFyo=zHqfRw7+YRQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support to reconfigure PLL
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Taniya,

On Mon, 13 Jan 2025 at 18:27, Taniya Das <quic_tdas@quicinc.com> wrote:
>
> During boot-up, there is a possibility that the PLL configuration might
> be missed even after invoking pll_configure() from the clock controller
> probe. This is often due to the PLL being connected to rail or rails
> that are in an OFF state and current clock controller also cannot vote
> on multiple rails. As a result, the PLL may be enabled with suboptimal
> settings, leading to functional issues.
>
> The PLL configuration, now part of clk_alpha_pll, can be reused to
> reconfigure the PLL to a known good state before scaling for frequency.
> The 'clk_alpha_pll_reconfigure()' can be updated to support more PLLs
> in future.
>
> The IRIS driver support added
> https://lore.kernel.org/all/20241212-qcom-video-iris-v9-0-e8c2c6bd4041@quicinc.com/
> observes the pll latch warning during boot up due to the dependency of
> the PLL not in good state, thus add config support for SM8550 Video
> clock controller PLLs.
>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
> Taniya Das (3):
>       clk: qcom: clk-alpha-pll: Integrate PLL configuration into PLL structure
>       clk: qcom: clk-alpha-pll: Add support to reconfigure PLL
>       clk: qcom: videocc-sm8550: Update the pll config for Video PLLs
>
>  drivers/clk/qcom/clk-alpha-pll.c  | 30 ++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h  |  2 ++
>  drivers/clk/qcom/videocc-sm8550.c |  2 ++
>  3 files changed, 34 insertions(+)
> ---
> base-commit: 37136bf5c3a6f6b686d74f41837a6406bec6b7bc
> change-id: 20250113-support-pll-reconfigure-9a9cbb43a90b

I tested the full patchset on my X Elite Dell XPS and can confirm that
the Lucid PLL latch failed warning is gone when using the iris driver.

Tested-by: Stefan Schmidt <stefan.schmidt@linaro.org> # x1e80100 (Dell
XPS 13 9345)

regards
Stefan Schmidt

