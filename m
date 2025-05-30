Return-Path: <linux-arm-msm+bounces-59916-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B25AC9314
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 18:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C993217823F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 16:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53032367B3;
	Fri, 30 May 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KaERWWz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34918FC80
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748621330; cv=none; b=guNOEYWpGls4TIZUPkjiwRs3jK51wfK54q5DF+AQ/wvvfPu7QXTiK/Bp5B5runSqKVGcAgKDPdDY+mQ8R78a83IrlxiKbz2a6fIlunBFdFttF+1h0hP14+TkihL+ymO0aNx1LMMEk6jB4+R9RYixgLXVoQrKcKqBceTct3F8UK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748621330; c=relaxed/simple;
	bh=V7DzrP67LtCe1bctvDpJ8KQBTk3iWqS73P3krdOhUnE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jb9RgRrUiXwQ3E7SUQ2QDeH/n008Gdle1oPCWpawF3LItiHspX//U4clxlu37yiRXeqHErHkiSVQaMLMMFLmAiWSy9BKUAmtwI24hdkZcu4fuKICVunijG9A529ctasSNVAxRgf+NLT/vWL/TLYaYgPir2yXgNxGEZSEZnhL5YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KaERWWz8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBI01C011703
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9bsnJonvdJ9Xrna+D3/FUX
	cGLzFnNCzYuWULL47hZuU=; b=KaERWWz899nKi3q8WIv4vX0p1MpcH81UYqZr9K
	w9vBdWhYQh28O9CxfL8SbDRYr1Ne5LyDMu2//wfmKonWZ/IK8Rafyl72LOMwI9jd
	DMqDumt69CQCDRKOmbXDcRGTZTNiFycW2newzX24zevGOOZA5WT9R2dmeC2t7eNc
	x6S11IsR8k5WUGiY4cEVPTUSP86stitVkm+5r5iz0otqyejkJyju+hUKP77P05LF
	KqwTF3mbkrgggAxedbpEZpAfdhxD3hkkQHS3FvNQg9lfow3+siVfsDiWrbbaWKbf
	v8e2Ks+TFzfnrVvbXieKO1ArT4zvDxZwtKG760A/xHik7bpQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g99rem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:08:32 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e6f5so561444385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 09:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621311; x=1749226111;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9bsnJonvdJ9Xrna+D3/FUXcGLzFnNCzYuWULL47hZuU=;
        b=ERBb4tQvrNtGJ7kTKVR12xy97B8ntRSdpAdBhsGruBWaF6kNTsNNbMOeUCO9DKsnMI
         rNxlMeO44mwyKuSX8ZT+LzmpP8NdvMx1BTk7rTPUrLATzHoSvgzhLXUJkQSFfHcJgq+7
         5aigifODSkpDPfDrTA5TVLgBddD/PchtP2ULCAOTBtAzQe+05KI97yPlXWXsb23QF6fd
         F4c5e31Gi98yesoF8/tHkOHPiAdH0zC9Yj2stRdUhPUqC10fxEVC5koQJo3t0ECw+3TN
         unSkjLP/MnSDXgnuHlXx5SPCxIgtMqrOKnG6cm6gJO2YcnyWg2M1JBpwwC6bSmTamVZY
         QsnQ==
X-Gm-Message-State: AOJu0YxCcvfnTj8i9MZ71gtrWtG6cqUUXRlXPu88EfQAjI+47XR1uE7Q
	d+DVJ1WZsnqCD6vlOIpLcZEqRiwz6aA1ctTuImxyxk3Om+mYDDPRUkwPnlj/8yjwDw9MHZlA4FZ
	Ubc/kZA+uCUqfeYdJoAGeC85GtHd7v1TD7oiopiNrUhXDjs2Bw74yOvfQJfTVhGns4OUMDfBeVH
	QG
X-Gm-Gg: ASbGncvMAU6Kim2kF4Xokooji1ANk0JS+tcujw5/iNzwN2/bF4M6I1R43MVV+fEmwl/
	gHcyIQ5MpxVLeCM8kIRo0Lf1Uvh2KqRDorbhqlLuhEZw4ZtKiDtztS7ChhQvMwLIcmsLAm8zK2h
	8QbVXFdxUcYKkjLEEQel1lMPcQ+g882h/9aXiU7nOuq2y+Se/PzX1rdo/+vkgooXZVnHAk2oFqI
	u1W7KIBK0u6VQblYzZ8wWKMI9S1GgCAC1j3YuZ8dX9nP2qZWgEpoeKTE2sXCulXmvWm1vRSJ0l4
	NTBo+RItxpfzDKem/svlOQ65Q1GAUg6rReh9CfGnaXMD5ieXNvLFbWBzQBDKf2HHGoCPgWI70nH
	YuXfqCPSKW2SQxcS+Dj8X2QuK+mNUAXRk6wE=
