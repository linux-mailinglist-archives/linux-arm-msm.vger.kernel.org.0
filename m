Return-Path: <linux-arm-msm+bounces-27262-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086D93F5E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 14:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFB44B226EE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jul 2024 12:53:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8E91494AB;
	Mon, 29 Jul 2024 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UJNn9+wZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD758148304
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jul 2024 12:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722257613; cv=none; b=c0o5N5zhO9wyVE3f0vRPJPddr7ZDADUexq1sImdvoW7eIEMh9AQNtB2+sT/SVugB+V3DHykwpH9aCkkpj7EGiY1iYyQCLdkQlPzlDm7DCyluvCvGqXJzambPIHjOllUBK9diyT0Qq6yNNo+qlU4a4Vg3yO7aEj857JsF4yl6G98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722257613; c=relaxed/simple;
	bh=lJOnix9+hQIHPKoHkpMwYVv3dz5edCwJGDQj5TtS1Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WXHU0OMf7i9LFDJDcTnEoULjm6JZTXHWod8vjpeOXn9471MX3hDoqVsnrqZgsUMQJBDu/2AsduYft6VMcfmViBig1jV3NdJqUdNJlUkStAzAw9nsxh0pWRTT8V/Pzfh4w8nPBs0E/t0XJbjQntGe+SLDwzJDBfr/lp3MyjsqVBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UJNn9+wZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=AEUxIToG3v1K/Z
	GsboZgQx+hSbOpaKrPzxDlIPxesk4=; b=UJNn9+wZ76LIwTZehNfiDorYI/HOCT
	v+5gM9rlP/GCEXI4mBhf2W37OK2i09eS9L79TcaXWP8ZPtDx+cW5q7f7U2potQyO
	hmDt8UB/x/iTWBmfQrcznTUUhcduuWszYvRKdamWi3HL0q9hec+mXqvy7ixRbftj
	ftiurjA3LCmkJqDCco4ZDXAcNOGRM67jjPTkQIXFxt4HxYkh2bgaL+mwIjzLp4LW
	GYSCKhrk0IWIg56BA06fnlsUfRxaq0uunNXYuGCnQMcvTAJPozScAL09E7C9279C
	+FMtytxeByNoJDpuL4bDcMn4Az8ysexwBo245llI17lhRL4beAxsQKmw==
Received: (qmail 4107496 invoked from network); 29 Jul 2024 14:53:19 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 14:53:19 +0200
X-UD-Smtp-Session: l3s3148p1@G/hkWGIeh3VtKPFk
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-pm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: update email for Konrad Dybcio
Date: Mon, 29 Jul 2024 14:51:17 +0200
Message-ID: <20240729125225.2090-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The old email address bounced. I found the newer one in MAINTAINERS,
so update entries accordingly.

Cc: Konrad Dybcio <konradybcio@kernel.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Against v6.11-rc1. Still needs ack from Konrad Dybcio

 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..7b599269a821 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2745,7 +2745,7 @@ F:	include/linux/soc/qcom/
 
 ARM/QUALCOMM SUPPORT
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
@@ -7106,7 +7106,7 @@ F:	drivers/gpu/drm/tiny/panel-mipi-dbi.c
 DRM DRIVER for Qualcomm Adreno GPUs
 M:	Rob Clark <robdclark@gmail.com>
 R:	Sean Paul <sean@poorly.run>
-R:	Konrad Dybcio <konrad.dybcio@linaro.org>
+R:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-arm-msm@vger.kernel.org
 L:	dri-devel@lists.freedesktop.org
 L:	freedreno@lists.freedesktop.org
@@ -18771,7 +18771,7 @@ F:	include/uapi/drm/qaic_accel.h
 
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Bjorn Andersson <andersson@kernel.org>
-M:	Konrad Dybcio <konrad.dybcio@linaro.org>
+M:	Konrad Dybcio <konradybcio@kernel.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-arm-msm@vger.kernel.org
 S:	Maintained
-- 
2.43.0


