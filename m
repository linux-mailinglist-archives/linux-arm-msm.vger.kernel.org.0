Return-Path: <linux-arm-msm+bounces-70981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C79B3790B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 06:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EAC61B624FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 04:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 078692C3250;
	Wed, 27 Aug 2025 04:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iNhbMWaJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40407283FC8
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756268461; cv=none; b=fpTWSHubnFBcn1qVyErsXlz6D1UASumz8DJSFRKzaGUKbsC9Nn1rhRWSnXbdJvMf0jki66+wLzZc1P47uuZyVxTgDTf5M+cDpAYa1BJk6lwr6TfDx09uTZkH7vvYRXmgyV1ehy0kqSn0m22Id0sGFIbR+9MhN241gC5ZkVMysBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756268461; c=relaxed/simple;
	bh=ocp4EtIWT0yQZJx2kabJRwppCpqBBhc20itvLNY7cW4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sinXy7EAyn9FYLi8EngWCJf+XMIi/Z3yZ9VIxrQnoFK+axieYZ3CSFUc91VCbEO7bfh2jRwgxpS9XnJe2sgwr2sQaFc09lKVkmgmT9iHAxs6HtCYG/pNG6C+yrXXU6F2l7399CV1z5rEyw3UxU9UKvzPjCmMXF1bzHZlLmntLb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iNhbMWaJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QM1AYM027928
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LFgzrZAixnT
	qFsEdbAYjDQONQ2mnmA9c8+kXB2USXhQ=; b=iNhbMWaJDlRl7uFXPhJdTn/l/sK
	oVXznRwiU+6nBM+5O1M8eEXZJDPjaY8C3tr1MgdcUTFUL4FXZhyjk1fg8a0BFisD
	/04GkXfCopoJ1xjouI4i2/2TwdzY0PquJaJARlyivNCPc2R8Miezam0CnTG6WKor
	ruRJy2p38cQ1aF8+HmMEQa1Y4l6N2HAmrJDn94r7W/Lt41qx5wZvMsMnUJLx3wI4
	E7HN24cgv2/E4a7koHRewY1SzgJFaXh90IbfR4H2yOqWDA3gYIrnBjDAawTk6Rk3
	SFTcAe20c1eh87dxOvntLL9FfjgZGuolCrREc4gfMyIquCHjmYRyr31l+IA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5we368r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 Aug 2025 04:20:59 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771b23c098dso2587641b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 21:20:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268458; x=1756873258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFgzrZAixnTqFsEdbAYjDQONQ2mnmA9c8+kXB2USXhQ=;
        b=t8WOdmwT0LBx3qwReRMrCYxclowlLyz5IOpn5uouPDVRei82K50pUkS1jRWXekAxss
         J4Oifp0ldUALnubKQKuywt63QqNgnMD3be7q+6F5TjXC2Ci8Q3oG1wfERZetjoMsXBrM
         npHapLkzxeu0Oi8ttv4VlFx7B8AMev5rc4QnSK+M5hzOwpA8SsRi/KGFst0xCZosd+1/
         pYVRe4xv7RSMB1vepO3VV69tqYSzeSmJqX4lrirmQ9b461D5HFE5ro4SRT7gMINXWmOX
         CSRI5VDTjePGcwnMPYcsVg8CKQ49FnYCN45qqnuCEbyzaSPtVXGsqtQSTs6w1Si8Fw8d
         3a/A==
X-Forwarded-Encrypted: i=1; AJvYcCUSsOwxcdSMiCelMOVqSCbAeK+0Fv5ybZ/VxhtvwCWLMipXrsvsys1c9I0N2aNU0NFzu445yEOeMFbMp0Yy@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjw+IZ5TMG6APQ4wieurYaEhoGg3wku5XcQrqIo1+542LkAXTp
	rhUbRD1ljqkcZecy0FUoXMvMhPMnqv45X8JBipNdsQOnxWxhCw+JUD04nxrfxtF8+uyDGQJjH0M
	enQV5F/EI79TvUzkhx2d+B18HPP9EyX6c4wisb/YxYYef6o8cbQBKs6INb7YIZguUgT1W
X-Gm-Gg: ASbGnctldV8+WNfbbcceobcO5zDLR4KxuyB5PEq2XilbcjlEwJEssFFH4PX5d5USka1
	8N+2sD+wYacU5kt1JtJs1oaiRzkfVQ08ylilb9cctsE+8209spIaq4wfUOAD68HcQ6MTPhLP/0j
	FQfmsONbWR9CP6kYs7KBXeI3ertUDBJXbv3hcKmGRRGtHFV/HWTAGxjivx+JZ7K8ilwUKjIgn54
	AmBX0WaRn85LskvQblCHf/U3wIy/Zwp5T5ldQnqSaH1+DrVpzpn10z7/OkmBXkE0eo/cGr/2ZSg
	NwqXjKoqncJ3AUhDgMWRakaV1EIxH/XTXip8pexB6rv0IvIFzbyP7CLOI1KxYR+To+nrggL9DP1
	PLHT0y+cOVm7DDPxc4q1P
X-Received: by 2002:a05:6a20:244f:b0:230:3710:9aa9 with SMTP id adf61e73a8af0-24340bce30emr25026147637.4.1756268457891;
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCRcL4yrE9XGANFjJJjHieROHuyk+4KHF1iEmPx2C2KpvsxbNZ36c7SUdVsYPPF6S/m2zyw==
X-Received: by 2002:a05:6a20:244f:b0:230:3710:9aa9 with SMTP id adf61e73a8af0-24340bce30emr25026121637.4.1756268457424;
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Wed, 27 Aug 2025 12:20:42 +0800
Message-Id: <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q3znjMaAZ7aNIGNLzm98rcpZTkyOJNLl
X-Proofpoint-ORIG-GUID: q3znjMaAZ7aNIGNLzm98rcpZTkyOJNLl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX8FumInb9HLKf
 8JZzdMeP7j7x6HbA+a3wgkFCKOU5t1vF3pCW7SKz+z//c7RWgVDwUt6T8fWmGsETnLhp84OaXPD
 qp4MzzC3Y4ew5bGIsBN2mrtcTMEfVgx6Chj4du75eD0UrrFiyQ94cQLy0zyQK1dI8fwDBnR+wIM
 W2vOAOchO9vUzJg6swLscJ9HrkW16SJpKqZ+/ph90xIaEPVRISzbgUPAMLwQ2+JP+YyUPFFkHJV
 zt2FLdvZqgJMEBVNQMcDOvd2WDjKxA4Ts7B48wUjVT+GCP9e/cPRQiquQvKZ/tU7zPewQ4N76/O
 pqaFM75K63lbeNCgfTG16dRzeseOpNL7fjl7Nh5qfUDB1aBBBA6Oo4H+HRpzs+f/uxfEDNfjAKY
 GozDp1Kc
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68ae87ab cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=l6kBNUb3cY0M__Xq7_0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
 3 files changed, 51 insertions(+)

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
index 430f76c559f2..8b1fe128881d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device *dev,
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
+	return sysfs_emit(buf, "%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
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
@@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 8e1b66115ad1..56d3ad293e46 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -35,6 +36,7 @@
 #define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
 
 #define TPDA_MAX_INPORTS	32
+#define TPDA_MAX_INPORTS_MASK	GENMASK(31, 0)
 
 /* Bits 6 ~ 12 is for atid value */
 #define TPDA_CR_ATID		GENMASK(12, 6)
-- 
2.34.1


