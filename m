Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9615477F165
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Aug 2023 09:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348565AbjHQHlW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Aug 2023 03:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348609AbjHQHlH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Aug 2023 03:41:07 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0DB330C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 00:40:59 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-52580a24128so2218290a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Aug 2023 00:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1692258058; x=1692862858;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GQ/pzkMGOFMvffvVhYx2x+xo33IWshzsEC8qLYrj/uQ=;
        b=d1cQ/BjPg1yi2uUWuTc22jq1iHRqEP/NNmdkiQe2gkvtRNhiKrbQjjtDTix+BAo/Nf
         0q8pfiyLBmoiJvUYU+yDZl4hHLzE9AjCXUjw9wQlFA7UNsM32fgyC5fD5sfCzfRBYBU1
         jbxT0YecM2HmMSveJ0g6VJHbFTlQk7hTDSqSSWmzdkFVq3UwWwMn9F2SfYFV8lCd3AXo
         2RjJhJhbAN2Cy1yWt3BaFa8R/sKPCTW88uwB0OjWwy0S06ThftBaSACRBa2AoOxFjxFe
         doH2pYc2XmqjF54ebQobUTlD8ikmFYKEQddtpcfYpqOWexqx31958FzUL3A6W5zLXpdT
         kpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692258058; x=1692862858;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQ/pzkMGOFMvffvVhYx2x+xo33IWshzsEC8qLYrj/uQ=;
        b=eSKL9G1tKfIebGdWCcAkY0VFSdnACMuz6HbkLvN0QqbSWhER/1ZPg6KN+yJCVaSjrq
         abdF1dyLE/qdvGCrXpb9BVCY3BCknW/buKOsgiXki+JB00dxiEnyP9B15XBQPlyvKYaK
         MhEdG7fsxOuLL8g1MNhmY9TVKmIuHE1rKS8yCnlBmY8Yo9bQ9jd9GifNLkb5t/oK9HOS
         Bmw/5SZ84eo5gCfC4dCxksE7BJi4VEfERRm2lM43y5JdNsMOCvelYwtRte/4KCr0gvwr
         b6lONvE5Ff01OHQcjNzQRpYRlAfjmZW0BHiEUfuznsK/BPXvle/9UnhEkiQ1qZYlR+fI
         le8Q==
X-Gm-Message-State: AOJu0Yxjijq1HWD7oDbEJ5ogy740PFYCi9MrkV1NPeUVlLj8i5zDzGik
        N5ADh0u0LPiiDcUwDCwNtoBeFQ==
X-Google-Smtp-Source: AGHT+IGf9rWZ9VohbsbOL72pJ0kHw3/hOLYWbEHXA0pN2GPS58vPMofCBOyp5A4Rss2bcsZNA/p6YQ==
X-Received: by 2002:aa7:d6d8:0:b0:526:9cfb:c12 with SMTP id x24-20020aa7d6d8000000b005269cfb0c12mr978979edr.38.1692258057999;
        Thu, 17 Aug 2023 00:40:57 -0700 (PDT)
Received: from localhost (212095005038.public.telering.at. [212.95.5.38])
        by smtp.gmail.com with ESMTPSA id d13-20020a05640208cd00b005259dd903e5sm1235721edz.67.2023.08.17.00.40.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 00:40:57 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 17 Aug 2023 09:40:56 +0200
Message-Id: <CUUNEYUIT0RH.BEM9YN8OBG8E@otso>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <andersson@kernel.org>,
        "Konrad Dybcio" <konrad.dybcio@linaro.org>,
        "Rob Herring" <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        "Konrad Dybcio" <konrad.dybcio@somainline.org>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: pm7250b: make SID configurable
From:   "Luca Weiss" <luca.weiss@fairphone.com>
To:     "Luca Weiss" <luca.weiss@fairphone.com>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
        "Dmitry Baryshkov" <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20230407-pm7250b-sid-v1-0-fc648478cc25@fairphone.com>
 <20230407-pm7250b-sid-v1-2-fc648478cc25@fairphone.com>
 <f52524da-719b-790f-ad2c-0c3f313d9fe9@linaro.org>
 <CSIE9TYTQUHL.3E769C2Y4RAAO@otso>
 <c9eea8ec-b289-334c-9c0b-7c992184a265@linaro.org>
 <CAA8EJpoSpytSTm=y7oPD_SC+0-bd735KEczR1JgMc7RuMZ+A+g@mail.gmail.com>
 <CSIGK60CQSD8.1Q4SOANJRMASF@otso>
 <9040e9bb-a16c-0186-edba-da986350340c@linaro.org>
 <CSIK8F6MTIVE.2K2U2Q1LDA70H@otso>
