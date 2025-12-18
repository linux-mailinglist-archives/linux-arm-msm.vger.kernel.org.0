Return-Path: <linux-arm-msm+bounces-85651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57470CCACC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:11:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4A1563035D22
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C882FB632;
	Thu, 18 Dec 2025 08:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlLBEV1N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fuInv4M1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C0D2F1FF1
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045450; cv=none; b=fqwH38plb1/QaAxDSXKuAZb3V51+Mny42ISuwsPxK+r2BiPhbMovJ0jMo796LmtSKjMuwLYsGn/2yZFmOcibz9gCh8JmivnlPihuQYUyCX660YtWgUS2bokIA4cbBQUb7xDDkpdvWwcH8KLzgnSC9nK3kh4wJzUfmjWlTBPThio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045450; c=relaxed/simple;
	bh=EzmTjovOY8ZLvq+FhSWCXV6W5sqcn6OLtBFjUsyrb2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cx9z3LYtzivz91eQ5mt+wQqvSVg1h/YG07oVngI0UgDSYnb2GWKWsV8ZHpm7ePyXqtq7txJYpd04DQHot9Gmkg2vCKSRY+Xay7QGvUN7bN3Q3w7mrmfJePJjQFzXosSHigOppP7wLVv1qR7IgKOpO9woPmcJZQ6u962cHhOcUlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nlLBEV1N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fuInv4M1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YURI4057275
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=; b=nlLBEV1NP58stCH0
	lmJ7RGV7VtOw74BKMwMfNZwlJcqk0se5ZK7em8IC0O5Cy2zhu4r/jqKVkbnscPar
	fKhCZguTj5apv2cTk6AalbfwQbaG99bvwklaYN7/1gc2BiNfMnDf0y10o6+2CGcQ
	CLuUeX0JBfPF2qNlglnkMLH02J3Riwr1/l9JfxA0PUdOO6FyjAtfBXH+L5KG/jyd
	qOjWkryMZAJxj2PS8g1FHrUZ7cH2CFwp77oU2hY6ZIxypLZyI/iN7A5Irho0RYif
	xhb4abx8ZKIm7LBcExARsvOQJAA0xmdJIe7d28RWs3sEHXed/s1Z4wNm5HNB4MTk
	EaPT1w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:46 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b6097ca315bso736827a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045446; x=1766650246; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=;
        b=fuInv4M1Gm+PfrMtFVNYzoUxmvStYq/RrMibnWGQ6Vv4EeNkEY8iG55YFtwYdn272w
         /cxOU6hygUoBEZo+4Ja4lE1Rpx984u0UZnKHoRQPNZwwOJYG0xFCZyKngy6fa43kWD9f
         4f/rD0rjFT1X53UM/kF0VWQEyw6gxst2DiGQ/SmwgEBaim4gQAOnPCPk2SF2YaKAjyK+
         Wm1IhGRYWXdEFD51/zwVeolO6/kEeEvkbTSI6OLfF7DNo7ltedfZbYIwfLdgm2eHt3DX
         12fYPCqy29Ib4r5lX1H/YBY8r+OyvuGhyCrEMp+kWANTOhwRpLJCQTXsF5vgg48iaQ5m
         ZV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045446; x=1766650246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=;
        b=t71AxA84j4rYyi9VSyAdLShjJ2T6IwuCS5zbrVjLDNHZSaKDGHX5DDr/NbE21VCcgm
         nkxl4mHk+0Ubox9zWR5fvg9UPtgbAUlvsRJyP/HXvQiXQQ4J5n9X/DiAZw2ymXz/G0wc
         Bn0EUORCzaxYk2Wzd6e/HhemAmt5wdoneaTGUdmcnwVlCCSNyFyxyWtAX+F1niQVK1fQ
         1PGgtxSuO6Z48TkqvgVb8OKSaWmN51ltAL214N+ktAs3Kzmo3pJCUNtgWeYfWc6FAzI8
         GU9jmiyxeIwtU9JrWZ05l4tYrik+0p37KsnGAwnB8CLEr80xsfr0KNDuSySJZIJw4n9k
         EI/A==
X-Forwarded-Encrypted: i=1; AJvYcCUp/5wUy5S2sgzmXZg2vOoEt2N5b9pMMEDtu+FwgpNb2rEcHUgKbWPZk+WE+QfOeA2dIS+zjVvDvy3jm+ai@vger.kernel.org
X-Gm-Message-State: AOJu0YzLic2WqItGozYWoOWXpauOvlLPIKcosmOwsLru4Ke+aSV2IFI7
	WjUMuCZAFZIIyWYql3s0ryfFjGNiqG7bntsqKx8RTaV6NmFk185N3QxK36FyYL/EpDfjW9s3lrH
	FAnWHNvqOKHIV7iTD9PWMjgrCH5y0cLaX3+kF8OCfkLAfTaQAp6HNNi6q8tKJpQ12m0Yk
