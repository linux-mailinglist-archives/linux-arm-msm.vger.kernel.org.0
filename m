Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76D9F66AF52
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Jan 2023 05:25:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbjAOEZr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Jan 2023 23:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjAOEZq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Jan 2023 23:25:46 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC3FD4689
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 20:25:44 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id m12-20020a17090a4d8c00b002295ca9855aso1387164pjh.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jan 2023 20:25:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6pvTLeC9Wqruh6bZWdGAjJllCvPkClU/i56kK1f0h4I=;
        b=ds4/BuKPLkF4VC9c0mG7h8wttfqnQ2tEHN07bBsRFM9Bgy2DEa0Dpj+KYzfo6tKg0z
         19rBuDd+sn77L8EoRo0iRgGa2IbSQrvW8Nzo524Zh3loN9ixGE9xLsXEpuDI9+z3Nql/
         5YPguuckKN5KcYxxxhvvGtw4Gr35EbHWq5kdN4HpPfWbW/VNn8uWVxO0xu7e/9nSG/X0
         Q+tqrWIBx6CFY+PCVCgqXqJgYf9UL1ge1xGiv+L3H+4rFuQb4pd0Da8+pNtBrqD7Ur/w
         bu7pDIYvHbTTtk9A8CEDQ8dNjJJ+rm7+cQwnVD0cuXTrqnn5k6zwH7q2eyZJDtLE3QZe
         4A8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6pvTLeC9Wqruh6bZWdGAjJllCvPkClU/i56kK1f0h4I=;
        b=gpzzgUWZoJHfl6/lfAGKrZ70dK/dEPAnUmOgPshGr8nF2/8hj1vz2PR6n5tnvS7CtI
         /UjCqxWmmYXIs9CJE9mQCjTxJxjRdqR4znTBC2ioKoSUaeMOHLrucAV/Rozj5m6w+vMp
         sS0RTU+UZpg0QZrP+SARTyi7VpLeSsNrDLE2VspcKoNn+NerCh5BxyDUGc298YT9f4yR
         86PlCAaPpYQQFUlopaQSQbbse0wc3urCZDZaiuXXoe6+xG9bZQ60JTIBK93uN8SS+Yts
         rDf8LW4o5ksbsxyon/HDlIvIXfM/r413BY3v6aF+zxQ+2NmRiIUKdVPsNW6hrnuj8bRV
         U05A==
X-Gm-Message-State: AFqh2kpyxT3ZOBJRJKUMw2FrZ7ILLNtvpQXeSyji3TlbltH+95PquY/8
        UXRfhP8GddJomAq6xJGAVddP
X-Google-Smtp-Source: AMrXdXtJVWTDji7AvQagKcIzO7SmKSoWiJ8OrLTCi5hRezIM7DUe/EMoh53iejSjbZ7mLKQtYLGXLw==
X-Received: by 2002:a17:902:ccc1:b0:189:5ff5:eb92 with SMTP id z1-20020a170902ccc100b001895ff5eb92mr111288314ple.39.1673756744360;
        Sat, 14 Jan 2023 20:25:44 -0800 (PST)
Received: from thinkpad ([220.158.159.143])
        by smtp.gmail.com with ESMTPSA id t12-20020a1709027fcc00b00186748fe6ccsm2273461plb.214.2023.01.14.20.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 20:25:43 -0800 (PST)
Date:   Sun, 15 Jan 2023 09:55:37 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm PCIe modem drivers
Message-ID: <20230115042537.GH6568@thinkpad>
References: <20230114162236.22615-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230114162236.22615-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Jan 14, 2023 at 05:22:36PM +0100, Johan Hovold wrote:
> Enable the MHI PCI controller driver and MHI WWAN drivers for Qualcomm
> based PCIe modems such as the ones found on the SC8280XP Compute
> Reference Design (CRD) and Lenovo Thinkpad X13s.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> 
> Bjorn,
> 
> Perhaps you can take this through your tree?
> 
> Johan
> 
> 
>  arch/arm64/configs/defconfig | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 86aa3730a8b6..117b49f3f1c1 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -250,6 +250,7 @@ CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER_USER_HELPER=y
>  CONFIG_HISILICON_LPC=y
>  CONFIG_TEGRA_ACONNECT=m
> +CONFIG_MHI_BUS_PCI_GENERIC=m
>  CONFIG_ARM_SCMI_PROTOCOL=y
>  CONFIG_ARM_SCPI_PROTOCOL=y
>  CONFIG_RASPBERRYPI_FIRMWARE=y
> @@ -405,6 +406,9 @@ CONFIG_MWIFIEX_SDIO=m
>  CONFIG_MWIFIEX_PCIE=m
>  CONFIG_WL18XX=m
>  CONFIG_WLCORE_SDIO=m
> +CONFIG_WWAN=m
> +CONFIG_MHI_WWAN_CTRL=m
> +CONFIG_MHI_WWAN_MBIM=m
>  CONFIG_INPUT_EVDEV=y
>  CONFIG_KEYBOARD_ADC=m
>  CONFIG_KEYBOARD_GPIO=y
> -- 
> 2.38.2
> 

-- 
மணிவண்ணன் சதாசிவம்