In-Reply-To: <CSIK8F6MTIVE.2K2U2Q1LDA70H@otso>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Krzysztof,

On Wed May 10, 2023 at 1:27 PM CEST, Luca Weiss wrote:
> On Wed May 10, 2023 at 12:05 PM CEST, Krzysztof Kozlowski wrote:
> > On 10/05/2023 10:34, Luca Weiss wrote:
> > > On Wed May 10, 2023 at 10:07 AM CEST, Dmitry Baryshkov wrote:
> > >> On Wed, 10 May 2023 at 09:55, Krzysztof Kozlowski
> > >> <krzysztof.kozlowski@linaro.org> wrote:
> > >>>
> > >>> On 10/05/2023 08:47, Luca Weiss wrote:
> > >>>> Hi Krzysztof,
> > >>>>
> > >>>> On Fri Apr 7, 2023 at 10:27 AM CEST, Krzysztof Kozlowski wrote:
> > >>>>> On 07/04/2023 09:45, Luca Weiss wrote:
> > >>>>>> Like other Qualcomm PMICs the PM7250B can be used on different a=
ddresses
> > >>>>>> on the SPMI bus. Use similar defines like the PMK8350 to make th=
is
> > >>>>>> possible.
> > >>>>>>
> > >>>>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > >>>>>> ---
> > >>>>>>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 23 ++++++++++++++++----=
---
> > >>>>>>  1 file changed, 16 insertions(+), 7 deletions(-)
> > >>>>>>
> > >>>>>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/=
boot/dts/qcom/pm7250b.dtsi
> > >>>>>> index daa6f1d30efa..eeb476edc79a 100644
> > >>>>>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > >>>>>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> > >>>>>> @@ -7,6 +7,15 @@
> > >>>>>>  #include <dt-bindings/interrupt-controller/irq.h>
> > >>>>>>  #include <dt-bindings/spmi/spmi.h>
> > >>>>>>
> > >>>>>> +/* This PMIC can be configured to be at different SIDs */
> > >>>>>> +#ifndef PM7250B_SID
> > >>>>>> +   #define PM7250B_SID 2
> > >>>>>
> > >>>>> Drop indentation, although anyway I am against this. Please don't=
 bring
> > >>>>> new patterns of this at least till we settle previous discussion.
> > >>>>>
> > >>>>> https://lore.kernel.org/linux-arm-msm/46658cbb-fff5-e98b-fdad-88f=
a683a9c75@linaro.org/
> > >>>>
> > >>>> What's the outcome of the discussion? For this PMIC it's totally e=
nough
> > >>>> to have the SID configurable like in this patch, I don't think thi=
s PMIC
> > >>>> will be included twice in a board - at least I'm not aware of such=
 a
> > >>>> configuration.
> > >>>
> > >>> We did not reach consensus and I still disagree with complex macros=
 or
> > >>> macros depending on order of inclusion.
> > >>
> > >> I still think we should find a way to parametrise PMIC dtsi, however=
 I
> > >> agree with Krzysztof that complex CPP is not a way to go.
> > >=20
> > > What about the macro already used in-tree and proposed with this patc=
h?
> > > I wouldn't say this is a "complex macro" since it's just a single num=
ber
> > > being replaced in a few places.
> >
> > Are you talking about the macro to which I responded: "or macros
> > depending on order of inclusion." or something else?
>
> I thought you mean with ..
>
> > >>> We did not reach consensus and I still disagree with complex macros=
 or
> > >>> macros depending on order of inclusion.
>
> .. the macros proprosed in the patch you linked (that version that also
> adjusts the labels based on the SID).
>
> I was asking if the patch I sent (with #define PM7250B_SID) would be
> okay to take in at least until the bigger discussion has come to a
> conclusion, since we already have upstream occurances of such a macro so
> it's not a new concept.
>
> Otherwise I'll just carry this patch in my local tree until this
> situation has cleared up.

Has any decision been made in the meantime whether we can get this patch
in (at least until we have a better solution)?

Imo since this patch isn't introducing any new concept that isn't
already present upstream so shouldn't be a big problem..

Regards
Luca

>
> Regards
> Luca
>
> >
> > Best regards,
> > Krzysztof

