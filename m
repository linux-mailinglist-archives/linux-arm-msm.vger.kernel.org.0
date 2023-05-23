Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9853670E387
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 May 2023 19:46:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237764AbjEWRbj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 May 2023 13:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237930AbjEWRb3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 May 2023 13:31:29 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01D08BF
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:31:04 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2af2e908163so964691fa.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 May 2023 10:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684863055; x=1687455055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JaflgveLXL7m+6yMA0HW0dxwhD3rffmkR7JZum8eVxY=;
        b=ohh51nfOQfx9SU32lacMHTF+3SphZVi6DDcQfgmLr8IZb8r9CSficvzH9r4b0KQFAP
         /tHVSVPM/WZTWavoeFUjGDPn43TfPIH2OHLXB3yecbu6fYCk/2f5pW4bBeNmoUWL4CnQ
         WcswQl78ZvlNCYPTxb4aK9gJRj+AltfD+qVPaKd7hoAFe1JTdwKuGckaVt+IL5SbMMDv
         mDaVamvMvk1RBTZu54BdSCQJolGl+wTo9p1qcX9/XeiKSRZ1KFcnxbWJLHwTFsBbnJEN
         eeTCfw/PtZxC89Z4+Kzc+9+7wBXbyEbshdYElJsbpvYrMD5YBMKDWL4KnLFfIEDL3e0S
         fpVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684863055; x=1687455055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JaflgveLXL7m+6yMA0HW0dxwhD3rffmkR7JZum8eVxY=;
        b=BX6zsXKp9a/IN/Hm9PZ5cgkJM2vQH3MQ1Gekh3Q4E2n/fmykk2ZLAuQVRuOZI2D8Z0
         FdtttwEH1jNPoqlt0zfaHV/AmW7zW0f8FvXbB7WOo3JraAoJUKuKpCq1VG36v6n2/Mlw
         kjnFsfS92/Tu9DMoRceD9wckAlfTV061NrwTn3hErjt5SDHg1okbtK/cg8M9URsqYzUD
         gfhS7jzyD/cBduieJPkxnz7iswIea8OqIbb6y6qT1z3vY0YdWxwxXZYAeD56JnqQCKwB
         Q0CnoZkeZ8GbUguDgZkKCsNTzGq15J6eprm7h/TWCA1m2xYAsFTXvho+IInTki58TCPi
         NaMg==
X-Gm-Message-State: AC+VfDz3svZtRePSqYEqYgoZtjEfFFKfaT3gvTelqhn0FH6el2dcr8zZ
        ujfCvwHJcbmsJwotUNsa4tjhCg==
X-Google-Smtp-Source: ACHHUZ7cO4Bhv51FK0gxnZXonOlZCGa7JLPzOJqogflN8xei70zsxt95KWC+5RbX19swMp0h2BzhQQ==
X-Received: by 2002:a2e:9b0d:0:b0:2ad:8ffe:5f37 with SMTP id u13-20020a2e9b0d000000b002ad8ffe5f37mr5988019lji.47.1684863055006;
        Tue, 23 May 2023 10:30:55 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
        by smtp.gmail.com with ESMTPSA id u11-20020a2e9f0b000000b002a8ec99e0e0sm1699176ljk.70.2023.05.23.10.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 May 2023 10:30:54 -0700 (PDT)
Message-ID: <ac36c9e5-fe14-f60c-01a8-27c814c668c3@linaro.org>
Date:   Tue, 23 May 2023 19:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 4/5] arm64: defconfig: Build display clock controller
 driver for QCM2290
Content-Language: en-US
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Arnd Bergmann <arnd@arndb.de>
Cc:     Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20230523165411.1136102-1-vladimir.zapolskiy@linaro.org>
 <20230523165411.1136102-5-vladimir.zapolskiy@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230523165411.1136102-5-vladimir.zapolskiy@linaro.org>
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



On 23.05.2023 18:54, Vladimir Zapolskiy wrote:
> Build display clock controller driver for Qualcomm QCM2290 platform.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ec9b828b14e2..3ec556cdfac3 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1164,6 +1164,7 @@ CONFIG_MSM_MMCC_8996=m
>  CONFIG_MSM_MMCC_8998=m
>  CONFIG_MSM_GCC_8998=y
>  CONFIG_QCM_GCC_2290=y
> +CONFIG_QCM_DISPCC_2290=m
>  CONFIG_QCS_GCC_404=y
>  CONFIG_SA_GCC_8775P=y
>  CONFIG_SC_DISPCC_8280XP=m
