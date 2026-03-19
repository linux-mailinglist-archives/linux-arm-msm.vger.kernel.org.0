Return-Path: <linux-arm-msm+bounces-98596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCdDLhxvu2nGjwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:35:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2293D2C58F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 04:35:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5037231F9869
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 03:31:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E16622D781E;
	Thu, 19 Mar 2026 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cL2OWio9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD961274FE9;
	Thu, 19 Mar 2026 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773891104; cv=none; b=iAtfvuRe3HThNgfAqwuzafUjE1Dt3zfp4+3uYiHgQT+7kdyeLM1lbpTvgrwcvaYUNFz44uDRZ6ofTV7z6FvEQR90mPvD/erTwBoRt3Q6BWxAYsMgWW0i+w/sEtTLvF0rOTa5Xw0eiVoG3PHK5DhgoocufDdn4FfQ4XM8PgbZeYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773891104; c=relaxed/simple;
	bh=m+7yrCwC+pKYWfsgDv/RmSxQGUtkYG7HQcXYhhoK1Fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LbfJjjB24UuLpeMzZ6F7MKpaV/aY3oe6LLQvPJ6v6n9BA5mKUTDQ8Yj5Aw5pl9MjNNqRIvkTsNBVrP4voJcL5c0pj6tJzi1G0GrR8QBViW08yjI3GycOirlmCQDZAbLtR+LGRTep9iUQ63DTVnkxR2i/X0Po8nM5ssFEQnPIFfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cL2OWio9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA2AC2BC9E;
	Thu, 19 Mar 2026 03:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773891104;
	bh=m+7yrCwC+pKYWfsgDv/RmSxQGUtkYG7HQcXYhhoK1Fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cL2OWio9s/e8WqQqUw+A10U0mNOcSuv+0NpUIL0/w3MjH7yj3L1xiD+z1njhimWoL
	 EFNJXtPOX0WKVydg7ozZAhJ0Bj5ypCLtdvfOXq6TDTvltF+Wz9On/Ip3orcKQaJ+EU
	 JjTSMagtrxYn1zjRB9efoDG5xw6IrM5pPxnzCHSMcQLDdbffoPTZgwIWJ+evLfsNFO
	 8YaoD5aNdk0Ou1dfjAgDqO1jTB2bhB5lfnyQ3BfMGJi7QOZdWBlM3LGR92POkR5Tad
	 NdD+6Zx8A1qygq006LFuHaAGctmk7mRawSdcpvpQr7vlrGNZAXQ1PM0my8PuqkYngz
	 nbR6l2HCmd17Q==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: richardcochran@gmail.com,
	r.mereu@arduino.cc,
	m.facchin@arduino.cc,
	geert+renesas@glider.be,
	arnd@arndb.de,
	dmitry.baryshkov@oss.qualcomm.com,
	ebiggers@kernel.org,
	michal.simek@amd.com,
	luca.weiss@fairphone.com,
	sven@kernel.org,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	kuninori.morimoto.gx@renesas.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/7] arm64: dts: qcom: Add support for Arduino VENTUNO Q
Date: Wed, 18 Mar 2026 22:31:19 -0500
Message-ID: <177389107887.16612.14059777501996296925.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260313103824.2634519-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-98596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,arduino.cc,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2293D2C58F2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 13 Mar 2026 10:38:15 +0000, Srinivas Kandagatla wrote:
> This patchset adds support for Arduino VENTUNO Q board, which is
> announced recently [1]
> 
> VENTUNO Q board is based on Qualcomm Dragonwing™ IQ8 Series processor
> along with a dedicated STM32H5 microcontroller.
> This patchset adds support for below peripherals
>     - USB Type‑C connector with dual‑role support
>     - ADV7535 DSI‑to‑HDMI bridge
>     - MAX98091 audio codec
>     - 2.5G Ethernet PHY (HSGMII)
>     - PCIe0 (to onboard WiFi chipset and USB bridge)
>     - PCIe1 (to M2/nvme)
> 
> [...]

Applied, thanks!

[7/7] arm64: defconfig: Enable configs for Arduino VENTUNO Q
      commit: 56f809222ea762f38f58e01d09aa58f0f3c4b788

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

