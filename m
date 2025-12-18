Return-Path: <linux-arm-msm+bounces-85657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 123B1CCACF1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:13:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A9D6303BEA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:11:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B59330315;
	Thu, 18 Dec 2025 08:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VpV6A/re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDKwGMPB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68B732E142
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045458; cv=none; b=I5iqPT/FCNKSu8gJn8A3VRDMrIJDn5tsPH5JuXQ7arTWTzBuoNSUEB2a23z6Q/8WzN+pQPW0EzMCH5OfA9Wh8/X5tivrMsAAxDw+PHuTF+agr1KmyL4UUwDsPGFeLZRc75hpwoHINHUAwahcTNJ/9Oqbiu6E4/1jD0IPcdxvquc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045458; c=relaxed/simple;
	bh=IB9YQIjoTl8ZOJK7bPPU9ZsiC7//VeDVaYjoFiQJcPE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MirMmuCYynSD0JGDPvnT82upB+smwqm33QTemVwi5AM5+A3iIcorQIxq7IRP5n1+b6HQtyTd2gKPrIT3EcoLxaLYCI8pcWENV0pHRvXN3dl8nxUvmD73CrnlV07B7YOd+uZdDADIt7kr3loFjHrGrawNQAsoKo29sPbh8Ue9yjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VpV6A/re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDKwGMPB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YYPO237507
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=; b=VpV6A/revRiIIl+/
	NQ/DxaoinM/GeEKH76trAlesoPufJxG20NH8PHvoFAr01peVL6A6vZViW4rnU+Bp
	9+0O6eybI1zCh01DREQoCJH2lfUyZjV0MwNTHuP+F0WtDWiHgrf1mENatvllDMk7
	3lmbxLpJcSv7N+/RN4f/sQAb5J3qFvhKZqJGFMWQ8aPDJdb4KZfzcjiJn0RzvCbB
	lnOHg2WUtFZ8xvhf91fpcof1KGBRHXtB6F6TqcMAdIzGoU2vhG7irGHhySr+TbWp
	ygSS5Rf2lBreAx4domOaYm8ng3pYyTLZTihqOeZlpeRhROzXTbeuOjY5+UipJx3m
	4CPYTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3hg19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:53 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so578485a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045452; x=1766650252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=;
        b=ZDKwGMPBD7+6lQ69fXA+nMMlHerD/k9cMOH3LpWWB7l7ISqBUBAKnSA6tz149Jt9TV
         l0p46I07gSFAx9MZbaGTi4W6y3I70imvxv2Z7k7NMw6X0hUTI2BwXv60Le4w0YO3WovO
         VR/40+RTcakdXbb2sK9FL/ijeW2xIuIcDDmwfLRgW4v9LfJxwgYmasWzj83tPpMvtb+P
         HUjGsH5l4+z4np9oUEKJGULNgCs8V9OhP30d6ebaqp7Bqj0vQaH8//Iq/PY/iptaffpt
         dx7z5N92u6gMYzthetvbyqitdIoeiRqxwkOO9D6vb3yidCD8rU4wkaHzTUXAFeKEe17l
         3A7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045452; x=1766650252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=;
        b=T/iHLMcfoF8ZMbkokNxhuSGBJA+t7Hx0Its5tjfia7NM+7t3x4Nwp6uife82fIC8k/
         EqrEQ/IZnZzlgIYZX0cVWIwU/Ew1wAqUdocLmgfR+VGuGuIeaeIK2WBFXyBn2BeM23t+
         2wbewMtqr8uMZZms6+E+019NnowVA0g9hgOfrvmIKe9gCSahKYp5g9dLq6tVM5jSlmT0
         r95GioewCy55ZEdJ1Ccx5ss6Jw3A79dCDchlpSlf1jshGm8THkkARS72QO0D9nOJsVj0
         20eQy23Bsz87uyYAl20JhFcZq+x16k0SRptxSZ8wW24zE1kuCHFXQoHicussc/a9/FYF
         wK6g==
X-Forwarded-Encrypted: i=1; AJvYcCWcR0YwBTm3ugfmu5qCI4jSzhinWdGTcyNl3cSV3BxP9969auWAA1k22Ytzlcet5Y4Dux2/oyo0OdW6qylm@vger.kernel.org
X-Gm-Message-State: AOJu0YzTnhSTFbYv1L6qw5lUUfe2TFIRdCyLx8lpFHaLjYJnIyGPRAiX
	PgQ8yUvI/W7ZpqcyvTkFw2uebfMD/4mSsiPmJGcT+t40+WqdnkDNDnbwph1A6iYmcxv3fjFVgHR
	MOahSip6RcBLT09NjusX4C+GjJtHnnqxHp8NzoFcKC6KlwWGY+qwvlMsylpSw0OcTPMny
