Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 62B9C6DD87C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 12:59:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjDKK7v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 06:59:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjDKK7t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 06:59:49 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFE14E5F
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 03:59:48 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id b6so32563006ljr.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 03:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681210787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yrTld5NLNAmdiaxrrdDy5rCLJ3L2JAMQPvjUBqo39+I=;
        b=PP8BwaNogG1GPjrkKfSc/gZjIo1b4HwRfZHcNhnm/dMuBUsw9hT4OlMTa/7KFhcVzl
         dCFIZ8fGuMWQf5hb0aursuBK2VGmCr/F8Z875MU3DqaLdD/+2dTWqYbWpo0tN23+vV1d
         x35zI2s3MrOElO686W0cYJVJgx+4dQaGEMx9DCA+dj/PTibcB8pxLyAy3k+Bc6L8LqVf
         bMq5o0d9mutohaa4W7J+GZOnY+Fl9qP8VY4YmGJ/x8ynjYHuJo0u+L7iYjmgPua8/TNm
         sofXfMxg2h8qZJEL59xy8/YVjgd3pHb2LBEshHtiRGtaIwETXBF9+FT+/eolHTpCuTu4
         BpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681210787;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yrTld5NLNAmdiaxrrdDy5rCLJ3L2JAMQPvjUBqo39+I=;
        b=FdK9KbJTUXc4/50neLt0oRePav8T7lQHhHTcmS6a8M+dgQDh89e+fhKI/tJCdfEXRx
         cnZLRbRpICAGShIWTAk9N3m/MgiQSjgmcaKptydEvCk3N4wKmuiQkR5c+TuAfXN+I1P8
         WMpB23tzrMFaWrFSMXTdTehh6WzQr2yOKIrKj3Cf/KLvvmxZLldjnQiXmZ+CrmtaDLLW
         17gr2kZpg8wPu2HYcdrA8MGen5mWh+0W2V/ar9QEIx1i3gUecZUq5/nOP5KCOo7+5/oS
         HVjvRsqrBXBfMK+8jYNdrJeOnauXfj4YyeGshE3Zqm5iknAUpnxEfbADehuvEBg7av9O
         zM1Q==
X-Gm-Message-State: AAQBX9fcINVUnrIOGg1Bv6Q6YiAmpYVSZzQDI3MuoWZT4tNWRKLVIIKT
        yUrNgK851EdRDVGm9HK5U7FJpT10pNjvbVRucqs=
X-Google-Smtp-Source: AKy350ZElygllGg2m8OodX4hv2rk098Cc3QQqaj8sZ/nX9YhAgCI+v3KnZ6Qo4XAIzGYt3lcS/5mBw==
X-Received: by 2002:a2e:82ce:0:b0:295:d7a8:559b with SMTP id n14-20020a2e82ce000000b00295d7a8559bmr4288249ljh.10.1681210787108;
        Tue, 11 Apr 2023 03:59:47 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id e14-20020a2e984e000000b002a7899eaf9csm384366ljj.63.2023.04.11.03.59.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 03:59:46 -0700 (PDT)
Message-ID: <bb45f2ab-8af1-c9a3-a93a-8406f6b311a3@linaro.org>
Date:   Tue, 11 Apr 2023 12:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] arm64: dts: qcom: pm8998: don't use GIC_SPI for SPMI
 interrupts
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230409182145.122895-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230409182145.122895-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.04.2023 20:21, Dmitry Baryshkov wrote:
> Unlike typical GIC interrupts, first cell for SPMI interrupts is the
> USID rather than GIC_SPI/GIC_PPI/GIC_LPI qualifier. Fix the resin
> interrupt to use USID value 0x0 rather than GIC_SPI define.
> 
> Fixes: f86ae6f23a9e ("arm64: dts: qcom: sagit: add initial device tree for sagit")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/pm8998.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8998.dtsi b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> index adbba9f4089a..13925ac44669 100644
> --- a/arch/arm64/boot/dts/qcom/pm8998.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8998.dtsi
> @@ -55,7 +55,7 @@ pm8998_pwrkey: pwrkey {
>  
>  			pm8998_resin: resin {
>  				compatible = "qcom,pm8941-resin";
> -				interrupts = <GIC_SPI 0x8 1 IRQ_TYPE_EDGE_BOTH>;
> +				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
>  				debounce = <15625>;
>  				bias-pull-up;
>  				status = "disabled";
