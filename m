Return-Path: <linux-arm-msm+bounces-99528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cNMyKtP/wWk7YwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:06:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 058FB3017CE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:06:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9304F30A8AC0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65EBC37B00E;
	Tue, 24 Mar 2026 03:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKWcaQhl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5217DFE7;
	Tue, 24 Mar 2026 03:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321564; cv=none; b=YwvewY/d+XNGD0AtVc24dXMi/KqVaPOfTAUAQ3u5bqnXuYwqliAKZfgPvm9sMYlicY6xYSzbA92qxl3DqrGxi/f9USiB7N6l4JgZBG4AIEZDJSLh9nw4RmLkkO4YGBA1W6xSFft/tslpy5ndra7smv23dRpq4HhVaJ29oXjyzOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321564; c=relaxed/simple;
	bh=DgIV0G5yhDtQk/3+DLvE2MkQcMGoykOgK06cbfNXhOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gIzzxMREjxsJ+OAHbqLnnJwuGjoeQny39TG8GGOH6q+mbE8OsM3xbFVxZ+vFOsGw5W4Ha6eF05q64d5knNXxLEUuaC9+TJK8VDKblXC3tRu3UL12MDquGKjB9+1+4YKPtgdUADPvezvReP2CX/X5ftd+7PCOxCx8ORF/jXkWBgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKWcaQhl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D83C4CEF7;
	Tue, 24 Mar 2026 03:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774321563;
	bh=DgIV0G5yhDtQk/3+DLvE2MkQcMGoykOgK06cbfNXhOM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aKWcaQhltRFKXu26cLUVt2bKfzOhZVGp7isHLfZ/DvkPyep6ObH1PlD6pIk1Y9V9R
	 gQqq+TDZl09UL0zAF+cACkWvVDaIzye59TQuOysNqxA9TYM47IjucxCwAfTZBiLJEo
	 be0EYrYXQU2qnpo4DONLBmpcYu8G4nvbdKs++2dZL5EC9Gak1DvauTPwzNCzsbPjEr
	 BnLEEW0hZoHFJVMirH7cAtBsDix1+G9oZP5bb1L/qzhLk2KOCjmGVnnTH96haRQU2a
	 tQA9bYock0AtNPU1extk4pIA/3bfKXbjt3zWzXYdVQ0WTJhoYLsnluZ9ey3jvkvyDv
	 DY+jtF9WeRwMg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/6] Commonize Redmi 5A for 4A and GO
Date: Mon, 23 Mar 2026 22:05:49 -0500
Message-ID: <177432155641.28714.10439916130852365138.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
References: <20260315-riva-common-v3-0-897f130786ed@mainlining.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail];
	TAGGED_FROM(0.00)[bounces-99528-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 058FB3017CE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Sun, 15 Mar 2026 17:26:18 +0100, Barnabás Czémán wrote:
> Redmi 5A is similar device like Redmi GO and Redmi 4A.
> 
> This patch series commonize it to avoid code duplications.
> 
> Differences between 4A and 5A:
> - Different charger and fg
> - Different displays panel but same resolution
> - Different speaker codec configuration (awinic-mode)
> 
> [...]

Applied, thanks!

[1/6] arm64: dts: qcom: msm8917-xiaomi-riva: Fix board-id for all bootloader
      commit: 5be60b59614f642344f5f0da6af0724e89a7029f
[2/6] arm64: dts: qcom: Make a common base from Redmi 5A
      commit: d22b57071d610f1d0067539a29e64fc79020f7d3
[3/6] arm64: dts: qcom: msm8917-xiaomi-wingtech: Add goodix touch
      commit: 701441d899b1a8659fd0e0e572ba8249e6e00e2c
[4/6] dt-bindings: arm: qcom: Add Redmi 4A and Go
      commit: ec60610c82c4b1fa9114feb4d0d139eebe850307
[5/6] arm64: dts: qcom: Add Redmi 4A
      commit: 0762524b1d61a7b348ca074045ee7065f3a573af
[6/6] arm64: dts: qcom: Add Redmi Go
      commit: 4b718581d10e1b947e73e98fb0c7f7a0b6bc0e5f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

