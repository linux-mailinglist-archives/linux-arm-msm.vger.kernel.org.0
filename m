Return-Path: <linux-arm-msm+bounces-109035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBf6BarzDmqmDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109035-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:59:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A2A5A4602
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:59:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21E90300694B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAD53C5855;
	Thu, 21 May 2026 11:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqSOwycc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E830F533
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779364698; cv=none; b=qTMTbzRAVjbTmw3Rdhh0G0EdD2NcCXClLx+wUDEx2/k9TVsDY5MMC1N3qyEtRGu3XGdO4q4TcQwxgnuqiJb1eSYZReQFT1QnOcalBajTzN+UEzLIxC+a0S/Hjd7CHFpWh9L3xnJeShNFrWPowuGN0+Ex+Ce84hCFcgeYsJ9DIbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779364698; c=relaxed/simple;
	bh=6ZVc+tCRCCkcEiJ6SjAllBlClzLxvxfyjkV50j9aGNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTcDkhrAyQXjwtwlOOTalFSYPSQ1TVRqW8/0s906hVITjqvEBWn6ZTA+aotwv8d9dpeXSvM0Bm5KHDazPgonk97vFJNU5lj62UrFQiZe/Y0wpDN5Z7VCDclNX7nMrwdVGRkAKO5/ErdwEeBsTYqIlp4z6O/+wOTXw6RvWh6RY9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqSOwycc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4585a116a4aso5076150f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779364695; x=1779969495; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4stJ0wGm3jktbxjyMiS2oEBiggoOgvX2rImz04PGH7E=;
        b=LqSOwycc1pKd8MEuRb4f4/wdTESwGmlobnw1cgU0S//O7yMYEzcL9+jhi7XVYDbW6j
         bpRg+FFJeT16gVqNP5HzofdOFKQCzYpN5zt1ILZJHWYABbUxGHewWvRDkt9a8aX+TjML
         rIEic5usCaj9x4bvUi85sf6if8EPaU51KI5+bkqcB2Ng6nttEfqU9vdJOx3iSXpljmQn
         kB56hTeSJPKaX6a/WzPszcOjioV8EBlTRga5a/AmbiciWXKPw6RdypGtLJxq6RY8o6kr
         J0XNvAcLlQ2iPgvCohV/5Tzy27R0QAFDr00RGMw5VbS72QAQVdcGtGCCparrTdvos6vU
         kmWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779364695; x=1779969495;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4stJ0wGm3jktbxjyMiS2oEBiggoOgvX2rImz04PGH7E=;
        b=k2yFexpX814ulFfhDPo1DJmPOaeQVUNDqLrzRyJfwpmAmQVu5C0y7w6vAbGH/R4rBi
         pw1InffuRx73kfhTm+ydpZX1Jqdz0dPxuVCwHPQ90795T1oz1oj5PUy23xk+9jlY15dJ
         /avPlWyzrjNI8bYk2WZPcca4C3Vm1qAdE2lw1Ja/j8hUOPUK/UB/YRHxdzW18iRQcnVN
         aIx8LOsPZdfrBhsvU8YnOg9gwBf8JtNFOsZv9vgxliC6P781hKxZ5YxsaB0PA2DMq7gw
         3PpnUhonJ9iRV7bN9VXytJrpF+YYgL25aXVZL5UlFYSmIeA19yiYbm4QLNSIRAC0rLvJ
         IHGw==
X-Forwarded-Encrypted: i=1; AFNElJ9TIyV0jnmKpJNaRnrNT7mvlJ3C2KIbb3uHybyIDgsspQAaxC+FqrnFN+2+lHtoXhle+zW959FLNmXahbOm@vger.kernel.org
X-Gm-Message-State: AOJu0YwUSK1+L8q8k3laWsUyaaHZ33mPI9j7nuoBDF05lH7RIDUZg6NB
	zzDB7uSG+3D+x+CMGoE+nlFTK2dQMtKZKfcMpbgmp5ArpiUlw2Ba3OvopBYnZJ8QeIU=
X-Gm-Gg: Acq92OEMzsSATf0NO5BVLO3ixA37QlAor3JGAKtnAQCwt7oh0Inf9j8fwX1Q1E/yY1j
	gKbhd4ScpqtUbkqF7JS6Bi5mR3tCWXjaXNNbV9LON0izVo8Vp4cQc1e18HbQZBT1iLFYCiNvxnS
	y8/NwzUKdogCRgRUPDsFG5zKWsb+Sdk/OgQ6UdU6WKedX4WVgDJ0wR7lyVxTyM5VOOBIFAhxwnb
	y2wIr4Ut7EsB7iSTaI8tGB/WdnhCWOfUVfX37bOJrIx84PxZtqSDGyLLna1Hq3XYo2rv3pjPrvK
	buXU4MCWfGatWoC3h5ufPxx03dAloNXOoz08erIpo5T4qc3h9DLPM0HzhJeAp/pJpNEo9blBgqV
	/8+NgihczjA+ksJBbrrsTC0X5s+60aSHJF361kddtokp6NedPV80HAQToTbKtWlq66xwjBx5py8
	AOi+xaIaaDkJ87HpsaLHxNN2Wi4ZIC4SbnnQ==
