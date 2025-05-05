Return-Path: <linux-arm-msm+bounces-56842-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F684AAA7E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 02:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E5449825A4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 00:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F7933E444;
	Mon,  5 May 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LxXZ5K7G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3A733E43D;
	Mon,  5 May 2025 22:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746484663; cv=none; b=nEmINpRZ+2zWah9PzO8BYYDl3O8P9fYStOXNXH6RFirkZejhhYr4ffbIG3GjEtw9JItA+CBCG02L2/KBNBnHOq3xxTbr3wa4Em93ww9PmGQwV7a4orKuZ8wS5G6Gz3E4eefd7rGoS8ZuuZInQd4VYb+Fa8673mzOzFvaudEVuMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746484663; c=relaxed/simple;
	bh=OxyG2uRr3qu41L5pvjIyYWKPfI4fjwF0xCuDVdRoD8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Cskd5iXtZTTKZA4gvI7+dYYNTciIutbS6LLeEzUfG9l9o9X9zTBEIzILpxu9s/WKV4SX2twgfqMfpYew7DeTS6Qevnl3ABZqNU9Vwuopi7TuEcxM1eXVQ8l/wGqhlkTJo22vaoCboD3xEyrWT70RDUolCNLl0xyUKYdaq/QeqMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LxXZ5K7G; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CAC6C4CEEE;
	Mon,  5 May 2025 22:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746484663;
	bh=OxyG2uRr3qu41L5pvjIyYWKPfI4fjwF0xCuDVdRoD8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxXZ5K7GYs0UXYAgQmTH7VxZOvSNTAk54kilW9A3RA5D1eTbANFhndK/veVhPQ+Eo
	 vUMtKCN0iIFmeBCZHRJaqp5DUzP86MUI1cb8yqNxUbC/iupYOdeOpSlbZMJ13COLRj
	 IaZARo7RjH9fHelrI8nNaDQGmE8rNuKJFNzill+YGA8WlEHua+gdtd95EkAH7yd1mE
	 +49JU3rxQYkMyjvJI0TjuJ7G/IvLwFxEng2xuaXsHm+GRTqsZfAIwJ+M1bNefGIi/x
	 l5ZWZz68h5ACtudJLdMnTiykgRherhpem+HVVlyhNBfY/bYuuVKs3Ciuv3NvGaAlHU
	 4rYNgXjZ6axjg==
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
Subject: [PATCH AUTOSEL 6.14 593/642] accel/qaic: Mask out SR-IOV PCI resources
Date: Mon,  5 May 2025 18:13:29 -0400
Message-Id: <20250505221419.2672473-593-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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
index 81819b9ef8d4f..32f0e81d3e304 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -431,7 +431,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.39.5


