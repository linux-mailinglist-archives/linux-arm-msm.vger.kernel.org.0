Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57DD750CE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 15:57:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728657AbfFXN5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 09:57:50 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:44965 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbfFXN5u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 09:57:50 -0400
Received: by mail-qt1-f195.google.com with SMTP id x47so14495753qtk.11
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 06:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QqK3B7nF5SYG8tflVUOWfn/TwUeaesQ9Kp4ntpERzxE=;
        b=ZUFFbp/vqXHm8ROouiCONAXZOuz9SHKSQ2Mg52Y39diFq6ScyeLHHzC3T9upjJCxSw
         R6qOWeXrWvhvwXM6GexvTB7U+tbywAkXOgZkKX7X6BcOfqwNh9szXrMBOBGUil+QPwY0
         qqoviKcCt3/pif8gmhijxBL8cFvVOTgyHUhfM+XRcjJSVWrTcHbCcsBA8bGeFMG6HKM4
         vrXGWThxwhUqF7Uwka2nBex8qU09MJ4sqtOEsLZxjJXJdg7/rlqFOvpWd4Bt7CjPEqYz
         eQhbscP5W2RFfJ1cy7a7TdDTDK+CuBJ0twLpo/mSscJuqbfP2jy2aao/jBfR82CS9znT
         VGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QqK3B7nF5SYG8tflVUOWfn/TwUeaesQ9Kp4ntpERzxE=;
        b=ExLpEj+wutVM4piBj1ClFPpptuhe2fj7B79ehrOzQ5tOawxnBpd/ayKxJCKI6VzpIw
         ZQoG/A8DgpwOa/AZf8qSJny+gmwehN38FSLDtxHMKtjc4mBICd4kBxCRJy6rMTsb2TMO
         yWb3k9156w6DP7GZoykCXEJ7wcV1TyW4MkSLPak40hMqnl/a88IMrUWk7pFYsuO/bdy8
         OFJxZJGDDwVelsqdqrPc8WQSMPFasF+X8QsirbD7Pk6Z6EqAoXFQn8iBVX0ys32knXkz
         tyDnY+y5dS2UPScmOTqvd2r4UGr34/W8Ga1GZMLARCb8KQ3cat8xLZ/0cY3OguP0lNzz
         kfpg==
X-Gm-Message-State: APjAAAXxWL9OAh73wY8mHm4Q7CzptqJYmsu8jiZPqtqoeyjLAdDnnthF
        2KzjX38m76H2KircAW7uM6wCLARKU7/5PDaNABQg5w==
X-Google-Smtp-Source: APXvYqzahao66RH4Ei4UrfD64a+p0ylgYwwI5RitOzNtZRoa6gNBzWpKRI5QtbhqMbGILXLo76TjK48sYxNFYa5Sti0=
X-Received: by 2002:a0c:b885:: with SMTP id y5mr2877647qvf.31.1561384669393;
 Mon, 24 Jun 2019 06:57:49 -0700 (PDT)
MIME-Version: 1.0
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr> <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
 <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
In-Reply-To: <5d1ff6a7-7b3b-9bbf-f737-5347555a2076@free.fr>
From:   Amit Kucheria <amit.kucheria@linaro.org>
Date:   Mon, 24 Jun 2019 19:27:38 +0530
Message-ID: <CAP245DWbC8vY1pVuYnGvZ=7LVAAaqAm9TtccCktdxNWuuoxf5w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: msm8916: Add 2 clk options in defconfig
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 24, 2019 at 6:56 PM Marc Gonzalez <marc.w.gonzalez@free.fr> wrote:
>
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 used to be enabled by default
> in drivers/clk/qcom/Kconfig. A recent patch changed that by dropping
> the 'default ARCH_QCOM' directive.
>
> Add the two options explicitly in the arm64 defconfig, to avoid
> functional regressions.
>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---
> Bjorn, Andy, I believe you can take this patch through the qcom tree,
> once Stephen takes the parent patch.
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5a8e853833cf..3277944626c2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -658,6 +658,8 @@ CONFIG_CLK_IMX8MQ=y
>  CONFIG_CLK_IMX8QXP=y
>  CONFIG_TI_SCI_CLK=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_QCOM_A53PLL=y
> +CONFIG_QCOM_CLK_APCS_MSM8916=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
> --
> 2.17.1
