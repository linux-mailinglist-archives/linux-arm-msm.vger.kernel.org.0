Return-Path: <linux-arm-msm+bounces-29294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E969E95BC61
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 18:48:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0861D1C209AD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Aug 2024 16:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B589A1CDA1B;
	Thu, 22 Aug 2024 16:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t7KJNCXw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28DB38F9A
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345302; cv=none; b=obEcf/DIX1meL/9VwHZniDDCGDKbjUOWV+84pKmAj/WIoiV13e0kotbRCCVCS0a8fVrFTSnoJZ4ArKoR7Fman5eZUw+PeX4MPX3r6r+U+13MCs0pjWcPcRfDUZOLW4QWoFTCfi7Dy5Glz+5N5ZmTpm3MQLErAGfQkqWfTOHnacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345302; c=relaxed/simple;
	bh=W+yhKt0K2YnsfpUxEhT3jP48r1wVmHPtyOlbX9EDfcE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWPgOrBzM2OnwAdR9bev+JHC7ceGEh1baUTm+wta06S7b9Hh3XmdaBGgNeJq4Kl6+CWzsJsJ24QXbjYZBtXQymuPMP2ZB5bvIdY5EU/KP539spQXw2iY6JtJBsjI1LOMQSjKzucua7ar2BEzkTjWuv/sLo+HjPiS20iNoh6+ZXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t7KJNCXw; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-428e09ee91eso1403515e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Aug 2024 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724345299; x=1724950099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+oILSwqOlp1bdPHfMP4vxny2FOaT2vijwwCTJAp5jg0=;
        b=t7KJNCXwolIMgk1n1Jr+xkmDttEGeV0CIDpKRpJNDnC4qlFKRA7NTxAPC4+zXuHlaK
         qoucLEHiXa5ma0oMNJXjzwLEznrXclTtLSIZo525BtITU3OiEiEGuV9EeQKFoSqtA/G5
         pRE/BNMQGSH5cMrgHVhJBvfWndCy+vFNA28zs+fxnVXjy1Rboz657Nm82HTbV+bwmA9d
         5kspDj2Yj+3Qp2/26lwTvc9UfM4OiCc2RlizeUY0sudxXUSTUPstp+9mM//9p1dQGjPD
         lIfUWirY/cAqNn6Rcg7jYhMNhYB72m3YlxEbPeiND9dbpFdWTwjDZlUDyomFbiWTGyjc
         sXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724345299; x=1724950099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+oILSwqOlp1bdPHfMP4vxny2FOaT2vijwwCTJAp5jg0=;
        b=TWuGPur5PGbWaxcc701IThYWgsS3Ypk3QxZWkT5XOnwLL86kZSrJjSKGcvaNR7DvUT
         yYhfS3Sa77gzo0lC8A5o8TM5eM2iLZF+5VPscNVA/s7Nuj0NUMrxrnjSegVi1LKX/Evr
         aKDM9OWhxeyHoYe25IvmCk2Tufxn7LhQx7RiY4j3up1w33fmuvmC6qcS3xy+OqqLkoPB
         1hAWmBXHuPcMI0HjtPjHVssHVhomHf2DYfdP0753GMbWlfcaGl/SojntmUSW8/D0Cvw4
         3MZsu5f3PV7ys+6mdWndQ3hAbYu8Hdevj/kDBaNvDkwJiSKybPccSyS9/yIkY0QR5+dn
         KBYw==
X-Forwarded-Encrypted: i=1; AJvYcCVGwqNsff1S0AHJYgrsM9ria67VBg9wQXYoWmrxAm0OLJSW8BBNWHXZ1oC+qD+qVtZoWODzYOUbRwrHLBcF@vger.kernel.org
X-Gm-Message-State: AOJu0YxuhHhDk67o97P2Qox8rWcj76az7zWu+nIFkQFXxZdo0DS2QBuX
	LjrkXFjYd7UQI/+Yn59OEWoImGmwok7/dNQqBpvM8kH1v052+Jmt+JsQhHENDqo=
X-Google-Smtp-Source: AGHT+IFQK9BFp8WZQ2dHiYAJunbO3nUd6mwUMRCTPG+YPkZQ6xmuIam6FqpLPHkNWB94UH9ETgCd4w==
X-Received: by 2002:a05:600c:1c8b:b0:425:65b1:abb4 with SMTP id 5b1f17b1804b1-42abee8bcb6mr26258155e9.0.1724345299173;
        Thu, 22 Aug 2024 09:48:19 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730814602asm2073890f8f.44.2024.08.22.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 09:48:18 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] soc: qcom: pmic_glink: fix scope of __pmic_glink_lock in pmic_glink_rpmsg_probe()
Date: Thu, 22 Aug 2024 18:48:14 +0200
Message-ID: <20240822164815.230167-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

File-scope "__pmic_glink_lock" mutex protects the filke-scope
"__pmic_glink", thus reference to it should be obtained under the lock,
just like pmic_glink_rpmsg_remove() is doing.  Otherwise we have a race
during if PMIC GLINK device removal: the pmic_glink_rpmsg_probe()
function could store local reference before mutex in driver removal is
acquired.

Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. None
---
 drivers/soc/qcom/pmic_glink.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
index 9606222993fd..452f30a9354d 100644
--- a/drivers/soc/qcom/pmic_glink.c
+++ b/drivers/soc/qcom/pmic_glink.c
@@ -217,10 +217,11 @@ static void pmic_glink_pdr_callback(int state, char *svc_path, void *priv)
 
 static int pmic_glink_rpmsg_probe(struct rpmsg_device *rpdev)
 {
-	struct pmic_glink *pg = __pmic_glink;
+	struct pmic_glink *pg;
 	int ret = 0;
 
 	mutex_lock(&__pmic_glink_lock);
+	pg = __pmic_glink;
 	if (!pg) {
 		ret = dev_err_probe(&rpdev->dev, -ENODEV, "no pmic_glink device to attach to\n");
 		goto out_unlock;
-- 
2.43.0


