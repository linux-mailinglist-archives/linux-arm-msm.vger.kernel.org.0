Return-Path: <linux-arm-msm+bounces-69375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FD2B28205
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:39:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AAF561CC7032
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:37:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75E50224AE8;
	Fri, 15 Aug 2025 14:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bMHDQ+fe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8219233D85
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268609; cv=none; b=urHO/HuDC0qcxgZq3jpS73bDDPTkn13HIVJh2BS4FPCIFNyJFGbXMhpJgaCYkpbcnsxPicgPwUHzpe1HGBiGTMEqZvbYCgeKBJyYIwU11/HF0huJltemG7yj27EIpkDJCwYaFVyacKl01/+dXua7lEzfJn3I3VLpu6s5GptdXw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268609; c=relaxed/simple;
	bh=BzWfToJE3ECxETuJZ3k/sBp7q/SRF/jEhj86+u2O1rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fzMrB7yE6hOEBjq2SUHZDgMQjxAg+ci0FIKCHPhB7uxRwGz8pBfqUv9sM/BIkYYypFv//zejvF72GmqD/O6bUPABOBfqxkAOUdFRNzUgVrnf/3zWB4uGp/S0lOrtAjJcaMHTUtYR7jB5YNGZ1Xc7Hi3qEIUa4YlHmeIbt5qpAD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bMHDQ+fe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEL9Ci031974
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=; b=bMHDQ+feRetjFTrc
	m5JlDNqAhot64rJRTsRRmgf7cf42kyAgR1V+l7Y5D0ECygAxX4/yeec64BsqKnlY
	YbDiwkw7JnoKjaykTWPb4/xiIxDtwRWb7v3OmOOG6xxAbQZBxLLAd+vdmrfjKd58
	BcfrdO21VrJvSfRqBiGzNHKrs30CIfgpmwi82btpa+9v4qyVrNIWuivMx/TBmhVD
	upp0jI3exh1jVPrg5Kj+c9k32yJPhbZienJxS+Oi9N/hKcYwSan3SSZnHvcpAuFN
	sCUpMqtH5WUAFL4CVbXZYrIqQulAhHSOkM4WvjmhhspFX+4NmbY91pUpcVOoE+Wp
	5VqMzQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffhjy3jh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:36:46 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-323266dcf3bso1901461a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 07:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268605; x=1755873405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDqwUezYGa9CZCaFbdXED7PEdoZ055Cwe3xHxx1ns7M=;
        b=FRE3BWTJRICnl358fzwsowOj2z7VRoQJFvzHZmMunW+N9QNsW73tVMqkMcTt2Eg70L
         gyBoIl1xjQL8QQ6bq8cJFm7pMEiwG7Q0SawB1E6ozQljTWCnwGrwABYpMGbZvJZBhLfm
         FkifguLq+/mT4v2NitiipTxtEl9U7dBkLSusVJPccYLxIePXV2vzkSRKrSlp4NcS5AlF
         +BcFgfnJ/2bUfdT5rok0wkVcltqDFHNJZ06590ReRxS/BYqgY8h7+Yr0GpIeWERnaNxB
         JTbt76h96s2tNGLKbaTC32EOKbERXrH0mFMtnUbc/sgEELEq7vYEGOysdJ0S83465V23
         /u/g==
X-Forwarded-Encrypted: i=1; AJvYcCXECGfJ1kzp1x/EVXaLv1iFiUGWTXikAznIEX3eO7F/8IZ98frpPi6Jcdf1vqf6qNItWDwOcufXaPHIhVIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwlK4eFXGkoK+VV0fz4CXPraqo/yi8pkcTGI741UDJ80Yy/gg
	Yd/i8eAUH+QPMZJtrxrRkIJuW2jFhFaI0FAtu9hqSiHlPYuIGIuiFUN2QBhHzCzNmFO5+edDlQ8
	7Ujfq/02e1VVQX9NG8HhTeGqpnhP6XrJq9C0WMW8eo+xGa3D267A1gqRC3hTzP16JAvZ9
