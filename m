Return-Path: <linux-arm-msm+bounces-86091-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14849CD4A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 04:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C4C55300B8DA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 03:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74076325731;
	Mon, 22 Dec 2025 03:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ig2gXhCo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f3xQ8//9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF82326924
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766374426; cv=none; b=dQ1hUlwEkUBh29kopjAdtQow/SSkIyKAL8sUedKUPwp+80rG8bzzIQUcDp9q6ovwSTAT29xcQ82hiCiHQNtCv5VPfs1ZzwtvGhec3MkacmjICbqULMpTCq5QNZZSsQZR3vBzl8+sIvRs9JyAirWO2blsyby0K+03pE14vOjCH4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766374426; c=relaxed/simple;
	bh=pcTB26BjM0rgTg/rlf4hOonrUJ2aLbG6b6bsNAnmxco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wq8TXmkTS6LWvWUGem+KnjZhnsTv6fdthvhsdgX80tYcqyIHxGioFZYI854DwYweNv3PbfAXegERYkIfh4NY+82ulh8oMv1S+I7Wje4Xr7uRdm3KHA0+6ev2Mo7NpMv3xmsuJkf5FOgUOirRrhgjBFOqXd4kojFBuViuEWIB/Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ig2gXhCo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f3xQ8//9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLLarpU2997395
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1p9CxVLMaIHOlUHd9JiMY/BtnRL92iMP9Sy0KYtGHdg=; b=ig2gXhCoMxXIUJyJ
	KTrgKK94kmZaQVHrmyTFXs1f89JCKk8aqYMWJjq4xDHXyVTbt+xChTZm+gpFETn4
	jyFICobKR30+M5c7M+F9dhDiPZ9q9FRqHAL3vp5Lt3nm9WkfD3A3LHJNuJYAdjVy
	sPjPTLFu98azChBX8SV/c/XS9jM5lHT2IuuvkCI095n+5ylbbnSSZpX7AAKWi8q7
	3GLZoCEx4bcs3q56u6zGikCkNpHjNTQ1i5BRdjq2QQRclITmLZaG+m7B/MPJbuPE
	vqhg7jSkiTX+Nrd/1FVgtQbutk1RaM4DCzx9fpBzKriGF35MESoNezvz+OsHnOcU
	zCh8HQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36kgt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 03:33:43 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7c7957d978aso4123373b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Dec 2025 19:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766374423; x=1766979223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1p9CxVLMaIHOlUHd9JiMY/BtnRL92iMP9Sy0KYtGHdg=;
        b=f3xQ8//90SezhEqjuu2s360BhE58UWnQZFFvRzKZfw1jcqgErixjjZkP+Bn+Rfmjl4
         6Kg25Zbuuks+G+PFvwkHfu7H50PUDorXqPM+cdOU/7D+UKPHPhjyTkRhSs6YqR+/GOE8
         BmYWtv1tkQ5661vSEbLrBIY81r/UaRPZHbOMaDCYFgrUP8dxG7DP2m0zj1Uwa/q5ZTXp
         vWuKhChTYE8rA8HTlVGFM+8qDz0wORINBexp2+P5yxnBTRPrGLdO7VmC6lhbRQFqiYV2
         Ki9BbGdHrgTvi4+zkEfsJ+MOAYI+wW6DqtTGMFZjxOl//EyEVCnlvUw0GaL0oI39SL5g
         A0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766374423; x=1766979223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1p9CxVLMaIHOlUHd9JiMY/BtnRL92iMP9Sy0KYtGHdg=;
        b=AcItKV+wfm4U9NnnWoOO4XrAheHNLy9oISvbMyphOQdVzV1YB8Hui26GcSAjD0zrMX
         PsamLLuorpKboFqhJ9BQDQNl6fonP8FOStSMDTXlYgFg/9Jmj8hpN6kIZF/A8nmohwpv
         G5KeInXpuq8K7kqkh0ByQZvmvNOoJQzCgqbWeZLTesfLgpbrO5lRN6KloqwpRZZu8RUQ
         FSVEA8aU4RUssMJ1YQg6iQx2J9oK7BvVRvJ9WboVVmpkrlHFYsuyaBT3wkMo/yhsWAhJ
         SZX1WUAsVkIz2Aq6bozjoHeGgg3izsSpOfpG29TBaRUJIza1qcQxNhSUtfA0G5v8uwZt
         ZGEA==
