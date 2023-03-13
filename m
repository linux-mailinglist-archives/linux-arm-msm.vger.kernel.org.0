Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 644596B7A81
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Mar 2023 15:38:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbjCMOiN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Mar 2023 10:38:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbjCMOiJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Mar 2023 10:38:09 -0400
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D2B222D8
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:38:05 -0700 (PDT)
Received: by mail-qv1-xf31.google.com with SMTP id o3so8331418qvr.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678718284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDaRIIqW7/+ly5ySR9hbSflFpXoocSQAnYPTqjUre/k=;
        b=MAcXl6at3/winOcS4KxrIvBiQSaZHfivydwNQ1x59zIf4Sw3uDOAJWl420fYIAB+ZH
         MqLh1S5Sjjpl7UW052yl6OHHTZ9WzU1N00DxaBoDcgfwpIEpdqL0DBWhTP3FDLEWBerq
         CfDkJ70A0LG3I5PCAys7GsLYjfw3npFmBA9mA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678718284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDaRIIqW7/+ly5ySR9hbSflFpXoocSQAnYPTqjUre/k=;
        b=PvydCDnYdchQUtHmq4QC6nNJ2Wvqf2kETIrTfwQGAMHOURNck//3I9/nyK5Lv+SJz9
         x+sK8iiqei+W1h8e+IRvPLg68zD8SPeKBm9jJeSYr+CgTlDl8x9mqAE6zTw4JJbXqSE1
         i0p/fIzZ3al6OX4Yha8AhMri84zUXFmMIH/I1551/k0yLXF3anQdZjit5caN823IUM1D
         eSA+ckCI1cRT1np9iaPW/IdmAp65blAMAKQAMI0CeglXESRBRhyYEmie9amHOpvXd9v+
         01EP9KD4Ku7rsYyCruloQoTc8/iDjVjRe1dBggyvLckStAUMwPHJk9VhuR6OcqVsOkVf
         FFWA==
X-Gm-Message-State: AO0yUKUgHHW4ir6ydh6AnnkbBeqv9o2pMP+BlLZ6RisJEPzliUBHYIDB
        hCwCkuHzbb13WuVWuM224rno5y3obaZh2UqHj30=
X-Google-Smtp-Source: AK7set8Ks5OwKxdalmfjcYN+ZMZPfxA1H7/ErGKNiTP0+l3bNDo1bp7qAYah/U1rvp9A4nQkBGEhNQ==
X-Received: by 2002:a05:6214:5294:b0:56e:b59d:2ee7 with SMTP id kj20-20020a056214529400b0056eb59d2ee7mr12855687qvb.47.1678718284161;
        Mon, 13 Mar 2023 07:38:04 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id y11-20020a37f60b000000b0074571b64f0fsm2933617qkj.53.2023.03.13.07.38.03
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 07:38:03 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id u5so3603122ybm.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Mar 2023 07:38:03 -0700 (PDT)
X-Received: by 2002:a25:9c46:0:b0:a5d:3d45:26c with SMTP id
 x6-20020a259c46000000b00a5d3d45026cmr21326349ybo.0.1678718283055; Mon, 13 Mar
 2023 07:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230312183622.460488-1-krzysztof.kozlowski@linaro.org> <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230312183622.460488-4-krzysztof.kozlowski@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Mon, 13 Mar 2023 07:37:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Uhpc5idOzPt5Oknzng8qaTFh4Fsibs1hXFfZRsKn+9cA@mail.gmail.com>
Message-ID: <CAD=FV=Uhpc5idOzPt5Oknzng8qaTFh4Fsibs1hXFfZRsKn+9cA@mail.gmail.com>
Subject: Re: [PATCH 4/8] arm64: dts: qcom: sc7180-trogdor-pazquel: correct
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
>   sc7180-trogdor-pazquel360-lte.dtb: trackpad@15: 'vcc-supply' does not m=
atch any of the regexes: 'pinctrl-[0-9]+'
>
> Fixes: fb69f6adaf88 ("arm64: dts: qcom: sc7180: Add pazquel dts files")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi b/arch/=
arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> index d06cc4ea3375..8823edbb4d6e 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-pazquel.dtsi
> @@ -39,7 +39,7 @@ trackpad: trackpad@15 {
>                 interrupt-parent =3D <&tlmm>;
>                 interrupts =3D <0 IRQ_TYPE_EDGE_FALLING>;
>
> -               vcc-supply =3D <&pp3300_fp_tp>;
> +               vdd-supply =3D <&pp3300_fp_tp>;

Luckily it didn't matter since this regulator is always on, but good
to have things described properly.

Reviewed-by: Douglas Anderson <dianders@chromium.org>
