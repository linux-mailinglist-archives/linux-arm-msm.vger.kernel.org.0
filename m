Return-Path: <linux-arm-msm+bounces-71005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E0DB38065
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 12:56:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2380B1B66ECD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 10:56:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F10835082B;
	Wed, 27 Aug 2025 10:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QDPzOQ8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A1734AAFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756292164; cv=none; b=aoU/GEDwzpqcf+ZlK98fxYh/nhKbcwpCZGR21TV6WTkMYUC7ieZOXZHo/mZBwQrbKs2Sm8ZKSWKDeViFGs0noorMlV8owqkRdlussMD7nVkKP0Os/4IRr3zxqAMeNsZyn7lzzDKy87eTnw5eAj+feyS3wzGcGF8OGYtc54pCIb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756292164; c=relaxed/simple;
	bh=RHUVtvl2N2hTcYc4uv0VBvz2bqswq9gFM3vRic01nmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rwjJEt6jd7EMCXJxRS948G90wfykuFJZDfy4k6FnFhxpi+EZ5hbyacef28syLsipYEJPeODgfKwHT6uUb5zAuNlrbHJ8KBCobe00UKN8NocYLvNTr1jSCp6sDvNPlP78yN7WHPD+YhOgViioR+kzzw2uHOEJAdYHEeHCWpKZ4Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QDPzOQ8S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kBpv029068
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g7hLmo2qiXQ
	EzJFCc6UYcx4UE905+BBd64HJXeuLne8=; b=QDPzOQ8STAnHmoQU03fFs+srCfh
	COlQt6Z8xqJ9t0Pmtw1zKsrs3VaxRg6by4f3B1G1555vpL8KRMqmfUmeqEm8OMkb
	T6E4j4pZO2wbiPMlYuWO0DrgqzTr171bMjTIdWkXcgAekWmUI5vaADnEYm5+e/tr
	a5X+Ufe7+h4uCSxynPNbWA4egj0bR1izJfKLBx5zo+r5fQ6OIf92bZ2dCtVue8KN
	jJnC8q/lpC15llGGkuSPJ1phtUssCS95wFz+ajjG1kjusnJdi2LVmTFNQoqRaZRz
	IY3L5D8/6dhB8Ihx76JrasRzQqs/w5RKTdMwnBsotCi9EvSuJfQkHTefJug==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5umcgc2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 10:56:01 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-32775b74143so859707a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 03:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292161; x=1756896961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7hLmo2qiXQEzJFCc6UYcx4UE905+BBd64HJXeuLne8=;
        b=l1t7mOHGr6yKC7n+/7PYBj2Tb0l3mJgKahU4WeKSNn0S20DvHJMNws/3NbCJlEfr4p
         QT4latdu+UxJhhDLtPFfVb5JEYtqjOEmA+88rkP5MduLkNOu/Z+rXFqCz+guescoWt2D
         LgxIT1Kb2OQY7kkK+/AuaOR/nFlDygR6qVzGjy3zF5idRuB6nI46Yx7YwGF5BLgFbTbl
         xPzTnWYuo3Oco4DubjMxmjK7saYGbnWLUnOw9EQfa2L3KyvYKVm0N0lTqqOcThtKwx7M
         a58iN6974Th11AZBHZdquWASkGS7PzuP37w1dPia4ux22vzOvc8s316bhGQPAu6T594z
         jTgA==
X-Forwarded-Encrypted: i=1; AJvYcCXoZsxJdLunxUXKpBVq1EeIF3gnEVYUmloLKIi9FV/ZOfYafqQ7JLkIQt9Qxk4cgL3bdD9Z4qKU/ypb6BCG@vger.kernel.org
X-Gm-Message-State: AOJu0YxGuNeJ2WdBVEt2aXMtTL+tSBmtxkQUIJL34jOPBv/KXJIKKCt2
	NJGDfRpMuk4D731JoCdcIcMMQefHiSi6qF7RQQjLBvqTvrB+EYoj9z9WKn9tHMrStddYgkWNKtp
	vBEVsTgljtc2IG4YhJ5+eQebAxkA5VIGKDKwVtb2/BTzkZ8VJmPwBuov/+BEq1+PuBszZmZbVOj
	jmgzg=
