Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 889D57436C2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jun 2023 10:13:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232253AbjF3INp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Jun 2023 04:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjF3INm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Jun 2023 04:13:42 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89A1F1997
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:13:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f766777605so2507591e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jun 2023 01:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688112820; x=1690704820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mATsalF8ij180CRAWepYO+45OI7CgFAF3ABhqAFWSnA=;
        b=zjeVN9pJuhmAZQG4sTl4aWH5Wd1sOTaoMV3NcpBPNDebbWoPNR1xwqaTvfBCq8dbLf
         ijpf9uB5OwOoad5eF6Xlxy2gk1SaWI10JDxn9eh2rs63w/v0CpIQP+HjjhLPeko37IjE
         RVpfjqXYoTSzQgFH4UzzPwnGNKtJV2o2cADCWTKytVQpw3hjjZMoyVjrJ8iVzJjVYYDo
         fHG6aZ7qVAIqA7D3iLYmhdrcjI6q5ithCTV+8RAzIV1bjUbG2ZpZhNcgvamM7deIxcBe
         XhxMFP4mhzlyKfoHNVwlSyoNd5gaFN1Yftu/qp6eQk/NTMyQNfNtmj+MadaJcgrbJyDm
         1AaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688112820; x=1690704820;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mATsalF8ij180CRAWepYO+45OI7CgFAF3ABhqAFWSnA=;
        b=ZPSMSV8fx9LUvNNd+r7+4AXzdCqbXsmRuSTrvGzlDQW4kCmDmB5Ndwgof21FwD/3Ee
         CGav2KQvjzfDTwGqbh+P/rI8mrcIqiBS0L402kXFODoAHMPkaMTbnvP0wuFv6zRlZDpZ
         bKtymSD0uQ6xdGUnKE7FbKbwjSALSZUSZpg5TtW62KtYXtOv8aH7C7/TdLSz5XHAT1IU
         exMjpwUn1+f1v2n5wLNJTcnDFHcrXBenjTF5C1Wul/HKQ+F3Ak2JHTrbhljOusjVTEOl
         HWOihskkMPN5dYHeqyfXIJr79Zp2I1F6ZzivqVYF3yNT3ouZjvx/fB8iNpku95WsYc13
         yjUg==
X-Gm-Message-State: ABy/qLZiCVVqadddPtYzHtgzuRkVXpOiC40HYPK8ZfrYAMXSrOo27rnz
        6k/zl7IaNTu57VO/qgSbwWivKA==
X-Google-Smtp-Source: APBJJlEQxVhFfIVpE1X8pDoNxED7S9bVOZRjUEs5/rDKjNqU0Sp3uOOx3jnrDzEluvIi44+pB0WJCQ==
X-Received: by 2002:ac2:5e6b:0:b0:4fb:744c:2e9a with SMTP id a11-20020ac25e6b000000b004fb744c2e9amr1458508lfr.32.1688112819697;
        Fri, 30 Jun 2023 01:13:39 -0700 (PDT)
Received: from [192.168.1.101] (abyj222.neoplus.adsl.tpnet.pl. [83.9.29.222])
        by smtp.gmail.com with ESMTPSA id v11-20020a056512096b00b004f76658694csm2614558lft.238.2023.06.30.01.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jun 2023 01:13:39 -0700 (PDT)
Message-ID: <ace0b594-c1d1-09b9-7402-484091268a55@linaro.org>
Date:   Fri, 30 Jun 2023 10:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 5/7] arm64: dts: qcom: sm8450-hdk: remove pmr735b PMIC
 inclusion
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230630061315.4027453-1-dmitry.baryshkov@linaro.org>
 <20230630061315.4027453-6-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230630061315.4027453-6-dmitry.baryshkov@linaro.org>
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

On 30.06.2023 08:13, Dmitry Baryshkov wrote:
> The 8450-HDK doesn't use PMR735B PMIC. Drop its inclusion to remove the
> warning during the HDK bootup.
> 
> Fixes: 30464456a1ea ("arm64: dts: qcom: sm8450-hdk: add pmic files")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
That's.. strange.. Did you confirm this with schematics, or even better,
socinfo?

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index bc4c125d1832..dabb7e872f38 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -14,7 +14,6 @@
>  #include "pm8450.dtsi"
>  #include "pmk8350.dtsi"
>  #include "pmr735a.dtsi"
> -#include "pmr735b.dtsi"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8450 HDK";
