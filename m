Return-Path: <linux-arm-msm+bounces-46144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CF2A1CAE4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 16:36:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 241FC16C8DE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 15:31:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29EF020B1EC;
	Sun, 26 Jan 2025 15:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UXJ+m19P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67020B1E8;
	Sun, 26 Jan 2025 15:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903750; cv=none; b=oWGdDnkgJHIH1xn5yRop2Bo1oeI3CMV1BWCjhpFgsn5OLLwsfRbvn3Y6qIwRcerk1ky778pCPcmQxNH/BMPEwgTISZOyzDW7ncDW9UI17PcbuLA3l2MDeZw9bUbYKvmolOq1anZhPJ2wCDBZjkyIkf6voQUD//EH+cM/rp5NCPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903750; c=relaxed/simple;
	bh=AQrKtVULpApfUw3bdAoQDv2iVzMWFCfd2/IqiaJKXTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XBZ5oUGTg+in9NREYfwx8nB28ZXIXdmDaaTqvxeNcAVhTIGuKbwBsJgnH1Zm5uqRWChU7UNwYsWTPVtXWZyaGVh29X+Vb5Mbuvla3S9szZoppSqjtBbeiRYL5oGAjRm3IkM34wErGh+fCagmmna712MpAq+UmFo3DDu/c4fs+x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UXJ+m19P; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F604C4CEE5;
	Sun, 26 Jan 2025 15:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737903749;
	bh=AQrKtVULpApfUw3bdAoQDv2iVzMWFCfd2/IqiaJKXTQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UXJ+m19PwyOK6/8eoUEo0Tu2APyRKlHyoJAOE1t+OAFnBh4/N10XgzGg4VSWNOBuy
	 ZWf+Iz7uPKrx8G1L4eT/QhBBpyN7KjVF4RKulCqpReyp9HEYzQQ/q/oLZwtaDi5zvz
	 73DMpHwirNVdjCBGZIZXe9BwOz/hyikGQw6WMTd43qAILEQSydBdJsSixvlu9zvPkA
	 bJxIVf+VkSCsW2H+fzsh+F0+NUGyrZsUYyyu5bsM+ZKRspifijwtmUUlpKBpgVIBuU
	 Czgta/KJVnv01/Meok2qWy81Y2LknwyMQoU+iP3gCR47gczNaGJXp4QEi/lMyzx3DM
	 /o71ButxFNqLQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH AUTOSEL 6.12 10/29] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Date: Sun, 26 Jan 2025 10:01:51 -0500
Message-Id: <20250126150210.955385-10-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250126150210.955385-1-sashal@kernel.org>
References: <20250126150210.955385-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.12.11
Content-Transfer-Encoding: 8bit

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

[ Upstream commit 1474149c4209943b37a2c01b82f07ba39465e5fe ]

Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
required, as the GCC driver defines and instantiates a bunch of GDSCs.

Add the missing dependency.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 9ba675f229b14..16145f74bbc85 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1022,6 +1022,7 @@ config SM_GCC_7150
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,
-- 
2.39.5


