Return-Path: <linux-arm-msm+bounces-15163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB2588C013
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 12:00:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D498300070
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Mar 2024 11:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC61312B6C;
	Tue, 26 Mar 2024 11:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfrcZoCN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8373DDBC
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711450810; cv=none; b=KXVxKpDcadUZSM+vuDF2Q0mryIrEp4EsOgdkVQ1mU08Z8Vzuv1CItw/m2w/Lygz49Ct3Xn0GOT9ibmf2y65a1db/bRRgzZ9Ay4wsb1ae5i5xox7BK1Xcyzs8pzBYTHH7Pr/3luogW37M3YFyL22rNuTr/fZPDeq7yrp4rwcbTT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711450810; c=relaxed/simple;
	bh=Divj/8DtpHGT03S5LOxYHvCY7ocMY4N4D8r1EnHpwTQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgCP/WWHiH1sENbCqIz3xSm7lgSi5rmKq/Qm2NoYtKdCCCj5QlxEtGkpjzO5Wg4POfu58uwnEcdMfz1u+fEjpvEwvzLWFm1nulsZwWCU+1NjOA7sm8C4ALrWzOCoTp9VnbBax4N+VdoAJBgAShEO4TV45dsjwvL8BFiO5m7uLC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wfrcZoCN; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-41485fcb8ccso15132795e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Mar 2024 04:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711450807; x=1712055607; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lVML1MZKg+pEkFh9usl1FUGcFZrDQno7a6oVSt1v8Ic=;
        b=wfrcZoCNFeXV1ZxCnFkwBD7cdj1D+q7Wj39L/e8URvwQxDzG0/LrKelqEZapfbScm7
         J2RFMAa1ElRSDbv7wIenLCmGfXFsPGMn6YA0/UWs9e8mAFwdmttxTpWJ9NDYbSC8Y1Pp
         OBDh49nAJhhfUrCz5DiLMIj0TYk+Ng2jIc85NWUDNSsmtvSpPcafWR7k3UKUONzr4Wgk
         z6O4tZRFefh/qnvTudAGUm6USMkbISP6fnsRXBdoW6NqfjBxi4QyrEMANX8cRCwj7RTE
         nwcearEZh3YRLnPbxqgKT2NxL/IfGDOlFUM8opxL8EqhpVSX/1SXwmAgxQOJNTDNsn95
         iZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711450807; x=1712055607;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lVML1MZKg+pEkFh9usl1FUGcFZrDQno7a6oVSt1v8Ic=;
        b=wSketlkHwHxowWr+oSWS/J7iatghPL0j9m7kPBW7Js6SJD0dVLClDDfpwA0L8qO5aj
         tUVWCNiaLb03gDVXUAXGGXH1cmlbcywtaoA6muWAMN/9Pn15u/Mq6EvjqczHQcRvw5uU
         DGCHnMygF8AGpM5Y7p5OZLTWzje7wqSeXsVRU9lie6M2UbBM1OXaiXmdkgMxtxdohxXl
         dL9KsabKYXE22DBazyiy4DyjnPFy6nIlA+JDAiQS+Vlme73Aq1dWu6ABZrQ2fDS1vmmw
         96m3fEiFTPgvekGnBcwd+hiKSN11W8Vtg7esaVfetF+V5FjnmUiocOAdl4BFjveZDkk1
         h8Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXMeNGQXBeZMVL0iU2zFd1SYd3UIjZ737bgDRlFHfJvbJiRbLvYcq+uT01JXlJklgYJe1Zq4lILoHOboxGv/i033T4WO4I5ubqC3W33Vw==
X-Gm-Message-State: AOJu0YwIJ9jQulArHeqsT+GuGguKNxuMm9IjJ5pUO8nwgrPPgIULCgCP
	NxLIE163kzygt7jU00gaPkXHycoRl1e6ch2uCRst3S8fJWivgc9wVh0wlAitzIE=
