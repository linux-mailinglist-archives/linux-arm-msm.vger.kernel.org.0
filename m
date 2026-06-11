Return-Path: <linux-arm-msm+bounces-112758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0eLeNkipKmpUugMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112758-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:25:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 34414671CF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 14:25:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=sZuwcPG3;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112758-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112758-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 36C8E31B1B4A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 12:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91F463F39ED;
	Thu, 11 Jun 2026 12:22:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAEE2F8E9D
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 12:22:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180573; cv=none; b=O8a1aT2dCPatZbXXKxOgyoICrAznm34azTgG7S2So/wjCIs32prJzWLBKcwUAQaAkMVCjSc0aOnukacy/bgsVmQa90lkEFPz56KTkpYuCrAwYxcrmJKdCz7YClaXDlD8p10shWmztu98X2x1p+pnHTOUt26sm2Qnw+O70I63CGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180573; c=relaxed/simple;
	bh=6mybAxFWA9piKMYdQTC95b5ZGi6YKc2Dvduxn+GK1Rs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gN1LY8PirIX6a0W/sU5dR8LPC78iaamPx6+TL9HjZ+IT8nSS+WwJ4Npd5TNP5S2t8MsYtgzqP8PmwqktpFLM06JgtNbyDzl92uFGh3Y57TbWu+LYYmEpV+AIz9VqVaMm4Da95omn/Kbx3g9bz9VaVzsfiXb6cp5OwEFM58NM1Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sZuwcPG3; arc=none smtp.client-ip=209.85.167.48
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5aa68e5175dso808621e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 05:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781180569; x=1781785369; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=sZuwcPG3VczZISaPBGPUIykdEVbYJmqWYESl0nQwgXSBnWyTgIQx+NZWRAXknB/oBd
         i7jzaBuPwUV5Eaz1P9UvlsuO+18UVjbHf2PKL8Mltx8H09UjN3nvf2tL+fcKDz1ylKuY
         1pHLnMxxk7Gju4UrFZsszu2s0brHQs4i0PXmmsR+4Pr+50dOEbXGIq3D+7RVMFMTVIoM
         euvfJGEKm2UELN6qTQ2z6G2pb81APsN/FIxtGLiDDSDfXIgFZkXG/KJZe1EJuXlGxCSk
         h1Wy9jsHN/7KsPEyYyxKQ88nzCXu9QbGQZXgzHnQBwXriPQdJhDu5tDVuiQzCZhR46Yk
         qS5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781180569; x=1781785369;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3UVAPv+vJYyMdfCgAAqYJ+tpswqCocudVoYqqRm2LCg=;
        b=myHohqlP6MXdU31MK3F7CTzEpoZ60N2UK7CSBefGshnzh2+6tKpJrFcSFWwvah4IrP
         UF/Csj47UNbVsBaKkZtsN046osZNPKYnSktkz/vwL9dKLshq/6qaU1QXpkn49yIqiifi
         5hyUY3E9LrHxIGIHSx1Ye9GN7alUy2d0IeutUd2Ya0CzjGVTfqMoHnAlilefG7InSkHb
         aQYnphk9Id9q3/2ENcrIukKu7Lj2HmfO6ZRUFKjaacm8Zs8CBbr04fFQNvyW4e1qZvzp
         ahwzO8xDG9u8Ln0Rmf26ocmn0uIttp+pnkWi0W0M/XuJQN8znY1i4PngZDGd1MYuauaA
         yTyQ==
X-Forwarded-Encrypted: i=1; AFNElJ8FS44gHPM9iZPR9akxBJ0cLODPk+lZW9wVGy3WOXx14+NTvZjK4liW06r51H3OtMD2Dbe/pvXm//jee6XD@vger.kernel.org
X-Gm-Message-State: AOJu0Yzm+cjJK7gpx4Fe0c+hB4DS+ffbLBuZNDBT8hq9HUzh9nAVXTPw
	H1CzImyXACr9izxeIZvElXfNGTc/1B1w4TZ5yb/YLA/+Q9MptqW/fiMtSYeN5i7AMqs=
