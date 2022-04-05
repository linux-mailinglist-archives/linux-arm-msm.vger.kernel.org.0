Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 687744F4BB5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Apr 2022 03:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234443AbiDEXEY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Apr 2022 19:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457355AbiDEQDH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Apr 2022 12:03:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C14C7E7D
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Apr 2022 08:38:32 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 17so17673037lji.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Apr 2022 08:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=PBLQk8hXfjmXS76rmeqn/RipwnPJvYH2YMxW0PEqxC4=;
        b=TeHDurG6UaxsNVfmwW17uakggl5LxYM2U0uvT6hKwWN/uNYuzryYQPqjmOxwZglEGX
         KFiA6HvBQfnYx+J6OyZX6zC7gKUln6wiL2hbBLC3VHILdBCtNY+rrnR0EzaLDyYmxx5k
         gGF6dehhjllPbMNA8LuRMHL7+bnz8trsaBHD3JeBMqecWHeeKkD2l0MNZeYYpakBD2ns
         GOvqK26IXMOXl31m/oDTzPCe/C5Hivmle5xBALzc/JQDqBxsdtUFKFD/PUkF4HpTrli+
         3e3tcxWkG94C6TcQxn3Y+MY/zZRefd1UfCTTCz7bNMGByMr6Yfojr1I1Xn2I1X/mIGJu
         rNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PBLQk8hXfjmXS76rmeqn/RipwnPJvYH2YMxW0PEqxC4=;
        b=ZDUrl09YoeL+QU2WnMY0A4vVgFSQx5fvkXNE1oRgLkXKyUhYep4AEQ/oARfckcf2gm
         FEz8bs16d8l+6kUiQnQ3eerMbO1LsHCoXdb0VfFQf8ppu/hrrCD3vgEknlP4EqWzrIEp
         JZzyKljnJF9w85PrDlEKmBZKnXUxwKj6UTApSwWJSDe9Ts2zG8SSLzJqFWp7wNILOWEO
         tjzJLk3NjKcK+tzFrux51/sHNxDMPblKjkiyfDfgPzCle4T0HPkff8HfzlTiBgNrfGFE
         EviI7LaOo/01GVhmEw6XEJr2/p7V5e9F+uUm5//B4Hkg48JFxyD6bVgB4MUQZ8MLXtLR
         lM3w==
X-Gm-Message-State: AOAM531l9NiHFXeSro19OX8ZwcTZa/K2Ak5vzJhBR0FXpIKSxTPJdaQs
        lvyKbcf8t6o2OjT9d7Tn134Sog==
X-Google-Smtp-Source: ABdhPJz5K8NFf3iPn5H2T3ZVcCqTbSxBRJrRMFzr+tNg5bVe2r3tzlZQPt7ms9y8TGMBs3rj2d558Q==
X-Received: by 2002:a05:651c:552:b0:24b:d9f:cef8 with SMTP id q18-20020a05651c055200b0024b0d9fcef8mr2672140ljp.117.1649173111074;
        Tue, 05 Apr 2022 08:38:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o19-20020a2e9b53000000b0024b15034f50sm794458ljj.3.2022.04.05.08.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Apr 2022 08:38:30 -0700 (PDT)
Message-ID: <dbe6d9c5-f717-785f-e65d-baa1328cea2b@linaro.org>
Date:   Tue, 5 Apr 2022 18:38:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8450: fix interconnects property of
 UFS node
Content-Language: en-GB
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220310221934.1560729-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/03/2022 01:19, Vladimir Zapolskiy wrote:
> All interconnect device tree nodes on sm8450 are 2-cells, however in
> UFS node they are handled as 1-cells, fix it.
> 
> Fixes: aa2d0bf04a3c ("arm64: dts: qcom: sm8450: add interconnect nodes")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Bjorn, could you please this pick for the -rc kernel?

> ---
>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 0cd5af8c03bd..bbd38b55e976 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -1376,8 +1376,8 @@ ufs_mem_hc: ufshc@1d84000 {
>   
>   			iommus = <&apps_smmu 0xe0 0x0>;
>   
> -			interconnects = <&aggre1_noc MASTER_UFS_MEM &mc_virt SLAVE_EBI1>,
> -					<&gem_noc MASTER_APPSS_PROC &config_noc SLAVE_UFS_MEM_CFG>;
> +			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
>   			interconnect-names = "ufs-ddr", "cpu-ufs";
>   			clock-names =
>   				"core_clk",


-- 
With best wishes
Dmitry
