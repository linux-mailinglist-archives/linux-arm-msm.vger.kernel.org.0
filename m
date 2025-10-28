Return-Path: <linux-arm-msm+bounces-79109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B53BC1327C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:29:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D26454F8ADE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1432D29CE;
	Tue, 28 Oct 2025 06:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOtAkgkp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D462C3274
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632905; cv=none; b=c8Tp/62/O+vVUoWe4TlJSlJjFfWmA1xYiTuLvHF4HeIYv5Re0YIuZORPkfBTtCs8X0hTU5bOH+EF491mv8PCV/alvlyaGbKcC0MB9qbWVtOKb2/uJps3WsjyiNxgmiAOXc8iaFrPCMxZz1U+9FbnQ8R+3TluUKd6D8iSwNsjUdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632905; c=relaxed/simple;
	bh=qIU3aNCwc/5hLOTjRkewyXRoR9HF6h6FxhePov1nhio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KN738g1ZXyVaZ7ptsqiSpghsK1Okd/oK8IVjj2A6gG9XLa1t32CBXtAi0ohvm1RUDzVDC/X1GqjZPmrRFuwwQNs5YfzEYwVQ07mtZc+vg5scRzI65VwghZUF1NDVN2yOMK3/I+zV05572Ts9m4v9IHOLMIVaWrFdB4cZ6BwzvRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SOtAkgkp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKk6123813268
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g431kojCgCIdaHw5eAvJNcxgtIOm3Z6fvyH460xV/cg=; b=SOtAkgkpe75CSDY1
	MBmaVB/riACzGOn+oRa/V7XW9wWQ9OMsvRuT2XWAdjJHhtUHGmbJ+r156kCwDWFn
	3r1oe8fGJGon4zSEDIi0LLukaWIz+4FYZ18RdnzpQGiMfwVyWdGxHbgoUEgouamX
	0/rxaxbYFah8MAIWW1c1Q4ExDGSsqt6/OhUVnHo291ljrAbdePWfvCm5H8C9D/k4
	S7xGiQ4jltCZnjiWR47Jmpaa85KJFINL/sQjFhqjNhzwENa+jsiCdgYU4L1jSUZa
	QheRRRS6XTxERezdUWdDcYPMsq2BlIZrdmKtO7QU1qSldROdlODqLv4wjy3hU1af
	xt/fiA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2fs9p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2698b5fbe5bso75924805ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632902; x=1762237702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g431kojCgCIdaHw5eAvJNcxgtIOm3Z6fvyH460xV/cg=;
        b=PZ17So58bCJT8aIGSvoh5Ll/R3a7pfJl9NQiFifvECoBC5dIzXmpI23LLeFTmvNNh3
         C4H8JaeURLQ0SWBQmcCqAy87PRI1IRTJPPQp/W0pCk/T5D3ncc2mumTeZ1x8CI+YS3hk
         08WW8mtDjnIS/FKfa+Jy3DaQEXfbTE5GzZ6oJWEtDEHayJ1smg4jfa49DHK3dXD5ZU++
         9wjiPIj1T1idi1eM29gtCsMrRD4/vGjYNqjtzAa2pxQwrBHXGJFEYNjlnn5+D+TJ1x7f
         9JXQmC2kmYOO4aGIkiq+P3JRfLL2tqQZvyzUC7YH6hOOPrx+HjWomxR7cCR3WEzOjWPL
         vIxg==
X-Forwarded-Encrypted: i=1; AJvYcCXka/93o3ydUIIN2p9mYfuJ1k49OE0QqqfJ/WJZOUaXxC2ziX6iwr517YLV2BzkPyA69lemift3ndZ1QX95@vger.kernel.org
X-Gm-Message-State: AOJu0YwTmnbwSkxwYQvJRWNqF+itvs+rxFaBPj8N5kyvNaveXadEnnyz
	RVY2wfl0+Y2+VbL3UvmDcEip2FeObH1oJEUPzolWSdfiyjmv9aMWX+a6/ljN6mn96eZbKBq2M5n
	uRsH1l99Mhnc4amUHd/WRtnRt1leQCncOb4clsmlpelVyIges8pcMvvMiwRSUMH6PUlCj
X-Gm-Gg: ASbGncv3aPmUrYadJyukbjf+ADy5gCuGhzrq2d/23FkP0RdJPKK+PdNTOuVOlPSaf9P
	we+Vz5s8PtMC8gGhYKlgwQ7YdwaoEksLrJa+7iXiISo1Bw0mYUwL/KhDj425yFaLIKKH9RvaHSb
	SDxl8uJiOC8UwxiBYokil3ACZgEuUB+J6Jseyk5k2KF5cLMCYkSxNHLHV5vbLSb/50IMZR/MVFm
	LxFUort7UplD91l4X5Ppzud+w/yvBRgs2NPebJrDxDih7FcMCyLF31cAmkmMcTFv27+lPHMFPCp
	dj+RHaYiLy+l8RGpVz1bgMdDQ4Ft6lCPIPUOKoijPytIHC2a1b5zOe0X9vzK8Zo06BfKjTn4+HC
	qEuM98P8p7e2fsVmGm6zVxCOrykzjzlR3EPb/5Pe+EoYotFHREX47BvHv
