Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBE42613D58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Oct 2022 19:29:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230092AbiJaS3Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Oct 2022 14:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiJaS3K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Oct 2022 14:29:10 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 409AE11A06
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:29:09 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5so7628896wmo.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Oct 2022 11:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlUfkjYYiQUn+hV5fhdZbKU09G31Rb+nq+V7VvzQ2Fs=;
        b=HZ/0UJ8wkTGZ/sCQeiRZoBv52Db+m0n8A3KfzelK5fr4LXUcAMToPZ7R7FfWtUVw4a
         za9cQ5L+iQYLdYSD0Y84NljCjxTqe/uSH/8CIHWAakb/Galvyx0733h3HTD8as01M+ZW
         EZC1Fnp6qRtvbrrADEIZ1v8Mfi+Hr4NegLHLFJ/VwjHKBX13OVzX9qOYyszmARfjZy1d
         wizxDraCQfrxtSIatUxunX+VHKU2aSuRf1VqAPLA2CSsp72/LkDpRB0MrawrGXfSL590
         QdaFL2kmDz8rjbSkvYbka9fMQRco/y+nSO7h2XnneQ3FrNgWj9MSsENgDPcV3U5jqUTe
         vbyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlUfkjYYiQUn+hV5fhdZbKU09G31Rb+nq+V7VvzQ2Fs=;
        b=fxCVdQN6sFXIsEi3Rmx5t9f2nfkiJ5z4RFcy7RWnhZ36vXGDNhWWIL0LvwcT4rpCdN
         ui5FJBzPJVIMI8GezYemNFqjq7M4ZVALdOycqmiLYLPK9vU0Sqe2K1yaZQE3S4na1RKL
         co+pV+KzCSceljtLAJCuhNPzBWJRdnI/qaoi4Cm9JUkY32Qwwn7sEvsLkw3/ask1VeP8
         SSrdMMWsoJ9HvAOQ+CJSkLQZG5i/VKufj89CAht/bVloR80rkHBzhWyb8yOSwWUc1+s0
         dGx6qrFyJQjTpSGch8g1b0SR+VZFIdECdpuMN9jRcI+nWsLtP59ATYwWNIIY1VinmqXa
         eOBA==
X-Gm-Message-State: ACrzQf0anQZ0aL6Cn2QdzvJQhDpLLh4CQQcVl9F2t8exB7n8tX6pBTFx
        K9GGjvmxYURBYNOyFhaNIxPVyw==
X-Google-Smtp-Source: AMsMyM78R6nUUr+MeluBZtUpWGSDuxd/FMrN+uJmxzmIigg7TLZxDyukSL5adbjFn2RdeWVvBW8qpg==
X-Received: by 2002:a05:600c:695:b0:3c6:b7f1:6f39 with SMTP id a21-20020a05600c069500b003c6b7f16f39mr9385279wmn.5.1667240947769;
        Mon, 31 Oct 2022 11:29:07 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id bj29-20020a0560001e1d00b002366b241cf3sm7746285wrb.35.2022.10.31.11.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 11:29:07 -0700 (PDT)
Message-ID: <8e3bd948-6649-742b-ea4c-4f7236d156a5@linaro.org>
Date:   Mon, 31 Oct 2022 18:29:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] slimbus: qcom-ngd-ctrl: check for device runtime PM
 status during ISR
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
Cc:     Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
References: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220928132011.455347-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 28/09/2022 14:20, Krzysztof Kozlowski wrote:
> Slimbus core interrupt is getting fired after suspend. At this point
> ADSP slimbus hardware is off with gated clocks which is leading to an
> unclocked access when HLOS slimbus tried to read the interrupt
> status register in the ISR.
> 
> Co-developed-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied both,

--srini
>   drivers/slimbus/qcom-ngd-ctrl.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
> index cec11aa106bf..ba36eb5c0de3 100644
> --- a/drivers/slimbus/qcom-ngd-ctrl.c
> +++ b/drivers/slimbus/qcom-ngd-ctrl.c
> @@ -763,7 +763,14 @@ static irqreturn_t qcom_slim_ngd_interrupt(int irq, void *d)
>   {
>   	struct qcom_slim_ngd_ctrl *ctrl = d;
>   	void __iomem *base = ctrl->ngd->base;
> -	u32 stat = readl(base + NGD_INT_STAT);
> +	u32 stat;
> +
> +	if (pm_runtime_suspended(ctrl->ctrl.dev)) {
> +		dev_warn_once(ctrl->dev, "Interrupt received while suspended\n");
> +		return IRQ_NONE;
> +	}
> +
> +	stat = readl(base + NGD_INT_STAT);
>   
>   	if ((stat & NGD_INT_MSG_BUF_CONTE) ||
>   		(stat & NGD_INT_MSG_TX_INVAL) || (stat & NGD_INT_DEV_ERR) ||
