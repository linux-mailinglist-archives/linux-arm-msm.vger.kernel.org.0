Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F40E6BC21B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Mar 2023 01:06:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232975AbjCPAG5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Mar 2023 20:06:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233147AbjCPAG4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Mar 2023 20:06:56 -0400
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com [IPv6:2607:f8b0:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4E2537B46
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:06:20 -0700 (PDT)
Received: by mail-il1-x12e.google.com with SMTP id 4so111014ilz.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1678925178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sli1rB/ZHtGlcd2WlQljXSYJeuPib0g24OqItvg9pys=;
        b=OdYrKoXMsGu2VaWybwqmZlrf1Vn9I4nqtBSp1WNQQYES9ZZy5docKQXqz4bn7d2l5T
         0phRQutzbm49ugt7+OdNRMeiguqEMNn0DenxzDVaxGplwCTlK236b72BiqaUVb+73jU5
         CmZwSVMrOFVBoREeqiI4YIBZzn2XofAnge2qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678925178;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sli1rB/ZHtGlcd2WlQljXSYJeuPib0g24OqItvg9pys=;
        b=O/jR3xXfPA2QIO0Qto21H+AzaD0nghBfDwIvxV4JOAcYSNHU1A3/Tk5icSoQI4mQhj
         TnpVFJsJuje6Stx8oD5ZvmH2iFNaBoVGlMIwxyQix9WYlBTjK9xWRrW8AgCCDsbLh72N
         SIrH/8vJgYD4OZtcEtxomwmHp2VpZBsHIdk6FVSMewW+90CnyKE0zWXvXSuEMBN3bWd0
         5p/pZw6rJhyWYPh32FTBoowiA7rsAR6CZcrr1lC/rtXWXFc4m9or5HpIl4kDBdc8aCq7
         kAYThn0zvJUWAlvQUDCwwIV2E93vI9VlraEk920Qy9QfqpBqsuL6Tn67t4O76VAm9JlG
         wE3A==
X-Gm-Message-State: AO0yUKVkY2enSRJrE2VDZ5tS+1JrM3Y9bdEEvzj//NXzkzA0VAHZkoeQ
        nNOOrlpvV7kZlqbw8l3FG9E56VSyDcp7lNaNU8M=
X-Google-Smtp-Source: AK7set++AvbviHgBq2iDdsbvmJQUoyJlD6plx+S7prVukiQ/w7p0+CnDuTEVPVHqkbpVcKNUBtx54g==
X-Received: by 2002:a92:c7d4:0:b0:314:5aa:94b4 with SMTP id g20-20020a92c7d4000000b0031405aa94b4mr5860422ilk.7.1678925178350;
        Wed, 15 Mar 2023 17:06:18 -0700 (PDT)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id j4-20020a02cc64000000b003e4a3c070adsm2034984jaq.133.2023.03.15.17.06.17
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Mar 2023 17:06:17 -0700 (PDT)
Received: by mail-io1-f53.google.com with SMTP id m22so79770ioy.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Mar 2023 17:06:17 -0700 (PDT)
X-Received: by 2002:a6b:ed02:0:b0:74c:8243:9291 with SMTP id
 n2-20020a6bed02000000b0074c82439291mr19175740iog.1.1678925176875; Wed, 15 Mar
 2023 17:06:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230315154311.37299-1-nikita@trvn.ru> <20230315154311.37299-2-nikita@trvn.ru>
 <3557aa94-6a83-d054-a9d9-81751165eb8a@linaro.org>
In-Reply-To: <3557aa94-6a83-d054-a9d9-81751165eb8a@linaro.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 15 Mar 2023 17:06:04 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFXS96V=-Edi1f+9UcTuzOdn4W01WeW_yV1m5FyLk-rQ@mail.gmail.com>
Message-ID: <CAD=FV=WFXS96V=-Edi1f+9UcTuzOdn4W01WeW_yV1m5FyLk-rQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: sc7180: Don't enable lpass
 clocks by default
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Nikita Travkin <nikita@trvn.ru>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        Judy Hsiao <judyhsiao@chromium.org>
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

On Wed, Mar 15, 2023 at 9:12=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
>
>
> On 15.03.2023 16:43, Nikita Travkin wrote:
> > lpass clocks are usually blocked from HLOS by the firmware and
> > instead are managed by the ADSP. Mark them as reserved and explicitly
> > enable in the CrOS boards that have special, cooperative firmware.
> >
> > Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> > ---
> +CC Doug
>
> Please confirm whether this also applies to IDP (in which case
> this would have been a bugfix).

Thanks for the CC! Actually, Judy (and maybe Matthias) might be
better. The audio stuff makes my head spin a little bit and I know
they've kept track of it much better than I have. If they don't have
time, I can dig more into it myself. I also added Srinivasa just in
case.

In general, though, I think people at Google don't interact with IDP
very much. It's a reference board from Qualcomm and not the right form
factor. It also doesn't support most of the tooling that folks at
Google on the ChromeOS team expect. I don't know if audio was ever
really supported on IDP. Probably not since there's no "sound" node in
the IDP device tree file.


> Konrad
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi         | 4 ++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/=
boot/dts/qcom/sc7180-trogdor.dtsi
> > index 423630c4d02c..26def6e12723 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> > @@ -785,6 +785,14 @@ alc5682: codec@1a {
> >       };
> >  };
> >
> > +&lpasscc {
> > +     status =3D "okay";
> > +};
> > +
> > +&lpass_hm {
> > +     status =3D "okay";
> > +};
> > +
> >  &lpass_cpu {
> >       status =3D "okay";
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts=
/qcom/sc7180.dtsi
> > index 53f0076f20f6..f0de177981f9 100644
> > --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> > @@ -3623,6 +3623,8 @@ lpasscc: clock-controller@62d00000 {
> >                       power-domains =3D <&lpass_hm LPASS_CORE_HM_GDSCR>=
;
> >                       #clock-cells =3D <1>;
> >                       #power-domain-cells =3D <1>;
> > +
> > +                     status =3D "reserved"; /* Controlled by ADSP */
> >               };
> >
> >               lpass_cpu: lpass@62d87000 {
> > @@ -3671,6 +3673,8 @@ lpass_hm: clock-controller@63000000 {
> >
> >                       #clock-cells =3D <1>;
> >                       #power-domain-cells =3D <1>;
> > +
> > +                     status =3D "reserved"; /* Controlled by ADSP */
> >               };
> >       };
> >
