Return-Path: <linux-arm-msm+bounces-82982-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB20C7D604
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 19:50:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AF233A14ED
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 18:50:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 922CB22F388;
	Sat, 22 Nov 2025 18:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/f4qhMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3961F37A1
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763837413; cv=none; b=TUVpqd1cXPcju+sDAqhj7+JpgHa/uuZZDPp8EcYDMhYNpaNudQrNryenBk5e0El3Oi/uaKBcqX8V42bmCvKVJ5gnu/Nft8ebuilz9NofxjZaTf7qICGIMQNrU35cfyRvpK28LgyycEulO/1xzHdydttVBbPvyuKGqKJR7l3jaao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763837413; c=relaxed/simple;
	bh=EpucUUr6+JapJBZmrTFAng/xqEIN+aULKRSMhV3h9Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dfKo4pkAONCag8WB3xOW84+Xdsc/o+X6vMlPin6/vDZiwDUKn8Q1ljx6hQspR7rHJxLyHTUrhA9YtK6xP1IM2rOVT1AWNfmZ/DQCdQAFATjvE/Kf+ZLpgDlEwKeRGDjwvkAYDu5rGQVeoZEStl2mDuaByYaS+qiEc8ECmZ7e/Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/f4qhMr; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47118259fd8so26719255e9.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763837410; x=1764442210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rJ8y42NprNFMBfVavEZyzrfZZtf4tjZ19hVBv6BlKNk=;
        b=P/f4qhMrjROv09nU9D9MpifLkiTQdy2fbAvfyuwCkfvZ2nHNCmzMmGmxxNgZ/N0m65
         th9c2MBnPUKcqWxz98fOquIE/CtTat0uX23cVNA8ZZbWdhceVOywJFY0GiRWPs8QIbQ6
         YnSzyRp+WF/7ykIOg+geFAiL3QzRcoxpc3yd+6p/9mfx8gwt2pk7B1uwT7K8LMjj2Uzd
         dOheVJ+dwbohDdxBD0FcVC2Xlne6vp8dHMs8mHBsXWo4G7XlI7BXYUNil3RWcFf0qszq
         QBeZ2IFDzmtO+ciL6Nj0O85MV1dTQtBKThtHaRi2HJFk7huxVpVVlcplFtYqCxLCgi0H
         RKZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763837410; x=1764442210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rJ8y42NprNFMBfVavEZyzrfZZtf4tjZ19hVBv6BlKNk=;
        b=bfES/mCH+ETOfy0/0cC62vgAC2Fmp93IyVvC2WxH0/08j+YKNzIRlEQdoNC9YVSLrv
         HgqJElbWhboHmt5veSkIG9zZ5ycygPmJuOiQ0fmQYiDX/85TVl+pu6l65jeHV1XXtxZA
         w5g2NDCjG8RT6xjDvv2meTm92KtAJbp97/rqJwss5OJ4tOdfLuDqI+9jXzlCi8PqxMDl
         LLmS7Be4ne6C7VYVJrYUTsJgjd5xBxcppQ7F0mb2sBFMVwhGWb8Tv5mVhBvldK0jgrxG
         lUMOqqblxnAqveXyXVKdTv2NM9z+u70PJvRUY0w03apWgYyKJj/8escIFKVcfo5aRcAQ
         wXTw==
X-Forwarded-Encrypted: i=1; AJvYcCXwIQQagelOjEor/SdQ4Z+UZp4GSui2IbXlnGiWHlUf5hDUnMpktufhitLjKaXHRhyIDVby8+yfWrH3I8zI@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2WcQ8rM5ptu1j3Ao51tmDiATR+4L/LwKLY7KxX3ojHmwLwK7e
	D4szMsZgknzQ2HWYFqT1XScyv+3S0VIQqAJbX96uODOLrIaZeaWu38RV
X-Gm-Gg: ASbGncuudpLnd5G4SC/8BDSf/YQcwxtrR+5px0ZMg2QBEHPscwH/tIbn/fJJFy993dn
	yOI8RxLAlF7qyfaJReiL7HkAxYTUP68ntFq9ImPysfhdlWD32o03gtmMI5g33P6fBIPxq1KGGrI
	g1NvIaepNxaZGsJ8GX3hfHuvTHOhVduX5C8DELRv16ejqJVygSXNVm2ZFx9AEYR2jaz/lL7jUg2
	nkZL/mlJnHj65DrdbTXoRvpObyFi+ucDk/lBiphakxOCym2pqRTNDwRRI7/yzI+k/RNGz06l5zB
	eYoclVg3ATEAeZ6PBkqUNY9XCs/8T8yDhpxGdwM6VdfcIiN/5s3gWI6PoQB1G0CLLNArlHFQJdk
	WoCPXqCU0d7IW8uNA6yJQ3/aJGlhQVOgjLoNFXmFV31aCMb2hLBpBPbv+UgU3VDEMOXFf878HDg
	D9T2L/FuFuzlosIOXYXfOL08u3syc2UuiWY/vEGW6u
X-Google-Smtp-Source: AGHT+IGJZpqmDfN9eSIBxSbiBA4I0WL4OE97LxOUVQMyn5cFkeQv1kE0+aXZFfEqYZD5CZsk+7fnIQ==
X-Received: by 2002:a05:600c:1994:b0:477:a9e:859a with SMTP id 5b1f17b1804b1-477c01c0073mr59371525e9.22.1763837409879;
        Sat, 22 Nov 2025 10:50:09 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-477bf22dfc1sm106733955e9.12.2025.11.22.10.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:50:09 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2] soc: qcom: smem: fix qcom_smem_is_available and check if __smem is valid
Date: Sat, 22 Nov 2025 19:49:56 +0100
Message-ID: <20251122185002.26524-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized
state") changed the usage of __smem and init now as an error pointer
instead of NULL.

qcom_smem_is_available() wasn't updated to reflect this change and also
.qcom_smem_remove doesn't reset it on module exit.

Update both entry to reflect new handling of __smem.

Fixes: 7a94d5f31b54 ("soc: qcom: smem: better track SMEM uninitialized state")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/aSAnR3ECa04CoPqp@stanley.mountain/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Drop unrelated changes

 drivers/soc/qcom/smem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index fef840b54574..c18a0c946f76 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -396,7 +396,7 @@ EXPORT_SYMBOL_GPL(qcom_smem_bust_hwspin_lock_by_host);
  */
 bool qcom_smem_is_available(void)
 {
-	return !!__smem;
+	return !IS_ERR(__smem);
 }
 EXPORT_SYMBOL_GPL(qcom_smem_is_available);
 
@@ -1247,7 +1247,8 @@ static void qcom_smem_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(__smem->socinfo);
 
-	__smem = NULL;
+	/* Set to -EPROBE_DEFER to signal unprobed state */
+	__smem = ERR_PTR(-EPROBE_DEFER);
 }
 
 static const struct of_device_id qcom_smem_of_match[] = {
-- 
2.51.0


