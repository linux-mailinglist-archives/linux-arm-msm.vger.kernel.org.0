Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39AD46379BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Nov 2022 14:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbiKXNLs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Nov 2022 08:11:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229698AbiKXNLq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Nov 2022 08:11:46 -0500
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6236C901F
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:11:44 -0800 (PST)
Received: by mail-yb1-xb2f.google.com with SMTP id b73so1774455yba.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Nov 2022 05:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6sZUIFlO8x1Xa43uNLk8rAs6S8DjACHNKRy4/UVqYxk=;
        b=HgJ07p9wRcZ9lJ7dZMsesJUuO2UNfMBSqyd60Q5t4rXWUTYOy/Yq6Clilp8g5taZ6s
         upuhVYpg6EdIPrTHcfAupugJKZCm6hALfErPfBuC3S3lt0uFiZxEyPWg/bKtsZBwEraw
         +1hXW5Pp7Y8Eg4HGo/IKGiJqtSnBeS7gbWnDl/qY6+XbSVtclDj6nMqUWES9mGOL8q46
         6CxmoWe158bg3HidWFXmBaxmqUQ/X9AMj2k0aFc/Pjy6RXGVFFjO+x0+7MlWNFGN00TY
         3bVh38+HVLWTJnHP4fuFyw+K+WwldDb9JTsfPHlC/+gVYh43htSuKxYpxqcf/mpRGoLY
         lXPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sZUIFlO8x1Xa43uNLk8rAs6S8DjACHNKRy4/UVqYxk=;
        b=YdyoNArNw4gjKRZFHdPv/e/3c2I3tNZMSNXznGy7mkytNpqGvIQxcXQHskqq6IDtvf
         fpoWq30j61M/qIscBp7adSwR+x27lh5mBn0YUQwIhHnLhBXoMIxNdWHi0/35JonjzxTc
         Hp1vS7OXGxhibeaeUpZu78tThVC+qENGk4O1BpdOvlVSqQuiFRFlssmMY8o5McCk+tK+
         iSfH1w4H5+RnnVovnig6Em8W50V3YJv4i7ZZR7ZezBLHBYehlvsW+2nt1PXejuSOFZ+S
         DJZPVRu5X77flR0wuFJBzDgQArXZuqKYjpYGLZhMiWjhsRDPUxIeg0llMx1p7qmDuEow
         cjsw==
X-Gm-Message-State: ANoB5pltcTb7JAr5ggxeF1Me4nzsrjBGq8SERJBxrclv9uvhv1G6phtE
        4PuHsk+BysYz/2GGKG4cUXxqA3ElFsduM+IfDapmwA==
X-Google-Smtp-Source: AA0mqf5iyhDMaOQc7d8eXjJ8N2Td81cJmadQhGFPAU1VJblReyZXEKQELwNMORZhWOVKOxkV56OmLkhC+3hw2xotRtc=
X-Received: by 2002:a25:c485:0:b0:6be:8e8d:639f with SMTP id
 u127-20020a25c485000000b006be8e8d639fmr29506226ybf.506.1669295504054; Thu, 24
 Nov 2022 05:11:44 -0800 (PST)
MIME-Version: 1.0
References: <20221123152001.694546-1-abel.vesa@linaro.org> <20221123152001.694546-3-abel.vesa@linaro.org>
In-Reply-To: <20221123152001.694546-3-abel.vesa@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 24 Nov 2022 14:11:32 +0100
Message-ID: <CACRpkdZtkHCkfUAcezSJvmei=HOezK6oyx+4C5kBrEtU+vAB-g@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,tlmm-common: document
 i2c pull property
To:     Abel Vesa <abel.vesa@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
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

On Wed, Nov 23, 2022 at 4:20 PM Abel Vesa <abel.vesa@linaro.org> wrote:

> From: Neil Armstrong <neil.armstrong@linaro.org>
>
> Document the new i2c_pull property introduced for SM8550 setting
> an I2C specific pull mode on I2C able pins.
>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
(...)
> +      qcom,i2c-pull:
> +        type: boolean
> +        description: enable bias pull feature designed for I2C on pin

But what is this?

I2C buses are usually just plain old bias-high-impedance, high-z
or open drain, wire-or or whatever you want to call it.

But now there is some special i2c mode, huh?

The description is pretty much "it is what it is"... can we have
some explanation about what this means electrically speaking
and why you cannot use bias-high-impedance?

Yours,
Linus Walleij
