Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 730D555DDC8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jun 2022 15:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236057AbiF0N7i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jun 2022 09:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236348AbiF0N70 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jun 2022 09:59:26 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DE3B1150
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 06:59:24 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id mf9so19488587ejb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xr9C6lKJBWSsgA7sh+r218LRs6Tue8WKsUgtQwWr6II=;
        b=OwyNsXe+N1ciOYY5a2+9p/kLZBgOMX6lCaNRB23dU31VZwWM4QVHT0ZuaX3kdB2DbC
         ERSE26axXBNxCwF0OcqQfjtC9679Xw09G2J2qx5IZG44oez2hZcOXdCo/BnWrMyAYbcj
         hlp2r6sSjOvJIRcIleSBWhrpORJsxe5M17J4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xr9C6lKJBWSsgA7sh+r218LRs6Tue8WKsUgtQwWr6II=;
        b=dIVqu4ooRu0Gm4kRcIIJiyvW8NRYX/dVdEVxg7qSb5u3DSn6A1xgZPE+TKcdcVZGKe
         zq+9EzG8BmUPzmnUM+26hh/MQ/VTkXN/qSJwCN3NRfmBbTXcWvux98ejEcsbys1mgOL9
         kYeJ3u2l+9WaJ3fv/x1iTGkj4eec/ZQSkv2J1QlJEe+8qmK9sweZhMKdlJM4aY8iCWbQ
         UFwh87aQoIygQsmIZs3wI3uDqHNEqzR4STiHj0mqZ8fW9l7MxrVI5djWd+HTcI2SuNyE
         QfgNOKVliCGZsXwWuUuLxub8D/tBIsxB4ZGQYdvjreMjuDIpm7Hig/Hl24q0Yjrav4MI
         N4Rg==
X-Gm-Message-State: AJIora+D7VFxy2AjOMJt++HCdMbr7xmC67x1nMP02S1pv8vyoXf1TdF+
        CyVYgDFvuc49uVdjgIGL6Kudpl6EeD/e4UV5
X-Google-Smtp-Source: AGRyM1tEB/oJO7Ia79QTaD3TZU5bZq71RMyFD2OoMlsOfAzEj3e8mQX/Kva3CgM2wsoxTW1UJaKt+g==
X-Received: by 2002:a17:906:14d:b0:711:ff36:b1af with SMTP id 13-20020a170906014d00b00711ff36b1afmr13000258ejh.422.1656338362916;
        Mon, 27 Jun 2022 06:59:22 -0700 (PDT)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com. [209.85.128.52])
        by smtp.gmail.com with ESMTPSA id pj10-20020a170906d78a00b006fa84a0af2asm5094055ejb.16.2022.06.27.06.59.21
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:59:21 -0700 (PDT)
Received: by mail-wm1-f52.google.com with SMTP id u12-20020a05600c210c00b003a02b16d2b8so5699929wml.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jun 2022 06:59:21 -0700 (PDT)
X-Received: by 2002:a7b:c14c:0:b0:3a0:4a8b:e2e5 with SMTP id
 z12-20020a7bc14c000000b003a04a8be2e5mr5559120wmi.188.1656338360672; Mon, 27
 Jun 2022 06:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220626013906.885523-1-joebar@chromium.org> <20220625183538.v14.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
In-Reply-To: <20220625183538.v14.1.Id769ddc5dbf570ccb511db96da59f97d08f75a9c@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 27 Jun 2022 06:59:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xs20zLOSwhqL+30ziQquCaqtQ2Od_-3oLF5YAv3FRdUA@mail.gmail.com>
Message-ID: <CAD=FV=Xs20zLOSwhqL+30ziQquCaqtQ2Od_-3oLF5YAv3FRdUA@mail.gmail.com>
Subject: Re: [PATCH v14 1/5] arm64: dts: qcom: sc7180: Add wormdingler dts files
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sat, Jun 25, 2022 at 6:40 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Wormdingler is a trogdor-based board, shipping to customers as the
> Lenovo IdeaPad Chromebook Duet 3. These dts files are copies from
> the downstream Chrome OS 5.4 kernel, but with the camera
> (sc7180-trogdor-mipi-camera.dtsi) #include removed.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
>
> ---
>
> (no changes since v9)
>
> Changes in v9:
> - Correct version history, based on diffing earlier patches.
>
> Changes in v7:
> - Restore changes requested by Doug.
>
> Changes in v6:
> - Only include sc7180.dtsi in sc7180-trogdor.dtsi (19794489fa24).
> - Simplify spi0/spi6 labeling (d277cab7afc7).
> - Simplify trackpad enabling (51d30402be75).
> - Accidentally deleted changes requested by Doug.
>
> Changes in v5:
> - Replace _ in node name with -
> - Order nodes by name
>
> Changes in v4:
> - Clean up rt5682s files
> - Restore camcc definition
> - Add missing version history
>
> Changes in v3:
> - Remove camcc definition
>
> Changes in v2:
> - Word wrap patch description.
> - Remove "Author" from patch description.
> - Fix whitespace around "en_pp3300_dx_edp"
>
>  arch/arm64/boot/dts/qcom/Makefile             |   6 +
>  .../sc7180-trogdor-wormdingler-rev0-boe.dts   |  22 +
>  .../sc7180-trogdor-wormdingler-rev0-inx.dts   |  22 +
>  .../qcom/sc7180-trogdor-wormdingler-rev0.dtsi |  53 +++
>  ...0-trogdor-wormdingler-rev1-boe-rt5682s.dts |  29 ++
>  .../sc7180-trogdor-wormdingler-rev1-boe.dts   |  28 ++
>  ...0-trogdor-wormdingler-rev1-inx-rt5682s.dts |  29 ++
>  .../sc7180-trogdor-wormdingler-rev1-inx.dts   |  22 +
>  .../dts/qcom/sc7180-trogdor-wormdingler.dtsi  | 408 ++++++++++++++++++
>  9 files changed, 619 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0-inx.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev0.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-boe.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx-rt5682s.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler-rev1-inx.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-wormdingler.dtsi

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I put this on a google,wormdingler-rev2-sku0 and confirmed that it at
least booted up and showed stuff on the screen.

Tested-by: Douglas Anderson <dianders@chromium.org>
