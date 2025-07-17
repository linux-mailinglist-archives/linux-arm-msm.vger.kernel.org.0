Return-Path: <linux-arm-msm+bounces-65463-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDA6B08D58
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 14:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8D31A7ADCD4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 12:46:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6072D63F4;
	Thu, 17 Jul 2025 12:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Li7ofBKi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19BB4299AB3
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752756475; cv=none; b=TibKKF1iotI6R0zYU+wpjUvvxGvcUR9Hg4776Egb2CMR9cPH86QXyib9O4RJDeIFYHYPKvoBZTZKHBhGXz+byT5mDmQn82mPpMOFx5vYJk/zM4uBsT83Jv2/M86fF2s3Eyq516zhilfh+DDf5WTL3pALfyDjQpWAkY++0Ucp2BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752756475; c=relaxed/simple;
	bh=Ac0WjvV+M2yFP9Da/mh/o8GHODNrcW5YrR+v85Mz4Aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GNk9soppHORLcwvAjTgN60KdzpEbvCWHxBRnaC0kMTdBT41v+koVB1o8Ky5k7fGE27Ph6BqErGhTrMyL+wf4ign/CmAffXcmsvREjIrVmImCkRjQfxALiTqg/H6rwnco5y23D5AvmkRnciPFALjtZK9VrouNieLCo+s+bVDZvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Li7ofBKi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HC5lvb020761
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SiZpTfe8Zu+K6BMsKWciZIsGv+skYHmcAh4GOfMFdWc=; b=Li7ofBKinmY2cAVn
	79Bvy9YiXw96IOTZPfIrhChJkdb0NLe3/fgj73gL9n1PiAE8rgDez6onjPRem/Ir
	fG1CzI65mA7fXo+D53pLUsOvYxSvtm9OkB11r/zbyMyjZ3a/iO8bvCR1AiyjodqV
	0yvnY5m649TXi+94CiD9qs9aDlSoiVvxOVFMc6bDmaDdakcymcR8DEwX+2C0caqZ
	Y6ivNYOqD1aNrNDVBtHHYQE1ToqRe9SG7uV0dCHTD6ym4ZC4+DmoqQZ4gmFeuE4r
	pdId6oTHOopS2eF8yNFCUhA1JHUpu0CJWUbiNotTE0V8Vvnm5CEAUQffJbfLjSrS
	XV6I/g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpjq0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 12:47:53 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b3642ab4429so697040a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jul 2025 05:47:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756472; x=1753361272;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiZpTfe8Zu+K6BMsKWciZIsGv+skYHmcAh4GOfMFdWc=;
        b=irpIxnFN59pvNCmJfYXyoWasmmfVlGCXwmVUnIlxSmpY2fQDkeWjJf8Fhor43KS5fa
         4FuBzScTOyaU1NK9cfSW75a29aC13KU49wFI+eWHKoSxG5zijZdLGwDGp1IU2t18s6CJ
         jfR+XK3+AV0K/cSRMmhFavDeNALrbL9cZZExHFrTa1xkrAs7lv3cj64QfRTbPtxPsE2Y
         ZYJmnV/mtiU1euM+nhYZqW1Jgkrcs1nLIWas0L8fIzewa48gpclNbFdy647aegw5KfNV
         T+wlNAP1By0Wx5kgl1QZy2ROD7q/SOpURUYjDIKc8KA8RoOyWXJot2YyOIR3gVT//dhh
         JvsA==
X-Forwarded-Encrypted: i=1; AJvYcCUHiH/31EUhn2VzYWGlctBoVyySgTDf709KyuY8vhJG3dQk4z7Vc4qyJJ9Wa9N1OUADwirat1O6TVdZtIna@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTDuPPYasFyHR4xPrwtxUAWBHd9mBgC7YgkdtPkIZYUMUiL2n
	w7+D1a9nYOdWKPLbUY/8X1MjHTXjacvuF4lnFd1ClCReYlQrs9ZNik1jKzWvZE2iIGqrihin7Nx
	1Uz6+25y3WdmKstfsm0B0Zf8P/A8mlaP7w0yKwtAGuBYzL0d+pKP+xg+M05s5rcHJAZdm
X-Gm-Gg: ASbGncuYxI7sRJks/5YYffSrjK3Q27Y9uk4TVa6P9Ratb6VzFKfE+eLr5CACrluN5Co
	I1jcooyUMehLi6OlfcAph0awoKKt/wdcubsbezSWr9SPG6q2tzYww9DKP2ZxPPiCXtgYo2PFE7V
	4ZZGq53B39lfE7SLn8yKMRKZL5ASBLBMh7qgyS+jLLV/VOSL1vcj+nTYbj3vZYdEsZOjlNhpWrw
	2IF09cjtrbEMBM2jxnef9W7JU+DzfAJQDf2BjNmPicj7ZoOakHlFFP4n2ykHOaIm0c13wXCDvo7
	XFemKyagE179jPEaEGrtnX41cyrT5zFWcLLyceH2vUp7frjjO/nc0ecBb4EW079sy069Z5lZaXZ
	I
