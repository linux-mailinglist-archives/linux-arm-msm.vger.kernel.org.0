Return-Path: <linux-arm-msm+bounces-32015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E2197CA4D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 15:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF4B81F23B17
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Sep 2024 13:45:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E364B19E989;
	Thu, 19 Sep 2024 13:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YCjgspAW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498A319E7ED;
	Thu, 19 Sep 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726753502; cv=none; b=QuIUz6+Lyusg0HArQ71ozby75X12xXJSLJGN6mEBGLG6VjJXtJ1nwU5NjOK12zUOXmNoXFNG5KyEeV5ubdD4jVbbLpFQxbW7EZbWefiDgsBZzDxG6cbMfolp6hQnDCK6oKPmy+EQsjxkqLaL8PJQFrasXtW7D8D/13dsIA1imYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726753502; c=relaxed/simple;
	bh=psvQz2dED1bhhkY0oVCQI2DuwGiG1OXRGKYEY+hKdRk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YyVWDTyk0VwFuaZXrCP+xZ9AJerkMnvIQgWF2vlepIbdbXXb0LLVTzyI6ZLQ9DyVEBu7hr0c3rNsMQmvYmG+jwRgvqSvj4NbRx8yoRvxTbV6E5EIEwKztWI42mbWHPwWyJbJ1UIkbG0/nYmyKDrxoKG/GUnnIustQPBWrYnaOoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YCjgspAW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5356aa9a0afso1461851e87.2;
        Thu, 19 Sep 2024 06:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726753499; x=1727358299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rQVkFCVKw33hiK0FCSyNe/XCfvtPWegqsSK5IvOrt8=;
        b=YCjgspAWUZYntmivXLTJkZiBUK9MNcOvozT/uysWGjxNogijMCS6qO+0LniPdYRo1I
         y60vRTp+L2eFp2sakmy5dSDw3cEO99BNJiPIQioCkNTKSyod7cAdf4eB7r8tlpun5jtv
         tSlqFj2k34dX+uVdfIz1VW712b2kNCmWdeepgP78k2i6y4yLqknjtOvfSmgNz5rer3ZO
         rK3ntfl4HFeC+KvMs7pUtreTJN8DWjy5lQia1eh2dQOhXnpSU1s4hpuK2+lVrTIYg3vj
         9kjf9eola/WxMOjxJk1CaAiGn4KkLCHu2+8N1KLHebDo5PZ7aoqT/tPc3OjcQzUKKGNb
         UJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726753499; x=1727358299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/rQVkFCVKw33hiK0FCSyNe/XCfvtPWegqsSK5IvOrt8=;
        b=WjZj5HyWWGSsIN6D8nAdR+LRQG1k7fiZGVsQLkTdbCwO8Mz46gOIZcDRW6/KzbsFDW
         3A1Y8fuXfHEP00i330Q8EsQ76TL6VXGN9p/KN3BouRsbDkK/+ZNpN4J2jDfko9Yuk5Gp
         5ChWJfry8oC4nymVU2jM25gRQ2PdL0g1xcT/UE+SRt+Uy/wmWrbUbZOkeoiZ8a8Q7YcS
         LWNEomwvj88C4z5Ew7Y7+fn8A96RKW6oqZkZ6EB/LraErvvrttoHYs8y8AQTpzqh1khK
         i//5ytz2EEqm1UxgZ5RkQ6i56LSvHm4JE+qcfrEybn5G7aUqYl5P2/6ZCqUWYSIv9v3d
         bHvw==
X-Forwarded-Encrypted: i=1; AJvYcCWzbyt95Xp7KONiXfH6WowsYL+GwI4OQEJ60hRInDDL9ZRhaae4X1iBLR7iP/G0Qer6Q79CUmvmZA1Kvksy@vger.kernel.org, AJvYcCXse97uLgSzzYQlqfBAtn/z6FD0uakjADrVc40Jlk2qN3HO7GAcMo5dZqaA2prfr8ZGcU76v6fecpWlktcG@vger.kernel.org
X-Gm-Message-State: AOJu0YyvsS7k7BwncyjdoQv49hZRlGMMZRae0EhKaVfSFwEbO4HnvLFz
	dR+zMOFSYTpZfM3zSHpvjnFn4zH/oHBITxPtJ5/OX+uv+ap1Ewl8
X-Google-Smtp-Source: AGHT+IHmx5v/1ZZXawpDvL1brfzo6OLiQFiR7R3myflK4xF/bPp52IPFVssGrJXF8qiwCzgiDlR4Dg==
X-Received: by 2002:a05:6512:39c4:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-5367feb95a4mr16574104e87.2.1726753498986;
        Thu, 19 Sep 2024 06:44:58 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a311:80b0:1c80:8b8c:29e6:5e60:f70e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90612e5675sm723286966b.169.2024.09.19.06.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 06:44:58 -0700 (PDT)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] firmware: qcom: enable qseecom on Lenovo Yoga Slim 7x
Date: Thu, 19 Sep 2024 15:44:21 +0200
Message-ID: <20240919134421.112643-2-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I'm not sure how to test it beyond checking if efivars work fine, and
reading and writing them works, persisting after reboot - adding a new
boot option with efibootmgr works perfectly.

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 10986cb11ec0..e11f3f325414 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1734,6 +1734,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
+	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "microsoft,romulus13", },
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,sc8180x-primus" },
-- 
2.46.1


