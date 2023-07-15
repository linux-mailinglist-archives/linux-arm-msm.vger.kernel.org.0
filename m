Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1F5F7549A0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Jul 2023 17:11:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229768AbjGOPLS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 Jul 2023 11:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229800AbjGOPLR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 Jul 2023 11:11:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE1BA2D57
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 08:11:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4fbb281eec6so4813956e87.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 Jul 2023 08:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689433875; x=1692025875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uahl0JK8EKsnvSfqLyeXPnd2KJauvmsFvzs6gaaLC+Q=;
        b=cEQKLfs+irNYlu4PHC7FcXJnmKVMQpjgceJ73Dz9W9kZUya7PARB2vlIWIRdz+da8A
         8Idoso99nNolkI4/+4/SXjxa0c2yRNvDHRgddHTDHOou+7H9yk2qwIaIW8ifTsnvgiLb
         NzgMpFWltHaUNBoRZHMDbTn9UulcLojYKHAj0uqKPGxg7nOjrBW+/dRrKCZXpQxQ7fR1
         f7Cykva76SaJ/zEk2/RMDLIqZXn+VSLojMv8az12trqaeY/7X3WNuUmQrojOLV9vczJF
         qBGP+SjB5KDILKLcusMDcQQwA08HVG7bLs19yn5zq6tNrHztIrEYKn6CtkqUU3RvgsMQ
         T+sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689433875; x=1692025875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uahl0JK8EKsnvSfqLyeXPnd2KJauvmsFvzs6gaaLC+Q=;
        b=dB1cSVZ0xGbI+TntCSAu/4rQf9ipeehbEveXydqcC414fdjZKWYUphcaxw7ZkrmcXG
         PxwtuKxjOVs/CD8J2uCPZc80vxsb1FxFG4msKtZqKqZLwzRgxfybSAky5GpOpjiOG9rZ
         14PLTPpgq9Oxld4wHtM56uXF0eECrrQJa9j977DLEH4KRWaJ+OkJq3z3Cvm5aL+syOJ2
         7FilSX1v09zpRZK6EyF4d1D+KBBL5SBpkehbCoe6/xs/Dy+IlliBHpqcNnaP8KcAWvjp
         x40cFcPIxzfS1hNN5byR7O44u3YP3tcXFE0pzetDe5VWJnB3FVTqm8nDuJt+1ysQbzRQ
         U3PQ==
X-Gm-Message-State: ABy/qLbLEeDdPzXgf5gB9cnw+PFsxU8FF9GNzK6TsDTKRbfuP1j93xSK
        +PPFWthFt9HIUPwWRAC0FDLyKA==
X-Google-Smtp-Source: APBJJlF8jICyjjbV1u/4xnF/oNp/tqc4zSp4PrfGF2zGzjcKVvb18AyYpYbdJHF6+FvSU7aOHyw/XA==
X-Received: by 2002:a05:6512:ea9:b0:4f8:752f:3722 with SMTP id bi41-20020a0565120ea900b004f8752f3722mr6549825lfb.5.1689433875119;
        Sat, 15 Jul 2023 08:11:15 -0700 (PDT)
Received: from [192.168.1.101] (abxi167.neoplus.adsl.tpnet.pl. [83.9.2.167])
        by smtp.gmail.com with ESMTPSA id f15-20020ac2532f000000b004fb745fd232sm1914885lfh.30.2023.07.15.08.11.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jul 2023 08:11:14 -0700 (PDT)
Message-ID: <7774d80e-81d4-2283-59ec-87012bb28294@linaro.org>
Date:   Sat, 15 Jul 2023 17:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/5] arm64: dts: qcom: qrb5165-rb5: enable displayport
 controller
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230709041926.4052245-5-dmitry.baryshkov@linaro.org>
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

On 9.07.2023 06:19, Dmitry Baryshkov wrote:
> Enable the onboard displayport controller, connect it to QMP PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> index a03f334a3d01..210c60025c32 100644
> --- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
> @@ -656,6 +656,15 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp {
> +	status = "okay";
> +};
> +
> +&mdss_dp_out {
> +	data-lanes = <0 1>;
> +	remote-endpoint = <&usb_1_qmpphy_dp_in>;
> +};
> +
>  &mdss_dsi0 {
>  	status = "okay";
>  	vdda-supply = <&vreg_l9a_1p2>;
> @@ -1436,3 +1445,7 @@ pm8150b_typec_sbu_out: endpoint {
>  		};
>  	};
>  };
> +
> +&usb_1_qmpphy_dp_in {
> +	remote-endpoint = <&mdss_dp_out>;
> +};
