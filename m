Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A033D73580B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 15:08:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231756AbjFSNI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 09:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbjFSNIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 09:08:15 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98AA91BCF
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:07:12 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f867700f36so2235638e87.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 06:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687179981; x=1689771981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jVI8pg98BUql3OuMDyD3wqVA33SBayOmHZbM1MnNiUA=;
        b=yx3khx9LZsHTzDNdk22FHYHgMyrvgjm8UuLGzNRPpFRJJS0czhCNQ/e58F31Zy/IfU
         2+uHGbEl2vsUgn0XPvhghFEskfVCLTOaSq9fEdvt4jNOzQIyUc65JmHc0ewoXCyQUFFZ
         VB26c86J/hxmIwNrrXZPtqYFqDv1KFc/ISoqcFRqEaQCQDa0x/bwG9CV2xHYRX3S6d/2
         y4PWesmRj+tk6r8jqEnLMLls12Euyo7iPhRG2YTaz/ge4N+AB3wm2R0ghFxfDiG/TBqf
         rfXMssVJKwkT18jxlgJ9dB8ii5SETyhDiP/ccCf/OvvZGcxjIYfJV4bD94l6y2dgZtmA
         m4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687179981; x=1689771981;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVI8pg98BUql3OuMDyD3wqVA33SBayOmHZbM1MnNiUA=;
        b=fHuTFPwpjIp4j+J6HpnlHy4/0AjKgujNF2DYFb5I+/SehTrrK3zfkmt3bL8vBXW88G
         7uF0vFEFYoK5abTZz42ITj9uFHvqpEyQU6o2zvFrfKsRakNkUB+lTV5eW1nsNVaeciO1
         iRacZb8oNWUcoMRqO8y6ZK4rxEZ/W4k26LEJLgn4kU3DyCgbpOEzGM+KMAuotW49ZjEp
         6NPu6sbLhOjQO35qpPt/TtJzMTqRI2ghADe5+FklRtsW7Mt/SiWeSHcO9rNbkjn+vw3/
         ycMqrI4Kf9r+gZ7o5CdLz6uQrrOyig6yi0unhhbR3i+KfuZvmWyL0x3T0uWNY5NJhhMB
         aMNw==
X-Gm-Message-State: AC+VfDyBmfwNAR/LyzvCFXK4XH9jF9nuk3jTdhcs2RtnfyQrAmfYxmIF
        6ql7E91DGKSXqMYOU8TzRmBMhg==
X-Google-Smtp-Source: ACHHUZ46x0wE9MWRF3vhsVksYZTVId5gXds2SKunqDVZcw9XOgpDHM9T9CXwUjuzHxeYx83ruskDvQ==
X-Received: by 2002:a19:505d:0:b0:4f8:5ede:d447 with SMTP id z29-20020a19505d000000b004f85eded447mr2926054lfj.28.1687179980843;
        Mon, 19 Jun 2023 06:06:20 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
        by smtp.gmail.com with ESMTPSA id b10-20020a056512024a00b004f382f34f05sm4267444lfo.254.2023.06.19.06.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 06:06:20 -0700 (PDT)
Message-ID: <b255e5ab-6a4d-2466-d90c-6a4a6122a8cd@linaro.org>
Date:   Mon, 19 Jun 2023 15:06:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm MSM8996 Global Clock
 Controller as built-in
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Rob Clark <robdclark@gmail.com>
References: <20230619125404.562137-1-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230619125404.562137-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19.06.2023 14:54, Dmitry Baryshkov wrote:
> The commit 8f680c287445 ("arm64: defconfig: Switch msm8996 clk drivers
> to module") switched CONFIG_MSM_MMCC_8996 to module, which also resulted
> in CONFIG_MSM_GCC_8996 being switched to module. This breaks useful
> bootflow for Qualcomm MSM8996 / APQ8096 platforms, because the serial is
> not enabled anymore until the GCC module is loaded.
> 
> Reported-by: Rob Clark <robdclark@gmail.com>
> Fixes: 8f680c287445 ("arm64: defconfig: Switch msm8996 clk drivers to module")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index f72d0f915340..2bff20171792 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1161,6 +1161,7 @@ CONFIG_IPQ_GCC_8074=y
>  CONFIG_IPQ_GCC_9574=y
>  CONFIG_MSM_GCC_8916=y
>  CONFIG_MSM_GCC_8994=y
> +CONFIG_MSM_GCC_8996=y
>  CONFIG_MSM_MMCC_8994=m
>  CONFIG_MSM_MMCC_8996=m
>  CONFIG_MSM_MMCC_8998=m
