Return-Path: <linux-arm-msm+bounces-82981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 46048C7D522
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 19:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 416A24E38AE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Nov 2025 18:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D994729D297;
	Sat, 22 Nov 2025 18:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5K7VLz5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TNov++np"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE842989B5
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763834768; cv=none; b=AMA+apEc4/Y0XIku0GmKYgOq2JoBQhBalVqcbiXjhqleuEIlc+mtmTY8csWE+EGlw8SH7H59cQyjDulwIca7+JeBK1eVRwGQhPi8LtP6aLMivna6iVbhLZ6GzHnmpHSw/R2w23rMbS1dIuCMNB2pCEqGO6FpxIQK0j0TLF26XAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763834768; c=relaxed/simple;
	bh=iUPbUns1OgWjCY4Xgj/2AvfxKK6hFK7pP5aeFMyscqg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fto6hTvpBUxDmERtuUdCqaHSf4Uc+RgQob/iwsz+m9tgGCIJIdLjBARWtyzgoseI09ckYmKBtzRaX920TYNyHITgehRvBLq8zb0x7A17yKkwb16ODrEkV7MzII8USLr+vpZWUUic8HTSF4DlqaiqMpvNg/lP7o6FjkmA0qECPEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5K7VLz5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TNov++np; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AMGd6rO2964508
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OL92HByGfTRrOJGTAmQ+wK7rivfgaGGG2bCRGbXncjg=; b=Q5K7VLz56gaN+njD
	XNAgT/7Mb3cdkFarH/iRFeR8BDU2ydI281Vm1EWL68E3fvVeAeLe/5Fu4Udd4kgI
	rryS3vTwKgQM364CejdoRvvQri3Xx3L3Zz/QRNZLdknvFW4dNkVC1BZjfJ/c6QhB
	7Y2UUaSWGayNF0WZPheXgUKt28W8Wr7o12yJzJpYLbzbs43eb6W3m/QYpCTReZHc
	IXh3kpLS4JyxwHOiftDuAY99qQbUHS5rWHwTdWZs2eTZKZ+4qfEsXo5GDcRrfZLi
	9uMvE9HP3wA3N+xQ4z/wDiInZl2Uc8zcgrcRC6D7d2doXd8qMe0NCLWLjpqT0rBf
	qea6iw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak68ds2q1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 18:06:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-bd74e95f05aso1893157a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Nov 2025 10:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763834764; x=1764439564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OL92HByGfTRrOJGTAmQ+wK7rivfgaGGG2bCRGbXncjg=;
        b=TNov++npK+gTeiHRm4A7sHoRI7PwCHCqhsi8uPYfVI4mCZxwjXmORswwZnhPIc2nOr
         zGBXoZQyDZbf2FZczmKwklYRrVnEz/7seTKxCQi+RuNgmE8HVDyehvf+jWxR1Pfu3UZe
         BmecUKMpRri1FlBZ0qTrgmHoWle+nuPbKN5LW1kx6RiDxVT3XgxES/7ZYbHavRntPOBw
         +WfcqsGoNtXlZUXbPO7uOMvKUilfhzIJ2qVFjVikpW0aRsog3EYUIDmvWe6gEyTc85zC
         2qHHvqxxXfxW6YrrJ/fyKiqUylVZQLbbbfrRZADv49UQb6qc0d4YKjcdMbENS8mvj8fl
         R8XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763834764; x=1764439564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OL92HByGfTRrOJGTAmQ+wK7rivfgaGGG2bCRGbXncjg=;
        b=QQ72+J5oakE9hg6OTBzhc2n0iknA6Olga06+DzY98zLq3oMFOgAs73xjxt03sfzD/f
         ZgZU/2Zl+vgT5wCHV+5gE7plm4ynG5A3VO8/N1a6NRCO2QmY6z6wBHznCPrXIRn8EXx4
         o3SQ45abcVO53NvnJQE4kSQFCNsuebXxbXeBRiWL6caRja4dAI9yMYbNL3FxTq3xpFxT
         gu3b9xbkS0KRBDwhTKoanklPMUbVmBtLjBZwTdVSW9oxg2vX4uFMCxQ3dpI8FVK6+PcB
         X+u7Njo/vG+VMd+lWjrAn4zR3XpxPNLUhgDP3fj3sg5qhtIEZQ3ZK2naOGASmb3VA9RB
         2cZA==
X-Forwarded-Encrypted: i=1; AJvYcCVm4rQ0J2x+TzGbQRX+ukMZjD2gSknPl20A9k8gmLYv+SnGb83xm0sSiHQ3MyKMzDZEbF6FALKQQK00a569@vger.kernel.org
X-Gm-Message-State: AOJu0YzWkkJHyCNrO8PxVxehaTCr8cNKwuzNgKwBfUMBhLWuh4CMO+W8
	spHHozwyu2h064Yryz+wKcne+wfLMfgabqq0+srjUPlzj7ySz5vzNloJw1YFh6ZOJLV2TU7BVjk
	6lJ0Lrt8/ZO9BPrScW5ubke9SnsEojmFgJKXLHNE/weJwYi7pIThHKYFgJg2cqBikkAy+GLYkUR
	cD
X-Gm-Gg: ASbGncunbgkaUafX1pTiqoC32m0gHD+FGY+bgTFbUga4a6Rz8569zxUTW0Vs2yTHCsP
	ccUqw6PccewLox3ZcdJ1fc/Z0GTHvUPRh4qq0JHLLjPWWMugH/B+ReWTBV9HiP8Cs1HByGnaa+p
	/dkcOvFBO9d+3YRH+iybqsTZSjPfzsuATDbgogn70X3gwanZ/V7JErv/nc5HXJa3ypgD6URMWug
	lEkXJ8Rkgzgi0bgAHWx7nl9lfYoyJ+UFQgxtb//vklD2JwEJtG9mRuaPkjMz4gMQsIYNGsAVXZJ
	SH2XNSJFKnAPLcqaZuAx/z18Nbu/0aftPBzzsHSHeezg4iXNfPyEUaqrnKviq06v5U9ttj+2KhL
	ZvQRrMueOUsW+sTiIvOAg8Ours5yOrrSSpO/Z3ZAy7rW2eg==