X-Gm-Gg: Acq92OE+DEqIA5qJ0+vN1xTTe7doOM9JYQbFKaozf316jB510R824MA7/rbmdbrXmK9
	iLwTWFg/uXiqonJU05+vy5bMjgj80nEAQ4jIPi07H8oRwc3JZx9wVsdVisQ1De0vANr9PP226zX
	NjJ2UnhJBf9vc8wG0+T3aI/4tIo30yDuemNuSvL7Ah3V0Po3CWRLUp7wzywQzRXxI/zu96WJbNe
	1x+rOhzaGcMmZzRW4oR6yoiVimEjzT70Wzh06cuwOFldRvYrTL0HIDi56JruUHIgZ34GkHZVy+R
	7b9FkkUbIcTZfE5PortESOXQV5bV19sTvEZugnBjmMRHM7Jus6KyPHEJm4M4BmwxdOcBUx9G+W3
	qR0ePwOceuir/gNOirrVhjw5FIbY1AWMc7qgyB4a7Pb/K6XTHRPHRuRYPyFMpc+RvlcoSpnCMi2
	lvq85WUkAWlPUcqEb0dMc3Y+HO+M7P718pi7rTtM62q0WjutPF7uZJBSkiU17pKhs6aK6Afwkz2
	7WHPnXkdbRywzn3
X-Received: by 2002:a05:6512:1548:b0:5ad:2ac0:9fb0 with SMTP id 2adb3069b0e04-5ad2ac0a109mr69074e87.4.1781180569120;
        Thu, 11 Jun 2026 05:22:49 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8fc8d9sm6258927e87.28.2026.06.11.05.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 05:22:48 -0700 (PDT)
Message-ID: <ed42708e-97b6-4c5a-aa52-d712cd4dc591@linaro.org>
Date: Thu, 11 Jun 2026 15:22:47 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/9] media: qcom: camss: csiphy-3ph: Fix lane mask
 calculation
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Bryan O'Donoghue <bod@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>,
 Petr Hodina <phodina@protonmail.com>, "Dr. Git" <drgitx@gmail.com>,
 Cory Keitz <ckeitz@amazon.com>, Loic Poulain
 <loic.poulain@oss.qualcomm.com>, Hans Verkuil <hverkuil@kernel.org>,
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, stable@vger.kernel.org
References: <20260610-qcom-cphy-v8-0-cd4387785179@ixit.cz>
 <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260610-qcom-cphy-v8-2-cd4387785179@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112758-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[ixit.cz,kernel.org,gmail.com,linaro.org,fairphone.com,protonmail.com,amazon.com,oss.qualcomm.com];
	FORGED_RECIPIENTS(0.00)[m:david@ixit.cz,m:rfoss@kernel.org,m:todor.too@gmail.com,m:bryan.odonoghue@linaro.org,m:bod@kernel.org,m:mchehab@kernel.org,m:luca.weiss@fairphone.com,m:phodina@protonmail.com,m:drgitx@gmail.com,m:ckeitz@amazon.com,m:loic.poulain@oss.qualcomm.com,m:hverkuil@kernel.org,m:nihal.gupta@oss.qualcomm.com,m:Frank.Li@nxp.com,m:konrad.dybcio@oss.qualcomm.com,m:kbingham@kernel.org,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vladimir.zapolskiy@linaro.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:from_mime,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 34414671CF1

On 6/10/26 21:28, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The lane mask must be multiplied by 2, but this was accidentally omitted.

Fortunately this computed lane mask value has never been used expectedly by
csiphy-3ph users.

> 
> Fixes: c94d21ffa814 ("media: camss: Add CSIPHY files")
> Cc: stable@vger.kernel.org
> Suggested-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Fixes shall be the first patches in any series, please reorder for v9.

Then, formally it looks like a fix, but to my understanding it's just a noop
change against the current upstream codebase, thus the change is not justified
to gain the Fixes tag, see Documentation/process/stable-kernel-rules.rst.

> ---
>   drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> index dac8d2ecf7995..7c8c0e41bc62f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
> @@ -1114,17 +1114,17 @@ static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
>   static u8 csiphy_get_lane_mask(struct csiphy_lanes_cfg *lane_cfg)
>   {
>   	u8 lane_mask;
>   	int i;
>   
>   	lane_mask = CSIPHY_3PH_CMN_CSI_COMMON_CTRL5_CLK_ENABLE;
>   
>   	for (i = 0; i < lane_cfg->num_data; i++)
> -		lane_mask |= 1 << lane_cfg->data[i].pos;
> +		lane_mask |= BIT(lane_cfg->data[i].pos * 2);
>   
>   	return lane_mask;
>   }
>   
>   static bool csiphy_is_gen2(u32 version)
>   {
>   	bool ret = false;
>   
> 

After dropping Fixes tag and cc to stable,

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

