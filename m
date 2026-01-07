Return-Path: <linux-arm-msm+bounces-87864-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E094ACFD73D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:44:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 27C013001BC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 11:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72453308F07;
	Wed,  7 Jan 2026 11:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqlN334W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409A72E228C;
	Wed,  7 Jan 2026 11:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767786293; cv=none; b=fOksGfi4cEwgPyF54pPiKHvKZUrwY2j8emCaV1ErV/aoRUx+3SQe8i25QDhEPqcand7ssU9M+nY66Jk6XBoNsLVEU+SsH6HnOTitW1r3cV7slHJRoVYzKnpyAT63eoXbTOuKbk9PE+lYcqJsk2Jh0BB7Wh+9auRkoDZ8Za0uzzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767786293; c=relaxed/simple;
	bh=i12dijGR2EG5TROlBAmjQZIcGVlj0wQM3L9IkBSHFK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nBWIkpJsszILROG3nRlDYk76b1fY4vfLXYR5s7Ynzf3KVRCrHnlDbaos1Paezzd1u+2WGIVZLD4/++Oimzqx/3Bqb8h+pSzr+oFa/xccnFQjtE9EsbY3x9P5PdHYiBu7IFHVCjCf23Ysu+//mxdsuOYkAdXO8tq8AddPnpT0bck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqlN334W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B73D1C4CEF7;
	Wed,  7 Jan 2026 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767786292;
	bh=i12dijGR2EG5TROlBAmjQZIcGVlj0wQM3L9IkBSHFK8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=nqlN334WX/TxihteSi+cCHq2vtVfblVpOeOxwUcMH7tl8POZAXBErk8tlfwy6KiH6
	 dCIcme6hB0I0NPs/IF1+C0fi5tX5HAv6OFnFUWHBgdBIed+kt2k+3MRAlp+jzNr9ar
	 uGeeEYWdQXr53Sa+nf7DRrqI8+KW/rXNReIiMI/Cm+R1a96IRuKAjjmomCz1NZFZL7
	 NroZBHgFA/GNLNGBxjwdc3CpWh36q6RilYZP4a1WtF7dpjbTvAhetMVFUh8W/DAETE
	 6qM793cd/Z5mjXsqzhNCbRdKUaRCgNPZ/7DE3rp4lpDhosEKrehfgqkCXb195Dcc/X
	 hYEtDZwO53d4g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC968CD5856;
	Wed,  7 Jan 2026 11:44:52 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Date: Wed, 07 Jan 2026 12:44:43 +0100
Subject: [PATCH v2] clk: qcom: dispcc-sdm845: Enable parents for pixel
 clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260107-stability-discussion-v2-1-ef7717b435ff@protonmail.com>
X-B4-Tracking: v=1; b=H4sIACpHXmkC/22NzQ6CMBCEX4Xs2Rq62EY9+R6GA/RHNjFgurUBS
 d/dQuLN4zeZ+WYFdoEcw7VaIbhETNNYAA8VmKEbH06QLQxYo5IoUXDsenpSXIQlNm/eBsJK7XV
 nSqO+QJm+gvM079p7W3ggjlNY9pckt/QnbP4LkxS16FFZfz6pRqG+0UzxaD7Q5py/CAgnTbYAA
 AA=
X-Change-ID: 20251212-stability-discussion-d16f6ac51209
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
 David Heidelberg <david@ixit.cz>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767786291; l=2169;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=rhHlOC5VvJkw1jNcO5wjpQE+ODSzLv7eBLSkXsZ0iyw=;
 b=WTR4lz69OoEn9zFkm8BKk7lSNL6QEdFohSqc+8MLAekv3FMBPnv7HPsoadbU3e3BuDvuWolXZ
 r5ZqrFE4sdpAeoGdrfVv6WacO2nwHCegWEbP4Qbn6nUKp3eJInBeEf7
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com

From: Petr Hodina <petr.hodina@protonmail.com>

Add CLK_OPS_PARENT_ENABLE to MDSS pixel clock sources to ensure parent
clocks are enabled during clock operations, preventing potential
stability issues during display configuration.

Fixes: 81351776c9fb ("clk: qcom: Add display clock controller driver for SDM845")
Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
We are currently running the latest linux-next snapshots (next-202511*
and next-202512*) and have encountered random freezes and crashes on the
Pixel 3, as well as crash dumps on the OnePlus 6 and 6T.

This commit fixes the stability issue. I've checked other SDM dispcc
files and they also contain this configuration.

For safety I also set the configuration for `disp_cc_mdss_pclk1_clk_src`
though it should be sufficient only for `disp_cc_mdss_pclk0_clk_src`.

Kind regards,
Petr
---
Changes in v2:
- Remove commits from v1 and introduce proper fix.
- Link to v1: https://lore.kernel.org/r/20251213-stability-discussion-v1-0-b25df8453526@ixit.cz
---
 drivers/clk/qcom/dispcc-sdm845.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
index 2f9e9665d7e9..78e43f6d7502 100644
--- a/drivers/clk/qcom/dispcc-sdm845.c
+++ b/drivers/clk/qcom/dispcc-sdm845.c
@@ -280,7 +280,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk0_clk_src = {
 		.name = "disp_cc_mdss_pclk0_clk_src",
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };
@@ -295,7 +295,7 @@ static struct clk_rcg2 disp_cc_mdss_pclk1_clk_src = {
 		.name = "disp_cc_mdss_pclk1_clk_src",
 		.parent_data = disp_cc_parent_data_4,
 		.num_parents = ARRAY_SIZE(disp_cc_parent_data_4),
-		.flags = CLK_SET_RATE_PARENT,
+		.flags = CLK_SET_RATE_PARENT | CLK_OPS_PARENT_ENABLE,
 		.ops = &clk_pixel_ops,
 	},
 };

---
base-commit: f96074c6d01d8a5e9e2fccd0bba5f2ed654c1f2d
change-id: 20251212-stability-discussion-d16f6ac51209

Best regards,
-- 
Petr Hodina <petr.hodina@protonmail.com>



