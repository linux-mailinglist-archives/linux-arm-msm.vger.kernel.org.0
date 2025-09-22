Return-Path: <linux-arm-msm+bounces-74427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98836B9173D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 15:42:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC76D3B3F92
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 13:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C47E30DD37;
	Mon, 22 Sep 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSmUKIBv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4721930F52C
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548481; cv=none; b=WPXFQnM2qNjOGdCoLRtY9E94G8wgeaIgh02q4BCrvRKw3c6Tm6+dBb/H9xQHNe+s7fnfwiwcT9kmsrk+nEM+FGJ8oiLa2rFqdZZh0hWc65BZgA1CNuMEsRqVH/YSfrYYL2bVgl1g/udWtGiJnh4cZyCwM4H9cYEE5pv2H1VamI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548481; c=relaxed/simple;
	bh=8AcG56zSaj2lb+5LiiVME4iAOJl8Jy9RSPWY/3KevJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nF6M792ptIp1IVbwmmLKTdt/WlFtuCss0JcZkU0aeJWwZ18PBCFZ9k+DWwRURVwTcQfCVVicUYabBlx/vgRz0HdjUf9PmlYXv9UHmWsFsLIrzVVNQlH4pmdBTM1JkzMeYBEuB5kAVrSMQ1JKHuem24FxDySK9k34f3Xb6h//vbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSmUKIBv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M9BALA029006
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Bdm4klfKmI9KtujwTAZDFlBBRS0qX6qK7HSOvDmFEM=; b=NSmUKIBv3VkNF2po
	nSDIl+NNmIDP3IY3Y1wyO7FJBTTnJWBB67REyU96gThJroNbaxnuiyz+b+g+9MgC
	E8Ez6Dk6OLd15UOZU9ElYEd2WsInFc2UbWqyt1DaR6injkZ3SzMVR3XwT+FNXe9i
	4VMFD/o5Ga4nzDE/Uf1GMzH+nF2ja/T4EmDtkcPMkNCTA7SVn4rWJaDpHcu2TNhT
	pdCianny+0NhWIjoHEIUMbrzqegsOfNkR6LISYrH6fVsBjPL1UOyv8rrGb60xR49
	L+4Jx1WN7mcyWapvVcb4QvvSDXy7pCBdipkZG1rGIbUjNQ9/CnE8/RozJP0qwZZ1
	MlIGFQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk0rp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 13:41:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24458274406so90494295ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Sep 2025 06:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758548477; x=1759153277;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Bdm4klfKmI9KtujwTAZDFlBBRS0qX6qK7HSOvDmFEM=;
        b=qg8CCdQvS6dKCyIYbPVZqbJYU0G7GfZNghOcGc1z5YEwFMSx0SKATHHbY+fQVY/TOQ
         ChKw/0jiolBMW/cyxfu6S3c9b3iMj0z29dgh0HsmiGD/2GwXX9zjMdzSd/szZmUF5Gqh
         dGal6gWUJCKYYCws8k7BrbuTNwtRsfM7U7jBBaLyK8vO5DuUAm4LYClfNf79YugjNZYt
         kESLFsrbHHY9F0owlEI5WPLsR1fsTGcAyljI/lif7W7b5668FWDFhd6/vDUp9+k8w6m5
         CacLlhzV8hH9bKIIVXUOe4JD7ku8u1NoIZCukh3Jxzr6yyM3IsSRhyJaia6kCVQi/6bK
         DgxA==
X-Forwarded-Encrypted: i=1; AJvYcCUqosSyjiu6QqwWjcHPfMrJTQwmAPMVfLlIiBWpI/9W+wKoCGUTuPs3tIj7uRcIrIex0QHOCol0pfHXPQU0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1bn2pRfo84LRIYOP8tLgVJK0va7cryeCgegP+ULodh3A9tg8t
	V8NcVQHPZofTaKYlw063IdpRfNbkklKe0+lqfyXu/t6S35nbS4y3sbcCS9RvTTYdzFoY1q1XJoz
	HA8pFtBXkJpDS0zqB84zkf3tMYYdEuUut/AH7dOUFRsXQlwK1Zx0m4lSh9XY8iiKreNoN
X-Gm-Gg: ASbGncsbbPGqCF7y7OGM/M2gsHMF4LFpdedojMKsZ7ERvvPq9ySam8k/snIbTk6O2BM
	TXX2ZCnJlI+EHYJ8Gylgj5AzD2yKJ6iL00K1DF68q1BWgPnjvzkfgz1oFarIKpS++6UTkQmujqn
	MDxQ+rRRzCZrym+E1b0T29XdDiZn3VjIMLc0MvBGS/97d+TseoylkEzQ933ZJfn1ZqzydcTZaTk
	5JsI0HJD8hHfQ9SlzwJDXAcV3G+03jHLSBJyZLtinPK2D+H6LTSon2D3CkQpS3cgOZHSXlrAZla
	ciouIjzMCVwQwppqmYeRs+WxeSBugX/tcuee4DaGP27Q5GSSEqNO9HYiBnPrQisETbUmsL7QZBv
	m
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158849455ad.58.1758548477553;
        Mon, 22 Sep 2025 06:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9fsATo6UhpdeSkkyqA9MLiHd6fS2xnAaK2hUbkSIjcoFXHNp2TOmj8KWrOBsc5K0Ff729lw==
