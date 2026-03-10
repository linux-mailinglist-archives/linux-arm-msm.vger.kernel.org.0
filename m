Return-Path: <linux-arm-msm+bounces-96448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6I+DCbeHr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:53:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DD52447B8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:53:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B0D5310E229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33A03BD65E;
	Tue, 10 Mar 2026 02:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VRwZLool"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D033B52E0;
	Tue, 10 Mar 2026 02:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110839; cv=none; b=ZDM95HL+8O582b33uEuHEL7RGVwDLWYyCoRSxOCOq6QXjrPDaLlQhnkfk3fkhhSO1yaNjMurJ50Hupvhec2iFzzTZve6Muka+WE/XrLRmlhiv6STHxUsPUaX2dSvW/IPgI6lsp2ng5wKC88zA0Mu59jwQHN443+VTM9B04U0l5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110839; c=relaxed/simple;
	bh=9X5RS2z3CZZwvP9U3i9J4sTMd+PJ6LgsYvI1+rq1tho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mwZjZmg3HGj4Zv4QiCZp9r46Fzgwbh72RWMrU/Tpx+mpOCVXT6MsmSFZIWuACla/xqzPcrN7yjzQ6JhnO68dTuumUTAWFmNB25Nvva+1UHkcNXqvRAcDSZpo31XbwyvWWbBcjeN0kXvDxUEKFuFw9HYG761BNtTbltQgDUswGyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VRwZLool; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6595DC2BCC6;
	Tue, 10 Mar 2026 02:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110839;
	bh=9X5RS2z3CZZwvP9U3i9J4sTMd+PJ6LgsYvI1+rq1tho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VRwZLoolSTffDKwmu7I83P514mkcuZZ9siF25pRADR312RZnfwt8iTCb1pG+R48X7
	 TG/q9bjR2pzwBgBQIlZmzugQzUVplyd1CLy/cw/pItlUsMG8IMry1aVKE6BZ9vexwf
	 FIH2W1/ZKIQM53Ed3AOr+bJWmY0b8FXUaDcj5Yl9ysRfFMPugzSHoBymssy0dyjNsJ
	 BOF/qTw5QQa9V1BYLUIkSmoFibstGhcdtiUuuxz4rinv/C+sW+pM9o90+i9BPHGxKu
	 TJhI0dBu3sSOpUQit93lYz1yxpoKCosKMHbafRQvsPSY54eLKe+BD4Dp3tz6FNTvlF
	 pxF/h/ANDJmSw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	srinivas.kandagatla@oss.qualcomm.com
Subject: Re: [PATCH 0/2] arm64: dts: qcom: monaco-evk: Enable onboard eMMC
Date: Mon,  9 Mar 2026 21:45:37 -0500
Message-ID: <177311073319.23763.15981916377140042573.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
References: <20260116214354.256878-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 87DD52447B8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96448-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,10.30.226.201:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Fri, 16 Jan 2026 22:43:52 +0100, Loic Poulain wrote:
> Complete the SDHC1 definition for the Qualcomm to support HS200,
> HS400 and 8-bit mode.
> 
> Enables the SDHC1 node on the Monaco EVK, wiring up the regulators
> and marking the device as non-removable eMMC, which is the default
> EVK configuration (alternate config is SDCARD).
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: monaco: Complete SDHC definition
      commit: 978400b7a68f19d09ef3767b69447f855bd5ea43
[2/2] arm64: dts: qcom: monaco-evk: Enable SDHC1 for eMMC
      commit: c2dd39323d497cad721097491aef59514d6cc9c1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

