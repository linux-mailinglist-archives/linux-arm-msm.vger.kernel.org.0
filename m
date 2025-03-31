Return-Path: <linux-arm-msm+bounces-52867-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E760A762FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 11:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FFB3168D4E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 31 Mar 2025 09:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982F3187550;
	Mon, 31 Mar 2025 09:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0nRmvIf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293AD1876;
	Mon, 31 Mar 2025 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743412382; cv=none; b=ltCvk9Y+PwiSYB+ye6OkDRIvFLmgg7k/r75OAhlU2RLa8vJV0vh7z5CgqOqy8TLJxZFGwrGtuNeO/6hrVEIxkzWgdzLdNx2v2vHR/s0qWADjs1QsVbnbVDy0064ZplxT6DOVlQmaP3+cPtAoMmIB7pXzyDxUWFmFJ5MHLn+jYUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743412382; c=relaxed/simple;
	bh=1BCnRwBIdCzqQFieKBec6z0k5OCysP5SaPC0p2GcB0k=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i7MU7fy5q74ROLjoAdhid8CK0Qg0sBFPvyJdtvZxU00X2w7pgsFmkK7O59WwGRUbuVe3cg8frxfdKnki2UL7tksqgEkNqzOPNqZrA3Xnu0syf46pGSovok+bAojcaX0I8eT9flIUUMfZjtQ8TliL0SBvn8ZCMNQefmPryih7qlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0nRmvIf; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-226185948ffso82532925ad.0;
        Mon, 31 Mar 2025 02:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743412380; x=1744017180; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aXfa9bgMsQdeUBd20MfPXF0A+XxOPRxIRG+U13SNVEE=;
        b=A0nRmvIfHkJ6SeWACwGrjUWvFyFfnz7xmiwY9G/NBcqHKGMuqOvbrlFfiL4F32khZC
         1WOuHaKA+wJtm2QEHRi+ccbglUALBXWi3o92+ljEAt+3+ntPuexKzf1LA/j6XIIPxi1M
         1UCXT6v53O2flMveixHhM6GYMQ5FuOLHnlpkXybfOw7b0dE4FIXXv2w5LN+/uvx7QaAg
         VLP/UVzs/w9zKz66LBIdsx3gGYQfh4o9tNdUbdjjKIjQoLWyr49iGvYZVZFfaUPZgEkT
         47kXinM5fCe1LW8QfDZ89gnMdlumyMx+YH3Q28HKf3Ig52YxLrwEY2ETsyrKL3HbR+4C
         vwaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743412380; x=1744017180;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXfa9bgMsQdeUBd20MfPXF0A+XxOPRxIRG+U13SNVEE=;
        b=ovz9C2FaSpFOBMF8nqICHHg4FiGdFDmUvk0S5/rTz1yz3vk1wX+fRR7IjnZ9CnZ8rk
         JiSujCldSwbToAgG4QPtf1VRoN+bEyYEuW9WhbEydVZCPAUdB7JrELoE5yO6TaprGBMp
         DerEvllm2XA9fS8z5uWmXjRruMHntLoWCsYynS+GmaHf5iqX7tQTednGwlJ2QAhJz1W3
         Q7Xe/yCsq1toShtMX0pxXhy0cZ51p+v7lYBBx7/RGdDtrNcq+7SBwkg0YwSR0M8AI5R8
         ZTn1dzt8jCnA+VJr4A2W07of8lnrwmqp8fLfNIvuXYPpoEHz9JrNzX/FOTq6LymHROpD
         nWyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNc0W00jSpX2WGbUaHK1ipDAIgc6IEs7Li9k8atTuNf5E9R71+CZbMCXUvnAlg5mT0Ejns0491UvrWeg==@vger.kernel.org, AJvYcCWnX65csOkLnte2SDguMSuKRiFFVDEBXhHKMRlmEeNbU/T07N6TiqpFdujWE8fv9MktuJZAEtKOGOcswpG+@vger.kernel.org
X-Gm-Message-State: AOJu0YxDYytq4pNc6JFek8db6AEd1r77nmBUUn4tF2JV6PzdQcJcnpEG
	v2iOkqV25GlzBoWxbSruum9MQ38XKVJZrRQLN5vCXB537kwyXQtw
X-Gm-Gg: ASbGnctoXiuh69/iqQoWkFl3J0YqUqaYUB6KqOos76Ovxhq/8cU5et6dai2tJRT2S24
	t636kbvm6mHDCqrJL8eLcssfqfiws5Gwsd3cGnt7gopJfECvlQ5Bmvi0wsrvCD2kmfU8aXB7RnZ
	BVFtWX1mziesuew+98KK7Di/HIFzqXrQ9LD+WiuU5T1dmYCAUy2tPYDOIIIZOwSNpn7665B4TAI
	pQgL1PwJQkejdtXKy+ff5soP4PzRgUHcQkLMNrqY+RLuY3q+uPTQebjTkCoBh7FBh1zwS810qqG
	EQbqctmoT8xFwx2lpHNyaKdBbu+kgweBzo/xb9zvi13e5xTVMFggPgtP4mVPS78V0UiNP284cfR
	EyV5ulw==
X-Google-Smtp-Source: AGHT+IFEEh/emvRl57NiK87EmBBBQ4yLrU3pfC0mqT77RnMd2vcNv7HBRIC3yTEMkuLyR9iPqdxvVw==
X-Received: by 2002:a17:902:e550:b0:224:c46:d167 with SMTP id d9443c01a7336-2292f95f1edmr137533305ad.16.1743412380165;
        Mon, 31 Mar 2025 02:13:00 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1fa0a5sm64957295ad.240.2025.03.31.02.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 02:12:59 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	deller@gmx.de
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH] backlight: qcom-wled: Add NULL check in the wled_configure
Date: Mon, 31 Mar 2025 17:12:45 +0800
Message-Id: <20250331091245.6668-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When devm_kasprintf() fails, it returns a NULL pointer. However, this return value is not properly checked in the function wled_configure.

A NULL check should be added after the devm_kasprintf call to prevent potential NULL pointer dereference error.

Fixes: f86b77583d88c ("backlight: pm8941: Convert to using %pOFn instead of device_node.name")

Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
---
 drivers/video/backlight/qcom-wled.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 9afe701b2a1b..db5eda8ec37e 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1406,8 +1406,14 @@ static int wled_configure(struct wled *wled)
 	wled->ctrl_addr = be32_to_cpu(*prop_addr);
 
 	rc = of_property_read_string(dev->of_node, "label", &wled->name);
-	if (rc)
+	if (rc) {
 		wled->name = devm_kasprintf(dev, GFP_KERNEL, "%pOFn", dev->of_node);
+		if (!wled->name) {
+			dev_err(dev, "Failed to allocate memory for wled name\n");
+			return -ENOMEM;
+		}
+	}
+
 
 	switch (wled->version) {
 	case 3:
-- 
2.34.1


