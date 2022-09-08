Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A34785B20CE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 16:39:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232685AbiIHOjK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 10:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231653AbiIHOjA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 10:39:00 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6A1B113646
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 07:38:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id gb36so38491967ejc.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=XU8POBDfC19t7PMlJkcaZvi4Zmu4HuIqwyULXuHenmU=;
        b=WXqQ8Jqzd/RH0CFVozN0N0R+rUyUdCjXXddzFKPn37VXeP0+RdRbIf0pkZ2eOq76eC
         DiqpoFGzgJJk+pxD66Ih5ypsK/5e5D0RFILcpE2YBfEUki1kjBy3sAHL+aGYxdoo7q8N
         aT7x+dVEY7w07iYUxiIgfe4wA2QEgS+7/8ric=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=XU8POBDfC19t7PMlJkcaZvi4Zmu4HuIqwyULXuHenmU=;
        b=f3BOcMgpc1ZJuVZ/2TYsJ0tyv49KhS/5ZLvkUL+YoZ1XmK26Y1Hf71pVfv7wUKhREt
         wZE73HjHACq3l2CoWOZkCxyuZFIVyJU6qtc7eNKi/3VHaT4sDGc5shVA0BPzwIOQTyft
         eS6w/0XMLuruCoJ5O9EOIQxXLCAtCUU9RX2qbgbnAdJ6YuX6Xu6W9o2zgXHuVU+nnIy5
         Gzerg4sa2HyQkOiym1O9ecZC1/tjElBEK2xWmexsNF45kMA2epcs2O2pIH7n0Gk/4Y2q
         Mt+71LwBUQLisa3Y1CJNtJ/sdJx4qja9jBBW37BSD0sAQK/T1Ib3FYJAhkE8JkEJm37D
         S9Ww==
X-Gm-Message-State: ACgBeo3+Fs4+bkbhcXuNG91GM6ShV1n/nMc0z8dkqhjZJfZXASVEKAOP
        MhAG1ZJC9EeuK4Z1KZJO16nSvIOxpyeUVugHGlQ=
X-Google-Smtp-Source: AA6agR5/UK+KuSPuSMoE525Ux7qY4mbT5h+0LqHckW1dU6l5EMRMV5bc8ZGSzslPTIPgAbkKZKFEfw==
X-Received: by 2002:a17:907:7210:b0:778:8c85:19f0 with SMTP id dr16-20020a170907721000b007788c8519f0mr996002ejc.59.1662647926485;
        Thu, 08 Sep 2022 07:38:46 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id ds7-20020a0564021cc700b00445c0ab272fsm12363951edb.29.2022.09.08.07.38.44
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 07:38:44 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id o25so1856418wrf.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 07:38:44 -0700 (PDT)
X-Received: by 2002:a5d:6c62:0:b0:22a:2f59:cb7d with SMTP id
 r2-20020a5d6c62000000b0022a2f59cb7dmr1892255wrz.405.1662647924384; Thu, 08
 Sep 2022 07:38:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220907204924.173030-1-ahalaney@redhat.com> <abad381a-dfe7-9337-ff35-f657bf373d44@linaro.org>
 <CAD=FV=VmnKtx9smitqvNgmiCs-UCnLGFgbPnKd41QWeo1t3c9g@mail.gmail.com> <168cde58-d061-97e7-54a5-5d3cccf3ce22@linaro.org>
In-Reply-To: <168cde58-d061-97e7-54a5-5d3cccf3ce22@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Thu, 8 Sep 2022 07:38:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VMKGOLR5uupTk9Z2vyDfCksYjJLHF6DDM36rgh+=0xLA@mail.gmail.com>
Message-ID: <CAD=FV=VMKGOLR5uupTk9Z2vyDfCksYjJLHF6DDM36rgh+=0xLA@mail.gmail.com>
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

