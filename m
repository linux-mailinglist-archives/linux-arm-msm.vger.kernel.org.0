Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA81F66D0EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Jan 2023 22:29:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234884AbjAPV3y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Jan 2023 16:29:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234493AbjAPV3s (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Jan 2023 16:29:48 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CED12BEF7
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:29:10 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id j17so44428598lfr.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Jan 2023 13:29:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FqTPgVEI+/l0Z2M0FqNHN/wbtlAyAwzZL0OO5z8BaCc=;
        b=jhMWQjDKGdbCHydqu5ubgmaJLHdxpngHI5nIJF0VbdiS0N39R/lmWztXM0FfDp/deu
         9W+CdGTu3IqFjDdhFus0JXhdV1t8Afe4N3GXQNZgkaOwo3waflvGyJRpE4Z2/NiQvbhw
         pnxs7b1q0YWuQgkDeRHi8tXd+keSvtCEb+IoDiE8PJ+5kxdHUnYEVDsQF781coj2Xu+y
         UwYTNj69ieAKeoZ7BLs0fYqxYrol4bv7oWT3XoNzlJFI7I3AEgbesFMWqZgKNAEph5Uu
         isYn0HT2hOwcdFvWvZT/2vju2xbuxMW9HttRClnJoqXQ89KrMieXnDQLFK37RzrB6V26
         VtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FqTPgVEI+/l0Z2M0FqNHN/wbtlAyAwzZL0OO5z8BaCc=;
        b=P2zWIiVyqSIg5caL+DsRfJKgaJY3UtUlW0rV1AnL0ltOI2wKhj8gh/gNajBU86Dx5V
         hHNRQ85M9C1pIrmYLOiVT3uO5hBvJG0+jR9SiZqQZeqUkTaXmGzvHlu5EwifO02YIZc/
         oFx6HwDMx+lM6zYJCLK3j3/BUdspzXUuN3UA0wAJU3Y9232T5qpU37ftHH56+TxFb+Xv
         L/OQb3q6KY4zybsFIezk70tV1Q1IrB8Ptd0EbXGs7lDkr4ZMlP7fr5/vS402C13Loy/F
         gGt2TXMOHIiu4D4AD+RipAisgMZTAM1nyA/4z9BRDalBycsm9wIpPj0Ec1rUXvxVVwev
         nD0Q==
X-Gm-Message-State: AFqh2koh7KiWfaQYpN+RZ2Z27PyMXfy2miVeJC8lNrEfNKCHNuLYJhdt
        5899uYXidhb6F9x3Uf6YzIUF3w==
X-Google-Smtp-Source: AMrXdXuufVRubDriD/2a/Gz86R2bSzUvxoguE9Cq9tfcujYu1aRL76EHwPDPPYn9I3UYwcsO/DL6hw==
X-Received: by 2002:ac2:4f04:0:b0:4a4:68b8:f4bd with SMTP id k4-20020ac24f04000000b004a468b8f4bdmr143452lfr.3.1673904548546;
        Mon, 16 Jan 2023 13:29:08 -0800 (PST)
Received: from [127.0.0.1] (85-76-18-55-nat.elisa-mobile.fi. [85.76.18.55])
        by smtp.gmail.com with ESMTPSA id j11-20020a056512344b00b004d580823c25sm128540lfr.11.2023.01.16.13.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jan 2023 13:29:08 -0800 (PST)
Date:   Mon, 16 Jan 2023 23:29:04 +0200
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Christian Marangi <ansuelsmth@gmail.com>
CC:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v7 1/7] dt-bindings: clock: Convert qcom,krait-cc to yaml
User-Agent: K-9 Mail for Android
In-Reply-To: <63c5bf92.050a0220.bca9b.5439@mx.google.com>
References: <20230116204751.23045-1-ansuelsmth@gmail.com> <20230116204751.23045-2-ansuelsmth@gmail.com> <CAA8EJppdYqwM6n+6BdKtjO+TTerqeodLO7CEpBVNW45yduFV0g@mail.gmail.com> <63c5bf92.050a0220.bca9b.5439@mx.google.com>
Message-ID: <E690C301-63D8-4563-8A82-43D2EB996D10@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

