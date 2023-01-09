Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7756662E40
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jan 2023 19:10:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236723AbjAISKD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Jan 2023 13:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237223AbjAISIz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Jan 2023 13:08:55 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B52917072
        for <linux-arm-msm@vger.kernel.org>; Mon,  9 Jan 2023 10:08:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so14238626lfb.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Jan 2023 10:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e1JMPoTV80PEJefONcOYlms/hHbc5vj9vRLyRa7UBTM=;
        b=wL3QGkdKztFOkWWeW09aqswuc2d3KrnalWesJnYDWz07wftez/OhOySylYmGPkbnXh
         v+gY20wHq44rAdZct4rxh439oyw4yJuAueOvueAk6bY8iun/fOAbt/MARe9G5NPzfGgL
         4OlPvd42d8ctkrUqp+QKrMsvRjiZ/SXnheyYzuhxaOhR5CBGqr5151o/HleYba9Exf1c
         gi5uGiRwkOtiXoPM3b0QU4nlerMA8Qt8xcmGMhgwfwdz48FUhujTs86X/ugCe5paRsq0
         j4yH6A6tf0gMlR7Y36vGYWcG70SOQH17nCHhSuvkuwO+pC+FLHKEzMXyM6Vesg7mLQIv
         dUHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1JMPoTV80PEJefONcOYlms/hHbc5vj9vRLyRa7UBTM=;
        b=oqMtO+7tHjE7McAaKAGGbTvJipinU27paVtxd8PGJDgaFh4Haz0SyVP8n/c/5Q9r9M
         XMLmbyKO3SnQ1FeEgl7s8d+yvIPZdsv5z7ngGMxEUov6mibW0BUY2xDJyXEHbkG7riGG
         a4cGt0ocmovxm8XVITfB4rPONdnSaiq3VOK3CXweGGUZgMD7ROoTXFe/xnWFb1Ihd7ns
         UofyPUyyFElRiMm9Md0cad3mfrXkUPBQe9n3IEGbMcY+0ot4KoSpAbiPCP5T7lg8uJYX
         jCfP8+mexGCg6nUSozSQnx3ISXrwM4xfzxhhYlFBnZd0+WgEmYea2vlkn0R2INYZT8YH
         rbNA==
X-Gm-Message-State: AFqh2krKou37Gqv6iS/XWsc7XdyxFqVhkTZ1fbS7ydrEV8vt2Le94k/i
        Xg/vAEYdTNOVcag6JfefAWZX4w==
X-Google-Smtp-Source: AMrXdXuHQ4Z4c3jNaPXxZMQVMkuAuL7LiQ/JV1NHaQswZ17QQXQ1WWKUQftP4wAWRoYpEIJgYWZPRA==
X-Received: by 2002:a05:6512:2591:b0:4b5:7dd6:4df0 with SMTP id bf17-20020a056512259100b004b57dd64df0mr18516952lfb.32.1673287693455;
        Mon, 09 Jan 2023 10:08:13 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id g2-20020a056512118200b004a27d2ea029sm1731866lfr.172.2023.01.09.10.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 10:08:12 -0800 (PST)
Message-ID: <7b1d8756-efd2-5dc5-a411-0b13b2de555a@linaro.org>
Date:   Mon, 9 Jan 2023 19:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 11/18] arm64: defconfig: enable the pinctrl driver for
 Qualcomm SA8775P platforms
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Alex Elder <elder@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-gpio@vger.kernel.org,
        netdev@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20230109174511.1740856-1-brgl@bgdev.pl>
 <20230109174511.1740856-12-brgl@bgdev.pl>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230109174511.1740856-12-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.01.2023 18:45, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Enable the Qualcomm SA8775P TLMM pinctrl and GPIO driver. It needs to be
> built-in for UART to provide a console.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d5c938adbd2d..6c752b9a4565 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -555,6 +555,7 @@ CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> +CONFIG_PINCTRL_SA8775P=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
>  CONFIG_PINCTRL_SC8180X=y
