Return-Path: <linux-arm-msm+bounces-77288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BA8BDC7ED
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 06:39:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A365C42058F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 04:39:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB5F42FBE18;
	Wed, 15 Oct 2025 04:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkFsP/nO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4EE2C11CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760503138; cv=none; b=gKWA5ToQQNCsvRABb9fj2lwck7vVkeV07d8oel6QTqlCPpn4W+KruMwXnifdN1i6w1NH72yiLD+qP6J+xkJSKnrHwTfCH5nuVviN8Z4HY6yZWqwbJ8UsppiEOR6zGmgCA5ssCGOqCPqY33ztPx9Kpm9oWm2CvstQOMt5r92rOQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760503138; c=relaxed/simple;
	bh=OtVs7gPtVXV3AbZFz+D50jHX3+pXlZ1jHuc0GH75ZNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F+MQHtHteG5OesfpJYts+tU7HBChtVsszoQoE8MAITQRQFvXaDhWIvyVA39iPJ06TSMZVB9/WfRdk1vamHQRbxcScWMBHyDCrWLEN5IxBm/GWOmyG4J2bhTaCD4XsNCXfqI/ru5c6r4iAS5lHsBAbxbzQcF89L8G59WOiOoACaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkFsP/nO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sPv8009987
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmMn16oiZkqxnrWnAxeSCVdi+UZd2TgsHXVJWSGcec8=; b=VkFsP/nOeLYBwERT
	ne610HQ5VggqFib/N1P8hd1d9wrI5DgTEDcWdgNK43E4eolKC3mXSoogtsodCsWb
	DR8MiYuYH/rI0cIRGjaeOotlfyYcDm8RsThMO/hseX0Qn05VGHXb1tRsf2/fMaO1
	YEVs4AE7xYaj1vOwLZnoq/P16fDqkyR4APoTmMWBZkyoOMcxj/HB7f8h3L5XZBGb
	i0TcpG42K8pCdcJX7UvcVPr8Du/ZYNyL+FtDDtpprlOeRXJeDT7NJQ/Dt3emUim+
	kR36BIhupdWUNg8zNOgPFF8tRyZfCodU3+phx7Un/CDBCQUo8wuB8Ix43OW4RKJ2
	QDoxWg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c30qv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 04:38:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b609c0f6522so16884059a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 21:38:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760503135; x=1761107935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmMn16oiZkqxnrWnAxeSCVdi+UZd2TgsHXVJWSGcec8=;
        b=hT7i2tiSA2IaUoGsw4KSpYRbLGkpAZbV/twiS0FdMS6p1Yh+5bM7PRzSRJeBqvAwUN
         szpedMv3a4CfSDSkZvoCVIrDMAHy41VxYxLSq5AVK/bv+gk/jPA0yFLah5s5SSG7wAjI
         ayNe8CmnKuMxcZduI9FDem60/RyADP5DQ/6t0/OpyBiIxOeaBXzO5piyyQqfc7MvEmKv
         Gzwto5g7XtSkBvpmsvSJRMQ6hlBnsJLF/InLMqcKDgJcFQEvFxzW9XHNL2ZI8C6AU9sy
         T2pJv6H9pxJ3fNSD2UT5oCn02w8xLJWum3Gkwyuv5K3ZGKavPCXTYPhS+XKBnTnqAFFu
         WT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCX74cWnoZpZilizxjPhuBydxg9mzhacsPM8775MVkuYQZZW10bmVZZGhclY4QHcgKlZqGBWqAjCTqpJ16bS@vger.kernel.org
X-Gm-Message-State: AOJu0YwoLdfGNboHszsAPII+ZFYX52FoeBFZ+WeYQTPvt+wVMjwj2tnu
	C9nPjmQKs4cnLtNohHq36oC3C5BIw9hAyT1RRb55DRpM4UqAKyz5f/HVyB099fEmkhLxn3C20Bz
	NQYe7rMkyTemUqbTtvJhYNRpY6xK9LqG5nvTWHeN4bpkaKNRbqRD65r1s+RUKdEheB/kH
X-Gm-Gg: ASbGnct55H57702YrxcDfgJUta4JIFk5Kq42gBfKbR9lHeQewfdTv7wFibZhjtC4tp4
	GVVjuiFst37IX5vGiLRdG8wwfxd5nJ23RsMj7OTIySZ+h3ZUc1tCjprL7Vt3JSR+6A9JbXPhcBZ
	Fx+6BNi5ANWtL1cg6SYNHEuQdpQlTndWUVBbQ6RtNo0GyUdoXjK7GASTdd5AAUUGtgVtuDo2R//
	42d7Zu+I7uw6zm25sG9UqUa/Ju6HXOejxHqIAbUjxxRLVNr/SXtOYzCR2M20KNVMfl0tJgQJAo2
	QNF9o/eYOCfqVcfIEvOje53aLVZNlqxhBhButS/XkzKqJjlsQlhIPWcAFqo5boG/++B+JA/cWwS
	8
X-Received: by 2002:a05:6a20:2451:b0:24a:b9e:4a6c with SMTP id adf61e73a8af0-32da845e56amr36724184637.44.1760503135327;
        Tue, 14 Oct 2025 21:38:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVKns+WH1b+2HA/4V6zn/xQ+uKFTYWlVwFA9Wwz9Isp6JLyOr3DJ9aSrokFcHMG4mh5b4zYA==
