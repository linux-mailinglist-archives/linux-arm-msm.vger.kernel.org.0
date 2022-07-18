Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E093578494
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jul 2022 15:59:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbiGRN7R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jul 2022 09:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235363AbiGRN7P (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jul 2022 09:59:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B654D13E8F
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:59:14 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z22so2427383edd.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ttujR448sg3VPiW5WpjTzlldmr9GPyMPXo0TdvdiLSg=;
        b=f7Vv7aZMznD521+3/H5wiv7Wz2MGbpoAggAMDTOPXjb+pkkQ5rA4K8By31TKL/ROQV
         UrH0ozGP/q5IGvVjZ9yfMfRaj8duOCz5sp5Cdw92ysXbX7ho2EQ0wWjuL4cs/vrohYl1
         wunZBwqhsYFVKvftfMGHooTsDjDWa9X4jVLpE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ttujR448sg3VPiW5WpjTzlldmr9GPyMPXo0TdvdiLSg=;
        b=P1BcrGSKU9zj7aQxP9l6UoCFybjcZNzXRtxuYsEnHTHYoMzNgW/dIkKHflmShJHB4E
         HYdrAzY/UoNYeTWZfK/WEDKVdbldkv+sUThPqmUKTqL7TW7z68qfIe1cdIO/E9Z8g2nb
         SYsOfgdeC9dhtpY4wEk4U/E+ytLYPAhEU9w22ER/M12/qykZi3Oxv5Htd4SztjRDhdNf
         BsOuipw2zGk1N46IDIk4TOrC/ZD31IGEkz0sqF6Idomypbs/+D4GlteXGSLeGmaJfJ/n
         dcl7ZavxpSDcZ6IG/FG8Ra8JNF3qBCOu7tPztD386yNPs+F1uZskiReTOXBvx8hQIQGL
         WaBA==
X-Gm-Message-State: AJIora/3AQjL5SMOajce10FoS860IGzszE77vcvblrNGOO4mvqYAWf4u
        Es0Wum8AHhaUD4B1+/nE+yVdk3xA2ISQ+mST
X-Google-Smtp-Source: AGRyM1stfz0omFk0fYrJc3mt77QEAFsEVQ95Ee6ctvN7Sj06v6zZiV3X30E/XIJiGMXCRjDMjP/0xg==
X-Received: by 2002:a50:fd08:0:b0:43a:7890:9c54 with SMTP id i8-20020a50fd08000000b0043a78909c54mr37284935eds.52.1658152753109;
        Mon, 18 Jul 2022 06:59:13 -0700 (PDT)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id am8-20020a170906568800b0072b51fb36f7sm5467459ejc.196.2022.07.18.06.59.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Jul 2022 06:59:11 -0700 (PDT)
Received: by mail-wm1-f51.google.com with SMTP id c187-20020a1c35c4000000b003a30d88fe8eso5756567wma.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Jul 2022 06:59:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8d:b0:3a1:2e4d:1dd2 with SMTP id
 f13-20020a05600c4e8d00b003a12e4d1dd2mr32913946wmq.85.1658152750641; Mon, 18
 Jul 2022 06:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220718073104.146985-1-jinghung.chen3@hotmail.com> <SG2PR03MB5006A2ADC6ED22199D8C88D9CC8C9@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB5006A2ADC6ED22199D8C88D9CC8C9@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 18 Jul 2022 06:58:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UgQu877jy8Lzga54M46A5cE6_bAnbhAXfbQuwWwqC0Lg@mail.gmail.com>
Message-ID: <CAD=FV=UgQu877jy8Lzga54M46A5cE6_bAnbhAXfbQuwWwqC0Lg@mail.gmail.com>
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Mon, Jul 18, 2022 at 12:31 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds LTE skus for villager device tree files.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
>
> Changes in v6:
> - Remove v5 accidentally added sc7280-herobrine-herobrine-r1-lte.dts
>
> Changes in v5:
> - Reorder '.dtb' in Makefile
> - Put the "interconnects" line back
>
> Changes in v4:
> - Reorder 'status' last
>
>  arch/arm64/boot/dts/qcom/Makefile               |  2 ++
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi     | 11 -----------
>  .../boot/dts/qcom/sc7280-herobrine-crd.dts      |  1 +
>  .../dts/qcom/sc7280-herobrine-herobrine-r1.dts  |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 17 +++++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r0-lte.dts   | 14 ++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts   | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts         |  1 +
>  8 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts

Reviewed-by: Douglas Anderson <dianders@chromium.org>
