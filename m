Return-Path: <linux-arm-msm+bounces-108308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mF4nN2vWC2omPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:18:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B08A3576C4A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:18:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F602304BE75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 03:16:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9DD42C11CB;
	Tue, 19 May 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tzH1s4CR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662564AA4;
	Tue, 19 May 2026 03:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779160613; cv=none; b=GDRUAJNXfLLrgwiHFDRck8Zv+1CE+V0rIVqsbSWmH9WtOtI6YaXKuX2zk/qfYz1m5GwnZhCmvBtQIqBRnRU0GC13a9ik4uawGWaLfdcO2AcolrQgLfrmInV/7+d6pVpNEbHdQz7uwbJk0/JADdSa3CbbQcsqLmue9pPNYGau0Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779160613; c=relaxed/simple;
	bh=kjzpGyx0PBTX/SWdjfZxD3Pyq1f4C0eJRCtxXdqRTBg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SyV43kjFi8cCNacHohHnBk+u1LDZsXO7CfA01gtWkMMb/wTvD1vbbc5LrvDVqvsiMNADCkLJIZlD7zcdl1Lo6zHg4YtqIEfwX8xLUb6/nz+aBJkYq7YJNb2FIEgWQSF6A9OT57pKLypoxYjNLTwu9Wvg3CbprzPu6rAM84a8kRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tzH1s4CR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE26C2BCB7;
	Tue, 19 May 2026 03:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779160613;
	bh=kjzpGyx0PBTX/SWdjfZxD3Pyq1f4C0eJRCtxXdqRTBg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tzH1s4CRBT6FA5gr+4lSIjxQzUAPwQnMLTRXC+GhF6tQhFBeS/5pHpdSbSdSOVrfz
	 ZZPF1M0+sOhzSkZLec/cgWBN0yelaZAyndYmeGaU+cqStYVTw5W0K+27irq2o2reEH
	 tZo4tPBtL+wKwUR+ZbNN8q2CsCMeBovj7vPneoe508Vo90bIXGlmrj626yR9w12wMZ
	 pDOxCa978fztTCJeyxlRlfFArqEB3gik8mDJjwPU6LAk7/Q/6/m2oyM1ZzUNs/RMd1
	 S2qyaVcCw9DrkH98zXV6ykEwSRcf5X+dNeVkt7TGa1nPOn0vKmEe7AFoKySnxzl5Fu
	 01A3V5VSsVS2w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly
Date: Mon, 18 May 2026 22:16:44 -0500
Message-ID: <177916060474.2063946.2714698992906634506.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
References: <20260415-axolotl-wifi-v1-1-07df39cfc0a4@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108308-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B08A3576C4A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 15 Apr 2026 13:56:08 +0200, David Heidelberg wrote:
> The onboard WiFi / BT device, WCN3990, has a simple on-chip PMU, which
> further spreads generated voltage. Describe the PMU in the device tree.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845-shift-axolotl: describe WiFi/BT properly
      commit: 487c97b671e4f224adb9d74b9f14372e283bea32

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

