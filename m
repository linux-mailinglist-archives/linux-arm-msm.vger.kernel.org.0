Return-Path: <linux-arm-msm+bounces-37229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCBE9C0508
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 12:58:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A240E1F23153
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 11:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650E020E317;
	Thu,  7 Nov 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ndTVSh5K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF3D20C48E;
	Thu,  7 Nov 2024 11:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730980696; cv=none; b=VJvXhCw5FBo23X+270Joodj2LKiLyECdaSRm6NOEvPJDV9qU/njr33ylp9Ml+rdUiFsR25RxXrNdumfmvHiRy/EUIIm8/IZl9U2SFXJxNNPiGJCn2Q2dOd6pVo8RNfgtpFCRDgqFlrLOe5T5k0vpf0LzaW2VQK4LDypnIxHQihc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730980696; c=relaxed/simple;
	bh=a0ycLHX32lthYYvuPhQaJWZI+SHyq+QSK7Hxoq+vmgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TzPbLt5vHqSByFtdexOaIegBq8n6KzALrCmODf85VYkx+038yman/f56ANepeu9GFwy5qYF5nR3nA43QJM5JKvTfRJXUBSVXc9ZSbf1nWhUi9+w+RgvUOQ+X3D+kepXxkvXKVLbFEDIJmUdSi81yCtY5SAS/b9+5ifc+jDGR5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ndTVSh5K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0E08C4CED6;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730980695;
	bh=a0ycLHX32lthYYvuPhQaJWZI+SHyq+QSK7Hxoq+vmgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ndTVSh5KOfkTxmzKvSiQVxTkasb6+J8blBs+UQsy1Z+XspZOBD0U3nBTkmsvDnkHD
	 /zFAjV8notv5v8+xHE4frXFbFPaQpFDRVR9QebS3jGlTKJbgPHDO8qy/TqR3B1/IGQ
	 k6icSAW7A93+limCQN8LdqzK5N3DZoQ+hfHpmIMq8DE6DTfMulb0700I9O7hfMV222
	 WDKJ+ACFLtH9gYJ2cCR73eqU1qmGcsX2Jolsy5KQ5mGY98XPY4anv9GoW0pjbjykNj
	 aDWof5NamV2vBbIVvmhfYirIRD2pUSaTqQZi78/VOfaqb0p/Mod7o0/RCa5h+vX6Ry
	 VcYCQ0ZQxwrpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E62D43354;
	Thu,  7 Nov 2024 11:58:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 07 Nov 2024 11:58:10 +0000
Subject: [PATCH 2/2] clk: qcom: gcc-sm8650: Keep UFS PHY GDSCs ALWAYS_ON
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241107-ufs-clk-fix-v1-2-6032ff22a052@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1726;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=FYMKCEEuacXk+42R8P6zQhXoxh2cvI/j+fmsSrjKCbU=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBnLKtWTSaVN7myne/t1gzjS1A1koyo4Svt/P6RF
 qn/vo26NbCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZyyrVgAKCRBVnxHm/pHO
 9YJhCACEM11P1PgwtQ5SOpPd5K0j4R0YiML/G5exG9X1Il6TFhcWi1gOKtfe4Qxa7PV18rq871H
 Xxt4v9fyAZrR/sO4kIzKE9UE4VjUOx7uEQLx0mfHjYVhSfmFOA1+IwvNz0QSJZxSmJbMA4Ngl+N
 3fytbwtVJfLD+L9+Sj0jrezK4xc9JdTSEETyRcPXhKIcQxEY98Y8uUuzpsR8SOWuu7mtyAYUgcz
 pFh8mQwrmT+8zHpPb5PYhmHc91rJjy1c99aflBgmCL2X66hc7UuL4LMwBK5XTtuf48lKjxEMcVC
 jdv+PWToC5RWqj30LLEY2qpW8fWoRw4isIOtSEm2Si7KmCfi
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

In SM8650, UFS PHY GDSCs doesn't support hardware retention. So using
RETAIN_FF_ENABLE is wrong. Moreover, without ALWAYS_ON flag, GDSCs will get
powered down during suspend, causing the UFS PHY to loose its state. And
this will lead to UFS error similar to below during resume:

ufshcd-qcom 1d84000.ufs: ufshcd_uic_hibern8_exit: hibern8 exit failed. ret = 5
ufshcd-qcom 1d84000.ufs: __ufshcd_wl_resume: hibern8 exit failed 5
ufs_device_wlun 0:0:0:49488: ufshcd_wl_resume failed: 5
ufs_device_wlun 0:0:0:49488: PM: dpm_run_callback(): scsi_bus_resume+0x0/0x84 returns 5
ufs_device_wlun 0:0:0:49488: PM: failed to resume async: error 5

Cc: stable@vger.kernel.org # 6.8
Fixes: c58225b7e3d7 ("clk: qcom: add the SM8650 Global Clock Controller driver, part 1")
Suggested-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/gcc-sm8650.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8650.c b/drivers/clk/qcom/gcc-sm8650.c
index fd9d6544bdd5..ddc38caf7160 100644
--- a/drivers/clk/qcom/gcc-sm8650.c
+++ b/drivers/clk/qcom/gcc-sm8650.c
@@ -3480,7 +3480,7 @@ static struct gdsc ufs_phy_gdsc = {
 		.name = "ufs_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
 };
 
 static struct gdsc ufs_mem_phy_gdsc = {
@@ -3489,7 +3489,7 @@ static struct gdsc ufs_mem_phy_gdsc = {
 		.name = "ufs_mem_phy_gdsc",
 	},
 	.pwrsts = PWRSTS_OFF_ON,
-	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.flags = POLL_CFG_GDSCR | ALWAYS_ON,
 };
 
 static struct gdsc usb30_prim_gdsc = {

-- 
2.25.1



