Return-Path: <linux-arm-msm+bounces-96444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F5cGU6Hr2lvaAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:51:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D0F244744
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 03:51:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A36731987D0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92A83AEF3F;
	Tue, 10 Mar 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGgYfb1s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD93ACA46;
	Tue, 10 Mar 2026 02:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773110826; cv=none; b=ejNKjhRQe5Ur41whUOnI31vf+oqih7qRSMAQ+CK5V+L74CarZfeHeLH3v69AgdyLeuOxsTJ+ECqjDuyoEDLlIx2HxLyHDVvQwcOquY2evmRgR+PmWy4ReTJ5uD5OTScLPkD3ZDK3VdFywGYkAjsDg/USFB/C2WdbnnrO1KCowLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773110826; c=relaxed/simple;
	bh=J8OfkLsgaYl2nDFdSWDHc4F5pMSkjoziO/shcv4pNtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LXobcCN3UmjU5Gv92hDjLiV8jBlly3MxrMCxAVbijq8EwUf9M8PPE03JsW26I1u+niZOiyYgXvSBHXzoh5c9mLD9I2coxKreyBBSBn2xj0bgUZ77doPZIcWLmAg05UdCNmBi6OF1250zd7yj2w0SGdLMrRiDBrkBs2Nk2QLFV5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGgYfb1s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C416C2BCB2;
	Tue, 10 Mar 2026 02:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773110826;
	bh=J8OfkLsgaYl2nDFdSWDHc4F5pMSkjoziO/shcv4pNtE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gGgYfb1ssZ0i3az23k1FJhv+U4EtQskrNU3qoPraNjGM4azwch30qRFdb0QcMSYkC
	 gc6181hAFCqvjJhNxuuEiQEjOhig07nOhBtZipxpJoMJNOCp7HABwWDO2oUVxq1Ptv
	 VYIa0nAGCdRdYyJt0TB7W5E1mmGjXGzYurdiHRl2Sl44bVYfhoAxhBdXTs6PbnBkqj
	 Ja3lJtXn2vWZ6gcAU94HMhEdxfVUoNtFqk1TdrFu8QGOlog8Oqnq2xOHJe96GNkSEB
	 yI6IlAfSlBsEWakVwsgGdVUUYHwkt5Eg0XZg0ClMPg6KV9pPnB9lf7qUN1QnnPZl8e
	 UHcvstNjZM4AQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Prasad Malisetty <pmaliset@codeaurora.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting
Date: Mon,  9 Mar 2026 21:45:33 -0500
Message-ID: <177311073311.23763.1904685464940808806.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
References: <20260123-fix_pcie1_phy_clk-v1-1-38f82ea01792@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E1D0F244744
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96444-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 17:42:27 +0530, Krishna Chaitanya Chundru wrote:
> GCC_PCIE_CLKREF_EN controls a repeater that provides the reference clock
> only to the PCIe0 PHY. PCIe1 PHY receives its refclk directly from the CXO
> source.
> 
> If the PCIe1 driver in HLOS votes for or against GCC_PCIE_CLKREF_EN, it
> will inadvertently modify the refclk to PCIe0 as well. Since PCIe0 is
> managed by WPSS while PCIe1 is managed in HLOS, there is no mechanism to
> coordinate these votes. As a result, HLOS may disable this repeater
> during suspend and cut off the PCIe0 PHY refclk while PCIe0 is still
> active.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: kodiak: Fix PCIe1 PHY ref clock voting
      commit: 30e8b6d42e8988eaaf0c2efd8c3797cb3884faea

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

