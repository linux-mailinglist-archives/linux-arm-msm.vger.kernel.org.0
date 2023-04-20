Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BE9106E912B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235147AbjDTK4O (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234489AbjDTKzy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:55:54 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F2D83C24
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:53:28 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id x34so2331333ljq.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681988005; x=1684580005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QuB15PJF5Nw38+XeXfw0TWWfoZa5XjetjACHoCJsC5U=;
        b=Xgz4vXK1b6G0xPPGLhv006ZnrUzXGxvNJTfBCwAIYFumQhjOcrR0ugfdKeEYjWd7ww
         eGaYSyLKzJyUtVfRyuShp9C2rhUXDWBJn8RK1c/juGumLLyV0YqjCkMBXBc4/ABwhBiF
         tRnF4+4yG7h4ZBdV3NmZLd7nrkbIzbzfpkFyErcfc+fAmcL1AQ8hBaUToaUpQrt/2Zdq
         YENO6Iabq6UP9GcX2EnsCJC2x2UDmAwhVwxhzUMSCVZ6eKa2fcZ0kFTBu+VKb/syBSb0
         eYQ126iv9+xjsucsFKY1I5eP4S0G77myeh8pouPH5gdXyl6sTpx2Xhijc8F9nm57QEOL
         2N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681988005; x=1684580005;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuB15PJF5Nw38+XeXfw0TWWfoZa5XjetjACHoCJsC5U=;
        b=hPVkPJJOie1DkZ2ZIdSL2CYIVAsTE8KWqTRQT98+CF4cd2VgxxoBe2UCaTAcOt1cTG
         XCzRIvhkZtlcxsI/IINsfEP/zwYtF6oCevy7qLKoqzGYf+NHlq+SESpuhVkHknBW1h4+
         vEB/wTsFi7VXiUYd1oOmuNhH1u7g+e+br8gdO+aRTEZ2snRW8H6yQPecUaEm+GHex+7T
         VbisnLF7g8cw8GPFrZTNzabw1ZgOjJ3Bln75Em2Ejv3iZQtbap3v2FRgtQlsKpjYRgHY
         Zhkmyx7C0ETenWDNoaQALGeh7ojhiDfF4ALWWtjospeH0NKavP8H/PpPgUcb0r3z/AVs
         5DTw==
X-Gm-Message-State: AAQBX9cKL23P1dX+o6LQHvaIfEC/M3kogbxTkBPhPwaKRtCkZJSmEhZD
        rusA/kmSBcQUHEIwOale9UsFMg==
X-Google-Smtp-Source: AKy350YDbDygE2Xd8PQrCNobDfzQZXucE5xWdVgDMAiHRdKepn1pLQ0ioHmiYj4vBZIaY6Z7jXCzAA==
X-Received: by 2002:a2e:b70d:0:b0:2a6:1681:81e0 with SMTP id j13-20020a2eb70d000000b002a6168181e0mr277546ljo.2.1681988005549;
        Thu, 20 Apr 2023 03:53:25 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id m2-20020a2e97c2000000b00295a3a64816sm198906ljj.2.2023.04.20.03.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:53:25 -0700 (PDT)
Message-ID: <851d209b-68af-46af-6854-53fcc7b27e96@linaro.org>
Date:   Thu, 20 Apr 2023 12:53:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 06/18] arm64: dts: qcom: msm8953: correct WCNSS unit
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
 <20230419211856.79332-6-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230419211856.79332-6-krzysztof.kozlowski@linaro.org>
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
>   Warning (simple_bus_reg): /soc@0/remoteproc@a21b000: simple-bus unit address format error, expected "a204000"
> 
> Fixes: b12428640ebe ("arm64: dts: MSM8953: Add wcnss nodes")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/msm8953.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> index 4038e47a4610..d1d6f80bb2e6 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -1425,7 +1425,7 @@ i2c_8: i2c@7af8000 {
>  			status = "disabled";
>  		};
>  
> -		wcnss: remoteproc@a21b000 {
> +		wcnss: remoteproc@a204000 {
>  			compatible = "qcom,pronto-v3-pil", "qcom,pronto";
>  			reg = <0x0a204000 0x2000>, <0x0a202000 0x1000>, <0x0a21b000 0x3000>;
>  			reg-names = "ccu", "dxe", "pmu";
