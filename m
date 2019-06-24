Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AD7050AA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2019 14:26:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfFXM0A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Jun 2019 08:26:00 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:32774 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726700AbfFXM0A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Jun 2019 08:26:00 -0400
Received: by mail-lj1-f194.google.com with SMTP id h10so12457559ljg.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2019 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TwWuV+Ux38iewwmUXFyINfAA0DnQvVJiLMEVbccnSA4=;
        b=YKjI7ew/sVvF/AenQyuWYJ13YZfwEHs+ol7kgHYEDDgZuy3hxXemkMqEOeD/kigS7h
         EHmUWS1DgNhsFfszIZM6HtUNHa2UlqgTatfwb2VQXfro5G48E7r0Zs+pOSIfdWOweyUO
         qAEXWZBWRmQzIiaOj3z7e7gj4QZ6bzsSZYnR0FosIxuks+cWBvuWbqj362GFlsi/R+KU
         Yp42E9H+X+ULz4X5gt8n3L+trQrMc/ivKCmVOWjRBhC2VIe4k9IMi6amn2rW8dGyRDtL
         4s/RQhzw1RTf7Obf15bhJsf4i0oaV9qR8HQaWPAHI0G1G5raBjQNKyc0W8IOzKwlzVIG
         tLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :message-id:date:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TwWuV+Ux38iewwmUXFyINfAA0DnQvVJiLMEVbccnSA4=;
        b=iXElDwIraRUa8/d+6Iq/i2Qu4gQxOpE4dyBVeMu4b1jyuHP/3F9rpuMv0eHQ0hq0nN
         vU5rRVrjrln8K6EwxB4XDw0KCejcftVB2iXJFzzbUX5zH7PM+zUSuca2WhqY7AyarVSx
         EwXfRZDdVZ0LAI75D8V/QOjm06MTRxFDYvbzkn1+bLKS8ZiBOHL7a/VyeWPssjamo3Se
         xV+OD3t2UwVv/LllSsKEIP5zcOGUs26bezPmkFi2tzRTnck7+9cAevNojuflto01rCf5
         qehDzPUIzeCxBVf9soclcnwZaxjv/w9HvOjshsIkAMcALk0yia4GF7dvcgEd3CSyAAZO
         cyZw==
X-Gm-Message-State: APjAAAWk6m8rTW19k+jN/RBtXylxM4wjrG0EaYaaDKaZ29trpQjJNaVP
        BI9OO9D1PvyoiBXLVZYcKivByw==
X-Google-Smtp-Source: APXvYqyFf2z5ZEn+D6kXbU0Ght7m0nEXy50Tt+3JOGlkAWPhiKilX8pMHBm3cUfs1kZhjK9U56pUcw==
X-Received: by 2002:a2e:3211:: with SMTP id y17mr18530311ljy.86.1561379157604;
        Mon, 24 Jun 2019 05:25:57 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id l25sm1702287lja.76.2019.06.24.05.25.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 05:25:56 -0700 (PDT)
Subject: Re: [PATCH v2] clk: qcom: msm8916: Don't build by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <f96ab735-1001-5319-a314-b8079efd9046@linaro.org>
Date:   Mon, 24 Jun 2019 15:25:55 +0300
MIME-Version: 1.0
In-Reply-To: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6/13/19 18:09, Marc Gonzalez wrote:
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. Let's bring them back in line with the rest.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Acked-by: Georgi Djakov <georgi.djakov@linaro.org>

In order to keep it functional, a separate patch is needed to enable the same
config options in defconfig. The defconfig change should go through Andy and Bjorn.

Thanks,
Georgi

> ---
> Changes from v1:
> - Drop the default altogether, instead of changing it to 'default MSM_GCC_8916'
> ---
>  drivers/clk/qcom/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..6461a1aa7325 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -21,7 +21,6 @@ if COMMON_CLK_QCOM
>  
>  config QCOM_A53PLL
>  	tristate "MSM8916 A53 PLL"
> -	default ARCH_QCOM
>  	help
>  	  Support for the A53 PLL on MSM8916 devices. It provides
>  	  the CPU with frequencies above 1GHz.
> @@ -31,7 +30,6 @@ config QCOM_A53PLL
>  config QCOM_CLK_APCS_MSM8916
>  	tristate "MSM8916 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
> -	default ARCH_QCOM
>  	help
>  	  Support for the APCS Clock Controller on msm8916 devices. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
> 
