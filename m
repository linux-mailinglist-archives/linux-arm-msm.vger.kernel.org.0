Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43E4C691F19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Feb 2023 13:28:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232026AbjBJM2f (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Feb 2023 07:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232034AbjBJM2e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Feb 2023 07:28:34 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A901676D08
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 04:28:32 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id qw12so15462625ejc.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Feb 2023 04:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MISpw0Ywy9/GGrDCiIfVSWiguaYD6aHQRvEnwMDid1U=;
        b=xfypag1TvZ7OKj0C7m+I+7D/cOsS4DNQkRvD0uvkuPzIyRI7ygDVr278S4oGZo/VVN
         GoiBpHDQfJ28j3FBfbkQBLoqzWfX8B/rxmnssWTgEq0L71r6Fgjj7mUfjMEUhwG45Ed9
         U7v+umcfDPQum0jUD1YjSS6E90VWG+BM8sEESlJE5wGUG9VlNGQsWvOWv9rPGikpjLM/
         SstyKiJpRMZUEeLUbZcvb4TuTFXAnPAyxPgNb9xNDIDPUycLcpeXGolSNiExLhxMEPG/
         +QxNQT5kYF8HV9OAOe+xK7d3ldfExDUi5JCYMfZ7bNE2W/1lzP/TAXB4bnkn3zWXYY1w
         Kmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MISpw0Ywy9/GGrDCiIfVSWiguaYD6aHQRvEnwMDid1U=;
        b=5YfIfoREsRrQFvcjRDdH2jvRiujvHvGDER9jkNYnydebIcqQ3ofL4k4qtmFVpr9rWz
         4ETOyJx7qVDJVjaeZ1dqdXsTma/kypO5LTZbbI7EPrpjw7rA3XZcnYxZNS3FFXWcLRw3
         MJXD2AVvUrVsjmCBke33A8bVwipObK40p1VDCD3i6Qm+L0fah7QlUXhInXnolyiG6bmR
         ExTa1Mlg6yyZ3Shu+omlLNDY0Csj20ZJYfo6RuXI+9N3pdHDXajfdxobhve9A7C84l0Z
         jmLq2NXesxtCjyAtRRNY+RDQeITmT/AHF3ho3sCfU4GNNnEkbi+yrdLX+ycqS0YgjYoG
         /J8w==
X-Gm-Message-State: AO0yUKW3BaMIZCZ7RzQvXsLh+b3GkdxTB1OmXERQ8kr7Q06V19H5h2Eh
        QxS3qF7TxQFlosohbkp1qHJPpQ==
X-Google-Smtp-Source: AK7set/y1xP26UOmnMgJCW2UgOFzL6HRx3ZySveIZ24qoL6xMia2A8c/BGmvU8hytR9U08dkrEp1rg==
X-Received: by 2002:a17:907:86a3:b0:8ae:d191:aa2b with SMTP id qa35-20020a17090786a300b008aed191aa2bmr10860216ejc.6.1676032111249;
        Fri, 10 Feb 2023 04:28:31 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id r13-20020a1709064d0d00b0080345493023sm2283583eju.167.2023.02.10.04.28.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 04:28:30 -0800 (PST)
Message-ID: <23846ff0-e410-b7ab-3cc9-b45fdbf4a7d6@linaro.org>
Date:   Fri, 10 Feb 2023 14:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 4/5] arm64: dst: qcom: sm8450: switch to usb3/dp combo
 phy
Content-Language: en-GB
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230206-topic-sm8450-upstream-dp-controller-v2-0-529da2203659@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v2-4-529da2203659@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230206-topic-sm8450-upstream-dp-controller-v2-4-529da2203659@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10/02/2023 12:34, Neil Armstrong wrote:
> The QMP PHY is a USB3/DP combo phy, switch to the newly
> documented bindings and register the clocks to the GCC
> and DISPCC controllers.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 41 ++++++++++++------------------------
>   1 file changed, 14 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index d66dcd8fe61f..6248adc546f2 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -748,7 +748,7 @@ gcc: clock-controller@100000 {
>   				 <&ufs_mem_phy_lanes 0>,
>   				 <&ufs_mem_phy_lanes 1>,
>   				 <&ufs_mem_phy_lanes 2>,
> -				 <0>;
> +				 <&usb_1_qmpphy 0>;
>   			clock-names = "bi_tcxo",
>   				      "sleep_clk",
>   				      "pcie_0_pipe_clk",

Same comments as for patch 2, please use new defines for the QMP PHY 
clocks and PHY enumeration

-- 
With best wishes
Dmitry

