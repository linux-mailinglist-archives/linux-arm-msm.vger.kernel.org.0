Return-Path: <linux-arm-msm+bounces-56865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6C7AAB272
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 06:21:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D05F64E405D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 04:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A54742A3C4;
	Tue,  6 May 2025 00:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcmUsprR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39563278777;
	Mon,  5 May 2025 22:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746485758; cv=none; b=Okf7Y0KAOZ7Oz6d1ivIAvjdJwAH4bskZirzPDs4+7FlscVT2LHRf4mcQ9wzgPpJHLBMdcEhKtc2+Dsk4u7uQ05mxAqQ+/V+y5sFT5Vr1aHPKu1AC/t9S+QYL2In+cXx5OhzPQHe/FKJ5qP8JDy14hQc+k13b2cQeKjnQukBctlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746485758; c=relaxed/simple;
	bh=Di0jDpfzAMe0gROB9QY0u7czD53Zp3a46Nkp6q62GRk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IZ2NIDD3THuVJrNZIbrpumuW9qngu244t5JRoVYJR6zVipzZly6/P27RsfElMXJPShRnmn264ehSkZelInyuiUshBjE26WjebIl+6R7X6JEYgMpBQO/PnlY7CQrax8KW/1S0mqD1RMzY7exBZdtSBbpO9YcK3pl3ZVzR/Cyg8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcmUsprR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1109DC4CEED;
	Mon,  5 May 2025 22:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746485758;
	bh=Di0jDpfzAMe0gROB9QY0u7czD53Zp3a46Nkp6q62GRk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tcmUsprRlcoOLaZ43guQmpHunPLLRBQTDQKEElMSD5ggeGMCo0wG6NhLeMVorDCH8
	 pP0u4Wni+nNCLzUS9em5EqJLjEiVQaF/X9uBKcI1/+B4RLbIuUhssLemkNMcKr5ll9
	 AgY/ZEpK3mIBJc3PbNQ4ATmMzPdPC1bFpVL0LF24MUaNM8FNPdy+CWqeSysXRdbtK8
	 xBO4ZCv2SP6vuxO+6Br8vq7bdrzHG5AnwDa0VWPV7mrEYk+pXP9VnZOsAZ1RB0bK3O
	 FEJyfQ46df+ka+MnUUuUzgQ2BxSH30lvyBYax8sS/dv0u6jJ5cePsYQeq5CD48Zqwi
	 xgGibTQTw+LUA==
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
Subject: [PATCH AUTOSEL 6.12 468/486] accel/qaic: Mask out SR-IOV PCI resources
Date: Mon,  5 May 2025 18:39:04 -0400
Message-Id: <20250505223922.2682012-468-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505223922.2682012-1-sashal@kernel.org>
References: <20250505223922.2682012-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.26
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
index f139c564eadf9..10e711c96a670 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -432,7 +432,7 @@ static int init_pci(struct qaic_device *qdev, struct pci_dev *pdev)
 	int bars;
 	int ret;
 
-	bars = pci_select_bars(pdev, IORESOURCE_MEM);
+	bars = pci_select_bars(pdev, IORESOURCE_MEM) & 0x3f;
 
 	/* make sure the device has the expected BARs */
 	if (bars != (BIT(0) | BIT(2) | BIT(4))) {
-- 
2.39.5