X-Received: by 2002:a17:90b:50ce:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-31c9f45b0abmr8446895a91.31.1752756472123;
        Thu, 17 Jul 2025 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeDXvff2phI+gdj5k/aZjVFSg5HoF5SSERKmlmox6bjKji8pYexr3zYbXI3CwHG6Qv0EEU5w==
X-Received: by 2002:a17:90b:50ce:b0:312:f2ee:a895 with SMTP id 98e67ed59e1d1-31c9f45b0abmr8446852a91.31.1752756471656;
        Thu, 17 Jul 2025 05:47:51 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31caf828a0esm1505283a91.42.2025.07.17.05.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:47:51 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 18:16:47 +0530
Subject: [PATCH v11 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250717-arm-psci-system_reset2-vendor-reboots-v11-1-df3e2b2183c3@oss.qualcomm.com>
References: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
In-Reply-To: <20250717-arm-psci-system_reset2-vendor-reboots-v11-0-df3e2b2183c3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752756455; l=4290;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Ac0WjvV+M2yFP9Da/mh/o8GHODNrcW5YrR+v85Mz4Aw=;
 b=jQZGEPbbqcRPTYTNCkzogKxfIiutINDN+O/ZIaySmkSbWhNHqd/Y/564EWs4jG5AxSxgCntTq
 A4sgUiptrehBNUzt39OkoGp3QkKGGtncvx1v5my+muPAQH1Lc2Z+7j4
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMiBTYWx0ZWRfX7dKViQz+NQso
 oiUBr96yK11P7hhguLHNuDNygzJz90Xi3DoJL0BZdhNGBIGXSjmtPK3KrMfpI4keuLozCJSLHdW
 GLdkcos5G2BCW8xFjbH2668fkF07u8LY6R37G5oIJcYTSPtg6uHDQp7772vi4hnobWax5t6GOD/
 qADQHBAcEZM7Y1S6Sj5FgF2gBnDHgoQ+0It20cm5V/2pI/7wO/bTpJD6FsCrIOdzVIAWEV9nptW
 4N/TCLij5S9Rjsp+3g/HLmoUqr6GygCmeoqmgvXtNpjhKwtVNnBhYGSocyyIdT9g29D8HAn5tMN
 xKlrkf/BH23F/lI3uC9J1lFWYd5+K+JDoeB3XgFobPFROAclSO2kFjphuJC7X5ngksngJq4IrZ1
 4ygH747IPTdZLS/+SaH4eA2ZaD4Aup4MDE5h4IKkYCpI0XSCXjhLaBT5iDVcNjfZ7kShEAZK
X-Proofpoint-GUID: jP-UYVZm66wLPStYjrfLDJPx_LbgwUBs
X-Proofpoint-ORIG-GUID: jP-UYVZm66wLPStYjrfLDJPx_LbgwUBs
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6878f0f9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=IcmTHOqSNbDvJ54L4SUA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170112

The reboot-mode driver does not have a strict requirement for
device-based registration. It primarily uses the device's of_node
to read mode-<cmd> properties and the device pointer for logging.

Remove the dependency on struct device and introduce support for
Device Tree (DT) node-based registration. This enables drivers
that are not associated with a struct device to leverage the
reboot-mode framework.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 29 +++++++++++++++++++----------
 include/linux/reboot-mode.h       |  2 +-
 2 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..0269ec55106472cf2f2b12bd65704dd0114bf4a3 100644
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
 
@@ -65,33 +69,35 @@ static int reboot_mode_notify(struct notifier_block *this,
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
 	struct property *prop;
-	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	if (!np)
+		return -EINVAL;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
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
 
@@ -102,8 +108,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
 		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
 
 	return 0;
 }
@@ -162,7 +171,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
-	rc = reboot_mode_register(reboot);
+	rc = reboot_mode_register(reboot, reboot->dev->of_node);
 	if (rc) {
 		devres_free(dr);
 		return rc;
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..36f071f4b82e1fc255d8dd679a18e537655c3179 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -9,7 +9,7 @@ struct reboot_mode_driver {
 	struct notifier_block reboot_notifier;
 };
 
-int reboot_mode_register(struct reboot_mode_driver *reboot);
+int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *np);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot);
 int devm_reboot_mode_register(struct device *dev,
 			      struct reboot_mode_driver *reboot);

-- 
2.34.1


