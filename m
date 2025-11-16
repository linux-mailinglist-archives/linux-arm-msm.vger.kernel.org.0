Return-Path: <linux-arm-msm+bounces-81984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E134AC61763
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 16:20:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 38B894EAAFF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 Nov 2025 15:20:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4B2F6939;
	Sun, 16 Nov 2025 15:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YpNVlsUS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IjQc+ku1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490E530C63B
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763306418; cv=none; b=MjyTtoTtJ96C3/w4Q8JYNtKdgGzZhSwTGiPC4RdlBud5DXMVzcmC6fEPJgZYzqbIFOqwdk9xQgG8jcwjP/RYuBG2oxdmnz5wITpXbrSBjVGU3X4rVBzjXjqqBPVKazDwNtzKyXkhtzcxSDYyT0OGn4iuDgTABKNKXzfBccaA6mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763306418; c=relaxed/simple;
	bh=ZtBepfXNfP9Vd9Fvqol0mLMn32NO2zO+JnUdEY5QW14=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ptc/KVf6AG5yXO2UoDrsxq+JpanH4+XdTaRAUvjYQS76KZPAr11LpH0bMWoCNh6xCd8HBUyJ27hj7BnVLg9ffNeCN/ip12RAiKWCZnW/yueLFj+s9xYjYNnZsnFrE0oXshpRkMtNd1/08gB4CYZGuYrdqZ7tmP6F7o3VICze0MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YpNVlsUS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IjQc+ku1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGExFdU1591774
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ewpABGkpKfdAof+4lPAMR//vcQEzIZ3zsrx2TmN8ivU=; b=YpNVlsUSMn1If3wz
	8bD5cHkJqPqVnT8BPQSQw76luKcEpvxaO8nAXHznBLeHG6f2O7EJmKsEQoWGd6yg
	fXjEd2h2g1I4pq3EUJAQYDPKCO/buqKAk4cVCT3KC3Qv2IchhZdrSe5pV6HyHwHa
	06I7bxSl8DfAmK8kS+NE9WP9IcXf13b4enXJkjk5V2rHbo+QbY19s6pq/52+6W1y
	H+nA1KKVaVcBBPkagVIBL9t5PJBWUM2YF7CPlMVdibpEHWBMkWCfzhE73EZkEh3f
	t5wovxi4HpUsjhIGTPDn8JYOopVjoMsxBBvEdP81G7OM00g0tGyekTYYo74EDlNY
	UWJSEA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh32a0v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 15:20:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-295952a4dd6so56899225ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 07:20:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763306415; x=1763911215; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewpABGkpKfdAof+4lPAMR//vcQEzIZ3zsrx2TmN8ivU=;
        b=IjQc+ku1USblPJtM8ZTFnPoMWFOLIRnMtHvF8LqrpPO1u632JV+alIXxuLf38NrS1+
         yCbrmTFblUSXSPuBEWIx45re2lMHFZupoegiesa+taVGe6TQYfCicwQrgAYbQGEzFCLa
         aNxv6RwhkhohSqw6qQlwU0hHkuGHcIps9kSS11YSkhK7Z/KonRUCKCmLQtb71Bxp0Ntv
         YGt/JGplTi60mavoXCs12sneEqp9wpjLxLaFrI1xE0YLx7A9Mg/vAAbguuqNBscgeaVy
         VZo/8qJw/h56lsMU1ly5AG6BGds8c5aTWqqyLf0Tl3chZLDDDWAJy3xcS4ws1bjvZWSp
         7Epw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763306415; x=1763911215;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ewpABGkpKfdAof+4lPAMR//vcQEzIZ3zsrx2TmN8ivU=;
        b=q/bo6sIsnB8QG75PcqCo7OMwgJh5sUoo5N9AhV3yfu9syo3m5okGnD/nKBXIZAdhfm
         HtaDYP6xJogPt64V3q7bm1Dg2ooMzhoieo/QyGWcJYimiwraR7YWmIA4r3NyzCVTfLEO
         wRn5siRwm6lZjLg4QjtU/XtgWyKQJlLQWnMYPNsKuQ6F81Zydhr1o2Dz70ZZx/n03OqT
         FkG1YXlCEnUX/6mvIwB/JHOfkIlmmuJDb36bmIu4XgRrwieXkpP9UYNNsU+L4wzPGhXy
         wOMl2dkmwWEoPsH0jHIVyOsoYbVIN7aConmjZGjxTYE5FjngB3PJqAfJiAj0Khns10IZ
         M1hQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/xdhSZb85O6LmN2GdeezXwwaB2LtSVBU5xgkzl/ap+aYC0wcOdjZG/kZmeWPfjmOqHoX0O/+42wzpvQts@vger.kernel.org
X-Gm-Message-State: AOJu0YxrSIer8Egptda5GRzY1bclYd8p03uSYNvozvOrCxaTvHrh8Tgd
	0xIq967gN8uWvTc5LMZ0QZqB2srUd9BCwKEnDZo3JY8d8DXzKomvsA34faHyvCsFe0yo9adevqa
	XPruLkHStL+hbp/Yh9puiuJ+VJnsE4zrKLat8Qp7SW2/mPi6u52U3MkC3DLa1LWWS0yoe
X-Gm-Gg: ASbGncscg+KAFjXXqKCfFJx88GRcCMfkhLO4Ti3saysuWTIcN3nYhxr4gBQt6a4GEJ0
	bv5uCITsbjapDWnqJhTsSM0CAjG4X8vTIEg2uu+AhSzzPodtTowhG6Qg6VlQdbd9wPdBwmniV4H
	NcF2ZE4i6jZAceXlbWqKeE3Qk9K9nnQvkjONvkQVVgcgOflHh811VyJnWfudHHHGr0on/k8H+xK
	sS4p7uYJU8rlg43xa1ntARKBytNWKHMCMNkIhkNk9WjBJ8g4Vj4AvmpZn2yyN6GtYX/3G6ofZcU
	Xefr9KKbZJlPUB0LxbZj+epX6tT0iv1CpW1UiZXDrEzU3WxvAKd15khUpXGA9z0g4k8lKAVzUq+
	PKEzrANWxChiD9xHYggnoU2gz0AX51TmZ0rU=
