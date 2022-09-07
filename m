Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9C4D5B03D9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Sep 2022 14:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229810AbiIGMWe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 7 Sep 2022 08:22:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiIGMWd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 7 Sep 2022 08:22:33 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC2D2AB416
        for <linux-arm-msm@vger.kernel.org>; Wed,  7 Sep 2022 05:22:31 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id x14so6776845lfu.10
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Sep 2022 05:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=U2CCV85EoOa7dwEFCiOXwg1HejjsrFPKLVkt4kwqjuQ=;
        b=YRDGjXATGwZoZrdBw6I43z9W6gX3NTSqOFyW3suJJZdxbSd0cbRw8W9v0y2cbNGW5P
         jAXr58i0dirqnMPI66row3CVgbtOImz8jpZEbXNUvhY1DTVltPrPMxgrmyx9HNBh4KTC
         xaaRbsiDY2AAQtB5rmIbCohJyrl6QPTqHWVttSXBdik46tH0BomAJEPUJwi4n9LGNid/
         XkZ58MzAY8v+X0cLEAaca1RYPUE3HZPObOBMiyUtlNjQCADYXBgIDLRsd9xRs6bZFM+A
         uI/ueSQONiXmmOK2wkIA3TTaFwvKyda1dfuJDIr6xYylT1FQpf9UbsJgTaxz1Yj9csh3
         pXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=U2CCV85EoOa7dwEFCiOXwg1HejjsrFPKLVkt4kwqjuQ=;
        b=ibMQi+DbcrNKle2ohs2Jbv20KrPvCKlOzggOQ7gUTghJY8YeArzfR5YXKGVpLETR1z
         6OFLP4OMhPRBIXiGz08j3SqhKKzmAS50o2IVlB01I7/M9T9Y+r99vy99F9+X+kps1BGs
         GPYeQ6vb/t2RcxSL14FhXzoydLGvFZ+d8VEX97jB29KrjmNUyPpZ6SIDOlYYRSJh3Fh6
         7Yyh1Q1RxlOaD711SopiRL8wn7jjUeYlAhVS/w4MK9AsC7NLQBBDvPhF5gnjZwJrxLhG
         8+ltO6NLYJgXoBanPMQ36R3lNHeuknewKG0JiuHbIXf/CcpE045FPqCzN5imwfIBzSn3
         hZkw==
X-Gm-Message-State: ACgBeo2YgOnD58y05dTUAUYxvqkbLDj2NxgVsRhDPT7oWMpGFLQpA/tJ
        ELyaqytEgYF1qFc6XyhmwaeX3g==
X-Google-Smtp-Source: AA6agR45ZampRMHGXpWL20oWXDRzWXEgmPza7LlwbS/oHQgXzh6bY/TgbzPtMh4UHAfeOI8vvuB50A==
X-Received: by 2002:ac2:4f02:0:b0:496:d15:ea89 with SMTP id k2-20020ac24f02000000b004960d15ea89mr978693lfr.69.1662553350347;
        Wed, 07 Sep 2022 05:22:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u15-20020ac258cf000000b00497ab34bf5asm200013lfo.20.2022.09.07.05.22.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Sep 2022 05:22:29 -0700 (PDT)
Message-ID: <cc00fad3-08fb-462a-12ac-73143aa4206f@linaro.org>
Date:   Wed, 7 Sep 2022 14:22:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc7280: Add missing aggre0,
 aggre1 clocks
Content-Language: en-US
To:     Krishna chaitanya chundru <quic_krichai@quicinc.com>,
        helgaas@kernel.org
Cc:     linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        quic_vbadigan@quicinc.com, quic_hemantk@quicinc.com,
        quic_nitegupt@quicinc.com, quic_skananth@quicinc.com,
        quic_ramkri@quicinc.com, manivannan.sadhasivam@linaro.org,
        swboyd@chromium.org, dmitry.baryshkov@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <1662171184-25211-1-git-send-email-quic_krichai@quicinc.com>
 <1662171184-25211-4-git-send-email-quic_krichai@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1662171184-25211-4-git-send-email-quic_krichai@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 03/09/2022 04:13, Krishna chaitanya chundru wrote:
> Add missing aggre0, aggre1 clocks.
> 
> Signed-off-by: Krishna chaitanya chundru <quic_krichai@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..a5ce095 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2043,6 +2043,8 @@
>  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
>  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
>  				 <&gcc GCC_AGGRE_NOC_PCIE_TBU_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_CENTER_SF_AXI_CLK>,
> +				 <&gcc GCC_AGGRE_NOC_PCIE_1_AXI_CLK>,
>  				 <&gcc GCC_DDRSS_PCIE_SF_CLK>;
>  
>  			clock-names = "pipe",
> @@ -2055,6 +2057,8 @@
>  				      "bus_slave",
>  				      "slave_q2a",
>  				      "tbu",
> +				      "aggre0",
> +				      "aggre1",
>  				      "ddrss_sf_tbu";
>  

Same as binding - adding entries in the middle causes ABI issues.

Best regards,
Krzysztof
