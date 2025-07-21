Return-Path: <linux-arm-msm+bounces-65902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDCAB0C558
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 15:38:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C62824E0DA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Jul 2025 13:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFBE12D877F;
	Mon, 21 Jul 2025 13:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="4Leuf28K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425B51607A4;
	Mon, 21 Jul 2025 13:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753105093; cv=none; b=KoyLUw0B/xc7GtGLRYisWE37hgxP5ah69q3mtDSF+L4crbD0GZ+bMhFROOJ610HiWtk1e4ie/0YwbIinYIuMzuvIG0yQ/ZVESMl6T/6bzpAGZO8FXc+oyWo8YwZH4W3Zx6v92NbVHohouiRBi3l0qE/7gsdIiwXsnXqPmY2zvcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753105093; c=relaxed/simple;
	bh=PTfC7sJ8FlcEda+cLpOvHwVKJ5XjjiBBOVKAIJ9zp70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EjM5pA+wsgwP/1PA7AykEkzHv597wmT/NqIj1sXoP6fZ2U9FqOF+LhKUSeNMTiUv7uCwmiJIBR6RZlI2BltXZJq/cCDnjPCU3j1UOdp9/IOM0si19gJ0ia57e7+GPwAGkGcoD3uFpNbO4vSyDuf9eo5wGWvKqFTsde8EqoEJEso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=4Leuf28K; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1753104492; bh=PTfC7sJ8FlcEda+cLpOvHwVKJ5XjjiBBOVKAIJ9zp70=;
	h=From:Date:Subject:To:Cc:From;
	b=4Leuf28KGwMoyyhUSJi6N+dBRuVdTBBZbLVM9yqJgibHeVr09FQXijd0k6fBkZj10
	 v+KJ6Nqq/hTbseYYDSebiYstnuoxu+M/FjdhdlmkJZ2WP2meZMqxLDdTla5Ko45M+N
	 PLA/eH/jWtbFHtjbvGm3qU4pU5VpuSnb05UI82gEYMVWOnGqG7tsVUMCvJZ54F/5GK
	 x8+2ibpBICOdZ6RdDfG7jSGuTyoD7aNnE3fwbIeShzXz2HvBj9lhP09w3rNrzxMsrs
	 mXjKGhlDMvtHK+LW+2gGA7JpLRDgI4RHTpfjo8hbW96DhZL9Ev43leStpo/zqGMwef
	 n/hk5wB3iflUg==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id E06C59034;
	Mon, 21 Jul 2025 18:28:11 +0500 (+05)
From: Nikita Travkin <nikita@trvn.ru>
Date: Mon, 21 Jul 2025 18:28:03 +0500
Subject: [PATCH] firmware: qcom: tzmem: disable sc7180 platform
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-sc7180-shm-hang-v1-1-99ad9ffeb5b4@trvn.ru>
X-B4-Tracking: v=1; b=H4sIAGJAfmgC/x2MSQqAMAwAvyI5G0iLreJXxEPRaHNwoQERpH+3e
 hyGmQeUk7BCXz2Q+BKVYy9g6gqmGPaVUebCYMk6aq1BnVrTEWrc8PMYaPbeUWAXGijVmXiR+z8
 OY84vamTaS2EAAAA=
X-Change-ID: 20250721-sc7180-shm-hang-a0d6650ae5a4
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Nikita Travkin <nikita@trvn.ru>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1127; i=nikita@trvn.ru;
 h=from:subject:message-id; bh=PTfC7sJ8FlcEda+cLpOvHwVKJ5XjjiBBOVKAIJ9zp70=;
 b=owEBbQKS/ZANAwAKAUMc7O4oGb91AcsmYgBofkBoMWbYmhpNIkmtGdmtz8XfW7AJzHZ2amyEn
 mjOgQV8USuJAjMEAAEKAB0WIQTAhK9UUj+qg34uxUdDHOzuKBm/dQUCaH5AaAAKCRBDHOzuKBm/
 dXaCD/kBUeELBuPLZHG8o5xG+lkHMmmTMt8F3A+sMdZvXX0DlrAFhqPywsLZs6b7GVhBHWlDYSd
 32mHW+9vfhi8lllcdfa6IEiY9l/PbNQBdJQFZ8SpR/mmn9/oQ178N2ddcqzJFM6UGIH9YOv65YO
 W556HEr8OLFYHtnEitkePAkcROjJZmfCxM1E49miz94AoYI4O4NgW4Gk7tlqaH690Rj1oMxar/f
 vkq9ftkcVP3mrMb9II08B/zTceoUPIMknta8T1ZASuvUMIc691ZQgV7dffbtXXT/u6Ks3XDPXlK
 4Clj39reT90psjzT27wHbrTZJFZX0X1n2g3GvL6MJ6rKcXZ7+Y/tkwo2bhCanTGzk3XAOPHAWna
 1zE9IMjjJIEoqloJjQIk67CO49/JFcHbmIENvNHJNTO/bC/opYwgfusofPD6kWnQXiFQLhBDpqn
 jfqDmwA1+Plx86AmDQkrkB+V7IcT/O+kMNrjvg2ShiTT6RRo1UWIQIldV7wQrRdT9+PE3VR+kdl
 NyFXgTZ6nQOAiW4Ab8oRcWKvS6CY+pHlIjwSj3pR+QjCxXvcQlZL5t1LCi2cRKhWy28iS3phNMN
 DFXAFQohr2EtdhdRlQRWob6Cbb+ZBuN+h+3+okexuGuZ4SznIfiavh6HTCQtw1vx2ikEVfH/QzL
 LdoiLiONfvFMA5w==
X-Developer-Key: i=nikita@trvn.ru; a=openpgp;
 fpr=C084AF54523FAA837E2EC547431CECEE2819BF75

When SHM bridge is enabled, assigning RMTFS memory causes the calling
core to hang if the system is running in EL1.

Disable SHM bridge on sc7180 devices to avoid that hang.

Signed-off-by: Nikita Travkin <nikita@trvn.ru>
---
 drivers/firmware/qcom/qcom_tzmem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index ea0a35355657064b1c08a6ebed7cfb483a60dd3f..12e448669b8bd24ed312d0aa7b6a2b0042f762de 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -77,6 +77,7 @@ static bool qcom_tzmem_using_shm_bridge;
 
 /* List of machines that are known to not support SHM bridge correctly. */
 static const char *const qcom_tzmem_blacklist[] = {
+	"qcom,sc7180", /* hang in rmtfs memory assignment */
 	"qcom,sc8180x",
 	"qcom,sdm670", /* failure in GPU firmware loading */
 	"qcom,sdm845", /* reset in rmtfs memory assignment */

---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250721-sc7180-shm-hang-a0d6650ae5a4

Best regards,
-- 
Nikita Travkin <nikita@trvn.ru>


