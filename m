Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 696205A2D25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Aug 2022 19:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234607AbiHZRPV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Aug 2022 13:15:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239224AbiHZRPU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Aug 2022 13:15:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54AE131341
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 10:15:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id gb36so4322104ejc.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 10:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=g1nhytGbLlPdFV0nY3tszrR1h/TIhkoKAPu2ahL0p/k=;
        b=b6SDldaWa7pnH5+2X9Grz6EJaMgJ2WMkQlr77r5OvIob6I976rGlXH0vexkLDXx7U3
         0OwV2PETanSenQ1JiMZzz9h6XEA+sgT3AFQpsSSkXNG+Cekpcplt3HHFKmFNiYEdyS19
         k/JyheHd2Fv+PSyCmDoRlTs4+oNEusAljCg9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=g1nhytGbLlPdFV0nY3tszrR1h/TIhkoKAPu2ahL0p/k=;
        b=xP1415Qt9VVOfB6QTSMANsxHzJ01Snx+XgBxxjLWauSMxELmK3c5+0+FW7uTQLlghL
         F0wpaWC6zf6quxYLT52CuC8aiZLnMDBVzsHNjPS8UkjK7S+jD4hZHDVTn9N8cBN8bke5
         xWyb8Ycmy8mxB6wFvW5m74u0Qlp1FrkQm3XLrI7ojXtxGQmTdsohL1OBPmnvZNarVSCk
         CJ/FVqdKs6wI3VbW6A0IRvhHCx3ukQ91JQkhzBcDR5HStPi/+EqK4CjwOJStn06h4mwf
         YvF8Gf6drJeXJ2cB7oZclluZCbx6bvLVP9ev0G16LQqdeBjYCfsgyuYbzCPgUp6skpUO
         +tkA==
X-Gm-Message-State: ACgBeo29KA4NU8Jsc/lzoFlYAWBCBSKrUIUiPxFOywIlCthDOl661adf
        pXZD9XxNLFA73oCnR1qYAN+mO+0FM+h5yVkN
X-Google-Smtp-Source: AA6agR4hcYuGuLP/lCQJ3fxQ6VSiaUFBp12kytOgpgbHJjcEx/ROlQ1Jrc1P1cHORLYM/sr+cSaI0w==
X-Received: by 2002:a17:907:6818:b0:730:d99f:7b91 with SMTP id qz24-20020a170907681800b00730d99f7b91mr5817732ejc.496.1661534112700;
        Fri, 26 Aug 2022 10:15:12 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id es5-20020a056402380500b0043bc4b28464sm1448380edb.34.2022.08.26.10.15.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 10:15:12 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso4742278wmh.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Aug 2022 10:15:10 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr357285wmq.85.1661534110473; Fri, 26 Aug
 2022 10:15:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220826065621.2255795-1-judyhsiao@chromium.org>
In-Reply-To: <20220826065621.2255795-1-judyhsiao@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 26 Aug 2022 10:14:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VrgrvJb_sJ8AO6pN8dRNXzzOJ9WvngeJrtVYw_wD1Akg@mail.gmail.com>
Message-ID: <CAD=FV=VrgrvJb_sJ8AO6pN8dRNXzzOJ9WvngeJrtVYw_wD1Akg@mail.gmail.com>
Subject: Re: [PATCH v4] arm64: dts: qcom: sc7280: Fix Dmic no sound on villager-r1
To:     Judy Hsiao <judyhsiao@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Judy Hsiao <judyhsiao@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Aug 25, 2022 at 11:56 PM Judy Hsiao <judyhsiao@chromium.org> wrote:
>
> Fix the DMIC no sound issue of villager-r1 by using "PP1800_L2C" as the
> DMIC power source to match the hardware schematic.
>
> This patch:
>    1. set vdd-micb-supply to PP1800_L2C as the MIC Bias voltage regulator.
>    2. In audio-routing, set VA DMIC01~VA DMIC03 to use the vdd-micb-supply
>       setting.
>
> Co-developed-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Signed-off-by: Judy Hsiao <judyhsiao@chromium.org>
> ---
> Changes since V3:
>   -- Update the commit message and fix extra blank line.
> Changes since V2:
>   -- Update the commit message.
> Changes since V1:
>   -- Update the commit message.
>
> This patch depends on:
> arm64: dts: qcom: sc7280: Add herobrine-villager-r1. [1]
>
> [1] https://patchwork.kernel.org/patch/12929106

After applying your [1] then your patch applies without merge
conflicts. However, it still doesn't compile. You also depend on
whatever patch adds the nodes "lpass_va_macro" and "sound" since
you're referencing them in your patch. I haven't been keeping track of
the latest status of all the audio patches, so I myself can't point to
exactly what patches you depend on and whether those patches are ready
to land.

In any case, the contents of this patch seem OK assuming the dependent
patches cause something that looks like the current (downstream)
chromeos-5.15 tree.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
