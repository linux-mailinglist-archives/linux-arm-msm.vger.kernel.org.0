Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A70F54D91FA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Mar 2022 02:05:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344167AbiCOBGG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Mar 2022 21:06:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344154AbiCOBGF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Mar 2022 21:06:05 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0BEA3878A
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 18:04:54 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id j2so34467469ybu.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Mar 2022 18:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yAm5OvhWANM70n2iXAUODUmXPNizY/Wk3oobwqvI5vY=;
        b=XvgktuOwcdRbBdtoKoel2yPRVXVFwM+IWd2UW9qUYwDjWfzWWN9R8DmmJC1KiUj+gE
         bjAHWY0QxnGZv2MK54CisIBwTlUqNZnZ0p0QeZfJOCDulcicLR2Wfo5H+XmoS0uappZN
         YKR1N61LTv4GblaJTPOe2mZLMi6jcVgSbMYtTvJPD92xhsHsg905kUInBP+vjFjot9BR
         6NuZGmWYCww0juYpEGJFx+W+vixcbOtqCt6jPVc/CMB5yIxVEDbMk6kSJo453fKGYlva
         7NJTs2J8o0BIB4rZBb+4VkLXi16fNORKOhDGK2HtwPHJFyDI3dI0FXxfFug7o01j2WcB
         THqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yAm5OvhWANM70n2iXAUODUmXPNizY/Wk3oobwqvI5vY=;
        b=ze+iWVWBMyka1GajOvE4B3qU2tVUhle/+FJ60X0NYjQcBW9zZe6JtNlLx2GzSKXMjR
         c5WURJ5TQtM92Sn8Ff8gb6IWZTdkoZFbwOqtR96Wz+hNhbR790jwI1RQecP0kRKXRf2b
         Y9oNUFn9qOqLY9H7cJa/OvHA0aaKQ7oFhyl4FULYJTcAa8uOKzN8GUFbvmwXPXHKt486
         bAkhTdSShBZJEaFbFHTx/43SEDM2d/Lnk9CCM9qt6l3CtxriFwrNawaX8CE3hep+LJa9
         IlDvPE0NVB98tgjTLH46MpwNWea0q9WybsTpymXH39pmtGQT6rP/P5igDHjxFhhjdGGM
         nTag==
X-Gm-Message-State: AOAM531QSyzdEHjg/8aCDLd49LUBD7QMlPQxM8pFz64/mO/jmQom2thw
        kvnszHMPAzZu1s20bTtQnkPG5/DrRqklxaBEy8D23Q==
X-Google-Smtp-Source: ABdhPJwCTLgZvR10g8cOkgwnXUV0ru758i4gMC9avP243uwHJ9kOV3Y2hDoDgVxvAL3bYPi/kFB2JF8ViT9JoQcu10A=
X-Received: by 2002:a5b:dc5:0:b0:624:f16d:7069 with SMTP id
 t5-20020a5b0dc5000000b00624f16d7069mr19980767ybr.295.1647306294150; Mon, 14
 Mar 2022 18:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220308221132.1423218-1-bjorn.andersson@linaro.org> <20220308221132.1423218-2-bjorn.andersson@linaro.org>
In-Reply-To: <20220308221132.1423218-2-bjorn.andersson@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 02:04:43 +0100
Message-ID: <CACRpkdbvW0MVdhgFiVCcz+NDJu+mJc=4AgHC3AYnjZy+OOm2qA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce sc8280xp TLMM driver
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 8, 2022 at 11:09 PM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:

> The SC8280XP comes, like all other Qualcomm platforms, with a TLMM
> block, so add a driver for it.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Patch applied!

Yours,
Linus Walleij
