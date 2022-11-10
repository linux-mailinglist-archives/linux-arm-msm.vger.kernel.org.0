Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4FBC624587
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Nov 2022 16:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231344AbiKJPVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Nov 2022 10:21:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbiKJPVg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Nov 2022 10:21:36 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9186DDF6A
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:21:35 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id m22so5758562eji.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Nov 2022 07:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XdzkbQ09fiKcu0tyK+8QqgzW/sjDHqNHnq+CN5MjlIk=;
        b=BVi8C3+ztHIjqgX4BxPZXyxk5UjXH6Ne3yNSCOIDsdSP2QhRqBTLO/kU4O0l3BlMmW
         Rd5YIyGfD73UFgMIFGCpPs0YZyXURSk/2fE5IYYIdbDa6c6e3IX+V8pmHMRdKV7XBKb2
         4KEHzJtsNodFl1BrwwUs5FB4LICSLkbKY/D3G1xCc2g9TnbFgpbf195wpVEUls9Rj41/
         Rec52P3J66QWtqD0bF3hie0xjfRmM7tL/Ftdgt2a7HKXK6UFzFNpHe61nzynavjW4Q6W
         tbjDMY22Hos4XWH97yVymMQ+T2Zei5S3tQTAfTgiwo0W4AfPt0rzOgBkTVdHIPCkEam8
         Zfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdzkbQ09fiKcu0tyK+8QqgzW/sjDHqNHnq+CN5MjlIk=;
        b=E4elSzXta7aEHOChJciSRKxixRscWYu3p+aCyS2J4DAd3Im9b948qqnuxnVNdhoIjs
         QVdrKSSIl/NF9vLPBJ/86594bDxUpdPZtKkz7LvPfzBX5jkFLk9TV9gLhxbokIkTyZ63
         bVHgLSNBPxZEhRfwaWz1pCLDXHulOVaNXsfKISqlj1QC3X96xLYjuQhLhQw52OjA0XZE
         +wRQuntNEnl2dJ5JYaxdJjIB8UYiuGHdlk4A33aE00m5Dfb0SdRwGSEp8qIbWVK+f9YG
         2etH8EEq8larX0as6Jd/cqWYu4s6EDQsp36KqkzKznvf+ienOxhcibDZ4kwa9WU1IeYI
         SkDA==
X-Gm-Message-State: ACrzQf33EcHxJXLSqvsmzMQNc1vPRxzv2v2JWftQXYF80FqeZ+gFuWuI
        C6iutPK57hilbyO83gEBZlXox88iaMjmLJGH
X-Google-Smtp-Source: AMsMyM5hPZh95vJZWS/RrPzb3gfJ2Kshld4mkcMh3tJ8TLUKkrvnvomlXajIygcPcbNqFlDApPTZgw==
X-Received: by 2002:a17:907:9615:b0:7ae:1219:7032 with SMTP id gb21-20020a170907961500b007ae12197032mr35429550ejc.658.1668093694193;
        Thu, 10 Nov 2022 07:21:34 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
        by smtp.gmail.com with ESMTPSA id n20-20020aa7c794000000b00459012e5145sm8596852eds.70.2022.11.10.07.21.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 07:21:33 -0800 (PST)
Message-ID: <a09b34d1-769e-91b1-bd07-6a6390c1a5a9@linaro.org>
Date:   Thu, 10 Nov 2022 16:21:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v7 3/4] arm64: dts: qcom: sm8450: fix gcc clocks order to
 follow the schema
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org
References: <20221110151748.795767-1-dmitry.baryshkov@linaro.org>
 <20221110151748.795767-4-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221110151748.795767-4-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/11/2022 16:17, Dmitry Baryshkov wrote:
> Move the sleep_clk to make sure the gcc device node follows the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d32f08df743d..efb01fefe9c7 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -720,13 +720,13 @@ gcc: clock-controller@100000 {
>   			#reset-cells = <1>;
>   			#power-domain-cells = <1>;
>   			clocks = <&rpmhcc RPMH_CXO_CLK>,
> +				 <&sleep_clk>,
>   				 <&pcie0_lane>,
> -				 <&pcie1_lane>,
> -				 <&sleep_clk>;
> +				 <&pcie1_lane>;
>   			clock-names = "bi_tcxo",
> +				      "sleep_clk",
>   				      "pcie_0_pipe_clk",
> -				      "pcie_1_pipe_clk",
> -				      "sleep_clk";
> +				      "pcie_1_pipe_clk";
>   		};
>   
>   		gpi_dma2: dma-controller@800000 {
