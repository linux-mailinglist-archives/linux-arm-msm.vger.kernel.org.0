Return-Path: <linux-arm-msm+bounces-106007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wG3kH8A0+mlLKwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 20:19:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BC4D2911
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 20:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CC1F304E0D7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 18:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F97B4A3408;
	Tue,  5 May 2026 18:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="eveGNBOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A861539B952;
	Tue,  5 May 2026 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005167; cv=none; b=VVE1zf+ErPvFfq1ZeHWjcQXVtbrhmxis9sCzO96EsG21FSf5BLd5xrqkn01gUhqaiNpbFoAUSiPyJrv13owQL/PP6hpS4D4KMLrsD5Svxn2vzU/77qY7wnNj5kF6oLy0PF6TsjHLAyXDqv3rVh4uCvUulbXNh2BozP/0nEzDZQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005167; c=relaxed/simple;
	bh=pBxc7D93t0f0QZtmD0TKOUx/5ScHJ9VgFzmhUFh8+P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Az9oP1CGSF8B5qWp1x7y/91wAggP/FI1j5a/0HgNZncJsWPJXtTgoAOwCirn+CFA4Gjqjk1onBdpHR9CvQPPRvje/Q60/+L1k70nCr/0B+8+THeUzcgUbrPCniKHe+i4LRaYqDd690hRrov+M5yP4a8SUHpXiEbK75LO2P3bx+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=eveGNBOR; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CZieGdswKQbAOybvHi0PMqwJLD1M3MBzPazARBFonZA=; b=eveGNBORgDJ20PJlLoNRQhaMgV
	cts1zTnfdjoMi0WghO+3TnFOgTrS0fd173ms8UnoRGUIhXCNlsz/uIDZ89vOiYo7dEQM633M23WHo
	DxyysTzdgLniY+9H/XYKgpFj/oRx2KB1p+4fIUhoR3ncoFa5zhNscugF7TsQNlEuX9a83b22cQcdm
	fxuzxHLN9ks+Os1DVlGI/r0WnBZczEBlt+yJoCCh+WXpyI8UKIDh2MqcrOkvjRy7WX2tIxNnajgRg
	eoCBwkS7QYJ7ZZ719f8TKMjYuclU9iXoPPKUY258ND2tPTJbIKVGWeMg+Yo0ZY9lVAFtMe0FwAZ+4
	OWL0bNTg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Brian Norris <briannorris@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	Doug Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	Julius Werner <jwerner@chromium.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	cros-qcom-dts-watchers@chromium.org,
	linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/7] dts: Add /firmware/#{address,size}-cells to Chromium-based DTs
Date: Tue,  5 May 2026 20:19:08 +0200
Message-ID: <177800448363.3286457.17373798042642521210.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260428200712.2660635-1-briannorris@chromium.org>
References: <20260428200712.2660635-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 101BC4D2911
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106007-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,gmail.com,collabora.com,chromium.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[sntech.de:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[]


On Tue, 28 Apr 2026 13:06:52 -0700, Brian Norris wrote:
> Chromium/Depthcharge bootloaders may dynamically add a few device nodes
> to a system's DTB under a /firmware node. A typical DT looks something
> like the following:
> 
>   ## From a RK3399 Gru/Kevin Chromebook:
>   # find /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware
>   /sys/firmware/devicetree/base/firmware/coreboot
>   /sys/firmware/devicetree/base/firmware/coreboot/ram-code
>   /sys/firmware/devicetree/base/firmware/coreboot/compatible
>   /sys/firmware/devicetree/base/firmware/coreboot/board-id
>   /sys/firmware/devicetree/base/firmware/coreboot/reg
>   /sys/firmware/devicetree/base/firmware/coreboot/name
>   /sys/firmware/devicetree/base/firmware/chromeos
>   /sys/firmware/devicetree/base/firmware/chromeos/readonly-firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/active-ec-firmware
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-version
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-storage
>   /sys/firmware/devicetree/base/firmware/chromeos/vboot-shared-data
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-size
>   /sys/firmware/devicetree/base/firmware/chromeos/nonvolatile-context-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/hardware-id
>   /sys/firmware/devicetree/base/firmware/chromeos/compatible
>   /sys/firmware/devicetree/base/firmware/chromeos/firmware-type
>   /sys/firmware/devicetree/base/firmware/chromeos/fmap-offset
>   /sys/firmware/devicetree/base/firmware/chromeos/name
>   /sys/firmware/devicetree/base/firmware/ranges
>   /sys/firmware/devicetree/base/firmware/name
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
      commit: 0b74f1a037672980c477bbe6b3848fb5341eb4f1
[2/7] ARM: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware
      commit: 98461edf564a35ee00a97a64f5463eaece586546

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