X-Received: by 2002:a17:902:da81:b0:295:96bc:8698 with SMTP id d9443c01a7336-29867f92114mr109667765ad.19.1763306414900;
        Sun, 16 Nov 2025 07:20:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUR8jLj88wIIf0FT51OOczIH022Q0TKoHXMgGFMRInkMbIf18ICcoUzzrUCfhXd/Vb1SfmUg==
X-Received: by 2002:a17:902:da81:b0:295:96bc:8698 with SMTP id d9443c01a7336-29867f92114mr109667545ad.19.1763306414430;
        Sun, 16 Nov 2025 07:20:14 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c241f89sm111166205ad.28.2025.11.16.07.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 07:20:14 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sun, 16 Nov 2025 20:49:48 +0530
Subject: [PATCH 2/2] power: reset: reboot-mode: Expose sysfs for registered
 reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251116-next-15nov_expose_sysfs-v1-2-3b7880e5b40e@oss.qualcomm.com>
References: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
In-Reply-To: <20251116-next-15nov_expose_sysfs-v1-0-3b7880e5b40e@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763306406; l=5218;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=ZtBepfXNfP9Vd9Fvqol0mLMn32NO2zO+JnUdEY5QW14=;
 b=SmkzVXNdbmQwayygGGczzgYkY8viIOj8rWoujItwOjAczz/dhPZ4nONtj5ROCcSIfOFr3PFJC
 rkIyuNjHWysAf9ydKpcP/VWbqusFWtCH/qUdP1DBKpFZaw8mK7E/NFy
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-ORIG-GUID: eLrmNsAKVDQvGcSrgjOCIG5XRtYLOfKD
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=6919ebaf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_IXiiBmLcBuSsypf6xIA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: eLrmNsAKVDQvGcSrgjOCIG5XRtYLOfKD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEyNyBTYWx0ZWRfX62UdT2uHHObB
 kgwu57MqNt5Ojc+0zM98IQxr+I1X2W88ZFg+SlhwhfpjN2C25VyqmnbCGGbFZ+3kb6ZNDIJ4Vqu
 mDxm0/thkln12NuMnY1NdzVWykiFfHQOobNHXTugPwB1VgDCCJ6rWbxyoIBkU6Xl7t00vt/V87S
 8IgUOzk4wTn7lbU1KRjavJi4uCzTuSVI5Bc1AZQMKkDh9c5WFtbihTF/Kjw0Vc5T7ZoOqo20NqU
 KniogEwGsWQ/byf0ROeW1aSNEfQpD9dv7+kBr8kyDvtToNq0+CQGYZ13oBvwtja1fg90jnnMjoK
 XyA+IzKGGb5nESYxKN2PWJw0aohDd4aU5BkkgfDtHDoGLoNWfuL8f4a4F0iW4/jnTqRb6yo+BXC
 Z0JZt4JBAZVLwoSUaXg+HKAJYnNX1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160127

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
 drivers/power/reset/reboot-mode.c | 72 +++++++++++++++++++++++++++++++++++++++
 include/linux/reboot-mode.h       |  3 ++
 2 files changed, 75 insertions(+)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..062df67735c4818cfeb894941e537f19ea9d4ccb 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -7,18 +7,77 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/reboot.h>
 #include <linux/reboot-mode.h>
 
 #define PREFIX "mode-"
 
+static DEFINE_MUTEX(reboot_mode_mutex);
+
 struct mode_info {
 	const char *mode;
 	u32 magic;
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
+
+	list_for_each_entry(info, &reboot->head, list)
+		size += sysfs_emit_at(buf, size, "%s ", info->mode);
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
+static void reboot_mode_create_device(struct reboot_mode_driver *reboot)
+{
+	static bool is_class_registered;
+
+	reboot->reboot_mode_device_registered = false;
+
+	scoped_guard(mutex, &reboot_mode_mutex) {
+		if (!is_class_registered) {
+			if (!class_register(&reboot_mode_class))
+				is_class_registered = true;
+		}
+	}
+
+	reboot->reboot_mode_device.class = &reboot_mode_class;
+	reboot->reboot_mode_device.release = reboot_mode_device_release;
+	dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
+	if (!device_register(&reboot->reboot_mode_device))
+		reboot->reboot_mode_device_registered = true;
+}
+
 static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 					  const char *cmd)
 {
@@ -78,6 +137,8 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	reboot_mode_create_device(reboot);
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -119,6 +180,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
 
+	if (reboot->reboot_mode_device_registered) {
+		device_unregister(&reboot->reboot_mode_device);
+		reboot->reboot_mode_device_registered = false;
+	}
+
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -136,6 +202,11 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 	list_for_each_entry(info, &reboot->head, list)
 		kfree_const(info->mode);
 
+	if (reboot->reboot_mode_device_registered) {
+		device_unregister(&reboot->reboot_mode_device);
+		reboot->reboot_mode_device_registered = false;
+	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_unregister);
@@ -162,6 +233,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot);
 	if (rc) {
 		devres_free(dr);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..400cfde0e029aef14ff90a11b9d12d0c3ce8dee6 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -5,6 +5,9 @@
 struct reboot_mode_driver {
 	struct device *dev;
 	struct list_head head;
+	const char *driver_name;
+	struct device reboot_mode_device;
+	bool reboot_mode_device_registered;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


