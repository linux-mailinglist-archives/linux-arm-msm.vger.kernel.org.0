Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9C936B16C6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 00:47:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229835AbjCHXro (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 18:47:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229572AbjCHXrn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 18:47:43 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27E53C0811
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 15:47:41 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id n2so98667lfb.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 15:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678319259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M4O4DInYmnmPW3qkpEVN6D/y/D8gTnxRIuiXa1zYY4g=;
        b=Uhrm33GLaIYiCIZB9lN3Hf7FHypuIe+bmVAXfcWDczO4QEFK511YiTw3Wn2dK2+AlN
         Cs4kgHdnR5pQ49LrwqL8pH05iHknmkA8/m83rs9J6DwUsCLzAfnHu4ta4v+Bq2aRSPG3
         7kjWLxDyQsT7HCmdOT4S7gqmfwySu9DtOJyC9DtVqT5u0ThgRC12FLV2UfBaaThQ1uMf
         xFhne9O0JFfmtXLfapiCI7TYZujGmz370f6LmOkCfYt03cE+4g3JrAt6WB1qR3izmox9
         OglFM75ZCRukJI+MXt2t8xAyLALliEri1FClEocF8P2IN3xPcs1D/V1oOwbuiGyP7fwQ
         iTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678319259;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M4O4DInYmnmPW3qkpEVN6D/y/D8gTnxRIuiXa1zYY4g=;
        b=aqLBARqqh8tgCT9DUUSk7/YVbhRnPRKiJyRUzLbJsWHLG3eaDUKcouWKFEfw6c1CND
         +jE+US/vPBj2vRerh9jzAFJK1W43lrjJQWKl9BqjjSaJFgH9F1A7Ydpg5Na22hm4PJQ0
         ldcoyJqXa1Krf+Z8+QRhcpj1UBLlPch+YKCQ/B98cSGMnOESilndiZTfYOq0PoMqe7JI
         lr4i+/U1Oqd3dU4URuyxv/3rGC2+LJqxdRqaMNzsN5cfufQS86u5BirOTH+gh3b78xj8
         b34qCiNz4c4YaQAV+kC+iJ7Yqi9o+dVTjs0IS3R1SVv5wb1yHsHd9omPh5HaDqgC0bf3
         1chQ==
X-Gm-Message-State: AO0yUKUpWfMyUVHQOJQqvZ6ZsiOpRNWJoC3hLH71yrhiMu8UA2L5Ej+U
        F7F2vbcp/5LpO6RnZhPtREdn5w==
X-Google-Smtp-Source: AK7set8SlhE25hMC6moDgRT3PPDqoQqG0ViLSQNOii7VJ8vKJE/dbOEejcP2OGn2P3LQoGPCFNYwpQ==
X-Received: by 2002:ac2:4462:0:b0:4b5:8f03:a2bc with SMTP id y2-20020ac24462000000b004b58f03a2bcmr5360447lfl.9.1678319259415;
        Wed, 08 Mar 2023 15:47:39 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id d3-20020ac25ec3000000b004db9dbe09c6sm2474998lfq.89.2023.03.08.15.47.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 15:47:38 -0800 (PST)
Message-ID: <17ac3a17-7e54-991d-3f6e-e6cee7348ba6@linaro.org>
Date:   Thu, 9 Mar 2023 00:47:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] ARM: dts: qcom: apq8026-lg-lenok: add missing reserved
 memory
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308-lenok-reserved-memory-v1-1-b8bf6ff01207@z3ntu.xyz>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-lenok-reserved-memory-v1-1-b8bf6ff01207@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 22:06, Luca Weiss wrote:
> Turns out these two memory regions also need to be avoided, otherwise
> weird things will happen when Linux tries to use this memory.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
> index de2fb1c01b6e3..b82381229adf6 100644
> --- a/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
> +++ b/arch/arm/boot/dts/qcom-apq8026-lg-lenok.dts
> @@ -27,6 +27,16 @@ chosen {
>  	};
>  
>  	reserved-memory {
> +		sbl_region: sbl@2f00000 {
oh that must have been fun


Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +			reg = <0x02f00000 0x100000>;
> +			no-map;
> +		};
> +
> +		external_image_region: external-image@3100000 {
> +			reg = <0x03100000 0x200000>;
> +			no-map;
> +		};
> +
>  		adsp_region: adsp@3300000 {
>  			reg = <0x03300000 0x1400000>;
>  			no-map;
> 
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230308-lenok-reserved-memory-b9373f9c8993
> 
> Best regards,
