Return-Path: <linux-arm-msm+bounces-41765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B2AC49EEA8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:15:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27010165289
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E0421765E;
	Thu, 12 Dec 2024 15:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ibgVMhkL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33D721504F
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016233; cv=none; b=gMqNm02iJ8GEx1+wT2Mf6cjIpzj03WCOz5YPEiSRAUfOPXjf4G+KPA0oc70VKmXTgcJYo+yws9J/1r4Q0a88BOFPXnGFpt4pD50WCk0bJQyhU2tpz8otra+4+10heCtRuvsf4/WCqIl+qsHgkm6x0V/+8E8vTTKGSlmrYv1Rn9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016233; c=relaxed/simple;
	bh=PVMqYhRnm+wlo36tmUvToJZQuhqtTu5OAs/h41zHOy8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lml++rCYsAxhu6djeIPEza384RIL8uB1Lvz1HiP3AMRshkNMWzPezDfv9Xp+DetvpWfnZpLrpy+ANSA7dMYy9NSB8HMqPvAx6XNL6ylwWNyVRUrnfV08ABC186zbAoumkq/riGGEztuwPGe46hrG9QbVCqltY1DoBtuio/JOTd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ibgVMhkL; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53e38838026so105323e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734016228; x=1734621028; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J4SFfVxcg8kxQKbemWXTRZwVNSWaAt8ZevWakc+qwDM=;
        b=ibgVMhkL6Otf7ODVkhwzJ/CLnP9eR+Zuu68Kkh7XIkOviVjLNPvmq6ExbrhFjbue5K
         zM1lrUw5Efyy0FgRDy0enc6nSPkfreLXck+Uf4Sg8QUtYP85u2aOjyPz5X6MJ+/9UV7i
         CYTkw0j6Coru8o/Q/ND3wCef6rF/OcvxITDD5S2dtNgXSCr77ELzFrnpqNIQJGNImggm
         lWLUfIRBFeddbvSocnd1e8UruTc72PJDxN90b2fNT7PrwBKXoWPrvFkCT7XxLo3lOnmY
         mLZAHi8wBLLC681gdWFGzISH+pTK9xIvhWy6tvETPCou4yS8GS2oafDR87+Q4HaeSAuk
         QH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016228; x=1734621028;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J4SFfVxcg8kxQKbemWXTRZwVNSWaAt8ZevWakc+qwDM=;
        b=EG0BWvCHv+L0oAI6zJDoBNbTCofY3dEhhr+iP96tQG4d2x7QM5K+MqjQs/UpLqBh+M
         akOGFP5aQtKNsCuhFLn6Fu5ceXX7WtyfA5HNsFyzNoV85HFJO0Cggc+jnGTEWauh8p7a
         4LrNuYR1prxGWy4NnB+IEmkyUTwBLE3Qpmz7/EPOKg3qwHdZe97KcMVfUvzUuA2XUTV0
         UHHB7RzLAgVszjPu7vZI6B2qYRCk4VtaG6CxmUVo4VQXyV93b8kcyskEzsRT4HYcYFG3
         iEBzE5UB+lfVDUUjehniFczNcUhqKf7NeXvTk+OfpNP6mg1fbYl5RMSzRL+eGOv64beq
         XYhA==
X-Gm-Message-State: AOJu0YwGoSRXU3MeLWnt8MH9+OmsZTLMfIMHp24mWiwzcHVrGrkIFVBQ
	8k7pVMWAL8+6k/OqPea8U/DbLZc6XUSH3YNQfky3Yu6R/mSx1yQEIgoyKtERJdU=
X-Gm-Gg: ASbGncs0WYihVkuf7vqqQfxAMHtYxDvRQaiF9BG/84GI8xqhEYyJVM5XgHpxwr5WKpo
	b1FVpwMOrTjmAJ5dEHiOwIaPupf2XPBb8mddVrz096pTX0xeTZM6wOptHfQNL/ju0xZP2max7oQ
	oV49kSADU3XzD7DK2eNm0b7vk8IapHH3WVsqOmg80UK/PnKB8g5jjJEBXI3TLkH5djYj5H3DOD8
	5QvKqei9F1wvoooX5ksSkss9/xxyxDvPTuJ+4cJnwbhDg8fSKrOh07wYgIsCVXPyhBY6qwGApvY
	4qmbzjC0Qg6M8477sd9lI4QfPAE5BF0KEkM=
X-Google-Smtp-Source: AGHT+IGoT95idUMEO9RITO/ZyilZmUskXfV3dbvT0qvNs7YP/Wmf43CG98sgGDEwsXtCh7HB0MnesQ==
X-Received: by 2002:a05:6512:3a96:b0:540:1d6c:f1b1 with SMTP id 2adb3069b0e04-54034101c2emr104792e87.2.1734016227943;
        Thu, 12 Dec 2024 07:10:27 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34a49561sm2002136e87.83.2024.12.12.07.10.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:10:26 -0800 (PST)
Message-ID: <09dd1971-74f5-45df-9ecc-e5c2253f416f@linaro.org>
Date: Thu, 12 Dec 2024 17:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] clk: qcom: gdsc: Capture pm_genpd_add_subdomain
 result code
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-0-5d93cef910a4@linaro.org>
 <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20241211-b4-linux-next-24-11-18-clock-multiple-power-domains-v8-1-5d93cef910a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/24 18:54, Bryan O'Donoghue wrote:
> Adding a new clause to this if/else I noticed the existing usage of
> pm_genpd_add_subdomain() wasn't capturing and returning the result code.
> 
> pm_genpd_add_subdomain() returns an int and can fail. Capture that result
> code and throw it up the call stack if something goes wrong.
> 
> Fixes: 1b771839de05 ("clk: qcom: gdsc: enable optional power domain support")
> Cc: stable@vger.kernel.org
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   drivers/clk/qcom/gdsc.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index fa5fe4c2a2ee7786c2e8858f3e41301f639e5d59..4fc6f957d0b846cc90e50ef243f23a7a27e66899 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -555,9 +555,11 @@ int gdsc_register(struct gdsc_desc *desc,
>   		if (!scs[i])
>   			continue;
>   		if (scs[i]->parent)
> -			pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(scs[i]->parent, &scs[i]->pd);
>   		else if (!IS_ERR_OR_NULL(dev->pm_domain))
> -			pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +			ret = pm_genpd_add_subdomain(pd_to_genpd(dev->pm_domain), &scs[i]->pd);
> +		if (ret)
> +			return ret;

This is wrong, on the error path you shall rollback the registered subdomains
in the reverse order.

>   	}
>   
>   	return of_genpd_add_provider_onecell(dev->of_node, data);
> 

--
Best wishes,
Vladimir

