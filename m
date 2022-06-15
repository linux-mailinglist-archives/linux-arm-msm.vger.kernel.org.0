Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9F7654D344
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 23:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344070AbiFOVFR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 17:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344717AbiFOVFQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 17:05:16 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1AF22E9CE
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:05:15 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id hv24-20020a17090ae41800b001e33eebdb5dso4260508pjb.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 14:05:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=nSPGzfTdZ9LfoOSqIU6EOVEMTSn+8rXd/OcMmHhdRhA=;
        b=SOMOfzNOEUkBuuBnOrR5RTa6rJffV6+Ngvrq9Yo+bQvLfiiuKPusw6MyqE2JjFK791
         cu/E/2IDmPD/mfDAsU0A+uJvql58unDxr1ovqwFEfTHzBoULxjdbACa2fl0KBjXJVZP8
         1wiGEJRBTny54swVMGmUotUJuI6S2TnDHt4lRZvq1V77GQoPYQD6iRdiPLvtMGoQSHUO
         jC5BCI5T+P+2UwY5eBkJnOTZKmp8UaiZ/0mn1Fjp6JkJT98uQIG+pXXcejb4Od6y1+Q2
         W4ZK+y7h+roufFwASTDkiZPldmpc9fW3WmW0v31OUBYpSvLixEdF80nsWaQUmwdGe/VC
         C1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nSPGzfTdZ9LfoOSqIU6EOVEMTSn+8rXd/OcMmHhdRhA=;
        b=C0lSn8EZ53VINhTRSnxfu1Ias40C+GdjZeScREkB9p1WTRfOP8XGXfeQoZab8ZnQ2/
         UA9qytB8cvxM9Y+OtVWyMr3xhYyXw7amYfsYGrKeEpaHJlAn385TYsYCiL2KJpk8qC0B
         FcE3W3fmjsi4qhYtDyNWc028KppKGCW3s+M0/TYd2eTUEwduFI2NeFSVOAph9FdIo0A5
         4GkMpSMvZvWaSwZ3x92NRGjd2OnJbQsfPIfbsLF8TYGn9OGmdoU5+WWqnF7Bx4QziwfJ
         9bViuKtNrwlpGhlzBwA7X6krpge8AhdNwQgFoinE3gAsN++HMy7uHmDUobSl5S5bkJR3
         DTMA==
X-Gm-Message-State: AJIora/TfycB9rSxAQiP6lrhTPYz3EtwKmrBI5ssLfQX+qxPtkjUx8fJ
        4tQx4wFoH3CergcB6avnw2sdqg==
X-Google-Smtp-Source: AGRyM1toehBrqqaMQr374mrNlBFnfbhQiBAgvhLstQXz4lea94d8XdLlbwxJ4Mn+NBAsGnu054oJHA==
X-Received: by 2002:a17:902:d2c9:b0:167:1195:3a41 with SMTP id n9-20020a170902d2c900b0016711953a41mr1424179plc.126.1655327115240;
        Wed, 15 Jun 2022 14:05:15 -0700 (PDT)
Received: from [172.22.33.138] ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id w9-20020a17090a780900b001ead46e77e2sm39944pjk.13.2022.06.15.14.05.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 14:05:14 -0700 (PDT)
Message-ID: <7cc9c5d2-0c42-f24f-1611-0190b24504be@linaro.org>
Date:   Wed, 15 Jun 2022 14:05:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] dt-bindings: dma: rework qcom,adm Documentation to yaml
 schema
Content-Language: en-US
To:     Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220615175043.20166-1-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220615175043.20166-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2022 10:50, Christian 'Ansuel' Marangi wrote:
> Rework the qcom,adm Documentation to yaml schema.
> This is not a pure conversion since originally the driver has changed
> implementation for the #dma-cells and was wrong from the start.
> Also the driver now handles the common DMA clients implementation with
> the first cell that denotes the channel number and nothing else since
> the client will have to provide the crci information via other means.
> 
> Signed-off-by: Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>

Drop the quotes please.

As discussed in other patch - trust for me is broken and I have no clue
which identity is real.

> ---
>  .../devicetree/bindings/dma/qcom,adm.yaml     | 95 +++++++++++++++++++
>  .../devicetree/bindings/dma/qcom_adm.txt      | 61 ------------
>  2 files changed, 95 insertions(+), 61 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/qcom,adm.yaml
>  delete mode 100644 Documentation/devicetree/bindings/dma/qcom_adm.txt
> 
> diff --git a/Documentation/devicetree/bindings/dma/qcom,adm.yaml b/Documentation/devicetree/bindings/dma/qcom,adm.yaml
> new file mode 100644
> index 000000000000..77096a7c9405
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/qcom,adm.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/qcom,adm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm ADM DMA Controller
> +
> +maintainers:
> +  - Christian 'Ansuel' Marangi <ansuelsmth@gmail.com>

Add Bjorn here.

> +


Best regards,
Krzysztof
