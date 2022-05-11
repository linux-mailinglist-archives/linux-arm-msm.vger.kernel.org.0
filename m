Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81993523B03
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 18:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345245AbiEKQ7g (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 12:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345240AbiEKQ7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 12:59:34 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1C613CA2C
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:59:32 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id e24so2803257pjt.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 09:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=psIKzhbeiZw9Aftjj4SOmxtdH9ncwPzk8iMLnEGr5bQ=;
        b=br3daB0N8p/kLYd3rvdlu/42N5uuMMNWC5vbDuU38H/bNftmrx5r5RxSbP1OyY/K6a
         5RJdt2tVcmtISOviN61hb8DtmcBkGuMY01Z0pqx2idZS7vTzf+KudVdP0p/CCeotBBQi
         wu7I97Mr3AaxtxNvklCkTkWG0dnRLEC1i+cBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=psIKzhbeiZw9Aftjj4SOmxtdH9ncwPzk8iMLnEGr5bQ=;
        b=1O/aJ8vvQ6cdkL+jqvYahEQAy2KXRuLenr8MphpW0vYhg6fDgznwV1PFuAm6dosACc
         wrRhHju6soHtLspkqIsC9vshGZwtwdVwyI+1DIhYbzxU11pVO1mlxeQZ2jvcHg1djuXA
         9I0zib2u2TvqLKWn5aPfzJ2vWt8tWLUM16MCULJZLdAO/N8BTsiLQuJIKu72Tf0iJF4p
         1/0inWZbsvs89Ay4j1YHjs8/3GO87/t+xL1U0SbpAXNXBJhw1GZQvV5U15Ad6vC7gK2n
         eRVcyum1/iU+0Eho3NkLaT1ixaJsgZp78Oeim1VgzwafirXCBOtad+VFhQatISQKUo5/
         ysxA==
X-Gm-Message-State: AOAM532S1MO1NjK/OaFDDWGP3OQf5glgmE7usfV9gMIjNZLDtv7HMjL+
        1Tor5ZxlT8Xfp697eGf5GmWMGw==
X-Google-Smtp-Source: ABdhPJzMCgYv+v3OfOKwapUQQdn7yf3/lf5sB7Q70QMwgnjGiq1+4OKv65VIOQKiMkXuD95dtadtmg==
X-Received: by 2002:a17:90a:f2ce:b0:1d9:a18f:87f3 with SMTP id gt14-20020a17090af2ce00b001d9a18f87f3mr6363099pjb.213.1652288371862;
        Wed, 11 May 2022 09:59:31 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:c586:bf93:e960:73b4])
        by smtp.gmail.com with UTF8SMTPSA id a12-20020aa78e8c000000b0050dc762818dsm2023523pfr.103.2022.05.11.09.59.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:59:31 -0700 (PDT)
Date:   Wed, 11 May 2022 09:59:30 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH v3 2/2] dt-bindings: remoteproc: qcom: Add SC7280 MSS
 bindings
Message-ID: <YnvrchuHVKFHE3B2@google.com>
References: <1652257162-23874-1-git-send-email-quic_sibis@quicinc.com>
 <1652257162-23874-3-git-send-email-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1652257162-23874-3-git-send-email-quic_sibis@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

On Wed, May 11, 2022 at 01:49:22PM +0530, Sibi Sankar wrote:
> Add MSS PIL loading bindings for SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>

There is already a binding for 'qcom,sc7280-mss-pil' in
Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt. Shouldn't
the entries from that file be deleted?

