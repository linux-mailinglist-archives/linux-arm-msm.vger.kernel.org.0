Return-Path: <linux-arm-msm+bounces-51658-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31540A6629B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 00:24:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F36E03B9A1A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 23:24:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31ECB204F8E;
	Mon, 17 Mar 2025 23:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvtpHlFd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACB5204692;
	Mon, 17 Mar 2025 23:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742253875; cv=none; b=JDSuFd8as+7ZXjZgj/VltFqOXOaIk5EupiCTbM7Ev1/DDbKQQ617pPNKcZrvagLcsO4U/vcCzdeuXNHI9FX0cHkkJfT2iFFrIwKnsrpqPStQZMIzkmKcNxw9YbQn5aGmg8KBF8MbNUGVhWaSgulRHlITS+HdJTLZ/p1JFikWPr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742253875; c=relaxed/simple;
	bh=dAk2U2sfsY/rQm35ORj2bH3tfDkpp80tHYe3UuarDzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VBldYIjizNvfS95EWlF1vwuN9dPzDpKV0SbP0tQhnKHRNJPmsvDRAOrd+JKr3TST7fhprqPVCFoWQYxlo8q9NLsCH/MEKL15CS7i1H5xMSECvOubU2J14BjPdf5weaqYDyd5GnPs2Ra0sxT4NNjL/jhRJMQzRD3KPDK8NjqGti8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvtpHlFd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10BCFC4CEE3;
	Mon, 17 Mar 2025 23:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742253873;
	bh=dAk2U2sfsY/rQm35ORj2bH3tfDkpp80tHYe3UuarDzo=;
	h=From:To:Cc:Subject:Date:From;
	b=UvtpHlFd7BCNHE3YfWJqiblOSdto+WgtykkwcB5yaLUQxWHRh3Xiw80Cp8w8d5Msx
	 FFr+jZOyukEILitdGNJqFgr7Akf2sbzRCSwutbSKwqCLE/TLxP1YwCcQX61mU12yU+
	 anl/tDQo8B04nwZh63C/43oUZcUYhs+mkpMJX6cLUuVTWH5WLDo8uIsQwCgJRYRpcA
	 3RXjBC8EpAGH905+D3kNsYSYNF118fZztstodISmyBdKzpjZwhnsqaf18xcQK+boBO
	 y/Gl/3moxquEw1v5KfhZtV5f9l7lpTtnGEVgLD/J4fBgbBmybNVD0xDVit+ffDVhpO
	 z97gDIL4yPVqQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Saravana Kannan <saravanak@google.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 0/3] of: Common "memory-region" parsing
Date: Mon, 17 Mar 2025 18:24:20 -0500
Message-ID: <20250317232426.952188-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While there's a common function to parse "memory-region" properties for
DMA pool regions, there's not anything for driver private regions. As a
result, drivers have resorted to parsing "memory-region" properties
themselves repeating the same pattern over and over. To fix this, this
series adds 2 functions to handle those cases:
of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().

I've converted the whole tree, but just including remoteproc here as
it has the most cases. I intend to apply the first 2 patches for 6.15
so the driver conversions can be applied for 6.16.

A git tree with all the drivers converted is here[1].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Rob Herring (Arm) (3):
  of: reserved_mem: Add functions to parse "memory-region"
  of: Simplify of_dma_set_restricted_buffer() to use
    of_for_each_phandle()
  remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 34 ++++------
 drivers/of/of_reserved_mem.c              | 77 +++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 44 +++++--------
 drivers/remoteproc/imx_rproc.c            | 65 ++++++++-----------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 +++----
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 +++-----
 drivers/remoteproc/qcom_wcnss.c           | 23 +++----
 drivers/remoteproc/rcar_rproc.c           | 36 +++++------
 drivers/remoteproc/st_remoteproc.c        | 39 +++++-------
 drivers/remoteproc/stm32_rproc.c          | 42 ++++++-------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 ++++-----
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 ++++-----
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 49 +++++----------
 include/linux/of_reserved_mem.h           | 26 ++++++++
 17 files changed, 329 insertions(+), 368 deletions(-)

--
2.47.2


