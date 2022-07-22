Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8087157E607
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Jul 2022 19:54:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233965AbiGVRyS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Jul 2022 13:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232383AbiGVRyR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Jul 2022 13:54:17 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D00B217
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:54:17 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id y197so3340553iof.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ue0tc0adu1W83NSgyETf8DUiCKAIIriUdz0pGaeFGiM=;
        b=h7n2Ohg6jboD5Oevy+0g87C911HBazqSA8cA404DtpQJKvNaWodxAOKcF5pr4LZRwC
         HV1Qu5FqHBz4aiUjc+OzYlURLq6KwN0tLVuixL9qccP9jz46c3uJVI2z0DqcmWIFBuYN
         RA2dnwvZMKZe+2dWiMZVvidUgX9zZuPTVKoyE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ue0tc0adu1W83NSgyETf8DUiCKAIIriUdz0pGaeFGiM=;
        b=ucKxuzvAoeXiKie2bXHjppOqKLd6Hv/vGknYb9AGAeuj8CTGMf8UnbO4aWlGqqo6Ye
         Z0kY5OizFwwndgFJEyntvuCCdMhKszXXbRjrZ/ouJllueUJK73x4aWhu13DwWGfqjPwf
         cpOtyXxJzHnub1WX890f4d04jUfp3ugDp3O6Ifguc8NOzJb+LRCk/oCaxrHti78CiIop
         XPREdkd2QMs7AUlTnfSK0bz8bIP27qSp2WMDTteRey0D89yzGGXlJzxw1ofSFTHL2iLw
         uRlx+XG4cxqBhfh4THXfl5sOcwR+faB+mc2O6i964D/QtIuVD/RremJbz0kughsarBCt
         ++Fg==
X-Gm-Message-State: AJIora/U8LNAUT+XoELtFS3hRmiMLLO4+k3QPW8MVFjQW7oj8U6qjDki
        1DPvyHMqsfaeZf6fOqe4XTFW54FRtwQrdJvX
X-Google-Smtp-Source: AGRyM1v2yo+gjd7LnGG8WJaJvbwulGKatSurgOFxtaLIEGzs4XisRvAcdQ300OV1GgodPk4FtQGqUA==
X-Received: by 2002:a05:6638:2596:b0:33f:8e0c:6af4 with SMTP id s22-20020a056638259600b0033f8e0c6af4mr547520jat.128.1658512455992;
        Fri, 22 Jul 2022 10:54:15 -0700 (PDT)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com. [209.85.166.54])
        by smtp.gmail.com with ESMTPSA id a64-20020a029446000000b003315c00e885sm2236430jai.0.2022.07.22.10.54.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Jul 2022 10:54:15 -0700 (PDT)
Received: by mail-io1-f54.google.com with SMTP id q14so4189330iod.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 Jul 2022 10:54:15 -0700 (PDT)
X-Received: by 2002:a05:6638:388e:b0:33c:b603:516 with SMTP id
 b14-20020a056638388e00b0033cb6030516mr534277jav.133.1658512454563; Fri, 22
 Jul 2022 10:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <SG2PR03MB50065D57C3D89C39FA90AC08CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB50065D57C3D89C39FA90AC08CC909@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 22 Jul 2022 10:54:01 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V861t9d0Q1DdYOD1xBcds79WrG=t36Fn2sw9rV=ukQyQ@mail.gmail.com>
Message-ID: <CAD=FV=V861t9d0Q1DdYOD1xBcds79WrG=t36Fn2sw9rV=ukQyQ@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] Add new board revision and LTE SKUs for
 sc7280-villager family
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

On Fri, Jul 22, 2022 at 1:11 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> These patches add a new board revision for device Villager, and add
> new LTE sku for both board revisions.
>
> yaml issue has been clarified in [1] and [2], and 'status' has been
> reordeded last since v4.
>
> [1] https://lore.kernel.org/all/CAD=FV=WtKRFQr5jSQvsr08x9dgHrvenUWWtX_SKuCLuSvSH7WQ@mail.gmail.com/
> [2] https://lore.kernel.org/all/d3d4d90b-85b5-5ad9-78e6-5a074c21af4f@linaro.org/
>
> Changes in v7:
> -Revise typo in Makefile in ptch 2/3
>
> Changes in v6:
> -remove v5 accidentally added sc7280-herobrine-herobrine-r1-lte.dts in patch3/3
>
> Changes in v5:
> -Update subject and revise Makefile
>
> Changes in v4:
> - Add patch 1/3 and update patch 3/3
>
> Changes in v3:
> - Update patch format
>
> Changes in v2:
> - Add patch 1/2
>
> Jimmy Chen (3):
>   dt-bindings: arm: qcom: document sc7280 and villager board
>   arm64: dts: qcom: sc7280: Add herobrine-villager-r1
>   arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
>
>  Documentation/devicetree/bindings/arm/qcom.yaml | 15 +++++++++++++++
>  arch/arm64/boot/dts/qcom/Makefile               |  3 +++
>  .../boot/dts/qcom/sc7280-chrome-common.dtsi     | 11 -----------
>  .../boot/dts/qcom/sc7280-herobrine-crd.dts      |  1 +
>  .../dts/qcom/sc7280-herobrine-herobrine-r1.dts  |  1 +
>  .../boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi | 17 +++++++++++++++++
>  .../qcom/sc7280-herobrine-villager-r0-lte.dts   | 14 ++++++++++++++
>  .../dts/qcom/sc7280-herobrine-villager-r0.dts   |  4 ++--
>  .../qcom/sc7280-herobrine-villager-r1-lte.dts   | 14 ++++++++++++++
>  .../dts/qcom/sc7280-herobrine-villager-r1.dts   | 14 ++++++++++++++
>  arch/arm64/boot/dts/qcom/sc7280-idp.dts         |  1 +
>  11 files changed, 82 insertions(+), 13 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dts

We're at a point now where this won't be able to land for at least 2.5
weeks. Given other changes happening (especially the audio changes), I
suspect all the in-flight stuff will get confusing. As an experiment,
I created a staging tree atop the current arm64 dts tree and put this
there. I'll try to put only things that I believe are truly ready to
land there, but git hashes won't be stable since it's just a staging
tree:

https://github.com/dianders/kernel-staging/commits/qcom/arm64-staging

-Doug
