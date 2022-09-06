Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4939D5AF7F6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 00:27:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230041AbiIFW1M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 18:27:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbiIFW05 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 18:26:57 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852F713D52
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 15:26:56 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id lz22so5556929ejb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=a+Vs+P0ciT3P+roY2k8XBdIwCVWYhAwaTZ/i25+tK1Q=;
        b=G38S/EqecQ8sQP0LzugoHuJ4vO5tGIs1Irzd5Df2yBAJ60O5P5fac0bguYHaOigTSZ
         /8feiG7RBqs6a7WUgyG0z8RRq/IbpO2nf9njQRB0Vd5FXLenlPVPCSvkNxR3B5IQSHnP
         fGvhZTNH64t4bL+IDvTHVbgt/2/KnS70+CCcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=a+Vs+P0ciT3P+roY2k8XBdIwCVWYhAwaTZ/i25+tK1Q=;
        b=2T3AMzoVkXxZFodY1271vSI5GmIXROJuVYdhRiVCPY3CHMtO8s0y94R3s/BwiLhK9g
         4tRI9BIjJPPhrdj0CkDUwnIzF7XlbN3mLtne22b6BSgfCXvrwcMTAiYj8p4Lq8uNE2se
         nY3LQMPKvD0PV2DNhVKiky13jzyD8fEyN6HtviDHUSJsGPonReP3dDsk1NPy2zHWiG+f
         4Y3ArfrA3VBDW/D7G6wd9mIfT6T5DqB7y5nshvJwJyZd58pEIx4jKTwiAhw/Z3/FlW3A
         GXKpIXqzbRtC1aRaNRVF6kG3P5nBZFhDopTY8iI2cfDDEytiMICY+moC7P/2fKFBMGau
         TixQ==
X-Gm-Message-State: ACgBeo0hrdkTM2qNeHvGZfW2Bmz0OP2P5Yes7ykUlYdERnQjO1PL0oU1
        xN6T0ou9qwVymJYS2Lbx0BxgPBii4aVUWrzQ
X-Google-Smtp-Source: AA6agR4d0SFgd/lz8fkc6z9DPR8brdN/Ib6+pM2G4S+ft/BWbecPIfjr041PfpNVSEkw1w+hWeU2uA==
X-Received: by 2002:a17:906:3fc3:b0:750:5e2b:ff1b with SMTP id k3-20020a1709063fc300b007505e2bff1bmr402039ejj.233.1662503214805;
        Tue, 06 Sep 2022 15:26:54 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id g8-20020a170906538800b006fe0abb00f0sm7227706ejo.209.2022.09.06.15.26.53
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:26:53 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id k17so7634905wmr.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:26:53 -0700 (PDT)
X-Received: by 2002:a05:600c:22d3:b0:3a8:424d:f386 with SMTP id
 19-20020a05600c22d300b003a8424df386mr280546wmg.57.1662503212860; Tue, 06 Sep
 2022 15:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220901024827.v3.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
In-Reply-To: <20220901024827.v3.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 15:26:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wf2gPHzSXh_2bKe+KgYVhKDUgmEtx2nnBrQ9FawqxH9Q@mail.gmail.com>
Message-ID: <CAD=FV=Wf2gPHzSXh_2bKe+KgYVhKDUgmEtx2nnBrQ9FawqxH9Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
To:     Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Bob Moragues <moragues@chromium.org>,
        Henry Sun <henrysun@google.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Bjorn,

On Wed, Aug 31, 2022 at 7:50 PM Yunlong Jia
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
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v3:
>  1. Adjust the format of the changelog.
>
> ---
>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

I think these two patches are ready to land if now is a good time. Thanks!

-Doug