X-Received: by 2002:a17:903:40c5:b0:24c:cb60:f6f0 with SMTP id d9443c01a7336-269ba5892b3mr158848895ad.58.1758548477099;
        Mon, 22 Sep 2025 06:41:17 -0700 (PDT)
Received: from hu-spratap-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698016c13asm134246755ad.46.2025.09.22.06.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 06:41:16 -0700 (PDT)
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 19:10:15 +0530
Subject: [PATCH v15 05/14] power: reset: reboot-mode: Expose sysfs for
 registered reboot_modes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-arm-psci-system_reset2-vendor-reboots-v15-5-7ce3a08878f1@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758548419; l=7370;
 i=shivendra.pratap@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=8AcG56zSaj2lb+5LiiVME4iAOJl8Jy9RSPWY/3KevJU=;
 b=68MJWOyTk9YoPpAE8jwkXqGx+6Wvip/5TTeO/JMhSodJIzvLvIxFnvN8P9WuuYb4HfkZsPV5y
 FZE5YqWk8eyDbbVfzUDig5EorKo4ODoq1K09WVekij+DlO5VpoSZwch
X-Developer-Key: i=shivendra.pratap@oss.qualcomm.com; a=ed25519;
 pk=CpsuL7yZ8NReDPhGgq6Xn/SRoa59mAvzWOW0QZoo4gw=
X-Proofpoint-GUID: fjVmKRzp5DgD3noRZbDrJiEyYMt_Qb_K
X-Proofpoint-ORIG-GUID: fjVmKRzp5DgD3noRZbDrJiEyYMt_Qb_K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX9q55lHf2032F
 Z8pGWGs+AVeUcVGNBmyxAP1hGEBCFwHjArIfixPMzY/eK3ogp3tI3mpuT6Nale93nDFYLY/rVMy
 MAp9rPe6u4M3dLuXR/oRJbjbDQAK8cfN4X5Wa0UWw6+btEUAEYdgl7WpZz2b/5bw3Osws9ZKjMS
 h9kgu/nM2vpO60mkdmaqqaaQ3gWE0L/g52GfR1Uzlna+3B91Uwenf9dJsVr6yx2KO3qSETCJP+p
 gwvbBKqvAenQK0KO7xJS8CoPQ16NpwuaYUjQAKOGtj3eoQOGZpNcLOP/Eq/j7aKAEKk5t//sLKS
 HRZFEIPQ7JkcM/aVzz2zuBo4piZ6D/1flUf5qlkASvuLaTczYOl3Rte1i65kbfp5dBeG0rmPMOr
 awZvF3V2
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d151ff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=I4qJSSq-i-5ETPqSmjYA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089

Currently, there is no standardized mechanism for userspace to
discover which reboot-modes are supported on a given platform.
This limitation forces tools and scripts to rely on hardcoded
assumptions about the supported reboot-modes.

Create a class 'reboot-mode' and a device under it to expose a
sysfs interface to show the available reboot mode arguments to
userspace. Use the driver_name field of the struct
reboot_mode_driver to create the device. For device-based
drivers, configure the device driver name as driver_name.

This results in the creation of:
  /sys/class/reboot-mode/<driver>/reboot_modes

This read-only sysfs file will exposes the list of supported
reboot modes arguments provided by the driver, enabling userspace
to query the list of arguments.

Align the clean up path to maintain backward compatibility for
existing reboot-mode based drivers.

Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
---
 drivers/power/reset/reboot-mode.c | 127 ++++++++++++++++++++++++++++++--------
 include/linux/reboot-mode.h       |   2 +
 2 files changed, 103 insertions(+), 26 deletions(-)

diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
index 79763a839c9b0161b4acb6afb625f50a880971cc..1e78eb3d0fe513c934b37bf7f0829e1f9f4634f0 100644
--- a/drivers/power/reset/reboot-mode.c
+++ b/drivers/power/reset/reboot-mode.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt)	"reboot-mode: " fmt
 
 #include <linux/device.h>
+#include <linux/err.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/list.h>
@@ -23,6 +24,8 @@ struct mode_info {
 	struct list_head list;
 };
 