X-Google-Smtp-Source: AGHT+IH/v6lIhJFYa00AxrCwMQmInONIZpWW6fjPpY2MWiLb5mY0D3jsDtHCGwnOD83KHDMnlDvK3A==
X-Received: by 2002:a05:600c:1c1c:b0:413:f7a2:55e0 with SMTP id j28-20020a05600c1c1c00b00413f7a255e0mr6816746wms.30.1711450807049;
        Tue, 26 Mar 2024 04:00:07 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id e3-20020a05600c4e4300b004148e1d938bsm1805685wmq.22.2024.03.26.04.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 04:00:06 -0700 (PDT)
Message-ID: <9bea167d-edcf-4d66-8ec7-051e97c8dffd@linaro.org>
Date: Tue, 26 Mar 2024 12:00:05 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] thermal/drivers/tsens: Add suspend to RAM support for
 tsens
Content-Language: en-US
To: Priyansh Jain <quic_priyjain@quicinc.com>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_manafm@quicinc.com
References: <20240326074033.17002-1-quic_priyjain@quicinc.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20240326074033.17002-1-quic_priyjain@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/03/2024 08:40, Priyansh Jain wrote:
> As part of suspend to RAM, tsens hardware will be turned off.
> While resume callback, re-initialize tsens hardware.
> 
> Signed-off-by: Priyansh Jain <quic_priyjain@quicinc.com>
> ---
> V3 -> V4: Make tsens_reinit function specific to tsens v2. Add
> NULL resume callback support for platform whose versions < ver_2_x
> in tsens ops.
> V2 -> V3: Remove suspend callback & interrupt enablement part from
> resume callback.
> V1 -> V2: Update commit text to explain the necessity of this patch
> 
>   drivers/thermal/qcom/tsens-v0_1.c |  6 +++++
>   drivers/thermal/qcom/tsens-v1.c   |  3 +++
>   drivers/thermal/qcom/tsens-v2.c   |  1 +
>   drivers/thermal/qcom/tsens.c      | 37 +++++++++++++++++++++++++++++++
>   drivers/thermal/qcom/tsens.h      |  5 +++++
>   5 files changed, 52 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/tsens-v0_1.c b/drivers/thermal/qcom/tsens-v0_1.c
> index 32d2d3e33287..7ed85379247b 100644
> --- a/drivers/thermal/qcom/tsens-v0_1.c
> +++ b/drivers/thermal/qcom/tsens-v0_1.c
> @@ -329,6 +329,7 @@ static const struct tsens_ops ops_8226 = {
>   	.init		= init_8226,
>   	.calibrate	= tsens_calibrate_common,
>   	.get_temp	= get_temp_common,
> +	.resume		= NULL,

As a static variable it is already set to NULL. Why do you need to 
explicitly set them everywhere ?

[ ... ]

> +#ifdef CONFIG_SUSPEND
> +static int tsens_reinit(struct tsens_priv *priv)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&priv->ul_lock, flags);

What this lock is protecting ?

> +	if (tsens_version(priv) >= VER_2_X) {

May be move this test before the lock ?

> +		/*
> +		 * Re-enable the watchdog, unmask the bark.
> +		 * Disable cycle completion monitoring
> +		 */
> +		if (priv->feat->has_watchdog) {
> +			regmap_field_write(priv->rf[WDOG_BARK_MASK], 0);
> +			regmap_field_write(priv->rf[CC_MON_MASK], 1);
> +		}
> +
> +		/* Re-enable interrupts */
> +		tsens_enable_irq(priv);
> +	}
> +
> +	spin_unlock_irqrestore(&priv->ul_lock, flags);
> +
> +	return 0;
> +}
> +
> +int tsens_resume_common(struct tsens_priv *priv)
> +{
> +	if (pm_suspend_target_state == PM_SUSPEND_MEM)
> +		tsens_reinit(priv);
> +
> +	return 0;
> +}
> +
> +#endif /* !CONFIG_SUSPEND */


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


