Return-Path: <linux-arm-msm+bounces-98642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHHNL2KYu2nwlgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:32:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CB02C6C85
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 07:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 704F7300D353
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 06:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D46334F487;
	Thu, 19 Mar 2026 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HviWnwVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HtWUErwn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E93632ED54
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773901919; cv=none; b=gZoNUkZswCh4CAKTzEef6evsxORnPEwv9OCl6ypOfUSE3RU/BW10fc/Qcs1dLbvELJL3jRN7F1KIOFmy3GiMMjv572S3XFb+O6RIVG5SFo5KkbYp1BbIy7dYkAmSpkp7JlzrbKbZtJnbCiTGMDfrpjOCQ0haIfWmxfaZiRVp9O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773901919; c=relaxed/simple;
	bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hes925xff/SNi8CzZpoZ3s40/sWwV5og0Zww8slV/Tdqc94yom8qAnhJF0JroKVW0HgHVOwiTxVJLxxYGWUjWv1+Y54h7N8Ay81dd1VrDsEVScjdSR9Sb0V1DP0mdp0Dfzo6Rwu9JtP3/g9CrMDwrHIHpgCgl6EHEwTmo0yIDJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HviWnwVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HtWUErwn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5XbI31574748
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=; b=HviWnwVjN+4miLXg
	WEqDIq8wMzPV3HzvNEcYIQEWEcXP5qTrPUMtBHkTiyarFe5/aLdfzc/mMqFwxvtk
	bMEBJpsQHUVHhvolh1gag9WtmGVO9gduAbUOK29nMki8+foFatMZ33NH8TyuCWGD
	P0kJqMx8TtRcaNK+K9OPdudsaWoZao6RnFHNCTcYr9/A76tT3l3CW2fstOiyV+RX
	OS5o27d8owJNGzxbcI+rv2hFAFK++kqWUUU6uL+ov0petfJkH3tZlFae3PM7zV8q
	tMya79RbgwOquJ2UVgRVO8eHi1tPfE2l8fhIRlzr1adMnLzPsSvhCWiUpK9/oAH2
	Fv0epw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyy75tcn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 06:31:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aed1beaa73so4709365ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773901916; x=1774506716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=HtWUErwnk5G4UF9ulT5dHNWkRjh5zOEA0mpLLsfHqy+zZckEUn4V/GT77XEI14i2Nt
         dgu4kV5rwrqBmg4CfBuBmyCQ8O284njxTwP2t3g8xMudvo/gviX3w/dEavjlOjCgy0sS
         zskiPxS3cAVBLgwAyVLckXpgq2ejke4qRro+tFm2pQMWp8/2pmtj0jOsYHklg2tDne1C
         GRwsj1vOkLuoqOZ+HpPZnlba9fjnBfic5vXz0jGcVUbj3a+Pb0wcTWKTziT5+oiXeBwC
         xoSb26ZP0KsDbkjBvTVoBgaZz1W8y1PJEMmCOx9qMJxru3QpWqmn2Kg6zpM3pifX8tmx
         XOCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773901916; x=1774506716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pD2aEY9dZogWGWfrJ0ewLTBoCN0zxUacyNzSIWJJ810=;
        b=ak6EgRotUO5cz+hRzaU5K6O53+/PJMqWE/bb6ePutGURav1m/IKzcMDsiRvG+czIHG
         02l+pEe9U6e3X89HXS7+oGQ6auUrlAK2gaxRufg5P4GH2uQqHdMyptaYrWVWrxEhy6vz
         mDHA6jeCnC83T6iJU5zTEusRRooXIGM0WtZ6lZ8YLmW3Wo7xGrzmYRkTRn1IvQhU2MGL
         AX+vbPRLdpclloIgfEFb2RVycMzuayAk9pWnnf+pGuUXTNZV/gBwnmIq2GCt3ZCwMBkQ
         XvhhOvcnGyMG3wZBjxjDfQ4CSaUQeI4KJgYP6rQjakCsdPRRnAenNlTUGx/AYgItRNsx
         I5xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDRqisgiTGHSj95KsCpiJpbtWHp923AfqotcyDMxdVj5emrZl3oo/RKzz7htTvNtEOxDbC5uXCh53f8WAS@vger.kernel.org
