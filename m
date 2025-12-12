Return-Path: <linux-arm-msm+bounces-85099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FCBCB7AE6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 03:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF73D3018195
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Dec 2025 02:36:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669EB21ABD0;
	Fri, 12 Dec 2025 02:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcZ1Ru80"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08AE28B407
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Dec 2025 02:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507005; cv=none; b=eUa27+3YBGmu8PQBezf5LKXOlfGIit3kvE7L0BH0DYh/+OjC/grq0jlXZHkQEzPm8qjRSq6C9bBDShzPc/Q7fCEmiAcD1TMLvJh4i/zUeWrEUML0/r4lP6g3BqsMNs33EW/OxPqiB5trVl72Ahpc5HFcdRWT+Z/QVuoqmzk/7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507005; c=relaxed/simple;
	bh=+UMIRGyEaDOg7Z6a74YWGqvXA5YJgGoWkHgwcr9g5t0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qaz23cGlkHDaslOT+9je+atKPLriNCWaCtctb4H4jH+bSlLcoYWU22j9qaryWJ+2+/bHmng3vzpX87pNrPYEIjil9rVa+w7ulv8AZ0tgx6mTd0snuUPo3z7tz9P90d2u/7wdLQHw2Wvcr752AmL6yJkUBw7/7D3dQ9olHF5Rohg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcZ1Ru80; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29ba9249e9dso10186815ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 18:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765507003; x=1766111803; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wHyDWXJS1dYRMRLPXJEjRKGUHRWYa5zNTZYp4HuIOZo=;
        b=UcZ1Ru8062C140kByFqLUbFgRkIvwd0QEvPd+9hyO61ATGvA4BJKIqne1374eOWwN9
         UTB3Utt6yXrudjyVEcHZ2bDuq8hOpuQnv2kUgc4tOOSyEClweq4IyWszImS7Wm6PjirQ
         zePnCxATvycvuE08zJBBzSXyZGd/KPoUCvc54F+NlozZm6eSbfpOnLXufBsaMQ1GA4Ij
         yVRHzCD3zYGRrXWL6t6F8LUbD57NToCiqBIPnOVeO0dG4ib8pqNeybnSiw73ITAVSVYS
         92V5Ik4l4+hJs+BmvmKBRTcKUYlKZsUBtfSY0NwF3XCiuu9pW2VRnK42gc9TUGnxJUQX
         67Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765507003; x=1766111803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHyDWXJS1dYRMRLPXJEjRKGUHRWYa5zNTZYp4HuIOZo=;
        b=pJ5xmM7zKW0Gl8x+2kJUI8RfcwNLI6fpg+vx64N4+jep8gS8ucwgdIyQi279Zul3UM
         YLc3rsAsSJvNqtbLo36SRshC8HLobCjF4Ka0AEYjrjWnmzhSGRRXLb3InO3+NPwERzb4
         oKdpYRdbPeGDDRWwmCCgor4Nim2FEtl6Wpe2OG8MSFjt/C2ynzrxZqAt7zZXvw293/mU
         rT/jQtlNFY+8GSp176T6MzUcWhWKXClTxfr3kYwwNLfL9jCD2uhl3HIE0v+44xqfltG6
         eR/40Dy5rEu2M8dT/Opg23FNwkRzxvyJ6bRAkwAjsVQfIGuMpsYCpjEwV+uc7pVW/uPP
         snCg==
X-Gm-Message-State: AOJu0YxQQBpe9LQi2p0rR0wL5n5D9zQXasui2E2xxH9q1xlz2n4PJe6+
	MbkkNKXEEOT2qMPfS+N7SjfqM0aNrG/uFWbDZ0voI09ew3TiKjaWgPZZ
X-Gm-Gg: AY/fxX7BklvGYHRJ9jXQlh+XK/j5GGqVL4v2vmOKUkcamWH+z/bX9NRpFzGUo4cykjX
	/ahs2akor6L4kvmpWX9biW906Y52rjcggmjJsCdS79kMqa6AwOCv0s5jWVffF+jZrh0QhcmXXUH
	Wat/AiXYA2t8rzATzC6yiHBUJbxy2Bk/ZYNCnJRVD0lgHrXYKOOdY7QpLfDiH+KZvXQrElcElko
	B4cI4ODDs17Ol5foZ+HkStuk+exOA0Duo63rof/th4Tq4NO4W6oJ1FJrJD8O0p3O//zb/CQh+Fg
	41XP1PhImP6YW1XIXnUA3tMukEQ1m4YqE04TTVJyHDVzRmIf44+mNufm0/YwvLg7B3xZxkb+ikd
	V5Aemwe8r+7QmEf6ICzjD9tRLo2xn05C+CTO9mtfgtNA0sPeuWAqOZb8FwnEAAGTU/kTw2hRJ4p
	TQpHM5wa6WtkCpeNcfT+jOgrT2r+Cfv8w=
X-Google-Smtp-Source: AGHT+IHylSX8/XJ0GRaqC87xMDRsUvyLdmoKBi+alSFRxDBWVUP+sqhwBMXvJmdOTcHWonKObzdFlw==
X-Received: by 2002:a17:902:d503:b0:295:4d97:84dd with SMTP id d9443c01a7336-29f23cf1db0mr5953855ad.51.1765507003178;
        Thu, 11 Dec 2025 18:36:43 -0800 (PST)
Received: from DESKTOP-DK0S9IL.localdomain ([113.118.13.184])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29ee9d38ae7sm37722785ad.35.2025.12.11.18.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 18:36:42 -0800 (PST)
From: Haris Wu <bymark256@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	Haris Wu <bymark256@gmail.com>
Subject: [PATCH] soc: qcom: aoss: avoid registering cooling for NULL cdev
Date: Fri, 12 Dec 2025 10:36:10 +0800
Message-ID: <20251212023610.13918-1-bymark256@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When PTR_ERR_OR_ZERO points to NULL, it returns 0. In this case, if
(ret) does not meet expectations. Now, qmp_cooling_device_add returns
NODEV for both failure and NULL, and returns 0 for success.

Signed-off-by: Haris Wu <bymark256@gmail.com>
---
 drivers/soc/qcom/qcom_aoss.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index a543ab9be..ac411343d 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -386,11 +386,13 @@ static int qmp_cooling_device_add(struct qmp *qmp,
 				cdev_name,
 				qmp_cdev, &qmp_cooling_device_ops);
 
-	if (IS_ERR(qmp_cdev->cdev))
+	if (IS_ERR_OR_NULL(qmp_cdev->cdev)) {
 		dev_err(qmp->dev, "unable to register %s cooling device\n",
 			cdev_name);
+		return -ENODEV;
+	}
 
-	return PTR_ERR_OR_ZERO(qmp_cdev->cdev);
+	return 0;
 }
 
 static int qmp_cooling_devices_register(struct qmp *qmp)
-- 
2.47.3


