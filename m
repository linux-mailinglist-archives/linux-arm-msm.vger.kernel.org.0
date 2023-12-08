Return-Path: <linux-arm-msm+bounces-3955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6C080A403
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 13:58:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C758328160B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Dec 2023 12:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0656914F7E;
	Fri,  8 Dec 2023 12:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8P88Xkk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8DC13FE7
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 Dec 2023 12:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DBA3C433C8;
	Fri,  8 Dec 2023 12:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702040284;
	bh=gALA2jRL+muDS3DpxBcgYThdE8k0HWZjxsKddMhO26o=;
	h=From:To:Cc:Subject:Date:From;
	b=C8P88Xkk2aQFVrRvV9/eIH/y3GyvGITA8eTZBeFtU0b8h0Jxpp5JS948V2QbTy0eF
	 YU0XHlUeXKzyBjB7jxUZTbbpNhmcd9SEdw/WjLoh9aoLT4wS5CR3gPLxOs/rdjJ005
	 xsFl8mQ7Ujfotfkr2q5117LjiSX2sn5/6ksnqr5X8I+VYXV2aYiCf1J6Vi2WuLemIi
	 QhDF6t+mBcYDM6hR69ADil7avc4R1ttU8bLmj6wn+FzLCaND5JjSYUQ6c1r1KklsHy
	 oiZVDUdAbhMilTXJDsPJTQoLkwEt+I6GqXk2iCszIQr7yQz7k8nmPXOkYIKwqwDwCt
	 BnOgvrL9GSefQ==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan+linaro@kernel.org>)
	id 1rBaRS-0002hm-1n;
	Fri, 08 Dec 2023 13:58:54 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] soc: qcom: pmic_glink: drop stray semicolons
Date: Fri,  8 Dec 2023 13:58:27 +0100
Message-ID: <20231208125827.10363-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop stray semicolons after function definitions to avoid having this be
reproduced elsewhere.

Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/soc/qcom/pmic_glink.c         | 4 ++--
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 511aa40842a1..f4bfd24386f1 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -363,14 +363,14 @@ static int pmic_glink_init(void)
 	register_rpmsg_driver(&pmic_glink_rpmsg_driver);
 
 	return 0;
-};
+}
 module_init(pmic_glink_init);
 
 static void pmic_glink_exit(void)
 {
 	unregister_rpmsg_driver(&pmic_glink_rpmsg_driver);
 	platform_driver_unregister(&pmic_glink_driver);
-};
+}
 module_exit(pmic_glink_exit);
 
 MODULE_DESCRIPTION("Qualcomm PMIC GLINK driver");
diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 7ee52cf2570f..ad922f0dca6b 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -236,7 +236,7 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		drm_bridge_hpd_notify(&alt_port->bridge, connector_status_disconnected);
 
 	pmic_glink_altmode_request(altmode, ALTMODE_PAN_ACK, alt_port->index);
-};
+}
 
 static enum typec_orientation pmic_glink_altmode_orientation(unsigned int orientation)
 {
-- 
2.41.0


