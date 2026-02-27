Return-Path: <linux-arm-msm+bounces-94443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OF1jKgGLoWnAuAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:16:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E7D1B7006
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 13:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1E13053758
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 12:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595593EFD1D;
	Fri, 27 Feb 2026 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzRcRPEm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CEF314A82;
	Fri, 27 Feb 2026 12:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772194524; cv=none; b=nhyLpd1JS33J7UKU7xkBZFJl2buo/aVI9E4PHSZhDyuP7MqrzWVHUTAzgxGa/eyGvhQlBjRc4omaZncbIRjMjNbIcqe+niRGhb8jSTqcQruU5p3F2k794F7C5MISUrEdKT3P+6MOUKYSLZ2aIkgKPqSaUVfEuanC9TTsxIubd/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772194524; c=relaxed/simple;
	bh=Kp/6lkWbg3O04fl0koFZL8KFMxktWU6gMmkhxXzux6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=p8zaSH5LOrT+2ShEJe7YWpHtRiDO3YpOpvxiXGPQBMIDScSs+wdlxpsz/xeloMcpwyg7P1GYcPiXkeVHoXQmqfr6deXTPEySGeTpoDVQNDK9M5Yb1AwHC/NdSG1dU0skVuu7StMo7+Fk7RM+6EXtyJ6aee5qMZEv0Kts1n+9TIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YzRcRPEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F08B1C19423;
	Fri, 27 Feb 2026 12:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772194524;
	bh=Kp/6lkWbg3O04fl0koFZL8KFMxktWU6gMmkhxXzux6U=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YzRcRPEmYbgc0xEA0PyVUlSvKcSzylZ2Q/A7O/CGzctO2axQYsDpcWJsVd9FZMWOJ
	 BpiwMehlBHjBB420Xnchs8/LbxxcCwoYwy+ZMauxNVZdofc7d6aBupaLgAy439Nboq
	 vbHuT99niIyN/bTgeC5qx8Ms1TjmJOwzOQfYFuEaLNRmbrH3i2uQPHXbDaUqs+ZHDa
	 mbCeRX3f1erj/8KXutwtMbpDIqopJSErbzebJM4DPuPoE/QPFeNffQt9jLfb/p7Sv9
	 kJfsUxMWdaL8zdfmC6DjlnXqVA0UubyE055hI5jkwj6Q/ai8aPISpd8XvcJOPyKawe
	 CLnOelGd1t5lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E26E1FEFB45;
	Fri, 27 Feb 2026 12:15:23 +0000 (UTC)
From: Xiangxu Yin via B4 Relay <devnull+xiangxu.yin.oss.qualcomm.com@kernel.org>
Date: Fri, 27 Feb 2026 20:15:01 +0800
Subject: [PATCH] phy: qcom: qmp-usbc: Fix out-of-bounds array access in dp
 swing config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-master-v1-1-8d91b9407fdb@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAMWKoWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNz3dzE4pLUIl2LJEsTi2RTM2Pj1EQloOKCotS0zAqwQdGxtbUAVve
 n8lgAAAA=
X-Change-ID: 20260227-master-8b948c5633ea
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, fange.zhang@oss.qualcomm.com, 
 yongxing.mou@oss.qualcomm.com, li.liu@oss.qualcomm.com, 
 tingwei.zhang@oss.qualcomm.com, Konrad Dybcio <konradybcio@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772194522; l=1203;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=pdrpH5cTTs+ijKgI12OITbrW3X2fkvMKZRJEqz9UHyo=;
 b=MCp8ELqBe4xNj0zEqPVDUDfiJUGcLcxa4ZPNWTAC7dcq0ZgPqU1gJXVl+HmIE/g0m5C0W/gzt
 r50BRSiilyaCI5SXfWmUohtIIHvcugL/WhmjrgXKfLe54Ft6bn1VKJH
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Endpoint-Received: by B4 Relay for xiangxu.yin@oss.qualcomm.com/20241125
 with auth_id=542
X-Original-From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Reply-To: xiangxu.yin@oss.qualcomm.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94443-lists,linux-arm-msm=lfdr.de,xiangxu.yin.oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	HAS_REPLYTO(0.00)[xiangxu.yin@oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:mid,oss.qualcomm.com:replyto,qualcomm.com:email]
X-Rspamd-Queue-Id: 24E7D1B7006
X-Rspamd-Action: no action

From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

swing_tbl and pre_emphasis_tbl are 4x4 arrays (valid indices 0-3), but
the boundary check uses "> 4" instead of ">= 4", allowing index 4 to
cause an out-of-bounds access.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 81791c45c8e0 ("phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY config and DP mode support")
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
index 14feb77789b3..0dd7000614f4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
@@ -794,7 +794,7 @@ static int qmp_v2_configure_dp_swing(struct qmp_usbc *qmp)
 		p_level = max(p_level, dp_opts->pre[i]);
 	}
 
-	if (v_level > 4 || p_level > 4) {
+	if (v_level >= 4 || p_level >= 4) {
 		dev_err(qmp->dev, "Invalid v(%d) | p(%d) level)\n",
 			v_level, p_level);
 		return -EINVAL;

---
base-commit: 7d6661873f6b54c75195780a40d66bad3d482d8f
change-id: 20260227-master-8b948c5633ea

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>



