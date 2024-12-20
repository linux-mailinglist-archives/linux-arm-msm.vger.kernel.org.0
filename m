Return-Path: <linux-arm-msm+bounces-42994-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FC69F9603
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 17:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8C061887820
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Dec 2024 16:07:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E447218E9F;
	Fri, 20 Dec 2024 16:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlgRlP3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1FB39FF3;
	Fri, 20 Dec 2024 16:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734710825; cv=none; b=DDPcMFbRAUXd7JA2mryI/l0Mcp+bm/qtbaEmRyGJ6Opw7yWZYqOoUwNM6Cmion44Zk44rx0ZNxMm/uJq+Jlvc/adXfEFBl1XQIvpH7O8cyG+XG7Qdo70uUOAc5PRl4cyJ+GJof1DcA/6GticIt3SQ99M3UeDG7fCdBNYjH7QtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734710825; c=relaxed/simple;
	bh=pwpNS+sOxEqyNN36ZDX+P0JT6fzS4PPrdX6vlxUm4ek=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DW8LMofdF2MclpSOLe5s2VHXyshldZKIpkiIDIOgEhtpQTP7RujWiID3OXw15pvE0kBonsEZWHRqGcx+Or28gMMSQd/nGWV3mg9dXNCXwjaIM1zwey1YwIjMlNNzW5wuC35fK3YyUDx45NiYLTAijD2CoUokfAYLQGlFZpPO4WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlgRlP3M; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so1476439a12.0;
        Fri, 20 Dec 2024 08:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734710823; x=1735315623; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbiGyA2VBzq1y2Nz8P+PPT5DLdBmJ7XSRERnK1WU1Tw=;
        b=YlgRlP3MKjoP7/dw2Qi3GTpVvupJGdlV59UCEnqWEOaYT1vtaNYhxv3k4o7KAGazwV
         GgUIXsQfCh7tr1yD3ANCBncrGfzeGIowmLWGIeSO0UDp3ovXn8RPQQ/7cYdU6CX5P5K6
         OGZ+GIQcfMVuSBWA2cgqkoF2kESB1DCBlwfQf8w5l/ngynV43APM2UixpXjgMa5NUMGA
         umLXG7DLp4dBc1y3DtlU67Mwb3bPYJMgawgbP7vzwRxOpxaahIdQLzmG/GMYBrWUVQm9
         QC0VzqiKlcxr98piS7RgudBT98fyhAgwLhzK4Xi3Cw0FLi3x9JBoxwSqMxIIkYlz7D9G
         psdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734710823; x=1735315623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fbiGyA2VBzq1y2Nz8P+PPT5DLdBmJ7XSRERnK1WU1Tw=;
        b=OwrIAY9VPqhrEbklK4tfsImpOxInyEYb4ImGBaECNeWUe+YdtxThNxlQF7FnbLXKB4
         VClADKHV3i6bvGduqDjWRD15i/WyBQFbbl09lXO3NKC+6KVgH0n6d5XJZ5O3M91ZsKza
         H5OoBX4rQAZthoHDL+sEiINzgBbK6xOEpRJ0Xp5P/BCUnT4LqGWwE64p/iwEybhxdtX4
         m0Q2YEl1C7d9zjJYMntjFKmOEBCK8R0C6yLAhZAv4E7OrKFOEePpG2YKghXEsv28Uj3/
         00XSCLZFDugihzjjudb3PEKb0ruIZ1g42lpP2OaRqqj9kX5YzEz2VbI0WzC+5EiYEPfz
         PidQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/iRrvF9SRH9W/xGjnR2EKw0nReCmnE1mnYUr++guaGbOM0Lmlb6RdIHI1p5+ITafJubcbnUa0E0ca@vger.kernel.org, AJvYcCUnSF5Z+NHht8J8umpmcwkB97rthgsjNCgDYfHO+Xk7bIY9M4SeZMJH7xpdv9hCZgy+CvJR7tX4vmTIsRly@vger.kernel.org, AJvYcCVRdta+85YbGod1SwKbrNw4OTPOfGmNW5UHDcyn4aNusW8IxDDmEPjgpn/EtSFjfkaTTwNUOHdRifkmAnOwaA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd14n5T7UujJ5xIiEeau2ug8yQZkbQjUl25AgEL/phNxEnZv1f
	cpOF0HSoi8XgKF0VVXB1eFMEDUCY0AdR7zSEKzdynQHjz4vBYytr2gHk5J+TZqZnIw==
X-Gm-Gg: ASbGncseZGhPOJ3Eez2q5YFBirDxas7OQxP7q+V3i1j9FxlrWSYuqR6rbJYJ9rH29sM
	hJJ3ysxG6mQDqlxQxOrVql0ELJ8im0MWZNCUOILvVAzekZ4l8EBn6mB/mgLWfXrnzSM5OeMAp8c
	KriTQQ76p49pHusuysyqJI0ZCqikBz1iQ7aKD/KOP1qdV+HDBj6XVi0xPMJkI9+ziYQqj02quWq
	zGIL8PuH2DSzgz8BVQy5gQPapCgsFXnnmtjX2BZOdx3De23qXWHnk0=
X-Google-Smtp-Source: AGHT+IHX2r9JNmr8xzP497P1YSWyVIdWVGS1y2GFC9J9fcFPmX1ONoTbeWyk+1yv86HzTWPPUtMf3w==
X-Received: by 2002:a17:90a:dfc7:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2f452def71bmr6299176a91.8.1734710823293;
        Fri, 20 Dec 2024 08:07:03 -0800 (PST)
Received: from nuvole.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f4478a92absm3518771a91.44.2024.12.20.08.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:07:02 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: andersson@kernel.org,
	conor+dt@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: chenxuecong2009@outlook.com,
	devicetree@vger.kernel.org,
	gty0622@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v2 2/3] firmware: qcom: scm: Allow QSEECOM on Huawei Matebook E Go (sc8280xp)
Date: Sat, 21 Dec 2024 00:05:29 +0800
Message-ID: <20241220160530.444864-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220160530.444864-1-mitltlatltl@gmail.com>
References: <20241220160530.444864-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the SC8280XP-based Huawei Matebook E Go (sc8280xp) to the allowlist.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddc..deff48d01 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1769,6 +1769,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
-- 
2.47.1


