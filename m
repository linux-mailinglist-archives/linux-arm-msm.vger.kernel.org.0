Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE6C5AF792
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 00:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbiIFWBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 18:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbiIFWBB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 18:01:01 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BECB394121
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 15:00:59 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id fg1so4179055ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=a7BlxrU2ulUCUinwJQC17AnM6l9GrZy8aOhqpXfsYtY=;
        b=ZzpE+VKInyTLCtVVYQQH1y09V3uy2pFXV9Xe2a6fqHy3bUloQGyx+qFz3In6xQuUbe
         016tuW8KG+JkhYtDfL4jTD148uCnzOpECWn5+nxM1ezSrP+IWGpmXuJ4N6X+RLegGVF4
         mGewzGi6lkoLIhi0ejPgWYWIaBkT7UHJaycoo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=a7BlxrU2ulUCUinwJQC17AnM6l9GrZy8aOhqpXfsYtY=;
        b=A0EVTqRo76AOe59ox6v+gAmbmGoY/eQ01A9MXcNP3OufaVKmkzMKzQrup+mD9u04Jm
         URV4JLwvfjWWTy4GIUzP+ggYfrCUP4/9BUD/H/SEgCfNTSuI0OAdrmCMlSvi2aJGElu5
         u3U0MuN5Zk9UFgza5B4GPXqNngdr7zMU+pulzEg2wVXRZY2gKA21sFYk65rqwd8f8BIp
         HINJR0f2KCc+LlZlOLgPP4toxeq2V333AS4SgA4qDDAdI6/mn4Gr28IaclFl3YWyMQWW
         yRUQaaaMZ+K5+3kkcdUF36b2Q4Yr68SOOWt4mbpzqVgdr0VuiJAu6vkka2YO5SyFV8L+
         sbIA==
X-Gm-Message-State: ACgBeo1nqwi946DX0HDn/LhnfBFWh4mjQ76n7fTUbZ9cn1W/zwnnc/jI
        r97SJGxuoAKVCYRdQK3I0tU4Rr2VyKsuwzsg
X-Google-Smtp-Source: AA6agR76+72SViqcAiyOTqSfoFLgebeaJhdnmqK1QmG/JpH6ye8YSa1aufrqwZzArmWC4s4Uy+sxSA==
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id xi8-20020a170906dac800b00741545b796amr361031ejb.240.1662501658091;
        Tue, 06 Sep 2022 15:00:58 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id er20-20020a056402449400b0044d6c6a5b5fsm6733376edb.89.2022.09.06.15.00.54
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 15:00:56 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id k9so17480272wri.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 15:00:54 -0700 (PDT)
X-Received: by 2002:a5d:4d0c:0:b0:228:cd9f:5a4c with SMTP id
 z12-20020a5d4d0c000000b00228cd9f5a4cmr286781wrt.138.1662501653855; Tue, 06
 Sep 2022 15:00:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220830182923.3720287-1-dianders@chromium.org>
In-Reply-To: <20220830182923.3720287-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 15:00:42 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VD5v8q9shO=uugQiqzotxaGEP3jDfurU+MjuEztFvMqg@mail.gmail.com>
Message-ID: <CAD=FV=VD5v8q9shO=uugQiqzotxaGEP3jDfurU+MjuEztFvMqg@mail.gmail.com>
Subject: Re: [PATCH v9 0/3] arm64: dts: qcom: Add new board revision and LTE
 SKUs for sc7280-villager family
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Sibi Sankar <quic_sibis@quicinc.com>,
        Jimmy Chen <jinghung.chen3@hotmail.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
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

On Tue, Aug 30, 2022 at 11:29 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> These patches add a new board revision for device Villager, and add
> new LTE sku for both board revisions.
>
> yaml issue has been clarified in [1] and [2], and 'status' has been
> reordeded last since v4.
>
> v9 is me squashing changes from my patches [3] [4] in. For patches I
> touched I removed my Reviewed-by. I added my Signed-off-by to all
> patches.
>
> [1] https://lore.kernel.org/all/CAD=FV=WtKRFQr5jSQvsr08x9dgHrvenUWWtX_SKuCLuSvSH7WQ@mail.gmail.com/
> [2] https://lore.kernel.org/all/d3d4d90b-85b5-5ad9-78e6-5a074c21af4f@linaro.org/
> [3] https://lore.kernel.org/r/20220829084732.1.I9ef7f8b909a7afbef9ff2251a98c67033f37b516@changeid
> [4] https://lore.kernel.org/r/20220829084732.2.I22e256d1ebac577a91fac44d1d12919be7111cd4@changeid/
>
> Changes in v9:
> - Squash https://lore.kernel.org/r/20220829084732.1.I9ef7f8b909a7afbef9ff2251a98c67033f37b516@changeid
> - Squash https://lore.kernel.org/r/20220829084732.2.I22e256d1ebac577a91fac44d1d12919be7111cd4@changeid/
>
> Changes in v7:
> - Revise typo 'ARCG' to 'ARCH' in Makefile
>
> Changes in v6:
> - Remove v5 accidentally added sc7280-herobrine-herobrine-r1-lte.dts
>
> Changes in v5:
> - Revise rev0+ to rev0
> - Add -r1 line to the Makefile
> - Reorder '.dtb' in Makefile
> - Put the "interconnects" line back
>
> Changes in v4:
> - ("...: Add herobrine-villager-r1") new for v4
> - Reorder 'status' last
>
> Changes in v2:
> - ("...: document sc7280 and villager board") new for v2.
>
> Jimmy Chen (3):
>   dt-bindings: arm: qcom: document sc7280 and villager board
>   arm64: dts: qcom: sc7280: Add herobrine-villager-r1
>   arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
>
>  .../devicetree/bindings/arm/qcom.yaml         |  10 +
>  arch/arm64/boot/dts/qcom/Makefile             |   2 +
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi   |  11 -
>  .../boot/dts/qcom/sc7280-herobrine-crd.dts    |   1 +
>  .../qcom/sc7280-herobrine-herobrine-r1.dts    |   1 +
>  .../dts/qcom/sc7280-herobrine-lte-sku.dtsi    |  17 +
>  .../dts/qcom/sc7280-herobrine-villager-r0.dts | 325 +----------------
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts |  14 +
>  .../dts/qcom/sc7280-herobrine-villager-r1.dts |  16 +
>  .../dts/qcom/sc7280-herobrine-villager.dtsi   | 326 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts       |   1 +
>  11 files changed, 392 insertions(+), 332 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager.dtsi

Is there anything blocking these changes from landing? I just tried
applying them and they now give a (tiny) Makefile context conflict
with the evoker dts that just landed, but "git am -3" handled it fine
for me.

-Doug
