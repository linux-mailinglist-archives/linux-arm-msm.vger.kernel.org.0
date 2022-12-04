Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148A2641C87
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Dec 2022 12:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229539AbiLDLDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Dec 2022 06:03:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230169AbiLDLCx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Dec 2022 06:02:53 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24F6FB1D5
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Dec 2022 03:02:53 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id v206so11192620ybv.7
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Dec 2022 03:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cxc5UnDgFDoaxm3hgQDtRLZljMAsl/2D1GEa5WB49yM=;
        b=fSmmueEDkhb8wGXOEfDsdRsyoJJHE9r+4hRCj1b8Q49Yymq9M4OdMLG2MYqGiyluIo
         JGPul4qnrI3snpiX7q50XQ/ce+flLURBo1Y04gX3K2UVZB+ndBlZ0Z0xbXCQkaYQyWa3
         /bBqDSnd/43WLczjmABl7piMutYq0GxzS4pwzTmm38SHk1LDeglp4OXMYv+0KyMdaN1j
         tx/bGhFPVtqiPHHku6ji71ivV66DN+5ef7DC/JEuO3ERZDaKiu73peBotU23240j6mtR
         GNkZ/U4sbTNksQGNSMq0vFKykZWTQjOd5jrZ98YIXWMpvI7xXtw8EsWJbLXHvzx6Bkvh
         PCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cxc5UnDgFDoaxm3hgQDtRLZljMAsl/2D1GEa5WB49yM=;
        b=GLfTcLfnjmPLK4f0Oum5sHTo9UG4i5f/8qZGCei9U/lcz2sEh8fHZeBOf2O+SCiByY
         ZwGqcKCfr6r7xTd1vZfPqfy6S/fU2YzVeRY6/Dhqe8j1N86yfb4I5ypMSMUgdOShVfhf
         TAd1b5r3G59v87nDE0MsnYu/i4ifEoHjlQJ1kMb8NoU7DDfoWrXkt/N+Lkbf3aTUlad9
         8Qflf02xC3+vFdl0kelGdhbQG3H21FIgPH3QVXs5LlU/4YeC3Vs7P3oro90PUcDhsTL5
         ATPHsJsF+qPVmQkhSHWb8NrawprlJw3WaMLZPFKtgKC1zHe9Cwi9Vc97ZnnbL9ldvSWv
         8wCg==
X-Gm-Message-State: ANoB5pmWyZ/BtmYlQ727u2ML4mcKZSAqsKHc23IZolzmQ5e0degoKB4C
        JiQQPAk+swfVDaOHCQe019S24rIgVRMjB2iaZSUGhA==
X-Google-Smtp-Source: AA0mqf6WPLf/2DwPZV3zf6C1sypEA4agnQDW4qhQuelA+qj/UptGS8Gpkd24QPQqIXlgmhXlfJzzfFUkPQcQ9S/oCps=
X-Received: by 2002:a25:32d8:0:b0:6fb:fada:f39f with SMTP id
 y207-20020a2532d8000000b006fbfadaf39fmr14156411yby.152.1670151772382; Sun, 04
 Dec 2022 03:02:52 -0800 (PST)
MIME-Version: 1.0
References: <20221204094438.73288-1-krzysztof.kozlowski@linaro.org> <20221204094438.73288-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221204094438.73288-4-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 4 Dec 2022 13:02:41 +0200
Message-ID: <CAA8EJpp+evX1rng4YJ6h6hXs6KX4ZbDss=v-we9mTFpiUXOptA@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: qcom: sda660-inforce-ifc6560: fix no-mmc
 property for SDHCI
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
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

On Sun, 4 Dec 2022 at 11:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> There is no "no-emmc" property, so intention for SD/SDIO only nodes was
> to use "no-mmc":
>
>   qcom/sda660-inforce-ifc6560.dtb: mmc@c084000: Unevaluated properties are not allowed ('no-emmc' was unexpected)
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
