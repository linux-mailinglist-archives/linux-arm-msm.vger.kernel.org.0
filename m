Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8595464C4C1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Dec 2022 09:13:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbiLNINC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Dec 2022 03:13:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229797AbiLNIMK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Dec 2022 03:12:10 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FB3A257
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 00:11:49 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id n1so5881319ljg.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Dec 2022 00:11:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ip0serP3xmmQbIfs4fDtH7mgxkF1llT1RnwM7UmnRxc=;
        b=y9eh1KomaAEcgSF+zPUM9+IKthe5Z61BSrr2KkQzhUJ3CoMOAP2TBO5WaUqLUeuIBQ
         bmO6KPMtdivLDpVoN2F2ldk4lnU+hz/rSDhdR4xjnQDZ4UsM6imYDQ5zWaiONmIOR+g7
         AlFi51ewsRfZYiUvEirTK5cZ8VUG8rjfeXQbBi0MOOsxyG9xgRDpGN1ZAmtOhl5vUgwv
         cUqgGVQCop9Aoxq+hr3fOrGp8t9eI6O8r/9QnfNnvhyaObmgQo0vIGxcA4HYOHDW6qc8
         iWG/Y7M12pz+FaXCdeVXXDdra/X4WSOds7z519eSPFpZu3AFK4vDfEocMzyrDAmV7yeZ
         IE1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ip0serP3xmmQbIfs4fDtH7mgxkF1llT1RnwM7UmnRxc=;
        b=M9L0aQGno3XqVHtoHEWj4EaNbtU551AgJPuIatwFSD3vEOLHJEnwo/g9HNkZH4Kp+I
         gMUzD/tRCNY956DyWftNRvY6JfHpRDoZMJ+ON970QxS4+JWbtL4u7xDfDXMGWUxZsE/I
         GCbSup98IpmVVvacMWIJfsaYMUdrs4SX3FzrFOaTIzq6evIGJ4neWIA4DXMP/UBKkCN1
         ansA36nUQjt8UCA0KbikYFfZLyP/vzE2RKnTi8UzR90GTayW8X2nBStJPDoDl/R11cxB
         VNg2DCONtMfQIFk6hW5h7Yio9Kzo+qU5Oe1iasB3QcOqtzYY0UY8i5WkrD2SBuzJHaaC
         +h1Q==
X-Gm-Message-State: ANoB5pnzbXzZr+3WI+ZBM0j2MIzmtLgq3MmXhbtvLXWVdRAaCRTaaEVQ
        PXnNhfBytW/iMPQVfyRHCmFtBA==
X-Google-Smtp-Source: AA0mqf7MPF0BZwKj8sqR8TNQS+aLTPnWVDGKHcSD+DqGHkLhS9ezekrute2N8ZC+NaYodC1ke+k0MQ==
X-Received: by 2002:a2e:a4b4:0:b0:279:fb4d:34f5 with SMTP id g20-20020a2ea4b4000000b00279fb4d34f5mr5939057ljm.40.1671005507615;
        Wed, 14 Dec 2022 00:11:47 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u16-20020a2eb810000000b00277041268absm527879ljo.78.2022.12.14.00.11.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 00:11:47 -0800 (PST)
Message-ID: <e79ae240-95ce-1629-70f3-378d98f38841@linaro.org>
Date:   Wed, 14 Dec 2022 09:11:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/2] dt-bindings: reserved-memory: rmtfs: Document
 qcom,assign-to-nav
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221213170340.456252-1-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221213170340.456252-1-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/12/2022 18:03, Konrad Dybcio wrote:
> Some SoCs mandate that the RMTFS is also assigned to the NAV VM, while
> others really don't want that. Since it has to be conditional, add a
> bool property to toggle this behavior.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml  | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> index 2998f1c8f0db..1d8c4621178a 100644
> --- a/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> +++ b/Documentation/devicetree/bindings/reserved-memory/qcom,rmtfs-mem.yaml
> @@ -31,6 +31,11 @@ properties:
>      description: >
>        vmid of the remote processor, to set up memory protection
>  
> +  qcom,assign-to-nav:
> +    type: boolean
> +    description: >

No need for '>'

> +      whether to also assign the region to the NAV VM

Here and in property name you express desired Linux driver action, but
it is better to express the property of the hardware. What is
different/special in these SoCs or their configuration that additional
assignment is needed?


Best regards,
Krzysztof