> 
> v3:
>  * Re-ordered clock list, fixed pdc_sync typo [Rob/Matthias]
> 
>  .../bindings/remoteproc/qcom,sc7280-mss-pil.yaml   | 261 +++++++++++++++++++++
>  1 file changed, 261 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> new file mode 100644
> index 000000000000..2f95bfd7b3eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,sc7280-mss-pil.yaml
> @@ -0,0 +1,261 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/qcom,sc7280-mss-pil.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SC7280 MSS Peripheral Image Loader
> +
> +maintainers:
> +  - Sibi Sankar <quic_sibis@quicinc.com>
> +
> +description:
> +  This document defines the binding for a component that loads and boots firmware
> +  on the Qualcomm Technology Inc. SC7280 Modem Hexagon Core.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,sc7280-mss-pil
> +
> +  reg:
> +    items:
> +      - description: MSS QDSP6 registers
> +      - description: RMB registers
> +
> +  reg-names:
> +    items:
> +      - const: qdsp6
> +      - const: rmb
> +
> +  iommus:
> +    items:
> +      - description: MSA Stream 1
> +      - description: MSA Stream 2
> +
> +  interconnects:
> +    items:
> +      - description: Path leading to system memory
> +
> +  interrupts:
> +    items:
> +      - description: Watchdog interrupt
> +      - description: Fatal interrupt
> +      - description: Ready interrupt
> +      - description: Handover interrupt
> +      - description: Stop acknowledge interrupt
> +      - description: Shutdown acknowledge interrupt
> +
> +  interrupt-names:
> +    items:
> +      - const: wdog
> +      - const: fatal
> +      - const: ready
> +      - const: handover
> +      - const: stop-ack
> +      - const: shutdown-ack


The existing binding (qcom,q6v5.txt) also has:

- interrupts-extended:
        Usage: required
	Value type: <prop-encoded-array>
	Definition: reference to the interrupts that match interrupt-names

That's covered implicitly by 'interrupts' I suppose?

> +
> +  clocks:
> +    items:
> +      - description: GCC MSS IFACE clock
> +      - description: GCC MSS OFFLINE clock
> +      - description: GCC MSS SNOC_AXI clock
> +      - description: RPMH PKA clock
> +      - description: RPMH XO clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: offline
> +      - const: snoc_axi
> +      - const: pka
> +      - const: xo
> +
> +  power-domains:
> +    items:
> +      - description: CX power domain
> +      - description: MSS power domain
> +
> +  power-domain-names:
> +    items:
> +      - const: cx
> +      - const: mss
> +
> +  resets:
> +    items:
> +      - description: AOSS restart
> +      - description: PDC reset
> +
> +  reset-names:
> +    items:
> +      - const: mss_restart
> +      - const: pdc_reset
> +
> +  memory-region:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: Phandle reference to the reserved-memory for the MBA region followed
> +                 by the modem region.
> +
> +  firmware-name:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      The name of the firmware which should be loaded for this remote
> +      processor.
> +
> +  qcom,halt-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      four offsets within syscon for q6, modem, nc and vq6 halt registers.
> +
> +  qcom,ext-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Two phandle references to syscons representing TCSR_REG and TCSR register
> +      space followed by the two offsets within the syscon to force_clk_en/rscc_disable
> +      and axim1_clk_off/crypto_clk_off registers respectively.
> +
> +  qcom,qaccept-regs:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description:
> +      Phandle reference to a syscon representing TCSR followed by the
> +      three offsets within syscon for mdm, cx and axi qaccept registers.
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  qcom,smem-states:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: States used by the AP to signal the Hexagon core
> +    items:
> +      - description: Stop the modem
> +
> +  qcom,smem-state-names:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The names of the state bits used for SMP2P output
> +    const: stop
> +
> +  glink-edge:
> +    type: object
> +    description: |
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the DSP.
> +
> +    properties:
> +      interrupts:
> +        items:
> +          - description: IRQ from MSS to GLINK
> +
> +      mboxes:
> +        items:
> +          - description: Mailbox for communication between APPS and MSS
> +
> +      label:
> +        description: The names of the state bits used for SMP2P output
> +        items:
> +          - const: modem
> +
> +      qcom,remote-pid:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: ID of the shared memory used by GLINK for communication with MSS
> +
> +    required:
> +      - interrupts
> +      - mboxes
> +      - label
> +      - qcom,remote-pid
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - iommus
> +  - interconnects
> +  - interrupts
> +  - interrupt-names
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - power-domain-names
> +  - resets
> +  - reset-names
> +  - qcom,halt-regs
> +  - qcom,ext-regs
> +  - qcom,qaccept-regs
> +  - memory-region
> +  - qcom,qmp

'qcom,qmp' is marked as 'optional' in qcom,q6v5.txt
