Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81AB057E2EA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 16:17:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231365AbiGVORY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jul 2022 10:17:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiGVORX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jul 2022 10:17:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BB6BA0258
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:17:23 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sz17so8824831ejc.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XOFvKfEIVXIuCG4wFkll4Xj+8m/Jo4dyU0NBpZKLOaE=;
        b=Oe2uAHcYKDidPdcan2Blg4s7Aj8e1cUpI2iL+dDn5seVv/fNHJVQg2aQQQp3XTbjad
         NWAxBESHJ4/X5V1m4vFnM4gxIx/Q9iOJpMe8wPviVmGI64lPZFICsANkWdBL2AtAPfZd
         ULt24o7YUW09Ix6j706SPUebafwFWZmh6JY4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XOFvKfEIVXIuCG4wFkll4Xj+8m/Jo4dyU0NBpZKLOaE=;
        b=SPFK/xN8WlO+agW6jNvDLsagVTQLhvPeAB/7+CwZQg3Tj20UMSc3MTfDfz+RJiCOmZ
         1NhNb9MXEZXySPCrEuzg23P6VTfmJhLVz+WAR6XehMmrPkpn7Ph/kLEiF50yHGVb6zTe
         3AtFDEdJWJ4vDqhsxbTsTskG8YjLRRSgd+qvDVyS8l3hpmfhN9EuuI/0ycIaHbqrHkjM
         IdvGDKSRqyibEfErQvHnPQQ/1afsUU4ZjvP81U5e8pQMl1AhVNqJnODbMbYsqhp1s1rL
         zxVvGs3pL0zJyEnKjC/yv0L1Re9lCd2WUbKBnoX8a05bwW9LiJT7EFw1A96e91mUaMCN
         NgoQ==
X-Gm-Message-State: AJIora/g1S2TerNJ4EQpG680BGGdLQFrDCTqD+zV0ipM8Q6zP2olD5rO
        6++IrIyThZGgbjdSlskK/f4UxYcaLnUpcJmMEms=
X-Google-Smtp-Source: AGRyM1vh8/DT/RooeAtO3UEDuvKyG3/tSj/LxEJG1UiBBH/vmIwRJw9TM87l0EhQizADmlzZA6ZAew==
X-Received: by 2002:a17:907:1dc2:b0:72b:4a90:d45d with SMTP id og2-20020a1709071dc200b0072b4a90d45dmr104676ejc.730.1658499441333;
        Fri, 22 Jul 2022 07:17:21 -0700 (PDT)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id b21-20020a170906151500b007030c97ae62sm2038296ejd.191.2022.07.22.07.17.19
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 07:17:19 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id u5so6706548wrm.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 07:17:19 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr126302wrn.138.1658499439534; Fri, 22
 Jul 2022 07:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220722081127.228971-1-jinghung.chen3@hotmail.com> <SG2PR03MB50062792832700DC51EF6143CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB50062792832700DC51EF6143CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Jul 2022 07:17:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vx9zOefBFw25tP7+nwuiggC1eEq0R8xAGD6YGaZdWmHg@mail.gmail.com>
Message-ID: <CAD=FV=Vx9zOefBFw25tP7+nwuiggC1eEq0R8xAGD6YGaZdWmHg@mail.gmail.com>
Subject: Re: [PATCH v7 3/3] arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 22, 2022 at 1:12 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds LTE skus for villager device tree files.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
>
> (no changes since v6)
>
> Changes in v6:
> - Remove v5 accidentally added sc7280-herobrine-herobrine-r1-lte.dts
>
> Changes in v5:
> - Reorder '.dtb' in Makefile
> - Put the "interconnects" line back
>
> Changes in v4:
> - Reorder 'status' last
>
>  arch/arm64/boot/dts/qcom/Makefile               |  2 ++
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi     | 11 -----------
>  .../boot/dts/qcom/sc7280-herobrine-crd.dts      |  1 +
>  .../dts/qcom/sc7280-herobrine-herobrine-r1.dts  |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 17 +++++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r0-lte.dts   | 14 ++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts   | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts         |  1 +
>  8 files changed, 50 insertions(+), 11 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts

Please carry forward tags from previous versions unless you've done
something to justify removing them. From v6:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
