Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5296717C1A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 May 2023 11:38:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235582AbjEaJi2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 May 2023 05:38:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234834AbjEaJiV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 May 2023 05:38:21 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35AB6C5
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:38:20 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f4bd608cf4so6437851e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 May 2023 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685525898; x=1688117898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W4B9kv7Kp7D6YGT7fEmI2nIIBykiyLjEKwjRr8CXe2Q=;
        b=wIhD8aLFzNvpVhJ9ZRoyh3oaW45wfeq2sWYW79TX53uynob/RpSk91h/QsEd9xMRWH
         TwbVU8qPzUt7Pb6e10aOt61mUOe5cOTmwOiZwmw4VKnCol2+/wixk53wK4ZRV4D8LSHM
         nKpvqKIPSTOrrX1JJw5PyddVxCKEdh2IneVnzweega14suQKpcjbEUO09J8RVvK3V8qY
         nCsrMtWYxeT2GwzvwSmybD2aQpSwkk07fTuQ2P2fK6l/B82KOEd0Huo8DYfK5NlCFEgN
         1geISbaTEG6wB/5FM+WOFP4wXEs4TrvdfGauPeQe6OoFGAMumbujEI059qcZfnSQn5HQ
         mDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685525898; x=1688117898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W4B9kv7Kp7D6YGT7fEmI2nIIBykiyLjEKwjRr8CXe2Q=;
        b=HJYp396yg0qSdqSW93wjCIIAovM/diG/NF+S3EyUBQcDcp6dD+PsZHplvWmhtK8/YB
         qkWeG9qrCbqlravX+P5efju6GNLrcdUQah0BjhB2nHGrAyqL6q8Qgs/+31sZbvSdjHs0
         xx0KTiPfqAY+NO4ADmThqavMOO5VKxUKMAYwbyWRBJLKmgfjkxNhNlN8tEI7WzL/decM
         RBXeZNVvb9DQ9dE+CVPncdrC5R72j0eqmgoVQodZpybN9eVo6yMbtD6Vnp367J8PvZp+
         4Hq1iW9fMVUeVmR6CFPzK0fpI7fWYtheouRg1aSEzUPX3JaxqmIC4T5K2HBjy1hBLbEj
         G3YA==
X-Gm-Message-State: AC+VfDzrPqZsFgH6zCZSEAvgM2dks/4L2rBA4ZAgo7broWPF9hwcdArZ
        oDCwNLWd+48mkGvPpzEoX8ruFQ==
X-Google-Smtp-Source: ACHHUZ7OjGbr+/9uI93q0S6AiWU/Wnoy1Xr6FbCyHtYNDpKds5bxAFbxLs0jBCGliW+bCJDq6QqzeA==
X-Received: by 2002:a05:6512:24b:b0:4f3:a3e0:850e with SMTP id b11-20020a056512024b00b004f3a3e0850emr2125967lfo.35.1685525898417;
        Wed, 31 May 2023 02:38:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id a6-20020a19f806000000b004f3bb9f1068sm649006lff.225.2023.05.31.02.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 31 May 2023 02:38:17 -0700 (PDT)
Message-ID: <45b79838-3ade-539e-50af-a60794f5e26c@linaro.org>
Date:   Wed, 31 May 2023 11:38:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 01/14] arm64: dts: qcom: sc7280: Don't disable MDP
 explicitly
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230531011623.3808538-1-dmitry.baryshkov@linaro.org>
 <20230531011623.3808538-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230531011623.3808538-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 31.05.2023 03:16, Dmitry Baryshkov wrote:
> MDSS and all its subdevices are useless without DPU/MDP, so disabling
> MDP doesn't make any sense. Remove explicit disabling of the DPU device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 4 ----
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           | 2 --
>  2 files changed, 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 5b1c175c47f1..9ea6636125ad 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -467,10 +467,6 @@ &mdss_dp_out {
>  	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
>  };
>  
> -&mdss_mdp {
> -	status = "okay";
> -};
> -
>  /* NVMe drive, enabled on a per-board basis */
>  &pcie1 {
>  	pinctrl-names = "default";
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 00547192215d..1aa3c6bf81f0 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3881,8 +3881,6 @@ mdss_mdp: display-controller@ae01000 {
>  				interrupt-parent = <&mdss>;
>  				interrupts = <0>;
>  
> -				status = "disabled";
> -
>  				ports {
>  					#address-cells = <1>;
>  					#size-cells = <0>;
