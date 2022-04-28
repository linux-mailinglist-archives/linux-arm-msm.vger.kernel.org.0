Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC3551382C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 17:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343654AbiD1PXW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 11:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346813AbiD1PXU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 11:23:20 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD978BC0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:20:04 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id k23so10263070ejd.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KK0oOt6tLl8qviBpPxZTlU4vCH0knOLsx36mHAlT6lQ=;
        b=hobi6qzldDfJZ9JO2M31Iij9Vk0MCdxX/g/ZxjRTOwC71zomr2LAVZ72xxu23k6QMr
         BzsHAysTO/zmBS6Gy4Pk58tUeavMruHU41mr4Hj1JDsxKLoEfSXwBFZCCQFb3MvA4U2U
         sTRUcMk4GmEE8c4/K7qEonnyFvoBezEpXBUz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KK0oOt6tLl8qviBpPxZTlU4vCH0knOLsx36mHAlT6lQ=;
        b=gmANc1A6BwLDCXlcY6o3/KK9Ro6jo/jUR/T0JpYagDFtHqKJG9935lKvyvwB6PlB3w
         A7WOEnUsNcmP7xEVWK1/Uq320QlSVp/hS470K3t3ECW1vHhCdoEQ+fMdl3Xp5htUanmu
         WsPwg3Yfg3ZIclkBQ+gkk5g8HLAn4NILgC3X8uUVVtKVsdUeXfyw100XKfqFnz9lGdkI
         VzYAi/BL6Bk00fPEkhpttWXeSKjritnFDar1s8EhxcGGVR15JDEoiheK4IaW2AHRKU4J
         s/WKZ5gRZbHjYAviMTqPOB1VrMl4Ow1kba9sN0R2MDK7NVCQwenAIyhvXT+b4hfOuB8H
         dlVA==
X-Gm-Message-State: AOAM533BRRAV4oIrivcCFtt+1VjhipKSVCc5E6BWosK6fqVAkRaQsCLn
        UtZqurg4FSikMKm2HjufUSbDzE9aLiyjSOnm
X-Google-Smtp-Source: ABdhPJzhwvMCGDxTGhieGk297vU3W73vaysbqjxaXhXg/XfNrG0//dmebmYKBQnebo4R4IeG7xN/Hg==
X-Received: by 2002:a17:907:3e03:b0:6da:8c5a:6d4a with SMTP id hp3-20020a1709073e0300b006da8c5a6d4amr32767613ejc.585.1651159202914;
        Thu, 28 Apr 2022 08:20:02 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com. [209.85.221.47])
        by smtp.gmail.com with ESMTPSA id kb2-20020a170907924200b006f3b4bd7423sm92773ejb.95.2022.04.28.08.20.00
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 08:20:01 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id q23so7245399wra.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Apr 2022 08:20:00 -0700 (PDT)
X-Received: by 2002:adf:f50d:0:b0:20a:e096:ef with SMTP id q13-20020adff50d000000b0020ae09600efmr13733028wro.679.1651159200182;
 Thu, 28 Apr 2022 08:20:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220427161717.v1.1.I300757d61810c5e9aa60ff964d09251cb4422c73@changeid>
In-Reply-To: <20220427161717.v1.1.I300757d61810c5e9aa60ff964d09251cb4422c73@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 28 Apr 2022 08:19:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WwN-mANNGK_2Lo8u0kuBcG_UOLdKQVfxEVpnmn0pMbTQ@mail.gmail.com>
Message-ID: <CAD=FV=WwN-mANNGK_2Lo8u0kuBcG_UOLdKQVfxEVpnmn0pMbTQ@mail.gmail.com>
Subject: Re: [PATCH v1] arm64: dts: qcom: sc7180: Add kingoftown dts files
 from v5.4 branch
To:     "Joseph S. Barrera III" <joebar@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Alexandru M Stan <amstan@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Apr 27, 2022 at 4:17 PM Joseph S. Barrera III
<joebar@chromium.org> wrote:
>
> Kingoftown is a trogdor-based board, shipping to customers as the
> HP Fortis 11 G9 Q Chromebook. These dts files are unchanged copies
> from the downstream Chrome OS 5.4 kernel.
>
> Signed-off-by: Joseph S. Barrera III <joebar@chromium.org>
> ---
>
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../dts/qcom/sc7180-trogdor-kingoftown-r0.dts |  44 ++++
>  .../dts/qcom/sc7180-trogdor-kingoftown-r1.dts |  17 ++
>  .../dts/qcom/sc7180-trogdor-kingoftown.dtsi   | 223 ++++++++++++++++++
>  4 files changed, 286 insertions(+)

This looks reasonable to me, but I think it would actually be more
convenient to send the support for the 3 boards you're adding in one
series just to reduce the likelihood of conflicts in the Makefile. Can
just include all 3 patches at once and call it "v3"?

Also: for future reference, the first version is usually not called
"v1". Usually the first version simply has no version at all and then
the second version is v2. In patman you simply leave "Series-version"
off the first patch that'll work.

-Doug
