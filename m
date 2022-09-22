Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 228145E687C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Sep 2022 18:33:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229803AbiIVQd1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Sep 2022 12:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbiIVQdY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Sep 2022 12:33:24 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4648F9B84A
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:33:23 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id m3so14338898eda.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hHrtnzL79eYFEPjEF2yi096AMyC1QbuWRhmXoAyygq8=;
        b=E62MrqC3zOFBmFTKp4oTrZM/z66KQ4CtKhMc2j6L40FWedjqY5X2kE0XK83hQj29ua
         E0ImPDNsXVMBpE45yGGoqoYfZBi5TXdevSXameDBsxFPmEN/dxbtcS0uKjMwnI2sjHNs
         nODz6eNmWN6bpNR1mbiggJufeDZtbZba0MrfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hHrtnzL79eYFEPjEF2yi096AMyC1QbuWRhmXoAyygq8=;
        b=octAyjFLhSL2RfLdlNqkMBaZ6IhR8h2MtMtXs09GAHyB+DiG5MX/79ECXzUMAK6VmS
         Rc8w8GurR+nqzi61SFJLX+zoNVwNny1fjMR13tSxGVt2vVAE4jNuYSKu9SGMi9qRh64X
         Ehbw/6S4pt6OBhNXS1G/VCS7blJoHGjiCr9Is6bNUfgZ+7e7/ZzaU+hZkDMfBSaFCdls
         ynQ98AZExHNz8qUKVS/uY8mQDTJy9RyZpWMNhgSN/7OlBGbHdNgQu8bgnikAqe7iXlMG
         JJDOiDK0SqQT6teeksMrRb6+EBi1r2rLRAWDEFS9ExvWK/gaLAuzI2Lemm4yFPFWEFDy
         BkzQ==
X-Gm-Message-State: ACrzQf3kdZjnSDm1uOFhnEMwXS33XxdeHq7onS1hnOq28Aqk1EWFIagI
        Fe+Jp+udMXXK08vD4IEbheKtmgqW3vFLYLSv
X-Google-Smtp-Source: AMsMyM5UwGp5YMAQGGL/+3R12U3s2Av8RyKzUhyprya8jRqvU6nxSi0x4QRDkxoe803+nZ4BeG6tkg==
X-Received: by 2002:a05:6402:1909:b0:451:ace7:ccbd with SMTP id e9-20020a056402190900b00451ace7ccbdmr4146137edz.276.1663864401645;
        Thu, 22 Sep 2022 09:33:21 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id ay4-20020a170906d28400b00777249e951bsm2837927ejb.51.2022.09.22.09.33.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:33:20 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id h130-20020a1c2188000000b003b4cadadce7so1693770wmh.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Sep 2022 09:33:18 -0700 (PDT)
X-Received: by 2002:a05:600c:5488:b0:3b5:634:731 with SMTP id
 iv8-20020a05600c548800b003b506340731mr1759364wmb.188.1663864397810; Thu, 22
 Sep 2022 09:33:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220922101813.v4.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
In-Reply-To: <20220922101813.v4.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 22 Sep 2022 09:33:05 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWhf2nfs-+5JhTjWxwUUmvfPkO8VwBi=d9SM8Zr+Pq=A@mail.gmail.com>
Message-ID: <CAD=FV=XWhf2nfs-+5JhTjWxwUUmvfPkO8VwBi=d9SM8Zr+Pq=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: arm: qcom: Document additional skus
 for sc7180 pazquel360
To:     Yunlong Jia <ecs.beijing2022@gmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Yunlong Jia <yunlong.jia@ecs.com.tw>,
        Henry Sun <henrysun@google.com>,
        Bob Moragues <moragues@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Sep 22, 2022 at 3:21 AM Yunlong Jia <ecs.beijing2022@gmail.com> wrote:
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
> Signed-off-by: Yunlong Jia <ecs.beijing2022@gmail.com>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> ---
>
> Changes in v4:
>  1. Adjust the 'Signed-off-by'.
>
> Changes in v3:
>  1. Adjust the format of the changelog.
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)

You should have carried the Ack that you had on v3 [1]. Please send a
v5 with that fixed. AKA:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[1] https://lore.kernel.org/r/20220901024827.v3.1.I3aa360986c0e7377ea5e96c116f014ff1ab8c968@changeid/
