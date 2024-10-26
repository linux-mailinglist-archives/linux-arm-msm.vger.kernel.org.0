Return-Path: <linux-arm-msm+bounces-35998-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D47249B1734
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 12:58:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10BB01C20E11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Oct 2024 10:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339BB1D1F70;
	Sat, 26 Oct 2024 10:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNbFgHVj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053FC1FC3;
	Sat, 26 Oct 2024 10:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729940299; cv=none; b=F3DRGTfBvmdNe241Y37Ut1W84XHWu48FM7vh/l3J6/s5CKzpAeOA1HFQSChKcVi8UXIUAFRhzmcW2Xrz15bFV+kFgqy+0g7NNWxMaogq3BYRiC8oz0O+KRWkIEUCnocY8HigQeOXOXos2bR7/Wv6maYM3O4CsdcB4o+oUucmr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729940299; c=relaxed/simple;
	bh=zM0zIS1n7ivHL4hMIirrIZWtrO3KkzIwHIO2bjUDAXw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=dfS8gdpIwIy0IEBb3Q9gXNTjJww9Hse4pDdeo+E6QHpqFnt4CcJH9xus0+7HjmkqhsMHf3xSczMQGapficqhNiz8LHQ5GRVH1g9TT+UUL0R68C2N9lzQ43cLuceOfM2aCGbETAty5VWMsL9Vmsokelx4oIr/EgmJu8RgMT6E/UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNbFgHVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8BCC4CEC6;
	Sat, 26 Oct 2024 10:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729940298;
	bh=zM0zIS1n7ivHL4hMIirrIZWtrO3KkzIwHIO2bjUDAXw=;
	h=From:Date:Subject:To:Cc:From;
	b=dNbFgHVjOqcCA1wlj9Rsj/DtRZjODzTmAi9rgQaO64Ibx2oeX2a9QHnN1NbSFVJY+
	 UCgMgQiBWwpxlLfmO7plzklyuI0JyVumOZtA4GtLQbEU7ejVL47tJdW30yrEx6+bve
	 pilaw9BBJ0sA+4mrX+vBSL5yVwb0MB67cHDGfvulFl74ZeTpo6rAlcpKSI/sBbPPNF
	 ICbUpMbeXY4QyGrB1ILkLZA0+K2/pTvIxL/DmRfG8leVkwjEjomLSYC35j+dGRInAJ
	 5n948QdgK/j3JTRwIE1wQ0bzG9foKYfagkX2sG7FZNJXp4QU6FNUnbcbXRYQaAZhJ/
	 oI3/LaWCl8caQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 26 Oct 2024 12:58:13 +0200
Subject: [PATCH] clk: qcom: Make GCC_8150 depend on QCOM_GDSC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241026-topic-8150gcc_kconfig-v1-1-3772013d8804@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAETLHGcC/x3MQQqAIBBA0avErBNUKqqrRIRNow2BhkYE0t2Tl
 m/xf4ZEkSnBWGWIdHPi4AtUXQHuxjsSvBWDlrpRUnfiCiej6FUrHeJyYPCWnZBmRWU7gwP1UNo
 zkuXn/07z+37Vuv0bZwAAAA==
X-Change-ID: 20241026-topic-8150gcc_kconfig-0abc1f6ac9e8
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729940295; l=1181;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=9dYjLFN7eZxVyGQmmovqSnUbTRrh6XTiwULvyPaGuPA=;
 b=gMiCAzr5IJtaDbKIZ5UDCVzTj28raPuXHgCA+FbCqVKjAwbOUgLArITUUMea1aX745T1xsk+p
 /kYtTW8u+KIC3BQsJMOObVztZURc0dxGoYq0J/6SpFTmoY1kk2SkVzl
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Like all other non-ancient Qualcomm clock drivers, QCOM_GDSC is
required, as the GCC driver defines and instantiates a bunch of GDSCs.

Add the missing dependency.

Reported-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Closes: https://lore.kernel.org/linux-arm-msm/ab85f2ae-6c97-4fbb-a15b-31cc9e1f77fc@linaro.org/
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 953589e07c593fd49fab21c7cfcf466d33f99a27..c298d8e6700f6293f62269e5cc4ef518afc97a7a 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -1042,6 +1042,7 @@ config SM_GCC_7150
 config SM_GCC_8150
 	tristate "SM8150 Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
+	select QCOM_GDSC
 	help
 	  Support for the global clock controller on SM8150 devices.
 	  Say Y if you want to use peripheral devices such as UART,

---
base-commit: a39230ecf6b3057f5897bc4744a790070cfbe7a8
change-id: 20241026-topic-8150gcc_kconfig-0abc1f6ac9e8

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


