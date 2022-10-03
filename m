Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C932D5F3817
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 23:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiJCVtJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 17:49:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiJCVsd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 17:48:33 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F06B2AE19
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 14:47:16 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id 13so24997552ejn.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 14:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
        b=YlWmmsM7lTJJGalVIwZ9dwi8cj/06pB914EX3vdbkQ3SAmGQFMmvAyIvLc21049fjQ
         Fq4dKUjUbDjZniZlY+L9WcljP/jjGnSu+cSYmxose2/WpSOLsoawP4Xcl7VZ6ORwWEoF
         C3Bm+q2lDDpi+O+luWwuJNztaWEEKEUIqvOTlR2FGWc+GjaEqy8Tf+PD1fH2Bksm1u1N
         kNOMMRVretuRpg00tiGhLEiW9PJpMer6GqP1jMFj7UytD2kTeRekHkkcIZziOMcQqgpK
         /cL+BT1r1aDm9dKSjGNFD7mE3FO/0nSJLXHCOmup6GEsWJoWrrZ6zmx0lM1ACD0HX4uP
         iPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=zAYgLaSnCGfa8SU+NH6gwotTtGoSsucybfqj2dUgdAM=;
        b=AE5NxRDDAa5U0ypaa5MMPNaTSiZr3I+zILaeCGtVGRrWBuswYDBpsbNpIZe0U3h5fn
         A7NHlPaXESgsHyUd4Pxp/aXSXARpshcNF2BAUOpzdcFbRiJES5BY1Hq/kfLutYlE2kx+
         tocDhgOZdISPIL7BdPqmR/gGc0JY6DJE6tS7QUTU7hvIE1+EwFyo6RKUoHNvjVkj2GBC
         CusS8XtRw+qe7+LDQPxYHNWCfo2DGSiuZz81oZfU/nhG6kucAefNxGMfKcqI0dNzogHy
         YGgbfskyeQAm2+ZHhLm+DpCQ3FfMM/gx0om0Pp8pTvLsXnnwAFr1kW6B5yZRUPFozqt5
         VfWg==
X-Gm-Message-State: ACrzQf0+cNtSUmTMjzcxPV44NLEiw4fMaSgqupN5DxQGNyCATTq/3ATY
        VP/rzajEVFIZ5d1oyKzhG4a4eUzp2jlBzvMfsU6fhw==
X-Google-Smtp-Source: AMsMyM6hJR0vYBEC7jTZoz6vd6S+i+o5RvWHLL1I4lSo6pa/Vl3uXej9EsG3CXyFZAW/4PjitKY0liOJGmvl0h0VKM0=
X-Received: by 2002:a17:906:8a46:b0:781:71fc:d23f with SMTP id
 gx6-20020a1709068a4600b0078171fcd23fmr16909585ejc.500.1664833634721; Mon, 03
 Oct 2022 14:47:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220927191736.299702-1-marex@denx.de> <20220927191736.299702-3-marex@denx.de>
In-Reply-To: <20220927191736.299702-3-marex@denx.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 23:47:03 +0200
Message-ID: <CACRpkdZwaHJUd4DEOiKXQ96x3UJfQSCz0oxr5d0QpBCnvEydYA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: stm32: Drop MMCI interrupt-names
To:     Marek Vasut <marex@denx.de>
Cc:     linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Yann Gautier <yann.gautier@foss.st.com>,
        devicetree@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
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

On Tue, Sep 27, 2022 at 9:17 PM Marek Vasut <marex@denx.de> wrote:

> The pl18x MMCI driver does not use the interrupt-names property,
> the binding document has been updated to recommend this property
> be unused, remove it.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
