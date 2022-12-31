Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8CF65A3CF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Dec 2022 12:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231645AbiLaLw3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 31 Dec 2022 06:52:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229484AbiLaLw2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 31 Dec 2022 06:52:28 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB2AC6255
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 03:52:26 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id z26so35013880lfu.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Dec 2022 03:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MHarb5qBqP/34YDMhNGK7NLtZwIukztPXRR+j94/5/U=;
        b=yEi6yjdcOM2oaFOHby85Ij5OrTu8kXGx5rjnbewvVZw0yaSyS/HU4iXiOHpyJi/NkW
         5b8GyJq67vTIPMJ1enq24fiocmddTz1IduySQmq0fMWMj/vTr+zB9j9lohvRGX2FYo1h
         xHDTgCJTnAnWibtZU6mrK51RnAJuVBXRAghKNjqOsgJSQzvWateuNqae1LiLTpebZ1P2
         oIB8kn2IDV50MZe3TMjqAaLoyD+w+t9DhCrTLKkVCd5gJeGs1W/XZyE8Brmnv2k8d23y
         ozHh92CnCzrTUWAyUhA39I/Mlhe+j3otzioRNkFynfs3bnpBMAJpegzDIs+6289Yd+BE
         2FLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MHarb5qBqP/34YDMhNGK7NLtZwIukztPXRR+j94/5/U=;
        b=heTb7ET4x4TNYZ+Yh1WKOtAwUh5yvbaqRBRTwp1j/rSoBMZ2OuNGFwNDiXlLrs6FDK
         D36MRJAAlUkAETf/qOEGUJSbJSvrtzLT1LglxgYoESGZnomUUPBllwdaDvynNhvyhefl
         6OFcpj3mrAu3w25Z9twb6KG/M9vNe7V7+OvinAAFe/nB0Rj8Q4BmhO7Jseg2qCJ0CKxF
         jIip1qNBX547Ekys52dPDHBf69rY6lZ0c8uLzbYsaEhUoWdCEJDV+ywcCWhqxQljcznH
         tTKjtjuYkIJ0ostkeJ5sWkXcYUHO1mb+uyTTaYZ12ROqc6ErcYNZAogF4BhnwrLfLly5
         43Lg==
X-Gm-Message-State: AFqh2kqLJNZik8os04HTEcbjajME6/NVboIw06jkSBXr2qaBuRKryXnn
        8PKuiwi7zan4BBIpbzLlpAPEzg==
X-Google-Smtp-Source: AMrXdXs/4HQg+1bf2eXZV3h5Ds5aDO5lW0koN4wBmqPjLkFp2P7ptEaP3oCWfqIwTMAWgl4thIL4GQ==
X-Received: by 2002:ac2:429a:0:b0:4b5:7aad:2690 with SMTP id m26-20020ac2429a000000b004b57aad2690mr9150150lfh.12.1672487545102;
        Sat, 31 Dec 2022 03:52:25 -0800 (PST)
Received: from [192.168.1.101] (abyl184.neoplus.adsl.tpnet.pl. [83.9.31.184])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512203000b004b4a0482a53sm3810221lfs.231.2022.12.31.03.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Dec 2022 03:52:24 -0800 (PST)
Message-ID: <4668dcdf-ac0b-750d-62a5-dda3ca6f4a96@linaro.org>
Date:   Sat, 31 Dec 2022 12:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/2] ARM: dts: qcom: use qcom,gsi-loader for IPA
To:     Alex Elder <elder@linaro.org>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, andersson@kernel.org,
        agross@kernel.org
Cc:     caleb.connolly@linaro.org, mka@chromium.org, evgreen@chromium.org,
        quic_cpratapa@quicinc.com, quic_avuyyuru@quicinc.com,
        quic_jponduru@quicinc.com, quic_subashab@quicinc.com,
        elder@kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221231002716.2367375-1-elder@linaro.org>
 <20221231002716.2367375-2-elder@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221231002716.2367375-2-elder@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.12.2022 01:27, Alex Elder wrote:
> Depending on the platform, either the modem or the AP must load GSI
> firmware for IPA before it can be used.  To date, this has been
> indicated by the presence or absence of a "modem-init" property.
> 
> That mechanism has been deprecated.  Instead, we indicate how GSI
> firmware should be loaded by the value of the "qcom,gsi-loader"
> property.
> 
> Update all ARM platforms that use IPA to use the "qcom,gsi-loader"
> property to specify how the GSI firmware is loaded.
> 
> Update the affected nodes so the status property is last.
> 
> Signed-off-by: Alex Elder <elder@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-sdx55-t55.dts             | 4 ++--
>  arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
> index 7ed8feb99afbe..61ac5f54cd57d 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-t55.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
> @@ -237,9 +237,9 @@ &blsp1_uart3 {
>  };
>  
>  &ipa {
> -	status = "okay";
> -
> +	qcom,gsi-loader = "self";
>  	memory-region = <&ipa_fw_mem>;
> +	status = "okay";
>  };
>  
>  &qpic_bam {
> diff --git a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> index ac8b4626ae9ac..c9c1f7da1261b 100644
> --- a/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> +++ b/arch/arm/boot/dts/qcom-sdx55-telit-fn980-tlb.dts
> @@ -237,9 +237,9 @@ &blsp1_uart3 {
>  };
>  
>  &ipa {
> -	status = "okay";
> -
> +	qcom,gsi-loader = "self";
>  	memory-region = <&ipa_fw_mem>;
> +	status = "okay";
>  };
>  
>  &pcie0_phy {
