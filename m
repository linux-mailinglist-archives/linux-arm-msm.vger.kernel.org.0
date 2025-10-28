Return-Path: <linux-arm-msm+bounces-79107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 060AFC13291
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:29:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BFDB586B10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C8732C11C7;
	Tue, 28 Oct 2025 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IvbUDwi0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522012BE650
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632900; cv=none; b=QY+Tgzo83H4tkZ6QTUWBp5PGxMGi6iX7SWtPKOsnjnEklLH9fGQ3COBM5X74hDZ4CEWLxYZy9cfLG/5lx4eZoBgNDXm2A+0P8xUUufiiZ6BPoEB5pU2DGDNui1Mi+1uD7hHeXpVxI29tyKnpqZ/hWKKYwBSID4+M0zZHy411Dz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632900; c=relaxed/simple;
	bh=0zJwLJ/CbFy+0o+vHzhKVbidP9iIvwNMjcD10+y0AC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SumTrk8X2iL+6TVefeJFdiFzt52fFT43pNv15raH6V0VpyVFCVpcUgN6/hUKZHlTZDp3mJeQ1PCX4HFxjNEcN/Aqiu4pvczNPE4QEa/gdOeO2bXLO3D0k/n2QPVnUfGYJ6qg9qbev3dx/x8LMjN5yuevt6JDGAWSG4amZEg04CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IvbUDwi0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RJgisU2547860
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihaICepOH/H2KF61P/KWnAMH4iJmI07j1aiDcVn4nw0=; b=IvbUDwi0+gLPIW6t
	Mshh+4EJYSr23lTAw9NvhaANgTOIaAtyoJCiPlkqfhcRKuKjYXyZWqTHRWdy51tv
	H3DCHnhNHqtnr/z3J9nEu9xHo4tsTisPJOcQCy5m94CvWWNFIPmSthJPdhpvFrcq
	FlEVRKXCfmHgFGtXIe5GxOup55tLgMNKlFYshsBYtzrrJ1JsXw1BPcwqoxt3PEIV
	JbzIgmpPx/HvGQC88CAK1YwjQvJYMnCjhXhNGbOkg9nCZmeSF9Gi82jQwUGzgluk
	g1EJs7d45yb5Z/ySldH3Pmq0CJtfKBZEkrzr0qKgDI56jdHA1C6WVwMueVzNNoTI
	cM53tQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2k1v5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:16 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2924b3b9d47so50552365ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632895; x=1762237695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihaICepOH/H2KF61P/KWnAMH4iJmI07j1aiDcVn4nw0=;
        b=o/ZW/YMRNXJAZBYzXJcEEcnSmGrJwOkqo80RakCguoEdvGuRI6Cr8t7jL4Yf5Ur4jl
         mk2tvrgtQA9SSNaVt1RCNE/kgfPmJUUvcL+TXv2o10AkgECzzc7Vzf4VNemD8jWakebk
         JVoVKM2e9FAuMKh6U60zp9A1vwVUgPAezvTmca6+o5gI5LUo9ULpI+9m9tPmOckBcIfu
         uvwRodKkw+OcWOEmOS1cnJK6G9dlnQBg70fqrYD4pxu4W9YRJv/UxSHIO6l2cQJ/t5Gf
         ufA3Wmcc8+MCy33p3rzzr8LZVKLMlMa9mk8LlqcZqpykkVmrn70FHCFh2NAl/LgMgM+N
         pE2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpvWVZL9PE9VblOHyJV4It3/W7QrYGeNnICJUy1W5Ngow1NHIBW7vvqqtUPUruCTJOH0FjJrv9sTnCHC8F@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8njr3TeE2N38q3cTgx5YTGH/QcojZZtxuC7FMxMUcUGKZ6ZG2
	vJlkT8JB4JW1fcOOrm9FbxVui2D7Ilh0F6+uUQSAYmX1aISHVomiS304WrsXlsgmjDcvnqc8c+L
	xEu6eJvXE0IaRn51Abg/y9v+nxRiokVDQjVHclRHyI9GukXuVsItNSUmUMUXjkYlyGH7r
X-Gm-Gg: ASbGncvkyR/ehlivPS7mEi4slsPv45AKkLHsfR11jVUCGUZxieZfHGlqG5Y2AwtMTC+
	gs+CQc2yCNRHLKI7wEV2hAX8fFeqG07CRAGs/V3XzsLfZa6vtcIiCs4cf2Z1NB3eYR1Bf0HGhVp
	g0K/DSMdspYeNgqbqrukWhCsHSzJpNvQ2wLXXp0r5GV7YYBHY3Uz2uKsQ5QmnqMm+nF1npTFrIv
	dTt9vW3OhcFdda/PAOsazkXK5bd/LRBCKOQEMjUQyE0/vi3MFLKne/iPI/FB5PZtyEwbocdeO5l
	cpza7IJVPI46Gi82P3wU1v+oVhNjirduB0ptjh1gGNKNPfH2hCSWEEzRP54Y2nxq3rNqhmZ7win
	kRMoalqjJlQcVW4mESTdtao6AzlJpw1UpZwrz5TaUl6JG6XRVZBPUdhZc
