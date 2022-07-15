Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4224457637B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Jul 2022 16:14:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235462AbiGOOO2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Jul 2022 10:14:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235387AbiGOOOY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Jul 2022 10:14:24 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D54A11570A
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:14:22 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id ss3so9170109ejc.11
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0gmpAzq1QLQJvy1sF1qsN2KHunfvdectBOUVazsFT0c=;
        b=M7DPLx6wiUJsGIxyF+Mfs16brKcddihTLDDfbseDRC0UoXNlRRl5Tk7c84fYx+qxK0
         HipLuAx8IOhv9YAWcHpvJL2VSY6g8vwXNJPBQleA650i8RJDezv4aXGTdaAVFlOOJgFX
         bQW2PSWuaNK8v7zyIeFh7rmx+svJvoQkrywDo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0gmpAzq1QLQJvy1sF1qsN2KHunfvdectBOUVazsFT0c=;
        b=iab+sAqid8/B1wmvRUNAATZQh3rBXTl2rrJdFXVW1thI0Slxs1Di1n6Klby0t4Khu0
         HQAFqQbmpF8y9V09DCnmyY5BDiWtz4543d4nz+p0letC4Hjvx78CmOZD2rrSzaMbq9qY
         JNWvysEyHiZe/57u/9DEMabWyNcX55k1dZBcJbvFMve3eEED1TVBIg40XEcnb9PdbqMj
         9ARb7LwCFpomHeZiW318FeitN1SNrRNPVq9FhGU8dVINUjZ0O45F6Rpb7JyNzqgpeo5s
         7xBsSwHIDK8F+1/CCwep0ZKGbovtFjgcoWVmoK2mMvVL7/xsVWmoDWnCpbwv94ijFFCz
         oONQ==
X-Gm-Message-State: AJIora+Kt51hvHmCIDZ1gIidWwY+ukLsWQMNdq4O2DDDvQcRKN4iocIZ
        9tEt4k3ADdDhxSLOFiHwjAcBC+H+WLNkHIbZ
X-Google-Smtp-Source: AGRyM1vKqOHgG7D15qb0Ht9Mq07ndizIryMdGkhk4TemwtDU1bUarWfiW03Ny0wNRnCajo2HHKzj8g==
X-Received: by 2002:a17:907:6d99:b0:72e:e7b4:e9cc with SMTP id sb25-20020a1709076d9900b0072ee7b4e9ccmr5750644ejc.315.1657894461085;
        Fri, 15 Jul 2022 07:14:21 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id by28-20020a0564021b1c00b0043acddee068sm2890412edb.83.2022.07.15.07.14.20
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 07:14:20 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id z12so6925241wrq.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Jul 2022 07:14:20 -0700 (PDT)
X-Received: by 2002:adf:ead2:0:b0:21d:8b49:6138 with SMTP id
 o18-20020adfead2000000b0021d8b496138mr13033418wrn.138.1657894460100; Fri, 15
 Jul 2022 07:14:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220715084442.115021-1-jinghung.chen3@hotmail.com> <SG2PR03MB5006FEBF794767B52DD80152CC8B9@SG2PR03MB5006.apcprd03.prod.outlook.com>
In-Reply-To: <SG2PR03MB5006FEBF794767B52DD80152CC8B9@SG2PR03MB5006.apcprd03.prod.outlook.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 15 Jul 2022 07:14:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vad82p+Oz6kxJpiB9NLan67qF1+bDfiOmSEE9NaTEs2A@mail.gmail.com>
Message-ID: <CAD=FV=Vad82p+Oz6kxJpiB9NLan67qF1+bDfiOmSEE9NaTEs2A@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: Add LTE SKUs for sc7280-villager family
To:     Jimmy Chen <jinghung.chen3@hotmail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Alan Huang <alan-huang@quanta.corp-partner.google.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Fri, Jul 15, 2022 at 1:45 AM Jimmy Chen <jinghung.chen3@hotmail.com> wrote:
>
> This adds LTE skus for villager device tree files.
>
> Signed-off-by: Jimmy Chen <jinghung.chen3@hotmail.com>
> ---
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
>  .../qcom/sc7280-herobrine-herobrine-r1-lte.dts  | 14 ++++++++++++++

Your v5 accidentally added the file
"sc7280-herobrine-herobrine-r1-lte.dts". Please remove it.
