Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B30C5B2312
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 18:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231800AbiIHQFH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 12:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231655AbiIHQFF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 12:05:05 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BCAC1FCFE
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 09:05:04 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id e17so17506666edc.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 09:05:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=jz2D7E0X51AWJoi4tRV8BKb/2xDyrAfW/RbFvoS4Z8U=;
        b=KIq1Id+MXyPYu9JBhV3bG7ZTwelv4qKxj6Jou27A0dZJifV+5yI3PofxjTUFCXTu8+
         hxdEMqt47fyhhmXEYp5HeSrWXhM2A90/FQNezs3+TPrJgmFRZXQSgNzwl775trbxHoZN
         +kfYeRnJ/++eTov2K4+Pfn4OKlb6/Yu7W/IpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=jz2D7E0X51AWJoi4tRV8BKb/2xDyrAfW/RbFvoS4Z8U=;
        b=QQQJ48Zsror43+V+jcZ7oc8ovpW2zQhvkyucyw8314/MNTuYycrHY78rpZ8zHfyjWD
         HY+gqmCOzywxAy1ls6TabXhp0EvfVSrGvgHeH1K964tqioXena6Ia1baZxAiMLgV6xyj
         4C/QtpFlv8M8Cv4ZuEoatd4lleoMCaGdyNwhsAOf6Fw8R8KklcWPtCm8Oh0RXDdfmP4b
         MmdH6fTKT99eXTyQHdyLqW/GqUP7EsDnsbSJtnAFpiedF4G5AkavYgsy1uzbbOZBnBDp
         LlTL340NjBtaJjiDY0KF45bWYIsayZJuWqrgpykJdQBs59QhZMGEHa3BykVczj512PjE
         M0FA==
X-Gm-Message-State: ACgBeo1McKHhbiMRnNCLCikFzs2h00Fx8EV2cibsYqQL4G8bxxm3qPfC
        2Pi3i3n6x39A2KCEOWskN77p3H0KqYhDFk7B1vQ=
X-Google-Smtp-Source: AA6agR6IyxnOA4xEKxuiX2hl4BZp9tGvpzX0ht90wKzCxolZXlOC/mBIutKyS7cS1aVJgaH6UDiLEw==
X-Received: by 2002:a05:6402:1f86:b0:447:8edd:1c4b with SMTP id c6-20020a0564021f8600b004478edd1c4bmr7605839edc.163.1662653102587;
        Thu, 08 Sep 2022 09:05:02 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id d14-20020a05640208ce00b004482dd03fe8sm6285169edz.91.2022.09.08.09.05.01
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 09:05:01 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id t7so21890378wrm.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 09:05:01 -0700 (PDT)
X-Received: by 2002:adf:f90d:0:b0:20c:de32:4d35 with SMTP id
 b13-20020adff90d000000b0020cde324d35mr5527227wrr.583.1662653101282; Thu, 08
 Sep 2022 09:05:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220829164952.2672848-1-dianders@chromium.org>
In-Reply-To: <20220829164952.2672848-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Sep 2022 09:04:48 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ux0SbwfQENOGVdtDHvFrnhaWUK3k3Hq-zNUGYum-zYfg@mail.gmail.com>
Message-ID: <CAD=FV=Ux0SbwfQENOGVdtDHvFrnhaWUK3k3Hq-zNUGYum-zYfg@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: Fix broken regulator spec on
 RPMH boards
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Johan Hovold <johan@kernel.org>,
        Andrew Halaney <ahalaney@redhat.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Gross <agross@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
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

On Mon, Aug 29, 2022 at 9:50 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> Prior to commit efb0cb50c427 ("regulator: qcom-rpmh: Implement
> get_optimum_mode(), not set_load()") several boards were able to
> change their regulator mode even though they had nothing listed in
> "regulator-allowed-modes". After that commit (and fixes [1]) we'll be
> stuck at the initial mode. Discussion of this (again, see [1]) has
> resulted in the decision that the old dts files were wrong and should
> be fixed to fully restore old functionality.
>
> This series attempts to fix everyone. I've kept each board in a
> separate patch to make stable / backports work easier.
>
> Affected boards were found with:
>   rpmh_users=$(git grep -l -i rpmh -- arch/arm*/boot/dts/qcom)
>   set_modes=$(grep -l regulator-allow-set-load ${rpmh_users})
>   but_no_allowed_modes=$(grep -l -v regulator-allowed-modes ${set_modes})
>
> Fix was applied with:
>   for f in ${but_no_allowed_modes}; do
>     sed -i~ -e \
>       's/^\(\s*\)regulator-allow-set-load;/\1regulator-allow-set-load;\n\1regulator-allowed-modes =\n\1    <RPMH_REGULATOR_MODE_LPM\n\1     RPMH_REGULATOR_MODE_HPM>;/'\
>       $f
>   done
>
> Then results were manually inspected. In one board I removed a
> "regulator-allow-set-load" from a fixed regulator since that was
> clearly wrong.
>
> v2 of this series adds tags and also rebases atop Johan's series [2]
> as requested [3]. This ends up turning the series into a 6-part series
> instead of a 7-part one.
>
> It should also be noted that as of the v2 posting that the related
> regulator fixes have all landed in the regulator tree.
>
> [1] https://lore.kernel.org/r/20220824142229.RFT.v2.2.I6f77860e5cd98bf5c67208fa9edda4a08847c304@changeid
> [2] https://lore.kernel.org/r/20220803121942.30236-1-johan+linaro@kernel.org/
> [3] https://lore.kernel.org/r/YwhwIX+Ib8epUYWS@hovoldconsulting.com/
>
> Changes in v2:
> - Added note about removing regulator-allow-set-load from vreg_s4a_1p8
> - Rebased atop ("...: sa8295p-adp: disallow regulator mode switches")
> - Rebased atop ("...: sc8280xp-crd: disallow regulator mode switches")
>
> Douglas Anderson (6):
>   arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
>   arm64: dts: qcom: sa8295p-adp: Specify which LDO modes are allowed
>   arm64: dts: qcom: sc8280xp-crd: Specify which LDO modes are allowed
>   arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are
>     allowed
>   arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are
>     allowed
>   arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed
>
>  arch/arm64/boot/dts/qcom/sa8155p-adp.dts            | 13 ++++++++++++-
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts            | 12 ++++++++++++
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts           |  6 ++++++
>  .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi    |  6 ++++++
>  .../arm64/boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |  6 ++++++
>  arch/arm64/boot/dts/qcom/sm8350-hdk.dts             | 12 ++++++++++++
>  6 files changed, 54 insertions(+), 1 deletion(-)

I think this series is ready to land if it's a good time now. It looks
like you've already applied the series that this depends on [1] and
this one is all reviewed and ready to go. Thanks!

[1] https://lore.kernel.org/all/166181675980.322065.3918715363441736917.b4-ty@kernel.org/
