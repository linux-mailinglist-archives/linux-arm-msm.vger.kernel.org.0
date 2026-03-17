Return-Path: <linux-arm-msm+bounces-98105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBSSI9EWuWmOpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:54:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3248D2A6057
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 09:54:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 381343016C85
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 08:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1311839D6D3;
	Tue, 17 Mar 2026 08:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l91ggJsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89C23939BD
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773737521; cv=none; b=fkkaxyyMOuDoMn8tavr8RNbYw0s1EWerWgj7oh6C64z6BXH+eYUbb0MGBbfSq6GfZnTIugQmK+R0QAxWUFMmqxIHJfOc3Bzf/q5fPFDjXB9iEcWPW2Zu04XzOMsOTfX7W8n+ma4KKt/cN59yY7QxQ3bLJugXnuCQVDPRnvYxxKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773737521; c=relaxed/simple;
	bh=p8pVTyPl47a537YPvdFqH/ssrxTbysfNXijEbIICXdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjzbYXi9o5apdu3qrqUcJRn0CZBL6MCNIWU5rGI96kdh8YKVnVDRFOINllLI2yEvQzosSUxShPMc3onDHDmRnOPlVYdvK54BMhy/4LSZn+Q8JmQZ3Oi/5QoWsOVrd8QZ4BngB5sWb9Ufs2VbQPCDTSLjfzEfhk2dXnSkTmpq1yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l91ggJsY; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82748257f5fso326465b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 01:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773737519; x=1774342319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Rab1Vx6P07OVr4XGKcMH30oU9Egb7S8XIvL2tnMJznM=;
        b=l91ggJsYtSm00fcAO5YEN4SX1keC3xNi7qFXCHfaCFcdlCyHLIfJeXiw24zBUKyfd9
         7KZvB2K5B5O+kIunW2DvKCuJMBRpJRx9Kcbvd54zlgClPzQKlAes56Wh04edsiYlMelq
         g0d/zIa0nsWFekU793DOJ6iNa/IDraRhrHB1g46VJWXLewbHzvQsryVBQDIXHiYJHKwG
         712Mded4uZtBxPLm7rswJMXFtY7G5lOW5RgLSTDI3EMN8KGQxhiJfbGWw1KMLzLzuZhj
         O9n7+t9HD52Z/hI9gnw7O2kcEwqcH1v4HrMeAMlPZX3nL2E5hPQ4AzMRo4souo2Rf4qU
         a6Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773737519; x=1774342319;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rab1Vx6P07OVr4XGKcMH30oU9Egb7S8XIvL2tnMJznM=;
        b=Zu3/eg5McXlt0Qo6LBa+Qkfyki5lticCs3lwfKDqNnmLZaZw+iCzM9tMJMOq93JLOZ
         uowTA/E3W2Mb2byIB0bDdmETspkDAaYulj4qlXMxxxa1yflGLo9l1aMACDYp2iVvhTsw
         KJjr2veyCA6XfFPj3A8RXYj1GCK3ZNr0BqKdXeHVQIAJDo0rV7SGfy+s1FT80l2cIMdh
         hrKLCffnLKhE/k8k5hsQRYNYg4y0JCgdACJs12u5f4lEgBB004DS3FhlylVgfPJwsF9e
         LnYU/gzuM4PrJdp5WEnlZvF8Mb3hlcL2o8tTCdre51XrZolKR6aYSi2meOioLWrGtiCG
         MNNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa20RYd8tRrQLAhmNjcg9msDyR3cXfwIy6tU78gY1RjzGqtbcaWj17yq2Ey8Sta1ozrY4VwQ4hTsXR9UEc@vger.kernel.org
X-Gm-Message-State: AOJu0YxuvU14CQlkvjxiyP1WUsqkhN7x29CPrcIU8/vVIQguMJusC5uk
	KLfJwjrhF+/i7vSWPysqu8+H2X2eRCssxKhDu+dVzVhvQ4b1q3YO5G5EVqNbFqwGEs4=
X-Gm-Gg: ATEYQzzpMAm1ahD1c/UnlceWX5iFcMR8D4mcNcsApNk66rl8kyOnnYZ1cQdHF8UIgGk
	KzDtgY7oCC4XupiIESYhOfK8adkr0Y1nJJ1PsDGhWku7/X5WFwmigYqRbPRJJd/ljR5wb0cQv4V
	BUypTy8Dmaqdi9h0KKitt0bEyatuP2hSx0efAALllITHK80leMKL7nIuVuOm2UArwKbmKl7wqRo
	sPyyCTLU8dYw8wk2Y5T0w0wvrJg8ta4p8Y6h6uxyT6XuJduOFM/gZgoEl8P/kdoiJrWHRC3EGRU
	KvSCzy+8HJloen9nQruq/BnhU3s7dehDRQIf0ETf8w2P3jaFdg2BIxzZmPKoiuINBKhxo6JKTCK
	UvRawcUEi2FlfsRqt3ZFtB53UK8qoK5cwnRUJVYr3KbCp4Mrguf5df627smSF7dw68jKpYvbRIB
	ws4UwXD343ZP1+EcPF5VhPe7OL
X-Received: by 2002:a05:6a00:1398:b0:822:69b2:7ed0 with SMTP id d2e1a72fcca58-82a56014846mr2547142b3a.6.1773737519091;
        Tue, 17 Mar 2026 01:51:59 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340417sm15903645b3a.39.2026.03.17.01.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 01:51:58 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:21:56 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: rafael@kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: Add QCS8300 to cpufreq-dt-platdev blocklist
Message-ID: <apsp4wx7pluiwfc46unxpwaylubwk7ltn4oc62dtqrgvggumb5@5aobovyqmlgl>
References: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316103752.289324-1-faruque.ansari@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98105-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[viresh.kumar@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 3248D2A6057
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 16-03-26, 16:07, Faruque Ansari wrote:
> The Qualcomm QCS8300 platform uses the qcom-cpufreq-hw
> driver, so add it to the cpufreq-dt-platdev driver's blocklist.
> 
> Signed-off-by: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq-dt-platdev.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
> index 25fd3b191b7e..ff1204c666b1 100644
> --- a/drivers/cpufreq/cpufreq-dt-platdev.c
> +++ b/drivers/cpufreq/cpufreq-dt-platdev.c
> @@ -159,6 +159,7 @@ static const struct of_device_id blocklist[] __initconst = {
>  	{ .compatible = "qcom,qcm2290", },
>  	{ .compatible = "qcom,qcm6490", },
>  	{ .compatible = "qcom,qcs404", },
> +	{ .compatible = "qcom,qcs8300", },
>  	{ .compatible = "qcom,qdu1000", },
>  	{ .compatible = "qcom,sa8155p" },
>  	{ .compatible = "qcom,sa8540p" },

Applied. Thanks.

-- 
viresh

