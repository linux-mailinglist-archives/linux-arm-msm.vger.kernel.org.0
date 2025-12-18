Return-Path: <linux-arm-msm+bounces-85649-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CACBCCACAA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 09:10:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAA3430185F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Dec 2025 08:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003D62F1FD5;
	Thu, 18 Dec 2025 08:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofbVwGUO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bs/5Q7zj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAFA2ECEBB
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766045447; cv=none; b=kCkFaCcXAkkDsYKpAiOuStnd6dgnxUkBs1KgnPvYKYKYSNsKjsiIwgGYqik+ZZhlT+r4DAYatiDvBYumK9MyWE+l8I9hMGHacB7hp0CCMtWQMDW7MArDitOs4vx1L0seGcqxxpIgoBlphn1FBiQINucyxwX4qz8wj2h8wPIDXVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766045447; c=relaxed/simple;
	bh=WwWv1dVaZYPvnR6R1Ei7R4iTlI2WTlIv5BffkfyWev4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KuhvNvPRwq/qHw4XqbzIg27A/5wGmNU8+mvPvA7kIscoFBEdXvfTZMXv6RcuOmOfFAXWu5vjHjXKxgKmvvIj/DxYwGVTHh1pllieuROdnbvS/7sigzQ5AOyPL46ull4jUGVRay4P6xo3Uu8+awEWQLwF+D7UGccRQRMIv/in4Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofbVwGUO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bs/5Q7zj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YObB237350
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=; b=ofbVwGUO9nTOpxwN
	7uP+aAPoHd/t3uRqfaIktbM9vU9yIvgAoUIBzOiV8JsrACbW19WV1LpCapZu7kTe
	T2gcCJcDWePIWK8fluC8NtLggWL7OcqcTZ5ZAf9ZGAIZrMkfNECwLm2Vaq6GW8HE
	7iQH3sfSL7vR0HRzqJxnoabTYZpGrShIyJe2OLAH2icA1nFuzzZO8hoZb66G4Iw4
	NqloKRKLxQ8iAVqco3PcRpDJBYiaXWAl0/AlQWHExFZwDZcdxYoK0DRO8HxEUU+3
	qRN4dud5f/45nYZygEmyO+7S6H7tmaPYVLjLicYoys31a/1xmJ/lTYZwM+UG2cSC
	/mJtjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3hfyu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 08:10:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-be8c77ecc63so578405a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Dec 2025 00:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045444; x=1766650244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=;
        b=Bs/5Q7zje6W76bF/ufIh4HiT+a9fittoeshCjbCC12wU+CL/vSRrUOReN7bQUpKA1G
         iiNSGU+yvNBwXcHnyLClLsd4MIY9KxVdhrMu+njoBjoB3ke4ngwJv775DxAOmsQGACTz
         N61k5vjtnaN/Pagj0/3F44KjqwypUYCC2pKewo/wY/U+Qg1RUL1QUNzdA58tanOs2/8B
         WvIW9/wwpeLiSPa06q51HibTufDq5cN0kkQDgldUD/nI+5/OXN/LMrLe8tHhuhRgHwud
         i3h8c1tA2Yh8x5trsET8XVWZBgQR7wUzzQgOaDkDn5Hu28LKCN8csrUVwWK4soyF5Xb4
         yHlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045444; x=1766650244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=;
        b=GKelcoRDPkw7ngnHHvyVg4kfbmmsMVQRZGLXbFihIotDUdRy68O66v2fO4JbvBAAx5
         6MunZ5sWvZz2Dhmg67+mGqoEiCGQOElK9mq11+pAuY3BC0e6weGElweON1IihChyBdXR
         ZHVPrOhXrIB/BT1zHUCM56OiWfSakw3vJkl+OfoSchUz+uDEdNgGvsNx/TH80Bdw6f/W
         wdhSpOOuOnyirwHlQHERDhVpfJaGw0QtzxtasFOThV0mGanAYQ/R4HWjQduEHF45tDgj
         Bj3wSccstCaZY9blETMz0Q6/JNHXfr6f7A0+HAsiQ/sqp0GeybaAynDRuSRjbIT53dsp
         1nqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6mRa65rEciBHwJ061T1FL8N7yf+uhP3Mn7JQVET5jznBhv1lur5RRuf2NtSrWAKM8QYPx1eq0B+RbxZsN@vger.kernel.org
X-Gm-Message-State: AOJu0YxG35ZjGxAMZCzxPb4xYA08NBwvvGSY3yO5zx5DsUZDhBojEih6
	8Y6MsF1m2g8dJnvpQdv5wQmdk4tgIL+HPZ0BnJyCsDf5PMBIshg0NnyFROcibRTAcCPhLy9S8DL
	eGoznRTI0PTDbZCn9depW9IcsyEw5AyNSTu+JqI4TzkZQJK4gVf4/JasZaG2DZHAnD0zj
X-Gm-Gg: AY/fxX6RmDmHZKorcpWe7XQzVHivyPsp0PBQHljmI572mTNrHUrT4AtnizSUaYky6tI
	UMD+04hMi7DlBDy0HXUxbajuSrf/mj4tmdMG1RnmLktFeP/LlzRNM0EgnRMRxoJIHsoWtzm7qtk
	vYQgu7vA0eZTROP+Tlffm/bmTGaQIVBlpc7QRCjKVCbvsytBbZE9Rp8WvkHys6ljJdhyp/FSU4P
	1/LSv/Vm30BLjdr5Js0XtBoOIIwTiVbdwwkX5/TyMEfNoVaXReiZkrmgtH/4uV/E/pEZlVXFFB7
	0c2BFqN+i64HKG5EbLgOSJ//wPWpK1faEB6qm23yg0Dje4A9dnixWw5IL3TC434ZH59joEapAsp
	laC81NJOEFhaFkw1wQRg2xsgzoAvmt+sUBWYF71qC8N0zFIiO/ZZwhUvDMRCoH9rOths=
