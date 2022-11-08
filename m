Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F06B8621146
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Nov 2022 13:47:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233873AbiKHMrF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Nov 2022 07:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234260AbiKHMqw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Nov 2022 07:46:52 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE771528A5
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Nov 2022 04:46:51 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id r12so21092565lfp.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Nov 2022 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ICaRGw9xCO3DSvdx7VVEsxQH9tTfnXE7G9tYCgGWr34=;
        b=CgRwNsUWCdaRfL0Zxw2rP8qnHgxwQqa92EwavvN0gY58lu/xEfqCf3aeLCvbOM/5EX
         iKzJivIDq1LGRPIQGB/os0BPO01HugtPFSoY/YN9kGAMRoUbs8N+MJl9JT392szKjLE6
         F9oVDo/kSdsb5IVos5xA4L5vNKE9p2MkvfjgeJEZh0/YvHQUGyysRjKVVj/IuRc0dFxy
         omYcT4CEKNgLZu0H/35FZqMNOYOs1LAFw5z/y0TLlgvj+HolM/IpPw9kxwoEEEMbz8hf
         pRpzYqAsHmi8pidSpaCxVRq7DNOmGt/8mcgYJn2i+dDJKYO65vbWGQx0Jzt99sVDBl0a
         jcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ICaRGw9xCO3DSvdx7VVEsxQH9tTfnXE7G9tYCgGWr34=;
        b=kWeXOHSVHd7NF1XMDoODK3bcJsvWq+rveRTy0SlmU3j9N3wfqnRzxpSnYBDJ3kxW9Q
         In4FZjdrp2XcMoXxFEatPQD7qPbMoNrQ8GmY4Arig4OLmeDHSSYNYaiP7yIFa81fDjiw
         WB7jAPwpai5GU5VMKBg0hxwcX/E140kRYQjfM6i9ToNytB87H9uMKhldBTTlimm7LOYZ
         ckGEkOPWmty1CEMO6+sBFlkVsSDbpJkPsC0nWZE7E9mcJ9REeXk6y+Nhth93uEgnNN60
         SaQWrvXH4HKbrBpXURFvlnfsGfkOwqUNLmt/C9ETE35tJrPsnr3D5uMbbFObSGGx9qv7
         eKKA==
X-Gm-Message-State: ACrzQf3u5p7ePftSzxyja6lfg/d7WlymkongC2hx9O3PNxSCeeL7qDb/
        JM2Nvv893zqUpCs5XMGrJsp/5A==
X-Google-Smtp-Source: AMsMyM7Rss3ZJXpWQzraDFVxnOgPelIhIHbOdwlUE0xr9Mb3GOdpjuUhBYjZGqSRdBoMHu/gRWClKw==
X-Received: by 2002:a05:6512:78c:b0:4a2:4b01:8466 with SMTP id x12-20020a056512078c00b004a24b018466mr511398lfr.34.1667911611454;
        Tue, 08 Nov 2022 04:46:51 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s16-20020a056512215000b004a2c447598fsm1776440lfr.159.2022.11.08.04.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 04:46:51 -0800 (PST)
Message-ID: <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
Date:   Tue, 8 Nov 2022 15:46:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 07/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-GB
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
        robh+dt@kernel.org, quic_mkrishn@quicinc.com,
        linux-arm-msm@vger.kernel.org
Cc:     Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
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

On 08/11/2022 02:56, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,mdss-dsi-ctrl-apq8064

Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
use qcom,soc-something as compat string. This would leave us with 
qcom,apq8064-dsi-ctrl

I'm not sure if we want to follow the qcm2290 approach and encode the 
DSI ctrl revision here (6g vs v2).


> - qcom,mdss-dsi-ctrl-msm8916
> - qcom,mdss-dsi-ctrl-msm8974
> - qcom,mdss-dsi-ctrl-msm8996
> - qcom,mdss-dsi-ctrl-sc7180
> - qcom,mdss-dsi-ctrl-sc7280
> - qcom,mdss-dsi-ctrl-sdm630
> - qcom,mdss-dsi-ctrl-sdm660
> - qcom,mdss-dsi-ctrl-sdm845
> - qcom,mdss-dsi-ctrl-sm8250
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   .../bindings/display/msm/dsi-controller-main.yaml      | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index b35130a77b43e..9db3e63acda3d 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -17,6 +17,16 @@ properties:
>       enum:
>         - qcom,dsi-ctrl-6g-qcm2290
>         - qcom,mdss-dsi-ctrl
> +      - qcom,mdss-dsi-ctrl-apq8064
> +      - qcom,mdss-dsi-ctrl-msm8916
> +      - qcom,mdss-dsi-ctrl-msm8974
> +      - qcom,mdss-dsi-ctrl-msm8996
> +      - qcom,mdss-dsi-ctrl-sc7180
> +      - qcom,mdss-dsi-ctrl-sc7280
> +      - qcom,mdss-dsi-ctrl-sdm630
> +      - qcom,mdss-dsi-ctrl-sdm660
> +      - qcom,mdss-dsi-ctrl-sdm845
> +      - qcom,mdss-dsi-ctrl-sm8250
>   
>     reg:
>       maxItems: 1

-- 
With best wishes
Dmitry

