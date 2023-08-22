Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA73D7843B0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Aug 2023 16:15:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233300AbjHVOPE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Aug 2023 10:15:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231889AbjHVOPD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Aug 2023 10:15:03 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FA34E48
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:14:32 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-525597d891fso5784179a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692713616; x=1693318416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDiDA3/MCiTEc+dFpOxXYu/UjYQeuxp9Hyxd2wQVSdw=;
        b=lwT4XHDUem+DiC8DEglopLE5kK7TttS37jP/4qxDyNp22KAAnNOVQTWpbe51xDPHuZ
         VyvX+FqZZwDwkgPjos9y35zWvo2InY10X3JXfJvVbQ4pPeVdCgI4Q6GpljUGCuWx4K/Y
         1ccYNT+47IETKUoD44rDyMogIKnrLHQrLNw60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692713616; x=1693318416;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDiDA3/MCiTEc+dFpOxXYu/UjYQeuxp9Hyxd2wQVSdw=;
        b=H0VUSTQ6kR0DIx9qP5hcONmlI1IkqRijmD04lJU/Er2yXsjwC+AcF60B4CSC40ktDX
         JtSqcVCIctBkiw/P3sBgVoOMPPEjf9lmEZjVXCQwkyKIriEjDCYnqSuX92UZsCu3s0+h
         V8ejjpQkcfLuBAT9e1b4CvnKTBV1Qag82MR+a2vbUtqjAGBtx6ggS02XB2wd8KESnAHP
         w9+8uMzWaGuoPaJghdIzNMVaTmJJ2fZdwAPL7oFpmKgY7n5wXyE9Jr6UyKi0P5XrPnNn
         W6uOmrzvTLVMLpARX3pYiNms8XgUIUY7TEY1yr0MkzDc9T+Uv5TR5PqX3AiMfqqaHkyK
         ld0w==
X-Gm-Message-State: AOJu0Yyxh3c36c2+M4WntiTdxt8TK/d5IRSdszwJmtmEBbE7Cx1nC9kt
        2xVOTM5dwLWDMfNqt9V1st8USaHkk9mmntD68iR7CWRH
X-Google-Smtp-Source: AGHT+IGu3zLijwUjv/hyKtVgopC4Zu2mnutnUJp0zPVjvnHEfnOKm8XgLjy2gjVaVBCagMsdwKL6Cw==
X-Received: by 2002:a05:6402:5154:b0:51d:95f2:ee76 with SMTP id n20-20020a056402515400b0051d95f2ee76mr7140298edd.27.1692713616303;
        Tue, 22 Aug 2023 07:13:36 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id b15-20020aa7c6cf000000b005256aaa6e7asm7623715eds.78.2023.08.22.07.13.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 07:13:35 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3fe2d620d17so93085e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Aug 2023 07:13:35 -0700 (PDT)
X-Received: by 2002:a05:600c:3b0d:b0:3fe:f4b0:609e with SMTP id
 m13-20020a05600c3b0d00b003fef4b0609emr112240wms.2.1692713615406; Tue, 22 Aug
 2023 07:13:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230822100359.124282-1-sheng-liang.pan@quanta.corp-partner.google.com>
 <20230822180054.v5.2.I8f20fdfe34a2e8a38373bbd65587754b324f3dcb@changeid>
In-Reply-To: <20230822180054.v5.2.I8f20fdfe34a2e8a38373bbd65587754b324f3dcb@changeid>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 22 Aug 2023 07:13:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U5XZn_BXuYrkZbr2JqiPptKt=JsyhYjciBzjKhmTdPDw@mail.gmail.com>
Message-ID: <CAD=FV=U5XZn_BXuYrkZbr2JqiPptKt=JsyhYjciBzjKhmTdPDw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sc7180: Add sku_id and board id
 for lazor/limozeen
To:     Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Tue, Aug 22, 2023 at 3:04=E2=80=AFAM Sheng-Liang Pan
<sheng-liang.pan@quanta.corp-partner.google.com> wrote:
>
> SKU ID 10: Lazor LTE+Wifi, no-esim (Strapped 0 X 0)
> SKU ID 15: Limozeen LTE+Wifi, TS, no esim (Strapped 1 X 0)
> SKU ID 18: Limozeen LTE+Wifi, no TS, no esim (Strapped X 0 0)
>
> Even though the "no esim" boards are strapped differently than
> ones that have an esim, the esim isn't represented in the
> device tree so the same device tree can be used for LTE w/ esim
> and LTE w/out esim.
>
> add BRD_ID(0, Z, 0) =3D 10 for new board with ALC5682i-VS
>
> Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.googl=
e.com>
> ---

You should add a note here ("after the cut", in other words after the
"---" above but before your changelog) explaining that your patch
absolutely requires my patch [1] in order to compile. Please provide a
link to my patch (AKA include link [1]), too. I _think_ that maybe
you're using "patman" to format your patch? If so then this would be
done using "Commit-notes:". Maintainers have a lot of patches to apply
and we need to make it really easy for them to figure out what order
they need to apply patches in and which patches depend on others.

[1] https://lore.kernel.org/r/20230816112143.1.I7227efd47e0dc42b6ff243bd22a=
a1a3e01923220@changeid/


> Changes in v5:
> - include rt5682s node for new board version 10

This isn't quite what you did in v5. I would say:
- rebased on patch moving rt5682s to a fragment



> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts b/ar=
ch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> index 1c4f0773a242..cabe99c23a7c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dts
> @@ -14,8 +14,8 @@
>  #include "sc7180-lite.dtsi"
>
>  / {
> -       model =3D "Google Lazor (rev9+) with KB Backlight";
> -       compatible =3D "google,lazor-sku2", "qcom,sc7180";
> +       model =3D "Google Lazor (rev9) with KB Backlight";
> +       compatible =3D "google,lazor-rev9-sku2", "qcom,sc7180";;

nit: the above line has two ";". Remove one.

IMO this is something you should spin a quick v6 for. Once that's fixed:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
