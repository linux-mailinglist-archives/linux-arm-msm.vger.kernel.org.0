Return-Path: <linux-arm-msm+bounces-86390-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CBBCDA186
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:24:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8DE830056C1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:24:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBB283002A0;
	Tue, 23 Dec 2025 17:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND9GwadF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDeoFx5M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317BB2EB5A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766510670; cv=none; b=nPfpHSiO0WJDLUAvCy5Tc25mgQg7J5IRQgBgceeOeW2tLKBxDa+XwOEUSA+3QsXbt1K1FPVPoLMxmku+l3ubE9tzT+PM7fI3EVoTpeoi5B5m48q+D/rU1YInMIXDfUy2C7VGqqkHPSxUNv0prTjwKJT9r7rksIbhFqFGYclt34s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766510670; c=relaxed/simple;
	bh=C/PGPurUrhAZMl2uGh2//sk0/63g2cqr16A4xNFv1Ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J1927BXaV4Qo6XSPUMqEi0I3VR1qJxt9vbS6FldWkOuqGPfsci64yuRthH3SkyQykthcZAgDSC5JB43VlISgLwKZrVuqeXWnCQRYul56AQCG1f0qyGbOsu1Bjh6gZK5I3HNQ2zorCHUNYUEEdK29Yqy5WehQNdQK1EMuAXxYnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND9GwadF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDeoFx5M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNCQdVo1901934
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6Tz
	nsuzTKNE=; b=ND9GwadFpMksHEJVz2ZWv6XsZs2pRMoYVywO+zKNqHTZ5vr2V9A
	sP+bkFdEMuwSAFwYc8hcGTI2KN9bO1ua4FZb8pu+xDBVCAtnY+SE9h9lnsJKCs40
	yG+aF76piwcJOD37RMbI2lUJJ0jKKfq7Hwr0pwPd/boUYCPW542zUaNskH6/sw6h
	NBm59o5fzAYTHHDUXae2KLt9/6v7soUV9Ni3UN7KSBrvF8nzmUQZlwRF5abHFoxm
	YqdBm6t61Ye6qA0N1Cw539q8QxRjJWzrNaPq3J9aMOmdo42mxkcd14/bXRk1Rh47
	mhUQ0369qpgz0wagjLvr0Qr0rANLbgOdeCw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b79w8kude-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:24:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee0193a239so54381321cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766510667; x=1767115467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6TznsuzTKNE=;
        b=XDeoFx5Mf4+AG0XsJygFLO05bUxM3k/BE+VjllUyO24J92GDS/h8UZd2TIeJ8zbyXK
         IwNoGx1mAAE4y/kcLWXGZ67/zwRGykfOngV+VMYSvzu7AdvunU2aH7H0l8YnemeG6wyE
         BK8inD6GDy60cEmjp37eWjjdgTK7FAJb0XTWzV0KJhbYH3SriBNrDmZRuz/BPrylgXY4
         OW/A1HoLPAFY66k3HVmbkcurTDFRBM+KnRK57/dXe+s8po89ps132fcGh800cQHWJ1Xx
         fOJ9Uf2lTWzJfe+qgG662ePF+dD49ajT/qpIATBKjzMMlwWNCOcFK+MB9awCKksczTTF
         frvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766510667; x=1767115467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wrz5ppR9wQNdpDwOtkeBXALexdBHnhIk6TznsuzTKNE=;
        b=tQ6BeIv8xmWwdvp9eg01iWmnAGHZt+Qy+rVkOnZf4rdV5UPDwyEv1zzeEbItJMhtXt
         pf63hYD5PmX1DeJWQAjv0aHJRJi/V/zzPsGxQ/S+JbCm2yfZ+1xh3F+7uW5qykY5h5m3
         C83QmW8+dWSa1WWfiF/iqUWYeS1pzwkqKCqwqmDXzw/Gkq1Bk+cD0b4/DWxcJICYok8B
         bJIHPn3EjhDD4PCRoWdPvZ4KjO/UWPeUC2KBCT0MTts0Jyt6kDMa/Dg6IwYJVTvYBj6V
         K8eGzmf9OQDmncg6T2KtP1vREsVGzirm5uigKQJKJB7TBEDChbTXpthuiN/UYpMFeZ5q
         bGGA==
X-Forwarded-Encrypted: i=1; AJvYcCWAGJgVCNNIZSSb8nUa0pDLE9Q0wBcvgGHX2cg2FfHB0ld8ho0BPDwy1Uvi1KK3dnJRhAkOV5IuIMK/rvzA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1RMP1flHfMyGRbPwOd8LzbFAyyx2eHfzBbwkmG8cJqquJJ6i0
	wy96huDCYcveWxQLDV6pf5N+hCNU5gDNfcqcQGWNX0lbKtgjgjmosvlVAbSt8JO8dv7FgGUBTI6
	qLgqP+YcEXPX4U1/02/pV/M8FVRvsZEKrgf/ukXZ9zO9JD9pUiyUhIwMlKcSwFyZA+wbGxAouJR
	hYEeg=
