Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC8445AD7CC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Sep 2022 18:46:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236506AbiIEQqK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Sep 2022 12:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237403AbiIEQpw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Sep 2022 12:45:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC7261D5C
        for <linux-arm-msm@vger.kernel.org>; Mon,  5 Sep 2022 09:45:40 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id bq23so13827559lfb.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Sep 2022 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=OlUT4VdL+//Vhfi8q6/DNyDdCq5azFht1vrO2HgtYLE=;
        b=CQBnZEjL7WB8lSHzHSoMLBLX1voBnKHff+0cjJz47KCq6VWU4bnBJU+M75So2ExRuJ
         NqQIWdxrqOddIBiioPPV9pRU8iX+7uaJKIyyzPHG54SWRbIsF3nQyo0Gf5PYWhjTUW9h
         tQstS7iyOT9jCL8qi+O3atgA5Lr407JlTYKFK70GXbe+slSvtMVWnHHWQgYWwnH12NCz
         9UFNHewZTmYPF8T9wkGjAtJc5HQiPVSrr1EJ47ZbysUP0vicqmnjkgBTt7Jch9sOCXjl
         4tu7D5G0tLhaMk8ya24YfGQ8UhAf7cYWFLw/4b6NXw+OThKvWHYttdMUYKBH/myQrUVo
         1EKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=OlUT4VdL+//Vhfi8q6/DNyDdCq5azFht1vrO2HgtYLE=;
        b=li4ZApV2WzpK/4GbUdOtDftnAVlUUA8uhC3QOzHcxF3XeZOqJpnLfkOqd8auiBl5/1
         t/R0vp9+8nQbaAzct9y83t9M9m5as7c8QGNpLhQ9wBwG28swbpmuesemanrX201cgI3t
         DEfWUoOD8XvIb3hIwtoCRY9jhVLm+TlWbtnzZKZA2NsFdAYPAoBgV33Bg6cOxIJvQgcO
         RcFHyR23m5YIdIQZ2O/2A/x7E61symwHBCaMnwSG+2/JNFAlwEScDeB19+noqbzemVMb
         O70KdB0tIcV5wPDjnYhBkY9n14m7UAs/upS4Gc34tKKoSw/VZN9GgqZXZF7H5WZFi5MD
         JxjQ==
X-Gm-Message-State: ACgBeo0ipq3FGSQ3l23EC9tzGQkAQyH+3u/IVvn+gYNOH5zcVXLeMwYc
        J9lOjuEAKMX4Os0AgwoE5LncyA==
X-Google-Smtp-Source: AA6agR4UevrG27Uu49Q/jGiyg03BymCordDnWhyqLd9fYgY59+36kp0qXQCJZJTC7NbuyrZh05j3ZA==
X-Received: by 2002:a05:6512:3281:b0:496:f9b5:eb55 with SMTP id p1-20020a056512328100b00496f9b5eb55mr5833lfe.279.1662396339100;
        Mon, 05 Sep 2022 09:45:39 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z4-20020ac24f84000000b0048cc076a03dsm1237973lfs.237.2022.09.05.09.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 09:45:38 -0700 (PDT)
Message-ID: <33c19838-2e44-2164-11c7-b14be5908809@linaro.org>
Date:   Mon, 5 Sep 2022 18:45:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/3] regulator: dt-bindings: qcom,rpmh: Use
 additionalProperties
Content-Language: en-US
To:     Andrew Halaney <ahalaney@redhat.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@somainline.org,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, dianders@chromium.org, johan@kernel.org
References: <20220902185148.635292-1-ahalaney@redhat.com>
 <20220902185148.635292-2-ahalaney@redhat.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220902185148.635292-2-ahalaney@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/09/2022 20:51, Andrew Halaney wrote:
> Right now, running make dt_binding_check results in this snippet:
> 
>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: 'additionalProperties' is a required property
>             hint: A schema without a "$ref" to another schema must define all properties and use "additionalProperties"
>             from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>     <snip..>
>     /mnt/extrassd/git/linux-next/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml: ignoring, error in schema:
> 
> Which results in the schema not being properly evaluated. Swap out
> unevaluatedProperties which doesn't seem to be doing anything for
> additionalProperties.

unevaluatedProperties were required due to usage of defs-allOf
(ba5d99609a5e ("regulator: dt-bindings: qcom,rpmh: document supplies per
variant")
).

Are you sure that it works correctly with additionalProperties?

Judging by errors it doesn't....

> 
> Signed-off-by: Andrew Halaney <ahalaney@redhat.com>
> ---
>  .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> index 9a36bee750af..b3fd60b21610 100644
> --- a/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> +++ b/Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> @@ -106,6 +106,8 @@ patternProperties:
>      $ref: "regulator.yaml#"
>      description: smps/ldo regulator nodes(s).
>  
> +additionalProperties: false
> +

Don't move the location. The proper one is above examples.

Best regards,
Krzysztof
