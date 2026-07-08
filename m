Return-Path: <linux-arm-msm+bounces-117716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q8ZVDi1pTmqpMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:13:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D384F727D29
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 17:13:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=FJh3jx5n;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117716-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117716-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4BBB430C0D1E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 15:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E5A64DB540;
	Wed,  8 Jul 2026 14:57:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536274D991F;
	Wed,  8 Jul 2026 14:57:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783522649; cv=none; b=bHvLQUW6UmoKgTH3uixqYVcaXRKF2KHjOcxFfu7I1qwCozOsHJnyhdPiQ+KrY+ovqdTvXD6OKuo3Eot3Hw2iMrPSmql7yu1WH35uM+wtPjNR+wtCCI7N0pm8QpgalgHFqwmZZ8qYN97lOfPjlyH9yvTAYSy2NOppMQIeKoCI73I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783522649; c=relaxed/simple;
	bh=q+0W6UvCkP1gb6ftPcDKFWsaPUEd/H/KkSCvYGpZcmk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKGHbFq+gHlxBbcOKl0+qlpfYXund9QJkXyxrb2hHKrC+7AYoVEWCF0zn5YPZEPGocL45LfqkFGhl0BHUCAYT4FppWF3zcOSIP+hfJ6Zaksz6MG8xmiS4blxLMoEo3IizKgaGoRiCY7FN//8QUpWqB8+VHzOgs4ZW6Aeif7e3Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FJh3jx5n; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0E01F00AC4;
	Wed,  8 Jul 2026 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783522648;
	bh=co3Q5kAD6QZZzu0SzFktKGzGZ/adQS9IGN3j4oDz3cc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FJh3jx5n8A12lgCMOIrq3IkwQFjslZpvUixdnKe4Kkxb5po2KKlQSoxUXV9vXSTW3
	 wPVM4mRWThO3XogOBCUpCQs3RDYiIS39Rd3mYVhmnft+XzE9amGu04LE1cxgs7bVgS
	 WzP3iVs81VlOqJ+DMRBHOv52Q+AB8RqWL1mRHkGKAVel0i8F9PENeTCbuj7a8EMqMN
	 ul0625YL1IH2LgHM7cGblVKxRJnyqWwHi6L1MPkszoEOQF3aBbC0aVMJeWT2GRgRXQ
	 LZ6+7jHfbbfMYXVrhN3PN9lpWMSMDKR4t2a++HH0XhjSrF7r7dYJKy30mX2dlDsxbD
	 ud2FeNAmElXXg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	Jie Gan <jie.gan@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: glymur: Add label properties to CoreSight devices
Date: Wed,  8 Jul 2026 09:56:28 -0500
Message-ID: <178352261643.2235436.9622439153380754131.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
References: <20260624-add-label-node-for-glymur-v2-1-e8420fd7025f@oss.qualcomm.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117716-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jie.gan@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D384F727D29


On Wed, 24 Jun 2026 20:38:12 +0800, Jie Gan wrote:
> Add label properties to TPDM and CTI nodes in the glymur device tree to
> provide human-readable identifiers for each CoreSight device. These
> labels allow userspace tools and the CoreSight framework to identify
> devices by name rather than by base address.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: glymur: Add label properties to CoreSight devices
      commit: 612d3cf7bb099cac3b948fe99608e0388d26f247

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