X-Gm-Gg: AY/fxX69BxStc1fUniaHVwZ6oq6Unv15M4z1KViaI2HWqlgVHMH8HcHTvPDuN/0Psxh
	ISgB+6+EIoTTpPq6oEghZvi9jZVmMoKR1k1WEjciJGwUwUZzeWr+j5ISzF515lkj+1rmJ48h/4L
	46ltxbZE/z7y11R1FyaMp0XTifRKupKiG9U07dJu4OsIHJ3Sv4qYK9h0TpWgAwu4nKf1At8Es49
	D3di/RgLXzTwcki5k792q2Cu+KWS0NX7V5BI9+YoyuHBvvalnnuovgtRr5sv/t2ritUVqBVlqRY
	bK/j0XL2XZ5xHBrCviVG1xOwmG537K6M1xGRa7e+Xzmm0xXHG3gq/RMg6+FLT1gu5r81/1LAKk0
	wLA0zc+qTt4YM0P8dTY6hzH0GoxRB1npMOy+mSuWW430b9apa7A==
X-Received: by 2002:a05:622a:588c:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-4f4abd6225emr259716701cf.49.1766510666681;
        Tue, 23 Dec 2025 09:24:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESYr/AwoMzjuB3Nqy//uC8TSZdjQCi/iCS/jRegkiv6laMO6vTreal4sdu6FYx4jrMPNBU0A==
X-Received: by 2002:a05:622a:588c:b0:4f1:cd0c:80f6 with SMTP id d75a77b69052e-4f4abd6225emr259716051cf.49.1766510665991;
        Tue, 23 Dec 2025 09:24:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8080e2177csm448974766b.68.2025.12.23.09.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:24:25 -0800 (PST)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] accel/qaic: Update copyright headers to yearless format
Date: Tue, 23 Dec 2025 18:24:25 +0100
Message-ID: <20251223172425.2283978-1-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0NCBTYWx0ZWRfX4OhuSZrW9OrB
 nzVOSPnlZv3WD+4kWRxPDrdNVyfjLE0qqHixP9tPUzDF9zTxZJZSYQjbgmgGrtqWOemcxYblo/g
 aMx+QN71OhIllRi9gscBlqJHWwVYET2dV3mpv2ix3brBYRCwJvP50GuujnT3EqSPF5s5ggKiO82
 h6xhri9qNbXJUtTveyEjAYzrUACmw2/0LWpzm/fBo34qBtz/v4IuXrXg0fyZjhgrb2A9B+L3g9t
 TD2lMlqgEmVvKvz9pYIUvyVlrt1dDH7NAxusQ66M8URe3gkixqhE0Fg3CmieQ+a5v15DNQI+7Kh
 L5kBO5xdVUIxef6k7TM11U2xD0WevQvOmYEPXNMmpi68wVgfsSMvptF5R5lW5flt1Xl1a0iDCMT
 POrug4Hss8XRoObyJTG2fhMrL9Tyom1JoXTMBgy50Htkq3IvXUNhNOecKEm8QY1mE5umg3l67Od
 unTGkGbA1fvQ+JnHHjg==
X-Proofpoint-GUID: 4PATAzHShOuOcauSQ6PKuudoIXxaLjqj
X-Proofpoint-ORIG-GUID: 4PATAzHShOuOcauSQ6PKuudoIXxaLjqj
X-Authority-Analysis: v=2.4 cv=T/eBjvKQ c=1 sm=1 tr=0 ts=694ad04b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ZGpvmaf78dKCArbXv7wA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230144

From: Zack McKevitt <zmckevit@qti.qualcomm.com>

Update copyright headers in accordance with Qualcomm's current
legal policy.

Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/mhi_controller.c | 2 +-
 drivers/accel/qaic/mhi_controller.h | 9 ++++-----
 drivers/accel/qaic/qaic.h           | 9 ++++-----
 drivers/accel/qaic/qaic_control.c   | 2 +-
 drivers/accel/qaic/qaic_data.c      | 2 +-
 drivers/accel/qaic/qaic_debugfs.c   | 2 +-
 drivers/accel/qaic/qaic_debugfs.h   | 2 +-
 drivers/accel/qaic/qaic_drv.c       | 2 +-
 drivers/accel/qaic/qaic_ras.c       | 1 -
 drivers/accel/qaic/qaic_ras.h       | 1 +
 drivers/accel/qaic/qaic_ssr.c       | 2 +-
 drivers/accel/qaic/qaic_ssr.h       | 9 ++++-----
 drivers/accel/qaic/qaic_timesync.c  | 3 ++-
 drivers/accel/qaic/qaic_timesync.h  | 7 +++----
 drivers/accel/qaic/sahara.c         | 2 +-
 drivers/accel/qaic/sahara.h         | 2 +-
 16 files changed, 27 insertions(+), 30 deletions(-)

diff --git a/drivers/accel/qaic/mhi_controller.c b/drivers/accel/qaic/mhi_controller.c
index 13a14c6c6168..c23f1d7cdea7 100644
--- a/drivers/accel/qaic/mhi_controller.c
+++ b/drivers/accel/qaic/mhi_controller.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/delay.h>
 #include <linux/err.h>
