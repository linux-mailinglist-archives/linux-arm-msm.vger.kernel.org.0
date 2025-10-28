Return-Path: <linux-arm-msm+bounces-79114-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 432FFC132B2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:30:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1211550033F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3284D2D6605;
	Tue, 28 Oct 2025 06:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lCmomKmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4E22D97B0
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761632913; cv=none; b=VbWjc5rW9bEDcXz0icga1PnCfC3H2OLWzf/jIIVbbdHiu4xIjmOjbvoBH9j7C61tpynpAOy6Yy4U+raJ5+lwn5VM9Y396G7PLaNM/BCd8U9opdi274rKzLDDFezXvMdqwxzIeLhqDrvLhIk43IkPTuK8zG+ENE2zne6o/jK8/gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761632913; c=relaxed/simple;
	bh=R098UnmnSwcFWaM8MpFroDz5io13u7mQq3HuEtEMZPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=llb9PKOxu//kzq91n6vH2/eqM1PNhhvHzZ/F9Gd/pSFDnUcaJImdtFefB8sf5YwoJpk4ND4b9/cdo/R3oHmxQ/x2i3Iyojh2nRXvgVKHesYQ81DDfwoKzxptMmhByPgoQwW+AMOsDUeEXaDdkxDBJj2mS4ST8vAYpder0FLZGKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lCmomKmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3YM0U3166388
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQofei2Qtb3/fc9/OOdfFiIGqr7PeTuj1JzH6Vy6LU4=; b=lCmomKmx+AQxl0+i
	c7wXw0zJ9vkt+IMOZRnaJHPcnMSPNkg5Qv+H3Va4gry/CRmsqCqZLfigSrmudWbx
	RYtnOb0y0pqPf726A829oX7IwoxGGOpROmraiDtsxomApQ46ylIw/JeTMcnhpQr/
	D/pSl6R8lAdbQPhd3cJEuK/dow0mQNWVFAcFHfPW+fvVXiUlDnERGBpDYSZndTOW
	91JIUybbCXXmEDW5np3rkL86c6iMEwpAhaByWOD8GsNuRkbFqOItSfOFd3TxSQQj
	B0YDjN8WoXqu4bJGxCnBG0nZjAKSLoKEiRSWUflo43Jvg0bGrLlRU5oeRpGzQ1iV
	sDuM/Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx23u0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 06:28:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2909e6471a9so37673655ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Oct 2025 23:28:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632909; x=1762237709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQofei2Qtb3/fc9/OOdfFiIGqr7PeTuj1JzH6Vy6LU4=;
        b=O/FT143keX60nqE/tGiXZCAYv85ZJ4invlTxsrYzkv2oi5u9gaQITJtjPujFU8IKxT
         PmX091Y/qnX/vrs4QaSK83sl8I6YcdtLDO/MnZfXUB22A64gYXijNUEWgNyx+F7N2DNu
         tj/u2xExi5oJs7CTPa96TeN335ABtrRLIAoeTeEGotpf//s6hUpPnE0A4bhs8quzjpc+
         N5XGu6+jdB0ACsLaWSC+9ddpEmP+hqVm2xBZDoSwF9QOxQ4p1IU+DKQxv6eV6Bwg15kF
         E9CjFLyx2xLNcfUZg5pUZ5TveolXRrsgZZeArXKn8zA4M+3Aa8VFPKckto60PrToPUHO
         PmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYq+M6IeEQosy5GkpFTO3FByb5xYga/qCVV3i3knkm/3FCMCgoTTFqzJu0TEHcx4NGoSF0c8TDRsAGEbMn@vger.kernel.org
X-Gm-Message-State: AOJu0YwKoQMiHUWhH8oqdtkoxYmEBb49U9JWToyyRognh41hRFDSEl75
	7+GRpWSedv09GT1qeqNAgzRwpKNsjA8DHGYF9SrOGAcJ6RW6K2/i/aq+oCB9c+JZ2hp12e5DE0I
	S10Yi47+6L80voNVj1SovcngnLVf8Ep5/7tqTZavt1OuQfhkENBgNxPKv+MXEuNoR4+lByJ1y7e
	Y9kJo=
X-Gm-Gg: ASbGnctRlpbXiUJLjHopOv0aPqCMhWLLvgPQL13zfLlbFCxf25h9dcFqW8NrLGZbgjD
	4XP3OklYnAiNKDle8we4DQb9/977T6bXMK2U1K2O3IzT5xZ8E0lACr9hiqnZC1DeEgXLfMystJ7
	VKgHlJtN6VKtM/1nnsEtgrd/JLOXAwsIE4w6hsM5e/lI3nBXfh2eIfVKDqt6DPXhD5f8x1UTiCV
	vlw1fn/kHdJANMiOTMJbM9iQC2K+KQmBu2ZnypaUMde8uEkn7LXBNzzCkmjy7C77/qDb4qf9d9O
	r1oO2qRNXNxJXvGXJ6tOZsv9t3oS12IyJdBV4/ezgFIrWxZ+Q5JGppXeZDLPNDOtIcHPQ+n388z
	2ukMFvzpBDyzTIcOTcqNABqjCmlRAvPcx7wBXVrplyaiVS9Zxh+PsT9Tj
