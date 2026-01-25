Return-Path: <linux-arm-msm+bounces-90441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAsfJwUMdmkNLAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:26:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BFD80875
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4521300180A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 12:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2926026A0A7;
	Sun, 25 Jan 2026 12:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BdBlZTYn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5E1B81CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 12:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769344002; cv=none; b=pfUYMI1vu3MOybSaoydfh9Q9hYbWuuFAfT0+XdkLKhF0NN2YoLIhXzV5a2t9nAlAOJXzYbvOlUd08evNZOb50qYewjGeW0e6Jobq4cvYGyaDFQ0V/H3wU2h8j0pnfpPSxXpzePQnxEfjibPGpWUmJLu+kSv4vIjj2n35+E8zmns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769344002; c=relaxed/simple;
	bh=i8XuVZ1AesJV/+dU5wloujfDPbMZDtyqrw1twBejzHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyO3IsF8H50FQL8WIxktyRNGkY6D8PVSNQh0j5n20CgEdrdXBxS6OI4nbyxdm3QjjEb9zfsO3iKnOLmXdLZuPjVhCQpWtTkXWgyUcIrIHeWf60ug0Vd1ap/eT8FqIwlOKOqB5JKHSwMzwjDOYj5lhtqk2sYnKxFxxlH77oEGZqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BdBlZTYn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso36254105e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 04:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769343999; x=1769948799; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FDCitePNW8DbwRGvTAjOr4gcKw/9/Pa6j9Q+g0gBad4=;
        b=BdBlZTYnXL5YZwPMRYQ+9BdlitrGeA+JCvNCsWggTpmzTBFeTVCdJW0hs/3CV+Udml
         +33Ap0mtByN8q0TR82SfjMutJqjSjIhXhjDxIKhR6a38agJtBXY6L0VoozT9a7XDyG8H
         RoqA5krFtupEjpvRGx8BMA+edj9CvkW8Ceb4uF4jlzLaEiA+L+EnKHrDDItrcDqx1/G9
         jZYeO3qN/sIylTzjPkVY11R9mTjkUJpI9187ks4kQM7Tv/KCIveI0fdj85m4uksYdT2O
         GfqLFgqOIh1Lx4auaIwxb5OeKEz6fGfM/JZLx+K9CirfP9FUvD0gbJJkEuV45DwtqlMx
         YavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769343999; x=1769948799;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDCitePNW8DbwRGvTAjOr4gcKw/9/Pa6j9Q+g0gBad4=;
        b=AnQs8fOrysvtgIfLH8sp9XzzgjOwk0EMzem3wENEAl1jFu0KgMKaSLlOWbyDPuIGdZ
         Lg/R2M+MuWfD5AViJXoihUHjdswqXPytjIGCf/nWGVL9AafmuXB+ZjFOpP16uda0+66q
         ppHcUpmQJzn+DsLTTXG/lA46jAMBR9pBlnhDoK7VTHoATUbMhwPUPAZjMhL0KEGSZXBm
         2cMDghhP4bEfLGUI1p9GQgHK5ICTQHStNRLv+D76Jc1+bdMfRYPP2O8k5Rh6ZyukCi0/
         gC437ArRYwtcuwHR7ROkb38y4YHVdPz9hFZbmsTU8La8fSQBaNyc90YdnYZ6jnAnLCJe
         a6AA==
X-Gm-Message-State: AOJu0YxIi6Osa6VOP9CpuWXo8KnS/7gzS9e57OH93tCHoOlsacE+pCxM
	gSZldYxgwnT5I4v6hy7FLAMC+fj+tjcmI/MZqik/9RjUjBR4bQyFBqh9aPr3CwFpCQU=
X-Gm-Gg: AZuq6aLE6q71LZRpY7JdBqJeSm6nKvVOvsLjE2pQ8EHNp5wDgV6Rg7nNOUvzChGBNK9
	q4Od264B1Qnkf8wxOB7WWknZNH5nxhoP0a/P7LcwXEV0V9m4TR9RotPc8anSQe/EO1zB/bRLEOC
	SYBS/8d+jXgG9XMo8CbRktHIlxbY1tLkeN2kY02UWEy9WPSQkX5VIHoJUox8W6qMFL618oND8nw
	zXMte7wMVF8lpkZ46fWZKgRv8+37sxNGhhPTFVtio7XT6CE8PhvAaOIkzHYMJI/Otj/dNRM67ox
	F2KVCY54rx1WuhVpiM/MGoR9Bn4PUEP+gfRaMJpctzY5ym48x5FrAlRFSy6hCSbWPtNZBiHY4y3
	qa5T+8HG/BknKq4Qlstuc9F1kMt5eRnpgVO2vVT6FH02OvqCIX0KajfYH6OM58AjR+Od1w83p3m
	hOLGgxL/8hj1QuAffP1wcOv20yt4m3bwhibyILXCKaE5pkxFLiy3zJ
X-Received: by 2002:a05:6000:2306:b0:435:97b4:b699 with SMTP id ffacd0b85a97d-435ca39bf18mr2232170f8f.51.1769343998806;
        Sun, 25 Jan 2026 04:26:38 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1e715bfsm22908159f8f.22.2026.01.25.04.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 04:26:38 -0800 (PST)
Message-ID: <388c246c-3e7f-4297-a9a1-3895c3312533@linaro.org>
Date: Sun, 25 Jan 2026 12:26:37 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Check for errors in disable_streams
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-3-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260124071751.5885-3-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90441-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 08BFD80875
X-Rspamd-Action: no action

On 24/01/2026 07:17, Saikiran wrote:
> The ov02c10_disable_streams() function ignores the return value from
> cci_write() when stopping the sensor. If the I2C write fails (e.g.,
> due to CCI timeout, power management race, or device removal), the
> error is silently lost.
> 
> While we still need to return 0 and call pm_runtime_put() regardless
> of hardware state (to prevent PM reference leaks and pipeline lock
> issues), we should at least log when the hardware stop fails.

Should we return 0 when disable_streams fails ?

I think the argument for the pm_runtime_put makes some sense.
> 
> This change:
> 1. Captures the cci_write() return value
> 2. Logs an error if the write fails
> 3. Still returns 0 to ensure proper cleanup
> 
> Returning an error from disable_streams would cause the camss driver's
> video_stop_streaming() to exit early without releasing the pipeline
> lock, permanently locking the camera (see commit 044f54e7c).
> 
> Related-to: commit 7673f757858c ("media: i2c: ov02c10: Fix race condition in remove and relax reset timings")
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Needs.

- Fixes:
- Cc: stable@vger.kernel.org

See: Documentation/process/submitting-patches.rst

> ---
>   drivers/media/i2c/ov02c10.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index b86cae3d2b74..db191dccff75 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -629,10 +629,20 @@ static int ov02c10_disable_streams(struct v4l2_subdev *sd,
>   				   u32 pad, u64 streams_mask)
>   {
>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
> +	int ret;
> +
> +	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
> +	if (ret)
> +		dev_err(ov02c10->dev, "failed to stop streaming: %d\n", ret);
>   
> -	cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 0, NULL);
>   	pm_runtime_put(ov02c10->dev);
>   
> +	/*
> +	 * Return 0 even if cci_write failed. The stream is being stopped,
> +	 * so we must release the PM runtime reference regardless of hardware
> +	 * state. Returning an error here would cause pipeline lock leaks in
> +	 * the camss driver.
> +	 */

I don't think the comment is necessary - your commit log will document 
all the detail you need.

>   	return 0;
>   }
>   


