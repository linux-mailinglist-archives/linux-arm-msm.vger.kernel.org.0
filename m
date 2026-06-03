Return-Path: <linux-arm-msm+bounces-111079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DjI4KVq2IGo37AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:18:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E563BD4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 01:18:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=lBeZTzPb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111079-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111079-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0976030391EF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 23:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D290D4DC544;
	Wed,  3 Jun 2026 23:16:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4344DD6D9
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 23:16:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780528569; cv=none; b=YzATndirCuvDZBbi6cqubkggSqHx0+egk3C5TgAyWTzSRtvIRrgmeIeN3tGKARxmzmczpLN6QjZ0KtYkPEEDnQwdZe3n9teHS9VRNf8KTlD6jrSQBQvBZDdd5+pSl3IQdlgqsTNfEAq0Q2F5vkfe1EPasb7YG0yjAKa4tgcyRRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780528569; c=relaxed/simple;
	bh=IIJGXZ517/1odyBzl3yh/mi2UlFo51wwrWvadaljdf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OukdZ6rzHK4UsWB35iDdZ/ri/oD/MFUSdLy9F3ZluNZAetJkd/aijOqD7Cka5nrXyJHwqCh7RHk7tm/s6ulY33lzjl8a7fnVWBBduyKT0YAFYmvOgS/UZjyi6fzd6lNOMPm0FYDByvH+WUSP2+az2Dden0VgH9DEVud6A62cuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lBeZTzPb; arc=none smtp.client-ip=209.85.221.47
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-45fd461e4a5so49199f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 16:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780528567; x=1781133367; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hWizzsQNDQB/C5tp1FfFcGVRcCGlCmeyJzRdeEaQEMg=;
        b=lBeZTzPbcvggaA5NCmytVo/vePQvi3GEb4+yN170q+kjISsnW0AubJTjcird0CBSPB
         s1lv0Eik/fVef/KZaE10wxDhlj6E2b9vbdy4JdQCJp6813ji5OlzBazXe1PlpCLoFin6
         i8GQLVe9voBntgYUoikMRefCVgVg4jggjMLEQ9NhzFMU/PAIwMN+UcGyxVXC/IyeeWv7
         MHX1IXGqRL0gLjuy/j1nw+j9yNHAcdPqQGHs2TT4NHmhy53HCVE+jYDkUj5hkcWBzi2l
         95/2zkmdtk4FFLcSCSvKoSyAJ0uVihVmCp8VFuqGseq7GNY3I2BUw4H0qgKhZ2AKNVUW
         D1IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780528567; x=1781133367;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWizzsQNDQB/C5tp1FfFcGVRcCGlCmeyJzRdeEaQEMg=;
        b=Od5WnFlkHv5kY/Gq9p/XOu5YysbBBTVGT0AJXQTIpHU9k/Dfa4OFfd97CqADXbihLJ
         g2380TAef76ZSo0B5quFwNmvkmHPdcVdWpKeksIZg4aoCwgfy3VvmcyJeVO8E2FYyuyr
         rFM8mzzwdgdJm8X3fsRrzPyvdgdtFw6OlBjIRLQAwq/sRJLpponCUUDLo/ZnfDAJxV86
         ecPZs0IDKG4WEUOX+TUc0Z3uP04oDITuU9G2kZnLx0L/CTCvaBM195svoFQ+CuMbuLcR
         nxtV3+ap+0wXWmr6ELOC21gp3EM7dWIvKLfTn2SCOgf0HA5HOshgAz6+gvzJQ1I30J9c
         3vig==
X-Forwarded-Encrypted: i=1; AFNElJ8YAyPKAM6GDdBMt6J/pRJnvuE5OkGjJnAK87o6kXp7pQ1t8aY0VglWdTh/YrooZ0ipETPtghotPj27P7ue@vger.kernel.org
X-Gm-Message-State: AOJu0YykNn/22m/F9r6Zi7dEuXKH9T/JQCcbMJvAPWW+z2IlL1oTgadX
	/wAX2gmMQW+FEwW1TFhxlXPDIUi2Y5wdJkTVpfRTo2nEQ99BlZB+y/iBT+KaSRdVWDE=
X-Gm-Gg: Acq92OGJnieppF/GPaDe0NdBixn3lfBdVRt0fmN915aQ4WCARqOSQKnmQqxc2FVTrfm
	O50TJ4STWl1XXdjn6T6PvTHrc//GGBdGH0wHbQm3DauRdQEOC4/jEtwRrm0DSwL1r2qKnYdq1nP
	uAE7gulT5924q8XhaZVuHxFzGxrWUHF95+lFBSv441OhP9qFgqPU1/37x/nPcUQYJeRDiK2qXoG
	o6LGyPmfGfRB8lRb91WFQ5Zxjii4gqzumF3Qj09HXxEYIe+OndQMsY4BvYq7dQxFA51PTRXVijr
	G1xR1LLXM4KDD0kCKYehhC0B3hP8QKVPockaBnmjz6DyDHyeAdGUzUiQ4JaX30t+vDf7Nlvjsdl
	ZN1lvvwA28dQYrwwm2cD4/kjyW0Cnl6MSaZ4eLTPnAOZ11fjP30Z8YR8Ioa1ltjAYtUWryNc3Nh
	8z6VkxvgoevfoeiHUdWdKL5rW5o2G6jHPfWTOeTA4wfTfQww==
X-Received: by 2002:a05:6000:e51:b0:44f:da08:18f2 with SMTP id ffacd0b85a97d-460216d7f47mr5876752f8f.12.1780528566788;
        Wed, 03 Jun 2026 16:16:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f35133csm10440882f8f.25.2026.06.03.16.16.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 16:16:05 -0700 (PDT)
Message-ID: <11134fb3-8c78-48c8-bd63-719ad1c35036@linaro.org>
Date: Thu, 4 Jun 2026 00:16:02 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: qcom: camss: Rename unused macro parameter
To: Hungyu Lin <dennylin0707@gmail.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org
Cc: vladimir.zapolskiy@linaro.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260603231202.6569-1-dennylin0707@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260603231202.6569-1-dennylin0707@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111079-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dennylin0707@gmail.com,m:rfoss@kernel.org,m:todor.too@gmail.com,m:mchehab@kernel.org,m:vladimir.zapolskiy@linaro.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F0E563BD4B

On 04/06/2026 00:12, Hungyu Lin wrote:
> The ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN() macro
> declares a parameter named 'c' but uses 'cid' in the macro
> body instead.
> 
> Rename the parameter to match the identifier used in the
> macro body and silence the checkpatch warning:
> 
>    WARNING: Argument 'c' is not used in function-like macro
> 
> No functional change intended.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---
>   drivers/media/platform/qcom/camss/camss-ispif.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-ispif.c b/drivers/media/platform/qcom/camss/camss-ispif.c
> index aaf3caa42d33..8b0753e606c1 100644
> --- a/drivers/media/platform/qcom/camss/camss-ispif.c
> +++ b/drivers/media/platform/qcom/camss/camss-ispif.c
> @@ -83,7 +83,7 @@
>   					(0x270 + 0x200 * (m) + 0x4 * (n))
>   #define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_1(m, n)	\
>   					(0x27c + 0x200 * (m) + 0x4 * (n))
> -#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(c)	\
> +#define ISPIF_VFE_m_RDI_INTF_n_PACK_CFG_0_CID_c_PLAIN(cid)	\
>   					(1 << ((cid % 8) * 4))
>   #define ISPIF_VFE_m_PIX_INTF_n_STATUS(m, n)	\
>   					(0x2c0 + 0x200 * (m) + 0x4 * (n))

Nasty

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