diff --git a/drivers/accel/qaic/mhi_controller.h b/drivers/accel/qaic/mhi_controller.h
index 8939f6ae185e..c1940c839246 100644
--- a/drivers/accel/qaic/mhi_controller.h
+++ b/drivers/accel/qaic/mhi_controller.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2019-2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef MHICONTROLLERQAIC_H_
 #define MHICONTROLLERQAIC_H_
diff --git a/drivers/accel/qaic/qaic.h b/drivers/accel/qaic/qaic.h
index fa7a8155658c..83948358ada1 100644
--- a/drivers/accel/qaic/qaic.h
+++ b/drivers/accel/qaic/qaic.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2019-2021, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef _QAIC_H_
 #define _QAIC_H_
diff --git a/drivers/accel/qaic/qaic_control.c b/drivers/accel/qaic/qaic_control.c
index 428d8f65bff3..ac0d3b59900f 100644
--- a/drivers/accel/qaic/qaic_control.c
+++ b/drivers/accel/qaic/qaic_control.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
 #include <linux/completion.h>
diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index 60cb4d65d48e..5da5dceccc3f 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
diff --git a/drivers/accel/qaic/qaic_debugfs.c b/drivers/accel/qaic/qaic_debugfs.c
index 8dc4fe5bb560..5289d33744ba 100644
--- a/drivers/accel/qaic/qaic_debugfs.c
+++ b/drivers/accel/qaic/qaic_debugfs.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/debugfs.h>
 #include <linux/device.h>
diff --git a/drivers/accel/qaic/qaic_debugfs.h b/drivers/accel/qaic/qaic_debugfs.h
index 05e74f84cf9f..59a002bab07c 100644
--- a/drivers/accel/qaic/qaic_debugfs.h
+++ b/drivers/accel/qaic/qaic_debugfs.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_DEBUGFS_H__
 #define __QAIC_DEBUGFS_H__
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 4c70bd949d53..4c884e8aa346 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2019-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/delay.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/accel/qaic/qaic_ras.c b/drivers/accel/qaic/qaic_ras.c
index f1d52a710136..de8fe90a6a2c 100644
--- a/drivers/accel/qaic/qaic_ras.c
+++ b/drivers/accel/qaic/qaic_ras.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
 /* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
diff --git a/drivers/accel/qaic/qaic_ras.h b/drivers/accel/qaic/qaic_ras.h
index d44a4eeeb060..7b3fe9585ed9 100644
--- a/drivers/accel/qaic/qaic_ras.h
+++ b/drivers/accel/qaic/qaic_ras.h
@@ -1,4 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
+
 /* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
 
 #ifndef __QAIC_RAS_H__
diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
index 9b662d690371..ac6249877e62 100644
--- a/drivers/accel/qaic/qaic_ssr.c
+++ b/drivers/accel/qaic/qaic_ssr.c
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /* Copyright (c) 2020-2021, The Linux Foundation. All rights reserved. */
-/* Copyright (c) 2021-2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <asm/byteorder.h>
 #include <drm/drm_file.h>
diff --git a/drivers/accel/qaic/qaic_ssr.h b/drivers/accel/qaic/qaic_ssr.h
index 97ccff305750..af074edbf967 100644
--- a/drivers/accel/qaic/qaic_ssr.h
+++ b/drivers/accel/qaic/qaic_ssr.h
@@ -1,8 +1,7 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2020, The Linux Foundation. All rights reserved.
- * Copyright (c) 2021, 2024 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) 2020, The Linux Foundation. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_SSR_H__
 #define __QAIC_SSR_H__
diff --git a/drivers/accel/qaic/qaic_timesync.c b/drivers/accel/qaic/qaic_timesync.c
index 8af2475f4f36..956544df0c18 100644
--- a/drivers/accel/qaic/qaic_timesync.c
+++ b/drivers/accel/qaic/qaic_timesync.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved. */
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/io.h>
 #include <linux/kernel.h>
diff --git a/drivers/accel/qaic/qaic_timesync.h b/drivers/accel/qaic/qaic_timesync.h
index 77b9c2b55057..6aeda1d62a35 100644
--- a/drivers/accel/qaic/qaic_timesync.h
+++ b/drivers/accel/qaic/qaic_timesync.h
@@ -1,7 +1,6 @@
-/* SPDX-License-Identifier: GPL-2.0-only
- *
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __QAIC_TIMESYNC_H__
 #define __QAIC_TIMESYNC_H__
diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
index fd3c3b2d1fd3..9fea294e1d7b 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/accel/qaic/sahara.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
diff --git a/drivers/accel/qaic/sahara.h b/drivers/accel/qaic/sahara.h
index 640208acc0d1..08037281c80e 100644
--- a/drivers/accel/qaic/sahara.h
+++ b/drivers/accel/qaic/sahara.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+/* Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries. */
 
 #ifndef __SAHARA_H__
 #define __SAHARA_H__
-- 
2.43.0


