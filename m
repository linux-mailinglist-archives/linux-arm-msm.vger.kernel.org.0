Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5616DBB73
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Apr 2023 16:05:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230108AbjDHOFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 Apr 2023 10:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230116AbjDHOFJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 Apr 2023 10:05:09 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080E811E83
        for <linux-arm-msm@vger.kernel.org>; Sat,  8 Apr 2023 07:04:45 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id o1so1469442lfc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Apr 2023 07:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680962644;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WL9vzgqqE2pipTqBiWSrHFHOR0gA/wvhMKbIOyTCx4=;
        b=C4Y5hVQjqEdbrAgl7ddcR/G0CTn2R+5G87TZqUdANJ6cDohv0VlIiHfjLHEaWs+20C
         TITuRzNrRPRfaARxlRAt7dl9dRygEkfXjn+0fg+KqDDdgWh9BOySv2X2WlpOC8z77Kfv
         lNyTD9LDzt6SeLmXv/W9UDNfQdxEAEtRy/kRZiVzmxjSbTKz+0VyfA7L6pIxfKDPm/zh
         j94ffehdatEumnX+ycF5E1iKYO8akOUm5P26Q4cVtLA6Zp8eHarsN83MhNYCJwgIkmaS
         0BmNi/3N9YCjXDhyfauTc0jDSL5ic9zzrLuw+hmVD0ulZUoKQivcoL81fwdCu5Z/p+FC
         IWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680962644;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WL9vzgqqE2pipTqBiWSrHFHOR0gA/wvhMKbIOyTCx4=;
        b=DFz8aaOe3nNUa+r4NaXhXdWEwUBiYYuWJaxguy57tzioIzoIQWqMI4kAgSfnqmiZm1
         dc+As4hT0yM0M/IKdqkMhVskyfl7oW8lROPX57Zh6kEHbygtidjQ+qxz67TZYZQqkrbD
         hId9HO1cs7MKMgbT2fJf0LUJKj23WMjLtb0zVj26oeWqZ49/Ff0QflPYt1N3zo22/NpP
         LDWyyS2HzmUN3S5lhu05loW1hPMkffrSc8ubs+Le3FoI+6oMQeiyzbcvq0emrXfiG9Ef
         L1JNtI7PBakpyEKCzP0+9swmTUVMFLn4lObcVvpsNbmNK1hY1FfT0TQID5GM/S22iEOE
         QBSQ==
X-Gm-Message-State: AAQBX9eN2gj2Pg2UGo80V4x+lahO3/Rgu9UIYS8eUcHrFtsKTTs4XLMd
        bYR93Il2xMg+AUPnZBripIIUkA==
X-Google-Smtp-Source: AKy350bV4sNPKiPwg9ZiG94yR3Evq5nlRIX3s92+bjKr+Q/6psvEe1ZIJEos7fo6yRMvL3+InOltMw==
X-Received: by 2002:a19:f50a:0:b0:4a4:68b9:1a14 with SMTP id j10-20020a19f50a000000b004a468b91a14mr462139lfb.60.1680962644275;
        Sat, 08 Apr 2023 07:04:04 -0700 (PDT)
Received: from [192.168.1.101] (abxh37.neoplus.adsl.tpnet.pl. [83.9.1.37])
        by smtp.gmail.com with ESMTPSA id y9-20020ac255a9000000b004eb2d6160a4sm1193749lfg.32.2023.04.08.07.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Apr 2023 07:04:03 -0700 (PDT)
Message-ID: <bc933ae8-af3a-b147-3fbf-e6b8bfb1d1ea@linaro.org>
Date:   Sat, 8 Apr 2023 16:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] dt-bindings: clock: qcom,gcc-sc7280: document CX
 power domain
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <tdas@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230408134820.76050-1-krzysztof.kozlowski@linaro.org>
 <20230408134820.76050-3-krzysztof.kozlowski@linaro.org>
Cc:     Rajendra Nayak <quic_rjendra@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230408134820.76050-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.04.2023 15:48, Krzysztof Kozlowski wrote:
> The GCC clock controller needs CX power domain, at least according to
> DTS:
> 
>   sc7280-herobrine-crd-pro.dtb: clock-controller@100000: Unevaluated properties are not allowed ('power-domains' was unexpected)
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
+CC Rajendra

Same question as with 7180

Konrad
>  .../devicetree/bindings/clock/qcom,gcc-sc7280.yaml         | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> index 947b47168cec..ff0b18bbb0fc 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
> @@ -43,6 +43,10 @@ properties:
>        - const: ufs_phy_tx_symbol_0_clk
>        - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
>  
> +  power-domains:
> +    items:
> +      - description: CX domain
> +
>  required:
>    - compatible
>    - clocks
> @@ -56,6 +60,8 @@ unevaluatedProperties: false
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmh.h>
> +    #include <dt-bindings/power/qcom-rpmpd.h>
> +
>      clock-controller@100000 {
>        compatible = "qcom,gcc-sc7280";
>        reg = <0x00100000 0x1f0000>;
> @@ -71,6 +77,7 @@ examples:
>                       "pcie_1_pipe_clk", "ufs_phy_rx_symbol_0_clk",
>                       "ufs_phy_rx_symbol_1_clk", "ufs_phy_tx_symbol_0_clk",
>                       "usb3_phy_wrapper_gcc_usb30_pipe_clk";
> +      power-domains = <&rpmhpd SC7280_CX>;
>        #clock-cells = <1>;
>        #reset-cells = <1>;
>        #power-domain-cells = <1>;