X-Received: by 2002:a17:902:d512:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-294cb507e7fmr35701505ad.31.1761632901953;
        Mon, 27 Oct 2025 23:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEME/3GpZ+fHVnhT/neGuF54I/YdEoLry6x5u4DcYZycqBkHn6J3tXGPw60NQ582VfUQ6nLA==
X-Received: by 2002:a17:902:d512:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-294cb507e7fmr35701155ad.31.1761632901455;
        Mon, 27 Oct 2025 23:28:21 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:18 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:07 -0700
Subject: [PATCH 05/12] coresight-replicator: Handle delayed probe for CPU
 cluster replicator
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-5-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4448;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qIU3aNCwc/5hLOTjRkewyXRoR9HF6h6FxhePov1nhio=;
 b=WfK40WV2y8LNmku++Vn6N1Zf/2VTmZeY7+ENZ6akJVkIVwtz+hRg9mjsmdR993NMUEjTIetb/
 hI7bYBE9VN+CY2JUPDMelBWe28EKfG4FMUBKyANLLsrBS08X7hezlyf
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXwBenSScuBksV
 h/ta8BKITCXObXL0H+v9v+Y9c/U70axRhYWoKQ/N/XQ5Ga5k+jcoEiay5aT0V+sSYe4uZqLT4sv
 qsbRpkqd7TA8so6HsHcyx9/5Wrn5sOxGvRSOoz+hdb7nBxeF+o5d2JQ1e1tzics6Re+Ro0AVxjo
 dlx2UzNa+/Y+sztqe36EUSSetPmHPvLAzKKEveIDVOuloWVCPzZ5r0p0t7GfB+GunDOKRUxcHws
 cdxc6R29OedTtgUK/kLiFQj9cc2IQ8PpfOTZMVLuTmtqVuI3F3iGtruW+CuKpVixYlhB8RlvOA3
 nsAs0nHwwGOlBQ+SiAIIrdzFUUGgkLHUX7GrCQjoWwZYhp1JAnQL8aBtLXbqro9oaiUo2tQtZGe
 gsGD/C0Hajj7vtCdr8BGsEXZnPwvJw==
X-Proofpoint-ORIG-GUID: zpDj_ilbsleekK6S3r0NTlpgkA8ENUYq
X-Proofpoint-GUID: zpDj_ilbsleekK6S3r0NTlpgkA8ENUYq
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69006286 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GdHxG0adR5Xe-XRRLWYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

Delay probe the CPU cluster replicator when all CPUs of the cluster are
offline, and re-probe the replicator when any CPU in the cluster comes
online.

Key changes:
- Maintain a global list to track delayed replicators waiting for
  CPU online.
- Add a CPU hotplug callback to retry registration on CPU online events.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 65 ++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index c5a9c7a2adfa90ae22890ed730fc008fe6901778..1dfe11940cd6001db3cf17249b0493027b65e19c 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -26,6 +26,9 @@
 #define REPLICATOR_IDFILTER1		0x004
 
 DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
+static LIST_HEAD(replicator_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 /**
  * struct replicator_drvdata - specifics associated to a replicator component
@@ -37,6 +40,8 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @spinlock:	serialize enable/disable operations.
  * @check_idfilter_val: check if the context is lost upon clock removal.
  * @cpumask:	CPU mask representing the CPUs related to this replicator.
+ * @dev:	pointer to the device associated with this replicator.
+ * @link:	link to the delay_probed list.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -46,6 +51,8 @@ struct replicator_drvdata {
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
 	struct cpumask		*cpumask;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct replicator_smp_arg {
@@ -395,7 +402,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->cpumask = replicator_get_cpumask(dev);
 		if (!drvdata->cpumask)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->cpumask) {
 			ret = smp_call_function_single(cpu,
@@ -403,10 +410,15 @@ static int replicator_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
 
-		if (ret)
+		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &replicator_delay_probe);
+			cpus_read_unlock();
 			return 0;
+		}
+
+		cpus_read_unlock();
 	} else if (res) {
 		replicator_init_hw(drvdata);
 	}
@@ -420,8 +432,13 @@ static int replicator_remove(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
+
 	return 0;
 }
 
@@ -554,8 +571,44 @@ static struct amba_driver dynamic_replicator_driver = {
 	.id_table	= dynamic_replicator_ids,
 };
 
+static int replicator_online_cpu(unsigned int cpu)
+{
+	struct replicator_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &replicator_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->cpumask)) {
+			list_del(&drvdata->link);
+			spin_unlock(&delay_lock);
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			replicator_clear_self_claim_tag(drvdata);
+			replicator_reset(drvdata);
+			replicator_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+			spin_lock(&delay_lock);
+		}
+	}
+	spin_unlock(&delay_lock);
+	return 0;
+}
+
 static int __init replicator_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-replicator:online",
+					replicator_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
 				     THIS_MODULE);
 }
@@ -563,6 +616,10 @@ static int __init replicator_init(void)
 static void __exit replicator_exit(void)
 {
 	coresight_remove_driver(&dynamic_replicator_driver, &replicator_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 
 module_init(replicator_init);

-- 
2.34.1


