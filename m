Return-Path: <linux-arm-msm+bounces-107184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eAT7FLqMA2pN7AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:25:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE695529199
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:25:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6ACD8306DB4E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800EB3CC7D3;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRwVX4G2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2093C873B;
	Tue, 12 May 2026 20:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778617421; cv=none; b=WUWuNk84Wr4h5fx+JUa+NBWeqtDWpTFfQwgNSaxHrrXDHjSt/UkOtQBhyfpKVkmRj6aXYsNO9z7gVvh5m8WQxBlhmczbT10WU4fFkTFCC3sgPoYZw4sVNNYkSlFVTZCjip2G24KB/qJd+diM+5x2AWZ7SZ48CEy5BqpYkY6SvJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778617421; c=relaxed/simple;
	bh=Vbh0eYZFWLeK0vHj4kbN0iZiKE8hitq4ZZ5JmddKWcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D+oceT2UFVsp3z+dz2bxu7fTsbOJpg6tnD2MbUnjk+4Bt/FqbG2LbRm4NSXFO9BMOYSL5vUt3vkw1rv/Cz6/u7+IwH+cUasB3iwTKCNV8Q68o9c8BgOf/+xzrIpiVHDvL2kigUDnKbLsVsACfSTMnxmOv8qGeoS5gaXV3kEZ9KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRwVX4G2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38EBC2BCF5;
	Tue, 12 May 2026 20:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778617421;
	bh=Vbh0eYZFWLeK0vHj4kbN0iZiKE8hitq4ZZ5JmddKWcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XRwVX4G2MqwSvgwYnJiXYn3tVYG/EQ/L+UsmSxX+kSGWsh4coHN4yOPl9oHaieQpd
	 kmYVoX6xFLaK6bdAHb2InuWul5uUNS9jIAuo/z2IjfyAvvq9wrh1+N+HWzprv3Dt72
	 9XxcnRrNtuE3HpaHqfR5uJV8BamZ1hL51umINV3jvfNtYzu594wgtfQx5r6YbGAspV
	 VWHffyRst9GCCAzrsXrPiFdM9u3jV21m5gZM3rD+c+pbQ8uHdNLVWpJLNTK16/aipo
	 wjUvVv7KWLZvDVpXA4XQ3Jl0jYWXyCduHW7jZ8thD2MGSTmDFYe8gxP14tkpA/m0ZP
	 m0lyGjleT+Wag==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v3 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Tue, 12 May 2026 15:22:51 -0500
Message-ID: <177861739385.1242344.3916465805957618648.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: EE695529199
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107184-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


On Thu, 07 May 2026 22:38:26 +0530, Kathiravan Thirumoorthy wrote:
> Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
> access points. This change adds minimal support required to boot the
> IPQ9650 RDP488 board.
> 
> Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
> configuration with four Cortex-A55 cores and one Cortex-A78 core, a
> 2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
> an integrated CDSP for task offloading, enhanced PPE capabilities,
> and DDR5 memory support.
> 
> [...]

Applied, thanks!

[3/4] dt-bindings: qcom: add IPQ9650 boards
      commit: 5bfa2c53c675610110c797e1f17c87ce25424407
[4/4] arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support
      commit: 8cef25a0044d3e7caef56a43bf316336fe39b5d8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

