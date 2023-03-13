Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6D0D6B7A7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 15:38:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231355AbjCMOiJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 10:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231220AbjCMOiF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 10:38:05 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 638AD2117
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:59 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id r16so13291120qtx.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678718276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAqJ0VRun7GLH0P7PDatGQQt5VcBWd3DCbBuaXJxSSc=;
        b=O33xqR8cnFnw9Ua8eE13pUFaX5FOsy/vDGMQDg5Q7KyLi46tmIRXE6lqIVYPLfCfZ/
         +CU5NZf5CmAZD5gtZK+Pz2X3KSY8ewUTzuj/5HeAjutIDIHIBoCV8Xk0V8Wd23XN7Z3C
         g7hQGo5j6D1sLyMGllXEujdi1jZOU2LXy4fBs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718276;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAqJ0VRun7GLH0P7PDatGQQt5VcBWd3DCbBuaXJxSSc=;
        b=SWU05g1n02Jihjq2MgD+azLLxkQT+7M4M1ddC4+GHnyt8fg3ptv9VDXksKhMCZ9eN5
         6bUs0DSFrnDkCXcY7FmMVOVmNgmT1fsfXvPyqhZnRQ4qSaHqkhOl1LGVDwaRCr61XxMM
         BYvXaL0xqPJ1zMIkWmHJXCKghahq/6+v7sqZdYcfijZb68EL14XXRDHidlmGzMxvFJsB
         M9vKX2AAvvo98S5X53navVlmSoaUqFpj8BBUK0aYf2tEaFoifFcVr56xaPLGHmYj34Pu
         ATeLI9bREGMqhifHs8p1GQGRmuqzWaEg5HIF1mwAWxGmhLeSdzkkQnD4PUEVdi+GxUfw
         DI/Q==
X-Gm-Message-State: AO0yUKVlM0RkWTy66/uFDVik9cdluVObxGPsin8eSIQ6Tmk+3zugfrQd
        DKjp6+b2Ncwa1y4Rvf2IhBQ6OAuF2+hcxMJeLaI=
X-Google-Smtp-Source: AK7set/uYR9NQRQG/dnibhlpRhAeyAEE0kngok7jxNxaFihTjupK0idGHTtpdYqirgBVyuQ3KEOHUg==
X-Received: by 2002:ac8:5e4a:0:b0:3b8:2ea9:a09c with SMTP id i10-20020ac85e4a000000b003b82ea9a09cmr26228930qtx.1.1678718276770;
        Mon, 13 Mar 2023 07:37:56 -0700 (PDT)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id g21-20020ac842d5000000b003995f6513b9sm5565284qtm.95.2023.03.13.07.37.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:37:56 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-5418c2b8ef2so78411547b3.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:37:55 -0700 (PDT)
X-Received: by 2002:a81:a782:0:b0:541:6763:3ce1 with SMTP id
 e124-20020a81a782000000b0054167633ce1mr5003671ywh.2.1678718275345; Mon, 13
 Mar 2023 07:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312183622.460488-3-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Mar 2023 07:37:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4uSUDnpOGuX-bYmPOn+-AknqM1SD-p6d2AX7ZPTyVSA@mail.gmail.com>
Message-ID: <CAD=FV=V4uSUDnpOGuX-bYmPOn+-AknqM1SD-p6d2AX7ZPTyVSA@mail.gmail.com>
Subject: Re: [PATCH 3/8] arm64: dts: qcom: sc7180-trogdor-lazor: correct
 trackpad supply
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        "Joseph S. Barrera III" <joebar@chromium.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Vinod Koul <vkoul@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Sun, Mar 12, 2023 at 11:36=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The hid-over-i2c takes VDD, not VCC supply.  Fix copy-pasta from other
> boards which use elan,ekth3000 with valid VCC:
>
>   sc7180-trogdor-lazor-limozeen-nots-r4.dtb: trackpad@2c: 'vcc-supply' do=
es not match any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: 2c26adb8dbab ("arm64: dts: qcom: Add sc7180-lazor-limozeen skus")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-=
r4.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> index 850776c5323d..70d5a7aa8873 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dts
> @@ -26,7 +26,7 @@ trackpad: trackpad@2c {
>                 interrupt-parent =3D <&tlmm>;
>                 interrupts =3D <58 IRQ_TYPE_EDGE_FALLING>;
>
> -               vcc-supply =3D <&pp3300_fp_tp>;
> +               vdd-supply =3D <&pp3300_fp_tp>;

Luckily it didn't matter since this regulator is always on, but good
to have things described properly.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
