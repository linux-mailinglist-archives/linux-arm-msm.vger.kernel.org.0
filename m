Return-Path: <linux-arm-msm+bounces-117623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5BWfGuZFTmoDKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:43:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBD872666E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:43:17 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=JovDNmPC;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117623-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117623-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0620301905D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 853C444DB61;
	Wed,  8 Jul 2026 12:37:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52DFA44B695
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:37:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514244; cv=none; b=N7NqSIevFH99D/u0ThJTzpcxq30ZIpCA6Zr5FkCUQekMFZJyI/9NejC+0wwJ++MJDytAMANIXgJRpE1tsGVv7zki8yLH7f83MoWOpEnFTmrulzZj9RdyI/iqRKKgEid7Gezvh31VOg5ywsWqmL5ubPJcuHnO59EyAA+6ofXddIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514244; c=relaxed/simple;
	bh=w+1RRA6rZbxqjZtNS2I/gsJHBl7rL1mZShKbkKcneDY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NBYebsR0XZFvF5GTP7bQNBlJui6tBkM9gdlN5A08pmR84YN7YUiOTgfHWI4mVfOec4ZDosk9+8OLagN0J39QpKkT3V0igFEGB0d6b/sYQluNdONI+9maVxegaLTjapOTRR4YKoSe8O1F5jEl0S/B2eMts/3azEe8EZXUwGbhoFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JovDNmPC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 646711F00ADF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783514241;
	bh=XfiUur0Kr+Q7bgq22hLGxjyCrq0Ps76VqvbE0kLZpd8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JovDNmPCILxzkAt5IJ8bCG6EGPEzCEzgsbfvDVrCxfAsgF5ITdgeDg3cQPesuZhV8
	 OG7us8+7r98dRe5uKeCwm+kDh7fpZf36Q54iZ0imTfM2tbj5K+3n/9hwIeGHPhcYvk
	 gSMW7HBx9xt5FowZnVl3XgGuUnj4FSkpc8mJHGTbauIVQsqpQaZ2vqMXwngwiur/Um
	 XXFISWlPHHuRy63pY9q83hCR9p7vDEnMjBBHkuULd0kKz28pOBHb+4kzOKiNHRqq75
	 emdARE+aCfZdoyQTtAN0J7QJP7oSyS5PvU1Sc5kft8w4qU0UkVHaK25In3q3rq7BpH
	 elBaCzTEXRe2A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso612749e87.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:37:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoFLxxyVpstB7OgWaUJIgiPiEPpmyZQ4Yj2tXftZaHe3ez8qI0FAEMCXQ0r+J0M3RtdE4ry+6UBDWh1YFcD@vger.kernel.org
X-Gm-Message-State: AOJu0Yxt1xg+ZNIzMZGPMSCLONeyJ3ioY++O7vSs22N8d5sBQSv2WSeO
	J6jeNxzAuLND+dJY83ZfyadTcqcz75i70IsLjJCBHupQj8/0XwwzKL4M/3pFZxIcHpGeoelA/Ng
	TZyn/jHug0f4Cg2PSjve7KHbkWhV6ND4iPnTytFb7TQ==
X-Received: by 2002:a05:6512:4507:b0:5ae:c099:a92 with SMTP id
 2adb3069b0e04-5b011485ac2mr617455e87.42.1783514240069; Wed, 08 Jul 2026
 05:37:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:37:19 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jul 2026 05:37:19 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706-ipq5018-bluetooth-v4-0-350262a30959@outlook.com> <20260706-ipq5018-bluetooth-v4-4-350262a30959@outlook.com>
Date: Wed, 8 Jul 2026 05:37:19 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf3TpJ6hM=LbX6GwztY-rGG66AeGGJ1pxLmWUSSK91Dtw@mail.gmail.com>
X-Gm-Features: AVVi8Ceywm3bByhomGUKsMGJ8qVgtzooCIpxOCT7q59JZC1PEs1w66ncIlsgnbM
Message-ID: <CAMRc=Mf3TpJ6hM=LbX6GwztY-rGG66AeGGJ1pxLmWUSSK91Dtw@mail.gmail.com>
Subject: Re: [PATCH v4 4/6] Bluetooth: Introduce Qualcomm IPQ5018 IPC based
 HCI driver
To: george.moussalem@outlook.com
Cc: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117623-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:devnull+george.moussalem.outlook.com@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:p.zabel@pengutronix.de,m:devnull@kernel.org,m:luizdentz@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,outlook.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_TO(0.00)[outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,holtmann.org,gmail.com,pengutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,george.moussalem.outlook.com,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8CBD872666E

On Mon, 6 Jul 2026 19:26:20 +0200, George Moussalem via B4 Relay
<devnull+george.moussalem.outlook.com@kernel.org> said:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add support for the Bluetooth controller found in the IPQ5018 SoC.
> This driver implements firmware loading and the transport layer between
> the HCI core and the Bluetooth controller.
>
> The firmware is loaded by the host into the dedicated reserved memory
> carveout and authenticated by TrustZone. A Secure Channel Manager (SCM)
> call safely brings the peripheral core out of reset.
>
> A shared memory ring buffer topology handles runtime data frame
> transport between the host APSS and the controller.
>
> An outgoing APCS IPC bit and an incoming GIC interrupt handle host/guest
> signaling.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---

...

> +
> +		/* Check if firmware is split across multiple segment files */
> +		if (phdr->p_offset > fw->size ||
> +		    phdr->p_filesz > fw->size - phdr->p_offset) {
> +			seg_name = kasprintf(GFP_KERNEL, "%.*sb%02d",
> +					     (int)stem_len, desc->firmware, i);
> +			if (!seg_name) {
> +				ret = -ENOMEM;
> +				goto release_fw;
> +			}
> +
> +			ret = request_firmware(&seg_fw, seg_name,
> +					       desc->dev);
> +			if (ret)
> +				dev_err(desc->dev,
> +					"Could not find split segment binary: %s\n",
> +					seg_name);
> +
> +			/*
> +			 * Use the virtual instead of the physical address as
> +			 * the offset
> +			 */
> +			memcpy_toio(desc->mem_region + phdr->p_vaddr, seg_fw->data,
> +				    phdr->p_filesz);
> +
> +			release_firmware(seg_fw);

I think sashiko is correct pointing out this would be left uninitialized.

Bart