+static struct class *rb_class;
+
 static u64 get_reboot_mode_magic(struct reboot_mode_driver *reboot, const char *cmd)
 {
 	const char *normal = "normal";
@@ -69,6 +72,89 @@ static int reboot_mode_notify(struct notifier_block *this,
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
+	devres_reboot = devres_find(dev, release_reboot_mode_device, NULL, NULL);
+	if (!devres_reboot || !(*devres_reboot))
+		return -ENODATA;
+
+	reboot = *devres_reboot;
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry(info, &reboot->head, list)
+			size += sysfs_emit_at(buf, size, "%s ", info->mode);
+	}
+
+	if (size) {
+		size += sysfs_emit_at(buf, size - 1, "\n");
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
+	scoped_guard(mutex, &reboot->rb_lock) {
+		list_for_each_entry_safe(info, next, &reboot->head, list) {
+			list_del(&info->list);
+			kfree_const(info->mode);
+			kfree(info);
+		}
+	}
+
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+}
+
+static int create_reboot_mode_device(struct reboot_mode_driver *reboot)
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
+	reboot->reboot_dev = device_create(rb_class, NULL, 0, NULL, reboot->driver_name);
+	if (IS_ERR(reboot->reboot_dev))
+		return PTR_ERR(reboot->reboot_dev);
+
+	ret = device_create_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+	if (ret)
+		goto create_file_err;
+
+	dr = devres_alloc(release_reboot_mode_device, sizeof(*dr), GFP_KERNEL);
+	if (!dr) {
+		ret = -ENOMEM;
+		goto devres_alloc_error;
+	}
+
+	*dr = reboot;
+	devres_add(reboot->reboot_dev, dr);
+	return ret;
+
+devres_alloc_error:
+	device_remove_file(reboot->reboot_dev, &dev_attr_reboot_modes);
+create_file_err:
+	device_unregister(reboot->reboot_dev);
+	return ret;
+}
+
 /**
  * reboot_mode_register - register a reboot mode driver
  * @reboot: reboot mode driver
@@ -79,7 +165,6 @@ static int reboot_mode_notify(struct notifier_block *this,
 int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle *fwnode)
 {
 	struct mode_info *info;
-	struct mode_info *next;
 	struct device_node *np;
 	struct property *prop;
 	size_t len = strlen(PREFIX);
@@ -87,13 +172,17 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 	u32 magic_arg2;
 	int ret;
 
-	if (!fwnode)
+	if (!fwnode || !reboot->driver_name)
 		return -EINVAL;
 
 	np = to_of_node(fwnode);
 	if (!np)
 		return -EINVAL;
 
+	ret = create_reboot_mode_device(reboot);
+	if (ret)
+		return ret;
+
 	INIT_LIST_HEAD(&reboot->head);
 
 	mutex_init(&reboot->rb_lock);
@@ -136,20 +225,15 @@ int reboot_mode_register(struct reboot_mode_driver *reboot, struct fwnode_handle
 
 			list_add_tail(&info->list, &reboot->head);
 		}
+	}
 
-		reboot->reboot_notifier.notifier_call = reboot_mode_notify;
-		register_reboot_notifier(&reboot->reboot_notifier);
+	reboot->reboot_notifier.notifier_call = reboot_mode_notify;
+	register_reboot_notifier(&reboot->reboot_notifier);
 
-		return 0;
+	return 0;
 
 error:
-		list_for_each_entry_safe(info, next, &reboot->head, list) {
-			list_del(&info->list);
-			kfree_const(info->mode);
-			kfree(info);
-		}
-	}
-
+	device_unregister(reboot->reboot_dev);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(reboot_mode_register);
@@ -160,26 +244,16 @@ EXPORT_SYMBOL_GPL(reboot_mode_register);
  */
 int reboot_mode_unregister(struct reboot_mode_driver *reboot)
 {
-	struct mode_info *info;
-	struct mode_info *next;
-
-	unregister_reboot_notifier(&reboot->reboot_notifier);
-
-	scoped_guard(mutex, &reboot->rb_lock) {
-		list_for_each_entry_safe(info, next, &reboot->head, list) {
-			list_del(&info->list);
-			kfree_const(info->mode);
-			kfree(info);
-		}
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
@@ -202,6 +276,7 @@ int devm_reboot_mode_register(struct device *dev,
 	if (!dr)
 		return -ENOMEM;
 
+	reboot->driver_name = reboot->dev->driver->name;
 	rc = reboot_mode_register(reboot, of_fwnode_handle(reboot->dev->of_node));
 	if (rc) {
 		devres_free(dr);
diff --git a/include/linux/reboot-mode.h b/include/linux/reboot-mode.h
index 3a14df2ddd1db4181ea76f99ef447ed8368a3594..c68a671f6947f2346e1e6a0ce3c6ebc18722b98e 100644
--- a/include/linux/reboot-mode.h
+++ b/include/linux/reboot-mode.h
@@ -8,6 +8,8 @@
 
 struct reboot_mode_driver {
 	struct device *dev;
+	struct device *reboot_dev;
+	const char *driver_name;
 	struct list_head head;
 	int (*write)(struct reboot_mode_driver *reboot, u64 magic);
 	struct notifier_block reboot_notifier;

-- 
2.34.1


