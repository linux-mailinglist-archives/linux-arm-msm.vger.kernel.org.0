Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F6CB60B155
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Oct 2022 18:20:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230112AbiJXQUC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Oct 2022 12:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234628AbiJXQTI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Oct 2022 12:19:08 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 098625B9F4
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:05:13 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id b185so2981422pfb.9
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Oct 2022 08:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ThFhz8xILcwbKl/+NqgoXJc1Gt1sMOhgIkpsFZun7AY=;
        b=WMANydh+WdLPXn4JMDNjBjxj6L4FBADwe/MZuNwL+EjZOLRgfUHD0TED2u8c7F9RoL
         AGMFNuhaqPlsxjHqTWVQBgCBSPuyq+qEk6OS4PouZPTacv8JaqlHRnSAgfuH2SjCUoYC
         USYQ8lgn4XcJazs+N36vTRYwLTIk58GiZaID58sA8tcwVrmUQdYbcxMKdHpssPmWbh8P
         OaNqduTRM71tumJjZoLIj0ZpD4qRhEfECEjQLCRxWXCjgMJo8EPBDcLIAsJPHYqBQjkc
         yfIZi6SGV+TdOLqIZ5dhP97NxBxGYB7IPsWqMh8jYe2Uaz1KZIgZjR/dirVUYe4eIT0f
         P7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ThFhz8xILcwbKl/+NqgoXJc1Gt1sMOhgIkpsFZun7AY=;
        b=Zl7arz61D+zype4727dDIlh7UbK+ccJ82/oLH6LFveXFQGQSHKksG04WOZ6PSyctFv
         pEEAZPOgBtFe0VUiKE2/gReq2sJnWfoZvReR9vNQV9+bkPB7d4DOPQo8AfzT1Sagufna
         fEgwGScAwAhaucYDfyrVbrHkAbbt/WPwLDTNYVSw1Ki3MgU00CzzRwaOYDL5mE1s3dMK
         ETJw6pewdBq6D99RYG8xvf6fQqAUs2dZvYQduOoqZ8NzfSzlLhQ3xYvYp1Pfs3uJBHyW
         a/RUw6O4yAIQLHvcTWkjsW7QVyZyEGHCvznL7bC/p3l146U9havaVS4mI3kGUK89j1OE
         K6Tg==
X-Gm-Message-State: ACrzQf2J1LLRXvpLKpFY7xNKmYUMMP9Bm/KGg/PJyPuEzfxQRkmn5lxs
        NNgTxQvcByvpPKhibW3UlAFnofv2+GNFUw==
X-Google-Smtp-Source: AMsMyM6E9VCifBLRm7iwjWjZ7r/tkYJ7sL+Q3vttwMKX+IisDyXcqCvJYHOBaIJIAZJc+04Gz0cDIg==
X-Received: by 2002:a05:6214:d6e:b0:4b9:692d:c486 with SMTP id 14-20020a0562140d6e00b004b9692dc486mr18309751qvs.104.1666623367504;
        Mon, 24 Oct 2022 07:56:07 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id b10-20020ac8678a000000b0039a3df76a26sm90317qtp.18.2022.10.24.07.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 07:56:06 -0700 (PDT)
Message-ID: <5035b6a3-164b-afa0-b714-4deb886f9f90@linaro.org>
Date:   Mon, 24 Oct 2022 10:56:05 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 10/13] arm64: dts: qcom: sm8450: add spmi node
Content-Language: en-US
To:     Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211209103505.197453-1-vkoul@kernel.org>
 <20211209103505.197453-11-vkoul@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20211209103505.197453-11-vkoul@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/12/2021 05:35, Vinod Koul wrote:
> Add the spmi bus as found in the SM8450 SoC
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index f75de777f6ea..b80e34fd3fe1 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -645,6 +645,24 @@ pdc: interrupt-controller@b220000 {
>  			interrupt-controller;
>  		};
>  
> +		spmi_bus: spmi@c42d000 {
> +			compatible = "qcom,spmi-pmic-arb";
> +			reg = <0x0 0x0c400000 0x0 0x00003000>,
> +			      <0x0 0x0c500000 0x0 0x00400000>,
> +			      <0x0 0x0c440000 0x0 0x00080000>,
> +			      <0x0 0x0c4c0000 0x0 0x00010000>,
> +			      <0x0 0x0c42d000 0x0 0x00010000>;

This is a patch from December 2021. Is there anything blocking it from
being merged?

The same applies to several other patches here.

Best regards,
Krzysztof