X-Forwarded-Encrypted: i=1; AJvYcCVQxPeQl8rcpMwoygrSufPwAfbusyc3my0dHiDySJ24KKeo9vRALRn4AGCib9DangVQm1C6cTirILAU+pEb@vger.kernel.org
X-Gm-Message-State: AOJu0YwNDO6qPFoMD1jDhhfKQHKzUCMBgqQyvppsllaSlqBROegFQtM7
	nILRBoLByqRmNywIq2dm0EfEmbn1CVj/926Lm4A2GlJdCxWbKWx8wBsX0QyhFYffAnycwwKZfHs
	hrhX+NVaEXfQy4zuHctoc07WDWQ3HDg5FFvn4Um5rNHpyOVB523PXBfQ5cyEfJ3TGx90N
X-Gm-Gg: AY/fxX7HHzNI4mOhAqU5TqdQVWa24ygK2mty6YvNdoHNGjcIFOhLyueOq5Pck4+vv3G
	RQYkYiPxqpPGvO+Z5+2f46IwKWzXfUibUG7IKOGp0jFSaEQMIW89kFHqEcqm7fc9eeFrWmmiNff
	FEdnxL+EPL6ZUnmavcuXpPYGa0jRyDG+BIK3DqtRfGGZpMggD0EeS0jFXTOSD7jyXxGW1EhG4sn
	Kj90iylUY9i8mGxVegLG9VSlw1axdFMJofdgCkJa3UR1CySjU4t3iXiu9LEvAdj2rz6zl2Shu5Y
	n23lO9/iI0CWfNq+EkTwNIaZcFTWp/aZVct/i36jJspyzlT7/05Ivd42KeXsm9O2oqBj9i8lFFE
	g/Cqk2LqGeeIJMMi64vpQeIssyShflrrTDwbz+4sTDPgYZg==
X-Received: by 2002:a05:6a00:e11:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-7ff6420d8b0mr8174486b3a.7.1766374422915;
        Sun, 21 Dec 2025 19:33:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkdPKKN3e/I+ctbjjSdQlAcyU5+N72pFYLUi8N3ALlJSQEhn0x1h7LUw3IYPEc+jDJpKSrBA==
X-Received: by 2002:a05:6a00:e11:b0:7ac:9d93:3efa with SMTP id d2e1a72fcca58-7ff6420d8b0mr8174474b3a.7.1766374422376;
        Sun, 21 Dec 2025 19:33:42 -0800 (PST)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e48f30bsm8633837b3a.48.2025.12.21.19.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 19:33:42 -0800 (PST)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 09:03:23 +0530
Subject: [PATCH v21 2/2] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-next-15nov_expose_sysfs-v21-2-244614135fd8@oss.qualcomm.com>
References: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
In-Reply-To: <20251222-next-15nov_expose_sysfs-v21-0-244614135fd8@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bgolasze@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766374413; l=5490;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=pcTB26BjM0rgTg/rlf4hOonrUJ2aLbG6b6bsNAnmxco=;
 b=7wRCltWmycbntB7GGPJA6W/+/Q9mdQFAOn4w0kRJ0Rc7EsVG95srR6IrawaVe050b5eSRHoQl
 uWiXuKTuvUGCetUNG7JM9+FGEFRlCAkEkJV+nmSDZ9vNUOPOEueUgBZ
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOSBTYWx0ZWRfX2dMv+Io3I7a6
 H5y6mSSqhAjZilC5VRlgWgnBzgg6WK3y5w2baettu95KTNA+z3WU1i+yEBiksMvgVGKt9PaB4Lc
 tl8XvwfyiF57+bcaILaooZuaGWvy1nsg2fmPEtLBeXkvuwQ/EMRGTTRB/y/GRlZLmXBLnxBOUsm
 X4Nv2QqDfo0l8zB/c3d/2i/B42k7sgFbA/cp3xHOfj8bZTcffQV0Cxry6WVL53lGAvriY12DNQo
 Ky9KsdwZgcqUty7blM7FF8svsiUwtGxXYps7QEhANLBYUe/URya+WLG515slXluzBy6bTjd4VOv
 /RlbIuL3MI3widUWD9uVJ45G80jBP0guDKh6IVQS2Li3tfJKdHZAVCFERcsNP/TS4w33SFVLS1A
 NFhkeFhyn/sGwq/5M4rwCd553Qv8yoJ8Ze0bn6xZi/gXi9COFwK2/ADCT/tmDCghVCozdYzF26M
 xaHR+StMkmBFDrABkJg==