X-Received: by 2002:a05:6a20:5491:b0:35e:caf1:78e3 with SMTP id adf61e73a8af0-3613e3c5be4mr12807946637.11.1763834763705;
        Sat, 22 Nov 2025 10:06:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFt3AQ2wTJw2zqMn7DYIWtMi4JtQObrJTFWd0PBh/5CSW2FKeHM4MIpbJNLDX5RvE9O3XcHNw==
X-Received: by 2002:a05:6a20:5491:b0:35e:caf1:78e3 with SMTP id adf61e73a8af0-3613e3c5be4mr12807930637.11.1763834763213;
        Sat, 22 Nov 2025 10:06:03 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd760fafe57sm8763553a12.33.2025.11.22.10.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 10:06:02 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 23:35:45 +0530
Subject: [PATCH v19 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251122-next-15nov_expose_sysfs-v19-2-4d3d578ad9ee@oss.qualcomm.com>
References: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
In-Reply-To: <20251122-next-15nov_expose_sysfs-v19-0-4d3d578ad9ee@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763834754; l=5615;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=iUPbUns1OgWjCY4Xgj/2AvfxKK6hFK7pP5aeFMyscqg=;
 b=NOn5waNffiOVT0S9Ar9tMGFlSBPtL4pPc77MCksZgRROC+2+7C2NiGwwBAZVPtpVJk1a43UdZ
 iy6sXdPKjweCdECsecckHULr1LmtOPMQSEp/4mdwFfZGCpNwiXLl+c7
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDE1MCBTYWx0ZWRfX4DMttQoW1iF4
 nq/i5XZo724huIQofneJZuzNStMXTxUaKq2bsVIPX3bceYNT/HS808ZebAatV2TabMnFqfxzCWd
 CyitIPg8It9vr+bIa5XCNFKagwV94/Yhvk/UcVto+liZkbL08kScfZ8kcV1o5cXdbjaPj1bq9Ei
 mAIBd21RPOtIDycsKePomSY/AwaDazVkhcmuwS4HOnrrVUS+rt0JGyX3b1KceK/t2auYh9G5Ow+
 yGnJpSgaAaq0BJxY4llSwyHeqzUI9EGUegYf1bvVLz4o+nr4tR+GXzdME8D78klassQF4O2QQtA
 6fkO99mKGV9E7gwWoGQgdZlMZB9Nes5Ce0Xh4rhV8NqLBqWGJp0bJ4CZ7TCbvFrgbBuLlIdHHb7
 5CD2bJoISYSyRVhk4IHwKN5bJXWN+g==
X-Proofpoint-GUID: G-vUxunWTqBpc7k3LNnZnCz47_gBl8Jy
X-Proofpoint-ORIG-GUID: G-vUxunWTqBpc7k3LNnZnCz47_gBl8Jy
X-Authority-Analysis: v=2.4 cv=UsBu9uwB c=1 sm=1 tr=0 ts=6921fb8c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=wyqt5i-gTeGwDUSfceUA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220150

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
 drivers/power/reset/reboot-mode.c | 86 +++++++++++++++++++++++++++++++++++++++
 include/linux/reboot-mode.h       |  3 ++
 2 files changed, 89 insertions(+)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..71cd97ffb3ee8da530514ab918bc6d58a122b4ce 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -13,12 +13,61 @@
 
 #define PREFIX "mode-"
 
+static bool reboot_mode_class_registered;
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
+static void reboot_mode_register_device(struct reboot_mode_driver *reboot)
+{
+	reboot->reboot_mode_device.class = &reboot_mode_class;
+	reboot->reboot_mode_device.release = reboot_mode_device_release;
+	dev_set_name(&reboot->reboot_mode_device, reboot->driver_name);
+	if (!device_register(&reboot->reboot_mode_device))
+		reboot->reboot_mode_device_registered = true;
+	else
+		reboot->reboot_mode_device_registered = false;
+}
+
 static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 					  const char *cmd)
 {
@@ -78,6 +127,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 
 	INIT_LIST_HEAD(&reboot->head);
 
+	if (reboot_mode_class_registered)
+		reboot_mode_register_device(reboot);
+
 	for_each_property_of_node(np, prop) {
 		if (strncmp(prop->name, PREFIX, len))
 			continue;
@@ -119,6 +171,11 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
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
@@ -136,6 +193,11 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
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
@@ -162,6 +224,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot);
 	if (rc) {
 		devres_free(dr);
@@ -199,6 +262,29 @@ void devm_reboot_mode_unregister(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_reboot_mode_unregister);
 
+static int __init reboot_mode_init(void)
+{
+	if (class_register(&reboot_mode_class))
+		reboot_mode_class_registered = false;
+	else
+		reboot_mode_class_registered = true;
+
+	return 0;
+}
+
+static void __exit reboot_mode_exit(void)
+{
+	if (reboot_mode_class_registered)
+		class_unregister(&reboot_mode_class);
+}
+
+#ifdef MODULE
+module_init(reboot_mode_init);
+module_exit(reboot_mode_exit);
+#else
+subsys_initcall(reboot_mode_init);
+#endif
+
 MODULE_AUTHOR("Andy Yan <andy.yan@rock-chips.com>");
 MODULE_DESCRIPTION("System reboot mode core library");
 MODULE_LICENSE("GPL v2");
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


