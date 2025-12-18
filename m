Return-Path: <linux-arm-msm+bounces-85652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D5027CCACBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:11:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09BA63027C8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C79830B533;
	Thu, 18 Dec 2025 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WBO0apXq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K34tZOgS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC712F360A
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045451; cv=none; b=LnXnoqxsSctlTkwDXhy60DTO/INpttcniJ4/nnT81c+JUtr4Yum4YvEZuCN8I7la1RUBe12JN37s+351GA/ZooIxCIuL3z4DkBfrMqwZ/3Xcet6kmxnUkTyeQpVnhHfMqW97EDM2y4t8RF/71fOEPUZMyILSYRNpaIpqq8XwYEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045451; c=relaxed/simple;
	bh=zad/+HKvgqcPRsu64plFTKJAgpaj4lRh7Ypv4wC8mi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dXxW1wfcsEwz9bQcYmm0zEtZTK7NInPDo+Y4992S7GMLsZw2wYVOGKe8pZ9F1zZ0rpIFMP+VaBdcW1PjM9IpFXgEdCJZhWME1QxHp0S5piiThS8tOT3FmYZghvz9OZddhYj3+z5X6QWbhEMsLGkFpcYkhO7ymkdmXKCY3vqTz4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WBO0apXq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K34tZOgS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YTFD680496
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=; b=WBO0apXqgp0Ut8th
	zQWOTvTP1qFCvly9yEVHkOSzPj1VSdx38xQawInH8q3HOdcyq31XdiseoJXrKC/s
	6npe/C17kTqx4mN/NcpHy1GMF9XvCxyVi9ZGJE2dqH1B5YhSXu2szd/A9rXqzZp8
	qbELxHkE3VM2hYCbai7JVqjx1BV6lnjqjq1POBzPqNeWXDbOJnuVUY1FanODFsJ6
	wMuLzqPgaQ+efTO1Yt4DPexter4TV+Th2gJ4ODXCIV8soeOmdjbnCrTXlt1xmSl/
	K+jXZI58yyh5JwkVKyEdNqZaRFoLC5HkbMn1G+etMuCDCFSbQG2M/vAKhYGa9PgI
	fMbXuQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b45bhhcd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so464360a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045445; x=1766650245; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=;
        b=K34tZOgS/oJrk9k1KpShCHix5v0nUPHFVq868Tre6g733q6VKNDodW9lGiXVy6t0jc
         xdmP+mnenX556R3ln4SL4udgvq/DIGAFa36rNlCWiuvfb7SquEfgiIw0kp83ci2TKLER
         VDYo3R9nXN84PiVURTRGO7Vg1qeDFcxFt87DC6/n4a22GANaV23ac9x/R44/7l9uS159
         ZUe39ndJl/O5oK2O3UH0zmkp3vTV+ZxIsYGLvvzNcZrX2zrWPSm8C9O+5yfLEAxE3N9N
         65bJ01pM9/rAOIckrDtcGdS0jXb8B3vP4WfgIIJ0PKRkI2IDxZOgc3VE8RYJWJwtL9SZ
         VeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045445; x=1766650245;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QV9iwLUqvGNnwQ/I9B9ocDyfNDL63IncM7/Y+J+tBFE=;
        b=AoxakbmvYXjG3taB1rAiCRJS8BTyBGq5gTbRWlMRKR2NJBO1Z0pb11ezffwnKEV0Hl
         Hq0INVT94LCS+dUzJiYQDR+Ao9VPobZoGPCq+Lf58nhOsbYX+0JEPyS5vcknUMRiFlBd
         Ku0kyy5D2T03esmqN0s1gKZQX7nOwi0m24j+uhGuBw5CywKn1ki8JZBJ8wkukvxYzNT8
         0SagPZK46WJZaDOv3Ehw0v6Hl2W8VBTkxARbjAZvUHmX/Q54y9at+YTV3xCrMLHTzQ5a
         rPCmMz87tHO0LJGkVyL+GKyBgN8x6ggc7UaNqhrn3CTfW3bMCus86rJS/IuW8vNCJhf+
         PXkg==
X-Forwarded-Encrypted: i=1; AJvYcCW91ni/b20Y/07BQUp35Sk5r6qEbK43vzFJyu600Ev4RlfUN9D7O5VrocVMJLUg2UHDpcgpttLif7K3Bzun@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0mP5l51kBBu1tjNfza10gypIuD4erfqW3ktyGqHn0WHN7TsF
	X7JrLdAi+VGV/r0tP8bMwV4y91QVoBVzGAN9OLrmmFXrBP4cOL7nmUshrQ2Qwkf1rw83xOOJDtF
	cSfcC+qjKSV+upH65sahXamCGxL+/eRpnhEl2835xM2/7bJbnsKnpfouQQtj46XSfOalu
