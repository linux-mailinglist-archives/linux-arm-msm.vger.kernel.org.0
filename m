Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98D0E6B03AD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Mar 2023 11:05:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230021AbjCHKFJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Mar 2023 05:05:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230317AbjCHKEy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Mar 2023 05:04:54 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE4649E64E
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Mar 2023 02:04:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id s20so20589506lfb.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Mar 2023 02:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678269889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mWFsxFwVhSvF2tAKj3NHwOEqpw5p0HkmWs0foz0pDZY=;
        b=erwupAxvDOxXVOj8/ykksCMf2Z4w0WPsUhgizUqPAysFg/85cO6cilSYHfUBqzr5H1
         Ma2NzZ0ZKav/qwAj9KVraK2g75OtOjCG09j3fSPzFfOu4aZrs1iculEkKpuHPy/sOHo/
         98mFiceKRg+TSjvNVX8XmtqSgm5ppSc7PT2zfKKMkbxpXDULIXjmoFKSuM0iTf0CMcxL
         n9k8bGFoXR74IfnqBjF+R4byAU14W0TTKeTjEQpxzpzIskZ0AsK6cRnZXEUW2goz03ug
         3d5xw1i9YWggJ4RCT0ZyIxMDHdE8Ef0PJmrGgghLOl7X90PEkgIL1pGivP/1Sr0QG84i
         XEng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678269889;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mWFsxFwVhSvF2tAKj3NHwOEqpw5p0HkmWs0foz0pDZY=;
        b=iR67aSAYR26P/krZ3jcYQAvvz4eXybbjss+epAHqmyVo5FMlGmIQHfmdxlsg4A03by
         GPvUJ6UbEOEvJ/Z9nYWVvCw9vPFCYF54mP3ss3OAStS5WpN2wapyRLCzjWoZYNSlIcqN
         kLhv2tqDPu+a4fQW4hdUqS9uqcRtkNeuQ8M+hoeMjwI26hgIISmkvgdenwYWvJLGho8v
         sSdo/wt+pVtwKlYea8xtMZbk5GpWwTa407E3iXXbgAw9UONzz+qny5OXxAgoa4wbiXDv
         EoB9MWjTR7vcxhBBB4iw5/H6C83U8KwBFnhN5BhnsrboKOLluen7P8Eff7lll8buQuv2
         l+Dw==
X-Gm-Message-State: AO0yUKXG4bnj9a4PVc0bZKU7rKOKeFxkHgQE+wQxXngNDECFgx2vWk9A
        sWL8SYfT6iDbyW/QlJMSh1PpgA==
X-Google-Smtp-Source: AK7set/3DbXL/15LtNeEfZzRF6XvdQIUlZ9EDlQo3opU2yBVuA22cY5ZBZqtpmBAPCOHczkZFPgQcg==
X-Received: by 2002:a19:a409:0:b0:4e7:fa9a:4d3c with SMTP id q9-20020a19a409000000b004e7fa9a4d3cmr3952540lfc.16.1678269888787;
        Wed, 08 Mar 2023 02:04:48 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id q15-20020ac2510f000000b004cb8de497ffsm2275424lfb.154.2023.03.08.02.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 02:04:48 -0800 (PST)
Message-ID: <6b35ba80-3fc8-8815-60e4-49a9b8f443d7@linaro.org>
Date:   Wed, 8 Mar 2023 11:04:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: dts: qcom: sm8550: Mark UFS controller as cache
 coherent
Content-Language: en-US
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230308054630.7202-1-manivannan.sadhasivam@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308054630.7202-1-manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 8.03.2023 06:46, Manivannan Sadhasivam wrote:
> The UFS controller on SM8550 supports cache coherency, hence add the
> "dma-coherent" property to mark it as such.
> 
> Fixes: 35cf1aaab169 ("arm64: dts: qcom: sm8550: Add UFS host controller and phy nodes")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
Cc: stable@vger.kernel.org # 6.2

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index ff4d342c0725..5315e24fa525 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -1905,6 +1905,7 @@ ufs_mem_hc: ufs@1d84000 {
>  			required-opps = <&rpmhpd_opp_nom>;
>  
>  			iommus = <&apps_smmu 0x60 0x0>;
> +			dma-coherent;
>  
>  			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
>  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