X-Received: by 2002:a05:6a20:2451:b0:24a:b9e:4a6c with SMTP id adf61e73a8af0-32da845e56amr36724136637.44.1760503134857;
        Tue, 14 Oct 2025 21:38:54 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787af5asm705406a91.20.2025.10.14.21.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:38:54 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:08:17 +0530
Subject: [PATCH v16 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-arm-psci-system_reset2-vendor-reboots-v16-2-b98aedaa23ee@oss.qualcomm.com>
References: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
In-Reply-To: <20251015-arm-psci-system_reset2-vendor-reboots-v16-0-b98aedaa23ee@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760503106; l=5376;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OtVs7gPtVXV3AbZFz+D50jHX3+pXlZ1jHuc0GH75ZNs=;
 b=v1Z3sIrJnp+p1vx3+/8x8RpA9Lq+vHLUyNUqpNTg4EMNZAbx7XlsBKBT/5Mtq2UMUUTEp50Z/
 SKgY5JUSTDCANcP1YLQ6KmboUnTGR08O6Jvbw1+3XoUPQESRgdw9tzn
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: Nunb1XVAuqxJeh1UCZrqf4k86qgpOdLP
X-Proofpoint-ORIG-GUID: Nunb1XVAuqxJeh1UCZrqf4k86qgpOdLP
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ef2560 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=239sejjMsMoxT4pUUhgA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfXz1ztUlyMl6fH
 7USSWXbRGe5qskh5v2D/5lYto6je8qLX+JiFCW2GWQbTX026b3/kX9pLVnn0pLxSDv+kxlg4g1q
 ZHUAordrPvQl2IyE03WdTx7iocxPD06DEZkkDUeIX56pRBDR+haF7eCZzpCZFz7no6/OsvcquDY
 8PYYPVxM9cPxYXuOh2oCkzQid9iXjCgZaKd1RQ6ABWdmbRyNRxvM6TgAWabwP9REPIpLkWxXkNC
 Bb4k1KN6lzl/R8aq5XwC7fSv6nyssYS6UrBSJVQuCqqpN6aAb0RQS+9/POMnufiNdM+DvK2xZF1
 xmwxrwYXAEXLfjabLPg14WT0eBWzJij+MeY49oNSSmsJgV3M4a1H+X1KCUcC2JrXwUTVVr8sh49
 IAxrDk+Qzh2MY8zHCFgOm96yASTkrw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
firmware node (fwnode) based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
 include/linux/reboot-mode.h       |  3 ++-
 2 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 8fc3e14638ea757c8dc3808c240ff569cbd74786..c8f71e6f661ae14eb72bdcb1f412cd05faee3dd9 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,13 +3,17 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
+#include <linux/slab.h>
 
 #define PREFIX "mode-"
 
@@ -69,17 +73,26 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @fwnode: Firmware node with reboot-mode configuration
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
 {
 	struct mode_info *info;
+	struct mode_info *next;
+	struct device_node *np;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!fwnode)
+		return -EINVAL;
+
+	np = to_of_node(fwnode);
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	mutex_init(&reboot->rb_lock);
@@ -89,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			if (strncmp(prop->name, PREFIX, len))
 				continue;
 
-			info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+			info = kzalloc(sizeof(*info), GFP_KERNEL);
 			if (!info) {
 				ret = -ENOMEM;
 				goto error;
 			}
 
 			if (of_property_read_u32(np, prop->name, &info->magic)) {
-				dev_err(reboot->dev, "reboot mode %s without magic number\n",
-					info->mode);
-				devm_kfree(reboot->dev, info);
+				pr_err("reboot mode %s without magic number\n", info->mode);
+				kfree(info);
 				continue;
 			}
 
 			info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 			if (!info->mode) {
 				ret =  -ENOMEM;
+				kfree(info);
 				goto error;
 			} else if (info->mode[0] == '\0') {
 				kfree_const(info->mode);
+				kfree(info);
 				ret = -EINVAL;
-				dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-					prop->name);
+				pr_err("invalid mode name(%s): too short!\n", prop->name);
 				goto error;
 			}
 
@@ -123,8 +136,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		return 0;
 
 error:
-		list_for_each_entry(info, &reboot->head, list)
+		list_for_each_entry_safe(info, next, &reboot->head, list) {
+			list_del(&info->list);
 			kfree_const(info->mode);
+			kfree(info);
+		}
 	}
 
 	return ret;
@@ -138,12 +154,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
 	scoped_guard(mutex, &reboot->rb_lock) {
-		list_for_each_entry(info, &reboot->head, list)
+		list_for_each_entry_safe(info, next, &reboot->head, list) {
+			list_del(&info->list);
 			kfree_const(info->mode);
+			kfree(info);
+		}
 	}
 
 	return 0;
@@ -168,11 +188,14 @@ int devm_reboot_mode_register(struct device *dev,
 	struct reboot_mode_driver **dr;
 	int rc;
 
+	if (!reboot->dev || !reboot->dev->of_node)
+		return -EINVAL;
+
 	dr = devres_alloc(devm_reboot_mode_release, sizeof(*dr), GFP_KERNEL);
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index b73f80708197677db8dc2e43affc519782b7146e..7f05fd873e95ca8249bc167c21aa6b76faba7849 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,6 +2,7 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/fwnode.h>
 #include <linux/mutex.h>
 
 struct reboot_mode_driver {
@@ -13,7 +14,7 @@ struct reboot_mode_driver {
 	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


