Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FCC423AC4C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Aug 2020 20:23:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727076AbgHCSWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Aug 2020 14:22:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:32816 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgHCSWh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Aug 2020 14:22:37 -0400
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8970322C9F;
        Mon,  3 Aug 2020 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596478955;
        bh=A0VM78clu9nWfyRZMgkhveOx6hQmHD1ZbR24O2ICSFM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=QsnyBkA485rywWquPjBmPpiN5xGudte2iNun45KEsIBWkulNiaubs+qvNtky2y9hx
         24lcUaSUMa70CgEpjUwNXJs/YMcN+OliXCVYMlJju9vNLLM/Sn1eINwz00nUTdw2FP
         fyPXDdikBLU4qXf2dpw1GFYSy6wyzNMzkzcvaDKg=
Received: by mail-ot1-f50.google.com with SMTP id v21so21354580otj.9;
        Mon, 03 Aug 2020 11:22:36 -0700 (PDT)
X-Gm-Message-State: AOAM530QVFmEzTyODVNwZ5fH78BuD7NxDmyZyavPl7ndE2bD11lyS1Qu
        Qag6uhWlRR4DYvw40tCA+cL8oJ2KwsRajpcKoQ==
X-Google-Smtp-Source: ABdhPJzMHq3WdaFIfxNdEfiP6NZslvKDRVNA0etskv0yYUPEQieezwwqH9sDSl+IaO4NoWt9Gwgq2x+ErjNVUtfHFoU=
X-Received: by 2002:a9d:7f84:: with SMTP id t4mr6471981otp.192.1596478955373;
 Mon, 03 Aug 2020 11:22:35 -0700 (PDT)
MIME-Version: 1.0
References: <1595413915-17867-1-git-send-email-rohitkr@codeaurora.org>
 <1595413915-17867-13-git-send-email-rohitkr@codeaurora.org>
 <20200723171629.GA547775@bogus> <d00456e3-00e1-e373-760c-8292d6e7dd1b@codeaurora.org>
In-Reply-To: <d00456e3-00e1-e373-760c-8292d6e7dd1b@codeaurora.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 3 Aug 2020 12:22:23 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+DwA8=iRfMgUGM+H5_CrRRb7xa7DFdAWFOCATR9+=+Rw@mail.gmail.com>
Message-ID: <CAL_Jsq+DwA8=iRfMgUGM+H5_CrRRb7xa7DFdAWFOCATR9+=+Rw@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] dt-bindings: sound: lpass-cpu: Move to yaml format
To:     Rohit Kumar <rohitkr@codeaurora.org>
Cc:     devicetree@vger.kernel.org,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Banajit Goswami <bgoswami@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Patrick Lai <plai@codeaurora.org>,
        Takashi Iwai <tiwai@suse.com>, Andy Gross <agross@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Aug 3, 2020 at 2:28 AM Rohit Kumar <rohitkr@codeaurora.org> wrote:
>
> Thanks Rob for reviewing
>
> On 7/23/2020 10:46 PM, Rob Herring wrote:
> > On Wed, Jul 22, 2020 at 04:01:55PM +0530, Rohit kumar wrote:
> >> Update lpass-cpu binding with yaml formats.
> >>
> >> Signed-off-by: Rohit kumar <rohitkr@codeaurora.org>
> >> ---
> >>   .../devicetree/bindings/sound/qcom,lpass-cpu.txt   | 130 ---------------
> >>   .../devicetree/bindings/sound/qcom,lpass-cpu.yaml  | 185 +++++++++++++++++++++
> >>   2 files changed, 185 insertions(+), 130 deletions(-)
> >>   delete mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> >>   create mode 100644 Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> >> deleted file mode 100644
> >> index c21392e..00000000
> >> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.txt
> >> +++ /dev/null
> >> @@ -1,130 +0,0 @@
> >> -* Qualcomm Technologies LPASS CPU DAI
> >> -
> >> -This node models the Qualcomm Technologies Low-Power Audio SubSystem (LPASS).
> >> -
> >> -Required properties:
> >> -
> >> -- compatible                : "qcom,lpass-cpu" or "qcom,apq8016-lpass-cpu" or
> >> -                      "qcom,lpass-cpu-sc7180"
> >> -- clocks            : Must contain an entry for each entry in clock-names.
> >> -- clock-names               : A list which must include the following entries:
> >> -                            * "ahbix-clk"
> >> -                            * "mi2s-osr-clk"
> >> -                            * "mi2s-bit-clk"
> >> -                    : required clocks for "qcom,lpass-cpu-apq8016"
> >> -                            * "ahbix-clk"
> >> -                            * "mi2s-bit-clk0"
> >> -                            * "mi2s-bit-clk1"
> >> -                            * "mi2s-bit-clk2"
> >> -                            * "mi2s-bit-clk3"
> >> -                            * "pcnoc-mport-clk"
> >> -                            * "pcnoc-sway-clk"
> >> -                    : required clocks for "qcom,lpass-cpu-sc7180"
> >> -                            * "audio-core"
> >> -                            * "mclk0"
> >> -                            * "mi2s-bit-clk0"
> >> -                            * "mi2s-bit-clk1"
> >> -                            * "pcnoc-sway-clk"
> >> -                            * "pcnoc-mport-clk"
> >> -
> >> -- interrupts                : Must contain an entry for each entry in
> >> -                      interrupt-names.
> >> -- interrupt-names   : A list which must include the following entries:
> >> -                            * "lpass-irq-lpaif"
> >> -- pinctrl-N         : One property must exist for each entry in
> >> -                      pinctrl-names.  See ../pinctrl/pinctrl-bindings.txt
> >> -                      for details of the property values.
> >> -- pinctrl-names             : Must contain a "default" entry.
> >> -- reg                       : Must contain an address for each entry in reg-names.
> >> -- reg-names         : A list which must include the following entries:
> >> -                            * "lpass-lpaif"
> >> -- #address-cells    : Must be 1
> >> -- #size-cells               : Must be 0
> >> -
> >> -
> >> -
> >> -Optional properties:
> >> -
> >> -- qcom,adsp         : Phandle for the audio DSP node
> >> -
> >> -By default, the driver uses up to 4 MI2S SD lines, for a total of 8 channels.
> >> -The SD lines to use can be configured by adding subnodes for each of the DAIs.
> >> -
> >> -Required properties for each DAI (represented by a subnode):
> >> -- reg                       : Must be one of the DAI IDs
> >> -                      (usually part of dt-bindings header)
> >> -- qcom,playback-sd-lines: List of serial data lines to use for playback
> >> -                      Each SD line should be represented by a number from 0-3.
> >> -- qcom,capture-sd-lines     : List of serial data lines to use for capture
> >> -                      Each SD line should be represented by a number from 0-3.
> >> -
> >> -Note that adding a subnode changes the default to "no lines configured",
> >> -so both playback and capture lines should be configured when a subnode is added.
> >> -
> >> -Examples:
> >> -1)
> >> -
> >> -lpass@28100000 {
> >> -    compatible = "qcom,lpass-cpu";
> >> -    clocks = <&lcc AHBIX_CLK>, <&lcc MI2S_OSR_CLK>, <&lcc MI2S_BIT_CLK>;
> >> -    clock-names = "ahbix-clk", "mi2s-osr-clk", "mi2s-bit-clk";
> >> -    interrupts = <0 85 1>;
> >> -    interrupt-names = "lpass-irq-lpaif";
> >> -    pinctrl-names = "default", "idle";
> >> -    pinctrl-0 = <&mi2s_default>;
> >> -    pinctrl-1 = <&mi2s_idle>;
> >> -    reg = <0x28100000 0x10000>;
> >> -    reg-names = "lpass-lpaif";
> >> -    qcom,adsp = <&adsp>;
> >> -
> >> -    #address-cells = <1>;
> >> -    #size-cells = <0>;
> >> -
> >> -    /* Optional to set different MI2S SD lines */
> >> -    dai@3 {
> >> -            reg = <MI2S_QUATERNARY>;
> >> -            qcom,playback-sd-lines = <0 1>;
> >> -    };
> >> -};
> >> -
> >> -2)
> >> -
> >> -#include <dt-bindings/sound/sc7180-lpass.h>
> >> -
> >> -lpass_cpu: lpass {
> >> -    compatible = "qcom,lpass-cpu-sc7180";
> >> -
> >> -    reg = <0 0x62F00000 0 0x29000>;
> >> -
> >> -    iommus = <&apps_smmu 0x1020 0>;
> >> -
> >> -    power-domains = <&lpass_hm LPASS_CORE_HM_GDSCR>;
> >> -    clocks = <&gcc GCC_LPASS_CFG_NOC_SWAY_CLK>,
> >> -            <&lpasscorecc LPASS_AUDIO_CORE_CORE_CLK>,
> >> -            <&lpasscorecc LPASS_AUDIO_CORE_EXT_MCLK0_CLK>,
> >> -            <&lpasscorecc LPASS_AUDIO_CORE_SYSNOC_MPORT_CORE_CLK>,
> >> -            <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_PRI_IBIT_CLK>,
> >> -            <&lpasscorecc LPASS_AUDIO_CORE_LPAIF_SEC_IBIT_CLK>;
> >> -    clock-names = "pcnoc-sway-clk", "audio-core",
> >> -                    "mclk0", "pcnoc-mport-clk",
> >> -                    "mi2s-bit-clk0", "mi2s-bit-clk1";
> >> -    interrupts = <0 160 IRQ_TYPE_LEVEL_HIGH>;
> >> -    interrupt-names = "lpass-irq-lpaif";
> >> -
> >> -
> >> -    #sound-dai-cells = <1>;
> >> -
> >> -    #address-cells = <1>;
> >> -    #size-cells = <0>;
> >> -
> >> -    mi2s-primary@0 {
> >> -            reg = <MI2S_PRIMARY>;
> >> -            qcom,playback-sd-lines = <1>;
> >> -            qcom,capture-sd-lines = <0>;
> >> -    };
> >> -
> >> -    mi2s-secondary@1 {
> >> -            reg = <MI2S_SECONDARY>;
> >> -            qcom,playback-sd-lines = <0>;
> >> -    };
> >> -};
> >> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> >> new file mode 100644
> >> index 00000000..03c598f
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-cpu.yaml
> >> @@ -0,0 +1,185 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only
> > If all the authors are QCom or Linaro please dual license.
> Ok
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/sound/qcom,lpass-cpu.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Qualcomm LPASS CPU dai driver bindings
> >> +
> >> +maintainers:
> >> +  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> >> +  - Rohit kumar <rohitkr@codeaurora.org>
> >> +
> >> +description: |
> >> +  Qualcomm SOC Low-Power Audio SubSystem (LPASS) that consist of MI2S interface
> >> +  for audio data transfer on external codecs. LPASS cpu driver is a module to
> >> +  configure Low-Power Audio Interface(LPAIF) core registers across different
> >> +  IP versions.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    oneOf:
> >> +      - const: qcom,lpass-cpu
> >> +        description: For IPQ806x
> >> +
> >> +      - const: qcom,apq8016-lpass-cpu
> >> +        description: For APQ8016
> >> +
> >> +      - const: qcom,lpass-cpu-sc7180
> >> +        description: For SC7180
> > Use enum rather than oneOf+const
> Sure
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +    description: LPAIF core registers
> >> +
> >> +  clocks:
> >> +    minItems: 3
> >> +    maxItems: 6
> >> +
> >> +  clock-names:
> >> +    minItems: 3
> >> +    maxItems: 6
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +    description: LPAIF DMA buffer interrupt
> >> +
> >> +  qcom,adsp:
> >> +    $ref: /schemas/types.yaml#/definitions/phandle
> >> +    description: Phandle for the audio DSP node
> >> +
> >> +  iommus:
> >> +    maxItems: 1
> >> +    description: Phandle to apps_smmu node with sid mask
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  '#sound-dai-cells':
> >> +    const: 1
> >> +
> >> +patternProperties:
> >> +  "(^mi2s-[0-9a-f]$|mi2s)":
> >> +    type: object
> >> +    description: Required properties for each DAI
> >> +
> >> +    properties:
> >> +      reg:
> >> +        maxItems: 1
> >> +        description: Must be one of the DAI ID
> >> +
> >> +    required:
> >> +      - reg
> >> +
> >> +
> > Extra blank line.
> Ok
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - clocks
> >> +  - clock-names
> >> +  - interrupts
> >> +  - '#sound-dai-cells'
> > Add:
> >
> > additionalProperties: false
>
> If I am adding this, I am getting below error:
>
> Documentation/devicetree/bindings/sound/qcom,lpass-cpu.example.dt.yaml:
> lpass@62f00000: '#address-cells', '#size-cells' do not match any of the
> regexes: '(^mi2s-[0-9a-f]$|mi2s)', 'pinctrl-[0-9]+'
>
>
> I think  this is coming because we have not mentioned mi2s-primary@0 in
> required fields.
> The field name is variable based on the interface to which peripheral is
> connected to.
> It can be either of primary/secondary/tertiary/quaternary. Can you
> please suggest how to
> avoid this error?

No, the error is because you didn't list '#address-cells' and
'#size-cells' as properties.

Rob
