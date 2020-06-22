Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B78772035C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 13:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgFVLe2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 07:34:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726998AbgFVLe2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 07:34:28 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C04B8C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 04:34:27 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id w7so13389325edt.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=CkMLKDYyCdgwgrz6M1KvCuyRca4uYmURUSVIrQBAvAs=;
        b=E0vCCRrRcBEQEc24INVK06CXRUi9uNy4P7BoFOkgMQfS/2XlouVRXGecPDz/qguUJv
         HpY6Egz4KTxwz/fsL0+dbThaO+FwYXsCjJVkOkGu+qmJKHy8Ib8jGeWrV8G2YjB1bkzy
         WQNtGkzkd0c31/xsJqjpOw+k9Bnryy78AV3HVRSCJzBtE7cXDUVhWzybLDy1GcESL96Z
         R3G7FIdQ/LRPG2zhqOwkpHu9AUwO2K9sqpkt4shLnZUCS7oQwN2lPpMZf5kjhJYAOmvg
         w7wePJlz6m2fw7fSx/gj0ub4Xnxc9PLDwc4FZDsZAS8IwIFEfiiMIce/HtfuVhM+EUKm
         H3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=CkMLKDYyCdgwgrz6M1KvCuyRca4uYmURUSVIrQBAvAs=;
        b=kMGa0l2f99wh6rwGd8G7sCXBgySX4LEUOlshtyIZxTTQzJU7/JGiaYo9aMF7ctf5wk
         ubbx6w5BogQEG/+4Ob9oeYR6h2bgVRBeKVySOvfNOl0ZuMEl0P4c9GEBHyW/gcMPygfw
         m6Ad4Z0Y3tJK5CXeOW9cKee/OzGJQafLLwbkUlYyhkBvQCiZ2rpafrFYJGvQPcLn2G84
         zQer7rX+fuJPHuD51KaCv/+rBgKXYaHsVy6mhKXW3514cpxCKJKRTrXF0A4qedttj5bH
         pFs8SGg5H/+FAmH1H/aVOe5ydQIWtZCRg2cS7MJjWa4RkVKy9Wc7M41TdxVg9i/luIIG
         F+hg==
X-Gm-Message-State: AOAM53227/NhmQnprx/paHoni5tm3kvx2xaZx0/BroDrulkgFUa8PD8c
        psmP0LYc7FsxwrbmSotaZ7EP2kL2FJcezw==
X-Google-Smtp-Source: ABdhPJw2TclJgKhGEZSe4yr9Ks34pnf4FLPghWj83LoIt+wG/aeGcpVWvJEpc3m7sjqyjF+KpuK0gA==
X-Received: by 2002:aa7:cd6c:: with SMTP id ca12mr16716994edb.36.1592825666146;
        Mon, 22 Jun 2020 04:34:26 -0700 (PDT)
Received: from [192.168.2.2] (ppp089210109128.access.hol.gr. [89.210.109.128])
        by smtp.gmail.com with ESMTPSA id f16sm26335ejr.0.2020.06.22.04.34.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2020 04:34:25 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH 1/2] dt-bindings: sound: Device tree bindings for the
 apq8039 sound complex
From:   Pantelis Antoniou <pantelis.antoniou@linaro.org>
In-Reply-To: <20200619214126.GA1251@gerhold.net>
Date:   Mon, 22 Jun 2020 14:34:23 +0300
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Matthew Porter <mporter@konsulko.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <2070B433-83E0-4ACE-A470-36401934FC5A@linaro.org>
References: <20200619193831.12528-1-pantelis.antoniou@linaro.org>
 <20200619193831.12528-2-pantelis.antoniou@linaro.org>
 <20200619214126.GA1251@gerhold.net>
To:     Stephan Gerhold <stephan@gerhold.net>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,


