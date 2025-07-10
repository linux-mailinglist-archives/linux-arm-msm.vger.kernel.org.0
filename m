Return-Path: <linux-arm-msm+bounces-64332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F02F7AFFDDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 11:20:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9F1F644A55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 09:19:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85B2428C5D1;
	Thu, 10 Jul 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WhW8TMTQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1EE294A17
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752139101; cv=none; b=HLl/sw5szGKIjkTpHIGUSCWzZwSFRlATg9UqQzG1f7+LBayk5mSvFiXZMIGe5X9DnwC3L4JRV4neBpab9qTBMm0pdyqs0PURdEzswe1DkXS3N+NOViY/vN+vhaWUA4aDWj7nso3+OLQmCsBFNbYkpiVeFcDuiR8fzmWFVy+HoCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752139101; c=relaxed/simple;
	bh=Gh0wKF8f8obJZBIFY+YXRq0mvEFaXxY4KjC0e6ESP0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fWZdYpPv0ysnGZwtTZVWjcPl3f+/23hfGBJHIU0KnzgPUrODLga21RsmDQ+oUEJH9ylkxXJ7M4rwkJYDCUHUZD6jXYPEy99pMX3kECQRuBgSiorfFYulOr8O5pir9yttNfRm5pDKTVBxDic693W/kVcnoin8WO/HxZ7ZrCzPYQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WhW8TMTQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1X7Hc012540
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=; b=WhW8TMTQz9Or+5Ut
	JV77FzjSJBAAEaojl+gFV7Zt/eGLI01ypAewarNdVghtsxF2oIGT3R2uBsC4Fifz
	sZXNEm7OopBVSXerUVYv7zTOkEXYpRO0bqiv5AukWGyOSFdNGBm/QrajE5LLYJKM
	dtKH00yzERyxM/vIxhFGx7QNoKPRFkRIXXVg4r5cLhNAXPMYx9UIxBKwr5x9SS4x
	axJWAO4HzKZ833OVJ8Vt0OP68tWBjTFuYcg2lr4jT+qoxOOSEe/ILATnfYIsFtvW
	uW0iOGtC3IUBiKhfuHzJBf33uzKm1hkJg3B9OANZv2zVPByDU9gF0N7j2D60IdR0
	2lv4wQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pucn7vsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 09:18:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so8422485ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 02:18:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752139097; x=1752743897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEQrgZfA5rhK7t8SJQh+Tq/CWC0djSnOhUUgfmLwz64=;
        b=ccvRhUMpKeqo3GDEGlK/RFsjFH3Eh3yGclgHmQYuTA4vDbGtrgxTJjOi/P/av0gQY5
         7k4SDdKzy4KvnBUX7JweG0pUhCnbq8w57jlazOyq5WXQk+DUURoPyBvkFB5yJbPFCreU
         73lTuXFzXavb2g5jkj7pYt7z2jIVxbAF9b6K4troonyLE8lNmkeMByuX3tE22pEv9Rhu
         23mKmXT3tB+kqWbKqAdOKF5SQ8yb8Zh48Oxh9TUeSdAncAVxaUYbi5j+RdgQDAiCtV+x
         C6PLqu3UeJp2KEPXbnUBAhc+IOwAF9YUPwMr742f75blNDdSyVbhMbz+urstguAZMeUu
         I8wA==
X-Forwarded-Encrypted: i=1; AJvYcCUnq1wEm2RF/GUhZTvFtjmkvbv5qHWFrT8D+FqoCuCTK6THIZ1eugnyRgEBCdRpOzx9qN1Cn9VBkyrfZe1H@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpu/TeenjOiQSFbwsWYj7vTMlwh4JGhVK+h2fLRvzbpm+W7DeW
	Pc4pz6gMTSxPeCJk+seWfwrlxqeBS7FnPdzc10f4FqOHWtIdwvwNJGUTMnN4XA/Ek6kgwZEjcal
	r6vNArpEc64WxuvfuG68dEhMsYJwZ1hhFjndUzQIyWEWsSL3eYiK6QuPgAUDSRj1Tb9gZ
