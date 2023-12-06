Return-Path: <linux-arm-msm+bounces-3552-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E54CF806FE7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 13:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E616281BEE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Dec 2023 12:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EC5C2D04D;
	Wed,  6 Dec 2023 12:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqStE1Fj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AA428E0E
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Dec 2023 12:37:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297A7C433C8;
	Wed,  6 Dec 2023 12:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701866264;
	bh=ADJ2QTgdrL4qnigrFQHFb2Ou59LIW/2P5BY+VaVUnI4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aqStE1Fje2FGe68gp0llFETF/lI7zCt6KDJO/DA8l7htMiMHkVP5pFCGhPpzkZE6+
	 OLhZ7Qv8k2kRAzI0NgPlsCDy5yO7DxLtXndtu7ZQpRpSxx4nmct6h91JWitQP+7PbO
	 t+Y3B8voX+GchPJJXMfZRkMuOLq35zi3F/apKfacUBNYaEU5xLrnZy3AA9pP/0jm1E
	 MVB/lxNzKRvD/fYGBtSAgWfx+GvxFUOuSTlBwriNJTGhG7MCE1yxBcLrkiqzgfFc8o
	 dqEAeiRCPlWg3EbghGzd6bH1nd9pIWZKfsAyzvtUcjZATiM6IswXXxoo5rXE56/hTS
	 K8Fg5gea4PwKQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] soc: qcom_stats: add AOSS_QMP dependency
Date: Wed,  6 Dec 2023 13:37:07 +0100
Message-Id: <20231206123717.524009-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231206123717.524009-1-arnd@kernel.org>
References: <20231206123717.524009-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Using the QMP functions fails in a built-in driver when QMP is a loadable
module:

aarch64-linux-ld: drivers/soc/qcom/qcom_stats.o: in function `qcom_ddr_stats_show':
qcom_stats.c:(.text+0x6f4): undefined reference to `qmp_send'
aarch64-linux-ld: drivers/soc/qcom/qcom_stats.o: in function `qcom_stats_probe':
qcom_stats.c:(.text+0x117c): undefined reference to `qmp_get'

Fixes: e84e61bdb97c ("soc: qcom: stats: Add DDR sleep stats")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/soc/qcom/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index bf213b514a52..a55f9d6c392a 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -222,6 +222,7 @@ config QCOM_STATS
 	tristate "Qualcomm Technologies, Inc. (QTI) Sleep stats driver"
 	depends on (ARCH_QCOM && DEBUG_FS) || COMPILE_TEST
 	depends on QCOM_SMEM
+	depends on QCOM_AOSS_QMP || !QCOM_AOSS_QMP
 	help
 	  Qualcomm Technologies, Inc. (QTI) Sleep stats driver to read
 	  the shared memory exported by the remote processor related to
-- 
2.39.2


