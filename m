Return-Path: <linux-arm-msm+bounces-70817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B242AB354F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 78BAF245921
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370B2F745C;
	Tue, 26 Aug 2025 07:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+Wk6QH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5CC2F6596
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191731; cv=none; b=KSbVnwle2as98uuNfGF7w53ujgpu6temA7NKZmt1czXk83RcfE/e+hsZxw9xhjMrppYTwS69bduMO/Jn/sqBRuPuv2nxpfXsfmKAV/DSdOMeDKRdj54C80K8BDXdNbIbvS+v1MUdFOWiF2801u5LrDZPcGjeX9Vvi/FbEV9kbvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191731; c=relaxed/simple;
	bh=LFM/BpfDv7KoqVFQiQm8FDdXWbIYBapsw4EuLf8hqW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cBnrgiXiDvmJA7IGqpQvDdlVE2uc/piVfanN4wwyKT1sFVppN4SdTJNQ4sC/ZNNzGLtrsyNrfSAidz1QGy7rQ8UG9dRqWFJa3DlYn/XDsI4CBA6idY8acoqVmdS13jkuJz33cx5xDHCMELrye7vI8VjIUep3Q9PjVy1PXRa8Dyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M+Wk6QH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PMjbLQ000529
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+mTRaR+aWbF
	TUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=; b=M+Wk6QH2pFHpmpFO3m7YFOnTSSQ
	z9kmxagD4cTb0/hcg5psKXBwiRBx6DnVBH6modHXpsNB5vhOIjqADxeTRke5hD/P
	vSoIXL7u2yoQECu0Y81kF/ELox6dafPQsscWpwf9TiaigYWkPUtCW7djioIIlarY
	LFgXfi40eglJaWUZs8gNvLSCnurgdTf7EgKRxRyrz54rRMhPZqTaJ2Pi+C2lCCCA
	EHsPIpDgCKHbd5Zg36YdHhTRQeop399Cfz9iXSn2YG7x/KVpKA0G4vVBJJD4FAyJ
	EcZvLhRGI+VBLRVA8T61trAFZh2zKZQKMKFDEehXPEtAgJLcCF5BBOQbJiQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xffr48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:08 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24636484391so42204355ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 00:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191727; x=1756796527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+mTRaR+aWbFTUCZaXg5d7I+myL8Z4TCVvhpp1WowyOY=;
        b=qnhYX5QGJCam8A1sJwkW2328PB6BdmD4Tnyj+5/giDrLiGh2ix/4WdKZ8kr/WS4r5x
         x29DD9gi0GbkifO5n0eJQIo5mDxF/aEP7ODXsR5BfjbbCjsgmHu6ckAsmYpTul/8GHio
         elAp/3qhSID2xVEPkxk9PznSLQVC1YLYzzLf05blPquAAAt76yVvpLmcNGiu5QPnLdgQ
         E0OofbgiAb5RyCTNe7wAYl3u6cRKl7XG4pETqUgwgrjyYPVzPhdC/4fZ0wTTy/ymNr0Q
         sVnw7iE3X+slfnFlir4NvXiyAQqXdS/VtaOFqaBaMTa64NDkzJQwjD0hjlDJcaTIoP01
         Yydw==
X-Forwarded-Encrypted: i=1; AJvYcCUEeHbR565GrD9zLaFDtxuadaIhXwHa0g6VTH7fw8TwjDzmMBNc11irHUCe4F3Fyi5ipMRl1+bxLXdVKTfR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7wYe/kwTyxEaScog16a9exNdMtctVrTH8I92FqB30xjBXeSDy
	hcTTsRSoFxmu9g5ngfvFrfmVz2dhQo7//x6zFiYxYOnawkMQxMulpTF9oJjpRj8WiYbyBmqOKcU
	1R1Q1KFyavyJkIcNR7Dg4QtcNZtBNjVFJtpB3IwqLa8uYbCSRnr5K3/iflRMrZl2hyuJx
X-Gm-Gg: ASbGncsysf1b2Q+U+s3+/m6WPQp/pBsdefeEAATvE4RvTZn9w0AFD8c/hN/E7V6vIgZ
	G3IbE38MS+YOn8hx8se8kZEQdjL7xRApBixJddUp2RwGlpu5V5wymgt/1INjku47moSJVDAhqy5
	fWDhMb0+OPCBpoBmSzYBBxOmSb7+H0W0R3tsMGwb9gkQIayPf2oXOi+u6EbUArLXlAgId6ClStI
	nEZA4AvPqvz0Jch4SzPM0KAuJSnJ8jgdcGwh58R+XeP1DrD2MR+hIbMmqdhonrwrLmZApsLFd6Z
	++UjUrXSIgX/YrHAu0tA2Cm92YXhQnDeOINf0cAh01+nCAjxK7xx0QgXIw1XsGus+lJ6RKrAcVI
	7KwwfbSmwtVL+3avsXYma
X-Received: by 2002:a17:903:244c:b0:246:b49e:d439 with SMTP id d9443c01a7336-246b49ef64emr93661735ad.38.1756191727169;
        Tue, 26 Aug 2025 00:02:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoRc8uc8vAUbrMEPeg17gEclVd7NzYl81uv0y0+g5JCi7ysOqsMZE8I6TUqXsU2PMBTgzBHQ==
X-Received: by 2002:a17:903:244c:b0:246:b49e:d439 with SMTP id d9443c01a7336-246b49ef64emr93661165ad.38.1756191726678;
        Tue, 26 Aug 2025 00:02:06 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:02:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Tue, 26 Aug 2025 15:01:50 +0800
Message-Id: <20250826070150.5603-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4W0b16p6uCbB
 SRCGwlQYa/BfhCcyISo/0c9i+OdFPbURqwLl/zLmtbm2MM7Ax0HHZpTig01EBZ/tXwrm8iECTQ8
 QKL32yKA8g3M69IJu/6UQrMtIgixSYnIfmJC4aTSWqPG0pJwh3+Er0UQo6gTCLMFU2i+kEblJPd
 buEgZ2uQ/8UuhJaBZZtvmXYTqlxHC3zIX0mAIwcvOtHnAm0GmSNvow2chTSjgn/NCWWCsZsss+D
 gT/LtOqJUJ+LMnY7p/4uTEyLa+74BT1N85Zz0qjPYEG+29B9CCkqG4Ack8J8niMMnGJJHSKdlIW
 sQKYyieYxrw2fSq5Ds/cFR5S2PmtLhDLTLsKAT4eYEL2aDs/Blq/jfbdgVT+sYki+VgO8CybW6I
 CYtGu3O4
X-Proofpoint-GUID: sJUk5hwDZbtLvD1SpKmFb25f1dbknDd1
X-Authority-Analysis: v=2.4 cv=MutS63ae c=1 sm=1 tr=0 ts=68ad5bf0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=UsKUHg3HdU6Ygep39SEA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: sJUk5hwDZbtLvD1SpKmFb25f1dbknDd1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  7 +++
 drivers/hwtracing/coresight/coresight-tpda.c  | 45 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
 3 files changed, 53 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index e827396a0fa1..8803158ba42f 100644
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
index 9e623732d1e7..c5f169facc51 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -509,6 +509,50 @@ static ssize_t cmbchan_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmbchan_mode);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
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
+	/* The valid value ranges from 0 to 127 */
+	if (val > 127)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	if (val) {
+		CS_UNLOCK(drvdata->base);
+		writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+		CS_LOCK(drvdata->base);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_trig_async_enable.attr,
 	&dev_attr_trig_flag_ts_enable.attr,
@@ -516,6 +560,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 00d146960d81..55a18d718357 100644
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


