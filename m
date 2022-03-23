Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E5E44E5A08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Mar 2022 21:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiCWUqb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Mar 2022 16:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344780AbiCWUqa (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Mar 2022 16:46:30 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A0417E39;
        Wed, 23 Mar 2022 13:44:59 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id d10so5226923eje.10;
        Wed, 23 Mar 2022 13:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=yhuvhLdU1yikBbXJnbS64sl4VTDQyAm7M8+B3IIJfiA=;
        b=H7olfx27ZO/+7TEDfrDeA4+eltGIgsaJocQnxuzJ0Ah2KjuSmYpM/EQalZTxjYHstE
         /45qy8RC786lyyEdVVsspP26LzR9cBCoweegLZchsTC8l8EnIA4XgvCSxwJgp9P8hh41
         HLutKdcDYAV9gD5zOsMJhI3XEHPW6eJIxuATG0QBJWgeJ0yTnazMjJnUInasJgaqhX9f
         O3mPLLG00AqnqcdG90iwT6+XT7VoJC/wz3yZ1Usde/5vJh2EULu7RAsMN6BUsf6+oIlX
         CXANifTPJlCiKcSAjeCUDPIqtz8I7ziHiKfpTQI+1tX5KJapyuPqJf4hdiw7FvKdRY6w
         CUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=yhuvhLdU1yikBbXJnbS64sl4VTDQyAm7M8+B3IIJfiA=;
        b=1mko0Lfs6WvjwRk9MQGhKKEhiSDqIfJa9A6h3eWuvK/Ud3JjffZIWFXdyulKzdm7F7
         cwk+VJD+2JLUQBGiC0VItQKINAOmaoD0C40Ncf97jV/f1SaKmpdGeFdhMd5KkObDqO+L
         Q2g+ZrYIh4GHzXeD36yFc0DQnQWdL799Vzc2WySZuipvwrXuMdXzAGK8J4LgZRkNYY5s
         24KW9p1W5M/iWByNZcaP2pFONMkxc8C2YTeqdSNEj4jZlq7PQwnErlj4T/Ek9K6Uie6p
         ovasirAhMUKg6SgPSicmp7ex3Tj39ceDg+ZWjMls+B+Nukrwmjt5yXVUHzAP+LJUO/Vd
         zcNw==
X-Gm-Message-State: AOAM532Hx1a9TJ0evrjr5dMmyl7WaActdnaiTUv6PIxSC+nILnsyLlPt
        3dvhTAguzuqjen93OtspOXt4t6FpUB7WTA==
X-Google-Smtp-Source: ABdhPJxgcEcPz/x4hkpFtKOojw5cc9QFIABOYiS7lH2JpK3UPhtHdBLYo6UiTKgXgMLmQXnobQuWPQ==
X-Received: by 2002:a17:906:6144:b0:6cf:bb2e:a2e1 with SMTP id p4-20020a170906614400b006cfbb2ea2e1mr2066187ejl.299.1648068296359;
        Wed, 23 Mar 2022 13:44:56 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id z5-20020a1709063a0500b006da8fa9526esm339889eje.178.2022.03.23.13.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 13:44:55 -0700 (PDT)
Date:   Wed, 23 Mar 2022 21:44:53 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Konrad Dybcio <konradybcio@gmail.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Jean Thomas <virgule@jeanthomas.me>
Subject: Re: [PATCH 1/1] arm64: dts: qcom: bullhead: Fix sdcard1 overclocking
Message-ID: <YjuGxQNt8xUZdW8J@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20220221200540.14460-1-petr.vorel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220221200540.14460-1-petr.vorel@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

> rev 1.01 (msm8992-lg-bullhead-rev-101.dts) has overclocking warnings:
> [    1.997606] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
> [    1.997681] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
> [    2.010904] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
> [    2.012961] mmc0: Card appears overclocked; req 200000000 Hz, actual 343999999 Hz
> [    2.027497] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
> [    2.027607] mmc0: Card appears overclocked; req 400000000 Hz, actual 687999999 Hz
> [    2.039699] mmc0: new HS400 MMC card at address 0001

> Similarly to angler use gcc GPLL4_EARLY to get rid of the warnings.
> Not tested on 1.0, but should work here as well.

As I wrote at Konrad's patch "clk: qcom: gcc-msm8994: Fix gpll4 width" [1]
with that fix this workaround is not needed if Konrad's patch applied.

Kind regards,
Petr

[1] https://lore.kernel.org/linux-arm-msm/YjuE+cgGXCLihPIa@pevik/T/#t
