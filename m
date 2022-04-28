Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A85DC512BED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Apr 2022 08:51:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244475AbiD1Gw4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Apr 2022 02:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244019AbiD1Gw4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Apr 2022 02:52:56 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62530985B2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 23:49:42 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id l7so7630947ejn.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 23:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0oqHpJg2cLzeZdnyUgEioYwr2Elv4tK4koYun3ldTLg=;
        b=eXItrn2OU2AmdngGOLZiy2Icklw+M9+AgUxk8DIq/wuut1ipjlK7FUFgXeQNzRSObw
         hi/7hCpukEXhpfvr9AsfQGY0eqHLyZ32HUIZiNfzz2kzod9mpEnx71OB3/CuuMQdrJKA
         dAM7+J8CPchz4RiVfhkib1BdJdeyKVwI1xcYcC4XV5O2pHg2DFLVsG3ikx0YA6aHbi3y
         FEWjiyeONhNnaCMYu3VLTjPvBitJhGOrBXf1JrsEzLWBT5EVbLeNMn0tK6AWta3zm2xE
         LkeojgfkER+edmIUY5M9ybfcJCNbuQpHIDXFPVzpKOXU4mSNaz0YFrjwmwEoEAMFQow0
         /c0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0oqHpJg2cLzeZdnyUgEioYwr2Elv4tK4koYun3ldTLg=;
        b=C6GLX2iPoWyMTc3KGCx2ZY1owxxlUP/H+vyBBvMBSRcOIGjIWY16t+6Wzueyq1/7us
         sLVeV0qPhxwSTi3YN17ZzS2kZGQHsYOJPK1bX6WgLytZsx9e/7cbsxTaAWZ+LRgJEnMo
         at5A4O7kWSP9VmYp8+KqcgXxAcHuiTrYVbghScQQJzbHCtcx9bEtahs8TgwefI+jB0cX
         Hwa3JwDkm5GAu6IYz30gngJKEuJA+99ki1AZJTMCvzRby1NIDb8eJ9NHrtiXaN/R+69q
         N0f41Ok0om+edHn40jLW7PAdvXhGU1QgLRPWB63Zbw7pHjaKAtEmOfQSFCnjyoMHb3yY
         YUiA==
X-Gm-Message-State: AOAM53355ox2sqK0xsFFqslM7+u1AzN2dBSzD1O89cJngMJUwV2LEtN5
        hRHtk6pJVOw5u6shilJfQFWUVg==
X-Google-Smtp-Source: ABdhPJzvIPdv11NF3KnCJxQlhxsCp9ZwZ2BaV4Z4RCSByZ+dEKIiXe8ylO0IZl9d5KNXpuAj+rcsPg==
X-Received: by 2002:a17:907:3e8b:b0:6ef:a120:4ea6 with SMTP id hs11-20020a1709073e8b00b006efa1204ea6mr30533414ejc.607.1651128580958;
        Wed, 27 Apr 2022 23:49:40 -0700 (PDT)
Received: from [192.168.0.159] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q8-20020aa7cc08000000b0042617ba637esm994220edt.8.2022.04.27.23.49.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 23:49:40 -0700 (PDT)
Message-ID: <192d76cd-1d4c-c11a-874e-543e86cd7b64@linaro.org>
Date:   Thu, 28 Apr 2022 08:49:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 6/6] dt-bindings: power: supply: qcom,pmi8998-charger: add
 bindings for smb2 driver
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20220427184031.2569442-1-caleb.connolly@linaro.org>
 <20220427184031.2569442-7-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220427184031.2569442-7-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27/04/2022 20:40, Caleb Connolly wrote:
> Add devicetree bindings for the Qualcomm PMI8998/PM660 SMB2 charger
> driver.
> 
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>

This should be a v2, because you already sent a patchset. You make it
for example with:

`git format-patch -6 -v2`

and add changelog to cover-letter (which actually you did...).

> ---
>  .../power/supply/qcom,pmi8998-charger.yaml    | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> 
> diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> new file mode 100644
> index 000000000000..41b471713364
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/supply/qcom,pmi8998-charger.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm PMI8998/PM660 Switch-Mode Battery Charger "2"
> +
> +maintainers:
> +  - Caleb Connolly <caleb.connolly@linaro.org>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,pmi8998-charger
> +      - qcom,pm660-charger
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 4
> +    maxItems: 4

No need for minItems if it is equal to max. Skip the minItems, please.

Best regards,
Krzysztof
