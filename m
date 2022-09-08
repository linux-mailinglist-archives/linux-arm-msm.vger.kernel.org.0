Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDBF5B206F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232280AbiIHOXw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:23:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232281AbiIHOXu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:23:50 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5B401316D8
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:23:49 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s11so24614305edd.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=p3DDNNeH7lCPlmJjEkAMIprBwVt2TkoLL2ZSNR+i2uQ=;
        b=hr+/b7N8DmRxnyhKeaX2jbus5KsLh9ib5SrIzFoqDskfSog0lF0nErMjN+RvJQ5Dhs
         yKGk3leGwE21sivoesF0Y6xu/fikwpjHBMQEZIBYGYtUDkB4Sd/aNj0AmBVL//tmT7WR
         MCCrcT+0lGehCTy7ghtFoXH+FRvDxOx/lQ0Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=p3DDNNeH7lCPlmJjEkAMIprBwVt2TkoLL2ZSNR+i2uQ=;
        b=d4acpOOoqvXcSJ5gBQUZPOSH20CDhjZjTFAgQuHoAlYbrcO7RLtJ0dtUJyvK1a4j1q
         iTgqE4LBxrYSWCLbvGU2/tMHPbMmTy3v1zjDdC9uag3fkFHBqgN1Djqg8HidzBV1+gRq
         ocpUY2gjeqKmuCkCqNJbcOnCDB/lXNlMiDuQd+q9zG4srSPnz2JnaTk9poCyDpc0Pa0m
         vFGC54KQwhCtXKFroIQovDDBemIvvrU6e9oe7+chpNcCCRNrV695pK3h37Vf5L1g51+W
         dOqwuKxh8s74Ow3fW0AVL5UpdkmSiKU0Z8m10JX3vOTqAaOpDhrmCds4zbdhzG3AlXCS
         a1AQ==
X-Gm-Message-State: ACgBeo1NhjOm0crIJ0DYWLzxjM9OjR7No2bsIa0Df0Ga7sKH5BMrMGFh
        Ov8u8fQNNjUPrWJCFkASg5TEkROG2pmIma/B
X-Google-Smtp-Source: AA6agR7r3lDWlA9J/UXqOmOITuJ4+38uB6ofrmt3IrQhQ9PDvgXE9J/VxaG5Hp4uQ2MKuSI5/ZbpHw==
X-Received: by 2002:a05:6402:1a4d:b0:44e:221d:d1dd with SMTP id bf13-20020a0564021a4d00b0044e221dd1ddmr7598720edb.267.1662647028045;
        Thu, 08 Sep 2022 07:23:48 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id fe12-20020a056402390c00b00450d23d40besm715075edb.82.2022.09.08.07.23.46
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:23:46 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id o25so1775560wrf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:23:46 -0700 (PDT)
X-Received: by 2002:a5d:4d0c:0:b0:228:cd9f:5a4c with SMTP id
 z12-20020a5d4d0c000000b00228cd9f5a4cmr5509487wrt.138.1662647025759; Thu, 08
 Sep 2022 07:23:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220907204924.173030-1-ahalaney@redhat.com> <abad381a-dfe7-9337-ff35-f657bf373d44@linaro.org>
In-Reply-To: <abad381a-dfe7-9337-ff35-f657bf373d44@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Sep 2022 07:23:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VmnKtx9smitqvNgmiCs-UCnLGFgbPnKd41QWeo1t3c9g@mail.gmail.com>
Message-ID: <CAD=FV=VmnKtx9smitqvNgmiCs-UCnLGFgbPnKd41QWeo1t3c9g@mail.gmail.com>
Subject: Re: [PATCH v3] regulator: dt-bindings: qcom,rpmh: Indicate
 regulator-allow-set-load dependencies
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andrew Halaney <ahalaney@redhat.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
        Johan Hovold <johan+kernel@kernel.org>
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

On Thu, Sep 8, 2022 at 3:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 07/09/2022 22:49, Andrew Halaney wrote:
> > For RPMH regulators it doesn't make sense to indicate
> > regulator-allow-set-load without saying what modes you can switch to,
> > so be sure to indicate a dependency on regulator-allowed-modes.
> >
> > In general this is true for any regulators that are setting modes
> > instead of setting a load directly, for example RPMH regulators. A
> > counter example would be RPM based regulators, which set a load
> > change directly instead of a mode change. In the RPM case
> > regulator-allow-set-load alone is sufficient to describe the regulator
> > (the regulator can change its output current, here's the new load),
> > but in the RPMH case what valid operating modes exist must also be
> > stated to properly describe the regulator (the new load is this, what
> > is the optimum mode for this regulator with that load, let's change to
> > that mode now).
> >
> > With this in place devicetree validation can catch issues like this:
> >
> >     /mnt/extrassd/git/linux-next/arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pm8350-rpmh-regulators: ldo5: 'regulator-allowed-modes' is a dependency of 'regulator-allow-set-load'
> >             From schema: /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> >
> > Where the RPMH regulator hardware is described as being settable, but
> > there are no modes described to set it to!
> >
> > Suggested-by: Johan Hovold <johan+kernel@kernel.org>
> > Reviewed-by: Johan Hovold <johan+kernel@kernel.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> > ---
> >
> > v2: https://lore.kernel.org/linux-arm-msm/20220906201959.69920-1-ahalaney@redhat.com/
> > Changes since v2:
> >   - Updated commit message to explain how this is a property of the
> >     hardware, and why it only applies to certain regulators like RPMH
> >     (Johan + Krzysztof recommendation)
> >   - Added Johan + Douglas' R-B tags
>
> You posted before we finished discussion so let me paste it here:
>
> The bindings don't express it, but the regulator core explicitly asks
> for set_mode with set_load callbacks in drms_uA_update(), which depends
> on REGULATOR_CHANGE_DRMS (toggled with regulator-allow-set-load).
>
> drms_uA_update() later calls regulator_mode_constrain() which checks if
> mode changing is allowed (REGULATOR_CHANGE_MODE).
>
> Therefore based on current implementation and meaning of
> set-load/allowed-modes properties, I would say that this applies to all
> regulators. I don't think that RPMh is special here.

RPMh is special compared to RPM because in RPMh the hardware exposes
"modes" to the OS and in RPM the hardware doesn't. Specifically:

In RPM, the OS (Linux) has no idea what mode the regulator is running
at and what modes are valid. The OS just tells the RPM hardware "I'm
requesting a load of X uA. Thanks!" So "regulator-allow-set-mode"
basically says "yeah, let the OS talk to RPM about loads for this
regulator.

In RPMh, the OS knows all about the modes. For each regulator it's the
OS's job to know how much load the regulator can handle before it
needs to change modes. So the OS adds up all the load requests from
all the users of the regulator and then translates that to a mode. The
OS knows all about the modes possible for the regulator and limiting
them to a subset is a concept that is sensible.

This is why, for instance, there can be an "initial mode" specified
for RPMh but not for RPM. The OS doesn't ever know what mode a RPM
regulator is in but it does for RPMh.

-Doug
