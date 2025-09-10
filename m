Return-Path: <linux-arm-msm+bounces-72994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 034BCB51845
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 15:49:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3A3214E0F7E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 13:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6AA781FCCF8;
	Wed, 10 Sep 2025 13:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aofVUraC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB766A33B;
	Wed, 10 Sep 2025 13:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512142; cv=none; b=H75CUMmbAna+rTXQ7532n8XlbpIeehHtXxXpV0+YjvfwkUNaLy5qNJ4/Y1vKjYL6HPw2gDL2Syk4yjUit58pqzWPZTKY4rrNz3OBV5N+uCf7mrsN0vrhc2XX5GAVunkh7a/3+h+k2e7QG7+YSQkD9dW27C+Hc73avEfuErq7Px0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512142; c=relaxed/simple;
	bh=dRkUVzw5fqpT1+2ta1Fm0HxKSj5iKb+YDMNsaSkqcQQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I5hkFpEpfcDxcs0vVBPuWNnEwr5xbfLi6D6M0PClawBo4YmSc7O5p0Ny8OeSVjvJHWwy4PphxrD/oYst2iozY5IFJIFP7DPOiaC3JFW7wDKbWg3JbO13aX9zyMLGaqK4d6yfqffwlT5v8UWDLjQ0ObvShNWC/lPlhkr+wo5gDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aofVUraC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC997C4CEEB;
	Wed, 10 Sep 2025 13:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757512140;
	bh=dRkUVzw5fqpT1+2ta1Fm0HxKSj5iKb+YDMNsaSkqcQQ=;
	h=From:To:Cc:Subject:Date:From;
	b=aofVUraCcNziVdjVwGAVWOnVt+6BEsjJQWKk3WSHJWbmI1wTJl/t7mmweu7LO28Ku
	 Ui0l25NQsWdfTHI6K9hiUcczmIHk014O9Dr0SzzPr672vib971hYoQDFZdNFFlc9lV
	 Ggn1WaKnZ34x1++oiXbbG1H/TLYdcDkiH3MvZ1jkmdeGfLI9QxeWlBSGkdK8j6lVv4
	 i3NFNQDjW4voBPaPOQLEPXl3OST5Ass/9YQ4kq9U2y4RQzJMrNVlagp2UOBU2MrsAH
	 o6QXewnJoHyfMvC6AJGHsl9faKBbAVPU1IWgmo4xRh7MOmvbwuXQH9a7oTmE4oVdG5
	 ONADNl6x/NU+w==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1uwLBy-00000000543-3dzr;
	Wed, 10 Sep 2025 15:48:58 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] clk: qcom: gcc-sc8280xp: drop obsolete PCIe GDSC comment
Date: Wed, 10 Sep 2025 15:47:37 +0200
Message-ID: <20250910134737.19381-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop an obsolete comment about keeping the PCIe GDSCs always-on,
something which is no longer the case since commit db382dd55bcb ("clk:
qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter retention state").

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index f27d0003f427..b683795475e3 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -6775,10 +6775,6 @@ static struct gdsc pcie_1_tunnel_gdsc = {
 	.flags = VOTABLE | RETAIN_FF_ENABLE,
 };
 
-/*
- * The Qualcomm PCIe driver does not yet implement suspend so to keep the
- * PCIe power domains always-on for now.
- */
 static struct gdsc pcie_2a_gdsc = {
 	.gdscr = 0x9d004,
 	.collapse_ctrl = 0x52128,
-- 
2.49.1


