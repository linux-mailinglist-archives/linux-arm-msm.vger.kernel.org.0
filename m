Return-Path: <linux-arm-msm+bounces-104379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FIgGqEA62khHQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:33:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7218459EC1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 07:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63C1B300A8E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 05:33:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A17C233031C;
	Fri, 24 Apr 2026 05:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="au/s3p2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515CF224AF1
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 05:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777008787; cv=none; b=FSq4sEYlSQezm/93DAERzNoWeSJ0nY9IncQDn87K/BHjb9Bd7vUZ31OXTrznLhxoPInpF20XiHwklUiAnjaB2X/50978xIXNl8rLOHZ0tg7yhvZ3ODZiXI9XhLxN/2uzX1P8g5baq69kDex7Ppb9ziVmHtIcX3vYyDjEU3f7bHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777008787; c=relaxed/simple;
	bh=jfa8ytdmrfomsd7Bc3kOVRi5zbSCzmo6zCu240qE/X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZS8eKsqW5aV+1wbJyLGia1KhSuyQC45of/+v/dvTGyg4DJAJCoz8wEoQpyOQQwg24d0n0aM7rJUOLWi0dCA1Yqi4jtMhDZqRhY8fMIsfuFt1abqU7mP7iu8aBBQXkAmry6Mc1Sr6+YItyszaLdDIKe89/B/pVeOwU8Bd/JHKAm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=au/s3p2w; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f83bd32efso5779283b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 22:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777008786; x=1777613586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HnwOvgDndaP9V3Bbl38tHqOQaGjwNEX0O9pKgu8MbD4=;
        b=au/s3p2w9q0dZZ2w8SN8ZUhGGwQuXGP5fgVcT1i4o2Cc3stw6eJgAS6vDvqUpnnB01
         R2+a7xDLILqsKvo9P+8QfTO87ZcGubnEPCcY1WtLX1iTajPLEP1aJrHCcE7mj/szbp7d
         foKwr2xcs40jFijPHrupzJJyaR563vz7Biv9KpHb/oJcmtKNGnbPI33s4xA3JtfxbPgz
         eGfejNgxUqkBASMdwU3/9MEWnPk+j8FB5Nrfg+IgF7f4PUfI/WjDruLV9UMmaQaGK4FW
         hjiIl6fsrRsQ5eIPHJ0NqzjkwKiEOxPyie0WmTK9zOjSriP9fkvMtpyRtvMW5cEaHStp
         RJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777008786; x=1777613586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HnwOvgDndaP9V3Bbl38tHqOQaGjwNEX0O9pKgu8MbD4=;
        b=M3+ja68Uojw3ob3M+5jWLFBci/PbQKrhzW/AHRAw8E06qF3YeQDgqPasJqAXAJM5co
         NamBhMcXBLBvLPKdbuslmlnX6oWab6AFZwHCw+zJKtYGm4BCgFio7uBSD3AiGaAj343j
         sXty5XwmMq/LrP/idKVSzW4jb/sszbpvVX9D53QPYRQUH04F4LnBNC617vnErIigShZY
         VpcW2iL/FjO3oXUkgiv8V+CimVwHUOE4M9HZxsY+e27tBqIjO+StG+THiY+UK5U/L846
         946OwJOzwWFuT7FFddg4L0fNlHHIoDZqPnodZeUpXF1druJ8MVdyvxDuLfv0VS8bF3fm
         n6Tw==
X-Forwarded-Encrypted: i=1; AFNElJ92elK7z+icyq4vUdkx2l6qbyCGuyo9WMHni/x1XKkucBd4moJG7wq0FZDKUdh/Vf4dOgToJaSTHDTh6vhD@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9/VjPmGg49IZmKCnyB6QOG1ug75wES7Uasf2tJuwS4FxK4XM1
	0ZUUy5uctjfmwKc2v6H9B4H3TaO8ye9S1cawAp9TiAgTlOBkId2L7WonjS/bWZpuLMc=
X-Gm-Gg: AeBDiesZkkjAm2L6XRaVuiQ2kXy13G3SdwaUxywaw0Oz4dMRfJvlIrFIgx9w6QydATt
	QrIAHlUV8yJD8XrTyHalb2s/LrenqKzy/9xlja0JhrHgwIYddqJ8FTNgqaz6f4mp5kV9m9zP6M7
	abpzwvJgkY+Fy7t0rJGQCWJvRtdSHyXNFoFbd9OKWJJVg82JMsar699A6t4cD3ImvYRDZLqYhvu
	Rs8HUGDi0ga96VMm6VK7mMEnHc5Prbx1UkMGOVDpreXKqAHoVGsYjMZacHPnf18ZS4vxQmH0b2h
	MYszvTF4fZmZqAY5XlMNRSPwiVlADWTi/pVk9JX7oIfqjCdbqu32b3JdBW5BZpk6G0n3YG75lqO
	6Si9WKSnezeL0wG5pksTy3YNAdVHac0PPqYcFwsXLQgpbZ09opgmLAmx3/wt8oqgmgMU91s9kTH
	/TWsxj/PGXtJZFkqDs1CZudGokUvfy4Ez0IQ==
X-Received: by 2002:a05:6a00:2d01:b0:82f:91f:bf35 with SMTP id d2e1a72fcca58-82f8c7db32fmr31698639b3a.3.1777008785496;
        Thu, 23 Apr 2026 22:33:05 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9819e5sm23074570b3a.2.2026.04.23.22.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 22:33:04 -0700 (PDT)
Date: Fri, 24 Apr 2026 11:03:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, =Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom: Unify user-visible "Qualcomm" name
Message-ID: <nerfirktc63hj3uffhykrxccxud7s56rbahzo7t3ug3ar4pwpd@4gjmjnu26vpn>
References: <20260423173607.92564-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260423173607.92564-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Rspamd-Queue-Id: B7218459EC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104379-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim]

On 23-04-26, 19:36, Krzysztof Kozlowski wrote:
> Various names for Qualcomm as a company are used in user-visible config
> options.  Switch to unified "Qualcomm" so it will be easier for users to
> identify the options when for example running menuconfig.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
> ---
>  drivers/cpufreq/Kconfig.arm | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 47c9b031f1b3..a441668f9e0c 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -153,7 +153,7 @@ config ARM_QCOM_CPUFREQ_NVMEM
>  	  If in doubt, say N.
>  
>  config ARM_QCOM_CPUFREQ_HW
> -	tristate "QCOM CPUFreq HW driver"
> +	tristate "Qualcomm CPUFreq HW driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on COMMON_CLK
>  	help

Applied. Thanks.

-- 
viresh

