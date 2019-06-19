Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95CF24BA76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2019 15:47:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbfFSNr6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jun 2019 09:47:58 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:47025 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbfFSNr6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jun 2019 09:47:58 -0400
Received: by mail-lf1-f68.google.com with SMTP id z15so12148218lfh.13
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jun 2019 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=V71TuYyJBQZMB8iSTLXwUqcPqDsSqQpONYCVL0IqAhs=;
        b=MJOoT/Yd96siJFdM1ZwK2VE2ScNBN91KlC4JlWQlIBDbuv21irtE71wJSE/AcmUZNG
         9NNIF0I4HzkMYGPtmukksDUGGEvId+jvDucWOIlSBemb8+fT6iAExWUMMaHrQYWmkjpy
         x1PKyydf+QGK6jfpVyGSoyK6ZSd7eEUpphuVakwWsEYdjjNJZN8YPn4CGejJENpHLUB1
         o5bP9QWP2kC63ltwUJP+M2sZ9/C6oCsaI2XG7N2GX+Rr1fHStFzft3Pb18DmLOgxg4o+
         +aWANI/xzKrYGSQOWjz9ocRYdT3EWQjee8gRUQ/2FmXwcncVKzoC7TTmLfqjwrYzeD5D
         53VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V71TuYyJBQZMB8iSTLXwUqcPqDsSqQpONYCVL0IqAhs=;
        b=GWjrujKHzQvhIGuvN0iqQqS9nsuCPY1Wuhc3eoi0lUSd1XMRpUnR3/ZflZRk0KzHEG
         icpMIkA4ZWH1be0FxdT5eI5KU9TqmkaOHcIIynxMg801apinBxqTzdV6VFhXoLXlS0/U
         fMtNrRqu9rzR33W9t0pEjn7NSCqCmGBBchFKBY6U/ss8OgDW2KkZ4zyy0pqOeVRMx4Th
         Py+0T9f1BtQpi4I69BnhP04+LmA3ZMd25d7uFPgKbkR8tJv98Tey+Xn0rsSj4EX61vMT
         YyIQk9O+7cOZunv+BVdBiPssJjiNhxxAob8+JLxaGfWWYNesaO1F6Q/fWnEQC/vE7Z6T
         lfTw==
X-Gm-Message-State: APjAAAVTXsPDFu4Rgii7Y3DxI+cKSGU2yV0sQuVoZI4Y5hc0MCxCUtTN
        Uqw4R6oSfcw5C5eL+MZy0/eC0w==
X-Google-Smtp-Source: APXvYqwSwOMeWjRGmbgc5tZsilRBhTUIfIdyXVUsHSm8TUNydzV9hn40uq0Asa2OvzPidjC4UmcQsA==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr3245922lfd.33.1560952076792;
        Wed, 19 Jun 2019 06:47:56 -0700 (PDT)
Received: from macbook.djakov.com ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id p27sm2723672lfo.16.2019.06.19.06.47.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 06:47:56 -0700 (PDT)
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
Date:   Wed, 19 Jun 2019 16:47:53 +0300
MIME-Version: 1.0
In-Reply-To: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19.06.19 14:44, Marc Gonzalez wrote:
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. List them in defconfig after dropping the default.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  drivers/clk/qcom/Kconfig     | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Hi Marc,

Sorry, I wasn't very clear. IMHO the defconfig change should be a
separate patch and the v2 of this patch is ok as it is. It would just
make things easier to merge.

Thanks,
Georgi
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

