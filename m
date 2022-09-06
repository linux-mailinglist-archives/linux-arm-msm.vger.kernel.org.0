Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB7E95AF39D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Sep 2022 20:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbiIFSeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Sep 2022 14:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229874AbiIFSeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Sep 2022 14:34:13 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C106A9A97A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Sep 2022 11:34:11 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id u6so16237288eda.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 11:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=YxnHTWcYZvzF+VRDJKigMnC8f9W9KZNVnVDsV1AMwoc=;
        b=i6UFTEKSIUMhWtO1MB9MaGSXXbI4dolkonGKMDDYoABfTxvn4aAvu7nmcyUyY1b3BZ
         bBTLJrnIQNFJggguSrDPV7Wd11brAm9lT19cfqsF5+BXnE6HqCzs991vyvYX29VZh/xg
         Zzd6OPaWiDw2GdXL8byNUqR5AQXvDJZJVu/qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=YxnHTWcYZvzF+VRDJKigMnC8f9W9KZNVnVDsV1AMwoc=;
        b=Lk5z+9j7SNcEAqJ7guJZ8Dtu8RVjrfEuChn70B8BPFc1A0pA71vLo45xfMSquzp3Hi
         VRYBYkBVwnADLkGrA08Jb3etdca6oormTxzkFuU9Q+nG1Po1P2udYcYrBYr/IzbbjjQb
         6vjFowPfNePQ1RM7M4zRxuJeKrMloRDNC02Vhz7toytW8bq8w/3NV4P/jk8zav8KsBBd
         MG8/tda1+ifHdUPn8YDRYfUKBOK9HDVLLLsiI+6DuWSmx7uEuM9wWxfkqtb/HNh9fAoq
         ayJ0ReBNnMO16NlicvogPa0qCX8fB0B5QX94WWoE9BnDxxxyQriJ7WRlMXd+qmeFOC9c
         ++YA==
X-Gm-Message-State: ACgBeo0Z8IFpwawGeZZJL0N+CgudwUYhdB+Q4J+slMljNbNRs03vz6df
        UXRcPFVUvVjSeXXphrBRyugBNWzGdIg+hth7
X-Google-Smtp-Source: AA6agR4S4cAKo5aX2xxOsQ5LFQNyVIozdAtJzHY8+Woxj5cOSQiy/kCohbn1aeMz7Eqh9LfarxVX8w==
X-Received: by 2002:a05:6402:35d5:b0:43d:a02f:cbfb with SMTP id z21-20020a05640235d500b0043da02fcbfbmr46603422edc.275.1662489249974;
        Tue, 06 Sep 2022 11:34:09 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id h1-20020a1709062dc100b00740f1a58e0bsm7208689eji.30.2022.09.06.11.34.08
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 11:34:08 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id j26so7361524wms.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Sep 2022 11:34:08 -0700 (PDT)
X-Received: by 2002:a05:600c:4e8b:b0:3a5:f5bf:9c5a with SMTP id
 f11-20020a05600c4e8b00b003a5f5bf9c5amr14894307wmq.85.1662489247864; Tue, 06
 Sep 2022 11:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220901102946.v2.1.I347ea409ee3134bd32a29e33fecd1a6ef32085a0@changeid>
In-Reply-To: <20220901102946.v2.1.I347ea409ee3134bd32a29e33fecd1a6ef32085a0@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 6 Sep 2022 11:33:56 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBzVTaz1dtMswNMWhBzBBUQZTxqXff_DgiuP6WJgG8Qg@mail.gmail.com>
Message-ID: <CAD=FV=WBzVTaz1dtMswNMWhBzBBUQZTxqXff_DgiuP6WJgG8Qg@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Configure USB as wakeup source
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
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

On Thu, Sep 1, 2022 at 10:29 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> The dwc3 USB controller of the sc7180 supports USB remote
> wakeup, configure it as a wakeup source.
>
> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
> ---
>
> Changes in v2:
> - use qcom/arm64-for-6.1 as base, v1 was unintendedly based on a
>   downstream branch that was used for testing
>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index e8debb0da411..af5bab27eaf3 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2782,6 +2782,8 @@ usb_1: usb@a6f8800 {
>                                         <&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3 0>;
>                         interconnect-names = "usb-ddr", "apps-usb";
>
> +                       wakeup-source;
> +

The patch documenting this property has landed in commit 416b61893860
("dt-bindings: usb: qcom,dwc3: add wakeup-source property"). I guess
the only question is whether this should be in the general sc7180
device tree file or just for trogdor. Any chance it could cause
problems for devices that aren't designed like trogdor?
