Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83BF552D416
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 May 2022 15:32:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236161AbiESNcA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 May 2022 09:32:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239032AbiESNbl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 May 2022 09:31:41 -0400
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 674ED5F27C
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:31:31 -0700 (PDT)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-2fee9fe48c2so56991037b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 May 2022 06:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3XnxyHbIe0ZBmAsG2JuG+QltijPeIqWVypBFknCicxo=;
        b=kYS0JcMgRcmEu9/JY4wcwmH4dMjbm8Sf+jBzLXPbQ2DcKYa61Hid4c/wSQNc3/gHuz
         ZTcY91PpEZjRTvp4ZqgVzZFWsgZJSX3+HsEtmhs8h1lp1/Vx2e2uX6nx5k5DUts9zJ0/
         O00Y0LTUX/XUt8KCH5mgUqvnIevZHRj+qYEzW0UlpWqgrOSJRDPqno42UHCD6T5dgrzl
         WeFvMzyhjzW5WTTeTtbDfMC/G18YXDdRqdvzCOO7A5A0Vrh3gf5Q7Oc4Jrd22FDVNuBp
         Urt0pvnWFqYh3+CkqcrhmtgP3zMDwbNO2z7dilq1bLcoZDSaM9DlI7K9iaJLEy0en/pU
         J/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3XnxyHbIe0ZBmAsG2JuG+QltijPeIqWVypBFknCicxo=;
        b=uhzwBY0Z6lu65dBQ8N4DSJ5mtBD3AMhFEW4hI8Z9n8PlO1oXkmsjF9HyTDWT0lwTqZ
         Cyz/RaSrhABwbaSwuhHiYzle8m/3cxTdE63PpIYjpiBOqeKwZm3ClQ/5sb1waL6mmG3i
         b8S7DcKgkpIwscQt/gJ+7QxMZ8B7fVjCsqsLDzbG+VSPmQ0yPoe7xbD2IjfhsVAMXtWg
         wJL5EQakpD7perPFn15TveztAXYV5Ssoog/1BDx/94jyY8pWhUY6Y05v4Zs1pcFPjL4k
         bfVR3SBsBw9XV3DkA7RSpMIsKh6ZF/XYU7kTmIeMyLSpDN61Qm0vyQwo/iJLr2yrvDy2
         Dtow==
X-Gm-Message-State: AOAM532hstczLD5Es3CVGhHxsoeZOUt6gFvJUib2eomdbi03Q6B+k08n
        D3BPYXCgpBndJO5CxvQSx0DVhlWdvswBgqiSI3alAg==
X-Google-Smtp-Source: ABdhPJxC5VgcYmjV4j7I0ElLpLTURx5L6cjrFDYuPYN61Od2Uz1HdmgBoQB10B6ZS0hGShCFD2W6W/brwNh3bVK/s7c=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr4695844ywd.118.1652967090590; Thu, 19
 May 2022 06:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220519011210.170022-1-robh@kernel.org>
In-Reply-To: <20220519011210.170022-1-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 19 May 2022 15:31:19 +0200
Message-ID: <CACRpkdZtUj=_X-uC46CO97GGqKBJR28h1Hoj60iSmMWUYc1LRA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom: Drop 'maxItems' on 'wakeup-parent'
To:     Rob Herring <robh@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Iskren Chernev <iskren.chernev@gmail.com>,
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

On Thu, May 19, 2022 at 3:12 AM Rob Herring <robh@kernel.org> wrote:

> 'wakeup-parent' is a single phandle and not an array, so 'maxItems' is
> wrong. Drop it.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
