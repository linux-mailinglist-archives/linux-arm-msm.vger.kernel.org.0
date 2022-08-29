Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72A0A5A4EFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Aug 2022 16:18:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbiH2OSH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 29 Aug 2022 10:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiH2OSG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 29 Aug 2022 10:18:06 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB9076B8C0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:18:05 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id z41so2932417ede.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6eA3iLMo74VU72GjAHzcIFbDrWSt4ldlMPUOCVv5jeM=;
        b=VcA3YkAROW9hVm7UZ1dQ22/roU/2b/Xc6ZArkKbpMusBVNlv1XHOnWqrDPbSJId1gd
         xXVRtWrhQRemWwrFuqkd/v71r67QLtmSjE+/X482AlKB3y7B6eOHfl4GoTe/qHKhbN58
         M9lJUHyiMHRDfkjbJ5Y9MKNYOqd4eJI/uZ6+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6eA3iLMo74VU72GjAHzcIFbDrWSt4ldlMPUOCVv5jeM=;
        b=w7R6Y80BMeVWZs4CbuKZS5CSSvG6pTW2XNAcbZJxzi10X0h1nlU4j4ayFdFZX2Uq9A
         OLufzpDf8Mz/PCx7zaspGx+NXTz3az9UdPyl6ElPLcYi7NfCu98zmJaWVLpx1ah3UsSW
         W37Rycfoge28Z0je1Ge0jkxdN9h5WcRqGoXkfXHS2s92c7P62TRq21PSaVvOOOMAMi0H
         XDrXzdwbV5sgvuGWhwMIhj9HLC8Ash7DUSuBATNtTvM5Ypje6FlDElVbuhwMBsbOWf5D
         /BJDp/W60L8u+Ea20/4NQ+yiAeKUxOVnX4QB8yIQSuXPtSGgTdFwFiQknVwSodX7PSLI
         AD3Q==
X-Gm-Message-State: ACgBeo1n1d/8+H4319TiU4TLdnjw/+S+DNAuZ2/xXf8FadskAULntEd/
        AxpUyM/gNGthoraeai+XVpq5cLdt/OTZnyYC
X-Google-Smtp-Source: AA6agR5tDBCUoLacsB2OJF3sUh2ijEpOsy0qeRUoo22Edb2598LPBNp+tlEmHEYUFGgF45ZBKmw9lw==
X-Received: by 2002:a05:6402:35cf:b0:448:84a9:12cf with SMTP id z15-20020a05640235cf00b0044884a912cfmr2877872edc.51.1661782684206;
        Mon, 29 Aug 2022 07:18:04 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id u9-20020a1709060ec900b0073d6ab5bcaasm4466468eji.212.2022.08.29.07.18.02
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 07:18:03 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id k9so10420474wri.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Aug 2022 07:18:02 -0700 (PDT)
X-Received: by 2002:a5d:6881:0:b0:225:28cb:332f with SMTP id
 h1-20020a5d6881000000b0022528cb332fmr6427367wru.405.1661782682352; Mon, 29
 Aug 2022 07:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220829030823.v2.1.If97ef7a7d84bcc2cf20e0479b3e00c4a8fb5a2fd@changeid>
In-Reply-To: <20220829030823.v2.1.If97ef7a7d84bcc2cf20e0479b3e00c4a8fb5a2fd@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 29 Aug 2022 07:17:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WdRJY45wznzdUJEPwm_MP8DMD7W6-DPmtLpcT0HZgVOw@mail.gmail.com>
Message-ID: <CAD=FV=WdRJY45wznzdUJEPwm_MP8DMD7W6-DPmtLpcT0HZgVOw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
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

On Sun, Aug 28, 2022 at 8:09 PM Yunlong Jia
<yunlong.jia@ecs.corp-partner.google.com> wrote:
>
> pazquel360 is an extension project based on pazquel.
> We create 3 sku on pazquel360:
>    sku 20 for LTE with physical SIM _and_ eSIM and WiFi
>    sku 21 for WiFi only
>    sku 22 for LTE with only a physical SIM
>  Both sku20 and sku22 are LTE SKUs.
>  One has the eSIM stuffed and one doesn't.
>  There is a single shared device tree for the two.
>
> Signed-off-by: Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>
>
> ---
>
> (no changes since v1)
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

If things don't change from one version to the next (or if the change
is very minor), you should carry forward tags. Thus you should have
included these tags when you posted your v2:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