X-Proofpoint-GUID: hSXVgmMlsyz2UxGKsnSSfBNCjygVpUq-
X-Proofpoint-ORIG-GUID: hSXVgmMlsyz2UxGKsnSSfBNCjygVpUq-
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6948bc17 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=s8YR1HE3AAAA:8
 a=0ofMVug2fDiiE6i26csA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220029

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
 drivers/power/reset/reboot-mode.c | 75 +++++++++++++++++++++++++++++++++++----
 include/linux/reboot-mode.h       |  6 ++++
 2 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index fba53f638da04655e756b5f8b7d2d666d1379535..28d1fe09d685a7422027fafc9d6a3db97a6aca18 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -19,6 +19,39 @@ struct mode_info {
 	struct list_head list;
 };
 
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	reboot = dev_get_drvdata(dev);
+	if (!reboot)
+		return -ENODATA;
+
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
 static unsigned int get_reboot_mode_magic(struct reboot_mode_driver *reboot,
 					  const char *cmd)
 {
@@ -76,6 +109,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	reboot->reboot_mode_device = device_create(&reboot_mode_class, NULL, 0,
+						   (void *)reboot, reboot->driver_name);
+	if (IS_ERR(reboot->reboot_mode_device)) {
+		ret = PTR_ERR(reboot->reboot_mode_device);
+		reboot->reboot_mode_device = NULL;
+		return ret;
+	}
+
+	mutex_init(&reboot->reboot_mode_mutex);
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -107,7 +149,9 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 			goto error;
 		}
 
-		list_add_tail(&info->list, &reboot->head);
+		scoped_guard(mutex, &reboot->reboot_mode_mutex) {
+			list_add_tail(&info->list, &reboot->head);
+		}
 	}
 
 	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
@@ -116,9 +160,7 @@ int reboot_mode_register(struct reboot_mode_driver *reboot)
 	return 0;
 
 error:
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
-
+	reboot_mode_unregister(reboot);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -131,10 +173,17 @@ int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
 	struct mode_info *info;
 
+	if (!reboot->reboot_mode_device)
+		return -ENODEV;
+
 	unregister_reboot_notifier(&reboot->reboot_notifier);
 
-	list_for_each_entry(info, &reboot->head, list)
-		kfree_const(info->mode);
+	scoped_guard(mutex, &reboot->reboot_mode_mutex) {
+		list_for_each_entry(info, &reboot->head, list)
+			kfree_const(info->mode);
+	}
+	device_unregister(reboot->reboot_mode_device);
+	reboot->reboot_mode_device = NULL;
 
 	return 0;
 }
@@ -162,6 +211,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot);
 	if (rc) {
 		devres_free(dr);
@@ -199,6 +249,19 @@ void devm_reboot_mode_unregister(struct device *dev,
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
index 4a2abb38d1d612ec0fdf05eb18c98b210f631b7f..d7141a1a609b62bd3185642ecc1478fdd3555037 100644
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
+	struct device *reboot_mode_device;
+	/* protects reboot_mode list */
+	struct mutex reboot_mode_mutex;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	struct notifier_block reboot_notifier;
 };

-- 
2.34.1


