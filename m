Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3535956A56C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jul 2022 16:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235413AbiGGOb7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jul 2022 10:31:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234943AbiGGOb6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jul 2022 10:31:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7592F3BF
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jul 2022 07:31:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id fd6so23383684edb.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+lY857WNunFqeqIFvxE1vZpLl3WuWGarLzBkhv9eJbA=;
        b=NSB+HwZAGzym7P8P5YzXKsR+yE+p76mZE/kK8486IflBF3t23m7j3+LsvPtzSC2/Wf
         dp7N0rTamqmMKX2sd/ZgWDY7mV3EI7hFiKuc7AgeUHmhbGsvaUEaDApZUyMmZe3m7Hjj
         ySgJA6vxLeoh0FkRpBmq8K4gXxlXxsA+KjtKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+lY857WNunFqeqIFvxE1vZpLl3WuWGarLzBkhv9eJbA=;
        b=ssS0wsp2rF2Rpor9oD56Jbxlg0JdPyDX9VIdSeyLwMJs4rjiaR2EqGAeG5uVLQTH6m
         gRbbzg/ICKzs3TrV+akvP4PLOPaWaqGmP6x3pu73nxiZ/6y4hYnaT4zf8WoODhanF4YO
         n0vJ7iWFZGWHHadHq9B/+WS6Fj9z8191oEyPTJ0hKeS/UZ+cUBca4Db2kDkDgSn1AHso
         WiK7hldUhPDVW/CACSL6fCVdZ3KOTJQqh/3fVr0LnayldUw6JHy5Wd34uanmxWpRa6Ph
         EyJbamoLMwzBilHUxJW/7WMixfOCtMo08rtY3Tw3y+H9msRxetfdPjpM2+XFQ9kW0kz9
         ANbg==
X-Gm-Message-State: AJIora/z7cm+JxeVG7wrOlLllvO1195BOTBg1d4SnREz1P9rCCNAwyC+
        rO++OtZyf+ppN8bcILlrAyioYnISUVq0IjSSWTA=
X-Google-Smtp-Source: AGRyM1sLDNDVDmwI2MINARCKcPlPQw4NxL0SXkBeawCBkcppcDlXYp75TxuX2kqgOaChI8uyGZ3v/w==
X-Received: by 2002:a05:6402:150d:b0:43a:2cac:ca24 with SMTP id f13-20020a056402150d00b0043a2cacca24mr32727293edw.110.1657204315141;
        Thu, 07 Jul 2022 07:31:55 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id cq9-20020a056402220900b0043a6df72c11sm8582399edb.63.2022.07.07.07.31.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 07:31:54 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id n185so10756549wmn.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jul 2022 07:31:54 -0700 (PDT)
X-Received: by 2002:a1c:4c0b:0:b0:3a1:92da:bddf with SMTP id
 z11-20020a1c4c0b000000b003a192dabddfmr4827050wmf.188.1657204313641; Thu, 07
 Jul 2022 07:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220707075151.67335-1-krzysztof.kozlowski@linaro.org> <20220707075151.67335-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220707075151.67335-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 7 Jul 2022 07:31:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFdtx_v3iPaNYDkhBw+fkSRriG0-w1R5vXRCugZPW6Vg@mail.gmail.com>
Message-ID: <CAD=FV=WFdtx_v3iPaNYDkhBw+fkSRriG0-w1R5vXRCugZPW6Vg@mail.gmail.com>
Subject: Re: [PATCH 2/5] dt-bindings: mmc: sdhci-msm: constrain reg-names at
 least for one variant
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Jul 7, 2022 at 1:04 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The entries in arrays must have fixed order, so the bindings and Linux
> driver expecting various combinations of 'reg' addresses was never
> actually conforming to guidelines.
>
> Specifically Linux driver always expects 'core' reg entry as second
> item, but some DTSes are having there 'cqhci'.

This is a bit misleading and makes it sound like we've got a bug. In
truth the Linux driver looks at the compatible string. If it sees any
compatible listed as "v5" (or a slight variant of v5 to handle a
workaround for sc7180 / sdm845) then it _doesn't_ expect 'core' reg as
the second entry. See the variable `mci_removed`. The old bindings
".txt" file also had this to say:

                For SDCC version 5.0.0, MCI registers are removed from SDCC
                interface and some registers are moved to HC. New compatible
                string is added to support this change - "qcom,sdhci-msm-v5".

So I guess that means this is the documentation for all of the
combinations you have listed:

* hc only - v5 controller w/out CQE / ICE

* hc + core - v4 controller w/out CQE / ICE

* hc + cqhci - v5 controller w/ CQE and w/out ICE

* hc + cqhci + ice - v5 controller w/ CQE / ICE

* hc + core + cqhci + ice - v4 controller w/ CQE / ICE

Said another way, before v5 the "core" range existed. After v5 it
apparently doesn't so there's no way we could have specified it.

You'll notice that one of the options above implies that a v4
controller (with "core" specified) can have CQE and ICE. Is this
actually true, or was it a misunderstanding in the .txt to .yaml
conversion?

If it's true that a v4 controller can have CQE and ICE then your patch
is wrong in asserting that v4 controllers have only "hc" and "core".

If a v4 controller _can't_ have CQE and ICE then your patch is right
but incomplete. It should also be removing the option:
          - const: hc
          - const: core
          - const: cqhci
          - const: ice

I am not intimately familiar with Qualcomm MMC controller history.
That being said, the old .txt file said:

        - CQE register map (Optional, CQE support is present on SDHC
instance meant
                            for eMMC and version v4.2 and above)

To me this implies that a v4 controller could _at least_ have "cqhci".
I dunno about "ice". I seem to recall that this was the argument for
why the driver had to use reg-names to begin with and why the driver
looks for "cqhci" by name.

-Doug
