Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9605D5F2BE2
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Oct 2022 10:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232018AbiJCIdw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Oct 2022 04:33:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiJCIdN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Oct 2022 04:33:13 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1CE6919C
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Oct 2022 01:05:19 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bk15so15454880wrb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Oct 2022 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=gN6eBgvZPJathSAOh+PX4u7sh5/2KXHV1ko+bwpxMT8=;
        b=daAjyaeHDs+wFTCOOcJk66EZw8ezYF0CSa6PsjVPPib+6zuPHB+40FhfzlQMyKSosS
         A2Ui2tP5nKdbbZN06ihokVPHgYVVyO0PBwJtTwaSouPIHJMKGrppVGmAnfG6oj5VaEDG
         7fEUpzZShk0YsGz4oWexxhMeDh3j4U9nuJA8VrJhUj+9yE6xx6kvOetmFjv8ob2g2iSp
         PqNdmnlR6oYNiFtuDoYnSUjtKspQJrGhwlwSjdv7rAXfgZ4LwvVIgPkqJ+dBSrnPz/8b
         7nO3JPwNRs8P235E5hZyDBu/9EsFgpdk0SKBn4hzRNa9Qc1ZdwLSnMc+Bbi7ntGHP/UB
         vEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=gN6eBgvZPJathSAOh+PX4u7sh5/2KXHV1ko+bwpxMT8=;
        b=YFxkckINeXJtMShYvHIJYhslDzi+Q26bkz2x961eU3XI+znUg1qxVdMCUnFRweGpQc
         MRwGmFE8cWGvaH88WVXBuN3DqHzok0rsG87Pi3s9rkWfq4qbZbJGZd+ETJvq27oIsZ0H
         ZJ3DTHtwkFyXNQDui30Y9+1IWy/Cok9lTVaL72UFQpOmMskglfS/5CV22QGoS3vCc3ik
         v6qWzQYHfL8rWC1mC+KoQBQdbbQWdYWPSKUrZ52JAOqKbcjqo7QeuVWPLL7gTi6y2qEn
         Euad+imqZLksmuYc166CSSIPPBDMuQPxP9cQThhpMSSpi8vecRsoJ6CqNwsE/CWZaiyu
         teQQ==
X-Gm-Message-State: ACrzQf3ALDMdBoI2xIAWK3JfmgSOAPONuYbqin70SomRdtjvQ+GQshmF
        UUjWD6Lkd3gLIZXlDLKVmcchWQ==
X-Google-Smtp-Source: AMsMyM7cr1Q33tw0w8IVRJOFhOmnhA7B5mLfA+CAXuFkJJdmEjsdZKsieHf+AxViF7gRTxn2RTFFXQ==
X-Received: by 2002:a5d:5d87:0:b0:22a:bbc5:5afe with SMTP id ci7-20020a5d5d87000000b0022abbc55afemr12120699wrb.235.1664784310035;
        Mon, 03 Oct 2022 01:05:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf? ([2a01:e0a:982:cbb0:9da7:1217:d35f:d7cf])
        by smtp.gmail.com with ESMTPSA id x6-20020adfdcc6000000b0022add371ed2sm9082357wrm.55.2022.10.03.01.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 01:05:09 -0700 (PDT)
Message-ID: <1062190d-ce1f-c7da-25bf-47af483e67a5@linaro.org>
Date:   Mon, 3 Oct 2022 10:05:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: dts: qcom: correct indentation
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221002092000.68844-1-krzysztof.kozlowski@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221002092000.68844-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 02/10/2022 11:20, Krzysztof Kozlowski wrote:
> Do not use spaces for indentation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> index b23591110bd2..acb08dcf9442 100644
> --- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
> +++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
> @@ -348,7 +348,7 @@ acc3: clock-controller@b0b8000 {
>   		saw0: regulator@b089000 {
>   			compatible = "qcom,saw2";
>   			reg = <0x0b089000 0x1000>, <0x0b009000 0x1000>;
> -                        regulator;
> +			regulator;
>   		};
>   
>   		saw1: regulator@b099000 {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
