Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB72150F2D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Feb 2020 19:14:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgBCSOR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Feb 2020 13:14:17 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:36484 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728646AbgBCSOR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Feb 2020 13:14:17 -0500
Received: by mail-pg1-f193.google.com with SMTP id k3so8238980pgc.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Feb 2020 10:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=IVwPeQjWnavkYSmreRihBcQCqzcKg6GvGjN7vrooL6I=;
        b=DtX5C74mzvURRslkfhYTbEWniKOBw9KEJSR3cHSmYH69gU2PWjEz+geJRVgphNtLbk
         F6crXZWVvIdzHd6d4EfPrqX5UJROzbjwFQrlC+pCco5HrIMJbpSt/hyytkolvwhtzHls
         ldq23iqkmxJ99PzYXSMzkMqK4tpGoQ6IRRR3ogFKz1EO1FCjYrW0lEQf4+3jvUypIUGK
         Ldx1tW5YsUZQaFfqc7+xet3qac+Lxs3QEyJiqXdlNRR6m0hF3vQ1u3isU5mAevs3Zlo2
         UwN564q2bAIua7iFzbObi5cErmMrfSPIuGQjXotXeyxw5IRUtRDGEygMrHBh+HZ1GTBR
         6I5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=IVwPeQjWnavkYSmreRihBcQCqzcKg6GvGjN7vrooL6I=;
        b=ZLw15Yz0oNLzKjAdkqL2cY82RyrRyZ2PwEqnPIL8/VFuWAndvuUfKaUN0A+f9Dupoy
         OTPAblJiRmCupQsNUHlJnnfPBAzFJdkcddbeyAMWU177s1IMtq3EnMTex/T5TGb4y8op
         4xQU5hg5TIpfv+7Y3XJ6pMmYR5rBNNVscAx4kgFqtqbVc+l0myc/Y9N/OwiZJm3uTdE1
         U1x5vsYNH/XMEfBSiFRzSfaZa1r0AASLED251Tp+utvxgPEHxxKe+L1y3UzwiVgbjMEg
         DSQQALFm9aWWUtPXbBVdWNxZXn/RKc2K6+JYLIDKCzZdrKyiffgHmDJ6rKqlvHeHLa5K
         mI7w==
X-Gm-Message-State: APjAAAVTyIFc74zJwImkwqwqhvTPVpB77TwZ11Zbk6HDpghAzsbrr+8e
        Y8i0CGPFkojCqbMm+RVkeDVeBw==
X-Google-Smtp-Source: APXvYqxkgpl/cr1CnUuiWJNV7TN7ZP1AWB4FhxD0zzu8YMafzUAWo/WgGlqMypt9vpgwtQ17L8/NPg==
X-Received: by 2002:a63:7949:: with SMTP id u70mr25980401pgc.233.1580753656675;
        Mon, 03 Feb 2020 10:14:16 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id z14sm19775106pgj.43.2020.02.03.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2020 10:14:15 -0800 (PST)
Date:   Mon, 3 Feb 2020 10:14:13 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Amit Kucheria <amit.kucheria@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        swboyd@chromium.org, sivaa@codeaurora.org,
        Andy Gross <agross@kernel.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/7] drivers: thermal: tsens: Add critical interrupt
 support
Message-ID: <20200203181413.GF3948@builder>
References: <cover.1580390127.git.amit.kucheria@linaro.org>
 <932e07a83fed192678b8f718bbae37d0dc83590d.1580390127.git.amit.kucheria@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <932e07a83fed192678b8f718bbae37d0dc83590d.1580390127.git.amit.kucheria@linaro.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 30 Jan 05:27 PST 2020, Amit Kucheria wrote:

> TSENS IP v2.x adds critical threshold interrupt support for each sensor
> in addition to the upper/lower threshold interrupt. Add support in the
> driver.
> 
> While the critical interrupts themselves aren't currently used by Linux,
> the HW line is also used by the TSENS watchdog. So this patch acts as
> infrastructure to enable watchdog functionality for the TSENS IP.
> 
> Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
> ---

Please do provide a changelog when respinning your patches.

>  drivers/thermal/qcom/tsens-common.c | 120 ++++++++++++++++++++++++++--
>  drivers/thermal/qcom/tsens-v2.c     |   8 +-
>  drivers/thermal/qcom/tsens.c        |  24 +++++-
>  drivers/thermal/qcom/tsens.h        |  71 ++++++++++++++++
>  4 files changed, 212 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/tsens-common.c b/drivers/thermal/qcom/tsens-common.c
[..]
> +irqreturn_t tsens_critical_irq_thread(int irq, void *data)
> +{
> +	struct tsens_priv *priv = data;
> +	struct tsens_irq_data d;
> +	unsigned long flags;
> +	int temp, ret, i;
> +
> +	for (i = 0; i < priv->num_sensors; i++) {
> +		const struct tsens_sensor *s = &priv->sensor[i];
> +		u32 hw_id = s->hw_id;
> +
> +		if (IS_ERR(s->tzd))
> +			continue;
> +		if (!tsens_threshold_violated(priv, hw_id, &d))
> +			continue;
> +		ret = get_temp_tsens_valid(s, &temp);
> +		if (ret) {
> +			dev_err(priv->dev, "[%u] %s: error reading sensor\n", hw_id, __func__);
> +			continue;
> +		}
> +
> +		spin_lock_irqsave(&priv->crit_lock, flags);
> +

I see that I failed to follow up on the discussion on the previous
revision. The handler is called from a single thread, so you don't need
a lock to protect the irq handler from itself.

Regards,
Bjorn
