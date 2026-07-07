Return-Path: <linux-arm-msm+bounces-117103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vEsgBTRxTGpzkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117103-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:23:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D83717063
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 05:23:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=A5WPserH;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117103-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117103-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 06118302770A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 03:22:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D82B3A1696;
	Tue,  7 Jul 2026 03:22:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E802437C932;
	Tue,  7 Jul 2026 03:22:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783394530; cv=none; b=dB7OkJYECXFEKT0IlKuj3fdPnj9SlxI5MNqAE9M9EyhYmheRKjrQBMjRMK25MG9d4SlppEFYKl3KUYPbVjS1ttSOkXjPCKjSCTvqLv3lMEryG2PjgqDtVGhDHijLbxrLXtGYLdRKuGC2kzPy7NwvwgATtfQZUDL2liNBNlrit6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783394530; c=relaxed/simple;
	bh=AzISUhyU8ls8tWJIuvglVArxyb0Iz1Q8GmdDSUYdfgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASJLD11fvksrXubXaUimOpW+CfnSvtRrlem+0RNEuGMa89qtWfCJ6y6sCiM0b+N3Iyya0ndCLhXahh6CJZvq9wNcT40DnR1f8XZRwCYTgC0EVfhIT7pyvxDalaIaAKY9swzwSuERvxjMxCemi9v5xROXB3ePlqLZOI2Oh0QmKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5WPserH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267921F00ACF;
	Tue,  7 Jul 2026 03:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783394523;
	bh=r2m81evNFFaSA8QGN8H8zohHgVNrqJF2vk7UbAR8rP8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5WPserHDtGF6cBsrpSqkDSlsRcdxocukw8n+zBPp+GeKPooaN+cefqXLsaHo+WY0
	 9ZaxxbXVHLEiA3+LwTSoIe8IaO/OlSN72FGKD6QbieRQKZNzZT6TiQ3w2VpTfNKvB4
	 dZed19aCwMX81J+wj/iyYLnnkkZPy3o5FMF9avqTxAlwjqi8bxIEripAd6MHW1FT4x
	 hmENYT8zcGJpDxVN0l6LYAbbFJnWWXUhdlsCG09B5rwcX0A1CCtcveA9b7J94U65PR
	 5oX3gOChR8vOyx9BkFntlJ7x8LkLunHNx4xAj5WIKPIrkkjkgg3URx62/aClSMapFF
	 6woyo+le7nn9Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCIe port nodes
Date: Mon,  6 Jul 2026 22:21:37 -0500
Message-ID: <178339449890.1938770.7066889850779071034.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
References: <20260507-8280-move-perst-wake-v1-1-5b33cef2d807@radxa.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117103-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sophon@radxa.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B6D83717063


On Thu, 07 May 2026 22:16:07 +0800, Xilin Wu wrote:
> Since describing the PCIe PHY directly under the RC node is now
> deprecated, move the references to the respective PCIe port nodes.
> 
> And also move the PCIe PERST and wake GPIOs from the controller nodes to
> the corresponding PCIe port nodes on sc8280xp-based platforms:
> 
>  - sa8295p-adp
>  - sa8540p-ride
>  - sc8280xp-crd
>  - sc8280xp-huawei-gaokun3
>  - sc8280xp-lenovo-thinkpad-x13s
>  - sc8280xp-microsoft-arcata
>  - sc8280xp-microsoft-blackrock
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: sc8280xp: Move PHY, PERST, and Wake GPIOs to PCIe port nodes
      commit: a8fd72fcf305534f0a8da095de2cce467b73e66c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

