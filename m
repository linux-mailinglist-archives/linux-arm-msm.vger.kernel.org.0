Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DE9395BD6F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 00:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiISWNN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Sep 2022 18:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229739AbiISWNM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Sep 2022 18:13:12 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505334BA76
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:13:10 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id o2so737802lfc.10
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Sep 2022 15:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=fW+BG/ifotJzpbpYrUmfeXzsvH+V22SmlVB0fmXMDBY=;
        b=zHSp0dAkCWyMONr1qxKlKhqnKlB+iscpGidOopbZzIQW9XUXnvlhqNAwFlNLoNj1s5
         16V0DjZ06LoA5RiLLv3e8sa4YdfNjMAaKXau8a1wjIDAw69PDWGIqrgkgNggKz5HL2EE
         3tmknEpEPRm/GIBv32Yl/MWB6TN9zPIxHy5+bQB5UEU85g36ZHGOQyn7rPs92jsIVYU6
         pJjJKX9RT6DPCpD3Y0mQhMuAVQbfs/MJxZN7mfX1IS7c44pJel0kDIxYxiMCFMvWf+FN
         8DkPXqXip3SLO3FNtiL634SpSM+8o2Y18F3xiNvyT3PcVvGOws0SEapq5T6kZEYcyqEX
         bmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fW+BG/ifotJzpbpYrUmfeXzsvH+V22SmlVB0fmXMDBY=;
        b=V0+VwRE4NNe2F7DJBK3ycwuG/vqbKitwW5TQArop0/KV7FKRsnL8W2GgHfQUEskLkl
         KtlwxM9lBmTjhBdVUBccRv4I+JiQskJCHNVUeOFvw338oaL9GqXR2wSX8vYjgzrfB7NP
         IB27nOChp6zswvQsNfTYH2DynzXyPZ5w1E8PueHnm6ZxXDD5UTgmw626drYjpUjjMUvw
         zF7cm8lIDBV/VxOPxLqP4yBzD1bSPVwGoM7Yggvv+rgEcGin5Uom9cJO5WX3cTOWjoCB
         budzBSAnexm/dOb6fN5WGIR7L+RsWqrD32ZjSW+BC/eGQCqQwUd3NnSJzDzMGtg72VE8
         kCRw==
X-Gm-Message-State: ACrzQf2kVj+H4C7vkY65np6KUd/k0NHq15YAwW/vHdNiIdWMm2PDZnWu
        dJ7N1gltxspNGODRTrNs+HxR6Q==
X-Google-Smtp-Source: AMsMyM6ic1gA/caHy9x6orElbheB+k7wWcsArpMWT+flAE3i3cuy4q0qCbblGvLZooRIMIzwVVr0Kg==
X-Received: by 2002:a05:6512:3daa:b0:49f:966f:254a with SMTP id k42-20020a0565123daa00b0049f966f254amr3646871lfv.73.1663625588688;
        Mon, 19 Sep 2022 15:13:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf11-20020a056512280b00b00499b232875dsm5257177lfb.171.2022.09.19.15.13.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 15:13:08 -0700 (PDT)
Message-ID: <9f47ef0f-6e73-9ed4-55db-491d22c55c76@linaro.org>
Date:   Tue, 20 Sep 2022 01:13:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v3 08/15] arm64: dts: qcom: msm8996: add missing TCSR
 syscon compatible
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
 <20220909092035.223915-9-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220909092035.223915-9-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/09/2022 12:20, Krzysztof Kozlowski wrote:
> TCSR syscon node should come with dedicated compatible.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> index 166374566a49..5f45d0589265 100644
> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
> @@ -3499,7 +3499,7 @@ frame@98c0000 {
>   		};
>   
>   		saw3: syscon@9a10000 {
> -			compatible = "syscon";
> +			compatible = "qcom,tcsr-msm8996", "syscon";

No! saw3 is not a TCSR. It is a separate region, which should be managed 
by the SPM driver.

>   			reg = <0x09a10000 0x1000>;
>   		};
>   

-- 
With best wishes
Dmitry

