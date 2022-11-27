Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43710639D62
	for <lists+linux-arm-msm@lfdr.de>; Sun, 27 Nov 2022 22:44:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbiK0VoC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 27 Nov 2022 16:44:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbiK0VoB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 27 Nov 2022 16:44:01 -0500
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77B38AE64
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:44:00 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3691e040abaso88638727b3.9
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Nov 2022 13:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3YJ8VN4qd/z1cevuuYf6BzrtIafu4RWyw6odYhJ3RM=;
        b=xl2aTicD/qKFHfHq+LzfroPQbYHSrzIEfeD2Ob6oEuWgU8WzZDTYs4L/9thbGXh5nm
         Xs6+ApXjhZJriEXHtYdizyyIiJd71ebrvCROaIpXiePzWb7fIUWM8kPUaxjgTTiEdM22
         ncHVYNuOfFdE+ZrwOZWXR5gMWSoUNNYvXkZYhaxMjLGPrFLXYy8Dw4AoGi1IgTSev8eZ
         Bps1SUwAPz8bpOYMI0Ej8OYYRGQtRWqVnOfHBOlW9YpemZMlT8AEE4r3D+cTczzKp87i
         39tAofYvg3XMb1auK6XP3i8sXQFXMN3BVyw+wQZ7+OcaQOPVD/L7CaBuVOyDGJNfrePE
         B1Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q3YJ8VN4qd/z1cevuuYf6BzrtIafu4RWyw6odYhJ3RM=;
        b=5+wBl5zDyTDn8yvmokeAUaVRxfbod004DtdhxD4GGsejN4gqcB5Dd8NfOom2aMRa29
         kcZtvw40MmnWqY4zvzWtRwGVrY9cnSJ3W4GJDiR5JNLhv3I6ueiKYyoYgns4owzPSPj4
         4Fivf42nuVrfW3nSxp3be024w4QR0DsaUhGE2tUmNLSeC9OOUjnD/sWCMqjiBv2Srrqr
         0r1S+7KOg6UB/rNXcDR010LR0zMc36N5Na5WLt728s9SOj7Bz0TWb3DTXHZTKZ0lqnN9
         nSWUqxXUlzbW1VT04JzzRiLcekfgAb6A6T9eBL7LxrbzK9O72Jn62Mxw178pP6IcXJQC
         tlIw==
X-Gm-Message-State: ANoB5plfAIS6I383yvnlhI1yPzRGRmUDqvwEHiisQqhac9i8if2gcOgq
        swPrjIErE6I9LAarwVK+78SfgcS5HnIcARKZBjaVwoaDGX4=
X-Google-Smtp-Source: AA0mqf66I8xq7rZ0bAaQt2cLk1BVbeeZsnMiNjpUCai1K5JbdH+J7KsZFasgMiyl2LhZUBDdGTtqrDTIudgq871HxEk=
X-Received: by 2002:a81:520d:0:b0:3c0:c065:7608 with SMTP id
 g13-20020a81520d000000b003c0c0657608mr7161381ywb.378.1669585438656; Sun, 27
 Nov 2022 13:43:58 -0800 (PST)
MIME-Version: 1.0
References: <20221127181835.806410-1-luca@z3ntu.xyz> <CAA8EJpoe09FZcfVXuknmFWO5qg-iYDOBVN3=qr=DeJjvHw56Mw@mail.gmail.com>
 <f0a15b01-81b6-5c73-6c35-ce3a8c71b4ad@linaro.org>
In-Reply-To: <f0a15b01-81b6-5c73-6c35-ce3a8c71b4ad@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 27 Nov 2022 23:43:47 +0200
Message-ID: <CAA8EJppEXpv-wVAAXhZ6NiPzDGzP+evnKrT=an5esOx610D+dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom: Document oneplus,bacon device
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
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

On Sun, 27 Nov 2022 at 23:30, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 27/11/2022 22:25, Dmitry Baryshkov wrote:
> > On Sun, 27 Nov 2022 at 20:19, Luca Weiss <luca@z3ntu.xyz> wrote:
> >>
> >> Document the OnePlus One ("bacon") which is a smartphone based on the
> >> Snapdragon 801 SoC.
> >>
> >> Also allow msm8974 devices to use qcom,msm-id and qcom,board-id.
> >
> > The patch itself is good. However it raised a broader question for me.
> > Up to now all msm8974pro devices use qcom,msm8974 as a top-level
> > compatibility string. Should it be changed to use pro-specific one
> > (e.g. qcom,msm8974pro)?
>
> Yes, makes sense.

Would you make the patch?

-- 
With best wishes
Dmitry