X-Gm-Gg: ASbGncso81eauEhhmh7Obl6Yt5dQ6sV66UB/Xp/Bhrk39vEl1iTibTvuFeow3N5GpMi
	9iokAJq4kY40Q5pXOc1qbQFUra5B7dxghRVD9mEZadYwmMOaoAK21UhDWx+wsrAG7KlUQ42WDp6
	w9EVCzTRyhzA0W4ntOyDpL/HbWDTqbGZxbcofRXGhOoHFq89duk6zUaQZRIuASVVQQbuDndEHJJ
	a66BYrmmJ99dMtdlKdXVMCNa/t5y8woIxpkcEJFuMZOm8ywfn2t1ueRzQmuxWwGbvb6bz6xS6hA
	EokCjz7K8+KVsKYCcGY8oXOaZ3fziPfuVoy8Q3ji0WWQpPFmXO0GmXxBb48=
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26735095ad.8.1752139097006;
        Thu, 10 Jul 2025 02:18:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGJGyoIrfBA9Zxl0Ughrj3uMKfz6jdSKT0NaAjnNjMskqdtkAKMLUS8x/FzIhDGTyLMPqU7g==
X-Received: by 2002:a17:903:1103:b0:236:9d66:ff24 with SMTP id d9443c01a7336-23de480adf5mr26734395ad.8.1752139096442;
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4341d51sm14837765ad.189.2025.07.10.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 02:18:16 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:45:52 +0530
Subject: [PATCH v10 10/10] power: reset: reboot-mode: Expose sysfs for
 registered arguments
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-arm-psci-system_reset2-vendor-reboots-v10-10-b2d3b882be85@oss.qualcomm.com>
References: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
In-Reply-To: <20250710-arm-psci-system_reset2-vendor-reboots-v10-0-b2d3b882be85@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Elliot Berman <elliotb317@gmail.com>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Andre Draszik <andre.draszik@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
        linux-rockchip@lists.infradead.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
        Macpaul Lin <macpaul.lin@mediatek.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Elliot Berman <quic_eberman@quicinc.com>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752138982; l=5404;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=Gh0wKF8f8obJZBIFY+YXRq0mvEFaXxY4KjC0e6ESP0U=;
 b=lw/w70/5HLBy4afjvzlsoilkn9KNGxxeob32fKCnRPLyN8EQy03rSeyCWxEC8VvLFF42hMkAU
 +dipiHJKDdAD9k39uxR5AmQE0RPKWUW9koD6OoeU2qqjpwjX3QrfMdd
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Authority-Analysis: v=2.4 cv=GdQXnRXL c=1 sm=1 tr=0 ts=686f855a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=YvCmAYiu2kffolCFmWcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: trC_AouotzQW2M5AU8neQ0cKxXrQunjT
X-Proofpoint-ORIG-GUID: trC_AouotzQW2M5AU8neQ0cKxXrQunjT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA3OSBTYWx0ZWRfXwxv5v3E3jI4m
 V1cI9teq6tIlKiUQwem1bLQzhAmVSMSamwTNw0wp8KtU1pUShaQdduk+4DOZX41ZjeJKbVO4/pn
 gV4qvnkM9QzRmaqcN93uAQ7Gy8qteVhceauj4LeLTxtk/kwqcdlk/ToWXkg1rGZ5P3HeU+zsYW7
 DznGtSMz9gvLdBr71B0mYbcKUSMijPpqTFmcKnf4SP1G4C6eEkq9k+/cCsF+LekQFHaHVmVai+E
 lPLhX26bsJjBJjYd+NIGBeXyfV1SoF2gb64FHXOXM0ojTCUcL+YwPyCWS2pZURd+flVz1TH7+93
 ER4Y0UzEYU03FT0xDVIj6uoRfzNFoMaLxr10gld4GhYn+D1GXb3riqaeezfky2x5Lw30J+0fsTN
 9pUzKM7LVeO8NZsfP/ZMrFGgnyo5avkNM72yZ9mgR6P1DbFjLJpgGL4TIy+lE3w7u5ONYX+s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 malwarescore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100079