> On Jun 20, 2020, at 00:41 , Stephan Gerhold <stephan@gerhold.net> =
wrote:
>=20
> Hi Pantelis,
>=20
> On Fri, Jun 19, 2020 at 10:38:30PM +0300, Pantelis Antoniou wrote:
>> Add a yaml device binding for the QCOM apq8039 sound complex driver.
>>=20
>=20
> Nice to see some activity to get sound working on another SoC!
> Thanks for documenting all these properties.
>=20

Thanks (I guess :) )

>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou@linaro.org>
>> ---
>> .../bindings/sound/qcom,apq8039.yaml          | 370 =
++++++++++++++++++
>> 1 file changed, 370 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml =
b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
>> new file mode 100644
>> index 000000000000..f1c4fb99ccbb
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/sound/qcom,apq8039.yaml
>> @@ -0,0 +1,370 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/sound/qcom,apq8039.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Technologies APQ8039 ASoC sound card
>> +
>> +maintainers:
>> +  - Pantelis Antoniou <pantelis.antoniou@linaro.org>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: qcom,apq8039-sndcard
>> +
>> +  pinctrl-0:
>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>> +    description: |
>> +      Should specify pin control groups used for this controller =
matching
>> +      the first entry in pinctrl-names.
>> +
>> +  pinctrl-1:
>> +    description: |
>> +      Should specify pin control groups used for this controller =
matching
>> +      the second entry in pinctrl-names.
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    items:
>> +      - const: default
>> +      - const: sleep
>> +    description:
>> +      Names for the pin configuration(s); may be "default" or =
"sleep",
>> +      where the "sleep" configuration may describe the state
>> +      the pins should be in during system suspend.
>> +
>> +  reg:
>> +    description: Must contain an address for each entry in =
"reg-names".
>> +    minItems: 2
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: mic-iomux
>> +      - const: spkr-iomux
>> +
>> +  qcom,model:
>> +    $ref: /schemas/types.yaml#/definitions/string
>> +    description: The user-visible name of the sound complex.
>> +
>> +  qcom,audio-routing:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description: |
>> +      List of the connections between audio components;  each entry =
is a
>> +      pair of strings, the first being the connection's sink, the =
second
>> +      being the connection's source; valid names could be power =
supplies
>> +      and MicBias of msm8916-analoc-wcd codec.
>> +
>> +  function-definition:
>> +    type: object
>> +    description: |
>> +      Functional configuration for the sound complex via a
>> +      simple control. allows fixed and dynamically constructed
>> +      function selection.
>> +
>> +    properties:
>> +      mixer-control:
>> +        $ref: /schemas/types.yaml#/definitions/string
>> +        description: |
>> +          Name of the exported alsa mix control.
>> +
>> +      function-list:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        description: |
>> +          phandle(s) of the functions which the sound complex
>> +          exposes via the control.
>> +
>> +      system-list:
>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>> +        description: |
>> +          phandle(s) of the default, init and shutdown functions
>> +          Must be one of the declared ones in the function property.
>> +          The default function is the one selected by default on
>> +          startup (after the init function's sequence is executed).
>> +          On shutdown the shutdown function sequence will be =
executed.
>> +          Typically init and shutdown are the same and it's purpose
>> +          is to initialize the sound complex mixer controls to the
>> +          all off state, and be ready for a regular function =
selection.
>> +
>> +    patternProperties:
>> +      "^[A-Za-z_][A-Aa-z0-9_]*$":
>> +        type: object
>> +        description:
>> +          Function description subnodes. The name of the function
>> +          is simply the name of the subnode, so restrictions apply
>> +          to the valid node names.
>> +
>> +          The function definition of each subnode is either a cooked
>> +          function (i.e. which is not dependent on state inputs), or
>> +          a function that is selecting a cooked function based on =
the
>> +          state inputs and the generated state vector.
>> +
>> +        oneOf:
>> +          # non-cooked function
>> +          - properties:
>> +              enable:
>> +                $ref: =
/schemas/types.yaml#/definitions/non-unique-string-array
>> +                description: |
>> +                  Sequence of alsa mixer controls to apply when this =
state is to
>> +                  be enabled.
>> +
>> +              disable:
>> +                $ref: =
/schemas/types.yaml#/definitions/non-unique-string-array
>> +                description: |
>> +                  Sequence of alsa mixer controls to apply when this =
state is to
>> +                  be disabled.
>> +
>> +            required:
>> +              - enable
>> +
>> +          # cooked function
>> +          - properties:
>> +              state-inputs:
>> +                description: |
>> +                  A list of state inputs to be used in constructing =
a state
>> +                  vector.
>> +                type: array
>> +                uniqueItems: true
>> +                minItems: 1
>> +                items:
>> +                  anyOf:
>> +                    - const: JACK_HEADPHONE
>> +                    - const: JACK_MICROPHONE
>> +
>> +              state-input-bits:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                description: |
>> +                  Number of bits to use for each state-input in the
>> +                  state vector creation. For now only the value 1 is
>> +                  supported for JACK_HEADPHONE and JACK_MICROPHONE.
>> +
>> +              state-input-defaults:
>> +                $ref: /schemas/types.yaml#/definitions/uint32-array
>> +                description: |
>> +                  The default value to use as a state input at =
startup.
>> +
>> +              state-map:
>> +                $ref: /schemas/types.yaml#/definitions/phandle-array
>> +                description: |
>> +                  The mapping of this function to a cooked function. =
The
>> +                  format used is a sequence of phandle to a state, =
the mask
>> +                  to apply to the state vector, and the equality =
value.
>> +
>> +                  Take the example's configuration
>> +
>> +                    state-inputs         =3D "JACK_HEADPHONE", =
"JACK_MICROPHONE";
>> +                    state-input-bits     =3D <1>, <1>;
>> +                    state-input-defaults =3D <0>, <0>;
>> +
>> +                    state-map =3D <&speaker    0x1 0x0>,
>> +                                <&headphones 0x3 0x1>,
>> +                                <&headset    0x3 0x3>;
>> +
>> +                  is decoded as follows.
>> +
>> +                  There are 3 possible cooked functions to be =
selected.
>> +                  speaker, headphone and headset. The state-inputs =
are
>> +                  the JACK_HEADPHONE and JACK_MICROPHONE, which are =
single
>> +                  bit values, being placed at bit 0 and bit 1 of the
>> +                  constructed vector.
>> +
>> +                  The 4 possible state vectors are:
>> +                    MICROPHONE=3D0, HEADPHONE=3D0, 0
>> +                    MICROPHONE=3D0, HEADPHONE=3D1, 1
>> +                    MICROPHONE=3D1, HEADPHONE=3D0, 2
>> +                    MICROPHONE=3D1, HEADPHONE=3D1, 3
>> +
>> +                  The speaker function is selected when HEADPHONE=3D0 =
because
>> +                  both (0 & 1) =3D=3D (2 & 1) =3D=3D 0.
>> +
>> +                  The headphones function is selected when =
HEADPHONE=3D1 and
>> +                  MICROPHONE=3D0 because (1 & 3) =3D=3D 1.
>> +
>> +                  The headset function is selected when both =
HEADPHONE=3D1 and
>> +                  MICROPHONE=3D1 because (3 & 3) =3D=3D 3.
>> +
>> +            required:
>> +              - state-inputs
>> +              - state-input-bits
>> +              - state-input-defaults
>> +              - state-map
>> +
>> +patternProperties:
>> +  "^.*dai-link-[0-9]+$":
>> +    type: object
>> +    description: |-
>> +      cpu and codec child nodes:
>> +        Container for cpu and codec dai sub-nodes.
>> +        One cpu and one codec sub-node must exist.
>> +
>> +    properties:
>> +      link-name:
>> +        description: The link name
>> +
>> +      cpu:
>> +        type: object
>> +        properties:
>> +
>> +          sound-dai:
>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
>> +            description: phandle(s) of the CPU DAI(s)
>> +
>> +        required:
>> +          - sound-dai
>> +
>> +      codec:
>> +        type: object
>> +        properties:
>> +
>> +          sound-dai:
>> +            $ref: /schemas/types.yaml#/definitions/phandle-array
>> +            description: phandle(s) of the codec DAI(s)
>> +
>> +        required:
>> +          - sound-dai
>> +
>> +    required:
>> +      - link-name
>> +      - cpu
>> +      - codec
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - reg-names
>> +  - qcom,model
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/sound/apq8016-lpass.h>
>> +
>> +    sound: sound@7702000  {
>> +        compatible =3D "qcom,apq8039-sndcard";
>> +        reg =3D <0x07702000 0x4>, <0x07702004 0x4>;
>> +        reg-names =3D "mic-iomux", "spkr-iomux";
>> +
>> +        status =3D "okay";
>> +        pinctrl-0 =3D <&cdc_pdm_lines_act>;
>> +        pinctrl-1 =3D <&cdc_pdm_lines_sus>;
>> +        pinctrl-names =3D "default", "sleep";
>> +        qcom,model =3D "APQ8039";
>> +        qcom,audio-routing =3D "AMIC2", "MIC BIAS Internal2";
>> +
>> +        internal-codec-playback-dai-link-0 {
>> +            link-name =3D "WCD";
>> +            cpu {
>> +                sound-dai =3D <&lpass MI2S_PRIMARY>;
>> +            };
>> +            codec {
>> +                sound-dai =3D <&lpass_codec 0>, <&wcd_codec 0>;
>> +            };
>> +        };
>> +
>> +        internal-codec-capture-dai-link-0 {
>> +            link-name =3D "WCD-Capture";
>> +            cpu {
>> +                sound-dai =3D <&lpass MI2S_TERTIARY>;
>> +            };
>> +            codec {
>> +                sound-dai =3D <&lpass_codec 1>, <&wcd_codec 1>;
>> +            };
>> +        };
>> +
>> +        function-definition {
>> +
>> +            mixer-control =3D "Jack Function";
>> +            function-list =3D <&auto &headphones &headset &speaker =
&off>;
>> +            system-list =3D <&auto &off &off>;  // default, init, =
shutdown
>> +
>> +            auto: Automatic {
>> +                // Headphone presence bit 0 (1) - H
>> +                // Microphone presence bit 1 (2) - M
>> +                state-inputs         =3D "JACK_HEADPHONE", =
"JACK_MICROPHONE";
>> +                state-input-bits     =3D <1>, <1>;
>> +                state-input-defaults =3D <0>, <0>;
>> +
>> +                // HM & MASK
>> +                state-map =3D
>> +                    <&speaker    0x1 0x0>,  // no headphone -> =
speaker
>> +                    <&headphones 0x3 0x1>,  // headphone but no mic =
-> headphones
>> +                    <&headset    0x3 0x3>;  // headphone & mic -> =
headset
>> +            };
>> +            headphones: Headphones {
>> +                enable =3D
>> +                    "RX1 MIX1 INP1", "RX1",
>> +                    "RX2 MIX1 INP1", "RX2",
>> +                    "RDAC2 MUX", "RX2",
>> +                    "RX1 Digital Volume", "128",
>> +                    "RX2 Digital Volume", "128",
>> +                    "HPHL", "Switch",
>> +                    "HPHR", "Switch";
>> +
>> +                disable =3D
>> +                    "RX1 Digital Volume", "0",
>> +                    "RX2 Digital Volume", "0",
>> +                    "HPHL", "ZERO",
>> +                    "HPHR", "ZERO",
>> +                    "RDAC2 MUX", "RX1",
>> +                    "RX1 MIX1 INP1", "ZERO",
>> +                    "RX2 MIX1 INP1", "ZERO";
>> +            };
>> +            headset: Headset {
>> +                enable =3D
>> +                    "RX1 MIX1 INP1", "RX1",
>> +                    "RX2 MIX1 INP1", "RX2",
>> +                    "RDAC2 MUX", "RX2",
>> +                    "RX1 Digital Volume", "128",
>> +                    "RX2 Digital Volume", "128",
>> +                    "DEC1 MUX", "ADC2",
>> +                    "CIC1 MUX", "AMIC",
>> +                    "ADC2 Volume", "8",
>> +                    "ADC2 MUX", "INP2",
>> +                    "HPHL", "Switch",
>> +                    "HPHR", "Switch";
>> +
>> +                disable =3D
>> +                    "RX1 Digital Volume", "0",
>> +                    "RX2 Digital Volume", "0",
>> +                    "HPHL", "ZERO",
>> +                    "HPHR", "ZERO",
>> +                    "RDAC2 MUX", "RX1",
>> +                    "RX1 MIX1 INP1", "ZERO",
>> +                    "RX2 MIX1 INP1", "ZERO",
>> +                    "ADC2 MUX", "ZERO",
>> +                    "ADC2 Volume", "0",
>> +                    "DEC1 MUX", "ZERO";
>> +            };
>> +            speaker: Speaker {
>> +                enable =3D
>> +                    "SPK DAC Switch", "1",
>> +                    "RX3 MIX1 INP1", "RX1",
>> +                    "RX3 MIX1 INP2", "RX2",
>> +                    "RX3 Digital Volume", "128";
>> +
>> +                disable =3D
>> +                    "SPK DAC Switch", "0",
>> +                    "RX3 MIX1 INP1", "ZERO",
>> +                    "RX3 MIX1 INP2", "ZERO";
>> +            };
>> +            off: Off {
>> +                enable =3D
>> +                    "RX1 Digital Volume", "0",
>> +                    "RX2 Digital Volume", "0",
>> +                    "HPHL", "ZERO",
>> +                    "HPHR", "ZERO",
>> +                    "RDAC2 MUX", "RX1",
>> +                    "RX1 MIX1 INP1", "ZERO",
>> +                    "RX2 MIX1 INP1", "ZERO",
>> +                    "ADC2 MUX", "ZERO",
>> +                    "ADC2 Volume", "0",
>> +                    "DEC1 MUX", "ZERO",
>> +                    "SPK DAC Switch", "0",
>> +                    "RX3 MIX1 INP1", "ZERO",
>> +                    "RX3 MIX1 INP2", "ZERO";
>> +            };
>> +        };
>=20
> This looks much like a replacement for ALSA UCM and userspace audio =
jack
> detection coded into the device tree.
>=20

I wouldn=E2=80=99t call it a replacement exactly. It=E2=80=99s merely a =
way to bundle all
of this information about codec glue in the kernel (where it should =
belong IMO).


> While I personally think this is an interesting idea
> (We have the device tree to describe the hardware, why can we not also
> describe necessary audio routing to enable a particular output?)
> this is also not really specific to the APQ8039 hardware, is it?
>=20

Not really TBF. However it is considerably simplified but not handling
all the mixer controls types besides the ones that are applicable to=20
this driver.

> In fact, without all the code to handle the mixer enable/disable
> sequences the machine driver looks almost identical to the existing
> apq8016-sbc.
>=20

Yep, modulo some device tree handling fixes.

> If you want to discuss ways to integrate mixer enable/disable =
sequences
> into the device tree, I suggest that you post your ideas separately as
> [RFC] with a more generic subject. That will make it more easy for
> everyone interested to share their thoughts.
>=20

Well, I can certainly do that. However I=E2=80=99d like to see if this =
is
something that the community would be interested to, but feedback
against this patch.

As I mentioned earlier it needs some work to be made to something
that=E2=80=99s completely generic (i.e. handling arbitrary control =
types).

> Right now it's quite hidden in a patch set where the subjects suggest
> that it's just a simple machine driver to glue some codecs together.
>=20
> Thanks,
> Stephan


Regards

=E2=80=94 Pantelis

