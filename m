Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9986FDE2F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 13:44:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727851AbfKOMoI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 07:44:08 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:39188 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727705AbfKOMoI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 07:44:08 -0500
Received: by mail-ed1-f67.google.com with SMTP id l25so7247620edt.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Nov 2019 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xR5jlMTS/0mlZS9BTKyNRoNtTkP0SvB+AtI0uCjnmWc=;
        b=VxqQGUWcBlv2aNQVn8vSNrrxzjzWrOIDktSkPUulLRJhNNTdjFeZDb5/fVRjZTKnP8
         1jFt7rqqvZPT60aPFJxeup0IbaWzHmxlWlgaVUJIL1TtXOTh4iAcK40t7HoRPhANsmQu
         kB0cWIoWj0D+kjzgn8P/6gGwd9dBVRp4FVGamy7ekphA+aehFSxwtzTJMED7mnXhskBV
         en97mf3TQVlhV8ihLGsVyetY+8B8GFr19ARx7/jixLfUYlGiPg+gZDnYpLChpfIl+Sn4
         CbP5JB1dpPPQ9eIkDiuFLigvqHFDG0/g4sjr0SKs+pJVjfTVZ2HMBKBR2djjcF3SS7yU
         U3DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xR5jlMTS/0mlZS9BTKyNRoNtTkP0SvB+AtI0uCjnmWc=;
        b=GiwkLalRbcEhRHh90WMOLBQVZeIVTTjJsDnj3LVm6rVYogaVC0X4NZP33O1VuM0ZE/
         648MQVcmPg/SooRnAZ9Co1WiqZ7PItZBsd9tWYDTypXO7438uWlzmmilOkEZ7GwhKf6O
         Sp8sX/J7y/JFnl4N96OOJlM+rk2bxjye2DykoVLMeiZUmIoYS3xHeTIJ1bMzDQHqM8e1
         lEjfE31mIVHcux5qKwWBlDAV2jcNMtJZSd2LH/7Zdx1WPYxIoCYQ8ZncwcRh5oAqMGhR
         oZ9xoOdNyCYkmlIAW84xmNGBqcs4Mu21EOb4OcYOArX1iYP7SiJ4hHFjiEZleXNuCodN
         zqsA==
X-Gm-Message-State: APjAAAXHtI0RxzfTzQJSX6CNRDoGppE/3RqKGzVXMaamIQxvOKEcHDzg
        13Qx28Cc+HT5QrZiqYoalHIfDg==
X-Google-Smtp-Source: APXvYqwazSl6duqZxWH30Xs6SO99FC1WQeKgdjbmW3vMfzXpP4Vmy/3XbLKCb0ygghb37l01a0+Syg==
X-Received: by 2002:a17:906:af5a:: with SMTP id ly26mr693135ejb.252.1573821845901;
        Fri, 15 Nov 2019 04:44:05 -0800 (PST)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id n3sm563860edc.49.2019.11.15.04.44.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Nov 2019 04:44:04 -0800 (PST)
Subject: Re: [PATCH v5 5/5] arm64: defconfig: enable
 CONFIG_ARM_QCOM_CPUFREQ_NVMEM
To:     Niklas Cassel <niklas.cassel@linaro.org>,
        linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, amit.kucheria@linaro.org,
        sboyd@kernel.org, vireshk@kernel.org, bjorn.andersson@linaro.org,
        ulf.hansson@linaro.org, Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org
References: <20191115121544.2339036-1-niklas.cassel@linaro.org>
 <20191115121544.2339036-6-niklas.cassel@linaro.org>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <aed0bac0-ca9d-febd-ac57-120e60e99e0d@linaro.org>
Date:   Fri, 15 Nov 2019 14:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191115121544.2339036-6-niklas.cassel@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Niklas,

On 11/15/19 2:15 PM, Niklas Cassel wrote:
> Enable CONFIG_ARM_QCOM_CPUFREQ_NVMEM.

Shouldn't this be selected from qcom-cpr.c Kconfig ?

> 
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 4385033c0a34..09aaffd473a0 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -88,6 +88,7 @@ CONFIG_ACPI_CPPC_CPUFREQ=m
>  CONFIG_ARM_ARMADA_37XX_CPUFREQ=y
>  CONFIG_ARM_SCPI_CPUFREQ=y
>  CONFIG_ARM_IMX_CPUFREQ_DT=m
> +CONFIG_ARM_QCOM_CPUFREQ_NVMEM=y
>  CONFIG_ARM_QCOM_CPUFREQ_HW=y
>  CONFIG_ARM_RASPBERRYPI_CPUFREQ=m
>  CONFIG_ARM_TEGRA186_CPUFREQ=y
> 

-- 
regards,
Stan
