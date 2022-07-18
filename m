Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C450A578426
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 15:46:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235312AbiGRNpz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 09:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235242AbiGRNpr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 09:45:47 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5AA252B0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:45:43 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q7so13620250lji.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=DKoR4Ro1OVJtCy4SmvnL1kWSjaV/Fp3Wip/RAp6Bzvc=;
        b=R51Ggj9LrkxR/7/+OIZ+QNudD0BGz8gLF/2swjL94x3rIRM9ZXw3EKNMV9U+Whqu+e
         kATnHaogIXNoR9exlXVb2hitWfu5AsG4LNep/e8qbPT5OGHSTjwMoAw4+1qZxXsvhC2o
         mHo13JOg+m6zK+vihoin3yFpJTSOiDAKwCQUSVXUs0EttZox6QQewFob5WC/Siqg/OK2
         sYsB7ElEw7adDh/HZjv/AZGdXvLCONt5+jWlnUez7rHHM8WdqYRnPRqicJElZ+EKLILI
         M38efKjBwnfmKgQNs4aUT8gjBZLC8fh2OrN+J6OKf00VAiak8ljGgIBXGoqcs4i8P5Vu
         yNqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DKoR4Ro1OVJtCy4SmvnL1kWSjaV/Fp3Wip/RAp6Bzvc=;
        b=y8XDccS6y/8/TyficWjVk+hrLWitEDTrxjAjDuIcNpt+GraUu0NbS2fs2ytwdNKVNZ
         kGdtLzeYDOJeOA820HC4aOGxNy2brCemwY6tYPfKgVek0eZmjyPMi0Gh48p6c5+i3VaE
         odQoGQ58MFYC3lP0CoLH9GKkTdVxfk0g1pRnZ9ccruCsQ80thRyr4p+ODcNqnUm+e6z2
         c4KA03Ck4TdtD1xaOKCEgqvs7BRpvZHvJK+2kvIWnJSx6Bx4jyM/rY/D6psypHXe+DON
         PvOdgJkgaX9zanKtFeoD7UcE+mcKpXPBvVc0yJHKXlwKUs2L4edgcmmyR0tmd907+z8T
         Ho+A==
X-Gm-Message-State: AJIora8tQAlMsl+F8oRlleV0YWCCIS6fOqrMu38R2sqDS8F5IqMUB1Vt
        vcqx0UYU5ACfjL9yKas7VrPQnz1rJ40uLwYi
X-Google-Smtp-Source: AGRyM1somiSvS6Xk5Be6L6bYB2ygzu9DKzHW6ayMd+VF0RV9ckq+gbVM1YdLlY4dXUTMvTQHf4UHhw==
X-Received: by 2002:a2e:87c8:0:b0:25d:776c:8343 with SMTP id v8-20020a2e87c8000000b0025d776c8343mr12285854ljj.268.1658151941493;
        Mon, 18 Jul 2022 06:45:41 -0700 (PDT)
Received: from [192.168.115.193] (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id c3-20020a056512238300b004833caeb8bdsm2608841lfv.101.2022.07.18.06.45.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:45:41 -0700 (PDT)
Message-ID: <341fc30d-edc6-015b-d7ca-4b6d4a10b903@linaro.org>
Date:   Mon, 18 Jul 2022 15:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] ARM: dts: qcom: pm8226: Add node for the GPIOs
Content-Language: en-US
To:     =?UTF-8?Q?Matti_Lehtim=c3=a4ki?= <matti.lehtimaki@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220717213432.134486-1-matti.lehtimaki@gmail.com>
 <20220717213432.134486-2-matti.lehtimaki@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220717213432.134486-2-matti.lehtimaki@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/07/2022 23:34, Matti Lehtimäki wrote:
> The PM8226 provides 8 GPIOs. Add a node to support them.
> 
> Signed-off-by: Matti LehtimÃ¤ki <matti.lehtimaki@gmail.com>
> ---
>  arch/arm/boot/dts/qcom-pm8226.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-pm8226.dtsi b/arch/arm/boot/dts/qcom-pm8226.dtsi
> index 9b7d9d04ded6..235df06a0369 100644
> --- a/arch/arm/boot/dts/qcom-pm8226.dtsi
> +++ b/arch/arm/boot/dts/qcom-pm8226.dtsi
> @@ -90,6 +90,16 @@ pm8226_mpps: mpps@a000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		pm8226_gpios: gpios@c000 {

It seems several Qualcomm PMICs make this mistake... why this cannot be
"gpio" like expected for gpio controller?


Best regards,
Krzysztof