X-Gm-Gg: AY/fxX6DtCX/ltFiY3IREbxaqWC2VfswDwoS9M1EE9/IuZHYOAwnKg9KtVv6RzLsTwI
	oiVZk+mRqbUT+BEl3ycG04z1JFYbkLtoSBaaOJUfMUaA4mObqQSqb6qt7JVLz813ojDrHTUEJyX
	vk8oJsC/TlUR/yHp3V0znSuRz+LgssifBPXeRWwqS8Tw8yc+BwAGqlEaRKXJ6AemCwHD9301Tgb
	wV3Y0vkhcUHljZhnJR4otzNpvlwCXK96PE7RmvyQnRQxzBtEonheGkg9c14nYF8TNhP+wyjlSKL
	IjP10NaYUjW+uVbts706k4yH66tad+UALwrT2Fdul80pJSE/RyPHGAPP/hwDU8L6ebrEceWNC7I
	UI2JE6vVDwBVeNWjnKe8EUhmGhPrpzoXO11gZGYT7V4+cpC5N1N91TWzJXJIxpJ9KoxQ=
X-Received: by 2002:a05:7301:905:b0:2a9:9aed:bb78 with SMTP id 5a478bee46e88-2ac2f870696mr14035031eec.7.1766045444755;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFh/eDqun5Dk+YDMbUnAnpbT8FADg5NH/ZyAZ/4PHmvghvGhT5S9NEAwXImAIKhHJzZvSD0Rg==
X-Received: by 2002:a05:7301:905:b0:2a9:9aed:bb78 with SMTP id 5a478bee46e88-2ac2f870696mr14034994eec.7.1766045444085;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:44 -0800
Subject: [PATCH v2 04/12] coresight-replicator: Support CPU cluster
 replicator initialization
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-4-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=9933;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=zad/+HKvgqcPRsu64plFTKJAgpaj4lRh7Ypv4wC8mi4=;
 b=OxEMcFDqCRURYR2alE9C+qytbvWhgSWbsRUFrDfHwwuMaF1z3EtogAhvMR2S9BtRQMmz0t2Hd
 JGRF9VSAJPVAGqkrNLKWa2i3wDL6eSSDWffrwWGD1JSmqtVJS3Igms8
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: 8b9JptvKU_95-PBnFiKupaZOtO7z6-pP
X-Proofpoint-ORIG-GUID: 8b9JptvKU_95-PBnFiKupaZOtO7z6-pP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX17f8r7notGhv
 D6dOvO86dbxYtC7wAs6C38j33laSYciWkGvVKsJb6uGLl62gd5A3f+zPPjT1delE0kSCPBiu/k7
 eJmiyYBuIL5jSms7ka0jvon92NZZqXoHpq4ECJQrMoUAj0lXK93qZnbDo/FPoxowTLmx/BTnpsB
 JAUgw07C+6i/4rzUxn3ttB4MYZKHs7q4m96yupont7b9+4AkKTYE6ZuJKKpjV3CEyWuNLCvyfZJ
 5SVA+Hstd6ZH1dGemSREeQd8zNWVOQ595fUfJsVMTwQlwRPz7pwoPHNJGOcaD6uj/erjUet1rwz
 9KDOX7P0+UcOCyWt8gAIpnSTJ3Th8U8oJkrj30JyIukbN22MysYEvUPrv1v8g9Gls1AKxbHghLp
 mFdpetTxv7QGwlzZ3Ks5Fr+4+FtO6w==
X-Authority-Analysis: v=2.4 cv=SZr6t/Ru c=1 sm=1 tr=0 ts=6943b707 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=iEGaxejzB682sgr3lzYA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512180066

Replicators associated with CPU clusters reside in the cluster's power
domain. Unlike system-wide replicators, their registers are only
accessible when the cluster is powered on. Standard runtime PM may not
suffice to wake up a cluster from low-power states, making direct
register access unreliable during initialization or operation.

Enhance the replicator driver to support these per-cluster devices:

1. Safe Initialization:
   - Identify per-cluster replicators via device properties.
   - Use smp_call_function_single() to perform hardware initialization
     (reset and claim tag clearing) on a CPU within the cluster.
   - Refactor the probe flow to encapsulate device registration in
     replicator_add_coresight_dev().

2. Cross-CPU Enablement:
   - Update replicator_enable() to use smp_call_function_single()
     when enabling the hardware on a cluster-bound replicator.

3. Claim/Disclaim Handling:
   - Introduce replicator_claim/disclaim_device_unlocked() to manage
     device access safely before full framework registration.

This ensures that replicator operations remain robust even when the
associated CPU cluster is in low-power states, while maintaining
compatibility with existing system-level replicators.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 200 +++++++++++++++++----
 1 file changed, 167 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235dc479cec91ac18f3737f76f8c74f0..c11da452559c73af6709b39d03b646cb4779736f 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/clk.h>
@@ -35,6 +36,7 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @csdev:	component vitals needed by the framework
  * @spinlock:	serialize enable/disable operations.
  * @check_idfilter_val: check if the context is lost upon clock removal.
+ * @supported_cpus:	Represent the CPUs related to this funnel.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -43,18 +45,61 @@ struct replicator_drvdata {
 	struct coresight_device	*csdev;
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
+	struct cpumask		*supported_cpus;
 };
 
