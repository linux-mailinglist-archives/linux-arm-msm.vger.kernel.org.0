Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87B4BD89D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Oct 2019 09:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390999AbfJPHg3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Oct 2019 03:36:29 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34455 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730508AbfJPHg2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Oct 2019 03:36:28 -0400
Received: by mail-vs1-f68.google.com with SMTP id d3so14985659vsr.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Oct 2019 00:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=verdurent-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qe50GbZLQRllpuQvATvkx8bEhPSzudVQM7HSFSmEcqo=;
        b=l5x1Vw+AifeukGvQl9qOlNjchU0byCxsiNuVC/wLdzx3JAF0gqmbkCNXOr9FzTZdPp
         w9+mgNpDiDOQsqKTMADmoZZC8coYmgv/De1dyaFsHYwshJ4ASgvIzVBONkqKf6hDTBHZ
         JFclIxNc0ZhuePS2bjfY6gCJyBH6ikBhqrnxs6c+gENEZQX5mNw1BZhNuuXy0DKAjSoR
         n0JBLgpY8Eyb2pb7nfcNbAwPMPPN/LhhToh3yfaoLCFZL+Rx5q3jAOK1CbmLTch4J8oP
         qxtoZ7j8UuHZr0bkkvw2p2nBT+EhVlmevzHACoCNhE7U1ygaGPiLOWXtFPY86ao8xjDV
         vwog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qe50GbZLQRllpuQvATvkx8bEhPSzudVQM7HSFSmEcqo=;
        b=oGB73mgmepgdABSlApYajqdjarFaSClIfPWRMAK4gZfmN80nZphwAFBDBoismQYCp3
         lwBZWoxBLOpezd3kJi1ia0ui/+TGyzMA48BjpKi8h/M6VJ51bqIC9Ntc7iC4tHHwJYd1
         OErfHv6WwrRZgR+ThAMNMbsYx4oe3z3l/PVqhjeXTAxnRQqY8MLk6gmvo4oZb+6il2YC
         Wm9N8iYEQAubjRVhtEy1/t6zsM+Vy/kRu5WiWh3azT9rVCcQwLfvFxP1f79nXM1iI5C+
         eC/Oanjz35P+KL6gNsuOl+viUuvFGfOJdIurr6uQKHP0piIrmcjmxo2YXqb754ujKJJW
         g8Vg==
X-Gm-Message-State: APjAAAXFnMQiK2zLoULBeD7hykeh1kr4vOMyoRi0nhA5hEsQfSw6ql4B
        ZcGMvo09T3tMg2Mc+SAOUzB4emNE/kBYH7rVwo75Lw==
X-Google-Smtp-Source: APXvYqwpQsX8XDUKsMfMEkQSA0p4CQbdijqex0x7A7VShelbL+ZQrXv0eMhDptdmMbVegT+VCOz1tJhzZAzrEwpnPWI=
X-Received: by 2002:a67:edce:: with SMTP id e14mr16842513vsp.182.1571211387638;
 Wed, 16 Oct 2019 00:36:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191011234402.374271-1-bjorn.andersson@linaro.org>
In-Reply-To: <20191011234402.374271-1-bjorn.andersson@linaro.org>
From:   Amit Kucheria <amit.kucheria@verdurent.com>
Date:   Wed, 16 Oct 2019 13:06:16 +0530
Message-ID: <CAHLCerOnj24B8wZxuqbBgt1UtxO5E7Caa8WTP=o3bXJv-QDy1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm CPUfreq HW driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Maxime Ripard <mripard@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        lakml <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Oct 12, 2019 at 5:14 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> The Qualcomm CPUfreq HW provides CPU voltage and frequency scaling on
> many modern Qualcomm SoCs. Enable the driver for this hardware block to
> enable this functionality on the SDM845 platform.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

You beat me to it. :-)

Acked-by: Amit Kucheria <amit.kucheria@linaro.org>

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index dea051a64257..45e55dfe1ee4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -85,6 +85,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
>  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  CONFIG_ARM_IMX_CPUFREQ_DT=m
> +CONFIG_ARM_QCOM_CPUFREQ_HW=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
> --
> 2.23.0
>