X-Gm-Gg: ASbGnct3QAnONxkJBvohvoVLfhzIBSCBzUderBaT/PVE5dBoKzbe7vS/HQ7NS+lMeIE
	ibT3P9rQ318tCI2OSVc3JJcGEu1lRfYF5wVDeCQ+2GxcJMU6wtNuomReCtY0EFrBOTCXhCxT2NC
	Vv3GwHqMMkmoNmeDy+p08PtxWjZTRJNfw5KGPqPzAdyv2ZriF0gRpaoWnQuokNRFWXBYGLZBBQ1
	fdu1RKHuBLW6L81XaYMKQnIeh+AylnKOCvygyCmGnvxbuINsNZ/jpdrMvIKhE6dTAvsoS09swko
	JMAMmEY6baTJFDkVSQ5bHuoF8SOERoj+iehJmFMFDKQ5zP2Ot/O+9szIBM+grdfwN/ZqCdgFAwZ
	r
X-Received: by 2002:a17:90b:2dd0:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-32341e5e0a4mr4204560a91.0.1755268605454;
        Fri, 15 Aug 2025 07:36:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqZ62D0ilw5h3pOxyKsD9atT57r02HUkM9y580UM4/h+lMlRwpO5+zb86tLI7CTdiz0ij7TA==
X-Received: by 2002:a17:90b:2dd0:b0:31e:f351:bfec with SMTP id 98e67ed59e1d1-32341e5e0a4mr4204499a91.0.1755268604960;
        Fri, 15 Aug 2025 07:36:44 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d73619fsm1437576a12.39.2025.08.15.07.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:36:44 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 20:05:07 +0530
Subject: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
In-Reply-To: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
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
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755268580; l=4877;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=BzWfToJE3ECxETuJZ3k/sBp7q/SRF/jEhj86+u2O1rk=;
 b=RYuLdurTXlXjQtCHE5nX18yZK2e4lWHzqk3OBDVjfSP6IPXK9bBT/5bHpFJuKNoKQTKctA3aE
 EXCLcCs1FcgDo9wc3NWVVqzdZmL2XVhAsx81HO1e1vIlJH9mOiOFdu7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NCBTYWx0ZWRfXz9msnyeibHvr
 l6PMDRRP38uYsJop7Dy5Y6NOYka2STJnhesCxyrCiK87L+7MIus94ljQWyDX6OwKVHekHNaykqK
 TOTJfldK3zJjGizTomiZU9gIuDONukT8fuz9sLYc/agbaQhxeNkRITJzaRXBgNMfV4104UBKlvq
 w0gBWx81CoytK/weUEkVibDqfjbbL5+n/0+MoCPubUXYA2dVHlxG1QQF+wuaLWnYmGCkDk69r3s
 eaoABcVU1BFEEmqHOWqylzFTvInOUhY7bgDg/hFlCq0A4kZkjIeNXiQuHy1hYbbr17Bzrp7O2tc
 iaa1RPLde8SEH6uxZZuf16toscgsOtWWM8ywsO5yb6Hgc7miCJ7DJRlYbdvgjEJ3yzp+3O+2K/e
 zJ2cJK0w
X-Proofpoint-GUID: 8NfIQhgPJILit4p1S2mVNcZexN7e1IPx
X-Authority-Analysis: v=2.4 cv=TJFFS0la c=1 sm=1 tr=0 ts=689f45fe cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=IcmTHOqSNbDvJ54L4SUA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 8NfIQhgPJILit4p1S2mVNcZexN7e1IPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110074

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 37 ++++++++++++++++++++++++++-----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 42bb99128ed3846d4bff62416dc31135ddeaeb90..9bb97bcd33cd3d58c75c791e9b568024e810e5b0 100644
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
 
@@ -75,17 +79,21 @@ static int reboot_mode_notify(struct notifier_block *this,
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
+ * @np: Pointer to device tree node
  *
  * Returns: 0 on success or a negative error code on failure.
  */
-int reboot_mode_register(struct reboot_mode_driver *reboot)
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 	mutex_init(&reboot->rb_lock);
 
@@ -94,28 +102,28 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
 		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
+			pr_err("reboot mode %s without magic number\n", info->mode);
+			kfree(info);
 			continue;
 		}
 
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
+			kfree(info);
 			goto error;
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
+			kfree(info);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -129,8 +137,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	mutex_unlock(&reboot->rb_lock);
 	return ret;
@@ -144,12 +155,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
 	mutex_lock(&reboot->rb_lock);
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 	mutex_unlock(&reboot->rb_lock);
 
 	return 0;
@@ -178,7 +193,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index b73f80708197677db8dc2e43affc519782b7146e..98f68f95c9e8460be23282c51ef7fcbed73887bd 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -13,7 +13,7 @@ struct reboot_mode_driver {
 	struct mutex rb_lock;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


