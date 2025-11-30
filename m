Return-Path: <linux-arm-msm+bounces-83907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A89C95358
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 19:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ED5F14E1BF8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 18:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D42C2C21C9;
	Sun, 30 Nov 2025 18:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lbR+JrrF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gccRMDBs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E22C1594
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764526898; cv=none; b=q4bTUmT519nwCRGB81GCfp3skqRYFavOmBGQbdb0U3nrzsYIdAXo+jIl01GrUBgeOHPSeK6le7MMXa/6KFB6QemMJsjNzC7MxMVGayqotGCH/AdZfg85CVADXXWt+aDQ+KMUzxV+Ko3jn07NlRu0s/v3Kgajf8dyPmJqJ1bJHRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764526898; c=relaxed/simple;
	bh=GjHr08OI8SMYl4NydKrelbyGCFRyP6KQP0VnxDcuQW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZL8b+ovWp0fPTVK1KpSJQLKHs8YwEX+upCP683voZtfx94ZB7zMINYRPke9QEM4e0nfa98xcNcQ6voCW4qdI3xrLPIxd9ypRyw6Bxk8RGA7dIVy87pdv/8UoO1KkNX3zm7xQH3egUZnCe2KqUWO2jW6ZxtSXnfnM+A4sEorwp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lbR+JrrF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gccRMDBs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU9lkrY1661888
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZF4ZAclZV2cEPBSJQt65Ys2E158j2iEit5MIaKN8fmA=; b=lbR+JrrFJ2C2+dG7
	WQvTKorbLUsmZF01ipykQEboy8x4ta3KiSLZFJGnVUHmO7xadzCcec52i0kG40Do
	8wHs/0d04GDCVvwSjR41Ydn8DNn88wGdxpDEmUavXoSSPuCBF9YQlunb0UeC3xpk
	kmF3RNetHqJAtpw9ykhADclUjtIbyjErBBUnWHB9PJnYxygLyqJkc+nWM5Ci5/7G
	xE5ZPm4fbW9tQH4nqcwvJH0/WfIaa8RD0eQgjZbadirAx4VCGz4nZkJFubPbGceV
	Imn0GdTxmQe/iLLObfkYFh15oTmbza0mz9BCH5OI2VdEU1f/2PGdtYlyElal7B9n
	xl2gHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqrdyjm1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 18:21:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297ddb3c707so25518615ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 10:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764526894; x=1765131694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF4ZAclZV2cEPBSJQt65Ys2E158j2iEit5MIaKN8fmA=;
        b=gccRMDBsq+oGUl04IrDQMR3Y8nFRN1kkMvaHWF3dBqhQ57ho8YQ9QsI3uv/BRM4IGs
         IuWvxP0Sv61SuKfhin0/ULoUAPmbtNyriQfwP3e5MjWg+A8xoE1RnSNmnUsR+RZPUceW
         OfazlrOxV8KJkXWJqwXu8Qs4C7Y+saEw7hv7W8ZEH+o5P2YXE98txMg+aw4v0CZFPITZ
         t+gnM0OKqVLu1s2Hl12CUF8e/fqCJMmqvlmcWJJnQ7Kn1vhGMWATf+mmPR9MkDPd3bIJ
         hJD8LMoPBvgJz7uD6moJn6VBupNuwtKeR1ICEC11rrLatZ4St7vJTw1KZEwLPS2fzMtO
         qOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764526894; x=1765131694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZF4ZAclZV2cEPBSJQt65Ys2E158j2iEit5MIaKN8fmA=;
        b=ZOZ8ntaZMHFy0MpiiFKl2ykOoxxCybOCdLxWS7NkmsKorWAic0PpnTkI0lP970Kvr/
         zRn//OM6IkAuGpNC133LAEVs12nk9Ubz5DvELVe0MPQiIE7rn0UpHjwHXtlv+n7N6NM+
         swr0fL/qLZ5SNJEs2BMbHab4JWM+Fq0H06/Wz11VsGdorUYbCidIjXE3dffnYbo7Tnsf
         bwCzu0VxG0RVJz506Hm3g3JdjjjL7a79s5ZUKHnb918q+NkuPYMfpISMrL2Z8ErQxuX7
         kHBaFiQDNLRavTP5AFPgV/DVsN70d4WRQBl3aF6n4am+T4IS7BuXP9OZ2ve2r0K3PdFP
         F7BQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkIYA5Q16vYQdxE1Qn7EOpE3sgPjDdsurqXpVhxD+JWcIVLQpXP8xEMjO1hZ95w2a0RTID2FOV2DZVdN+D@vger.kernel.org