X-Gm-Message-State: AOJu0YxOBoCcsCPVXjWuZWgSxUfnREe7HQMKpRpwWZrP0cXM5P0Vm4qz
	9zRiOgN1pDsyZiQf0i8lBSaOpm4/ea57ObHVdPi9EDl0xf/AiJDP/3GJG41YwWQzbxC42b3pryH
	hNSN7hFAl8p04HlCO2UqhvYrSPtQeY3GVJY4x5+tCTuHVmlP00qEe5V8cZvLXPwdIQxbZ
X-Gm-Gg: ATEYQzzZBDwsWbDVgCrL+4ChG+rE6VxrM4ZYmgqyQIhdpvipW5jhdUMhteFrw0taPmb
	WEQ4LcqxLge6MEz9p9XSCC+Q7ylEGLMw5xFhQdWQAVNpp6AwpyizGjNypw8Yo/UfYXbX9mJMvwU
	lgDp1Bx6kXTVxQSHXjH1D+MQ5fNcwwAnoRw2/kaoUpwfh931IfettFnbPCd4Hc43pCjP9F9Fe78
	7GTBV51zyaHgOViK04wf4pS+aHUgLzrcNIio5Hd+ghpnrvwWuHECQyQGNAcPGevzuPY2X0640P2
	mlCH//HKiHePWToKUOKVpIWC45eC0i5fy3PHE7Zo3OjX/I2cX1yW2KQF46gc24Cd+fCt6JpDlA0
	XpHcDMLpOe6z/MfNbov4LP7somS5U4oUysWuWnimL8iShnMRPwwo=
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57929995ad.43.1773901916046;
        Wed, 18 Mar 2026 23:31:56 -0700 (PDT)
X-Received: by 2002:a17:903:1a67:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b06e41afc9mr57929645ad.43.1773901915508;
        Wed, 18 Mar 2026 23:31:55 -0700 (PDT)
Received: from hu-batta-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e603937sm48572485ad.57.2026.03.18.23.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 23:31:55 -0700 (PDT)
From: Kishore Batta <kishore.batta@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:01:42 +0530
Subject: [PATCH v4 2/9] bus: mhi: Move sahara protocol driver under
 drivers/bus/mhi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-sahara_protocol_new_v2-v4-2-47ad79308762@oss.qualcomm.com>
References: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
In-Reply-To: <20260319-sahara_protocol_new_v2-v4-0-47ad79308762@oss.qualcomm.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
        Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, andersson@kernel.org
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        mhi@lists.linux.dev, Kishore Batta <kishore.batta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773901902; l=7115;
 i=kishore.batta@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=9tH2JRuQd/Ntg0H7RVSyFLnl0a6EFmaIQsmT7afSET0=;
 b=6q/DYzaxgzAsKW6ELr/JOhWo50oh5Rnj4wO+vwDmS0IpVLFCLr5domUKlxH8fnAs2r8vwr1Oo
 hF/k8fjzdMNAz1MY8ssF70N98PwgfPpONfm0KrK1Tx76sZYm612mscl
X-Developer-Key: i=kishore.batta@oss.qualcomm.com; a=ed25519;
 pk=vJo8RvTf+HZpRLK2oOIljmbn9l3zFkibCGh+blaqZCw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA0OSBTYWx0ZWRfX56II4REK9OiF
 0qeat9OhqGGn7Os5Y/quqmsUvCGfXKcbGTR0x4IBrCR+NevRw7t1Wu1P6ShQyd5hPls4ufLAW1V
 /lOo8iQalwSzq24XEK8LfvkLN0ZPetbF/oaepe/kHH9GguOHBixH96wqj3s26xPq7WmVjAa0DxT
 XFeLUNCqDWaLOjqMKF3BXGri9HoP3ztO/WJfgQGYgfP9Ly6Wtk6sTLepJcucSiEbsfpqr8XDnCX
 uQv7e6t8nM32hvtDzM4PkYWHYYst4Kp7f6149KgfYaKUDz7cgDXxS8p6tgtoCD77t3NTFDVrvu3
 xQ1iJCK1sJD/mn6aTKnz6j0SKXEkv6t5ZcTJs4wImMl3ttpbZo4pu2MkVo7okgO9oi6ZzPfYqcG
 NJgGmdrmvHGOrfgQKJpBdRmNjzC6vRdu0YHo5JM47V7i3+hKhrSPKJc2bhjjRcCUrPicVWXlyHR
 TfX4AY6AwwVs6bp6AjQ==
