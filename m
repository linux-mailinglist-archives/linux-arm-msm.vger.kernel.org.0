Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF858631E56
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 11:28:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231131AbiKUK2G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 05:28:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230295AbiKUK1r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 05:27:47 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2865140CA
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 02:27:42 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-398cff43344so59382167b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 02:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gUIUQ4FEE6XfTBSVrnhgHkUblckdx37pno6yRuZJvUU=;
        b=RVSVAyx5io4Yl42iTooOxVonDtzRYCSv7TtII1pNqvrnCO378oP8xU8CB01ySqXrNj
         84evxODMRCf73o7DB3XTYxFCqSpsrmJKbKU6QuNSfw8D6/KSpeC0WYaOLnAYMAIEAjJb
         gDoD87iU0eU3WkHkDiRBuEj+sa7bwWL2Fw2vUu/QOYQlyKhSEUzIiwkAe258Bi5aQbvK
         dU4xAX2n2CZGwA7igwyASHm4VSUBt+jOd47BwM+vHis8Qt2FIdKKj4wwy958R66Op7Cu
         +1mfQSndTX/oEVcYsYhiMxI4YEcoQ+iVa5/0YszKsWNoN27SQfXnU9TrW9OBnzIMZ9wP
         lOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gUIUQ4FEE6XfTBSVrnhgHkUblckdx37pno6yRuZJvUU=;
        b=GIFVkNJ172wMJ0eP7KsRaBaVh7O09y1g7FrjAnrQxly1srafeR3VryhsQXXvmhW8xx
         Cwp0yk5n+heBrfffD8N0UDGdZ4SmpMvFJ/eHMhNw5EgNcs86bW2Qa6Lfi2BAYxBQ+Wj4
         Q5PeKsHI0NUW6SPlz42F7QJpAcpP1WT24tOxy8KljBaDEJ3ddXhsop9dbwXDP02NUJ9O
         M1jPxsIiuvuniVnLLc2cBTFT97pjpjLa01v8QzR01Cr2oLlaeemd34XQl2/5MmnOtn6e
         1C42IB4beoL08OzmNlE5m5rOR6L3Hi447jixpNqkFz4VHyKHWGQI7qfBe9SHlEoR5pP4
         Vb9w==
X-Gm-Message-State: ANoB5pkN98fG+WJD6H5fXJC8O/C4QbLDlfZguiAjTni585LCqmBqQr8R
        0HQUJqKhUqX024B6D1GA3y/tUxdEdXMN/MzlqGnyXQ==
X-Google-Smtp-Source: AA0mqf5JadIEyidNUhZIlAdEzTvXOolCIoz25MdQHiNB8HJirofLJ7oR7OcXVMf5ujEa+esfFkpE3lMzYs0/mjYRzcw=
X-Received: by 2002:a81:3855:0:b0:38b:17c4:4297 with SMTP id
 f82-20020a813855000000b0038b17c44297mr17310120ywa.446.1669026461855; Mon, 21
 Nov 2022 02:27:41 -0800 (PST)
MIME-Version: 1.0
References: <20221121004813.3883-1-linmengbo0689@protonmail.com>
In-Reply-To: <20221121004813.3883-1-linmengbo0689@protonmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 21 Nov 2022 11:27:30 +0100
Message-ID: <CACRpkdav1biHFE-SP_xwjyDAvjp+1fOTyMMMDJWqMJMmEpGXAg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] arm64: dts: qcom: msm8916-gplus-fl8005a: Add
 initial device tree
To:     "Lin, Meng-Bo" <linmengbo0689@protonmail.com>,
        Kalle Valo <kvalo@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Nikita Travkin <nikita@trvn.ru>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
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

On Mon, Nov 21, 2022 at 1:49 AM Lin, Meng-Bo
<linmengbo0689@protonmail.com> wrote:

> GPLUS FL8005A is a tablet using the MSM8916 SoC released in 2015.
>
> Add a device tree for with initial support for:
>
> - GPIO keys
> - GPIO LEDs
> - pm8916-vibrator
> - SDHCI (internal and external storage)
> - USB Device Mode
> - UART
> - WCNSS (WiFi/BT)

I don't see this WCNSS in your initial device tree?
Which one is is, BTW?

The WCN36xx actually supported by the kernel or older
such as WCN1314?

Yours,
Linus Walleij