-static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+struct replicator_smp_arg {
+	struct replicator_drvdata *drvdata;
+	int outport;
+	int rc;
+};
+
+static void replicator_clear_self_claim_tag(struct replicator_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static int replicator_claim_device_unlocked(struct replicator_drvdata *drvdata)
+{
+	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	u32 claim_tag;
+
+	if (csdev)
+		return coresight_claim_device_unlocked(csdev);
+
+	writel_relaxed(CORESIGHT_CLAIM_SELF_HOSTED, drvdata->base + CORESIGHT_CLAIMSET);
+
+	claim_tag = readl_relaxed(drvdata->base + CORESIGHT_CLAIMCLR);
+	if (claim_tag != CORESIGHT_CLAIM_SELF_HOSTED) {
+		coresight_clear_self_claim_tag_unlocked(&access);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void replicator_disclaim_device_unlocked(struct replicator_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	if (csdev)
+		return coresight_disclaim_device_unlocked(csdev);
 
+	coresight_clear_self_claim_tag_unlocked(&access);
+}
+
+static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+{
 	CS_UNLOCK(drvdata->base);
 
-	if (!coresight_claim_device_unlocked(csdev)) {
+	if (!replicator_claim_device_unlocked(drvdata)) {
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER0);
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER1);
-		coresight_disclaim_device_unlocked(csdev);
+		replicator_disclaim_device_unlocked(drvdata);
 	}
 
 	CS_LOCK(drvdata->base);
@@ -116,6 +161,34 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
 	return rc;
 }
 
+static void replicator_enable_hw_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = dynamic_replicator_enable(arg->drvdata, 0, arg->outport);
+}
+
+static int replicator_enable_hw(struct replicator_drvdata *drvdata,
+				int inport, int outport)
+{
+	int cpu, ret;
+	struct replicator_smp_arg arg = { 0 };
+
+	if (!drvdata->supported_cpus)
+		return dynamic_replicator_enable(drvdata, 0, outport);
+
+	arg.drvdata = drvdata;
+	arg.outport = outport;
+
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu, replicator_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+
+	return ret;
+}
+
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
 			     struct coresight_connection *out)
@@ -126,19 +199,24 @@ static int replicator_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (out->src_refcnt == 0) {
-		if (drvdata->base)
-			rc = dynamic_replicator_enable(drvdata, in->dest_port,
-						       out->src_port);
-		if (!rc)
-			first_enable = true;
-	}
-	if (!rc)
+
+	if (out->src_refcnt == 0)
+		first_enable = true;
+	else
 		out->src_refcnt++;
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+	if (first_enable) {
+		if (drvdata->base)
+			rc = replicator_enable_hw(drvdata, in->dest_port,
+						  out->src_port);
+		if (!rc) {
+			out->src_refcnt++;
+			dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+			return rc;
+		}
+	}
+
 	return rc;
 }
 
@@ -217,23 +295,69 @@ static const struct attribute_group *replicator_groups[] = {
 	NULL,
 };
 
+static int replicator_add_coresight_dev(struct device *dev)
+{
+	struct coresight_desc desc = { 0 };
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->base) {
+		desc.groups = replicator_groups;
+		desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	}
+
+	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
+	desc.ops = &replicator_cs_ops;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	return 0;
+}
+
+static void replicator_init_hw(struct replicator_drvdata *drvdata)
+{
+	replicator_clear_self_claim_tag(drvdata);
+	replicator_reset(drvdata);
+}
+
+static void replicator_init_on_cpu(void *info)
+{
+	struct replicator_drvdata *drvdata = info;
+
+	replicator_init_hw(drvdata);
+}
+
+static struct cpumask *replicator_get_supported_cpus(struct device *dev)
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
 static int replicator_probe(struct device *dev, struct resource *res)
 {
 	struct coresight_platform_data *pdata = NULL;
 	struct replicator_drvdata *drvdata;
-	struct coresight_desc desc = { 0 };
 	void __iomem *base;
-	int ret;
+	int cpu, ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
 		dev_warn_once(dev,
 			      "Uses OBSOLETE CoreSight replicator binding\n");
 
-	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
-	if (!desc.name)
-		return -ENOMEM;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -251,9 +375,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		drvdata->base = base;
-		desc.groups = replicator_groups;
-		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -268,25 +389,38 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
-	desc.type = CORESIGHT_DEV_TYPE_LINK;
-	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
-	desc.ops = &replicator_cs_ops;
-	desc.pdata = dev->platform_data;
-	desc.dev = dev;
 
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,cpu-bound-components")) {
+		drvdata->supported_cpus = replicator_get_supported_cpus(dev);
+		if (!drvdata->supported_cpus)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       replicator_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
 
-	replicator_reset(drvdata);
-	return 0;
+		if (ret)
+			return 0;
+	} else if (res) {
+		replicator_init_hw(drvdata);
+	}
+
+	ret = replicator_add_coresight_dev(dev);
+
+	return ret;
 }
 
 static int replicator_remove(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 	return 0;
 }
 

-- 
2.34.1


