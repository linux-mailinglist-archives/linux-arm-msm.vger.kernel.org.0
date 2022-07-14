Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47A83575137
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Jul 2022 16:58:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238171AbiGNO6G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 Jul 2022 10:58:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239487AbiGNO6F (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 Jul 2022 10:58:05 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A5895F112
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:58:03 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t3so2818997edd.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rmwz5UdPDv24j9r/+qXMLUwb1qPdbsCqRql7+qkdLJs=;
        b=cBnF70BmBTyQ0KYw65AGC7GPK0gtdqWmk/Tf/JXFG8mMNz0BzuRU/6XEtfPK7jI2oH
         JcrIEjJLGRShuiUNIupNKcqHaWlWWgRpJIz+NlfLHgHWAthrpbz1xMJb/0zgX+TJPsBI
         d8vPIChTYB8Njs0gL8IgYBdFj4WFO2ABsZawg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rmwz5UdPDv24j9r/+qXMLUwb1qPdbsCqRql7+qkdLJs=;
        b=iyu1/h2TV6wKfTefNQ7L3jQLWjk1+8R6zgktaxyVirgIEya9AFTfSZyrKYENpLj13A
         seGlY0GMh9ceA2ExoPAuBK1WMSrgTj5DbdsHsEPpyl7j83HXDqJ+I7fT8i/tMCxCFf+9
         r5zpa24/s0DJecTMCW1TYeJOf1yeUnZN7na49oWwHOkdspXPcDjMJIDdVJwXBaeuEBAQ
         CU3193MT+fnMNj2YhK1yFFUpKw6YBSnwiJFN4VgKqyZmAn+HwXRyrdT+XZWwKFJG7R1m
         1adK5/jy0ftJRmQmIT6Hs6mlksTGHQAqg1nuqJhpY3WZvhdizStVbFCKwd0OsGaXqcqx
         OG3w==
X-Gm-Message-State: AJIora8iGwjm8s10tWXdiwsqrqsjtbvkhBGzwFArDrkKcomHu4Whl4ht
        BxMARh6DEww7CHcvCzU5iT3WnAdXHETG5FTd
X-Google-Smtp-Source: AGRyM1vEbQCI6HC+Gk1WMRqcIMTL3j/2ehTwO1vdKBbBQHkNFr7YMQZE3HOWAHpdVgErdYZZMWr5YA==
X-Received: by 2002:a05:6402:d0a:b0:437:f9a1:8493 with SMTP id eb10-20020a0564020d0a00b00437f9a18493mr12985253edb.226.1657810681649;
        Thu, 14 Jul 2022 07:58:01 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id o20-20020aa7c7d4000000b0043a587eb95dsm1191898eds.5.2022.07.14.07.57.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 07:58:00 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id n185so1202727wmn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 Jul 2022 07:57:59 -0700 (PDT)
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr9537025wms.57.1657810679294; Thu, 14
 Jul 2022 07:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220714074958.86721-1-jinghung.chen3@hotmail.com> <SG2PR03MB500619860DC13133A0B5EB4FCC889@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB500619860DC13133A0B5EB4FCC889@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 14 Jul 2022 07:57:47 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XFCjCx=uXHWpEi04C-V9p-3qOp1W1g_0WXA4k-nRr1Zw@mail.gmail.com>
Message-ID: <CAD=FV=XFCjCx=uXHWpEi04C-V9p-3qOp1W1g_0WXA4k-nRr1Zw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: qcom: document sc7280 and
 villager board
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 14, 2022 at 12:50 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds a LTE skus for Chromebook Villager to the yaml.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> -Add this patch
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