X-Gm-Gg: AY/fxX7dTuJNFOdO12/wDppT2i7NpwnqF1y/n3tG3nFXcALpMMc4pSrW8bek9sA7vpz
	rkAAvjKuiaM6mWL9sRLs9ixpDu8A1/bkXpYT3k0zgLbpaYf13qJRl3rljpv3KMU+e9njf6TCU5C
	+ABiuxBdiHhWqnny7eX6Rp98Dcp4EZGkPSpxOqOHfYJXuuxTYepGrOx8auVB98PhkyErmN9MqUB
	0HbD7lTcNlCd4g+3UwtRDup7KsFeglCh8jOeSSsSKQAylYfHjpIjoK32tLsG9YvyTrmUQNU0fbV
	BGZoWeZ5kfPbW0xib0TjD8oaU3aar6cfkwrjbnC5NdLqQSBQM51J0fPkLJVK53CdNq5tAnkpqP9
	shD7l8KSSSykZYu8sLwhFlk3RiAriGLCQygkPaz5DYxRZqZ8q3SjRw868zEgNIOmaTMY=
X-Received: by 2002:a05:7301:90d:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b0583451cemr78955eec.39.1766045445533;
        Thu, 18 Dec 2025 00:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6Rtac4ST/Xw6G3OLHunGaaU4Skb5aCMWXFpLcOKLZnMdN8oZ8l6EyI8oL929mTkE6OsPjnA==
X-Received: by 2002:a05:7301:90d:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b0583451cemr78930eec.39.1766045444960;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:45 -0800
Subject: [PATCH v2 05/12] coresight-replicator: Defer probe when associated
 CPUs are offline
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-5-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4711;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=EzmTjovOY8ZLvq+FhSWCXV6W5sqcn6OLtBFjUsyrb2I=;
 b=9WosRBoUaICYMC/MyoaNovxgCu4/IAzJ+7DbEmhwShxGQ0xRaa/LEO48zJrbR8bnsW5Cxm4o4
 4UP+KyS/r+pAYVO3W6NHDXCt6CeGKiWNZmnUFd9XonoZSj5s7NRZ8yj
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: Vvs_GyXuIKJpBaTqInWAs9ea1CpNLNdT
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b707 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GdHxG0adR5Xe-XRRLWYA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX7HfNkrxHrk4K
 RHw5BN3KY+VOfwLcfYs9239QkC6k7zGLgUaSC4VIYLvKpq1U6H8GuuYIvBKN2jFblnf91dSMki5
 Ooh80jPhtd1XccJbNghrBpcaG7r1OFgNoWyHYGvL/kW0se1hvXRhiA9Z7lkZd7Rpq6t0EIrPPSR
 eiS15GJo9BemnFnKjtafgKyADOt9u1+1airkF8x3jQOYDMMPU5qAFdNiYCtwBzhymOaeVvda2lA
 viXGc7E2mtY2XJdAqYLBsG5YygpHV6Lh0tunTtLoc8dZ1dEV9rmtSpbuTuYj7ESfGOdxHLmn/Vw
 5UAyFs5PgyPZ1ma57ZVrHUHGDTpzLzlcjeZxv1LJ2z9s2AIvmjtM6YWr6OK1QQwa9RTfRN7VXBQ
 WZJCSVZZDNgBXh8wo2D21G3NgJHLgw==
X-Proofpoint-ORIG-GUID: Vvs_GyXuIKJpBaTqInWAs9ea1CpNLNdT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

Per-cluster replicators rely on the associated CPU cluster being online
to securely access registers during initialization. If all CPUs in the
cluster are offline during probe, these operations fail.

Support deferred initialization for these devices:
1. Track replicators that fail to probe due to offline CPUs in a global
   list.
2. Register a CPU hotplug notifier (`replicator_online_cpu`) to detect
   when a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   with the CoreSight framework.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 65 ++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index c11da452559c73af6709b39d03b646cb4779736f..f8d13894098f1e414fb0da8d6eeb1da4f0d55a8c 100644
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
  * @supported_cpus:	Represent the CPUs related to this funnel.
+ * @dev:	pointer to the device associated with this replicator.
+ * @link:	link to the delay_probed list.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -46,6 +51,8 @@ struct replicator_drvdata {
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
 	struct cpumask		*supported_cpus;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct replicator_smp_arg {
@@ -394,7 +401,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->supported_cpus = replicator_get_supported_cpus(dev);
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -402,10 +409,15 @@ static int replicator_probe(struct device *dev, struct resource *res)
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
@@ -419,8 +431,13 @@ static int replicator_remove(struct device *dev)
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
 
@@ -552,8 +569,44 @@ static struct amba_driver dynamic_replicator_driver = {
 	.id_table	= dynamic_replicator_ids,
 };
 
+static int replicator_online_cpu(unsigned int cpu)
+{
+	struct replicator_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &replicator_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
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
@@ -561,6 +614,10 @@ static int __init replicator_init(void)
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


