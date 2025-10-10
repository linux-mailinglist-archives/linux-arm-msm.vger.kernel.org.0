Return-Path: <linux-arm-msm+bounces-76774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D37BCC86E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 12:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3E9BE4FA6B9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Oct 2025 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4E462EF677;
	Fri, 10 Oct 2025 10:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PaFi/46p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45542ED854;
	Fri, 10 Oct 2025 10:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760091916; cv=none; b=KjauzBWFEqNM8qsE74O+UfR+pa3CTyI4baUZSDC4FwzsiX4AJyGFztMQfsfYHIMl65DTVZAnubTnJgwLtPI7qLGIvhLeBQe2x7hKGV18DWT/iG1kB1gQBB9EdHT5kxVOux1eSBC431tYlGEZ+diLQY87Hnr6kn7LLIWt2vYFfPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760091916; c=relaxed/simple;
	bh=GpPSuImSa5tSADXfgDxcM+5gdGw5mnd30ZpFVKMLz78=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lrgRFhmuqhGCLriXJn1ScHpFjOElZvuHe1lztgNfcRdwbB15/BaTj28cPpEJGgvPua+AlBdBuoqAu/KUJhBAUitnAQ0MO8S2Qdijw5JfMcmN7oeHLD8ILWsDhH/7a4L1qcm/2iXbrk4PLsVeb8Ciy5aaTotR22HRH/VCH/YWorA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PaFi/46p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5AAC4CEF1;
	Fri, 10 Oct 2025 10:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760091915;
	bh=GpPSuImSa5tSADXfgDxcM+5gdGw5mnd30ZpFVKMLz78=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PaFi/46pVngzb1l3LSrDTZ4w3gGc06AznOjoV2/ioqo34Qvavc0XvXHD/M0rrey98
	 FPcQvXcKndnoM2ikD5g9JHbpWmmt9zCrh0JiGYbEdS62q41zANnADVs704TlYa5HhK
	 FhhkfiVq4ivdojgoXS2jmTujt+5Dz06UUXgL8Jq9W15hKl2PSHX1+m/jnuiOp2aKKO
	 LuGHC1IanvaNMJ5SoRs5mLb4N8GhPQZ6gqb/a3rUUXcnt8LF24RLkdhb72nEx6xPFC
	 jmUnMFZthIg+aPncKFHbCpG5wE3RbI/30fYuDV+1BiHUnVni1MxChRuSCR6Dki/HZz
	 2eMWqNf4gnyHA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Oct 2025 12:24:52 +0200
Subject: [PATCH 3/3] clk: qcom: gcc-glymur: Remove 85.71 MHz USB4 master
 clock frequency
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251010-topic-gcc_usb4_unused_freq-v1-3-4be5e77d2307@oss.qualcomm.com>
References: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
In-Reply-To: <20251010-topic-gcc_usb4_unused_freq-v1-0-4be5e77d2307@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760091904; l=1003;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Je+JMBggkTTSNURcLWuT5oRG7BENrSDrchp3Ubsq8ZQ=;
 b=Z6k8MBrIB7QbCzBvG6LWT0sl9vOQYEtcvoZ/S6CUgOXRPLLxJ9U2RiaUz2eOc2wS3HYj9Hgzv
 HtaKYEcY8ZxCE0ljcGkqlksz6+tjDjMk2YrGTJhSc+BfsuOpVJKqpoS
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The USB4 HPG says this frequency remains unused, remove it from the
frequency table to avoid any misunderstandings.

The reason it's unused seems to be that the lower RPMh level required
to support it (LOW_SVS) is not enough for other pieces of the pipeline
which require SVS, which in turn is enough to support a faster, 175-ish
MHz rate.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 62059120f972..6ed9bd7b7d9c 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -2643,7 +2643,6 @@ static struct clk_rcg2 gcc_usb3_tert_phy_aux_clk_src = {
 };
 
 static const struct freq_tbl ftbl_gcc_usb4_0_master_clk_src[] = {
-	F(85714286, P_GCC_GPLL0_OUT_EVEN, 3.5, 0, 0),
 	F(177666750, P_GCC_GPLL8_OUT_MAIN, 4, 0, 0),
 	F(355333500, P_GCC_GPLL8_OUT_MAIN, 2, 0, 0),
 	{ }

-- 
2.51.0


