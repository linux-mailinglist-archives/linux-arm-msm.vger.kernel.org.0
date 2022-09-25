Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 039F75E958B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Sep 2022 20:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233007AbiIYS5y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 25 Sep 2022 14:57:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbiIYS5w (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 25 Sep 2022 14:57:52 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A50052ED57
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 11:57:51 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id r125so5972148oia.8
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 11:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Xkkurc7xmhFTAUmptTAIyBrQNuCw6O40NOONaEt5SY4=;
        b=ODYOHUvchpeTI7kgg2hz3gdVa4Iql7GILhBLA5AMo4BkfIcIM9oUod7Ce3iLkQycID
         1u6P0YqHGGfeY0UlyLTIOWbZGYzUSu9e+qQGztRmgt/92ptT+hZlATNlfdIDNVklRmgg
         AbGE2XGF1oysM2ls2fvitmVio8TZTahF9dDEg1O/RbZu24YmMR1DT1WP1LStM/YZaDJw
         zVbUBN6s1IltvVGe88QfJQcmv6gOfWBq1LFC2NIm9/4E6IjfidX66mrSl2wGod3UMQPD
         l3X5TWf4Dsg9cUvnjTeJ2MVpUR7Pl2MRfLumQOIVOo3v/G6/qPqVl+SuoB/3e8G+iI6I
         NbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Xkkurc7xmhFTAUmptTAIyBrQNuCw6O40NOONaEt5SY4=;
        b=sNAye05Vm05NTqsML0VTJgtEIy7IcNfQ35SyNZiDmEqy4cK2m0Ch4wXmSHp2rxTkv5
         ZphvRI/10HZ1JkULOmRdfXK/gjN1JIFI3rpJcwpdgpVaYfEE37vwGJRzsVuH04X0ZdRC
         K4bzys/tuyHkNnwGTxP/IpDLY8yOGPA1LFBwRXv1LLky8ar3InfzLZ5fx3/9UnF9xDP7
         VnUH5B/q8NCuz1CB4fakLQpdjNqJuNknpTsoI3Wm/E/7PaL0/pkLwB54xzrKdWixHV0L
         G5oGD+a61vLp5Fnw/zas83pRQ2PRyUYQMUuQ1SC/j3nHcYFbNiA0MRQZu9VyRavn5XwS
         +9Ow==
X-Gm-Message-State: ACrzQf16U+NNCOXLjiPLPWLexC+ZjJMunNxXjT4nq2bjd3NKYjQ+QSV9
        KHaYZbe/T/wBeFMZKgghGabrzg==
X-Google-Smtp-Source: AMsMyM5jPsdQ9cdIbbiQVtXHLiRsM8nEpBbYgdYcp0q8ndoeeUBtB5jMoDECVwj/c1rIncJJtzm2ZA==
X-Received: by 2002:a05:6808:1892:b0:350:7c49:649f with SMTP id bi18-20020a056808189200b003507c49649fmr13224624oib.219.1664132271066;
        Sun, 25 Sep 2022 11:57:51 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id n124-20020acaef82000000b003502783c454sm6394656oih.0.2022.09.25.11.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 11:57:50 -0700 (PDT)
Message-ID: <bff64b90-078b-5cb7-edff-4d5308bb7e0b@kali.org>
Date:   Sun, 25 Sep 2022 13:57:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 05/11] arm64: dts: qcom: sdm845: drop unused slimbus dmas
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220923161453.469179-1-krzysztof.kozlowski@linaro.org>
 <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
From:   Steev Klimaszewski <steev@kali.org>
In-Reply-To: <20220923161453.469179-6-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 9/23/22 11:14 AM, Krzysztof Kozlowski wrote:
> Bindings document only two DMA channels.  Linux driver also does not use
> remaining rx2/tx2.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sdm845.dtsi | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 2264bba69f84..1213f78a8b7a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3828,9 +3828,8 @@ slim: slim@171c0000 {
>   			reg = <0 0x171c0000 0 0x2c000>;
>   			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
>   
> -			dmas = <&slimbam 3>, <&slimbam 4>,
> -				<&slimbam 5>, <&slimbam 6>;
> -			dma-names = "rx", "tx", "tx2", "rx2";
> +			dmas = <&slimbam 3>, <&slimbam 4>;
> +			dma-names = "rx", "tx";
>   
>   			iommus = <&apps_smmu 0x1806 0x0>;
>   			#address-cells = <1>;

Tested on Lenovo Yoga C630

Tested-by: Steev Klimaszewski <steev@kali.org>