X-Received: by 2002:a05:6000:4615:b0:45b:d891:56bb with SMTP id ffacd0b85a97d-45ea4109a8dmr3655913f8f.38.1779364694940;
        Thu, 21 May 2026 04:58:14 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.55.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa93d291sm2227253f8f.36.2026.05.21.04.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:58:14 -0700 (PDT)
Message-ID: <d543fe6c-88a3-40b8-a83a-ccc6fa80eee3@linaro.org>
Date: Thu, 21 May 2026 12:58:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] phy: qcom: qmp-combo: skip USB power_off/exit
 after device teardown
To: Michael Scott <mike.scott@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
 dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
 abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
 linux-phy@lists.infradead.org, andersson@kernel.org, konradybcio@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org, val@packett.cool, laurentiu.tudor1@dell.com,
 alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
 <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20260521010935.1333494-2-mike.scott@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	TAGGED_FROM(0.00)[bounces-109035-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 71A2A5A4602
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 21/05/2026 02:09, Michael Scott wrote:
> qmp_combo_usb_power_off() is reachable from an external consumer
> (notably dwc3 via phy_exit() during driver unbind) after this device's
> backing resources have already been released along a separate teardown
> chain. The dereference of qmp->pcs (whose ioremap mapping has been
> freed by devm cleanup) then takes a level-3 translation fault and
> oopses.
> 
> Easily reproducible during testing of USB-C role-switch enablement on
> Dell Latitude 7455 (X1E80100), by writing "none" to a USB-C DWC3's
> usb_role_switch role attribute, e.g.
> 
>    echo none > /sys/class/usb_role/a800000.usb-role-switch/role
> 
> which triggers the chain:
> 
>    Unable to handle kernel paging request at virtual address ffff8000876c5400
>    pc : qmp_combo_usb_power_off.isra.0+0x58/0x470 [phy_qcom_qmp_combo]
>    Call trace:
>      qmp_combo_usb_power_off+0x58/0x470 [phy_qcom_qmp_combo]
>      qmp_combo_usb_exit+0x38/0x90 [phy_qcom_qmp_combo]
>      phy_exit
>      dwc3_phy_exit [dwc3]
>      dwc3_core_remove [dwc3]
>      dwc3_remove [dwc3]
>      platform_remove
>      device_release_driver_internal
>      device_driver_detach
>      unbind_store
>      sysfs_kf_write
>      vfs_write
>      ksys_write
>      __arm64_sys_write
>      el0_svc
> 
> Two WARNs precede the oops from the same teardown chain, confirming
> the resource ordering:
> 
>    WARNING: drivers/clk/clk.c:4494 at clk_nodrv_disable_unprepare+0x8/0x18
>    WARNING: drivers/regulator/core.c:2657 at _regulator_put+0x84/0x98
> 
> i.e. the pipe clock provider has been unregistered and the regulators
> released before qmp_combo_usb_power_off() runs.
> 
> The proper long-term fix is a teardown-ordering rework so the QMP
> PHY's backing resources outlive any consumer that may still call its
> phy_ops. Pending that, guard the power_off/exit paths with the
> existing usb_init_count balance so re-entry after teardown does not
> oops. usb_init_count tracks the balance of usb_power_on/off; if it
> is zero we have either never powered on or have already powered off,
> and there is nothing to do.
> 
> The same guard is added to qmp_combo_usb_exit() since it is the entry
> point used by external consumers via phy_exit().
> 
> Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>

Something like this requires a Fixes: tag

> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index cdcfad2e86b1..0db200292642 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3926,6 +3926,17 @@ static int qmp_combo_usb_power_off(struct phy *phy)
>   	struct qmp_combo *qmp = phy_get_drvdata(phy);
>   	const struct qmp_phy_cfg *cfg = qmp->cfg;
>   
> +	/*
> +	 * Reachable as ->exit from external consumers (notably dwc3) after
> +	 * this device's backing resources have already been released along
> +	 * a teardown chain. Refuse to touch registers in that case.
> +	 */
> +	if (!qmp->usb_init_count) {
> +		dev_dbg(qmp->dev, "%s: PHY not powered on, skipping\n",
> +			__func__);
> +		return 0;
> +	}
> +
>   	/* PHY reset */
>   	qphy_setbits(qmp->pcs, cfg->regs[QPHY_SW_RESET], SW_RESET);
>   
> @@ -3968,6 +3979,17 @@ static int qmp_combo_usb_exit(struct phy *phy)
>   	struct qmp_combo *qmp = phy_get_drvdata(phy);
>   	int ret;
>   
> +	/*
> +	 * See qmp_combo_usb_power_off(): an external consumer may call
> +	 * phy_exit() after the QMP device's resources have been torn
> +	 * down. usb_init_count tracks usb_init/usb_exit balance.
> +	 */
> +	if (!qmp->usb_init_count) {
> +		dev_dbg(qmp->dev, "%s: PHY not initialised, skipping\n",
> +			__func__);
> +		return 0;
> +	}
> +
>   	mutex_lock(&qmp->phy_mutex);
>   	ret = qmp_combo_usb_power_off(phy);

This can't be right - you check usb_init_count before the mutex and then 
again inside the mutex @ qmp_combo_usb_power_off();

It seems like an error to even get to this function with !usb_init_count 
also check if that is a signed or an unsigned value as usb_init_count = 
-1 will evaluate true.

>   	if (ret)
> --
> 2.53.0
> 


