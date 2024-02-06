Return-Path: <linux-arm-msm+bounces-9942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CA84B49C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 13:13:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78BE0B25E80
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Feb 2024 12:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7D6132C11;
	Tue,  6 Feb 2024 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G6EyGV+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85480132487
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Feb 2024 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707221315; cv=none; b=AX05MDQaz87f1mFJ9jXxsWm7qcs697+IBJtUPcr1l7HFzbhSI2aYLjNZIUxKbtNN2/uDYcwqY+DpLuhOeCFPukiBVo+iC/mI5toAEBkExQQE2RQ8Ev3JyIGUwYRbFLXRv9ALT2CyyPC4oeLZSzQ6RH8L3R3IJMdM+HqXs2xB5Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707221315; c=relaxed/simple;
	bh=4Vu5+qjHqnLiD6M7Jx0MYJ1t1IIXbkexS1k3JHNLYrE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StPZlYPpB3V1ZcHflXLc2pDV/Gm0UINTkImUTQ6LAD/5fCH2UiZPtOTPXZJYFZC46hz5W4mRWYiYfpbhD+W7j0R5fZ9t2hP9XOPLpBb8heK5rlIH+ToE8bcv4UMz9ZQWpvhL3rJh5KxEXa9crWQvJzzITLbT5AuDCcyQoh0bFQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G6EyGV+l; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc6d9a8815fso5252349276.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Feb 2024 04:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707221311; x=1707826111; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=D+xvbQgPMNIqZPpU5Yxz0zVKVlrqGRam+oSS93XuAZg=;
        b=G6EyGV+lrk2qG3c+xFFT4QmZe2kZkL9L2k5sSJU/PrFBr4GnBNIk0arxVEwPb3GoWi
         Qrikzt0jttBL6H6PZ/MMc83caJB6fJOFPzDt9Q3bRLxPFU0dSuR4p1QWpnuuHtMP1t32
         RiCAtdfrahm4lAChEB1aX7PYoV9lGe6IGkINfaOcaQyiZNRNlJA0H2JUP9H9k4Is31XJ
         18DzKyk5pHouBFEY+VmINipp86Iw2fG0s9YsqAEFFww1328ZzXOVdnvY8E5Qz6huyw20
         p1PeCOf6VS625ax1b/MkGH5MUZ+XFMw6/bViWxMZy9MzlzlWanANBY2VW/QGAf3YkKC9
         VBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707221311; x=1707826111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+xvbQgPMNIqZPpU5Yxz0zVKVlrqGRam+oSS93XuAZg=;
        b=kmLlF2yHWkHxiZD/BipvRirTws8jkgi7hyAPuAJphAuju8D7QHuGs3G3KCpRYXNbB0
         2yDUfavGNrEqGb2PH3B5hfsInr/f++DIiDMv5gUHb40ZX3JOw+IzEtAc1W3++g0Z/N2g
         4sltN2LMf7jVZkNZfG0jbZnZCJ7upKZ6nwYpI8jwUlnDJGBSYvX+LkVyoW9Ts8th9CZB
         SviB5ltfxsRzL9W0VpXLYvF+xWzAxCbBZB7h7ZfSXr7N3OIPvY+CxVvuFUEq9BrRb1cb
         nvUHy9KZic7aQcs//vy6uYjLY4rfs4hN97TIShrth+iMwO27uzsgdncBv1FNDq2ET79I
         xNCw==
X-Gm-Message-State: AOJu0YxmE9dctXvY5PRMVh+nzgasoiFlTLmpMULqsIFBTlUeEUzx5YeN
	PiAyNl7JgPIwH9xziO0RP8AOSxykC3UyRNYYBSbLSo7WCyaQsufpf+UsKo7fZR3Je/kP7OD+XzV
	JtTRKfTCCZNRyXv8C+DL6S9A7Or+6MswUojZ8zA==
X-Google-Smtp-Source: AGHT+IHm/LzSZOY6wELij8ZqF6KUJKp53jlruo64Z12qH3QsvW0iqh2+ij7pZZDRD7Tg0EAkEehe8Eq/Q5Xya9Gok24=
X-Received: by 2002:a25:6984:0:b0:dc2:3c3b:fa3e with SMTP id
 e126-20020a256984000000b00dc23c3bfa3emr1424003ybc.31.1707221311472; Tue, 06
 Feb 2024 04:08:31 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206113145.31096-1-quic_jkona@quicinc.com> <20240206113145.31096-5-quic_jkona@quicinc.com>
In-Reply-To: <20240206113145.31096-5-quic_jkona@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 6 Feb 2024 14:08:20 +0200
Message-ID: <CAA8EJpp7p35UECE7QfE-At+=xpa253=De+ZZNnaPSO9GqXCnrg@mail.gmail.com>
Subject: Re: [PATCH 4/5] clk: qcom: camcc-sm8650: Add camera clock controller
 driver for SM8650
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Taniya Das <quic_tdas@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Imran Shaik <quic_imrashai@quicinc.com>, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 13:41, Jagadeesh Kona <quic_jkona@quicinc.com> wrote:
>
> Add support for the camera clock controller for camera clients to be
> able to request for camcc clocks on SM8650 platform.
>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |    8 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-sm8650.c | 3601 +++++++++++++++++++++++++++++++
>  3 files changed, 3610 insertions(+)
>  create mode 100644 drivers/clk/qcom/camcc-sm8650.c
[
[skipped]

> +static int __init cam_cc_sm8650_init(void)
> +{
> +       return platform_driver_register(&cam_cc_sm8650_driver);
> +}
> +subsys_initcall(cam_cc_sm8650_init);

We have been here for the patch series for camcc-sm8550. Upstream
reviewers expect that you don't repeat the same mistakes over and over
again.

Please use module_platform_driver().

> +
> +static void __exit cam_cc_sm8650_exit(void)
> +{
> +       platform_driver_unregister(&cam_cc_sm8650_driver);
> +}
> +module_exit(cam_cc_sm8650_exit);
> +
> +MODULE_DESCRIPTION("QTI CAMCC SM8650 Driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>
>


-- 
With best wishes
Dmitry