X-Received: by 2002:a05:620a:269a:b0:7ca:f039:7365 with SMTP id af79cd13be357-7d0a49e64c9mr464122085a.8.1748621310976;
        Fri, 30 May 2025 09:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUfS000i7sMDJkYQFbsxdx9k+HNXQLnWsX6E03rvaPDSPkcOHokxDum4TOp01tRUwMJw4Vvg==
X-Received: by 2002:a05:620a:269a:b0:7ca:f039:7365 with SMTP id af79cd13be357-7d0a49e64c9mr464118085a.8.1748621310387;
        Fri, 30 May 2025 09:08:30 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55337937842sm753334e87.221.2025.05.30.09.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:08:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 30 May 2025 19:08:28 +0300
Subject: [PATCH v2] phy: use per-PHY lockdep keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-phy-subinit-v2-1-09dfe80e82a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPvXOWgC/1XMQQqDMBCF4avIrBsxqaaxq96juEhibAaqsRmVi
 nj3pkIX3Qz8A+/bgFxER3DNNohuQcIwpBCnDKzXw8MxbFODKERVVEKx0a+MZoMDTqwUtlZKc2G
 khbQYo+vwfWj3JrVHmkJcD3zh3+/Pqf+chTPOzKW0uu3OUhp1C0T5a9ZPG/o+Tweafd8/jil1W
 q0AAAA=
X-Change-ID: 20250528-phy-subinit-42c988a12b6c
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5558;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=V7DzrP67LtCe1bctvDpJ8KQBTk3iWqS73P3krdOhUnE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoOdf9tVhhtomzo249YCB5oZ1zhqj1E15mG7Tnu
 2HC5c11gYaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaDnX/QAKCRCLPIo+Aiko
 1RbYB/4jvlOGLkwZoZU3nMVu+YiNuZZwpr4ll6XEdSA3oMpy6BegcHtt3OaTcZuAMAK/xG1HLbv
 q8jLnwaWSlYGluGpbi3A/HO1F1CIn5e3q6CLD+fFvz+SRTpZrIezuctQaKdanRCcLop8p+jPLmQ
 ayKCJ65R9YAis3ybRbAru5fSegTmKPwnIYQ+eLUKovAm+vgb2KthOXDrzL1N1fwzsawOi0JqZxU
 RrcH9Q65VCsaxM9pbbDoy3Xb67v2jY2HRrmpXAzHEUbfP3F54QdDbCsXHHsETYBm/kCcjeCSFqf
 r+KOmxqDSn8GGH7SGcmqV96H6J8BFpDHo10Vq1RMZ0BascTI
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6839d80f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=83vSGatpBiZI-y3EDzYA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: jZDhRzTns6MhxocHFfHcK5c9TnD_p1OZ
X-Proofpoint-GUID: jZDhRzTns6MhxocHFfHcK5c9TnD_p1OZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE0MyBTYWx0ZWRfXwDaJRmFB1kpu
 DBr3rJ0UjmFFo5Q9mC/Z+v6o80pKE9BtSk7OIwGHI6CuehCYcVBlxyPHei80WjRWKdiR/vhGskW
 jYTb3dU6SxR6E5N8cY/psvqaHav2uBVmcqmPV8c7ol8NDRUan2cLLMqyej7exfTbzwlUt2nt0OD
 CtxBPPUiw2nwqTAcFd4e43hxuSMH3RDpj0vH3vRa7h+heIfbJdjpNoosR836upzgWDkSiEPLCia
 rGrQ4ydd3zkGGdtjeXutB5GBtOWwaSKB7Rqh5/ZB6kt1oOVlNzYW2Cbl47W2gV8Oil+7bHSbCMm
 dCOddsSfLaFRmdpz7/JhVlGiR7GfXX+dL16uc7nC297BzmET6Urmok3yT2uoMPcPB9H6tTxZhin
 7WTEQW0O0SFYNfrM6RqTnViaBmNJLTEwadIbxtyF9eyarHziChDMz8lDvq30HW1fC9yPFN2/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300143

If the PHY driver uses another PHY internally (e.g. in case of eUSB2,
repeaters are represented as PHYs), then it would trigger the following
lockdep splat because all PHYs use a single static lockdep key and thus
lockdep can not identify whether there is a dependency or not and
reports a false positive.

