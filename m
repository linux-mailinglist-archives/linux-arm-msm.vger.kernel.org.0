Return-Path: <linux-arm-msm+bounces-22115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3989D90115A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 13:46:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D90EB282BA4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Jun 2024 11:46:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5F542A8D;
	Sat,  8 Jun 2024 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X6dIjkMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDFDDF4D;
	Sat,  8 Jun 2024 11:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717847196; cv=none; b=OcRZLK5ZHSYbgb1aEwkzng+8ENcEiIGSVzjPuqdp73klH1ThrEcaikE9Kg2oHluntR7WBJQ9jQBfRjccXl3mhi8P+tVCENUWIrEokXG96+5YQMh4wV3m6xI6OSbjZsxfxDzNTwsjcT0/txUV+500EhWUtaMnn9IPwt6z2ZaQM6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717847196; c=relaxed/simple;
	bh=ie6jFcQd2J/GOk/v84sc6pBtZPWB+m80mdB55vgZF2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U1Mc/Yhe/VrXJsfWKmeBLkaojCWyLX2YLKGFXLSrzX/UGc7BWVtGkkoh7kHJIZIxzYtCIg4sk+3wH7dg4nxa60NlcXD6dEqPGQqjNDxzBL+5HKJ4k5NYdiGD94z9g9Wv4dZRLxHq/Kmsyy270xTNPyoTwhtxewJ0ljfP22YBjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X6dIjkMG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E57C9C2BD11;
	Sat,  8 Jun 2024 11:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717847195;
	bh=ie6jFcQd2J/GOk/v84sc6pBtZPWB+m80mdB55vgZF2M=;
	h=From:To:Cc:Subject:Date:From;
	b=X6dIjkMGegMNvJr+au2ueNUWyPcq6saiKrll2oR+Rchh16DP68v6GWG7GSrpIj7V3
	 +ULvP8QjDEtg0ucXa/GOvAlYk1l1tMmluxaCaNZzqZjJQYDPQVz4rBmFmkew+PVnam
	 grk4IEtzhpotKQlXPKbtR9eVg5hmeY0TKwWSTzLQBP/99AgfFcIWp6pFLhcHiJTgR4
	 nXI0SdvaM3xBXZjrCAXfKbA/w84vLTrUyg62yjgi0T9kfWpvzcqF+T/Jq8P6/qJGCK
	 WXWATVchVKEWGE89SI6VVKQvhxL+qdHj/omtEr1Zvf85kyyhsjBBB+lIaCCaqFhOni
	 SAgBdk0p1Qyag==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sFuWn-0000000060y-3Kbh;
	Sat, 08 Jun 2024 13:46:34 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	regressions@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] soc: qcom: pmic_glink: disable UCSI on sc8280xp
Date: Sat,  8 Jun 2024 13:45:29 +0200
Message-ID: <20240608114529.23060-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Disconnecting an external display triggers a hypervisor reset on the
Lenovo ThinkPad X13s since 6.10-rc1 which enabled UCSI. Disable it again
until the regression has been fixed properly.

Fixes: 3f91a0bf4a0b ("soc: qcom: pmic_glink: reenable UCSI on sc8280xp")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soc/qcom/pmic_glink.c | 4 ++++
 1 file changed, 4 insertions(+)


Dmitry reported off-list that his X13s was crashing when he disconnected
an external display and I tracked it down to the enablement of UCSI in
6.10-rc1.

I have not had time to debug this further, but I'm flagging this as a
regression and sending an effective so that we have a fall back in case
this is not fixed in timely manner.

Note that this likely affects other Qualcomm SoCs as well.

Johan


#regzbot introduced: 3f91a0bf4a0b



diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 40fb09d69014..65279243072c 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -348,11 +348,15 @@ static void pmic_glink_remove(struct platform_device *pdev)
 	mutex_unlock(&__pmic_glink_lock);
 }
 
+static const unsigned long pmic_glink_sc8280xp_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
+							     BIT(PMIC_GLINK_CLIENT_ALTMODE);
+
 static const unsigned long pmic_glink_sm8450_client_mask = BIT(PMIC_GLINK_CLIENT_BATT) |
 							   BIT(PMIC_GLINK_CLIENT_ALTMODE) |
 							   BIT(PMIC_GLINK_CLIENT_UCSI);
 
 static const struct of_device_id pmic_glink_of_match[] = {
+	{ .compatible = "qcom,sc8280xp-pmic-glink", .data = &pmic_glink_sc8280xp_client_mask },
 	{ .compatible = "qcom,pmic-glink", .data = &pmic_glink_sm8450_client_mask },
 	{}
 };
-- 
2.44.1


