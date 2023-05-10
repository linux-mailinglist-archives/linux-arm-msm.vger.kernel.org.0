Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211D06FD75C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 May 2023 08:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236072AbjEJGrP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 May 2023 02:47:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235524AbjEJGrN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 May 2023 02:47:13 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2AC8421D
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 May 2023 23:47:10 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9660af2499dso932331166b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 May 2023 23:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1683701229; x=1686293229;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H//eZGlEJS/35YEhZwhGTWp7oEUZuMDqjOLd1KsW/Dk=;
        b=je9yKiewPEqrhtPLrQqwPtxJPJwBxoylsg0o6HBvbvHaeaOCMwK2O/K63M9TCx581q
         KMMEW5t63lQuVAUf1xo+olgAm9NiF6RqPLHCm5i+3249dA9gRah3aSuUILXkeOSWeZbG
         nfU0EK3FPHsTNEA2Rzwnv+XtlWgxujJ+iefazA07nVnVP+axplHu7lDjdx8lkxhv/I1h
         z9kYI5FDwrnlSuLvF0oE2woDtXjyXIGcPgE9ii0MybB5S5nbkMhDjAd0K6pMvyE+H0pd
         xr+vKV4JEGeOhwrPDqHa3bBrM65Isgzv9dun7qEXa6Y9blruDQQRXwqOIl8ZCJ6oRCUs
         Eu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683701229; x=1686293229;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H//eZGlEJS/35YEhZwhGTWp7oEUZuMDqjOLd1KsW/Dk=;
        b=dEjnX3CAp/rH6mrmDMR2mvpme9SdkTbf0QT56GzCqndPPRunI7SCRGwsxE/chWulqO
         6kxIzTHUY1AWoIkxZNCCnwuq27MQwyfHf7F5DH5ZspurvNpMLfF63zzRIOQZArl6dkgb
         hKO5Z4qYl8NUWD+BSwhnA7l2fSJJj6LsJ1NBA0J66UtNEDPIwYAuwshonrzzDWlX3czW
         LDRpkfVn54cborDxE8ETrHTJYmuCaSnbiaFES5T/uDrCLn1fIRezLWW63iGJ0RTXNbcZ
         DuKynYvGqGJKLSwurbm8cYdsvuWWgPLbQ7/hr12zSY9RlXw3hRTD2Lzu4x67BjoEAMMx
         Pf6g==
X-Gm-Message-State: AC+VfDxf3GY5ZaJV2Jgeh8VCV0CyZAdM67s5L2dR219U2e16dGZTuLK7
        fW/cImQggFEEMEwRL4UFJg9fGg==
X-Google-Smtp-Source: ACHHUZ6oiJs4TBNp02xqpzNHKA1CCtOPDo+5SW3bC6Ts4SsxO/AZwHbz9fCAzOA3jOsEMZHvm8MaFg==
X-Received: by 2002:a17:906:fd8d:b0:94f:3521:394 with SMTP id xa13-20020a170906fd8d00b0094f35210394mr13259517ejb.51.1683701229329;
        Tue, 09 May 2023 23:47:09 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id pk25-20020a170906d7b900b00965d9892bafsm2273306ejb.111.2023.05.09.23.47.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 23:47:08 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Wed, 10 May 2023 08:47:07 +0200
Message-Id: <CSIE9TYTQUHL.3E769C2Y4RAAO@otso>
Cc:     <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm7250b: make SID configurable
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>
X-Mailer: aerc 0.15.1
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
 <20230407-pm7250b-sid-v1-2-fc648478cc25@fairphone.com>
 <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
In-Reply-To: <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Fri Apr 7, 2023 at 10:27 AM CEST, Krzysztof Kozlowski wrote:
> On 07/04/2023 09:45, Luca Weiss wrote:
> > Like other Qualcomm PMICs the PM7250B can be used on different addresse=
s
> > on the SPMI bus. Use similar defines like the PMK8350 to make this
> > possible.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dt=
s/qcom/pm7250b.dtsi
> > index daa6f1d30efa..eeb476edc79a 100644
> > --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > @@ -7,6 +7,15 @@
> >  #include <dt-bindings/interrupt-controller/irq.h>
> >  #include <dt-bindings/spmi/spmi.h>
> > =20
> > +/* This PMIC can be configured to be at different SIDs */
> > +#ifndef PM7250B_SID
> > +	#define PM7250B_SID 2
>
> Drop indentation, although anyway I am against this. Please don't bring
> new patterns of this at least till we settle previous discussion.
>
> https://lore.kernel.org/linux-arm-msm/46658cbb-fff5-e98b-fdad-88fa683a9c7=
5@linaro.org/

What's the outcome of the discussion? For this PMIC it's totally enough
to have the SID configurable like in this patch, I don't think this PMIC
will be included twice in a board - at least I'm not aware of such a
configuration.

Regards
Luca

>
>
> Best regards,
> Krzysztof