X-Received: by 2002:a17:903:3807:b0:246:4077:4563 with SMTP id d9443c01a7336-294cb3ecab4mr26187715ad.34.1761632909174;
        Mon, 27 Oct 2025 23:28:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6f9kUv+g7lTZRr/w2s7f85BFO7ewE4rauIzo98Jb0MJ2ypkDr3EEQ3p3gGsFjtzw+C9d7QA==
X-Received: by 2002:a17:903:3807:b0:246:4077:4563 with SMTP id d9443c01a7336-294cb3ecab4mr26187265ad.34.1761632908674;
        Mon, 27 Oct 2025 23:28:28 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:28 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:12 -0700
Subject: [PATCH 10/12] coresight-tmc: Handle delayed probe for CPU cluster
 TMC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-10-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4560;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=R098UnmnSwcFWaM8MpFroDz5io13u7mQq3HuEtEMZPQ=;
 b=MK+gKR6IN2X24uvIWsY1xMXMxIZVE842wcZNNGnkMgKDPzom+ZSefRVoWMjEy40EWHpewtHLU
 g/QLL+O0JUHDC47/muwhdHuzpoFCd9dPIxzXJTfb33k1SkspAMh9EPN
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXw5wSS9Oxztwa
 +BQATGo5HqQb0P6nKJbU0aHzHiQk0KLMMNGzfCmhhPYh+rjMnXn22JyU5zrhLH/XZhqT0U+KIFD
 I79wP7gZlP/L22/Z9QF2vJX+UXwtyCtnHNeZYLBOgxG+RKdwXciiBQLMCZH15NCaVTKn4lidhu3
 OnYn5QJcdTjVVQgXa7ngV0ysumi9eJBpNfK63/uqHu9mvu4yoz8HkWe5qJWrn/zRsghNt1lMYWG
 6KS3pGxmNJoRlVKZgn+DnVMJtM2Xoiv4+rY87/gZcAqr/3aJD4N39a+tREkwK8r6SehSxCeiA8l
 ivhQV+rSlOjDXoyU3mUQ6w1PuH249LNpw7wo1jckCZHmxOy9gHw1kCXSXB9MtIwzwa9c/hbXmWq
 wOZPrxpruoXqlClOhTrtTvKjsisLew==
X-Proofpoint-ORIG-GUID: 2NWY-K3r9j5Rzk_RxyJAb7OYNjhm9Mfp
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=6900628e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=fD5cxDGOUVrWaoTO3WMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 2NWY-K3r9j5Rzk_RxyJAb7OYNjhm9Mfp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054

Delay probe the cpu cluster TMC when all CPUs of this cluster are
offline, re-probe the funnel when any CPU in the cluster comes online.

Key changes:
- Introduce a global list to track delayed TMCs waiting for CPU online.
- Add CPU hotplug callback to retry registration when the CPU comes up.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 59 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 685a64d8ba1b5df4cff91694eee45c6d6a147bc1..7274ad07c2b20d2aa6e568b4bab0fbb57e331ab8 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -36,6 +36,9 @@
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
+static LIST_HEAD(tmc_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
@@ -1028,6 +1031,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		if (!drvdata->cpumask)
 			return -EINVAL;
 
+		drvdata->dev = dev;
+
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->cpumask) {
 			ret = smp_call_function_single(cpu,
@@ -1035,11 +1040,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
+
 		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &tmc_delay_probe);
+			cpus_read_unlock();
 			ret = 0;
 			goto out;
 		}
+
+		cpus_read_unlock();
 	} else {
 		tmc_init_hw_config(drvdata);
 	}
@@ -1104,8 +1114,12 @@ static void __tmc_remove(struct device *dev)
 		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -1224,14 +1238,55 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static int tmc_online_cpu(unsigned int cpu)
+{
+	struct tmc_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &tmc_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->cpumask)) {
+			list_del(&drvdata->link);
+
+			spin_unlock(&delay_lock);
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			tmc_init_hw_config(drvdata);
+			tmc_clear_self_claim_tag(drvdata);
+			tmc_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+			spin_lock(&delay_lock);
+		}
+	}
+	spin_unlock(&delay_lock);
+	return 0;
+}
+
 static int __init tmc_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-tmc:online",
+					tmc_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
 }
 
 static void __exit tmc_exit(void)
 {
 	coresight_remove_driver(&tmc_driver, &tmc_platform_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 module_init(tmc_init);
 module_exit(tmc_exit);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f5c76ca2dc9733daa020b79b1dcfc495045a2618..29ccf0b7f4fe90a93d926a2e273950bce9834336 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -246,6 +246,8 @@ struct tmc_resrv_buf {
  * @cpumask:	CPU mask representing the CPUs related to this TMC.
  * @devid:	TMC variant ID inferred from the device configuration register.
  * @desc_name:	Name to be used while creating crash interface.
+ * @dev:	pointer to the device associated with this TMC.
+ * @link:	link to the delay_probed list.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -279,6 +281,8 @@ struct tmc_drvdata {
 	struct cpumask		*cpumask;
 	u32			devid;
 	const char		*desc_name;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