16 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2023 =D0=B3=2E 23:20:17 GMT+02:00, =
Christian Marangi <ansuelsmth@gmail=2Ecom> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>On Mon, Jan 16, 2023 at 11:14:10PM +0200, Dmitry Baryshkov wrote:
>> On Mon, 16 Jan 2023 at 22:48, Christian Marangi <ansuelsmth@gmail=2Ecom=
> wrote:
>> >
>> > Convert qcom,krait-cc to yaml Documentation=2E
>> >
>> > Signed-off-by: Christian Marangi <ansuelsmth@gmail=2Ecom>
>> > Reviewed-by: Krzysztof Kozlowski <krzk@kernel=2Eorg>
>> > Acked-by: Rob Herring <robh@kernel=2Eorg>
>>=20
>> I know this has been reviewed already=2E I checked again my apq8064
>> branch and noticed that the bindings are not compatible with the
>> apq8064=2E The SoC in question is a 4-core device, so this is what I ha=
d
>> in mind:
>>=20
>>        kraitcc: clock-controller {
>>                compatible =3D "qcom,krait-cc-v1";
>>                clocks =3D <&gcc PLL9>, /* hfpll0 */
>>                         <&gcc PLL10>, /* hfpll1 */
>>                         <&gcc PLL16>, /* hfpll2 */
>>                         <&gcc PLL17>, /* hfpll3 */
>>                         <&gcc PLL12>, /* hfpll_l2 */
>>                         <&acc0>,
>>                         <&acc1>,
>>                         <&acc2>,
>>                         <&acc3>,
>>                         <&l2cc>;
>>                clock-names =3D "hfpll0",
>>                              "hfpll1",
>>                              "hfpll2",
>>                              "hfpll3",
>>                              "hfpll_l2",
>>                              "acpu0_aux",
>>                              "acpu1_aux",
>>                              "acpu2_aux",
>>                              "acpu3_aux",
>>                              "acpu_l2_aux";
>>                #clock-cells =3D <1>;
>>        };
>>=20
>
>Oh wow=2E=2E=2E Wasn't aware, but I wonder if a good idea would be to pat=
ch
>the yaml if and when this series is merged? This is a direct conversion
>of the krait-cc txt=2E=2E=2E
>
>If we really want I can send a v8 with adding these extra stuff to the
>just converted yaml in a different commit? (afaik conversion should not
>add more info if the documentation is not broken enough and can be
>converted)

I think we can ask Bjorn to pick the rest of the patches (if they are acke=
d/reviewed, they look good to me) and work on this one=2E It might make sen=
se to add per-SoC compatibles=2E Also note, the qsb clock=2E Which block ge=
nerates it on ipq8064?

