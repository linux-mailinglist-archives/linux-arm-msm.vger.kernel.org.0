Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2CF687AF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Feb 2023 11:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjBBK66 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Feb 2023 05:58:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbjBBK65 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Feb 2023 05:58:57 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9A88712C1
        for <linux-arm-msm@vger.kernel.org>; Thu,  2 Feb 2023 02:58:55 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so1077262wmq.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Feb 2023 02:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UVC3BbCIKGwKEURboffcV34GlxCVIjCwQdv8Aw/FvBc=;
        b=NSlTIDIuXmr9NgzQl2ljftdQqscbgLmM96D3y9V9sYNrZSiu7WXdyrOZf1aaNeVxXJ
         CuunDZjDr09/Cn+xmJ6lxD49d4UDmurgZv+j8P8UFRDkZmjyQ/Sc0yTJ3sXCCUv56pYy
         bfDiIHEvJGj0Z0iIOpv03yIbxpVwUUUbRU4mvE5KjVQzts5vFFju1ZuCUmuBwhJzzfMQ
         uFl8/km3hcqaTjZ3oh7N3c9q1FB/k10A+v1QatIqEXQQqZKnuDt/pk2iDp0M8oZkKqlH
         C9uzeMyVPZ0ag98zy3c8OHcROza1M1HLe5QiFdnu6cFEaLoJBIkOT1Cjb+R+W+AsoTtz
         HHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UVC3BbCIKGwKEURboffcV34GlxCVIjCwQdv8Aw/FvBc=;
        b=4YKZmLI9B39HxRrcn1unoiVUCKaFzAq/rclkkgY4UoEFzmk0ptqw1Beakzy5UyTzOs
         6gpyyPWblQ37mbtzdDGIb2hNuLqvrFfFGSQzoAMBlum/p4rn1kxguOe2rX5yDLdQA4gN
         vYevQO/vPp1/CfP+ww8eGT26r7GVBzMTv+0P+sCkYbJZxUm9OX7n6PpevYPj+f5U9kmu
         lujv0K8OKj3QSH3KBJEmEm/KxahxGZDi2Zt5Ovf6AHKSsX+hIpgLdz0qzOWKc4Uu3fGL
         JiTnaeuYdhgdO/M6d2kBm+N4T0omQYOaHsA13SsZzoT8+nOXLMnRhaxSjgOu7iTKrsFI
         3rNg==
X-Gm-Message-State: AO0yUKWeFvs9d0+aq8mFa1I/R99BWLBXE868xvGaYlEv5PbrH6vE8Bgz
        RA4uP4D5u9Q+5Xp2AzzFgq9+bQ==
X-Google-Smtp-Source: AK7set83lIl4nGCVu7Pf1aCB5oUVzv4rO6WDAnBXErPnHSfhSs/9z3OqQW47YCDl+K02oT7+vlDn0w==
X-Received: by 2002:a05:600c:4f41:b0:3d7:889:7496 with SMTP id m1-20020a05600c4f4100b003d708897496mr5231407wmq.17.1675335534471;
        Thu, 02 Feb 2023 02:58:54 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n6-20020a7bcbc6000000b003d237d60318sm4322832wmi.2.2023.02.02.02.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 02:58:53 -0800 (PST)
Message-ID: <d006ea43-6aa1-89d9-ec6a-a44810d31bff@linaro.org>
Date:   Thu, 2 Feb 2023 11:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 14/23] interconnect: exynos: fix node leak in probe PM QoS
 error path
Content-Language: en-US
To:     Johan Hovold <johan+linaro@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230201101559.15529-1-johan+linaro@kernel.org>
 <20230201101559.15529-15-johan+linaro@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201101559.15529-15-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01/02/2023 11:15, Johan Hovold wrote:
> Make sure to add the newly allocated interconnect node to the provider
> before adding the PM QoS request so that the node is freed on errors.
> 
> Fixes: 2f95b9d5cf0b ("interconnect: Add generic interconnect driver for Exynos SoCs")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/interconnect/samsung/exynos.c | 6 +++---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

