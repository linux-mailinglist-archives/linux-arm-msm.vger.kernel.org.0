Return-Path: <linux-arm-msm+bounces-32929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A5C98D0B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 12:02:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D91D21C2143C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 10:02:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B231E6337;
	Wed,  2 Oct 2024 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCywZpA3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5731E6309;
	Wed,  2 Oct 2024 10:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727863355; cv=none; b=F3xbrmgY544h0MTHqHKX6inDxu1++f2QDNYHU1AdXL5YqoCIXHj3a4lt6vXgDYjv4QaY0EcdhHNvOl5zLY73Cjxz88alJoRB9MWi5O9rDaoAYSbdFYuPkbIF3eGhC2egbpHxbllp/0jo0YPlruH2XB4/e4KQYways4ZzbMNov9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727863355; c=relaxed/simple;
	bh=3C+nBexmaLJCuCYkI3pf1V0kD65fOb8u7gIYogI07vs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpXegYc0CmLDR11+qNC8Ydn81TXtRuyLQX3LqebbqZi1rv57eya40JFVN+Wo5YPEV6gEQ8eG76GcY7ctiisAM2MlqbI9DrecLtJ8T8FX238oVhpAP7YC3GyvkuxLl7hW9GzSN7DshMCRk7IoWDrc6VJapvAQMLQo2ii/nVtzzDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCywZpA3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4817C4CECF;
	Wed,  2 Oct 2024 10:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727863354;
	bh=3C+nBexmaLJCuCYkI3pf1V0kD65fOb8u7gIYogI07vs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GCywZpA3/FM+pFbCqlTZtljnV69bIFpcS4eRqXPow8wMPE8MDoiucJYYmp6+7B2xc
	 MYf0i9ZAxZKI1bEHck5yw/Va82BzK/jh94IKDEv16QLgIDvX4d2JlSsZM4UhZXlDBZ
	 8QLlMd5uDkyw5bDLYbGyDI7kPl+AKFCGrFHwAFm9jldNo/XbHj8F2osiIat61FvuSy
	 i8qlOMhpobTUaHI70dT9LHku9JL8BI94ptfvtHf2Qxmkvbyrc3JIZaLFRZ7tSP8fL/
	 4ry9NDaQygBR9avpE6eXvlLgu70npYTA+lWY+dHNokQ/tnXVYv0PyfZoPnqIQMbQq9
	 AZPkO38+uQZdA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1svwBm-000000004uw-3Tgb;
	Wed, 02 Oct 2024 12:02:34 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mukesh Ojha <quic_mojha@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] firmware: qcom: scm: suppress download mode error
Date: Wed,  2 Oct 2024 12:01:21 +0200
Message-ID: <20241002100122.18809-2-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241002100122.18809-1-johan+linaro@kernel.org>
References: <20241002100122.18809-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Stop spamming the logs with errors about missing mechanism for setting
the so called download (or dump) mode for users that have not requested
that feature to be enabled in the first place.

This avoids the follow error being logged on boot as well as on
shutdown when the feature it not available and download mode has not
been enabled on the kernel command line:

	qcom_scm firmware:scm: No available mechanism for setting download mode

Fixes: 79cb2cb8d89b ("firmware: qcom: scm: Disable SDI and write no dump to dump mode")
Fixes: 781d32d1c970 ("firmware: qcom_scm: Clear download bit during reboot")
Cc: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: stable@vger.kernel.org	# 6.4
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/firmware/qcom/qcom_scm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..e2ac595902ed 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -545,7 +545,7 @@ static void qcom_scm_set_download_mode(u32 dload_mode)
 	} else if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_BOOT,
 						QCOM_SCM_BOOT_SET_DLOAD_MODE)) {
 		ret = __qcom_scm_set_dload_mode(__scm->dev, !!dload_mode);
-	} else {
+	} else if (dload_mode) {
 		dev_err(__scm->dev,
 			"No available mechanism for setting download mode\n");
 	}
-- 
2.45.2


