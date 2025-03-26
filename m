Return-Path: <linux-arm-msm+bounces-52522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B879FA716E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 13:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A179B3BC2EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 12:50:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6381AF0B5;
	Wed, 26 Mar 2025 12:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cd6+Jy4Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337A91E51D;
	Wed, 26 Mar 2025 12:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742993457; cv=none; b=Q2y091L+YrEB8xTve7eMkVjah1zWzRfYamnKelGW5Q7EZA450MTXlTRz5CgwoaE6HoV6RenOxBzny44+LGyfCcsY/01oqfcv94T9PkE/OUQG0gWlw86IdUaQQ4zr1lU2tlLdAQdXc3iyDeMplDo6M6yhcyO37Gb37WEBI9I+alE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742993457; c=relaxed/simple;
	bh=VBTKj4iGbAXQgTEskqyOddUBrQIpyNW9hYgGpfIG2UA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WrzujmJE6N70DWXaBc/5kyoK9t0EYWCZjPelIsGoGc8Q3M1p4Qde98lxWtFVtLThev0zbWX0JtU1T7/MyJQLY95OHvqf11AaLyjR+ZB3THd/9Qt2gh4O901hr96CABrkOR//APgWKzXrR5DxR5oAXBzhir76GX8piPEqmlBec94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cd6+Jy4Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9C6C4CEE2;
	Wed, 26 Mar 2025 12:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742993454;
	bh=VBTKj4iGbAXQgTEskqyOddUBrQIpyNW9hYgGpfIG2UA=;
	h=From:To:Cc:Subject:Date:From;
	b=cd6+Jy4QTjqFe8f7sBEtXXJ+9XUHbSk08etSoVy1RPTs0KGnK18bUz+h7bHoX6LO0
	 p94MyJdKrZzHkMKFEVltgBw8whvZgVh+0w8tjSx0FsRisXRoAe1i6VYNH/q4RuiqCh
	 nCDdbGH2zxG8ujZq45TiHuPbdxXqVpGKmLxVXKIzi+RfLxUpEleEojTb9GoHJarGNq
	 jiECPbtqLzmEGfFbgirs8HwF5PzyC3EfFnSeZLwOjMEwJpBSvJyTdjN7/R7CFo+YVI
	 jilwHKLkY7jV5Ksr5wU8pwiRAgrzv3+7WXXBfQnz1qEK0AEpCH7/zMm4soJevlBVcC
	 EgyOmDcRG09Dw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1txQDg-000000001hP-0jIf;
	Wed, 26 Mar 2025 13:50:56 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH] soc: qcom: pmic_glink: enable UCSI on sc8280xp
Date: Wed, 26 Mar 2025 13:49:44 +0100
Message-ID: <20250326124944.6338-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ad3dd9592b2a ("soc: qcom: pmic_glink: disable UCSI on sc8280xp")
disabled UCSI shortly after it had been enabled to fix a regression that
was observed on the Lenovo ThinkPad X13s.

Specifically, disconnecting an external display would trigger a system
error and hypervisor reset but no one cared enough to track down the bug
at the time.

The same issue was recently observed on X Elite machines, and commit
f47eba045e6c ("usb: typec: ucsi: Set orientation as none when connector
is unplugged") worked around the underlying issue by setting the
connector orientation to 'none' on disconnect events to avoid having the
PHY driver crash the machine in one orientation.

Enable UCSI support also on sc8280xp now that the DisplayPort disconnect
crashes are gone.

Cc: Abel Vesa <abel.vesa@linaro.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soc/qcom/pmic_glink.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index cde19cdfd3c7..0a6d325b195c 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -371,15 +371,11 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	__pmic_glink = NULL;
 }
 
-static const unsigned long pmic_glink_sc8280xp_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
-							     BIT(PMIC_GLINK_CLIENT_ALTMODE);
-
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
-	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8280xp_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };
-- 
2.48.1


