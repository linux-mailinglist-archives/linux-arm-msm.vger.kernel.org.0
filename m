Return-Path: <linux-arm-msm+bounces-96434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dm9KVCGr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96434-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A952445DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C442930CEA8C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71EEB38BF91;
	Tue, 10 Mar 2026 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h64B7dvl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4E332B9A2;
	Tue, 10 Mar 2026 02:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110773; cv=none; b=K8kHsuV8j1hF+I6mi6eXsDi2RxkXTEkbgsI1TS1V7/dHBmUMmrHJOW/9BlyV6hgaelBvmLbE+4LAvfK5WWkhQ7gDLsz+C3p/GahypxS5DxQu1NBy1GLom/KoANNAxGskjNdaqzvhLmwqZ1wz4XxuYLlJZrzUoDDHqn7QZ6uOZyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110773; c=relaxed/simple;
	bh=8ZSQ9NsNIH3PdEI8a25pi0HPrK42YnV+4hx7xxrVNRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QSs1K0xb4EFmiryTdc6ZvCvucXQQ1mGgPjs9428RKqNIFn1hk6Rj8QjchG74vY9eK7yVYHZBE4vLoNbJkS1w7D42NHcT3iGGHuPzT74DzvRLHKtFiwPGgEhRSbghojGKsIxlRpHtsx+jZd7DTVpChT1QxPbjUQbmr7Z0UQFvxDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h64B7dvl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D088BC4CEF7;
	Tue, 10 Mar 2026 02:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110773;
	bh=8ZSQ9NsNIH3PdEI8a25pi0HPrK42YnV+4hx7xxrVNRA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h64B7dvlNhd68KVGrvrpkCVLPEi+OBR2CqHCuqb54Cxb1fW3XDLIF07fRroeBEH1i
	 GJSbwt+B9RJnWuawQ2M3mpxgZBqZWolxBFbXTgYTBw47rbNJG7fFOCHCdd4uAsbGAb
	 CYpkOnm7jkMFcr9ciaQcRMRApqtaWm/g1pTiG0qZW0tZOa5XleE8tnH5n5mxEh2BM8
	 ePIMl24N3Fdrb6RZt412R5df4FY1MN88SYCZHkjhutuZc/fDFK2Bnm3MH/C8q4Hl6z
	 /gsIxltGIFYrL5YEGf8lefNiyzfQSUacuBSYyv2GAehJqWGfIh4y3Oot6XO5Yuibv0
	 FAzq3Nsh1xmWg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gabriel Gonzales <semfault@disroot.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Biswapriyo Nath <nathbappai@gmail.com>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/7] Initial Redmi Note 8T support and more
Date: Mon,  9 Mar 2026 21:45:24 -0500
Message-ID: <177311073318.23763.5505178540690402680.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
References: <20260126-xiaomi-willow-v3-0-aad7b106c311@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 01A952445DF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96434-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,disroot.org,intel.com,igalia.com,gmail.com,mainlining.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Mon, 26 Jan 2026 17:34:50 +0100, Barnabás Czémán wrote:
> Redmi Note 8 and 8T are sibling devices the only difference
> is Redmi Note 8T have NFC.
> This patch series is commonizing Redmi Note 8 devicetree
> for a base for both devices.
> 
> The patch series also contains some fixes for Redmi Note 8:
> - Fix reserved memory ranges, they were wrongly defined.
> - Remove board-id, board-id is not neccessary for the bootloader.
> - Fix reserved-gpio-ranges the reserved ranges was wrongly
> defined what caused the device crash on the boot.
> - Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
> what is not supported by these devices.
> - Use memory-region property for framebuffer.
> 
> [...]

Applied, thanks!

[1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
      commit: 535e5741bc9acef5ea2561aa300f28370599e7e2
[2/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
      commit: 242801cc24e865cb525ef7d826ce6ebeffcad606
[3/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
      commit: f3d3a5924812eae3aedb431632c8a3b4c3f6bae1
[4/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      commit: 79664600fd3ed3972ad9321e13d1f80267730447
[5/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      commit: e8669e010991154bedadd1cd67700544e0362e99
[6/7] dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      commit: 32ace20ca1b65fcc2680b94cc8f00a80758eb76d
[7/7] arm64: dts: qcom: Add Redmi Note 8T
      commit: 7bb7c90e0ac18565a45c02072356bf3dffb81bcb

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