>
>> > ---
>> >  =2E=2E=2E/bindings/clock/qcom,krait-cc=2Etxt          | 34 ---------=
--
>> >  =2E=2E=2E/bindings/clock/qcom,krait-cc=2Eyaml         | 59 +++++++++=
++++++++++
>> >  2 files changed, 59 insertions(+), 34 deletions(-)
>> >  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,krai=
t-cc=2Etxt
>> >  create mode 100644 Documentation/devicetree/bindings/clock/qcom,krai=
t-cc=2Eyaml
>> >
>> > diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc=2E=
txt b/Documentation/devicetree/bindings/clock/qcom,krait-cc=2Etxt
>> > deleted file mode 100644
>> > index 030ba60dab08=2E=2E000000000000
>> > --- a/Documentation/devicetree/bindings/clock/qcom,krait-cc=2Etxt
>> > +++ /dev/null
>> > @@ -1,34 +0,0 @@
>> > -Krait Clock Controller
>> > -
>> > -PROPERTIES
>> > -
>> > -- compatible:
>> > -       Usage: required
>> > -       Value type: <string>
>> > -       Definition: must be one of:
>> > -                       "qcom,krait-cc-v1"
>> > -                       "qcom,krait-cc-v2"
>> > -
>> > -- #clock-cells:
>> > -       Usage: required
>> > -       Value type: <u32>
>> > -       Definition: must be 1
>> > -
>> > -- clocks:
>> > -       Usage: required
>> > -       Value type: <prop-encoded-array>
>> > -       Definition: reference to the clock parents of hfpll, secondar=
y muxes=2E
>> > -
>> > -- clock-names:
>> > -       Usage: required
>> > -       Value type: <stringlist>
>> > -       Definition: must be "hfpll0", "hfpll1", "acpu0_aux", "acpu1_a=
ux", "qsb"=2E
>> > -
>> > -Example:
>> > -
>> > -       kraitcc: clock-controller {
>> > -               compatible =3D "qcom,krait-cc-v1";
>> > -               clocks =3D <&hfpll0>, <&hfpll1>, <&acpu0_aux>, <&acpu=
1_aux>, <qsb>;
>> > -               clock-names =3D "hfpll0", "hfpll1", "acpu0_aux", "acp=
u1_aux", "qsb";
>> > -               #clock-cells =3D <1>;
>> > -       };
>> > diff --git a/Documentation/devicetree/bindings/clock/qcom,krait-cc=2E=
yaml b/Documentation/devicetree/bindings/clock/qcom,krait-cc=2Eyaml
>> > new file mode 100644
>> > index 000000000000=2E=2E8caa5a677394
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/clock/qcom,krait-cc=2Eyaml
>> > @@ -0,0 +1,59 @@
>> > +# SPDX-License-Identifier: GPL-2=2E0-only OR BSD-2-Clause
>> > +%YAML 1=2E2
>> > +---
>> > +$id: http://devicetree=2Eorg/schemas/clock/qcom,krait-cc=2Eyaml#
>> > +$schema: http://devicetree=2Eorg/meta-schemas/core=2Eyaml#
>> > +
>> > +title: Qualcomm Krait Clock Controller
>> > +
>> > +maintainers:
>> > +  - Christian Marangi <ansuelsmth@gmail=2Ecom>
>> > +
>> > +description: |
>> > +  Qualcomm Krait Clock Controller used to correctly scale the CPU an=
d the L2
>> > +  rates=2E
>> > +
>> > +properties:
>> > +  compatible:
>> > +    enum:
>> > +      - qcom,krait-cc-v1
>> > +      - qcom,krait-cc-v2
>> > +
>> > +  clocks:
>> > +    items:
>> > +      - description: phandle to hfpll for CPU0 mux
>> > +      - description: phandle to hfpll for CPU1 mux
>> > +      - description: phandle to CPU0 aux clock
>> > +      - description: phandle to CPU1 aux clock
>> > +      - description: phandle to QSB fixed clk
>> > +
>> > +  clock-names:
>> > +    items:
>> > +      - const: hfpll0
>> > +      - const: hfpll1
>> > +      - const: acpu0_aux
>> > +      - const: acpu1_aux
>> > +      - const: qsb
>> > +
>> > +  '#clock-cells':
>> > +    const: 1
>> > +
>> > +required:
>> > +  - compatible
>> > +  - clocks
>> > +  - clock-names
>> > +  - '#clock-cells'
>> > +
>> > +additionalProperties: false
>> > +
>> > +examples:
>> > +  - |
>> > +    clock-controller {
>> > +      compatible =3D "qcom,krait-cc-v1";
>> > +      clocks =3D <&hfpll0>, <&hfpll1>,
>> > +               <&acpu0_aux>, <&acpu1_aux>, <&qsb>;
>> > +      clock-names =3D "hfpll0", "hfpll1",
>> > +                    "acpu0_aux", "acpu1_aux", "qsb";
>> > +      #clock-cells =3D <1>;
>> > +    };
>> > +=2E=2E=2E
>> > --
>> > 2=2E37=2E2
>> >
>>=20
>>=20
>> --=20
>> With best wishes
>> Dmitry
>