X-Gm-Message-State: AOJu0YzhMSEDbUjgB4ujbxkVvLK9QASipLRzt5sRiWLRh93BDONS+HMm
	L1Pk5fEvk8Sqfekfwe1aEwUGh4xXMTKdNXkE03cLCEQI6KxBnqMfwK2zssdyWTyhRdZJtJzDW4S
	EvBHbTPX8X3OTVX9WjDDQvhTOgpPs3v9TxMu+dC4xPTM69LdO3mhZrjBe/lBNWU+6vgGU
X-Gm-Gg: ASbGncvVgqdYq61sSocjz8GOa3LB2QFLQi9QLnwUaaedCbsFoOVDH2HtR/Ef67iOawu
	nR9LwIawKEfPG3HtMCpBRSFIKvQ63f28nLE/3B5FjgN0L8JXh3cQvqO7Exj40w6wm9YYaTlh+os
	Kp16KW4g3QxhxGCs5NYeoO5s12mB+icBCu6AkA3Rl1L5eGBdxdUr4EuBkipx+oe5Ay7izHFpOFd
	DWaeQFEo+I+WZ4uFut0sTdL29n16SoX5V8d6ab4vpWeaK2PJP3Fm5sfhOrmhtsyS+KgDLSNB/vF
	bfe9/ZDfLSCizEhbL9G17zV4VF/PxA3IXxhMT2ZEIjtOwTyQ9YICxrWyR5kkFFIQpaoXlOou8tZ
	mspmelfd0irwpzvj6MMwCH8eEPMe9ZuD5ZT0OEVREccqhsg==
X-Received: by 2002:a17:903:2302:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29baafb3c4amr249119495ad.26.1764526894471;
        Sun, 30 Nov 2025 10:21:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGSxjT8vEa4CkjtBA3yxMMRy3T6tN07pxv0m/44ola8jHlqpFYU7nsBHcjtQ6mtEUZVvhJkUQ==
X-Received: by 2002:a17:903:2302:b0:295:5d0b:e119 with SMTP id d9443c01a7336-29baafb3c4amr249119305ad.26.1764526894016;
        Sun, 30 Nov 2025 10:21:34 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb27691sm100911385ad.64.2025.11.30.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 10:21:33 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 30 Nov 2025 23:51:24 +0530