X-Proofpoint-ORIG-GUID: yaBp6OwBrX5zTgQbUbMsWkE_M_KOQlV6
X-Authority-Analysis: v=2.4 cv=A7hh/qWG c=1 sm=1 tr=0 ts=69bb985d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YoiwXk0N_qN2JQiW-xcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yaBp6OwBrX5zTgQbUbMsWkE_M_KOQlV6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190049
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-98642-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kishore.batta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 95CB02C6C85
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Sahara protocol driver is currently located under the QAIC
accelerator subsystem even though protocol itself is transported over the
MHI bus and is used by multiple Qualcomm flashless devices.

Relocate the Sahara protocol driver to drivers/bus/mhi and register it as
an independent MHI protocol driver. This avoids treating Sahara as QAIC
specific and makes it available for reuse by other MHI based devices.

As part of this move, introduce a dedicated Kconfig and Makefile under the
MHI subsystem and expose the sahara interface via a common header.

Signed-off-by: Kishore Batta <kishore.batta@oss.qualcomm.com>
---
 drivers/accel/qaic/Kconfig                      |  1 +
 drivers/accel/qaic/Makefile                     |  3 +--
 drivers/accel/qaic/qaic_drv.c                   | 11 ++---------
 drivers/bus/mhi/Kconfig                         |  1 +
 drivers/bus/mhi/Makefile                        |  3 +++
 drivers/bus/mhi/sahara/Kconfig                  | 18 ++++++++++++++++++
 drivers/bus/mhi/sahara/Makefile                 |  2 ++
 drivers/{accel/qaic => bus/mhi/sahara}/sahara.c | 16 +++++++++++-----
 {drivers/accel/qaic => include/linux}/sahara.h  |  0
 9 files changed, 39 insertions(+), 16 deletions(-)

diff --git a/drivers/accel/qaic/Kconfig b/drivers/accel/qaic/Kconfig
index 116e42d152ca885b8c59e33c7a87519a0abc6bb3..1e5f1f4fa93c12d8ca8fb37633f2f0bee9997499 100644
--- a/drivers/accel/qaic/Kconfig
+++ b/drivers/accel/qaic/Kconfig
@@ -8,6 +8,7 @@ config DRM_ACCEL_QAIC
 	depends on DRM_ACCEL
 	depends on PCI && HAS_IOMEM
 	depends on MHI_BUS
+	select MHI_SAHARA
 	select CRC32
 	select WANT_DEV_COREDUMP
 	help
diff --git a/drivers/accel/qaic/Makefile b/drivers/accel/qaic/Makefile
index 71f727b74da3bb4478324689f02a7cea24a05c2d..e7b8458800072aa627f7f36c3257883aa56f4ce4 100644
--- a/drivers/accel/qaic/Makefile
+++ b/drivers/accel/qaic/Makefile
@@ -13,7 +13,6 @@ qaic-y := \
 	qaic_ras.o \
 	qaic_ssr.o \
 	qaic_sysfs.o \
-	qaic_timesync.o \
-	sahara.o
+	qaic_timesync.o
 
 qaic-$(CONFIG_DEBUG_FS) += qaic_debugfs.o
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index 63fb8c7b4abcbe4f1b76c32106f4e8b9ea5e2c8e..76cc8086825e7949ed756d51fcb56a08f392d228 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -15,6 +15,7 @@
 #include <linux/msi.h>
 #include <linux/mutex.h>
 #include <linux/pci.h>
+#include <linux/sahara.h>
 #include <linux/spinlock.h>
 #include <linux/workqueue.h>
 #include <linux/wait.h>
@@ -32,7 +33,6 @@
 #include "qaic_ras.h"
 #include "qaic_ssr.h"
 #include "qaic_timesync.h"
-#include "sahara.h"
 
 MODULE_IMPORT_NS("DMA_BUF");
 
@@ -782,18 +782,12 @@ static int __init qaic_init(void)
 	ret = pci_register_driver(&qaic_pci_driver);
 	if (ret) {
 		pr_debug("qaic: pci_register_driver failed %d\n", ret);
-		return ret;
+		goto free_pci;
 	}
 
 	ret = mhi_driver_register(&qaic_mhi_driver);
 	if (ret) {
 		pr_debug("qaic: mhi_driver_register failed %d\n", ret);
-		goto free_pci;
-	}
-
-	ret = sahara_register();
-	if (ret) {
-		pr_debug("qaic: sahara_register failed %d\n", ret);
 		goto free_mhi;
 	}
 
@@ -847,7 +841,6 @@ static void __exit qaic_exit(void)
 	qaic_ras_unregister();
 	qaic_bootlog_unregister();
 	qaic_timesync_deinit();