X-Received: by 2002:a17:902:ea08:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294cb37a907mr28947185ad.7.1761632895346;
        Mon, 27 Oct 2025 23:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJKoZD7Rgv3OxbONxnAhm8PnP+RQwsXfsBy50pNztScJdWZVZNyqy9yffWSj3S68WVbYCEfQ==
X-Received: by 2002:a17:902:ea08:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294cb37a907mr28946905ad.7.1761632894825;
        Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:04 -0700
Subject: [PATCH 02/12] coresight-funnel: Add support for CPU cluster funnel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-2-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=9298;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0zJwLJ/CbFy+0o+vHzhKVbidP9iIvwNMjcD10+y0AC0=;
 b=MKYeSZfllSCAj//ygPXLgxpCdpi1CxWUmnZ5rZenRMYxbbKXHdYy2Pm2qzgHEvBd4YeaO4lre
 AT5ZZPRozVGCbZfkKhuPkacdE22frWOA+U+QXk8mMa7fpA8SlfitfSt
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: SDMLw3NvhKCD4WL0nxI5sYCBQ4Zmiu1F
X-Proofpoint-GUID: SDMLw3NvhKCD4WL0nxI5sYCBQ4Zmiu1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXyPcdvkJCqnAI
 f5LaJHvCNkIh6v3MWMYrQcHz7Te9V0i6BC24/NoZf+5d4M/vJeimJwytXHNZgjzBLaWUh9M+LFl
 JipkstQF9edozm1BNYUSE4RUNicS7pNt/VIecpjyjkUshU0aEOyHmQsK2TlJ9nTeyU76v94unQ5
 q4SKmZmqYAyvAO5BadoUrtsqer+QgPnL8+X8jbGhChrkFJOIdgglRas1Js58P0X3/n/G5wwm5hs
 yKOsYV51CiXuzqawUB3ednUnkyLCXQw08+5GTzAofSmD3Nb+hhXTdjbFyH96NA9c/ag293MUwWD
 SMSa0UMsz7wIwi0ayAOg9uAyNO8Nf7BeX/IObJ6HWrRFahFsJg50b3d8V5g+XS/BJ3VPSpQ8Ua0
 TAADfU8O+SYo/GBTN6zpPVMYVRhzDA==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=69006281 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mZjCGalVderqEPr0BrkA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054

The CPU cluster funnel is a type of CoreSight funnel that resides inside
the CPU cluster's power domain. Unlike dynamic funnels, CPU funnels are
coupled with CPU clusters and share their power management characteristics.
When the CPU cluster enters low-power mode (LPM), the funnel's registers
become inaccessible. Moreover, runtime PM operations alone cannot bring
the CPU cluster out of LPM, making standard register access unreliable.

This patch enhances the existing CoreSight funnel platform driver to
support CPU cluster funnels by:
- Add cpumask to funnel_drvdata to store CPU cluster's mask for CPU
  cluster funnel.
- Retrieving the associated CPU cluster's cpumask from the power domain.
- Using smp_call_function_single() to do clear self claim tag operation.
- Refactoring funnel_enable function. For cluster funnels, use
  smp_call_function_single() to ensure register visibility.
- Encapsulating coresight registration in funnel_add_coresight_dev().
- Reusing the existing platform driver infrastructure to minimize
  duplication and maintain compatibility with static funnel devices.

This ensures funnel operations are safe and functional even when the CPU
cluster is in low-power mode.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 185 ++++++++++++++++++++-----
 1 file changed, 154 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a38f501777fe162fea850d1c851b3..12c29eb98b2122a3ade4cbed9a0d91c67ec777ed 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/coresight.h>
 #include <linux/amba/bus.h>
@@ -40,6 +41,7 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
  * @csdev:	component vitals needed by the framework.
  * @priority:	port selection order.
  * @spinlock:	serialize enable/disable operations.
+ * @cpumask:	CPU mask representing the CPUs related to this funnel.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -48,6 +50,13 @@ struct funnel_drvdata {
 	struct coresight_device	*csdev;
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
+	struct cpumask		*cpumask;
+};
+
+struct funnel_smp_arg {
+	struct funnel_drvdata *drvdata;
+	int port;
+	int rc;
 };
 
 static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
@@ -76,6 +85,33 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 	return rc;
 }
 