X-Received: by 2002:a05:7300:caa:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2ae5e2877e1mr4014749eec.17.1766045443711;
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1MYiKs0jzjHaQd3gre2/5Vrpx+T+zfC2QTWa4K7GVpXVStAyAVFf+CtDYWGahuOPpcss37A==
X-Received: by 2002:a05:7300:caa:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2ae5e2877e1mr4014716eec.17.1766045443152;
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:42 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:43 -0800
Subject: [PATCH v2 03/12] coresight-funnel: Defer probe when associated
 CPUs are offline
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-3-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4434;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=WwWv1dVaZYPvnR6R1Ei7R4iTlI2WTlIv5BffkfyWev4=;
 b=dQbvHI/2v1JuiMMRpKrCwOIQtDDEOZwHfzA72YQzaiRyUwGSbgCOeeOfPl3bFQ0Jul2DlNY4K
 ht2uOJpJoqdDwGuOsdrhbjOl8X4rA+yM6MB/IqMkHYK5eN8/KFdZPt5
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfXwauDAJyoggSL
 UsWyHKJ02Jujz+xaqEMl19RtFT8zZomDZ36ZbshUSCmAJ4EylZtYXJ4Y1ksl+JoFgNcwkXzv2oO
 IYWIj1jRcDpJUv02gahimwNkfP5JLhL8PhOLk2kyfDW+GDQY2Cmo0FVYhW8z577GIyt0BmL3cE1
 tZ6gQlr2bNva2DYZbd99uTzVv0q74uB6WXZRViSY9mR0hKVx+EiMp0Ww/9RDk3upOtclpvBJzwe
 DOeGcI2WNfmVlWf8h6xSzyMnAco3u3rCqTabSPR9ctNLf7sOlcVnwW0WQW+wv7M88iq1mf47gpH
 +fcrXHHeWQTzoIJE1BHqhzZdDPXp+Ga7SMlQyUQLbaAyn0gntf0afA1qbR0beA9CiLhv9V+ohSZ
 27uhmHfEmAfr9ZqPwlhoX+afjuxPbw==
X-Proofpoint-GUID: Kfs_5eC2JQ5NgLu7A9W3TQXLiuqE8Yrb
X-Proofpoint-ORIG-GUID: Kfs_5eC2JQ5NgLu7A9W3TQXLiuqE8Yrb
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943b704 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B8lwgTuz66jIMM7eRW8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066

Per-cluster funnels rely on the associated CPU cluster being online to
securely access registers during initialization. If all CPUs in the
cluster are offline during probe, these operations fail.

Support deferred initialization for these devices:

1. Track funnels that fail to probe due to offline CPUs in a global
   list.
2. Register a CPU hotplug notifier (funnel_online_cpu) to detect when
   a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   with the CoreSight framework.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 62 +++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index a1264df84ab4c625c63dfbb9b7710b983a10c6b4..5d114ce1109f4f9a8b108110bdae258f216881d8 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -32,6 +32,9 @@
 #define FUNNEL_ENSx_MASK	0xff
 
 DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
+static LIST_HEAD(funnel_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 /**
  * struct funnel_drvdata - specifics associated to a funnel component
@@ -42,6 +45,8 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
  * @priority:	port selection order.
  * @spinlock:	serialize enable/disable operations.
  * @supported_cpus:	Represent the CPUs related to this funnel.
+ * @dev:	pointer to the device associated with this funnel.
+ * @link:	list node for adding this funnel to the delayed probe list.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -51,6 +56,8 @@ struct funnel_drvdata {
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
 	struct cpumask		*supported_cpus;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct funnel_smp_arg {
@@ -371,7 +378,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->supported_cpus = funnel_get_supported_cpus(dev);
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -379,10 +386,15 @@ static int funnel_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
 
-		if (ret)
+		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &funnel_delay_probe);
+			cpus_read_unlock();
 			return 0;
+		}
+
+		cpus_read_unlock();
 	} else if (res) {
 		funnel_clear_self_claim_tag(drvdata);
 	}
@@ -394,9 +406,12 @@ static int funnel_remove(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
-
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
 	return 0;
 }
 
@@ -533,8 +548,41 @@ static struct amba_driver dynamic_funnel_driver = {
 	.id_table	= dynamic_funnel_ids,
 };
 
+static int funnel_online_cpu(unsigned int cpu)
+{
+	struct funnel_drvdata *drvdata, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(drvdata, tmp, &funnel_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_del(&drvdata->link);
+
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			funnel_clear_self_claim_tag(drvdata);
+			funnel_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+		}
+	}
+	return 0;
+}
+
 static int __init funnel_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-funnel:online",
+					funnel_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
 				     THIS_MODULE);
 }
@@ -542,6 +590,10 @@ static int __init funnel_init(void)
 static void __exit funnel_exit(void)
 {
 	coresight_remove_driver(&dynamic_funnel_driver, &funnel_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 
 module_init(funnel_init);

-- 
2.34.1


