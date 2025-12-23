Return-Path: <linux-arm-msm+bounces-86376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 684B1CDA09B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 18:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8767430133D2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 17:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04117346A1F;
	Tue, 23 Dec 2025 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4HDq0tT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aXQ7f54P"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A5F346A15
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766509687; cv=none; b=BbTr5RXpPt2OsHQtvBPCmb6CEjWoQAUluGkAfGVdMx5SaiavK5UvZiTU0oUynJOv02H9kNIGZi6+UVu9X59JhTL75KHdu3nvu8/mbdULDoKXeUjAKFSWsxKrOMSUii5Ke7pe0YYXDRBgvLE4C7MxFtlB/7qfLkP9cPmc6kjB4pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766509687; c=relaxed/simple;
	bh=PN8XgGtqW6YgfHr48yEyP7m5MdenrdUHWGoWarnZY1Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mF+wxUsJuXxt8lR8E/PZiLVJNK9BrlTo3RZTFPrq/oIFzYQ8J2N1QIFWEkHAUuuGN01SP/SRYgxxYUBD7zQiBS6a07ZPoXusmh2TFyT4ULBLKr5S8CQ37i1GsIIMYUkJj5pH4rzpf24HHtnmzoqwiXeNVy+9KhMneMzzRKVE30Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4HDq0tT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aXQ7f54P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BNErtAQ461351
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=; b=Z4HDq0tTHyRZcQul
	eGnegLNHouBadD0uwEWvImFKSYkryEFUBZgjlEVV9OyK/pInNCS+ow55edHoxHhy
	8T4cpVGebhej3OwEI5tRUsNOgER2wDwWy3fENnvld7UPLf5dlUh4UF6xWMbadoPd
	1dLpHy9hAG7QvZfAIYpjlE2tcCUihUL3HYaVR/EOvBTo3qfh9JFp2ujHhz2JA8o7
	aks06gGT/DVPLat20Cdg3k1gJ7yjhb869O0BZUXPzAkTXFybRuDFGuBs94TzNViL
	EavKkml7cO7lyea9YwSi8DKX5ZnsxsnQDvNEmavTiT84LaQCCsiBUNY7nYI9Dd1f
	kVfcMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8freae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 17:08:05 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a08cbeb87eso81378525ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766509685; x=1767114485; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=;
        b=aXQ7f54PR30geol0ywmMRJYIxK/BXwrk1rS70dgmR8OGQCbnYP3I84Aa+cz5QMmTP/
         x2RB8u5xUXcuA7l/r/qx+mZ0YHAM8sn85HZcGGl0sZ87YsJJsTTO+Q7Q4C2qkcuc/MUh
         8rWxlf7ncSrqGNnhMXYvIT80bYGc5JehE7EXKEcken64UvH37mOaiXl+AGaqu3AhgdoQ
         q3kXnoCSzMlBT8/IofQ9QkugWeBGMd9XKm1WMEeLZfQxyJJnTK4EuNBRWONZRx5h7LS2
         L1tVlrs7GMC7budylR33cbu2ZL/jvlHYCOvVDFELL8BpQ8s3LWvmmnSlJw9A9Qk/GkDT
         rxDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766509685; x=1767114485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BuJzfruUe3GRTHem0CZT3bmLDfnPw1fzYeLWKqeqq9k=;
        b=wdbBC0k8+Qr0FnHOGvxp2SfWTK9H6CPb8U7H6UcTYmPRYyE5R+04tmtqzGAd4QpBDS
         TozQVZEVHLvTG89y8cUHzbPhxTtZmR7ubDccmttK5hoImymVys8R7FQU0toco8IcIMfd
         Mb6rlrgFTFJFoXpludr6tOnrIB1eVSFn0vVeCLQUYo4cWa9TGHud4/IFGDZgGPFKOtVs
         AzOlfLb6Xjx0DPCxMhpww+sLgvuSQVnWnS7GgUFutYFsSNY8EU8cTUFUP6lA64ovkw7p
         SHaLcW/IahjaflILzI3MoiDgozDeJVd8sQ/GhjUdsSoAuR4LeVG8pyFSn2iDJ/oyPJ1s
         pGXA==
X-Forwarded-Encrypted: i=1; AJvYcCXSSDpC0WUMKV7WL7PUvIjfOCBXDIJhN2eMTWyM6kwQGHHXRC8XnfsgXBVdPwf5gOdijxo54rqH1/V1WLa9@vger.kernel.org
X-Gm-Message-State: AOJu0YyAk6EYdneui/WBFkGg8ntbY9U1NO5FxNwXMophep5Ll+cFFMXI
	nM0ICnjpgzVX1xv7iDxUKm4L8JySe4LVtntJjZ4171STRFzSxHma/BENxlaYCoEiTAZY7NOZXaM
	Owa6CIjca6Id/sBnTLZM63cwpZJgxPbeN0oheXs5dFMenF6JSQBiknhFKbaNcp5Ekn5ap
X-Gm-Gg: AY/fxX7zYWVmwn/d9V97hyjvpcbmq6eZsEempAs5h/gAo/qIlrGpMxlAWQ43gZcpuhS
	iq9x0jC9nRPWKhFoBTQxH6PocAFeh41pWd4OzyWfghcdftAgdooLNONSoU64aFIBCNXFPsQHU3Q
	iT99XJ26MJUeKHSPb4HYscC1d19ty8akba+OryNnyzcCFn7r9NI9gjTMSW9xvOfPcP54/qQxeXB
	ViVpA/M2YR7rl6lhVYfroPPAIXGyn1btdPPEhrTH7ju1IG7b5WXqSRxsqUPc974pI7tvynrS2JY
	V/YOfVpGmkJDvAxRyqqNZrpzzNj8XT1cCqvgqdbPIhiGVWk+HsFFxAthsogrv3l2lJMGrR1L8Pm
	Mm5HvPPG6hIss+Y3e5/SkTYdGw0xCkfrp7OWoQ11/0oMxug==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr95817315ad.46.1766509684538;
        Tue, 23 Dec 2025 09:08:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGU2BHLXju0TwubxmcjP35lXQk0iO7RIkXm4wYR+cd3MUQx04iH8XUNtFvswH3MksQD9yYDlw==
