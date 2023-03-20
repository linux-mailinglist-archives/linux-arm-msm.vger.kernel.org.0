Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E55AF6C0FD3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 11:56:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjCTK4J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 06:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231144AbjCTKzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 06:55:49 -0400
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A449AFF3E
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:52:33 -0700 (PDT)
Received: by mail-ua1-x92d.google.com with SMTP id v48so7553257uad.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679309551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3kQ30MMOqKEVRcuM/pZX4TRkQN+jm/6QzPMw7HYwZgM=;
        b=t6KXk7zqKjHae5UrvjQeIhdiZt+cKtlk3cuE1yABtZHEyXWLGveV6S54wrpQPvuutP
         NstmMyXy2WAybo1l1jBR2m/nVqoJ3ZoFgdwDyBcV1lFxuPhjfZFahbXROga6CwHCfchG
         hr59LB50y8EG9EwnW9l6WxiNgQtUoEsQct5IcHdheTSWguiYs8npNiatV495xs31moQ5
         agSDqAAmTLGZWFW4Xg+VMVqMmlHSnFy89n7GO4e/+hDHT4FNEwHCj+HOOvZuwbQMhVkT
         suh6169c5yMVD8n1AsjKJEDocKbeR+9fkSgCHgPFZgEIXrpaMzyVB4J8mFzEd3TQlL6N
         XTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3kQ30MMOqKEVRcuM/pZX4TRkQN+jm/6QzPMw7HYwZgM=;
        b=4+e+/be9Y4v7s4WUY2KYCwBacRsD1cF4Qi9GvunIbcoCegUXg1VULRCF4Iri0viq5n
         cG5KGwnMipLMAYOBENLSueKLm9b5TzgW6ClAIjx4N5odfUMxey+dk/ZD6Mdh72euktqW
         5nCJ40c+9Efeeemd0LmdxXj5X0DyqXbVNli59xzeEXPCyMcwWc7N+J7rWEKHS2O8wJzM
         q0NdkzM9o0fmEBKJjdYvHbw/SEyawPTWo34RZs7vINZ0doO+l8kyxcMfMhI50Ko0rsEG
         gIHNxCRqjLlhbKXqiGNzozpjQBpnPkzr9MQX5JFM2X2p8IScpYQZjipf7j8vN4Ygxg0L
         TW0w==
X-Gm-Message-State: AO0yUKUiOx8iwqxmVGawGA8M57l5Yr7a4/12PJq0F+Y7jvkM7o9vrbMx
        Hr5wnDanPN3M2pisQaZ0F5gLsBT8+gy15/l8CM0ukPxOM6DrMZ8m
X-Google-Smtp-Source: AK7set8zZ6QyiEjKuf45k+Ut8ou+T6OK8qSSzSJQI/cEriVcGLV00WKZyOHHRkoYs2N3T70MrVH7Mi7iTAjiNJisGfU=
X-Received: by 2002:a1f:9fc6:0:b0:436:5000:ed97 with SMTP id
 i189-20020a1f9fc6000000b004365000ed97mr1972345vke.2.1679309551507; Mon, 20
 Mar 2023 03:52:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183043.619997-1-brgl@bgdev.pl> <20230314183043.619997-9-brgl@bgdev.pl>
 <8ed14d64-f75b-b129-ad7b-0d3290de7738@linaro.org>
In-Reply-To: <8ed14d64-f75b-b129-ad7b-0d3290de7738@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Mar 2023 11:52:20 +0100
Message-ID: <CAMRc=McGbZVWnp6Vcp2PzNjRpkfF9RJDWU89nvC+uso+mPK2PA@mail.gmail.com>
Subject: Re: [PATCH 08/14] arm64: dts: qcom: sa8775p: pmic: add the power key
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 9:26=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add the power key node under the PON node for PMIC #0 on sa8775p.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/b=
oot/dts/qcom/sa8775p-pmics.dtsi
> > index 5d73212fbd16..874460d087db 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> > @@ -18,6 +18,13 @@ pmk8775_0_pon: pon@1200 {
> >                       reg =3D <0x1200>, <0x800>;
> >                       mode-recovery =3D <0x1>;
> >                       mode-bootloader =3D <0x2>;
> > +
> > +                     pmk8775_0_pon_pwrkey: pwrkey {
> > +                             compatible =3D "qcom,pmk8350-pwrkey";
> > +                             interrupts-extended =3D <&spmi_bus 0x0 0x=
12 0x7 IRQ_TYPE_EDGE_BOTH>;
> > +                             linux,code =3D <KEY_POWER>;
> > +                             status =3D "disabled";
> Does it make any sense to disable the power button?
>

Since this is an automotive platform, I'd say yes - you wouldn't
normally have physical access to the board or even be sure for it to
have a power button? But if you prefer it the other way, I won't be
dying on this hill.

Bart

> Konrad
> > +                     };
> >               };
> >       };
> >