X-Gm-Gg: ASbGncthRyvpMWzwYAY/sBdoGLdKcbzTudjDRABGhZ7kdt6B39cQlnSe0Oh0uCieirs
	g/TxPWfs2P0apbzomoqP6P6WnUOtofx6XCxR0bjCiTHVRRKQvgLJvyx9tB95F3k4/FLg34CD+6E
	nMOitD0hX2yD2ka5Wd8lNQp2MbpoNf5isctp9Yxg2wRa46Duav2/c/sRSfRfzN7b2aTBaeKCMS7
	gT5QWdo0OqBmBk3Pn3HXcVoPRvAIKtqIn5+y8INZ1OrIAM+519BB5ZSWxgiqbjZyhvVRXiyCOnd
	fITWK47L+9fov+AI9Fj3fLXGOwbB7POoCnHtX+HFWyRmWc0q/O1SwXdNIRjU57BIA1jpaRF5bWn
	pX53+5YBtmDjG/t3hoAtJ
X-Received: by 2002:a17:90b:528d:b0:321:cfbf:cbd6 with SMTP id 98e67ed59e1d1-32515e3cba6mr25542449a91.6.1756292160753;
        Wed, 27 Aug 2025 03:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwG5WKh/9Jju6a954+EE3Y3ki8sM2PuzrKsD/hmGK39N6A3Kp8fKVEhHRvsLYEuBcOG1Or/g==
X-Received: by 2002:a17:90b:528d:b0:321:cfbf:cbd6 with SMTP id 98e67ed59e1d1-32515e3cba6mr25542421a91.6.1756292160259;
        Wed, 27 Aug 2025 03:56:00 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Wed, 27 Aug 2025 18:55:45 +0800
Message-Id: <20250827105545.7140-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68aee441 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tK8iAimETgkDkOB5pRoA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX31WOkILLk8sz
 bbqF3iS2YMqqNVR+etBoIqVT+xg4WPzZ+uOvXb9qFXuAxSwTDdPiMKYeisSZYP6yjvbPHX67tNe
 Rvxv7WQOsU0KkMtXXVmBmc307J5t1WoPri7WGmFgBkqb0q1GktQC8OHPMsKxATMg1HoAbLGWumO
 38zxjmzljjP+lcIA89DyNTR5PvXyjNQtnRY159jcC3NsamW8IdRl1CGkgC/kXk3dCU/iGyQsuCw
 I2f0LXBfOMIZQnPZCr/Gw3TcnHh6JFxqKi6FlLdqPBrsZeFUROWWOcuVH9Bg8lZo4b5Ta9bh5mp
 UW8C8eXks2XkFXXEmiwoAPCQZ/ObyAbDG8BxYF7Pp8vmJ6AUv9+WnFoGNVUIbR8rWGjkkQC/I0t
 ur8Rd56/
X-Proofpoint-GUID: xOtZlMvi9pvlTk2SnGT_KXlKnkqSC3ma
X-Proofpoint-ORIG-GUID: xOtZlMvi9pvlTk2SnGT_KXlKnkqSC3ma
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 41 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index fb651aebeb31..2cf2dcfc13c8 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index a1393962b04d..e9e2736071fb 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -490,6 +490,46 @@ static ssize_t cmbchan_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmbchan_mode);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+	return sysfs_emit(buf, "0x%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_trig_async_enable.attr,
 	&dev_attr_trig_flag_ts_enable.attr,
@@ -497,6 +537,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0c9bf2fade56..284ac63699ad 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
-- 
2.34.1


