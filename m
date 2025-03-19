Return-Path: <linux-arm-msm+bounces-51961-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD267A68F02
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 15:27:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 412791666F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 14:24:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11171AA1C9;
	Wed, 19 Mar 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXGLAktP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3A0185935
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394290; cv=none; b=WoWxHxTjja38aHUTs6H6FGxC056FDS7u25XuZ0VjABgGAahHTTPLsw0Ch0xmIYFwoRoaKG7PVq9PWDIm0jf0A3284kh3YHiN48GkCab+KuCGhYTYgULdhmQNc0YaqKVmZGmEuzfHqMfBg5+NgFQW6JZNNP4bLgCdXNKEhdsU5fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394290; c=relaxed/simple;
	bh=V/SLhvo9gcRcf9Q62gLBwK9RH73pmO1Sb6lYQDSl+Wk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sJacUaxDSzv7lVx003NPvX71IPmYS0xaBHQXpvVuc8I11F2gHnF723pCfNu4h0N4qjaPWZJMsdViSxDLRSoSscGjcWB0viWK80dMfnYt5IK5IFHPochqhDwPuM7ixex9aQaeiCMvNdCKabErdzRhgLQWYZxhBV8U3m+XoK8KH/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXGLAktP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A545C4CEE9;
	Wed, 19 Mar 2025 14:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742394290;
	bh=V/SLhvo9gcRcf9Q62gLBwK9RH73pmO1Sb6lYQDSl+Wk=;
	h=From:To:Cc:Subject:Date:From;
	b=iXGLAktPqySm/IOVownGzFPBorVEpFDIFoz1zL57oLU4u2TXJasxt9ZojKLE28i7v
	 wAu6Oyq0+zqM4HcZQ+yrSwM2CHwNTcp+i0s6Dbh2ktUODtabONDNspV6szP07pNu1q
	 N5GL0bhfgqP07AXCIUGL5EDQL/N5jRGivHTNZqXIvVoQDCkHjM0RRkHmcD3riB2Gle
	 XGer4OTQD9MvijoWPJYxfKrh2JQKB9Kwn3sZ0lBT/KupP+X8v0RTk+eB7BKIG4SuTR
	 zGO4l7SrNxCVPDZ7SldoQZEQjFcMkRJzY2BqJAVFnJzwpypA2jhlhawXnF635mjoDi
	 ON0MsVARpJIxA==
From: Bjorn Andersson <andersson@kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Arnd Bergmann <arnd@arndb.de>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Rayyan Ansari <rayyan.ansari@linaro.org>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>
Subject: [GIT PULL] More Qualcomm driver updates for v6.15
Date: Wed, 19 Mar 2025 09:24:47 -0500
Message-ID: <20250319142448.2279164-1-andersson@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


The following changes since commit 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186:

  soc: qcom: Do not expose internal servreg_location_entry_ei array (2025-02-14 11:37:30 -0600)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.15-2

for you to fetch changes up to 65f330ade7daec740ed8dbdf33ccfbfcc5fbf5c8:

  dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible (2025-03-13 17:50:04 -0500)

----------------------------------------------------------------
More Qualcomm driver updates for v6.15

Introduce Devicetree binding for providing board-specific firmware-name
for the GENI serial engine block. Add SDM630/636 support in pd-mapper.
Clean up and fix error handling in the SSC block bus driver.
Add missing msm8916-acc compatible to resolve a number of Devicetree
validation errors.

----------------------------------------------------------------
Alexey Minnekhanov (1):
      soc: qcom: pd-mapper: Add support for SDM630/636

Christophe JAILLET (2):
      bus: qcom-ssc-block-bus: Remove some duplicated iounmap() calls
      bus: qcom-ssc-block-bus: Fix the error handling path of qcom_ssc_block_bus_probe()

Rayyan Ansari (1):
      dt-bindings: power: qcom,kpss-acc-v2: add qcom,msm8916-acc compatible

Viken Dadhaniya (1):
      dt-bindings: qcom: geni-se: Add 'firmware-name' property for firmware loading

 .../bindings/power/qcom,kpss-acc-v2.yaml           |  4 ++-
 .../devicetree/bindings/soc/qcom/qcom,geni-se.yaml |  5 ++++
 drivers/bus/qcom-ssc-block-bus.c                   | 34 ++++++++++++----------
 drivers/soc/qcom/qcom_pd_mapper.c                  | 12 ++++++++
 4 files changed, 39 insertions(+), 16 deletions(-)

