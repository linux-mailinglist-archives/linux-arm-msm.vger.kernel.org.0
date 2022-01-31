Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42CC74A4E4F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Jan 2022 19:30:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355791AbiAaSaR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 31 Jan 2022 13:30:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350610AbiAaSaP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 31 Jan 2022 13:30:15 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 909ECC061714
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:30:15 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id u13so12163978oie.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Jan 2022 10:30:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Wz+52O1sEe4yMU2DP8cAnXwi5ZmdP6DQYRKFBEGGW7k=;
        b=UP4e4AqLkRV0jMmnXPExayUnadg4bbzbwyxrnmqueLM8QEGOutpDIDBzstyKl82jvW
         2GaP3xGF8uXFOFsNJE5UM9Tbw1VQBxN2NpMJEm/rVO7vL9HbQS59zx62MUZYGfccGR5A
         BMbDmwfRSYEpwiH9QTa5png1o2xIkIDGDiBqiFcfEJpXTc3Tcj9FH9iuDXkjJP86L/xH
         Wtb77hyN3e0m6ZIoh2cJ2KNIACrV8ZgxxoLJUJk6luBgPTT4MnoIQ4EbC3t7cHLCzbro
         LKpSCXhXtw+2vhI0W3zw9kzKLVi6GSpiRsGn15VCKPfCr7XLTNQ9Jg3VZqMrtUtKbv5L
         y+tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Wz+52O1sEe4yMU2DP8cAnXwi5ZmdP6DQYRKFBEGGW7k=;
        b=EnUO38lv64AUXZXc1c649/5os2Ejn8rUJgRXHwKzkU6PvLJFycvt14dsbMlHvkXjpQ
         osOP7n691FZtDXQPSp6S8C10cnhc3OkvRbgVH+EVHeL8VWBK/iJj+UdDcp/irnKsDXXM
         bai/Xn2NMuwGKyarvrDtLYLJaLeNmGtGcex2YyNvXbUgJchyJiDUGd/8cxKIZykchsLn
         4q2dzPOcU9vFurKxq30fKgOhuR0EmwZap0idGVL/t1C4NqJMq8xI9H4bdzLAk3mA+u65
         4KIQnwVOP6uJ8KSwPUfpBnhaDBQCNdgoX2e5m0yhN01bVVrqLMqI6zjqccDLtJwLSFOn
         KVHQ==
X-Gm-Message-State: AOAM530jwCcYrD1K+w0oJwb0j3VZ/ytKkP9oy5u2+RtzkfIf+T7G9A/R
        ggaejpdHTbdy9Nj7YOn1XFT+xg==
X-Google-Smtp-Source: ABdhPJwKqTwPWJHWivtxjYHMIKp4Hb4xk7HOPgrRoowBtATJ2jDtlxoBUAFZljdne6IbFDbfl5uBZw==
X-Received: by 2002:a05:6808:212a:: with SMTP id r42mr12442042oiw.94.1643653814964;
        Mon, 31 Jan 2022 10:30:14 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id h27sm11827377ote.57.2022.01.31.10.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jan 2022 10:30:14 -0800 (PST)
Date:   Mon, 31 Jan 2022 12:30:12 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        An?bal Lim?n <anibal.limon@linaro.org>
Subject: Re: [PATCH 4/5] arm64: defconfig: Enable PM8916 watchdog driver
Message-ID: <YfgqtM5HmQ1U5pVS@builder.lan>
References: <20220131165056.2117434-1-dmitry.baryshkov@linaro.org>
 <20220131165056.2117434-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220131165056.2117434-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 31 Jan 10:50 CST 2022, Dmitry Baryshkov wrote:

> From: Aníbal Limón <anibal.limon@linaro.org>
> 
> Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>

I need your S-o-b appended to the author's as you handle the patch (same
with the last patch).

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index bb30afa95a73..8a68dadbcc7d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -596,6 +596,7 @@ CONFIG_QCOM_SPMI_ADC_TM5=m
>  CONFIG_UNIPHIER_THERMAL=y
>  CONFIG_WATCHDOG=y
>  CONFIG_SL28CPLD_WATCHDOG=m
> +CONFIG_PM8916_WATCHDOG=y

Is there any reason why this is =y and not =m?


PS. I'm picking up patch 1-3, no need to resend them.

Regards,
Bjorn

>  CONFIG_ARM_SP805_WATCHDOG=y
>  CONFIG_ARM_SBSA_WATCHDOG=y
>  CONFIG_ARM_SMC_WATCHDOG=y
> -- 
> 2.34.1
> 
