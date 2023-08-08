Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7837741DA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Aug 2023 19:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbjHHR3c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Aug 2023 13:29:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234636AbjHHR2w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Aug 2023 13:28:52 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D887D82
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Aug 2023 09:12:30 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99357737980so851492166b.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Aug 2023 09:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691511117; x=1692115917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKnU9SGNhRXh7JQMi9LxA4Fhq6dBeuKxy6dhRmxZasE=;
        b=XVzF2t4cHmR0gYqw9NU/AL6iTfos3LX5a0sWWQQbcXR9a5VmKe93kiWU8/u3Yk/rlQ
         7lvtidXAr33er/DIsKsVePKQPL7V9g5rXGheDfLddYL4PNZ+aC0A2TfkSIRLLocrydHx
         h7APd1vPHfF4kQlRDP3KnGb95p8yWFQNtaHvDrXGclMmDTpOtejyYnpsQOCn4coFWoy0
         JPvghu6Ll/r+U6s9y4VUKGeW7aR0e9U48ReKTt9U5FSiPifp3IhLeNHV3zBOKYfgc2AA
         3slZr8421ywaWGTPqiE2MKy4Xa1gwCdglwqES7hBbX3Fhp144CC57Zt32uCFgxUrVB3+
         VTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511117; x=1692115917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKnU9SGNhRXh7JQMi9LxA4Fhq6dBeuKxy6dhRmxZasE=;
        b=Ixi2K2MoX7SI7tZUFCqTH2WWr6seV8irVwVkaDaDqSr3B2lFpfOIVitwI87V5y2Xo1
         9sllFEtDLS977HStXR0kIi/dRyJubKgrKW6Lkran60ek1dBD0+T8jozW0hZb/tzvvZ5u
         cgVKSFDR750Ht/B/csr5ShFn7605eAAY3qeUSPB3H8eW0vZKb+2uEwo6GWd9Dl9fTHm5
         HHAahaYKIPGotq8PS5hmP1nFZkEoiBj+7ks2+j2p+S5eqm2mXi+4uB0Z1JXGE5Cr05Bg
         XqHvaXY/xHELERusA9KAoajpwtloJvzOVLtMjOe10ae9/6zqIreTs3+84ehQDhgFnN0p
         fnIg==
X-Gm-Message-State: AOJu0YxYJbB5gbdsKOkMr1nt/siChpidqLiUdiIPF0OdSjsbE0jD55EK
        5qo88xIng/SpUroiHTjwKSI8CZUnJ1pWx6PcGJmo0gWI6Ba5qYzE3qIgbQ==
X-Google-Smtp-Source: AGHT+IElsjRa0J9HS7/2fBL75dvvl+iEtaAG/dD+slb4YkABigiWTNAI/wFojzqI+f99ltDUHAchU06wTWaLFbBWBQc=
X-Received: by 2002:a2e:a0cc:0:b0:2b9:b066:66a4 with SMTP id
 f12-20020a2ea0cc000000b002b9b06666a4mr9299821ljm.4.1691497023708; Tue, 08 Aug
 2023 05:17:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230807193507.6488-1-brgl@bgdev.pl> <20230807193507.6488-6-brgl@bgdev.pl>
 <siqiyihftz3musfjulpcqunhgi7npftumrfwfyh2pqnlx6zeb7@rrpwmkvjshfb>
 <da679b5e-6712-4849-b29c-6aa42022abc4@lunn.ch> <ld2j4llgfba6j43gesqxs6wz2baucka5scbj4nef5ehbex2cmt@d4dxsqp2vuoj>
In-Reply-To: <ld2j4llgfba6j43gesqxs6wz2baucka5scbj4nef5ehbex2cmt@d4dxsqp2vuoj>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Aug 2023 14:16:50 +0200
Message-ID: <CAMRc=MdLky5sUbdFGFc+as906kr-J_XDmKmYtBBCHvETvqtAQA@mail.gmail.com>
Subject: Re: [PATCH 5/9] arm64: dts: qcom: sa8775p-ride: move the reset-gpios
 property of the PHY
To:     Andrew Halaney <ahalaney@redhat.com>
Cc:     Andrew Lunn <andrew@lunn.ch>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alex Elder <elder@linaro.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
        DKIM_SIGNED,DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Aug 8, 2023 at 12:27=E2=80=AFAM Andrew Halaney <ahalaney@redhat.com=
> wrote:
>
> On Mon, Aug 07, 2023 at 11:51:40PM +0200, Andrew Lunn wrote:
> > > > I have proposed a solution for this problem in 2020 but it never go=
t
> > > > upstream. Now we have a workaround in place which allows us to hard=
-code
> > > > the PHY id in the compatible property, thus skipping the ID scannin=
g).
> > >
> > > nitpicky, but I think that already existed at that time :D
> >
> > Yes, it has been there are long long time. It is however only in the
> > last 5 years of so has it been seen as a solution to the chicken egg
> > problem.
> >
> > > >           sgmii_phy: phy@8 {
> > > > +                 compatible =3D "ethernet-phy-id0141.0dd4";
> > > >                   reg =3D <0x8>;
> > > >                   device_type =3D "ethernet-phy";
> > > > +                 reset-gpios =3D <&pmm8654au_2_gpios 8 GPIO_ACTIVE=
_LOW>;
> > > > +                 reset-deassert-us =3D <70000>;
> > >
> > > Doesn't this need reset-assert-us?
> >
> > If i remember correctly, there is a default value if DT does not
> > provide one.
> >
>
> I've been trying to make sure I view devicetree properties as an OS
> agnostic ABI lately, with that in mind...
>
> The dt-binding says this for ethernet-phy:
>
>   reset-assert-us:
>     description:
>       Delay after the reset was asserted in microseconds. If this
>       property is missing the delay will be skipped.
>
> If the hardware needs a delay I think we should encode it based on that
> description, else we risk it starting to look like a unit impulse!
>

Please note that the mdio-level delay properties are not the same as
the ones on the PHY levels.

reset-delay-us - this is the delay BEFORE *DEASSERTING* the reset line
reset-post-delay-us - this is the delay AFTER *DEASSERTING* the reset line

On PHY level we have:

reset-assert-us - AFTER *ASSERTING*
reset-deassert-us - AFTER *DEASSERTING*

There never has been any reset-assert delay on that line before. It
doesn't look like we need a delay BEFORE deasserting the line, do we?

Bart