X-Gm-Gg: AY/fxX7cDDJw6YCI4EAMhQjNf9JMW0OSuDCbGEcfurJKioCmawCWTMjkXB1woq53lT8
	1HTZCq+8s/wOaNaRQj1OmArrLRjXYBSa1eCHziV149GIPVKFSgki2uFSW741IAoo+vcPfkntG13
	InWc63ecJ1Pn2/2YBha3ZXs8PiolsoqFhY4Fn9FBDANfLNE5hxA8KwMGBGwDiKFOsdEqjYacSJ1
	B/YcDA7yuPYZvn64eebsexS5MmXRMIQRnCbqwZnAGXaMzo3XKf2NCyOl1yeAGNreij4DmeUzBFz
	WR/LOspjpd6wte94mBTFR31zmP0AapDe0O2h2nWer3UqpleSauLGpx2DTm7/JLMTal4SnwUHsvv
	XBUdysR6/Q9bRFRafr8yVfUN0DQbQuWkvybwdLwWU3mnfiemm0YKMqGsNoYojXXER++w=
X-Received: by 2002:a05:7300:d216:b0:2af:fbb:97d6 with SMTP id 5a478bee46e88-2af0fbb9db4mr3375375eec.42.1766045452456;
        Thu, 18 Dec 2025 00:10:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy6O37P7HcdZeyhdXCt5nCSuOfsjpbYAlMSKZnHn47tlAEdu/BEZdw077Uc0D8iY6mjzDk0w==
X-Received: by 2002:a05:7300:d216:b0:2af:fbb:97d6 with SMTP id 5a478bee46e88-2af0fbb9db4mr3375353eec.42.1766045451916;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:50 -0800
Subject: [PATCH v2 10/12] coresight-tmc: Defer probe when associated CPUs
 are offline
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-10-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4877;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=IB9YQIjoTl8ZOJK7bPPU9ZsiC7//VeDVaYjoFiQJcPE=;
 b=UImHFUGLEN5dtzF1iBXsV0IkphcLBAir0d5O1DosY6wiCmPvKT6KcI1es7/TAxBzlwuv7XkaG
 R94jgxoUDKfDMBnuRFGitFAmzSSyqiGLo7ujkx1OpONeUaniOhZUYMz
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX85tgbt2REFV8
 OPKg0Wg20M8f61TmeoMYvtEdLwGwcf9jHsg3cPdpC5B/+FCUTG6VF6ggGh1jfa0RtXP7h172TBo
 5sbjLcmFrbnd2qgCCWkf1ONq6iwZ/h0wiQU2wzgfZVyng7UWrzQFjHR13SgmG1n9cbZpDLO/lGI
 ZelYOmCuy0VR/57U9V1Yb3gIBY/Gw+5ema7MVFJnyxGMpWxHLSt+h4bnkQ1+xuyYJMb3hM7wFvJ
 +vgFzQJgLQ6dDTm1+J14uPmMEQBzBVqgvJN+f/YG6QGPBuvvq+0ZdSRkO17/MWgy8VlRVn+JPGi
 KSGgGEaTNue3Af8zI2Ca8UrpPP1YcdZtSocUcfJ6/XpZSOKxgbxQ3uB9TULiCtsOpUahUgo0ZXk
 hfQbWBciMHoC8ObwppLfZDnm5lqscw==
X-Proofpoint-GUID: oTwTiSb4Kx0hkMaMXeY3qY6kyk-m3o1m
X-Proofpoint-ORIG-GUID: oTwTiSb4Kx0hkMaMXeY3qY6kyk-m3o1m
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943b70d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fD5cxDGOUVrWaoTO3WMA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

On some platforms, the TMC driver may probe before the associated CPUs
are online. This prevents the driver from securely accessing the
hardware or configuring it via smp_call_function_single(), which
requires the target CPU to be available.

To address this, defer the hardware initialization if the associated
CPUs are offline:
1. Track such deferred devices in a global list.
2. Register a CPU hotplug callback (`tmc_online_cpu`) to detect when
   a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   for the waiting TMC devices.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 59 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 5b9f2e57c78f42f0f1460d8a8dcbac72b5f6085e..9182fa8e4074a7c9739494b2f5d59be2e96f1d3d 100644
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
@@ -1027,6 +1030,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
 
+		drvdata->dev = dev;
+
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -1034,11 +1039,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
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
@@ -1103,8 +1113,12 @@ static void __tmc_remove(struct device *dev)
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
@@ -1215,14 +1229,55 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static int tmc_online_cpu(unsigned int cpu)
+{
+	struct tmc_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &tmc_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
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
index b104b7bf82d2a7a99382636e41d3718cf258d820..2583bc4f556195cd814e674dc66f08909dea61b2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -246,6 +246,8 @@ struct tmc_resrv_buf {
  * @supported_cpus:	Represent the CPUs related to this TMC.
  * @devid:	TMC variant ID inferred from the device configuration register.
  * @desc_name:	Name to be used while creating crash interface.
+ * @dev:	pointer to the device associated with this TMC.
+ * @link:	link to the delay_probed list.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -279,6 +281,8 @@ struct tmc_drvdata {
 	struct cpumask		*supported_cpus;
 	u32			devid;
 	const char		*desc_name;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


