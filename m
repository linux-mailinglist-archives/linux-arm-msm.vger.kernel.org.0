Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 694A56C0FCE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Mar 2023 11:55:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229490AbjCTKzR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Mar 2023 06:55:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229879AbjCTKyd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Mar 2023 06:54:33 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC28F2A16D
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:51:07 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id 89so7574598uao.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Mar 2023 03:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1679309452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfwFotINQSIfFaUpgA9OD3Ne3pTWb/2VQyCJ1JZHtqs=;
        b=XEULcCOxYqraOi2eEfR+6/svmdzCcj92OuuC7ypUa16Ijifmo+UBhWK2edH8e28ud+
         8ZA56gQbO3sJd+N8iQ6+Ot3GYTqS+VUepvVJR1pM8TG7tiF9o7Nd8G0qjxZrGv720g0O
         m1i0puEQkHS07wQJ0oMp8J7agZpGfr9krDGp3EifwZun1kod7K7Ef+NxQWLgHGl9OSWZ
         /vTV/uNT94QAGep3KsY8vd0Rdu2etphArCzQB7Yx+pjQsug3eQxgIhCT4IrYMa+Q9T8l
         rC14yG94Entf79ogPhrGWdHTbtULmg7d4/Bch3+En4WxFE6YqrD43/iBS5Lipvg31Eoz
         MRBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679309452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LfwFotINQSIfFaUpgA9OD3Ne3pTWb/2VQyCJ1JZHtqs=;
        b=T2n4QVCB7mhU7NU/E3bcb4hcutg5Rw4QCcY8ZYPviYzVWvEK681cFe0rblGb8BFyAj
         c91Gv8Fg5UcIA8kiZlshfP5uiZljhZKyL98t4Ai/OYYJjJCt6qmnPwOUaKae7R8WA7OS
         4BR/jZR7MG8kPw1e4a9lZH6AlsBlyaOSfMIDlVN2yVqOUPqlqU6clGfhw134rWpUW0EP
         Dob76ipi38frwD3XBWj3zNVWsezzBKg7aNX/iW7SFTESGMbFs3qTR6besi3GwxpZZZrx
         NPm7FqoPiS+rCYSnWTQLKjtmqkV6tRaV8AHzgvhIpwpDc6Q6CdrobOkmkVtOumyxc4RH
         7D9w==
X-Gm-Message-State: AO0yUKXMorqrKCHcgWoOBUPWPRTVjTx3YCfpMq0ZCirbvhqvuYxObwkt
        3uKeEnjVEZXjXF5uccR2XxX7BWC/+bRaCvdFZ62BXA==
X-Google-Smtp-Source: AK7set8jhNQq8a1k9t+S/+T25oZ/VFHdmTA9JtBDsmSHS44XN53a9ePS44ZBc8ZMyL5+m4o8wYUmHub2Y+6qxXszbDI=
X-Received: by 2002:a05:6130:325:b0:688:d612:2024 with SMTP id
 ay37-20020a056130032500b00688d6122024mr4393505uab.2.1679309451921; Mon, 20
 Mar 2023 03:50:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230314183043.619997-1-brgl@bgdev.pl> <20230314183043.619997-8-brgl@bgdev.pl>
 <0fc9ba28-cb78-67fb-4cef-f786c345bc19@linaro.org>
In-Reply-To: <0fc9ba28-cb78-67fb-4cef-f786c345bc19@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 20 Mar 2023 11:50:41 +0100
Message-ID: <CAMRc=McQK+DNZF--wphWp0-vtb_mny5SVMvhUXABubJwCL=vqQ@mail.gmail.com>
Subject: Re: [PATCH 07/14] arm64: dts: qcom: sa8775p: add the Power On device node
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
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 14, 2023 at 9:25=E2=80=AFPM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 14.03.2023 19:30, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Add the PON node to PMIC #0 for sa8775p platforms.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi b/arch/arm64/b=
oot/dts/qcom/sa8775p-pmics.dtsi
> > index 77e2515a7ab9..5d73212fbd16 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-pmics.dtsi
> > @@ -12,6 +12,13 @@ pmk8775_0: pmic@0 {
> >               reg =3D <0x0 SPMI_USID>;
> >               #address-cells =3D <1>;
> >               #size-cells =3D <0>;
> > +
> > +             pmk8775_0_pon: pon@1200 {
> > +                     compatible =3D "qcom,pmk8350-pon";
> > +                     reg =3D <0x1200>, <0x800>;
> reg-names =3D "hlos", "pbs"
>
> Also, are you sure hlos shouldn't be @1300?
>

Nope, that's the right one here.

Bart

> Konrad
> > +                     mode-recovery =3D <0x1>;
> > +                     mode-bootloader =3D <0x2>;
> > +             };
> >       };
> >
> >       pmk8775_1: pmic@2 {
