Return-Path: <linux-arm-msm+bounces-104234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kD29Lk/k6WlQmgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104234-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:20:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BF44F42B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B573F301371B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 09:19:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65BD13E3C4C;
	Thu, 23 Apr 2026 09:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rzVcsak7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020EC3E1CE3
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 09:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776935914; cv=none; b=eRiENZxTBDZVATR9ByFdYFzFFMp1L9ojgyg9mP9B+Y0fg5V2sasI7Ru5/iZ8AjzqJ7NNM/c9lGGCcfd5VFPNhXJx7km52YdLbcphrbDmZFeU8Gn5nhnmi0xXF60uLBpADhVbuqaI7sfeO7NtgxT4JIYRXeCKyPYRG+IXxFi2/1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776935914; c=relaxed/simple;
	bh=GTZmRTGjvf4Szef25RFFkEIFVatv/+hKtpaK4xFUoqk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CeSsp6Z77COPjYyuj6lkpTM44SJDdPcniuCqyi2SLksi81aN1oSSfwOmJi2d7HFEcy2h1eUw9iFjPi3zf/7hqCVTgBkNn+QtsZSwxUYrStmrzu8M3Sag/MWYUQ073MW2QwmAFhy8G+vQ+m7Brq/6S3KAsKBbdKxf9gk1nP7qOzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rzVcsak7; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so82935585e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 02:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776935908; x=1777540708; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0NLJTBjQdXh413mrTdcE95r75pYedydwaciRYMhFjQA=;
        b=rzVcsak7DlgwOP3yO9Q0yAEHJTa6Q3VkQiwYINxarUEIQTNuVg6hhVkpzI2ulZ60Gk
         cU65yRx42uO0CHfrA3ARuHFrnxKfGfjPh4oFO/t8HG3nlDbHcdWaGtFlVJ9Xy9GqVnij
         H235RbM/UkUg4g/jRp//DJIXX2J+zzlMbSJvbGdcxlTme9JGfrKhH3q+hZCEiWdccdBF
         /6mEzSPUMUobPnoMLnNEvkg5ZvzoF9JA6ApsnM1vbeBUKtQtG81SBINjXO3B9pj2sK+O
         xVx+B5vJyHUJw4dMduYckw0Uw9Q0sEgwSFqwcOXe8LNwpVeeIQUxhzd0P1KsSRAI5KIG
         vofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776935908; x=1777540708;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0NLJTBjQdXh413mrTdcE95r75pYedydwaciRYMhFjQA=;
        b=DAJ84nNbSpGM0FpCx0Y7nPeZzl77Aa2RjgswyVgaB2kVej+kUIEI/qNLoWiDoZBP3l
         OifzAU26fWJCVY+F5A1WPjoDyXH8+Ijrmlj01ygY6U/lVOPNp5nY1hEiy7KfS2CfN4up
         hVKFUY4rVwO2zSB5Qfdvs4t1BDUTwQXKkJtrIW4YV3/zNVr+xtJZMuVU5UcZmIyjf6PS
         PzbA1Uli/IdGjpxx+lALqIItPSJFz1O9XB288DV8bjj44u77ENEoyTlITCC42paLa53x
         rvlhQqJyQLnLmt1oMQpdZxlQ6HpZa0ISogzflfVudQrMU3+ks/wFYnCjjcVt4XmQujKG
         dURw==
X-Forwarded-Encrypted: i=1; AFNElJ/TFW9Z5BjGPpbSOjQo7ph0PT4XXdlDHuY00tf9cLkgp0zlZ25rXIussN6i9PgHwyOH8Xf2ZbdXQwKV1iSD@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz/iUXa/uM/yYcB65GKiis6mV28OiRD06Zl8Z5jOP17xqlBZ0i
	hZcCZ3Lj4IbWPi37L3Z37G+UsweU7bQDnmoz+eqSc7pHy47sq5vr9sFDoZaRntF2OAg=
X-Gm-Gg: AeBDiev6G1j5IqhRw8GzviPiPxWySBZgeBWlCRv9rWTGE53zDpjfMKKsePqrZdv2mBK
	ScGVnoRV1b9lxdO9UQZXiU8x8xpZJcFyucmObcQSm3v5RAaA3SsQjd1t+590NMmzKZw1KFf2fp5
	cC4jP3n4H5LGhGrjxM+/x3+BNIWAAU8dtfROmh6McAFqn3bHn1N/FyNWsS9xwH07555b8bO3bt4
	MhNrDJIpo3/Za/eQ+LTPOz4Yv/2NVfelK1WCKoYdyuY9zj8SoHBIN/OK5pw9XkLwgaAOae8C9J/
	eA11CDaCaK1eHa/iFiTJlyjZ59ottjxjI8FcY3gR3WCPzpgyFzUJZJ5z0Iz8giOXmEBgy0pdYpU
	ll9vKdE3SJxet/40csRsAQxhE5THWU9FJN66EZpehvo4RtWlOsRp21dMMGVoZAS+AiLvltYnlnY
	z2/1pDOyp/mOzUAQV5zK7oR13jGRsa46GHpZWSJNj+DUDC
X-Received: by 2002:a05:600c:3546:b0:488:81b1:ae36 with SMTP id 5b1f17b1804b1-488fb7880camr376050235e9.23.1776935907788;
        Thu, 23 Apr 2026 02:18:27 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.41.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-489201cde98sm266100545e9.7.2026.04.23.02.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 02:18:27 -0700 (PDT)
Message-ID: <66253ee8-24b8-49a0-a141-e520c0486ab2@linaro.org>
Date: Thu, 23 Apr 2026 10:18:25 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] media: qcom: iris: fix state-change debug log
 printing stale value
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Stefan Schmidt <stefan.schmidt@linaro.org>,
 Hans Verkuil <hverkuil+cisco@kernel.org>,
 Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260422-iris-code-improvement-v1-0-8e150482212d@oss.qualcomm.com>
 <clmo5TM6l-TrI29LpBVlbWN4TBp2xlkDVsrJGus1QypS99Yc1dAEnEwqjlNweGLoS_GPZHAXH-YqnaU-hAuRVw==@protonmail.internalid>
 <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260422-iris-code-improvement-v1-2-8e150482212d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104234-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linaro.org:dkim,linaro.org:mid,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 924BF44F42B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 22/04/2026 12:16, Dikshita Agarwal wrote:
> The state‑change debug log in iris_inst_change_state() always prints the
> same value for the old and new state, rendering it useless for
> debugging. This happens because the state is updated before the log is
> emitted.
> 
> Log the transition before updating the state so the previous value is
> preserved, consistent with the existing sub‑state handling.
> 
> Fixes: 11712ce70f8e ("media: iris: implement vb2 streaming ops")
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_state.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_state.c b/drivers/media/platform/qcom/iris/iris_state.c
> index d14472414750dc7edc4834f32a51f2c5adc3762e..e991f34916ec6e74f3d2cf98bd61b8b1e12a3ca8 100644
> --- a/drivers/media/platform/qcom/iris/iris_state.c
> +++ b/drivers/media/platform/qcom/iris/iris_state.c
> @@ -60,9 +60,9 @@ int iris_inst_change_state(struct iris_inst *inst,
>   		return -EINVAL;
> 
>   change_state:
> -	inst->state = request_state;
>   	dev_dbg(inst->core->dev, "state changed from %x to %x\n",
>   		inst->state, request_state);
> +	inst->state = request_state;
> 
>   	return 0;
>   }
> 
> --
> 2.34.1
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

