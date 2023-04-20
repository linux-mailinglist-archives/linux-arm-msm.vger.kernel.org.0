Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 192466E9158
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 13:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbjDTK7u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235228AbjDTK7e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:59:34 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE874B74A
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:56:59 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2a8a6602171so4266281fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988218; x=1684580218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ewXgvjZPyKJ1n9zRzGA+zaxH8tx/0y3F71LiiYkR2ak=;
        b=svru7IbwP6ExPzDgfv843KSwDqykuPfskwv51l5aXc28Yn0wLbbGYRt1/NrJhVNo9p
         3wlQTGapLh4laFO1ud6TnELrE6tVv4ARuY9bhLjPj46AyrzjZF5nvQ90grV4cplkH6yr
         RlVPw1CiKdiEeCTTUyDrIe8HRVtgisyRDAULEjvGow6Qg2G+9SUm7yUFezZeudK4YSF5
         sTevhHGCuE+dxPA0gQ1PxW/G/Am682OdBtocCIfhQ24snlqmv+GuJoDiEzoLnKDzIydp
         Kq6j8Jr2W/t2rpMGFd0lDTsnexFkk1w5N18pF8UzGMkcajhHkNULjsIbxHXW4llUnAIq
         238w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988218; x=1684580218;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ewXgvjZPyKJ1n9zRzGA+zaxH8tx/0y3F71LiiYkR2ak=;
        b=fF2Hujb0AnD5XvhfXA2NdLWp29ITCZVSqXGMk/xNbHoSZFGtHYJ5a2rCAdXZ3glwyG
         FelVEtWjdTT4hQxNtc9e7TumTN2Ip8tUzTqcqY/BUQoybfEXPA01bnIkEMqqbRnW5jGU
         DQIN/70b24Zuq33+plrZJvht/NgpMbc+5CGA+gxJ1Prp6FQXGqWLS7mD+K2Wpp5FVzdh
         4hgpeV5WmW2DIUwEW1JNYA2YxvP4HZPuMBGNE38cE5wmITfmE7uh9w66S8Uw5GYS4Qo3
         oTVlJWiKMo7xZJUjdgOs7J/ON+yf58hRte/lY92j+C+CR7UMOuJ8G4QFdXUGRRm90RGF
         zlrQ==
X-Gm-Message-State: AAQBX9cpLJ+hH8nNmF990k3xytxNavP4OQxtE0uIky3Mez/9iPvuWv0L
        yfvhYi4oTC/hgs1qRIFblladhA==
X-Google-Smtp-Source: AKy350aZEBUcNWwWy8BRAL2PcQovivMdG+ijcjU9vEvc3OrpwMqNonvwDYisKpMubQQS4ikCM6fVPA==
X-Received: by 2002:ac2:5d25:0:b0:4b3:d6e1:26bb with SMTP id i5-20020ac25d25000000b004b3d6e126bbmr303602lfb.29.1681988217863;
        Thu, 20 Apr 2023 03:56:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b004db3e2d3efesm178171lft.204.2023.04.20.03.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:56:57 -0700 (PDT)
Message-ID: <9c2e19a7-9483-c321-a455-f019080b3f8c@linaro.org>
Date:   Thu, 20 Apr 2023 12:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 18/18] arm64: dts: qcom: sdm845-polaris: add missing
 touchscreen child node reg
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>,
        Todor Tomov <todor.too@gmail.com>,
        "Ivan T. Ivanov" <ivan.ivanov@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Luca Weiss <luca@z3ntu.xyz>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Adam Skladowski <a39.skl@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Robert Foss <rfoss@kernel.org>,
        Andrey Konovalov <andrey.konovalov@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Molly Sophia <mollysophia379@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230419211856.79332-1-krzysztof.kozlowski@linaro.org>
 <20230419211856.79332-18-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419211856.79332-18-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.04.2023 23:18, Krzysztof Kozlowski wrote:
> Add missing reg property to touchscreen child node to fix dtbs W=1 warnings:
> 
>   Warning (unit_address_vs_reg): /soc@0/geniqup@ac0000/i2c@a98000/touchscreen@20/rmi4-f12@12: node has a unit name, but no reg or ranges property
> 
> Fixes: be497abe19bf ("arm64: dts: qcom: Add support for Xiaomi Mi Mix2s")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> index 8ae0ffccaab2..576f0421824f 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts
> @@ -483,6 +483,7 @@ rmi4-f01@1 {
>  		};
>  
>  		rmi4-f12@12 {
> +			reg = <0x12>;
>  			syna,rezero-wait-ms = <0xc8>;
>  			syna,clip-x-high = <0x438>;
>  			syna,clip-y-high = <0x870>;
