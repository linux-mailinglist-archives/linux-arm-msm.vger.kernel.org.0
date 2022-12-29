Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44A98658AA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Dec 2022 09:45:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233170AbiL2Ipj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Dec 2022 03:45:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbiL2Ipi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Dec 2022 03:45:38 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C34F81007E
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 00:45:37 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id u12so15090292ljj.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Dec 2022 00:45:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhhThnTcIHOOnU4TldxJQBEXkc0+gKJ8zUJ0NnzGF8w=;
        b=iACwngYUW2NO/QI//cidNjkSY6IR2L6BvEIVEAFyQl0zymVU79PvIQBgWY/D0yoIUe
         YHYOZTLiJ7al8Uhw/p2hy2ex26ZQnXD1iiHLEMEy/hmj2+NQkBlLigPtVAD5NOdvtBNG
         VB9oL/XGZGiX6MdxU6BF4B/vso6HnrBhOFK0LTJ2IU4eG1qzFOnPxH0CnEgkjSk25GWY
         erPOj9vqGBiDKUC3d6OSvczpyfB50aIKlVfZsPIS+3aacZswA4WH+wmEjE6LLUzGK0sU
         gNVQqSd9DluhlXf1dt1jNqWOSgx8UvUegBW+Ws2oTxsEANYuMcCmMHAL7erVaeoRj7th
         KLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhhThnTcIHOOnU4TldxJQBEXkc0+gKJ8zUJ0NnzGF8w=;
        b=JazV74wznofuX5YgdBJvFO71SY2hu/zHalGhX3E4Jj+Wz1Bj9US9PyKDugKK6iDr35
         IZJ59RdaBHxLNgQ+5boLEXYmlKtcuLQX9/1l5iI33uyVwj+q07UDkag6oF1dtkxRnji9
         K7yjQQwVy4cwsW5+TOAlE4PUSo8M/RPhTK4oGHvT4xWv/JKlQXXqPGxgA1l0wEzgJwYf
         rSba/Mf0Ha4AP7Rf3ltyzrZCeMq/wHZgisYaUOtVz8G82Di3Z+59XPmV+9/zP8YIdXLv
         qZekIfZ+Us3aSMxGKuT4i3jaGC0AC5ce7UfkGtoGMuSeMFcQpC4pbizyt2bV9Qh5Av4E
         woPw==
X-Gm-Message-State: AFqh2krM0aR3K/pWUKMlyFv0t8oG4sGW9Zb8Cv+BYbWjv7Kjlz6IHU2m
        Id4Bp4zEqB/EQNNTgEY+5aoang==
X-Google-Smtp-Source: AMrXdXutjgkEHkED1oh840UWFw8WlnqcYr1SfxtSQLUXyecp3Hg4fP6tMrLui8h4uuPLKErhi1FUEw==
X-Received: by 2002:a2e:92c3:0:b0:27a:1860:eb86 with SMTP id k3-20020a2e92c3000000b0027a1860eb86mr7218840ljh.31.1672303536156;
        Thu, 29 Dec 2022 00:45:36 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p7-20020a2ea4c7000000b0027fc5d5dbb5sm1018709ljm.77.2022.12.29.00.45.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 00:45:35 -0800 (PST)
Message-ID: <da10e351-1f22-9583-5f0a-ae7db060cf0b@linaro.org>
Date:   Thu, 29 Dec 2022 09:45:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: qcom,pcie2-phy: convert to YAML
 format
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221226031059.2563165-1-dmitry.baryshkov@linaro.org>
 <20221226031059.2563165-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221226031059.2563165-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26/12/2022 04:10, Dmitry Baryshkov wrote:
> Convert the bindings for the Qualcomm PCIe2 PHY into the YAML format
> from the text description.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,pcie2-phy.yaml          | 87 +++++++++++++++++++
>  .../bindings/phy/qcom-pcie2-phy.txt           | 42 ---------
>  2 files changed, 87 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/qcom-pcie2-phy.txt
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
> new file mode 100644
> index 000000000000..672035199c19
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/qcom,pcie2-phy.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +

Drop the blank line.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/qcom,pcie2-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#

Best regards,
Krzysztof

