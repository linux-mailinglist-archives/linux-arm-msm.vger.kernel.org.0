Return-Path: <linux-arm-msm+bounces-70385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D43FCB31647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 13:28:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82CA8603609
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 11:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B2EA2D249A;
	Fri, 22 Aug 2025 11:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vrm36bx6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE92F530A;
	Fri, 22 Aug 2025 11:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755862112; cv=none; b=TIo/QU02OavqPvf3F0sCfeZNDh+LEeapiS3qmHTfcLcMOfhrzgjQh5KbdhxYm0mCoymowDhwEJadClYKPxX643DbgRQqkKuU3ZhsAQzrQWt+AHJDwd+4kQfsLBpVGLWtX1SaHEy+LAqs+IznzIDGXtyqYYnJGLe9B0fSqKaIy+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755862112; c=relaxed/simple;
	bh=Xd4YR9Qe1m+bO+mU0iDtCS1prPjzViIWaLeec0pwvwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/45Bo/CaF62Dh57Ep0KOAj06EfP4tmrU3ZqZ1eCqwn0xvoT7Wvgwu+Pro8hX1v6PFEgBdU722q4FA7f4Wwyo+xuxtyqExEPXOlucg/ovq9uUoUK/eMMgFLpobiPQaYVIEwjSwiS/lok5WyaJpnZyTSZ5hqUXyIvnwIqCcmXvlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vrm36bx6; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70d7c7e9731so12638046d6.3;
        Fri, 22 Aug 2025 04:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755862110; x=1756466910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fATcXJL+LrcWLjUxzRMgV18SaL968swja9iMB8wf0oc=;
        b=Vrm36bx6ZycErMP4dSLoAyLvL/1uBVQZcKb4538/SiD8Tthvrh3PN14ll3cGDtV+qF
         9zw8EGZFZbvTro4TWlAMEDki+0MDHIxVn1gj28yjutO1ku+OApLRMVXmNhjzjLCei6sz
         7EcikYFZuUhSOBI/xV7e/jmrMf2zGKy/6aRq6Zyxpx2RGef/qhMzYuqKEqXcXAEjdSdN
         zWFhXchp/CNkQffZQh7o3PpbU1O/jbwxlwpdgIkfYXYzZPZmlylJDyNP5HgMFCBO2wXI
         8qKEtfLrT57+lX20Lo4Pbxv3JnkU2sPMQXAFw7EaEBp5rUfstnXnL+U9zZaaUnKDxPVO
         VOCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755862110; x=1756466910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fATcXJL+LrcWLjUxzRMgV18SaL968swja9iMB8wf0oc=;
        b=WYlqgv3e3e+ro6OEmSAvTwuVT4qyKRLZQXr41pHfn3WO8vaG2EfS9b51HK+OVWPrPn
         vsE0uI9prIgsWdNI+X7coLSolCJUjFZ1YvnRG22yYSXYZ90RgBIzyd0cWUf5AzgVpIo6
         DEuz1tN1RirsR4fp1gpFSMIN7Kq/Y0N+UcSRWrN0Ck+8HxjNFi9X+YcrA2CNMsbR1+wk
         A81n2ATbLdQ1vibE98Pg9niV90oxYKTAqIWF2jDqZ0i1rpwi7ykoxKdRb4MIgfBOm1HX
         fMsmdhPpSy74RslNODk6Yc6Wz85XClmCkTkAD9VFhIomDqq77FjUMGFYklYUbvt+pNBa
         4C/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVNCLxH8d13H839mLlqUDkyPU7Bk4fEqgXgisJ9VCojxxhn3dJZHR5cddBQFZpRPoAbQdJjNO+H4V2HzDqw@vger.kernel.org, AJvYcCXx9K6yPCxWQ16oSFZwSBWwZPVMtaJrMFMHx1z8ek+qBM+etYb7m/ctduZ2tAW/6MDh1qCy7d6+iX7ABQsM@vger.kernel.org
X-Gm-Message-State: AOJu0YxXGx7Yizwye+gXWbWFrEyAmwBxHCxcwRTBq188wd45bCiMUiUt
	VMTduxeybmY+kRGblcGKWZski7Dmb4/oQUhLxyVfogYlDOk0TDcMc4uR
X-Gm-Gg: ASbGncu0h+W/eQjgf71M8n/pX3aWfow9SWH43i5DR8QtTLiF7I/k5uHG5lOZYmtMNkL
	C6DJXQH3EMPDXlfqcE1n6S75g/eGkl5vC9LHEHqhHbEi5ZO83uxqbcaqdhWnU98y6QniiEvjN3j
	r429fAgMEjB3+j6lGGWk8xpPCcWj8qyOkDZqZprx2/TMsV40Du5EXDkYyDdgw3oQH/ZsgPnFvMR
	RqjgmUFHaPNm2TgxtItCpgiXKhy5SJIZ2uL6YUCmFhPlHmay1t7yaBOmat6Nrx/WRrN1P5340f4
	KwYg8DGHIhVq3llE7gheWJkggWS3yuzrznC6aMqVkYS4Ci2Z2eSeiAHlUwOiDvXenmvpnC7l8Nh
	gxO9yXUJkuVPCp35bOqWrXcyCbJvS1AieHwXPpd6BS/OlH1BTUmVc6vlPJ2njNIeYTY+4
X-Google-Smtp-Source: AGHT+IFEuC07BCn0ECmRXcw3LPgdxSHH0lEezjr7/+96LbcIVEdq5iydgvMQouzopyVqYSUIxhZivA==
X-Received: by 2002:ad4:5f0b:0:b0:70d:9587:cf78 with SMTP id 6a1803df08f44-70d97132341mr35945836d6.28.1755862109558;
        Fri, 22 Aug 2025 04:28:29 -0700 (PDT)
Received: from cr-x-redhat96-nsd-2.fyre.ibm.com ([129.41.87.0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ba90d8e93sm123662476d6.34.2025.08.22.04.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 04:28:29 -0700 (PDT)
From: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
To: jeff.hugo@oss.qualcomm.com,
	ogabbay@kernel.org
Cc: quic_carlv@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
Subject: [PATCH] accel/qaic: Replace snprintf() with sysfs_emit() in sysfs show functions
Date: Fri, 22 Aug 2025 04:28:04 -0700
Message-ID: <20250822112804.1726592-1-chelsyratnawat2001@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Chelsy Ratnawat <chelsyratnawat2001@gmail.com>
---
 drivers/accel/qaic/qaic_ras.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index 914ffc4a9970..f1d52a710136 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -514,21 +514,21 @@ static ssize_t ce_count_show(struct device *dev, struct device_attribute *attr,
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ce_count);
+	return sysfs_emit(buf, "%d\n", qdev->ce_count);
 }
 
 static ssize_t ue_count_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_count);
+	return sysfs_emit(buf, "%d\n", qdev->ue_count);
 }
 
 static ssize_t ue_nonfatal_count_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct qaic_device *qdev = pci_get_drvdata(to_pci_dev(dev));
 
-	return snprintf(buf, PAGE_SIZE, "%d\n", qdev->ue_nf_count);
+	return sysfs_emit(buf, "%d\n", qdev->ue_nf_count);
 }
 
 static DEVICE_ATTR_RO(ce_count);
-- 
2.47.3