X-Received: by 2002:a17:902:be0a:b0:2a0:e5da:febf with SMTP id d9443c01a7336-2a2f283de4bmr95816865ad.46.1766509684008;
        Tue, 23 Dec 2025 09:08:04 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d863sm130019325ad.80.2025.12.23.09.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 09:08:03 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 22:37:32 +0530
Subject: [PATCH v18 01/10] power: reset: reboot-mode: Remove devres based
 allocations
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-arm-psci-system_reset2-vendor-reboots-v18-1-32fa9e76efc3@oss.qualcomm.com>
References: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
In-Reply-To: <20251223-arm-psci-system_reset2-vendor-reboots-v18-0-32fa9e76efc3@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766509672; l=3584;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=PN8XgGtqW6YgfHr48yEyP7m5MdenrdUHWGoWarnZY1Y=;
 b=0m1D2Z2VqYUtb58Jr5qq5+QFqF7zQVLl0MIKYRgyGEScmJsdxNQ7obTCiuD9ICuyXEpMer/7r
 8fzGy1I+5KXAlnJ3EIWW93HGxOjOOaMi3ojDNjX2ng3aE4DguLHklRM
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: e-I-7L-cJDUzVpt5Xu1e8lDfqg84Z6zH
X-Proofpoint-ORIG-GUID: e-I-7L-cJDUzVpt5Xu1e8lDfqg84Z6zH
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694acc75 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QIdouwm7mKRySFGJXRQA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDE0MiBTYWx0ZWRfX3XRwBk9QCByL
 GFZU3jJ06WEz+5MmP27giiioN2P7B2Rw2baqPdhFid8ldCGdyi2bXCIhLUb29BaONGkkKG086y4
 QKSu2DJ32IPSB7EK7n8HR2LTMRVpXvY3oiP92XZmJSOKeH9HkJdxg/TTYfXG/MPSgCHxi9C/Sl3
 22x6XAzAv+naynjrwFNBW9FhWMvGEiehZPLA/Ij5ymulj8Jaxrz0oqaFNRzkfUaQDBwyTy5L3mo
 UcfqthKeFygQuHkykqb/zKCzVx6PC99cdQrwWgSm2lL0jY2TlIIqB99yeypGU8sXSHVWjmiUw4X
 5WFBjEGxJRdX9ShgRPL2OpN34WyJzte/zoYZNwzbexrTh+ofn1S/hwljgfZ28TmUa1FTDS54aUg
 5gf3kwDuOR467v+vgfDhUN7ZZn3ySVUxvFs8EWLBk0Msn2CrTOe8ApwxbNT6gy05fcm8Vn582pP
 z5iiLppnZRRLwuZkyUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_04,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230142

Devres APIs are intended for use in drivers, where the managed lifetime
of resources is tied directly to the driver attach/detach cycle. In
shared subsystem code, there is no guarantee that the subsystem
functions will only be called after a driver has been attached, nor that
they will not be referenced after the managed resources have been
released during driver detach.

To ensure correct lifetime handling, avoid using devres-based
allocations in the reboot-mode and explicitly handle allocation and
cleanup of resources.

Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..4b6ae4007c4f6fb7d51520b4be2bf3cb1dff518e 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
  */
 
+#define pr_fmt(fmt)	"reboot-mode: " fmt
+
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -71,9 +73,11 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 	struct property *prop;
 	struct device_node *np = reboot->dev->of_node;
 	size_t len = strlen(PREFIX);
+	u32 magic;
 	int ret;
 
 	INIT_LIST_HEAD(&reboot->head);
@@ -82,19 +86,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
 
-		info = devm_kzalloc(reboot->dev, sizeof(*info), GFP_KERNEL);
+		if (of_property_read_u32(np, prop->name, &magic)) {
+			pr_err("reboot mode %s without magic number\n", prop->name);
+			continue;
+		}
+
+		info = kzalloc(sizeof(*info), GFP_KERNEL);
 		if (!info) {
 			ret = -ENOMEM;
 			goto error;
 		}
 
-		if (of_property_read_u32(np, prop->name, &info->magic)) {
-			dev_err(reboot->dev, "reboot mode %s without magic number\n",
-				info->mode);
-			devm_kfree(reboot->dev, info);
-			continue;
-		}
-
 		info->mode = kstrdup_const(prop->name + len, GFP_KERNEL);
 		if (!info->mode) {
 			ret =  -ENOMEM;
@@ -102,8 +104,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 		} else if (info->mode[0] == '\0') {
 			kfree_const(info->mode);
 			ret = -EINVAL;
-			dev_err(reboot->dev, "invalid mode name(%s): too short!\n",
-				prop->name);
+			pr_err("invalid mode name(%s): too short!\n", prop->name);
 			goto error;
 		}
 
@@ -116,8 +117,12 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
+	kfree(info);
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return ret;
 }
@@ -130,11 +135,15 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
+	struct mode_info *next;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		list_del(&info->list);
 		kfree_const(info->mode);
+		kfree(info);
+	}
 
 	return 0;
 }

-- 
2.34.1


