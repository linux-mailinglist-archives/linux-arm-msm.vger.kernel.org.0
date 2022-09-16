Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 197125BAD67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Sep 2022 14:27:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231411AbiIPM1O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Sep 2022 08:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231206AbiIPM1M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Sep 2022 08:27:12 -0400
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB46B1BBE
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 05:27:11 -0700 (PDT)
Received: by mail-yb1-xb33.google.com with SMTP id 125so11030931ybt.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Sep 2022 05:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=qBkP79CdibdL0KXmDwvIhKSe/JzNo6nfeWqbrVhoNo0=;
        b=dzbYY0vlZ7i6Yr8v8Apr+D9xXAqxbRmUiJughxVFjAL6TOyk0vSgprK09vqNX/Je3N
         o66NEofmPmhKHxB0QvanN8/hcYj7BoCdnyOOHbarUZQ08ZSimNs1jPhugBLpKAcU+1Zu
         qJU0yAkFA7SgxiyFxQdFXgejHUAAhlboD/x2MLsegN7gspeKAZuoIiNaVS0DE5P9CYX9
         tn3tYlmiCauzVqoPx2W/yWzIDcJ5ke+fk3kanAKcQ3LRiK8Tmiyts9lAsXtTJWSxLsYT
         3OYhkupOoIQwwcbmZJak7hQR3xGaapN6GqjO3gZ+W3+7qyAmFiuzbWfFtzoK8QiNW5o/
         HgYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=qBkP79CdibdL0KXmDwvIhKSe/JzNo6nfeWqbrVhoNo0=;
        b=SHtg6pLEf6VzN6g9ab9DmkOMErjEe3KQvcShVO91H4toR9UP+qZJLKihO1qEyQInVD
         D2Jmgk8+sbC+MgcypDZKzYr8+D3QGkVuUfMS79ysW6qkvutmY0MucT6YlXD9/CeLv+SZ
         fW1InRiBVTBC4U8i/ggatMw22me+ytE+sUTkGEbVh5YMU7K7PA+EA0wfY51A1qHK7Kz4
         D5yeEIIKjvn++kgt0F5870k+4MXxVE9Ox/XoMdIal8xFyCozSSeNeW3hnSpTSKozRApa
         kq2bcN8UD6A03vxMLu2iqpg2/50yIL+joq9NRNYg0+dZSI1DU8xhl+G/wysoxM0hTLfh
         UIzw==
X-Gm-Message-State: ACrzQf1FweEZ+NQKjkH5EDziH5qamB3tNSNVoqfFHVQlFISOdTesu/Hr
        qyZWie/9hmAGJy7WVVqiVbHeejYbmHQtcS16eGb3kA==
X-Google-Smtp-Source: AMsMyM7exBoaSPI97ztz9uzm41FgmreUvtJV9LBBNHgaf3EvM9E/3gry+tdHRjk0JGUiZrtkyBEPOBNexhun2Afb8vs=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr4566691ybj.194.1663331230592; Fri, 16
 Sep 2022 05:27:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220916121204.3880182-1-vkoul@kernel.org> <20220916121204.3880182-7-vkoul@kernel.org>
In-Reply-To: <20220916121204.3880182-7-vkoul@kernel.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Fri, 16 Sep 2022 15:26:59 +0300
Message-ID: <CAA8EJprcqrmHQCtYbOT=DWp-0iEWWVC0=-KZRz1DZqK6gE94qA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, 16 Sept 2022 at 15:13, Vinod Koul <vkoul@kernel.org> wrote:
>
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>
> Introduce support for the Lenovo Flex 5G laptop, built on the Qualcomm
> SC8180X platform. Supported peripherals includes keyboard, touchpad,
> UFS storage, external USB and WiFi.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../boot/dts/qcom/sc8180x-lenovo-flex-5g.dts  | 590 ++++++++++++++++++
>  2 files changed, 591 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts
>

[skipped]

> +&gpu {
> +       status = "okay";
> +
> +       zap-shader {
> +               memory-region = <&gpu_mem>;
> +               firmware-name = "qcom/sc8180x/qcdxkmsuc8180.mbn";

Is the firmware signed with the test key or with the proper vendor
key? If the latter is true, the firmware should go to the subdir
inside the SoC (I'd suggest following the example and using
sc8180x/LENOVO/dmi_id/)

> +       };
> +};
> +

-- 
With best wishes
Dmitry
