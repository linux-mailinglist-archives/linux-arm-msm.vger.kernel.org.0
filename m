Return-Path: <linux-arm-msm+bounces-101164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YE1FJkQ0zGlRRQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B0237146E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 22:53:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DA8313056149
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 20:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FA203DBD4D;
	Tue, 31 Mar 2026 20:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="umpA/U03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8673DB62D
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774990402; cv=none; b=oBMhJRDq9MDsNADQqrj7eR9ouVswS2pjw44jmv1Qa7DN4yNyK5o8YEQOTd2ZRZLk9Xgg7BrpwgoduUnCFPPFXDzqqp+t5KqAyyq05kcfvmefWp4qa+bcG+Jp4H/zaVKwCcE00u7bUOnD45o5Mkjo0BAzchryjcN/NE6Y5+yxo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774990402; c=relaxed/simple;
	bh=x9UvOv0YJRzcsdGEQnhZlvNVNt/6OghCH7bhRc/MRdo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPhUZJO4F1V6TPp0Sci6MbhrRzlwNEBa65BMosjWtVmTuhhbV7t/T07Gf1eHzkkSvw4ID3rPxQB29vfa/tlTL7k/uXqVG90TBAh7ChBN9t+qeCRUA9KH4AQmwUyWVKPgWVpqaOp/RBYvo9tSE8L5sEKuBym3T+k5BuMj7JOrhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=umpA/U03; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2832DC19423;
	Tue, 31 Mar 2026 20:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774990401;
	bh=x9UvOv0YJRzcsdGEQnhZlvNVNt/6OghCH7bhRc/MRdo=;
	h=From:To:Cc:Subject:Date:From;
	b=umpA/U03EBFsKfKcuLIJWoFPDip/PxEOF+yeMwP8RFFCIcBqOS0ulC7ih/hkK5iT6
	 FA4crWMc8ea/hg6ScRj9jVTrIHrSgj82axc7ykYDx2yBT9vjaJOevt67aUa/MCsIHL
	 CEi8mq3i3mjRJ9fbwnqJek9y5sGCngH9d42CYPYvCvkoMXbSW+96tXk3SvFm+kDRov
	 mDtu1O+ICQCgUeSrYYSV2v/73Ic7L10m2Rr04tEWkn62zhD0bi0gxPQ3HKfHKDYNil
	 98ysIUydh5CrOyUILlnElQQ+LHO22tTqr2r6CADqT1wcGW2Dh0qW1o40GigBV/O/kW
	 kunHuTx8BZijw==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [GIT PULL] More Qualcomm Arm64 DeviceTree fixes for v7.0
Date: Tue, 31 Mar 2026 15:53:18 -0500
Message-ID: <20260331205318.952913-1-andersson@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101164-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 16B0237146E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


The following changes since commit 2c409e03fc04b5cded81b7add9ce509706c922e3:

  arm64: dts: qcom: agatti: Fix IOMMU DT properties (2026-03-23 22:31:40 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-7.0-2

for you to fetch changes up to 11b72b1ca9891c77bc876ef9fc39d6825847ffee:

  arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration (2026-03-30 08:08:48 -0500)

----------------------------------------------------------------
More Qualcomm Arm64 DeviceTree fixes for v7.0

The shuffling of reset and wake GPIO properties across various Hamoa
devices left things in an incomplete state, fix this.

Add the missing "ranges" property to the QCM2290 MDSS DeviceTree binding
example, to fix the validation warning that was introduced by the
previous fix.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      dt-bindings: display/msm: qcm2290-mdss: Fix missing ranges in example

Ziyue Zhang (1):
      arm64: dts: qcom: hamoa: Fix incomplete Root Port property migration

 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |  1 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  | 16 +++++++++------
 arch/arm64/boot/dts/qcom/x1-crd.dtsi               | 24 ++++++++++++++--------
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi        | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-hp-omnibook-x14.dtsi   | 14 +++++++------
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi  |  8 +++++---
 .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  |  6 +++---
 .../dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts    | 15 +++++++-------
 .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 14 +++++++------
 9 files changed, 66 insertions(+), 46 deletions(-)

