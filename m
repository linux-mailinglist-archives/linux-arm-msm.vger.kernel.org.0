Return-Path: <linux-arm-msm+bounces-37230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC269C0509
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:58:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 260161F236AE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66E2620EA2B;
	Thu,  7 Nov 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fLOu15BO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE9F20C48C;
	Thu,  7 Nov 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980696; cv=none; b=EWeYmUGyK1eGip54tqEsmM9DwalGybEmZrcDG8lvMbelWTvPm6BZyeP/Dd6XqGdmdiWBOcLCf8FuUTH75tRrTL//OLW1X8x47znTUtbBD7vyaMlPPI7+MeIZ85Oe9oPEAnyRHhn6Wu36vyJPApWElZe064zM8AwiTimUA0QoolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980696; c=relaxed/simple;
	bh=WCUKuX4maFHRyx+sxrpXCTzsud3pXHBXfStxFHvUR00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pApJXM/LFaxWZmO3UJIqFlNWbP+HHfC+P6xDoqtlk3+nzfIuutM1zdDzs+MPJJhNNM0/LuFBVg6yK9ix3bKI4eJ/E8mfO5kRv3QUvipBx370tTnibYrepoFJIZJz5ZOYc7haBCW0f3onJFq1kK8oGEBEs7w8HwXsznkA/+v7Sr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fLOu15BO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC0E9C4CED2;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730980695;
	bh=WCUKuX4maFHRyx+sxrpXCTzsud3pXHBXfStxFHvUR00=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fLOu15BOdKdDE+BugZVoj4tH5bz4KDWLw+rwo0bqf0yg3ehgpdh0MHNsbfiaKvMkG
	 SmObaaihyRO4ZiGA3fey2Hw/v++lxeEzJKbGlmTgUKGOGqsXoarPW+9U7zQEowQ2Tt
	 urhBLlC5YzYZrdu2ObYXecOBuougo4nLsgUBdNPid4DOsYS3zrRTPrTxUq5I1H1t0k
	 7UDAEmo1hr9A8qOr2ZfRcwEiek7kV2WLMPdEPJ7dms6npvddR+VNvhM6bYgcoAeW9f
	 4gU5cf9EfyF8eq9XUX7SnNF+l2h6Tece2ftSA+tGDJ9msPo8TzFFzHXa+b7E63W0aR
	 JDHgCyxUoGxlA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD2CD43350;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 07 Nov 2024 11:58:09 +0000
Subject: [PATCH 1/2] clk: qcom: gcc-sm8550: Keep UFS PHY GDSCs ALWAYS_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-ufs-clk-fix-v1-1-6032ff22a052@linaro.org>
References: <20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org>
In-Reply-To: <20241107-ufs-clk-fix-v1-0-6032ff22a052@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Amit Pundir <amit.pundir@linaro.org>, 
 Nitin Rawat <quic_nitirawa@quicinc.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1811;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=HLNXhxeA0d1kaDOGx2ZDq/GyczbnxDOYCBJsf8padcs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnLKtWlMyTFtfeKixW/Ry1GRcw0Wc5ZeIShmfST
 ljUoOuh8CCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZyyrVgAKCRBVnxHm/pHO
 9dUECACmLYKmlwTa3vNIOh8c2A9iQNTlvtbUop9MU+loAitzIM7cVs4ieKxbIdbNIV2OKoJpeDZ
 VaBcbVCrOjtKb0OcshplAXBbO+ev5HC1Vk/SRBf6SfZMF2JT0m1I6MpPP4g0HHnRaSuaJZFkGGa
 zNlEJZQyx/E1b03Tu0EOqnpdC4vLyN8YTB4YKukAtWBiEdHN/5mY4OreyvRzb/EBG3IfPB4DKJm
 LQ9VDOBMNRG7Y7Hr1M0le04AlUaiz+MD8r+ReV3GyCu0NYhbV2p7qnSEq1lf66BDZ9kop5lDJzR
 oNv6e5rrm5Tyz6/9DuQpTxNmYITg+BOTcM6QDTVvdu8cjqkh
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Starting from SM8550, UFS PHY GDSCs doesn't support hardware retention. So
using RETAIN_FF_ENABLE is wrong. Moreover, without ALWAYS_ON flag, GDSCs
will get powered down during suspend, causing the UFS PHY to loose its
state. And this will lead to below UFS error during resume as observed on
SM8550-QRD:

ufshcd-qcom 1d84000.ufs: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
ufshcd-qcom 1d84000.ufs: __ufshcd_wl_resume: hibern8 exit failed 5
ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: 5
ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x84 returns 5
ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error 5

Cc: stable@vger.kernel.org # 6.8
Fixes: 1fe8273c8d40 ("clk: qcom: gcc-sm8550: Add the missing RETAIN_FF_ENABLE GDSC flag")
Reported-by: Neil Armstrong <neil.armstrong@linaro.org>
Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8550.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 5abaeddd6afc..7dd08e175820 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3046,7 +3046,7 @@ static struct gdsc ufs_phy_gdsc = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
 };
 
 static struct gdsc ufs_mem_phy_gdsc = {
@@ -3055,7 +3055,7 @@ static struct gdsc ufs_mem_phy_gdsc = {
 		.name = "ufs_mem_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
 };
 
 static struct gdsc usb30_prim_gdsc = {

-- 
2.25.1