+static void funnel_enable_hw_smp_call(void *info)
+{
+	struct funnel_smp_arg *arg = info;
+
+	arg->rc = dynamic_funnel_enable_hw(arg->drvdata, arg->port);
+}
+
+static int funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
+{
+	int cpu, ret;
+	struct funnel_smp_arg arg = { 0 };
+
+	if (!drvdata->cpumask)
+		return dynamic_funnel_enable_hw(drvdata, port);
+
+	arg.drvdata = drvdata;
+	arg.port = port;
+
+	for_each_cpu(cpu, drvdata->cpumask) {
+		ret = smp_call_function_single(cpu,
+					       funnel_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static int funnel_enable(struct coresight_device *csdev,
 			 struct coresight_connection *in,
 			 struct coresight_connection *out)
@@ -86,19 +122,24 @@ static int funnel_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (in->dest_refcnt == 0) {
-		if (drvdata->base)
-			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
-		if (!rc)
-			first_enable = true;
-	}
-	if (!rc)
+
+	if (in->dest_refcnt == 0)
+		first_enable = true;
+	else
 		in->dest_refcnt++;
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
-			in->dest_port);
+	if (first_enable) {
+		if (drvdata->base)
+			rc = funnel_enable_hw(drvdata, in->dest_port);
+		if (!rc) {
+			in->dest_refcnt++;
+			dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
+				in->dest_port);
+		}
+	}
+
 	return rc;
 }
 
@@ -188,15 +229,39 @@ static u32 get_funnel_ctrl_hw(struct funnel_drvdata *drvdata)
 	return functl;
 }
 
+static void get_funnel_ctrl_smp_call(void *info)
+{
+	struct funnel_smp_arg *arg = info;
+
+	arg->rc = get_funnel_ctrl_hw(arg->drvdata);
+}
+
 static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int cpu, ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct funnel_smp_arg arg = { 0 };
 
 	pm_runtime_get_sync(dev->parent);
-
-	val = get_funnel_ctrl_hw(drvdata);
+	if (!drvdata->cpumask) {
+		val = get_funnel_ctrl_hw(drvdata);
+	} else {
+		arg.drvdata = drvdata;
+		for_each_cpu(cpu, drvdata->cpumask) {
+			ret = smp_call_function_single(cpu,
+						       get_funnel_ctrl_smp_call, &arg, 1);
+			if (!ret)
+				break;
+		}
+		if (!ret) {
+			val =  arg.rc;
+		} else {
+			pm_runtime_put(dev->parent);
+			return ret;
+		}
+	}
 
 	pm_runtime_put(dev->parent);
 
@@ -211,22 +276,68 @@ static struct attribute *coresight_funnel_attrs[] = {
 };
 ATTRIBUTE_GROUPS(coresight_funnel);
 
+static void funnel_clear_self_claim_tag(struct funnel_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static void funnel_init_on_cpu(void *info)
+{
+	struct funnel_drvdata *drvdata = info;
+
+	funnel_clear_self_claim_tag(drvdata);
+}
+
+static int funnel_add_coresight_dev(struct device *dev)
+{
+	struct coresight_desc desc = { 0 };
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->base) {
+		desc.groups = coresight_funnel_groups;
+		desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	}
+
+	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.ops = &funnel_cs_ops;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+	return 0;
+}
+
+static struct cpumask *funnel_get_cpumask(struct device *dev)
+{
+	struct generic_pm_domain *pd;
+
+	pd = pd_to_genpd(dev->pm_domain);
+	if (pd)
+		return pd->cpus;
+
+	return NULL;
+}
+
 static int funnel_probe(struct device *dev, struct resource *res)
 {
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
 	struct funnel_drvdata *drvdata;
-	struct coresight_desc desc = { 0 };
-	int ret;
+	int cpu, ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
 		dev_warn_once(dev, "Uses OBSOLETE CoreSight funnel binding\n");
 
-	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
-	if (!desc.name)
-		return -ENOMEM;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -244,9 +355,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		drvdata->base = base;
-		desc.groups = coresight_funnel_groups;
-		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
@@ -258,23 +366,37 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
-	desc.type = CORESIGHT_DEV_TYPE_LINK;
-	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.ops = &funnel_cs_ops;
-	desc.pdata = pdata;
-	desc.dev = dev;
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
 
-	return 0;
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-cpu-funnel")) {
+		drvdata->cpumask = funnel_get_cpumask(dev);
+		if (!drvdata->cpumask)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->cpumask) {
+			ret = smp_call_function_single(cpu,
+						       funnel_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
+
+		if (ret)
+			return 0;
+	} else if (res) {
+		funnel_clear_self_claim_tag(drvdata);
+	}
+
+	return funnel_add_coresight_dev(dev);
 }
 
 static int funnel_remove(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 
 	return 0;
 }
@@ -341,6 +463,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
 
 static const struct of_device_id funnel_match[] = {
 	{.compatible = "arm,coresight-static-funnel"},
+	{.compatible = "arm,coresight-cpu-funnel"},
 	{}
 };
 

-- 
2.34.1


