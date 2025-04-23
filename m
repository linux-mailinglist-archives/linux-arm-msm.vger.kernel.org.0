Return-Path: <linux-arm-msm+bounces-55186-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E467A998D5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44E844A2697
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 794B92949E3;
	Wed, 23 Apr 2025 19:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrU11t9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47197293B47;
	Wed, 23 Apr 2025 19:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437362; cv=none; b=maknA35t5Bu21nnjYKtocgAGm2/HdNVkRH/aLBub74rLhGUjUkkqqf+Z6WQZzMWAmt+wwacOQ2PCMl4IWNCXUgbLbAQaoBgmFlzBsTTdadq4jF8oeuUtxEcWGd2IGKtt25RtPm0oQAsFVhRUVqdNp9DmsuJrNbol/KIkdkfUp9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437362; c=relaxed/simple;
	bh=TnT5WVpQCYGJKh3P2I4Fm1o0/+22/GE4VkIuIPQ7b/4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hqnNlY11jZrMguaYGj3BN2qrjEIAKF9+HG7voDSr6w4SA0Bj1ewESk6uaQnE7I5QkXyxr1mRG42MNs9D1hoqM9Zl/Qx78oVS+obXyxCTTl0qgeVqSpPbAc2tFY59ISGSUh5ufHPzZ1ilQ/v6gnIZuLHZquuk0qaz6pdRY/VKoOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrU11t9m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C7BC4CEE2;
	Wed, 23 Apr 2025 19:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745437361;
	bh=TnT5WVpQCYGJKh3P2I4Fm1o0/+22/GE4VkIuIPQ7b/4=;
	h=From:Subject:Date:To:Cc:From;
	b=mrU11t9mU7Qy/iG/bmQPjQWMfW+P79ei4JW5vf9T6v2w9PFz26kb4XMK+F1i8AjjS
	 OekTGSki2lbGXRsIvoWBCAadZprzmI8TkRvJP7iEDr6xj2K1vBmbi5iKx6JBo4Ximo
	 SWhzfvXnCkFBftDegHOUviYnUM31Ea9xJUibEzIf5NwFkZQSB4fBBQq7Qn9QLFIHsp
	 TyILjCOmie9q2AH/VImwHdouqGW3nJNL5PN/GLLSIZFbBirJsJqLvvWbmvJXpSgb44
	 vWBemGESoirKHJnA1GeZ1r/7IExHwiBFFN0aUQrjG7l9DbO2cFXsqehsFa3jfjUxqJ
	 Jx6dxjUaY00Rw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Subject: [PATCH v2 0/4] of: Common "memory-region" parsing
Date: Wed, 23 Apr 2025 14:42:12 -0500
Message-Id: <20250423-dt-memory-region-v2-v2-0-2fbd6ebd3c88@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJRCCWgC/x2MQQ5AMBAAvyJ7tglLHXxFHKoWe2jJVoQ0/q5xn
 GRmEkRW4Qh9kUD5kih7yEBlAW6zYWWUOTNQRaZqqcH5RM9+1weV1yzjRWhpqo2z1rmugVweyov
 c/3UY3/cDrwxX8WUAAAA=
X-Change-ID: 20250423-dt-memory-region-v2-a2b15caacc63
To: Saravana Kannan <saravanak@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Daniel Baluta <daniel.baluta@nxp.com>
X-Mailer: b4 0.15-dev

While there's a common function to parse "memory-region" properties for
DMA pool regions, there's not anything for driver private regions. As a
result, drivers have resorted to parsing "memory-region" properties
themselves repeating the same pattern over and over. To fix this, this
series adds 2 functions to handle those cases:
of_reserved_mem_region_to_resource() and of_reserved_mem_region_count().

I've converted the whole tree, but just including remoteproc here as
it has the most cases. I intend to apply the first 3 patches for 6.16
so the driver conversions can be applied for 6.17.

A git tree with all the drivers converted is here[1].

v2:
- Fix of_dma_set_restricted_buffer() to maintain behavior on warning msg
- Export devm_ioremap_resource_wc()
- Rework handling of resource name to drop unit-address from name as it 
  was before.
- Link to v1: 
  https://lore.kernel.org/all/20250317232426.952188-1-robh@kernel.org

[1] git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt/memory-region

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
Rob Herring (Arm) (4):
      of: reserved_mem: Add functions to parse "memory-region"
      of: Simplify of_dma_set_restricted_buffer() to use of_for_each_phandle()
      devres: Export devm_ioremap_resource_wc()
      remoteproc: Use of_reserved_mem_region_* functions for "memory-region"

 drivers/of/device.c                       | 31 +++++-------
 drivers/of/of_reserved_mem.c              | 80 +++++++++++++++++++++++++++++++
 drivers/remoteproc/imx_dsp_rproc.c        | 45 +++++++----------
 drivers/remoteproc/imx_rproc.c            | 68 +++++++++++---------------
 drivers/remoteproc/qcom_q6v5_adsp.c       | 24 ++++------
 drivers/remoteproc/qcom_q6v5_mss.c        | 60 ++++++++---------------
 drivers/remoteproc/qcom_q6v5_pas.c        | 69 ++++++++++----------------
 drivers/remoteproc/qcom_q6v5_wcss.c       | 25 ++++------
 drivers/remoteproc/qcom_wcnss.c           | 23 ++++-----
 drivers/remoteproc/rcar_rproc.c           | 36 ++++++--------
 drivers/remoteproc/st_remoteproc.c        | 41 ++++++++--------
 drivers/remoteproc/stm32_rproc.c          | 44 ++++++++---------
 drivers/remoteproc/ti_k3_dsp_remoteproc.c | 28 +++++------
 drivers/remoteproc/ti_k3_m4_remoteproc.c  | 28 +++++------
 drivers/remoteproc/ti_k3_r5_remoteproc.c  | 28 +++++------
 drivers/remoteproc/xlnx_r5_remoteproc.c   | 51 ++++++++------------
 include/linux/of_reserved_mem.h           | 26 ++++++++++
 lib/devres.c                              |  1 +
 18 files changed, 339 insertions(+), 369 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250423-dt-memory-region-v2-a2b15caacc63

Best regards,
-- 
Rob Herring (Arm) <robh@kernel.org>


