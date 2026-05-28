Return-Path: <linux-arm-msm+bounces-110046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG1oL06xF2p+NggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110046-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:06:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 652425EC110
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 05:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9C2A30B6EBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 03:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8063A30AD00;
	Thu, 28 May 2026 03:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4DITR6J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75514F70
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 03:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779937533; cv=none; b=PV26s35d8MrU7yp3wytNOhZcBvcoZfmTUYHZ6Qw73WwyTWUvHFZOg/xAnuouf7mga0bPuMrLb/R+op4NpkmOZS3MkEwAxARdqAbTF+W7VXXff9Pe0C6lOQzbN6K8tiuz4sawOwgbWPwMJ42vBXdf6Rc9uXITmDZesAfS11+JR6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779937533; c=relaxed/simple;
	bh=A3f4Q2Sld0W2xjtP4UNC1GwvsA1zuj4TCDEiKmnl92A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jeethMykKVchf84rRv9mc3H7iH01SScI0gUb/wHiEK4z4X4WRX+dVz2WT5xeuFFxn4vaDE5+vbFgcYR1Y1/pNZX2Opi9PFGVjO02bY3dqXP3mwRuzhg/q+7bApYIgtjuwipuMgMTCGfPK6dw7P1rTTV2K0vMksvbZdir/FZOFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h4DITR6J; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-304997cdb21so4796385eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 20:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937531; x=1780542331; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7M+KKNYPRc5CJ7Ei7/rAcbZC79wITZmeumvXSLTz6w=;
        b=h4DITR6JOjFcLRlOozshnletkobldGYmXbmQGiMNFzQTxn25hm1yyhpqjbDLphDmpj
         MuZdv6JFJWJMAWKnWWtkqMcJVff7x0kgWkLu5loMP7XDgFi5IbZ3l/xh/R6ioTueRW5n
         CxkN1lQ0v9h+dwO1C6NZ9alGDFCaKdw3H8JEXX0o6p6UuQoZpViJeSD9Gt7yW2rAqBVz
         qktcSd0yssuG7D9QEIE+Uc9+0Mgzyma/2DQpcdDXo0TZahb9CIFW4KN+ak45v3waHNFh
         C9uCFxjeOvBVvaRTbnuT/3TkesendNNKEqRJp3PQ8Spp3nqe1gHmXmHJm0+7G9vrT7+e
         kVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937531; x=1780542331;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q7M+KKNYPRc5CJ7Ei7/rAcbZC79wITZmeumvXSLTz6w=;
        b=lPyd5Wwv5kgJ8gW+7ZmiR5t7CEAz+KNhvzymYMWtKDTo+WAiBkfxfF4omajcpr0JIu
         4EQECvW/LO6dQHFjfineN9SNbCVKF9iGPkjhnj9ulCJSHVpYQCX/ATvuP+MoM7cUtcM3
         Hag57GqciJdzR6T463qmPPWSMLKgWK8V5N7zqDp6dhzZyPDMKJuRJqMPRDzA0dllXKEG
         fYI0BZl/MNJP/BX/15HUm+h9rvGSGFFcp3n1ecRbo+aitVmOEkPqj/VQb5ivs2Tgqm+h
         dWCsdtqxdSWcqU5V+PBnwkFHsypvAHF0bEYhnaZO1TApuicFITZls0U5UY7bnHkvEit+
         HbGw==
X-Gm-Message-State: AOJu0YzFwfofO0hk/lULhqNCYAqeSYD6PGoXFdtN9MmLwpjpixkT8ham
	R0qFA+oCY/cHMBxHaA2D0mLP7BcaMFaBDjb7a9uGWv4VgGdamkAAFumx
X-Gm-Gg: Acq92OEUqgl1WPRXwJN9mhXp7QXp+eryqj+gpr5yu6od2ELhhYt0of8ki/SU7SYD+nV
	UpxkHM/zLstR/4F2a3U43EVfOeZRl7imQ71ESMxCax3fIHdoJUB1wx6xg4T5bFaeas3yuabkePx
	YpuziEwv6b2JeVIUqJ5W14bX/vD9FvWjIrNH3Kj6jd3aDZst57mGT6uADfdid5EzEZVEDOqo2C4
	kmJTDBcAzM94Y6bJKVUv4ZehucYT14wkllz1N4Wn9fiX0qUnVhVZJZ3IQ/0v3hQ8pWZLpI/lv0u
	XrFHofZyNjOYNtwi5jBrtwvHn2nctfv+4ZWX7YNGFuXOXn2m97Xb5qGZ5vLCZrLWeFgT5dZrxFN
	xYxJa+Hzq4thsGxLSKvxf4jYqxUzJAgFelN8SFJnLUUY8as+3MypCn2bapZudDu8GJaE/iRrLIH
	OqCFIwOSv7m+ez4WCU5WuqoFiQohdEVQ9pThyhntYmtDquwfHnGuZl77mO8hwSRx9TIMljsK5eI
	YBjskkzxqpBmHcAYlYUNy09syE=
X-Received: by 2002:a05:7300:134a:b0:2cf:28e8:d784 with SMTP id 5a478bee46e88-30449184a7amr11069090eec.19.1779937530712;
        Wed, 27 May 2026 20:05:30 -0700 (PDT)
Received: from [192.168.68.65] (104-12-136-65.lightspeed.irvnca.sbcglobal.net. [104.12.136.65])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3045225b7b6sm19413264eec.25.2026.05.27.20.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 20:05:30 -0700 (PDT)
Message-ID: <6e3b1279-61c8-4bc5-9f66-e437140d3074@gmail.com>
Date: Wed, 27 May 2026 20:05:29 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: spm: Add MSM8960 SAW2 CPU support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514-expressatt_cpufreq-v1-0-487fd2d78859@gmail.com>
 <20260514-expressatt_cpufreq-v1-2-487fd2d78859@gmail.com>
 <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Content-Language: en-US
From: Rudraksha Gupta <guptarud@gmail.com>
In-Reply-To: <1bf1558f-19b8-4052-9609-52039f820bbb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-110046-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guptarud@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 652425EC110
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

>> +	.seq = { 0x03, 0x0F, 0x00, 0x24, 0x54, 0x10, 0x09, 0x03, 0x01,
>> +		0x10, 0x54, 0x30, 0x0C, 0x24, 0x30, 0x0F },
> I can't see these values anywhere downstream

Hello Konrad,


The .seq values concatenate spm_wfi_cmd_sequence + 
spm_power_collapse_without_rpm:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3265-L3285

These are passed via msm_spm_boot_cpu_seq_list into msm_spm_data[].modes:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L3303-L3369

msm_spm_data is passed to msm_spm_init():
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/board-express.c#L5510

Which calls msm_spm_dev_init() per CPU:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L221-L239

That writes each mode's .cmd sequentially into SAW2 memory, bumping offset:
https://github.com/CyanogenMod/android_kernel_samsung_d2/blob/0dbe2b56847b304d30b809dfd08ba3b4a61d9af8/arch/arm/mach-msm/spm_devices.c#L148-L162

The upstream .seq is the same thing pre-concatenated. 
spm_retention_cmd_sequence and spm_power_collapse_with_rpm are omitted 
because no upstream platform uses PM_SLEEP_MODE_RET or PM_SLEEP_MODE_PC:
https://github.com/torvalds/linux/blob/v7.0/drivers/soc/qcom/spm.c#L134-L249


Thanks,

Rudraksha

>
> Konrad

