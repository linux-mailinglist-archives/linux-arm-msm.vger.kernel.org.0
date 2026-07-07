Return-Path: <linux-arm-msm+bounces-117099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id i4SyIBdyTGrNkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:27:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16D7717135
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:27:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=PexVkn9L;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117099-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117099-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7089F3030116
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C97B3890F1;
	Tue,  7 Jul 2026 03:22:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E8FC3939DA;
	Tue,  7 Jul 2026 03:22:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=WOZrHptP2atVe6bUBVAw0di/8pO9a7vQIL1Hng96qvZWKqcI4sGO34K7c8wM9VxPm6go6S3Kid/b1AlbAYOOF8MSyfRtJcClg4arDh62FeEfMvvH08cMOsDHXClzJ9PdVs9XV0OcNizv44dc+ZXrVmdfCWPG+F8iPhp+2gj+L54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=jH2KSoGlwnb+2n2hXpgwLcEBCQpuWsL/KznpRqaCsW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VF0acUGssFi9otXHCASCcPtj3u+xOHkiIqcIDZiFmSXzF8KpEb0W6hEADDFf3R6u0cjIbguk/CT5acUT8jrnrs2+NRmigiTweyN4gNikCsPngq7xxxCyN1zVsU/higxODE69BPIrKOJjYSkyMFka5AaXLgpbpn1PGpooULCPi9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PexVkn9L; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE651F00AC4;
	Tue,  7 Jul 2026 03:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394521;
	bh=PLTsJsluPqWdcVZWiqxxM8b99Qw43iYIQdSbcCGV9/Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PexVkn9LzZ6W7oUC+bG7w3LRtevbFq9jIt5u8Qb6gz7rAEIk6KPSR2HMqmv9UrLSX
	 f2CMcYDfA17v5gIXTuwBAsIZwmIa5cwUwbQE02vnEXxpfcXOniJKAHr7Kkogr+KCpy
	 DdzrQGOsNkoRc0chm5e4eNInn9nebn2jV/1xpw99+NMONkf95KTkqi7lRxDNwpTHNa
	 NPGCUlrUs+TLxlZYuhRq6v3aBC2CekP0ozkAfJcNzwQY2Ot4lA1lYnYw9d7TDbDiKX
	 0P5T98k2/CQO6yrPYXE9eHjSoegerpu0iD4v/d7VImaL81fMlBB/vBW/5+9Iq3US+v
	 RSiw+vOqxxVKA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
Date: Mon,  6 Jul 2026 22:21:34 -0500
Message-ID: <178339449920.1938770.17492438555652133562.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
References: <20260522-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v1-1-c7653924acdc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:abel.vesa@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:pradyot.nayak@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117099-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D16D7717135


On Fri, 22 May 2026 15:26:39 +0530, Pradyot Kumar Nayak wrote:
> The touchscreen module on Glymur/Mahua CRDs is different from the one
> used on Hamoa CRDs and requires the reset-gpios to be wired to the device.
> Without this in place the reset line will remain permanently asserted
> during resume leaving the device offline and causing all I2C transactions
> to fail with -ENXIO.
> 
> Error Logs:
> i2c_hid_of 3-0038: failed to change power setting.
> i2c_hid_of 3-0038: PM: dpm_run_callback(): i2c_hid_core_pm_resume [i2c_hid] returns -6
> i2c_hid_of 3-0038: PM: failed to resume async: error -6
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: glymur-crd: Add reset GPIO to touchscreen node
      commit: f64ef325f1d9ca9d005b7124c2bf065bb0b99c3d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

