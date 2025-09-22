Return-Path: <linux-arm-msm+bounces-74424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB08B91710
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:41:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 348BF189A36B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD0A230CDA6;
	Mon, 22 Sep 2025 13:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DuVykh36"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180CA30CDB1
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548453; cv=none; b=reProjG5KDXLZEV2SoTygTpc4IyK+FIKt/wMQVwVHRugRrE0EcFk7t11GQL7ubVpy7Myrz0GNIzl0TqNo+lbzEt5hjE5SauUtRrTzAvNC1aq28puhi806RbxGK86DnP9TRoS9R2JJBh8s+iTb7jkAJQs/NRN6P20smZHJnJParg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548453; c=relaxed/simple;
	bh=OtVs7gPtVXV3AbZFz+D50jHX3+pXlZ1jHuc0GH75ZNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fmIVt2pLgzYYgyOPnDtbg/s4LwoGtS/ZNfFkE9ZXDbAEa7iah6uNE2gjgazVAcYSV1VOAx2x72A7EjmU0LkOneP5iCFMhupl6Vdqd72J0i27gVI2SaUOxhY4mRtViJHNSV9zy6TSexp0w1t4qhvCjZPpnhMCD0k/1S8exjzhe/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DuVykh36; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9GHjC022966
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vmMn16oiZkqxnrWnAxeSCVdi+UZd2TgsHXVJWSGcec8=; b=DuVykh362S2jWEPu
	VTCMgw+s3yPEUcqJbNuWF8UgPsjfw+tzK/Tq+UfvfPjDq7Lo5rlMyBvbJv8qX+7Q
	oGfv0C/ZnfgvZ3/PnBjvtZugsWcbcwK9MlpzB02e4dxqofoASE3OwGrmYiLePxac
	zfmgSxDc0LgXIyJaaOZb/0SV7krdoIPX2kJiOA+4GTSIH8mvvLpbP1tPa3omNZgp
	IaGdyFcaicTxsJJptt3+7KCztquUJkHhqS+lJpA6A/GsgFprQA8utXIH13UBdsQk
	3w6ZjB8jverOSmq/vUXa0YEcmQFwLmXxegs7zecip8sey8T9dWVs11OV0LwoMQP6
	p+Fmaw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3ny8px1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:40:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581ce13aso81286235ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548450; x=1759153250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vmMn16oiZkqxnrWnAxeSCVdi+UZd2TgsHXVJWSGcec8=;
        b=ep6agNZzeJw4J7RcT6npcs78b4yysPM79EeKB3dkyug173p1qQQ7GSD0nP9ZnwTCOZ
         6ryr5fZghRXrxIQuPIRCGLH/GM1H4wQfNz38COw2v0BmjmnB22Gm+ZtvdquM4fXq/TYM
         /Gw0Y41mkLSada6eCrmvEuKs9eavrB8fuFZUDND0/0gT/oRxDRhZjauzqfmx93UCYH/x
         fy6XAClqzh25fjupgmZglu/Xp6+0e19XObOFDIv6Xt++2DlkGxLeeUU3UDa/JkpjgTQW
         +s/VosqImFQ6NBBlokYXCvUPxfreqCv+3Su+67h0/C1DFOI2saIv9sLWKfxSIQWKMh60
         HwZA==
X-Forwarded-Encrypted: i=1; AJvYcCVZ4AKtRAPNMZ+zt+igzTu7UDdh7i72OtBeay04XZEzEXt5Dzzm4LjVM7X3gBcbO4Wgf6Fi3Ed/w11YqhUd@vger.kernel.org
X-Gm-Message-State: AOJu0YxjVQKg7lcC+e3wtokx6sJ4uy76sU6zeUA5/9pBUifjOwlCnKZM
	hNcUSONsZ1UD9agEdKw+bld+dzQbmoLDifScwc12nJyy4s6wEFRrNeBTJ5HNsRI7+6FIDfRB24u
	cdMWbAzsciDYUV8QIcbRUalEBKz5lX3QG8rQ04tzPkx4GIkTmG3FewN2IUCMZMKYv9DRu
X-Gm-Gg: ASbGncuQTslkuMgP/ix7QWrhhJ31qXOizNSp1ktLrhTP/YjunOQsDSWvjtX7pawi6Ns
	16vLhrijCm/ke0xqWLElhYFYtTyGF+kjupzZePrc5kTKQ1Z7r8ghCCs3mR2IZed4ze1sDDetiED
	aYDaNRp1UCNxIN+57Lpkzql760kX4iAcrnN9RcVSvSTMIygQiC3eesRYStcOkSMMfGlp8JmcJH6
	ZTKWMtHyw7znm/YJ+nn4yf7Oi7K3V6D3c6/OSPqlpAmtFtPtzzzmx8mHWRyGXLMNrNmmgLE03rx
	IiLkoF5P5m7kdhNJ2LEIEP7MHiLDCDC+yyAsCRr9RULgViN+9vHdefE8RjStD7mrtqXmtGDZ4e3
	l
X-Received: by 2002:a17:902:f54e:b0:271:49f:eaf5 with SMTP id d9443c01a7336-271049ff060mr102463375ad.30.1758548450208;
        Mon, 22 Sep 2025 06:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJLarzGKvKl9HgTKxpDtBRtb2AXq2ZCgS3r1CAksTaBDdckn/+MrwC4zD485alAKlinWboPw==
X-Received: by 2002:a17:902:f54e:b0:271:49f:eaf5 with SMTP id d9443c01a7336-271049ff060mr102462645ad.30.1758548449690;
        Mon, 22 Sep 2025 06:40:49 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:40:48 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:12 +0530
Subject: [PATCH v15 02/14] power: reset: reboot-mode: Add device tree
 node-based registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-2-7ce3a08878f1@oss.qualcomm.com>
References: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
In-Reply-To: <20250922-arm-psci-system_reset2-vendor-reboots-v15-0-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=5376;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=OtVs7gPtVXV3AbZFz+D50jHX3+pXlZ1jHuc0GH75ZNs=;
 b=gJ1mwrSZZc5KYCfmG7idToZL91Qco+UvkVqPCmh2hbufifqTgfLagRbsAws6bAWcUYAEU81PP
 hHIaDeYiIR2BvRQ+7HSFlwYrGlgA12jbO0CNQDNACk9eGuCbFy+Crmq
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d151e3 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=239sejjMsMoxT4pUUhgA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: mJ1-HVOzIMABtMvF8-oPksrCBxcEkgyr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX3M/u4qNGlxAi
 4ahU69V4hj84WFVQVPRb/tPPDqHiJ0GDKWBSvQ15v8JK/yJKX8Vitl+11W9FN/TL0VifsNuC5a0
 V/Vz0w35Z71wMHiCMCCkFZ9S7Wqem6deRaFSbtS/TLbSPYSutZqgYDhuPdJzPnAsnhfbt50Fjmc
 IHxBY/W07y8OjnYR3DoS7by212mJKIH68VPkfVdL/UUkT4bO1nTi+Zr+G6u+6Fwf82OFwMpfgQL
 RLUk2DGZANK3ZQl4F+ITsfalLqVUWp2D+NOQ3vz1JivTEo1Xb2qF4fonOIf/QzJkrwcB/2gOu5q
 xnX+YWX/b8DYM0JffynLEWzqn1Dc0GA3vfjpk83i+Lw7ckTBS8ydmp+sAgiESj79EO+DPphEPza
 R/xdJBIu
X-Proofpoint-ORIG-GUID: mJ1-HVOzIMABtMvF8-oPksrCBxcEkgyr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

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


