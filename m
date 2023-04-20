Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E46096E9128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbjDTK4B (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:56:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235122AbjDTKzt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:55:49 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04C127DBB
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:53:23 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id y24so2281267ljm.6
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987996; x=1684579996;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sW/JMduHMZl39NFmvOrLalxaxBgZ1eDySN0+5/AIJI=;
        b=tYxKwOlNZw5KDP6qY4st3/KdNMpClE+Gmc6vZC3nkxzDTPFKiW+Bt4Oy/D/k20do5o
         cj3hjuEQKTxCQ5Q0BfM0gHnT0bnondY5OulTHUVWn7tzZy5Sd+bgnyOWUmIyVFxyBsxt
         u3Rr5Prgd/AKj2HmMX9liUHcxkjyuFAPVj229fhLUqX/XlD8r16dZ602rKa9QPJvtm7D
         TMKhVYhOK9NRCrFj2OusfZ+GAt5X3VtzxqiLOItBmCJh4YnexLfvI7nqyVY8BmmI0Dq4
         CmZGi+cG7ahXW8cp914Z6d2u76oXd/tDXJ1hMny+6bCUTRvddixXxWt6pVsaK3Os4dRa
         fLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987996; x=1684579996;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+sW/JMduHMZl39NFmvOrLalxaxBgZ1eDySN0+5/AIJI=;
        b=X0Z2rbBY4DXIj0zqCfin1NVG1Nb3i0qsHFtCuLg51tEwHkABiXzS20MXDpaWVFC14/
         7MalqMvTAAKb/6VwVlL3U8lwqfWMNSgTjEsrGAZ23Ia2dXFCiuMluoz/tn4GOiBok+l8
         9w4q55Pk2eShBv3G9+PQiiZOFrWMH0n2Ipx6G5/gv8N5dk3WmfV6CX5wX9d3uhF4n+Jd
         CsrL75ULTaHOE5Z6MYWdn5xWNAi2+LxAcYbftg2UVl/mJuQukY/ykqMFM4gpYblIYmzf
         HFUrNcY30IX4VloxJraRxPo6mSWx+3iZOkDwRavs9/5ouril0OJ0kkLIWqZoMJYv3E0x
         uvUw==
X-Gm-Message-State: AAQBX9fBbtwuabl6U9qAXW1crJuKxhbrxa+UTO7CQe8zt29hqWaMtBwd
        /7HxPdsVARxtOk+PqsfxUKv4fg==
X-Google-Smtp-Source: AKy350ZLzUmJHAPviKWcZ9K8uf9+Ouadqc/1O/EwbxqMnNpZW4LqfAABV1d6Mls8tUJsIMvuMMLLTw==
X-Received: by 2002:a2e:86c4:0:b0:2a8:c7e0:7764 with SMTP id n4-20020a2e86c4000000b002a8c7e07764mr297204ljj.18.1681987996303;
        Thu, 20 Apr 2023 03:53:16 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id p7-20020a2e93c7000000b002a7b0c8388csm198189ljh.90.2023.04.20.03.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:53:15 -0700 (PDT)
Message-ID: <5d6c1f42-88dc-a02b-ecff-8652cddc83fe@linaro.org>
Date:   Thu, 20 Apr 2023 12:53:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 05/18] arm64: dts: qcom: msm8953: correct IOMMU unit
 address
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
 <20230419211856.79332-5-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419211856.79332-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 19.04.2023 23:18, Krzysztof Kozlowski wrote:
> Match unit-address to reg entry to fix dtbs W=1 warnings:
> 
>   Warning (simple_bus_reg): /soc@0/iommu@1e00000: simple-bus unit address format error, expected "1e20000"
> 
> Fixes: c0b9575a3606 ("arm64: dts: qcom: msm8953: add APPS IOMMU")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index d44cfa0471e9..4038e47a4610 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1002,7 +1002,7 @@ dsi1_phy: phy@1a96400 {
>  			};
>  		};
>  
> -		apps_iommu: iommu@1e00000 {
> +		apps_iommu: iommu@1e20000 {
>  			compatible = "qcom,msm8953-iommu", "qcom,msm-iommu-v1";
>  			ranges  = <0 0x01e20000 0x20000>;
>  
