Return-Path: <linux-arm-msm+bounces-41039-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA409E9305
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 12:56:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B568287396
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Dec 2024 11:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3098223702;
	Mon,  9 Dec 2024 11:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ml5HkllS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB7A222587
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Dec 2024 11:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745391; cv=none; b=jFpCINCZPJsCw32ML51qjOx7VQzPKIbPoj721ReHv2S/xd7avbW6BXuzb9qwIONyh/CpOrbSWCwa1pw4t4TJdfy64aVUk+XGQZW/0+wlcmFLnCtlMkltMhO5ZTiam6ARSlFEUJAyt3ZN0eEOgupmHR0CiDMSePlZttmduGLFGsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745391; c=relaxed/simple;
	bh=ysL6WTjrVc7FAA8tQN5UDR36z9EBcMk7yq8nQKkF4tY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eNb1xQiuGGcHsjUPqTCBBwrpIetyifWbAUhx67PQvnjiuN/VnqEwsesWxP6jR4Mypx93ygAJq4GH2TCfv4Dap66AgjyvJxIw1SOMA3qiH7AB9t4Yt0xpKQ8aVMrdAROvABEUTg9X6al1u1g4OtmqYbmkX67vL24AFJ80Icy5GFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ml5HkllS; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3ce64e7e5so305159a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Dec 2024 03:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733745389; x=1734350189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8AVtYyZc/IWaDoxx47aL1vyovDYySo46TxvDoofEG0=;
        b=Ml5HkllSsKML3UxIRbTk4t0xHlRkRt13oMa0SYnOCcdDcNEw48N6rKOGaGBmESGfl2
         MXwk0RznV+JG3tp0J0ExxBG4OEHbYXMkIw6lFSAtF9QBNpAms4ss6G2GHOYo+QEvWWdN
         vFFMZ+vgX0+5yKONr9P+ATEA5cLnUJiimvqeo0TWko4l34sO1I89bDelrbM7/4p2yZ2a
         Dvggz71W/2I2PA5FMfiXcTVtr2BCnGnEn2Rbpm9q9prSOE7TgHZup66xIQxCiIptk2rl
         m0N+hd96yyEaVzyWm+js7NkTo2NdZ2Sbs7a8Zrt25IdGWykNwHmgEmV/zkVjhRNUL8tm
         fj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733745389; x=1734350189;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o8AVtYyZc/IWaDoxx47aL1vyovDYySo46TxvDoofEG0=;
        b=fL7Q4MqKAX+BjY6nipSdR1hG6sAlLl6iT7C3vR4OhOZPANqzhhxms3jxp9aOK25KpS
         LjZ+WX+u/0/qYezHu/FN5g8XyZO/0LCrd/Z1xiBab07g2CfpsfdcEPMfLc9ayHNiiEZ8
         gcVj91G8XodiS5+/5m3zV8oS9Uss9vkcUbY1gn0DMxRBHmKfFGdSlaJbSjojM6FiLLqG
         VTkvayokls51lwJI+0MtPWrEm2PZaq5iplfQcB30sQUGRH5QyOWFo6cPViB/ZVsBPcuQ
         0vW5PRByTFp7GECiI8e51hGSw8PFWB5LIa83IGmZffORda34UbPbyStyV0Epu/96BDzD
         oxxA==
X-Forwarded-Encrypted: i=1; AJvYcCU9g0zfCOrl0yBWkg2uU8MJg0wmXjbazuzQt8bli2hFSol5N0PTd16HEeIsb1cdk1Az5b2Mf0P0fWjC98RC@vger.kernel.org
X-Gm-Message-State: AOJu0YwVdK1OWY9+OBq4x2dNBIyYXfk5ttImKPZ+C1Iby4oQfOruTW2F
	A1cdkc97xosUeMNGIAu2CmlHvX9l0lrl9NHlVhr4soEBto6F8eL1vVmTeyiOMyvCA4lFNNPbltC
	S
X-Gm-Gg: ASbGnctvmMMzsCYXMuy5fksMiJJwQyr83qBXRkYP4pbd6RYt1dfyIM/Fgn7lCluGwAK
	wFS/q5++hRBHj76dolhvXkwU4adLkY+Gy11AUnXyoGIEX3Oa9sII2g5qDTUIP/EpfkGBUlLTgq2
	0m79wJNwu8ZhW/D4H42cWkRWqgcBcIXogWROD1oXy0nGyRt5LZn0qR9auBLAWpNy31XgyZpcrFd
	f9f15Bk/XFNbqFdZVCv3MbOf2jaHdLzix5va8aAv1OFFaIQVZbauSLFLBO4PteV
X-Google-Smtp-Source: AGHT+IFbt50n/X6rA/A5IzwmfbG39lpIfZK4JXG7TIUfY7QQd4Ox9JNG3Mk49+rANy/9rD2YAGFw6w==
X-Received: by 2002:a17:907:2d27:b0:aa6:2d35:243b with SMTP id a640c23a62f3a-aa63a025088mr531709466b.3.1733745388194;
        Mon, 09 Dec 2024 03:56:28 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6651c01c5sm343333766b.23.2024.12.09.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 03:56:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Gross <agross@codeaurora.org>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 4/4] soc: qcom: pmic_glink_altmode: simplify locking with guard()
Date: Mon,  9 Dec 2024 12:56:13 +0100
Message-ID: <20241209115613.83675-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
References: <20241209115613.83675-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify error handling (less gotos) over locks with guard().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. None, previously here:
https://lore.kernel.org/all/20240822164853.231087-1-krzysztof.kozlowski@linaro.org/
---
 drivers/soc/qcom/pmic_glink_altmode.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 463b1c528831..bd06ce161804 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -5,6 +5,7 @@
  */
 #include <linux/auxiliary_bus.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -114,7 +115,7 @@ static int pmic_glink_altmode_request(struct pmic_glink_altmode *altmode, u32 cm
 	 * The USBC_CMD_WRITE_REQ ack doesn't identify the request, so wait for
 	 * one ack at a time.
 	 */
-	mutex_lock(&altmode->lock);
+	guard(mutex)(&altmode->lock);
 
 	req.hdr.owner = cpu_to_le32(altmode->owner_id);
 	req.hdr.type = cpu_to_le32(PMIC_GLINK_REQ_RESP);
@@ -125,18 +126,16 @@ static int pmic_glink_altmode_request(struct pmic_glink_altmode *altmode, u32 cm
 	ret = pmic_glink_send(altmode->client, &req, sizeof(req));
 	if (ret) {
 		dev_err(altmode->dev, "failed to send altmode request: %#x (%d)\n", cmd, ret);
-		goto out_unlock;
+		return ret;
 	}
 
 	left = wait_for_completion_timeout(&altmode->pan_ack, 5 * HZ);
 	if (!left) {
 		dev_err(altmode->dev, "timeout waiting for altmode request ack for: %#x\n", cmd);
-		ret = -ETIMEDOUT;
+		return -ETIMEDOUT;
 	}
 
-out_unlock:
-	mutex_unlock(&altmode->lock);
-	return ret;
+	return 0;
 }
 
 static void pmic_glink_altmode_enable_dp(struct pmic_glink_altmode *altmode,
-- 
2.43.0