Currently, there is no standardized mechanism for userspace to
discover which reboot-modes are supported on a given platform.
This limitation forces tools and scripts to rely on hardcoded
assumptions about the supported reboot-modes.

Create a class 'reboot-mode' and a device under it to expose a
sysfs interface to show the available reboot mode arguments to
userspace.

Create the device using the node name of the driver that
registers with reboot mode driver.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 95 ++++++++++++++++++++++++++++++++++-----
 include/linux/reboot-mode.h       |  1 +
 2 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index afadd823d62d0f7e7e645746b978cc8fecfb9ac4..128192d49d895beeacb180c1a92b44a5eddccc78 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -22,6 +22,8 @@ struct mode_info {
 	struct list_head list;
 };
 
+static struct class *rb_class;
+
 static struct mode_info *get_reboot_mode_info(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -70,6 +72,79 @@ static int reboot_mode_notify(struct notifier_block *this,
 	return NOTIFY_DONE;
 }
 
+static void release_reboot_mode_device(struct device *dev, void *res);
+
+static ssize_t reboot_modes_show(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct reboot_mode_driver **devres_reboot;
+	struct reboot_mode_driver *reboot;
+	struct mode_info *info;
+	ssize_t size = 0;
+
+	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, 0);
+	reboot = *devres_reboot;
+	list_for_each_entry(info, &reboot->head, list) {
+		size += sprintf(buf + size, "%s,", info->mode);
+	}
+
+	if (size) {
+		size += sprintf(buf + size - 1, "\n");
+		return size;
+	}
+
+	return -ENODATA;
+}
+static DEVICE_ATTR_RO(reboot_modes);
+
+static void release_reboot_mode_device(struct device *dev, void *res)
+{
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+	struct mode_info *info;
+	struct mode_info *next;
+
+	unregister_reboot_notifier(&reboot->reboot_notifier);
+
+	list_for_each_entry_safe(info, next, &reboot->head, list) {
+		kfree_const(info->mode);
+		list_del(&info->list);
+		kfree(info);
+	}
+
+	device_remove_file(reboot->dev, &dev_attr_reboot_modes);
+}
+
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot,
+				     const char *dev_name)
+{
+	struct reboot_mode_driver **dr;
+	int ret = 0;
+
+	if (!rb_class) {
+		rb_class = class_create("reboot-mode");
+		if (IS_ERR(rb_class))
+			return PTR_ERR(rb_class);
+	}
+
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, dev_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret)
+		return ret;
+
+	dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+		return -ENOMEM;
+	}
+
+	*dr = reboot;
+	devres_add(reboot->reboot_dev, dr);
+
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -84,6 +159,10 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct device_node *
 	size_t len = strlen(PREFIX);
 	int ret;
 
+	ret = create_reboot_mode_device(reboot, np->name ? np->name : "reboot-mode-dev");
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	for_each_property_of_node(np, prop) {
@@ -140,24 +219,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	list_for_each_entry_safe(info, next, &reboot->head, list) {
-		kfree_const(info->mode);
-		list_del(&info->list);
-		kfree(info);
-	}
-
+	device_unregister(reboot->reboot_dev);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_unregister);
 
 static void devm_reboot_mode_release(struct device *dev, void *res)
 {
-	reboot_mode_unregister(*(struct reboot_mode_driver **)res);
+	struct reboot_mode_driver *reboot = *(struct reboot_mode_driver **)res;
+
+	device_unregister(reboot->reboot_dev);
 }
 
 /**
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index cfe18cdc2559be249969bba6c022940a508dd188..3aab8700a5961b90b07ed4d722c77484213ac6c4 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -4,6 +4,7 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, unsigned int magic);
 	int (*write_with_cookie)(struct reboot_mode_driver *reboot,

-- 
2.34.1