Subject: [PATCH v20 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251130-next-15nov_expose_sysfs-v20-2-18c80f8248dd@oss.qualcomm.com>
References: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
In-Reply-To: <20251130-next-15nov_expose_sysfs-v20-0-18c80f8248dd@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764526885; l=5715;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=GjHr08OI8SMYl4NydKrelbyGCFRyP6KQP0VnxDcuQW8=;
 b=e2/pBNsmYq7oq3yNoHjl3YOTJeCc6SO5NdfK/nIrddZ+G37TD5M7WbEB9DvCB7JBuRMmPbVq8
 R9W3Z0KRwT7BpWV9s16Jx2wTGhXaxCgfQPTB3MgeUdyDpGSDuq6SInN
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: 4zHBOxRL5FCz0uM9Pxhmql4zKU-1DF1M
X-Proofpoint-ORIG-GUID: 4zHBOxRL5FCz0uM9Pxhmql4zKU-1DF1M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDE1OCBTYWx0ZWRfX6Cx2KmnTZMVL
 yzeviloquSGBBmlgnWXqKSXOySmPWj5Y+lhOySqo9ec4UsIg2AVZ/eGjPAFj9s3Lo/gIXBDpJ2R
 +QlQXkoaYgSiLd/ociHOBcTV3YEx7RX5VD+3wQtGJR8JxPPOBl/sj8spxz/fh9RZlXoDr+uJgyu
 alXeb0H6FgyqmfZ8SSokPjdgV0UlEvMCWY+CAmkSNHape6oifTRi7WTNReioC6ElUEgn0tnTMCT
 zunSbX/iKREuwlVzTtB3y7ekAVEuZfygvpaUS17mNImUzhDB7R3pMPeZz4gP1huFd5PqOUuqf4t
 fatwKXw3SnCumxFFLJDqnMSmVPCohxXDT7nuVw0dRBEGupf3TtAXsbmqc6E4DAzu9bNeDUVa9KT
 3QwA3YL5FxEavDeMpOlJNkWu9pGWUQ==
X-Authority-Analysis: v=2.4 cv=ed0wvrEH c=1 sm=1 tr=0 ts=692c8b2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=239sejjMsMoxT4pUUhgA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300158

Currently, there is no standardized mechanism for userspace to discover
which reboot-modes are supported on a given platform. This limitation
forces tools and scripts to rely on hardcoded assumptions about the
supported reboot-modes.

Create a class 'reboot-mode' and a device under it to expose a sysfs
interface to show the available reboot mode arguments to userspace. Use
the driver_name field of the struct reboot_mode_driver to create the
device.  For device-based drivers, configure the device driver name as
driver_name.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported reboot
modes arguments provided by the driver, enabling userspace to query the
list of arguments.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 76 +++++++++++++++++++++++++++++++++++++--
 include/linux/reboot-mode.h       |  6 ++++
 2 files changed, 80 insertions(+), 2 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..ae03f2d96a84477f1e9f281bf3110911d7044a70 100644
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
@@ -19,6 +21,56 @@ struct mode_info {
 	struct list_head list;
 };
 
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	reboot = container_of(dev, struct reboot_mode_driver, reboot_mode_device);
+	if (!reboot)
+		return -ENODATA;
+	scoped_guard(mutex, &reboot->reboot_mode_mutex) {
+		list_for_each_entry(info, &reboot->head, list)
+			size += sysfs_emit_at(buf, size, "%s ", info->mode);
+	}
+
+	if (!size)
+		return -ENODATA;
+
+	return size + sysfs_emit_at(buf, size - 1, "\n");
+}
+static DEVICE_ATTR_RO(reboot_modes);
+
+static struct attribute *reboot_mode_attrs[] = {
+	&dev_attr_reboot_modes.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(reboot_mode);
+
+static const struct class reboot_mode_class = {
+	.name = "reboot-mode",
+	.dev_groups = reboot_mode_groups,
+};
+
+static void reboot_mode_device_release(struct device *dev)
+{
+    /* place holder to avoid warning on device_unregister. nothing to free */
+}
+
+static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
+{
+	int ret;
+
+	reboot->reboot_mode_device.class = &reboot_mode_class;
+	reboot->reboot_mode_device.release = reboot_mode_device_release;
+	dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
+	/* Check return value to avoid compiler warning */
+	ret = device_register(&reboot->reboot_mode_device);
+	if (ret)
+		pr_debug("device_register failed for %s : %d\n", reboot->driver_name, ret);
+}
+
 static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 					  const char *cmd)
 {
@@ -76,6 +128,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	mutex_init(&reboot->reboot_mode_mutex);
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -112,6 +165,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
 	register_reboot_notifier(&reboot->reboot_notifier);
+	reboot_mode_register_device(reboot);
 
 	return 0;
 
@@ -132,9 +186,13 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 	struct mode_info *info;
 
 	unregister_reboot_notifier(&reboot->reboot_notifier);
+	if (device_is_registered(&reboot->reboot_mode_device))
+		device_unregister(&reboot->reboot_mode_device);
 
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	scoped_guard(mutex, &reboot->reboot_mode_mutex) {
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
 
 	return 0;
 }
@@ -162,6 +220,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot);
 	if (rc) {
 		devres_free(dr);
@@ -199,6 +258,19 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+static int __init reboot_mode_init(void)
+{
+	return class_register(&reboot_mode_class);
+}
+
+static void __exit reboot_mode_exit(void)
+{
+	class_unregister(&reboot_mode_class);
+}
+
+subsys_initcall(reboot_mode_init);
+module_exit(reboot_mode_exit);
+
 MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
 MODULE_DESCRIPTION("System reboot mode core library");
 MODULE_LICENSE("GPL v2");
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..76900c1b78003559a7b7812bad34206bb3ba5f75 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -2,9 +2,15 @@
 #ifndef __REBOOT_MODE_H__
 #define __REBOOT_MODE_H__
 
+#include <linux/mutex.h>
+
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	const char *driver_name;
+	struct device reboot_mode_device;
+	/* protects reboot_mode list */
+	struct mutex reboot_mode_mutex;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


