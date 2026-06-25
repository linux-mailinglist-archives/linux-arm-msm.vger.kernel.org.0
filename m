Return-Path: <linux-arm-msm+bounces-114512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SZOxJyoMPWp+wQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:08:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B3A6C4FE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 13:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=n6e5b6T3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114512-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114512-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6EF65302689A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A00C13B19B4;
	Thu, 25 Jun 2026 11:07:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12E683AEF35
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 11:07:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782385648; cv=none; b=HZtsf9AJurr0MjzqEnp/jOx8YLpf+nOiCocAW0QTGJ6Qo2euNwSl/MQGJDO8VY7vE4dpjLT24h29znJrwWzsBzI2esHCufDG19ApptkPqx0w5r3/bLtJVn6pEv1fTgcioZfUKPZfscdLUp2wZzkLew7s45ZKDNff/BLKOTc+JYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782385648; c=relaxed/simple;
	bh=OKiJirBUH7iURKZcOXps9KVluu4PRaSUvtf5vVbZa+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r7ks5yNqkZpkuEAhpIgVc8aTvc0Kb2RbWa2Dy7EFHM6GgzMZJ5v4Uf/Z1Skb/Svz2+OZlTAVlgWJ4fV6Sppin1CCSJ1bKI9QZXo82GANYveNFmnwvL7QsMVfZM5MPuYW3cOuxWcjaAerXFt31moaxDI96n0KGGSq11FlPfMUHH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=n6e5b6T3; arc=none smtp.client-ip=209.85.167.53
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5ad67d6cb83so247027e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 04:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782385645; x=1782990445; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tkOZ1h3ApBi8l6jNjaETl2uI7tOXqY5UpxR2VkYETGc=;
        b=n6e5b6T3W/PeU6+El58ifHJtoGE3+3nE2CDey1kfyGhQ1psDqyvplu43U+Md/iPuom
         bPhyiSpxrbTAt66s9m4O+ER1uhW8iiqoumUySboM4m3kyeorBBmPTjVJJNiceS+Rt9ku
         A3x06MiHa3cuvGDKFtlfeHu9A/e9zfFGnCdEww21dNgrUtJ2BiUGIN/aQ8AJvk4965Tt
         LAcqm+QtUft3cmKmXzv0pljyfVXAJRkxWGa6tVqJD5GvI3/xmlunYWvY5r4rBouvJHTm
         26PsAGny26oyqk/b0VNhrojj0QsDMd89jwDU4MenhTQXD+C+OFZtsuyFHPR3wOu/4nqR
         ma/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782385645; x=1782990445;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tkOZ1h3ApBi8l6jNjaETl2uI7tOXqY5UpxR2VkYETGc=;
        b=ko0cHcrAPKXcAJRfLbz9eXI0p1uloaiYJ0DnXn1JRbTDbP+gFYLE7gjcC0+eIbtX6Y
         8gfE0KSAlwC+Tk+wYS6hga2UcDR/C/YDgTjLveUTuPsazRiRwfz5ZBudxUccVS+Jk6Si
         r2JwXzJVPBD0UCQKjXL8CIvBH5Iy2wjxxIBPtoaDO4+31FuVPkIDFWR2Yz1RGIyyvBhf
         947njqK8J6KCzyYO01157c4q3kp2srPlQrx73dop5csQFgIz3UA+FYcuskJO94AxHKVf
         CQ4gIUV6y/n8WGTdjEW5S5lVniZF2Beade/EXjowbZBKLyk/eK0RmnGOv1qD8afe3v10
         N2dQ==
X-Forwarded-Encrypted: i=1; AHgh+Roit1c9XRx4HFydFTmECIqkCLAQEn8gVyv1S/NAaOfR4bah0/jbw3N0M6q7Ki9K8ocfcsvXhnWqZJbvUeAL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzw0UbyYmwSSQR2fCDjNSzz+C3rieLe2ZpWAl6DarwwOelPrjt7
	HFIf6+GMKgHyNJG4pNo/FIiWyB7/yt9X2kiWCJ8Xvlp/8LPj3qJbuhypEOZ+G8bkEDxTJp/QxWp
	rmG9zL0s=
X-Gm-Gg: AfdE7cnE+bjbkxVjpkix1ZoLK/m3pGFghaU8hFvv2oq6hdBtyxcp2mJFBv05nNxxp+H
	EFhULclQkm22c/10hLcPuNRxdJbSUBfy4qi7PQtsXau6sC+LE3mD00FboQgcfj7BbtaPFHG+vEB
	AaSn37uqLWA/Y0MsK7id6UQuvY1JNCoKauESoE816f+MPd/AkU0H85pAqookVYrxLX1Hbp8X5wv
	SQ6+yxkhL+kP3CZQcqnGEqRTlM+LXxi8WuCB3cJ/rFMWb6GrlXUVx+ZKAgUq2vsu3e3iLIWfaVp
	TiU6a7DmYJ4rpFK4dME+1OkmYcrgMn7DTmk1nagplO1Fqf7Ve3oq53IPsP1toU3+WUDf5Lzubn1
	youjAgHwWbIv3dd0Md4Nty5QNDvdDapXoiZu6DN5DG27maxhqIaQad2pY/dTXKeW/qBVJbx5vR9
	lh1mhPc7Ffg48jG3bOnX8bDjxmrT48mIjjwbIAx8Z/gvI7OiclGpG2dgCZ9aiOf9EW6fE=
X-Received: by 2002:a05:6512:3f0f:b0:5ad:4c0f:644a with SMTP id 2adb3069b0e04-5aea237b169mr336418e87.8.1782385645209;
        Thu, 25 Jun 2026 04:07:25 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69423d6asm2542956e87.0.2026.06.25.04.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jun 2026 04:07:24 -0700 (PDT)
Message-ID: <bd782dc8-821f-456d-9659-a5ec9d601a2f@linaro.org>
Date: Thu, 25 Jun 2026 14:07:23 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: qcom-cci: drop custom suspend/resume and rely on
 runtime PM helpers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Wolfram Sang <wsa@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114512-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:loic.poulain@oss.qualcomm.com,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:wsa@kernel.org,m:todor.too@gmail.com,m:vkoul@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 20B3A6C4FE0

On 6/25/26 12:42, Wenmeng Liu wrote:
> cci_resume() unconditionally calls cci_resume_runtime() regardless of
> the runtime PM state.
> 
> If the device is already runtime-suspended before system suspend,
> the clock is re-enabled while runtime_status remains RPM_SUSPENDED.
> As a result, pm_request_autosuspend() does not arm the timer,
> leaving the clock permanently enabled.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---
>   drivers/i2c/busses/i2c-qcom-cci.c | 18 +-----------------
>   1 file changed, 1 insertion(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 4d64895a9e9e4e0bd5e0ccb5c3cc04b282b1e4d5..bdeda3979c4814b5cdb463734b8361da7fffa879 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -492,24 +492,8 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
>   	return 0;
>   }
>   
> -static int __maybe_unused cci_suspend(struct device *dev)
> -{
> -	if (!pm_runtime_suspended(dev))
> -		return cci_suspend_runtime(dev);
> -
> -	return 0;
> -}
> -
> -static int __maybe_unused cci_resume(struct device *dev)
> -{
> -	cci_resume_runtime(dev);
> -	pm_request_autosuspend(dev);
> -
> -	return 0;
> -}
> -
>   static const struct dev_pm_ops qcom_cci_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
>   	SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
>   };
>   

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