On Thu, Sep 8, 2022 at 7:29 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 08/09/2022 16:23, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Sep 8, 2022 at 3:25 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 07/09/2022 22:49, Andrew Halaney wrote:
> >>> For RPMH regulators it doesn't make sense to indicate
> >>> regulator-allow-set-load without saying what modes you can switch to,
> >>> so be sure to indicate a dependency on regulator-allowed-modes.
> >>>
> >>> In general this is true for any regulators that are setting modes
> >>> instead of setting a load directly, for example RPMH regulators. A
> >>> counter example would be RPM based regulators, which set a load
> >>> change directly instead of a mode change. In the RPM case
> >>> regulator-allow-set-load alone is sufficient to describe the regulator
> >>> (the regulator can change its output current, here's the new load),
> >>> but in the RPMH case what valid operating modes exist must also be
> >>> stated to properly describe the regulator (the new load is this, what
> >>> is the optimum mode for this regulator with that load, let's change to
> >>> that mode now).
> >>>
> >>> With this in place devicetree validation can catch issues like this:
> >>>
> >>>     /mnt/extrassd/git/linux-next/arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: pm8350-rpmh-regulators: ldo5: 'regulator-allowed-modes' is a dependency of 'regulator-allow-set-load'
> >>>             From schema: /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> >>>
> >>> Where the RPMH regulator hardware is described as being settable, but
> >>> there are no modes described to set it to!
> >>>
> >>> Suggested-by: Johan Hovold <johan+kernel@kernel.org>
> >>> Reviewed-by: Johan Hovold <johan+kernel@kernel.org>
> >>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> >>> ---
> >>>
> >>> v2: https://lore.kernel.org/linux-arm-msm/20220906201959.69920-1-ahalaney@redhat.com/
> >>> Changes since v2:
> >>>   - Updated commit message to explain how this is a property of the
> >>>     hardware, and why it only applies to certain regulators like RPMH
> >>>     (Johan + Krzysztof recommendation)
> >>>   - Added Johan + Douglas' R-B tags
> >>
> >> You posted before we finished discussion so let me paste it here:
> >>
> >> The bindings don't express it, but the regulator core explicitly asks
> >> for set_mode with set_load callbacks in drms_uA_update(), which depends
> >> on REGULATOR_CHANGE_DRMS (toggled with regulator-allow-set-load).
> >>
> >> drms_uA_update() later calls regulator_mode_constrain() which checks if
> >> mode changing is allowed (REGULATOR_CHANGE_MODE).
> >>
> >> Therefore based on current implementation and meaning of
> >> set-load/allowed-modes properties, I would say that this applies to all
> >> regulators. I don't think that RPMh is special here.
> >
> > RPMh is special compared to RPM because in RPMh the hardware exposes
> > "modes" to the OS and in RPM the hardware doesn't. Specifically:
> >
> > In RPM, the OS (Linux) has no idea what mode the regulator is running
> > at and what modes are valid. The OS just tells the RPM hardware "I'm
> > requesting a load of X uA. Thanks!" So "regulator-allow-set-mode"
> > basically says "yeah, let the OS talk to RPM about loads for this
> > regulator.
>
> So how does set load works for this case? You mentioned
> "allow-set-mode", but we talk about "allow-set-load".

Ah, sorry. I meant "allow-set-load".

> > In RPMh, the OS knows all about the modes. For each regulator it's the
> > OS's job to know how much load the regulator can handle before it
> > needs to change modes. So the OS adds up all the load requests from
> > all the users of the regulator and then translates that to a mode. The
> > OS knows all about the modes possible for the regulator and limiting
> > them to a subset is a concept that is sensible.
> >
> > This is why, for instance, there can be an "initial mode" specified
> > for RPMh but not for RPM. The OS doesn't ever know what mode a RPM
> > regulator is in but it does for RPMh.
>
> Sorry, I don't find it related. Whether RPM has modes or not, does not
> matter to this discussion unless it sets as well allow-set-load without
> the mode... and then how does it work? In current implementation it
> shouldn't...

From looking at the source code of Linux:

* allow-set-load basically says whether the core regulator framework
even pays attention when drivers specify how much load they're using.

* On RPM then if allow-set-load is set then we'll sum up all of the
load requests from clients and pass it to hardware.

* On RPMH, if allow-set-load is set then we'll sum up all the load
requests, translate that to a mode, validate it against the set of
"allowable" modes, and if it's valid then pass it to hardware.

-Doug
