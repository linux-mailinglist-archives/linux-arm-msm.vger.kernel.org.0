Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4C664F9C7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Dec 2022 16:17:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiLQPRW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 17 Dec 2022 10:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiLQPRU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 17 Dec 2022 10:17:20 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7636513CF3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:17:19 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id b13so7776350lfo.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Dec 2022 07:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vcFUdKoU9orG5/Q1yZyDSoXNR6fd4XwuWS5ugB4AHQA=;
        b=pwP7R1UBe9hR7PRXssUEXZFhSpnz4nbhhDc6reehEhnN4ZTMK9+IByBew0Ec7J2h+j
         ITFUuL69/7Dr2qI0Vcxmlh9ca9NM9/I2KcWXjEZfMEWU2XV3DZnav+UkPpQjM2vUJLFw
         vYd0highqO6Slby4YxuFZvNvdItNZtGwRK6u3rZt62oN74CSk73qkf/IK0esPXTh4F4G
         2W+0Q5Pwry6C5wXqPlKp6rDzfr5Dt6PYaXOl9tc/429GfAURP0pn55gVOxas6rFhZNrc
         +i2yGRce2vyaffh42POSO3N6cuU1lPxXogNltgwiKRYpXMsz5ZVFB/W56VhXFf9N9stA
         ACrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vcFUdKoU9orG5/Q1yZyDSoXNR6fd4XwuWS5ugB4AHQA=;
        b=KGfvuJuZxHCZqljxm/rf1xSJYgDI65URZRF2/hJrEGl1bkeW45cca43Pw1SucTaNNI
         CQQAVn5S8M5hRtp6jYs2o+H87dYLboKeijPbugu3CqPiaLrh4cg0OfqjZolLgeGaP+IH
         JImMest9nOu6PBBzV8ng1ekfAcasKlxNfKvTN54MRjZfgzBVBegy6VCgNWNgHM4O7Kpf
         MTLfs2UjeNpQWfXiY9V8wprmMBDxOe8mZAS6QCNF8KdWrjWpuGH2uOd5n2MtAeA1kYXM
         3N/qSOQej9NYUl9+OftsLPzrO/F1EFBVlvy057F1YjnSjNeeSABLOY3jct5NsLZD+TeN
         8zKQ==
X-Gm-Message-State: ANoB5pmZq9oIuAm4NPP1QfmMQit8XIj0vOpOadtu7EzOpMrJ0RDQRVbF
        YrDn9imj6EHyMTIJ86MR6jCz/w==
X-Google-Smtp-Source: AA0mqf6sJxw9kl6hkiWr4UYZPwiHalyO9x0JFpqUjl+7erSr4XLLUCc1qQnUPxWj0cPSrHfvJTr+xw==
X-Received: by 2002:ac2:414c:0:b0:4a4:68b8:c2dd with SMTP id c12-20020ac2414c000000b004a468b8c2ddmr10260567lfi.52.1671290237864;
        Sat, 17 Dec 2022 07:17:17 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
        by smtp.gmail.com with ESMTPSA id f3-20020a056512360300b00492ca820e15sm533318lfs.270.2022.12.17.07.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Dec 2022 07:17:17 -0800 (PST)
Message-ID: <ee2cf767-2602-cd82-9fe2-bfcf3d7d6796@linaro.org>
Date:   Sat, 17 Dec 2022 16:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 15/15] arm64: dts: qcom: qcs404: add clocks to the gcc
 node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-16-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221217001730.540502-16-dmitry.baryshkov@linaro.org>
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



On 17.12.2022 01:17, Dmitry Baryshkov wrote:
> Populate the gcc node with the clocks and clock-names properties to
> enable DT-based lookups for the parent clocks.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qcs404.dtsi | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index b72542631337..ee337a3980fa 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -731,6 +731,19 @@ gcc: clock-controller@1800000 {
>  			#reset-cells = <1>;
>  			#power-domain-cells = <1>;
>  
> +			clocks = <&xo_board>,
> +				 <&sleep_clk>,
> +				 <&pcie_phy>,
> +				 <0>,
> +				 <0>,
> +				 <0>;
> +			clock-names = "cxo",
> +				      "sleep_clk",
> +				      "pcie_0_pipe_clk_src",
> +				      "dsi0pll",
> +				      "dsi0pllbyte",
> +				      "hdmi_pll";
> +
>  			assigned-clocks = <&gcc GCC_APSS_AHB_CLK_SRC>;
>  			assigned-clock-rates = <19200000>;
>  		};
