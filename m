Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9DD6DA1EE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Apr 2023 21:47:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238453AbjDFTrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Apr 2023 15:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237498AbjDFTr2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Apr 2023 15:47:28 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2686BA5EF
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Apr 2023 12:47:25 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id k37so52267580lfv.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Apr 2023 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680810444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=erhM/TQgaI6MfiVP7E4GPYEuma65YzEyePLYNCwXrh0=;
        b=hfsMOUYk1nnVxsfGKoEnMhqGM5tJwWku1qgPY7yNPBYAicEeFP63P0BtVeYxKx8PNk
         gYB9CeTSYwlComPTA8v1Y+VSSbbID12NEKLwgRUkWT1tMizUGJ6q0bYZLMHFDpj/9zWI
         CsvXRp+x7M299jNcRmoEFQS6INvo46knZVyLO9nToka17cFpyA57xSU0HXLZ8F8FqHg7
         fEcsxa4vQFJPpO/8qc2oNgyYVSWrcyH3KA5OATzxHN186Q/QxykKpqRhZWX4AI12uoAG
         dTXaTFWViatr1Qhvjm91dBbrgjtXbzGSl3fmJqPIRRPJ35WO1embvbYB6GHPODKv6D6s
         7FhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680810444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erhM/TQgaI6MfiVP7E4GPYEuma65YzEyePLYNCwXrh0=;
        b=2dwFgsD4O1wPQ1ZXlM1tg8if0V4azLqdPwrD8NQSRe14iqKnrIU2Zh1xO6I7spRfFF
         gbeTK7xkzkkJWDbFLSuxfnHxndIbZJAee9LAC1RARf5XQhpV/Bvak1U3z9ZzIB4g1V82
         M+2sR6bs78949TMui1Y+LiwFxhvjguC0q/1LCo1frRmfOpEAb4NfeUJlMpxQmm83kZ3B
         3/oBPkNm0D83GfUxiZhQGVEdP+npZefVgwU4vXyv+Vi/Mr5FRo5ROqFl5seXj003Mflf
         zBgJg2uSPwezuPIOhPwCdGFNaIpfHmYOVimH9vglIg1hDlxRBgr4VhzeqxHGocM48vR4
         L8xQ==
X-Gm-Message-State: AAQBX9flLbyjc8uV7hhFT1n6+h085CvTMr5DhBDMEN3+Pmj0sKZg4ASE
        Ij8T3PxC08jfjEmxAf07RQtxIg==
X-Google-Smtp-Source: AKy350YCcv46M30Sn3lVJgHE7VYbzqp+Gvq/SeWNaYZzU+x6xxsIrwcc10SmO6n9eX+0lS+o+ffh4g==
X-Received: by 2002:a05:6512:65:b0:4eb:df5:7418 with SMTP id i5-20020a056512006500b004eb0df57418mr66197lfo.36.1680810444140;
        Thu, 06 Apr 2023 12:47:24 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512376f00b004db45096c99sm386981lft.85.2023.04.06.12.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:47:23 -0700 (PDT)
Message-ID: <8522a34c-de77-444b-159b-5b8732b52a9e@linaro.org>
Date:   Thu, 6 Apr 2023 21:47:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH V3 4/5] arm64: dts: qcom: ipq9574: Add SMPA1 regulator
 node
Content-Language: en-US
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_sjaganat@quicinc.com,
        quic_kathirav@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_ipkumar@quicinc.com
References: <20230406070032.22243-1-quic_devipriy@quicinc.com>
 <20230406070032.22243-5-quic_devipriy@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230406070032.22243-5-quic_devipriy@quicinc.com>
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



On 6.04.2023 09:00, Devi Priya wrote:
> Add support for SMPA1 regulator node in IPQ9574.
> 
> Co-developed-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>  Changes in V3:
> 	- Updated the regulator-min-microvolt with the SVS voltage 725000uV
> 
>  arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> index 3ae38cf327ea..06f579b1c590 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
> @@ -44,6 +44,25 @@
>  	};
>  };
>  
> +&rpm_requests {
> +	regulators {
> +		compatible = "qcom,rpm-mp5496-regulators";
> +
> +		ipq9574_s1: s1 {
> +		/*
> +		 * During kernel bootup, the SoC runs at 800MHz with 875mV set by the bootloaders.
> +		 * During regulator registration, kernel not knowing the initial voltage,
> +		 * considers it as zero and brings up the regulators with minimum supported voltage.

> +		 * Updating the regulator-min-microvolt with SVS voltage of 725000uV so that
s/Updating/Update
s/725000uV/725mV here and below (for consistency with the first mention
of 800mV)

Konrad
> +		 * the regulators are brought up with 725000uV which is sufficient for all the
> +		 * corner parts to operate at 800MHz
> +		 */
> +			regulator-min-microvolt = <725000>;
> +			regulator-max-microvolt = <1075000>;
> +		};
> +	};
> +};
> +
>  &pcie1_phy {
>  	status = "okay";
>  };
