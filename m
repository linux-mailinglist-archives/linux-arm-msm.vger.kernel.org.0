Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6168F5FA275
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Oct 2022 19:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbiJJRJA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 Oct 2022 13:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229884AbiJJRI7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 Oct 2022 13:08:59 -0400
X-Greylist: delayed 1226 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 10 Oct 2022 10:08:57 PDT
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A01BBBE21;
        Mon, 10 Oct 2022 10:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailoo.org; s=mailo;
        t=1665419249; bh=lXVpsiA1kRkx/m2eVbexE0t3+2KCIuXZ+dsxk8kGNLY=;
        h=X-EA-Auth:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
         References:Content-Type:Content-Transfer-Encoding:MIME-Version;
        b=IYvrYUGiIKM4nmTr0wGoDR60cEUt6SxXPcu4A9ZiyTEQCE3h8TGXJjTC/eRtiZwjB
         Bt1mzTW6G7Kcr/RG7fAnbODyqjGwpzYUBMhhkchYBzMBWlHFPsKzVz0pUFPOrT1aTG
         y8y2q2PWsjYVJr3RTrALDiLFF/PSk796WQbf8xeU=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
        via [213.182.55.207]
        Mon, 10 Oct 2022 18:27:28 +0200 (CEST)
X-EA-Auth: 3JdaEEkKGGA2MDsf9ahjjha2bXyeSKvTxVFpPb0htksJFObLCHQW8C7IThbhzSmLl3wrHYtrlYo0TiJHHDQ2d4C3klQTX5C1o0oAR8rCD4k=
Message-ID: <5f9ef5a25b983d31b4e0a57ad48fea2fc04724ae.camel@mailoo.org>
Subject: Re: [PATCH v5 1/2] dt-bindings: input: document Qualcomm PMI8998
 haptics driver
From:   Vincent Knecht <vincent.knecht@mailoo.org>
To:     Caleb Connolly <caleb@connolly.tech>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        devicetree@vger.kernel.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jeff LaBundy <jeff@labundy.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Rob Herring <robh+dt@kernel.org>, Tom Rix <trix@redhat.com>
Date:   Mon, 10 Oct 2022 18:27:25 +0200
In-Reply-To: <20221010161727.1298112-2-caleb@connolly.tech>
References: <20221010161727.1298112-1-caleb@connolly.tech>
         <20221010161727.1298112-2-caleb@connolly.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Le lundi 10 octobre 2022 =C3=A0 16:18 +0000, Caleb Connolly a =C3=A9crit=C2=
=A0:
> Add bindings for qcom PMIC PMI8998 haptics driver.
>=20
> Signed-off-by: Caleb Connolly <caleb@connolly.tech>
> ---
> =C2=A0.../bindings/input/qcom,pmi8998-haptics.yaml=C2=A0 | 72 +++++++++++=
++++++++
> =C2=A01 file changed, 72 insertions(+)
> =C2=A0create mode 100644 Documentation/devicetree/bindings/input/qcom,pmi=
8998-haptics.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics=
.yaml
> b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> new file mode 100644
> index 000000000000..cdffe893c77a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/input/qcom,pmi8998-haptics.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright 2020 Unisoc Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998/PM660 Haptics
> +
> +maintainers:
> +=C2=A0 - Caleb Connolly <caleb@connolly.tech>
> +
> +description: |
> +=C2=A0 Qualcomm SPMI haptics is a peripheral on some QTI PMICs. It suppo=
rts linear resonant
> +=C2=A0 actuators and eccentric rotating mass type haptics commonly found=
 in mobile devices.
> +=C2=A0 It supports multiple sources of wave data such as an internal buf=
fer, direct play
> +=C2=A0 (from kernel or userspace) as well as an audio output mode.
> +
> +properties:
> +=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,pmi8998-ha=
ptics
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,pm660-char=
ger
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,pmi8996-ha=
ptics
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - qcom,pmi8941-ha=
ptics
> +
> +=C2=A0 reg:
> +=C2=A0=C2=A0=C2=A0 maxItems: 1
> +
> +=C2=A0 interrupts:
> +=C2=A0=C2=A0=C2=A0 maxItems: 2
> +
> +=C2=A0 interrupt-names:
> +=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: short
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: play
> +
> +=C2=A0 qcom,wave-play-rate-us:
> +=C2=A0=C2=A0=C2=A0 description: |
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Wave sample durection in microseconds, 1/=
f where f

duration, I guess ?



