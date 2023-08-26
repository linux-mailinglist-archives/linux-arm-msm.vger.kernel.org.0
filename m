Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9242F7894F5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Aug 2023 11:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230356AbjHZJBQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Aug 2023 05:01:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232164AbjHZJAz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Aug 2023 05:00:55 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D0E1FC3
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 02:00:52 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4ffae5bdc9aso2599183e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Aug 2023 02:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693040451; x=1693645251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2PVHdF5K8sQB30tpr75UVijtOECWvoKIlQGOrzlZj/Q=;
        b=lpLzPGJ63lfL/s86yYdo8+HBzxaQd2aZrfCPIVhc/eFJPK3Rn9VLOQF9TwRcaBClyF
         qjL3yVHna+146hRVkwz+2y892sURpTK2J02Y8y2MkY74+UqhzdMo97jIrL9WgU/YH+M2
         bsOmt/VVSBzsn9sHBFRQhLe8P8HT8gzU1ve6QeUSQd0NNbfgKZ9FSwk/MYjpmSaP8qk9
         4uw3gQ+Pq9yDr5q4VMz6twxrLOyhPWZkWuG2/DwKYg+EFYe/iFnPh7T2Ee+sb/bsWCh7
         pLpTOgTgeVhm4H6+1/0BhFOMSoIhL4qvBSfAqMnGFUGoVTeYrkni38iYsnetcYOTo1dT
         nh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693040451; x=1693645251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2PVHdF5K8sQB30tpr75UVijtOECWvoKIlQGOrzlZj/Q=;
        b=HED7fZ5A18BqMOkl9jahD+AzJfSCLC/BMCz0JkFV8yAWuDPFEG7d3ms73DGmi8XKg9
         wZEOwbJQYKOL4OK4CVOuKnPnUZFbfyRTxce/Z7/pk8wDHT1Tqe2hN4CutZwhkKHcetSb
         Qw31cQnqpJCW4PVzhl7WZR5rN/sXEwgjjryjRqTU2ECA16eZXAzFFIvKBagW0aoA3p+8
         6u6CNtYARuu5mERT6c+4ocOPoMsRsuPxdjiDoWjC9U347yeLpwIXQyMmscSjyzg3ULUp
         eMAw/cxE+z95xmNprMh9qCw1zlleVjr5ygeBA1lne55a19KkkgsvTODoEITtko5JQkCq
         rnow==
X-Gm-Message-State: AOJu0Yy5ST6DNEPgMq/6HGJVY7/h3Yx/Ec5t75O6TWbUcMubrN8iW/JR
        jkgUEh8nUkjqvXZV4fjTBstFcg==
X-Google-Smtp-Source: AGHT+IGcVrb06QYJ47Au3vC/uxhk76UuhJcWjWN1Kw+o0a530IYWinY6p/JAOVXyaUofFx2+Ey6R7w==
X-Received: by 2002:a05:6512:1584:b0:4f8:711b:18b0 with SMTP id bp4-20020a056512158400b004f8711b18b0mr17352466lfb.3.1693040450934;
        Sat, 26 Aug 2023 02:00:50 -0700 (PDT)
Received: from [192.168.1.101] (abyl74.neoplus.adsl.tpnet.pl. [83.9.31.74])
        by smtp.gmail.com with ESMTPSA id h20-20020a197014000000b004f864690901sm635184lfc.244.2023.08.26.02.00.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Aug 2023 02:00:50 -0700 (PDT)
Message-ID: <3bfc87d0-2d68-47e2-969f-28300afa7dfa@linaro.org>
Date:   Sat, 26 Aug 2023 11:00:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm845-mtp: switch to mbn firmware
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230825220854.1655162-1-dmitry.baryshkov@linaro.org>
 <20230825220854.1655162-3-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230825220854.1655162-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 26.08.2023 00:08, Dmitry Baryshkov wrote:
> We have switched most of devices to use mbn (squashed) firmware files
> instead of spit mdt+bNN. Even this DT uses modem.mbn and a630_zap.mbn.
> Let's switch adsp and cdsp firmware files to use .mbn format too.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Looks like 845 was mbn from the start

https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/log/qcom/sdm845?qt=grep&q=
>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 56f5bf52d9bd..7579ba66c6d8 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -114,7 +114,7 @@ trip-point {
>  
>  &adsp_pas {
>  	status = "okay";
> -	firmware-name = "qcom/sdm845/adsp.mdt";
> +	firmware-name = "qcom/sdm845/adsp.mbn";
>  };
>  
>  &apps_rsc {
> @@ -415,7 +415,7 @@ vreg_s3c_0p6: smps3 {
>  
>  &cdsp_pas {
>  	status = "okay";
> -	firmware-name = "qcom/sdm845/cdsp.mdt";
> +	firmware-name = "qcom/sdm845/cdsp.mbn";
>  };
>  
>  &gcc {