Make PHY subsystem use dynamic lockdep keys, assigning each driver a
separate key. This way lockdep can correctly identify dependency graph
between mutexes.

 ============================================
 WARNING: possible recursive locking detected
 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 Not tainted
 --------------------------------------------
 kworker/u51:0/78 is trying to acquire lock:
 ffff0008116554f0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 but task is already holding lock:
 ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&phy->mutex);
   lock(&phy->mutex);

  *** DEADLOCK ***

  May be due to missing lock nesting notation

 4 locks held by kworker/u51:0/78:
  #0: ffff000800010948 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work+0x18c/0x5ec
  #1: ffff80008036bdb0 (deferred_probe_work){+.+.}-{0:0}, at: process_one_work+0x1b4/0x5ec
  #2: ffff0008094ac8f8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x38/0x188
  #3: ffff000813c10cf0 (&phy->mutex){+.+.}-{4:4}, at: phy_init+0x4c/0x12c

 stack backtrace:
 CPU: 0 UID: 0 PID: 78 Comm: kworker/u51:0 Not tainted 6.15.0-rc7-next-20250522-12896-g3932f283970c #3455 PREEMPT
 Hardware name: Qualcomm CRD, BIOS 6.0.240904.BOOT.MXF.2.4-00528.1-HAMOA-1 09/ 4/2024
 Workqueue: events_unbound deferred_probe_work_func
 Call trace:
  show_stack+0x18/0x24 (C)
  dump_stack_lvl+0x90/0xd0
  dump_stack+0x18/0x24
  print_deadlock_bug+0x258/0x348
  __lock_acquire+0x10fc/0x1f84
  lock_acquire+0x1c8/0x338
  __mutex_lock+0xb8/0x59c
  mutex_lock_nested+0x24/0x30
  phy_init+0x4c/0x12c
  snps_eusb2_hsphy_init+0x54/0x1a0
  phy_init+0xe0/0x12c
  dwc3_core_init+0x450/0x10b4
  dwc3_core_probe+0xce4/0x15fc
  dwc3_probe+0x64/0xb0
  platform_probe+0x68/0xc4
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x3c/0x160
  __device_attach_driver+0xb8/0x138
  bus_for_each_drv+0x84/0xe0
  __device_attach+0x9c/0x188
  device_initial_probe+0x14/0x20
  bus_probe_device+0xac/0xb0
  deferred_probe_work_func+0x8c/0xc8
  process_one_work+0x208/0x5ec
  worker_thread+0x1c0/0x368
  kthread+0x14c/0x20c
  ret_from_fork+0x10/0x20

Fixes: 3584f6392f09 ("phy: qcom: phy-qcom-snps-eusb2: Add support for eUSB2 repeater")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Note: I've used a Fixes tag pointing to the commit which actually
started using nested PHYs. If you think that it's incorrect, I'm fine
with dropping it.

Note2: I've tried using mutex_lock_nested, however that didn't play
well. We can not store nest level in the struct phy (as it can be used
by different drivers), so using mutex_lock_nested() would require us to
change and wrap all PHY APIs which take a lock internally. Using dynamic
lockdep keys looks like a more ellegant solution, especially granted
that there is no extra impact if lockdep is disabled.
---
Changes in v2:
- Fix lamsm ML address
- Link to v1: https://lore.kernel.org/r/20250529-phy-subinit-v1-1-b74cadf366b8@oss.qualcomm.com
---
 drivers/phy/phy-core.c  | 5 ++++-
 include/linux/phy/phy.h | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/phy-core.c b/drivers/phy/phy-core.c
index 8e2daea81666bf8a76d9c936c1a16d6318105c91..04a5a34e7a950ae94fae915673c25d476fc071c1 100644
--- a/drivers/phy/phy-core.c
+++ b/drivers/phy/phy-core.c
@@ -994,7 +994,8 @@ struct phy *phy_create(struct device *dev, struct device_node *node,
 	}
 
 	device_initialize(&phy->dev);
-	mutex_init(&phy->mutex);
+	lockdep_register_key(&phy->lockdep_key);
+	mutex_init_with_key(&phy->mutex, &phy->lockdep_key);
 
 	phy->dev.class = &phy_class;
 	phy->dev.parent = dev;
@@ -1259,6 +1260,8 @@ static void phy_release(struct device *dev)
 	dev_vdbg(dev, "releasing '%s'\n", dev_name(dev));
 	debugfs_remove_recursive(phy->debugfs);
 	regulator_put(phy->pwr);
+	mutex_destroy(&phy->mutex);
+	lockdep_unregister_key(&phy->lockdep_key);
 	ida_free(&phy_ida, phy->id);
 	kfree(phy);
 }
diff --git a/include/linux/phy/phy.h b/include/linux/phy/phy.h
index 437769e061b7030105c9ea4e9b0da9d32b6fa158..13add0c2c40721fe9ca3f0350d13c035cd25af45 100644
--- a/include/linux/phy/phy.h
+++ b/include/linux/phy/phy.h
@@ -154,6 +154,7 @@ struct phy_attrs {
  * @id: id of the phy device
  * @ops: function pointers for performing phy operations
  * @mutex: mutex to protect phy_ops
+ * @lockdep_key: lockdep information for this mutex
  * @init_count: used to protect when the PHY is used by multiple consumers
  * @power_count: used to protect when the PHY is used by multiple consumers
  * @attrs: used to specify PHY specific attributes
@@ -165,6 +166,7 @@ struct phy {
 	int			id;
 	const struct phy_ops	*ops;
 	struct mutex		mutex;
+	struct lock_class_key	lockdep_key;
 	int			init_count;
 	int			power_count;
 	struct phy_attrs	attrs;

---
base-commit: 460178e842c7a1e48a06df684c66eb5fd630bcf7
change-id: 20250528-phy-subinit-42c988a12b6c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


