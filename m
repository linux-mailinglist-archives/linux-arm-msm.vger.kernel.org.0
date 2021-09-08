Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2451B403D4A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Sep 2021 18:07:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343549AbhIHQI0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Sep 2021 12:08:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231734AbhIHQIZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Sep 2021 12:08:25 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62DEFC061757
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Sep 2021 09:07:17 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l7-20020a1c2507000000b002e6be5d86b3so1957363wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Sep 2021 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=GYpi6gE4nzN8o+CwjqakTN6E/NlmqkQ97rUaOk/UWX4=;
        b=dB7G61cBrEEZi4ZBM15sM0lRlQhSceRMs2j8VpUdowxIq7I+EV/O6tHzIlRKCQYMhb
         sqKtTBuda7JR29GXYY6wtlEPEmOdXuyI7/eQcNvuWD7Cd6m0WoBprusLR/6QX1edwqZP
         AEgnDtPlQkFvRAK8tJMfKHKW/BuNDC7p19BUYyqoOnFk34twoyiM63BUtq5fRNLxyUQu
         FhAQzzeo+b1ZVFvMKe/gu1jnlA1YwVlBXGS9QfgyV+mFfgc7UHcQHhb7OM4+wcj/jdTy
         QwVDcjJcgrc4vPhQrTFrGQYRbWhLz6d4x5VBLtaw1qcQwCtxkRx90tYfvdAdCEyJBoh5
         VguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GYpi6gE4nzN8o+CwjqakTN6E/NlmqkQ97rUaOk/UWX4=;
        b=UQlz0J5ROUO83nv7fAzKPKHcg7WWidsguiBfZb9mHZoor9FUQMfWwX0yaXg/+UXmcG
         G1hIuQjsQEyzESCh7aGf2jG6gYuZ4U5oMyB8V7xnn1lwHdKVuS9IbJ5XfAKrlpvDgGMB
         XOjpYzXJLVAbKUSi4fewVIykGihGRcIo0/cSSPhA20v+V9FPFefIeKHxIQ6c/rRFViR2
         GdXGl/FyEMk80XHyhhyRsnaE5KSslqCAdMQiWcKed4jx3dhs/A6tkKvRuaSGg6OCbjMl
         Osmu/ad9lfICB9Kwpy80ImDMRkcTtdHaqtLHMndu74njICjRbvJFHqgXzDV4i7nEPSd1
         oh1A==
X-Gm-Message-State: AOAM531zqyO+7p/uxL4ofop6M3JT3DGHHpq6IPGF0Og8HpKy82tp+Yvj
        BFKc0/bxdqj2FmVSKJj+PfwcOg==
X-Google-Smtp-Source: ABdhPJxayYYiB4BOAaE9G9T0xgs/ruopGjv/M4dqlYrqylq981dWEmgdngr8ZqrrDDkmypDvw7WByA==
X-Received: by 2002:a7b:c4cb:: with SMTP id g11mr4377562wmk.80.1631117235971;
        Wed, 08 Sep 2021 09:07:15 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id o7sm2359684wmq.36.2021.09.08.09.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Sep 2021 09:07:15 -0700 (PDT)
Subject: Re: [PATCH v2] ASoC: qcom: lpass-platform: Reset irq clear reg post
 handling interrupts
To:     Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
        agross@kernel.org, bjorn.andersson@linaro.org, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, plai@codeaurora.org,
        bgoswami@codeaurora.org, perex@perex.cz, tiwai@suse.com,
        rohitkr@codeaurora.org, linux-arm-msm@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org
References: <20210908142535.31106-1-srivasam@codeaurora.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <c29802c9-4577-87bd-b843-8540588c6d06@linaro.org>
Date:   Wed, 8 Sep 2021 17:07:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210908142535.31106-1-srivasam@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 08/09/2021 15:25, Srinivasa Rao Mandadapu wrote:
> Update interrupt clear register with reset value after addressing
> all interrupts. This is to fix playback or capture hanging issue in
> simultaneous playback and capture usecase.

Could explain bit more about the issue.
Specifically which interrupt and which ports is this issue seen.

> 
> Fixes: 4f629e4b8705f ("ASoC: qcom: Add ability to handle interrupts per dma channel")
> 
> Signed-off-by: Srinivasa Rao Mandadapu <srivasam@codeaurora.org>
> ---
> Changes since v1:
>      -- Update comments Header information with fixes tag
> 
>   sound/soc/qcom/lpass-platform.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
> index f9df76d37858..1a0a4b0b1a03 100644
> --- a/sound/soc/qcom/lpass-platform.c
> +++ b/sound/soc/qcom/lpass-platform.c
> @@ -749,6 +749,12 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
>   		}
>   	}
>   
> +	rv = regmap_write(drvdata->lpaif_map, LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST), 0x0);

Writing 1 to a bit of this register will clear the corresponding latched 
interrupt. So I don't really understand how writing 0 is really helping 
here?

Do you have this patch in your tree?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/sound/soc/qcom/lpass-cpu.c?h=v5.14&id=6a7f5bd6185e1c86256d5e52c3bb7a4d390d6e19


--srini

> +	if (rv) {
> +		pr_err("error writing to irqstat reg: %d\n", rv);
> +		return IRQ_NONE;
> +	}
> +
>   	return IRQ_HANDLED;
>   }
>   
> 
