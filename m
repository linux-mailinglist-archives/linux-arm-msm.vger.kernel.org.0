Return-Path: <linux-arm-msm+bounces-56871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB7DAAB3A5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 843191C061D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 745BA33A35B;
	Tue,  6 May 2025 00:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsGDBRcX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CBE239E9E;
	Mon,  5 May 2025 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746486370; cv=none; b=nAqn2iz/F5Fsl0p8d86v31PE/b0IoV81N6u6Co/IXHH5kWOOBI6+8Bqk0XzsCRnBR6qqx6OY2lUrOLeiuku00TogZeUEA5kMOH2fPEgSWl5ksVTxKDoMOGjd5obOK8bFL70tcM8O4zDPEsFPAXekqtRqJEYzRqudzR/kCT8z48Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746486370; c=relaxed/simple;
	bh=ZzlkLV6bGsWUlKi8pMT/sDQcez3HbCFLJUcDhrtzXvU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jUr+Xrfcxdyh30mv86kfAxFrvj5lufBQE1xeOzS2LgLOnKVZ5jCH2dN6HPGgkArHa2Vkw+1CbcCt7PcsN2oaCNXWleV1wBfTi+5s2WUqHzk8qoREUkKWLjMgNFcw6ipemcDR1MBgol4x6viw9gX7d2w9AnRnebUQpz9MjzB/IFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsGDBRcX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD12C4CEEF;
	Mon,  5 May 2025 23:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746486369;
	bh=ZzlkLV6bGsWUlKi8pMT/sDQcez3HbCFLJUcDhrtzXvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KsGDBRcXaGbNgEnOtHUM+Hnsq5SuO18jCC8JKRpGOpgMc15yIh7A5IA1dnPm+nsJD
	 glHysEvWHhSxRJ+eUGbtNQAGEUs6M3tNFYDE77gY9pMiOyt4aL1e9ykJ1u7G5vaynJ
	 0Ig/LNyi2i6W2N0nSHMK7V9XaVy/ihTvYkU+2mKFksRaDPfhK7awfXD+NQYId/2ixn
	 B4EoDYI5SRk0i57AVXao1Knhi5pxOzXR081I3HMmPXyIJKh2NZu9pCWUVTlEAr7Rn3
	 n3OmaXohrc8RW1OChob5qwUddSvHTAPq0uWANuuev2zTKY8tWQEhTOF1BSiR7LZ0HF
	 GO3xTeDukUmQg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Youssef Samir <quic_yabdulra@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Sasha Levin <sashal@kernel.org>,
	jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 287/294] accel/qaic: Mask out SR-IOV PCI resources
Date: Mon,  5 May 2025 18:56:27 -0400
Message-Id: <20250505225634.2688578-287-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505225634.2688578-1-sashal@kernel.org>
References: <20250505225634.2688578-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.89
Content-Transfer-Encoding: 8bit

From: Youssef Samir <quic_yabdulra@quicinc.com>

[ Upstream commit 8685520474bfc0fe4be83c3cbfe3fb3e1ca1514a ]

During the initialization of the qaic device, pci_select_bars() is
used to fetch a bitmask of the BARs exposed by the device. On devices
that have Virtual Functions capabilities, the bitmask includes SR-IOV
BARs.

Use a mask to filter out SR-IOV BARs if they exist.

Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250117170943.2643280-6-quic_jhugo@quicinc.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/accel/qaic/qaic_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index b5de82e6eb4d5..e69bfb30b44e0 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -400,7 +400,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.39.5