-	sahara_unregister();
 	mhi_driver_unregister(&qaic_mhi_driver);
 	pci_unregister_driver(&qaic_pci_driver);
 }
diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index b39a11e6c624ba00349cca22d74bd876020590ab..4acedb886adccc6f76f69c241d53106da59b491f 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -7,3 +7,4 @@
 
 source "drivers/bus/mhi/host/Kconfig"
 source "drivers/bus/mhi/ep/Kconfig"
+source "drivers/bus/mhi/sahara/Kconfig"
diff --git a/drivers/bus/mhi/Makefile b/drivers/bus/mhi/Makefile
index 354204b0ef3ae4030469a24a659f32429d592aef..e4af535e1bb1bc9481fae60d7eb347700d2e874c 100644
--- a/drivers/bus/mhi/Makefile
+++ b/drivers/bus/mhi/Makefile
@@ -3,3 +3,6 @@ obj-$(CONFIG_MHI_BUS) += host/
 
 # Endpoint MHI stack
 obj-$(CONFIG_MHI_BUS_EP) += ep/
+
+# Sahara MHI protocol
+obj-$(CONFIG_MHI_SAHARA) += sahara/
diff --git a/drivers/bus/mhi/sahara/Kconfig b/drivers/bus/mhi/sahara/Kconfig
new file mode 100644
index 0000000000000000000000000000000000000000..3f1caf6acd979a4af68aaf0e250aa54762e8cda5
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Kconfig
@@ -0,0 +1,18 @@
+config MHI_SAHARA
+	tristate
+	depends on MHI_BUS
+	select FW_LOADER_COMPRESS
+	select FW_LOADER_COMPRESS_XZ
+	select FW_LOADER_COMPRESS_ZSTD
+	help
+	  Enable support for the Sahara protocol transported over the MHI bus.
+
+	  The Sahara protocol is used to transfer firmware images, retrieve
+	  memory dumps and exchange command mode DDR calibration data between
+	  host and device. This driver is not tied to a specific SoC and may be
+	  used by multiple MHI based devices.
+
+	  If unsure, say N.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called mhi_sahara.
diff --git a/drivers/bus/mhi/sahara/Makefile b/drivers/bus/mhi/sahara/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..fc02a25935011cbd7138ea8f24b88cf5b032a4ce
--- /dev/null
+++ b/drivers/bus/mhi/sahara/Makefile
@@ -0,0 +1,2 @@
+obj-$(CONFIG_MHI_SAHARA) += mhi_sahara.o
+mhi_sahara-y := sahara.o
diff --git a/drivers/accel/qaic/sahara.c b/drivers/bus/mhi/sahara/sahara.c
similarity index 99%
rename from drivers/accel/qaic/sahara.c
rename to drivers/bus/mhi/sahara/sahara.c
index fd3c3b2d1fd3bb698809e6ca669128e2dce06613..8ff7b6425ac5423ef8f32117151dca10397686a8 100644
--- a/drivers/accel/qaic/sahara.c
+++ b/drivers/bus/mhi/sahara/sahara.c
@@ -1,6 +1,8 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-/* Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved. */
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ *
+ */
 
 #include <linux/devcoredump.h>
 #include <linux/firmware.h>
@@ -9,12 +11,11 @@
 #include <linux/minmax.h>
 #include <linux/mod_devicetable.h>
 #include <linux/overflow.h>
+#include <linux/sahara.h>
 #include <linux/types.h>
 #include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
-#include "sahara.h"
-
 #define SAHARA_HELLO_CMD		0x1  /* Min protocol version 1.0 */
 #define SAHARA_HELLO_RESP_CMD		0x2  /* Min protocol version 1.0 */
 #define SAHARA_READ_DATA_CMD		0x3  /* Min protocol version 1.0 */
@@ -928,8 +929,13 @@ int sahara_register(void)
 {
 	return mhi_driver_register(&sahara_mhi_driver);
 }
+module_init(sahara_register);
 
 void sahara_unregister(void)
 {
 	mhi_driver_unregister(&sahara_mhi_driver);
 }
+module_exit(sahara_unregister);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm Sahara MHI protocol driver");
diff --git a/drivers/accel/qaic/sahara.h b/include/linux/sahara.h
similarity index 100%
rename from drivers/accel/qaic/sahara.h
rename to include/linux/sahara.h

-- 
2.34.1


