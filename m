Return-Path: <linux-arm-msm+bounces-12493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 255E4862CFF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 22:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BA6181F21EFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Feb 2024 21:00:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D94D1AADB;
	Sun, 25 Feb 2024 21:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tksXgWRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058B11B81D
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 21:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708894846; cv=none; b=QGrUX/s2qsb72ENGhvSRtNMaZ7VE9J4hcbbuhqPchD9jz42Y/KhBGSfKF7S4Pk1Dn5qqkzK0XYbCZR/p2sKmzfxyd9aZMEpStAA8DKOH7zaIhmoLQ8wfd8UrBPMKMnM/uqshO3YU4AuVM3m35MAaqs1RlyQ7mva/5RSgHmRqPjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708894846; c=relaxed/simple;
	bh=unlIYXL3BwizleLlMEBQGYNfHGKdQOyg0kKHZe9dPEY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E9cEC0oGe2s8ueeCGiBFEuOOQOt/j7pGF+ajYhEYdRlTFh0HrX0Y7ospodC6amlo0YunmeHiRBWJOJOPKK/i0QEwUS1qjK/5wt/Hy33M7TyHcTpiFNN+M0XT7jXT5PetK9s/+ZI2CQ0R0gKiP5E6TbnTXxnrQF0gdlpkp0rmvx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tksXgWRG; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6084e809788so13747427b3.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Feb 2024 13:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708894844; x=1709499644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KqbMk46NxtU+fpvdDcQrXCuDM/dEl6vfrxJr2Yihlwg=;
        b=tksXgWRGOsSgTIqcFZmmzJOxF6Cxkq8yU2hps6BDvX9wo48Kpt/PBHN0BdletCN8jG
         sloPCuUyKtPprdw4qZ6i7fUSRFg4p46dRxULw0UaQgDGEIBU+0YKG05Fqzhz5b9hh3Hm
         RZcrFL9iwC8OxCyQm/AXlywB8d+c0Vs9U4cWXaMCDbnz7OmiG9NlPkCWb5Z3R8igCfAs
         Zcy7Wbvm9l5KdlV9Uh7ABVFREOtyddOZlYHgITrssUaFMqsG3NtzaCYtoxHRgqvIcM+a
         WEY754Vi8kwv0gdT891lOQUn63yN7smvXA0hzUO1XBYQ868pBg4PSuI1jvmeUpG59dpa
         XFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708894844; x=1709499644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqbMk46NxtU+fpvdDcQrXCuDM/dEl6vfrxJr2Yihlwg=;
        b=p/QcdlwitQLevnNjSZCjysIy33G4Bpx/5Fkj6xbpJeXI3Q/+4YSFczTWqNTEySMrPg
         XVt9h/HDpWvkrNPQgJupZDfoXovsZrJXk7qHkwLo7KMAgFS1nOyPY02VjiNXLRkn6w5T
         IkT1KLtv3Qd8/3suZB5so9mO3TsOPZ+vuEu0O6AU0tGMTyLZqnBQ9sbWD8sba/3pf8G8
         gzrDRbhNFGF6cdEpUI4KdeB32Qtue6s+5KiEAO2BoNAHPx4hGo4WVA71QRy3LfjYOMl5
         dguGs0nNn42duOsxqv/aVJhxfZyZPpW88T7A63GPGqHwzNr2whJfrMjjF7TaFQttJr5K
         1JVA==
X-Forwarded-Encrypted: i=1; AJvYcCUeKnR7vLxang1tsfEJegIyAWERP/ZrJbH1jjFgtuJGuuUhI5/lMnRQkSkuMMQTpfOdfukiPme5TAhl8r0AAZx1DIpUHjd0AKcYDcgNtw==
X-Gm-Message-State: AOJu0YylvuikOFAcnMQEBywSMsxstGS79EjWP+iE3LX1h3MP3Bxh05Ng
	xwUd3hbaM3NXWtDqknYoYCjhPAyyB4+g9FDcM0WG3yXARGVEKLT5IB0Iw3eII6vsVgM8+SbL0RD
	Xqo+y+61HIaAtR0fGB9D4g0g9gVyIOfEpafZLfQ==
X-Google-Smtp-Source: AGHT+IEqqz8HfqIigknKKk7AO/yotuhTPLw8B2KFACuiv8hx5tb8SwwFs8WBzSRjLRJOs2BSRjve+1IeMNGqw34uTP4=
X-Received: by 2002:a25:7e07:0:b0:dcd:a331:40ee with SMTP id
 z7-20020a257e07000000b00dcda33140eemr2928290ybc.14.1708894844066; Sun, 25 Feb
 2024 13:00:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240225-gcc-ipq5018-register-fixes-v1-0-3c191404d9f0@gmail.com> <20240225-gcc-ipq5018-register-fixes-v1-3-3c191404d9f0@gmail.com>
In-Reply-To: <20240225-gcc-ipq5018-register-fixes-v1-3-3c191404d9f0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 23:00:33 +0200
Message-ID: <CAA8EJpr19P6P7COjP8YpFgK4x41Q8M8A3+n_avtzfpKBAuxBpA@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: qcom: gcc-ipq5018: fix register offset for
 GCC_UBI0_AXI_ARES reset
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>, Varadarajan Narayanan <quic_varada@quicinc.com>, 
	Sricharan Ramabadhran <quic_srichara@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 19:34, Gabor Juhos <j4g8y7@gmail.com> wrote:
>
> The current register offset used for the GCC_UBI0_AXI_ARES reset
> seems wrong. Or at least, the downstream driver uses [1] the same
> offset which is used for other the GCC_UBI0_*_ARES resets.
>
> Change the code to use the same offset used in the downstream
> driver and also specify the reset bit explicitly to use the
> same format as the followup entries.
>
> 1. https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/blob/NHSS.QSDK.12.4.r4/drivers/clk/qcom/gcc-ipq5018.c?ref_type=heads#L3773
>
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
> ---
>  drivers/clk/qcom/gcc-ipq5018.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

