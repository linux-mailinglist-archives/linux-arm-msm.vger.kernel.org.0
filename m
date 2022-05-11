Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C43C523C3D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 May 2022 20:11:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233707AbiEKSLP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 May 2022 14:11:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346112AbiEKSLA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 May 2022 14:11:00 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13A434990D
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:10:58 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id ks9so5697075ejb.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 May 2022 11:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GjjYuooaKya+XTIpInDzfIomDPRmOBZ3nIRxVyRuRmo=;
        b=eLdDCwkkAb6g4ZtEARDJ8k2Ft40ckz2IAfOuyfc6Q+rJRdlyaEznGMK50/phq7pgDV
         wUfjyH2B8QMa6rkhxRFz5mAFkUwd0b9pTVZ6sCSheq5yATBwbSRvs9WxZ3Y6MwVym3yy
         iEopFY/AAp26V8QZdyMr7dut8wevYCzPWACvShtvgdSNVYJFpnR+8RsqP930LBiEgQqb
         H1H5/UxoIe0n/8hk8LbC8g7txlJkrYcB8WYHKslelCbZQjsxD4uHLc0CyZ9bCGN9QcaO
         mcupuQvVdRIZGwsO7CkbQisMvjCKdCWddQzlLTyGnzpjy9HBSrqBuupEH2gCyN1eRqZ8
         Fx6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GjjYuooaKya+XTIpInDzfIomDPRmOBZ3nIRxVyRuRmo=;
        b=6vk6AQV9ejAJlGXVpYDtaulb7K5uGYL/cvnqwAxljiElja8Rpzpa4JYcVv5Tca3k+y
         XFAVRrKvFEid2nzUABDfO691i+xjogMjecNRlip3d5r8K1HGXG2oTOTrsUW9F4aGsXNf
         mHyCNnz38D4LPElk/lbLWAQX3vZ/jqOlkSAyEhYF8j6ChuX2FimAb3onLtOY4mzHQOtQ
         qfRf5dPm11oRex4cGJkbhJV1QF30/vpK/8H96CiZHwN+CEldgIJ8nTzVAoKMSHyRsvML
         5E5Ey6oklafR/4Vpqx3vMr8OU1QajkSGlDAGh2dPb4jyOPCXGAfA/ECLz45WYTTldVMn
         KVrw==
X-Gm-Message-State: AOAM531sTntG915+Rg6uJSNVe820TIOH0iGAxRg+pKU0G6QhomliNptE
        DNIbkNYWrQhJNtBd9C42cPEHew==
X-Google-Smtp-Source: ABdhPJxx/DhDAyNRqeQt+gY3Wwf1d8tJBEMAku8H+VAYapdnldKRdJVR/jrdrKNwIjG1clAdybatiA==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id jg9-20020a170907970900b006fdc0e1c86bmr7197430ejc.600.1652292656613;
        Wed, 11 May 2022 11:10:56 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id g13-20020aa7c84d000000b0042617ba63b8sm1527196edt.66.2022.05.11.11.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 11:10:56 -0700 (PDT)
Message-ID: <436e497f-b43c-4543-62d4-e7aea3d37ac7@linaro.org>
Date:   Wed, 11 May 2022 20:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3 2/2] dt-bindings: remoteproc: qcom: Add SC7280 MSS
 bindings
Content-Language: en-US
To:     Sibi Sankar <quic_sibis@quicinc.com>, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, Sireesh Kodali <sireeshkodali1@gmail.com>
Cc:     ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org,
        krzysztof.kozlowski+dt@linaro.org
References: <1652257162-23874-1-git-send-email-quic_sibis@quicinc.com>
 <1652257162-23874-3-git-send-email-quic_sibis@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1652257162-23874-3-git-send-email-quic_sibis@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/05/2022 10:19, Sibi Sankar wrote:
> Add MSS PIL loading bindings for SC7280 SoCs.

Why not converting existing bindings? The compatible is already there,
so you duplicated its binding.

> 
> Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
> ---
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

s/This document defines the binding for//
Instead describe the hardware.


Anyway, similar patch was already sent:
https://lore.kernel.org/all/20220511161602.117772-7-sireeshkodali1@gmail.com/
Except its several issues, it is much more complete and specific.

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

This should be defined by core schema and ref should not be needed.

> +    description: Phandle reference to the reserved-memory for the MBA region followed
> +                 by the modem region.

maxItems

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

For some reason you decided to make the same mistakes as the
https://lore.kernel.org/all/20220511161602.117772-7-sireeshkodali1@gmail.com/

even though all other bindings with this property looks correct.

Please, re-use existing bindings, do not reinvent things in incorrect way.

I'll stop the review, you need to align first.

What is weird, your v2 was before Sireesh's patch, and you both made the
same mistakes which do not exist in current bindings.

All comments from his set apply here. It seems that his patchset came
after yours and copied stuff from your bindings, so yours would be FIFO,
if you made proper binding conversion.

Best regards,
Krzysztof
