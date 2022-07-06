Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5D905681DD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Jul 2022 10:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbiGFIkS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 6 Jul 2022 04:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231972AbiGFIkR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 6 Jul 2022 04:40:17 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A5E124BD2
        for <linux-arm-msm@vger.kernel.org>; Wed,  6 Jul 2022 01:40:16 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id a11so17545312ljb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Jul 2022 01:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EPDGWxjHkiLvTKpkGZYqpWjQTMGKNy67XTcuvhsKylY=;
        b=QgMOTAKSzLCRavuQgr7uk4gk2JHGzn8G61ar6UOa7sUGC3MFVn1bprEfZ+ajbQ2yUT
         5T6PTL6on6cBLXmwiFrkayXWWzBds/7zgJLSldoBOopVReaAOf9oQH89A/Yflgi4vfBU
         N+cbW9+LTyZUGhVp6QnwVfW4aeK+LdWqjyXOReufRCo18JaqAMk1jnHhjJO2xGpM/K8S
         wOSJ4oP78+ZbGXQEY7Tu2EUEqBF+KMJ3aJ8l3DSinjY1vfKH3C7vz2yYPpVYbVW9AR0x
         3NjYBzLIZtpvRUH8hiJ2O/YTkfFxhvjALxKw+myCO+bo2Qehrm4nU2melFRPQOTYLJVh
         aXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=EPDGWxjHkiLvTKpkGZYqpWjQTMGKNy67XTcuvhsKylY=;
        b=mAhFCff002rK9RThOoMpFsLlV93q6S0St5/flAggBaA8LcxPdJ3LoThaYEsz1LeKOo
         0xXcDPr5KBFDzQZgRDV+xGs27+63pwjSvrpRRtVjSOfz8O7GNdXHHMr1j7dKqPgqe6RV
         0xkXi8KX5TFWU7qGDvPaPz48SysdP1naG1MhqBDXMlpXojQ8Vw2WO55B3iLPfE2Dz5Lt
         xXGMMdYpDs68kne7GD/4q1SvT9KgJHR1npAUItVNTZi4nSnMjMzbapZpMYr4GXcSkEHb
         Dq4bBp71IQ0j9Ol0Ckw82NeSOJLMmv6e0KNfsolPcQvzwe946Yk7fixx29uFaUPf4Z2X
         tGUg==
X-Gm-Message-State: AJIora/9zTjFWVgnhtiu/a9hVMv6bgAU6J5vQnD9T+np1ah0u5nnAReo
        Kq7cPZDGbN0sE+7f1pZKvN+dUw==
X-Google-Smtp-Source: AGRyM1sdArwVRs1xsNUv4tbO/d5iEzWULrQmVsbDzwfbJ4YW5eJ1pDK8mKOgwfwVxV0C2ALv0Ya1Hw==
X-Received: by 2002:a2e:9941:0:b0:25b:c885:3143 with SMTP id r1-20020a2e9941000000b0025bc8853143mr23568644ljj.477.1657096814748;
        Wed, 06 Jul 2022 01:40:14 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id v12-20020a056512096c00b004831cc659ffsm970840lft.125.2022.07.06.01.40.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 01:40:14 -0700 (PDT)
Message-ID: <40579546-bea8-b775-9719-d8ea7518e0a3@linaro.org>
Date:   Wed, 6 Jul 2022 10:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 11/13] ARM: dts: qcom: fix and add some missing gsbi node
 for ipq8064
Content-Language: en-US
To:     Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Jonathan McDowell <noodles@earth.li>
References: <20220705133917.8405-1-ansuelsmth@gmail.com>
 <20220705133917.8405-12-ansuelsmth@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705133917.8405-12-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/07/2022 15:39, Christian Marangi wrote:
> Add some tag for gsbi to make them usable for ipq8064 SoC. Add missing
> gsbi7 i2c node and gsbi1 node.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Jonathan McDowell <noodles@earth.li>
> ---
>  arch/arm/boot/dts/qcom-ipq8064.dtsi | 50 ++++++++++++++++++++++++++++-
>  1 file changed, 49 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq8064.dtsi b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> index ef8faee6dfd4..777851bed95a 100644
> --- a/arch/arm/boot/dts/qcom-ipq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq8064.dtsi
> @@ -548,6 +548,41 @@ sic_non_secure: sic-non-secure@12100000 {
>  			reg = <0x12100000 0x10000>;
>  		};
>  
> +		gsbi1: gsbi@12440000 {
> +			compatible = "qcom,gsbi-v1.0.0";

Order of properties is:
compatible
reg
...
...
status


Best regards,
Krzysztof
