Return-Path: <linux-arm-msm+bounces-70815-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB1BB354F5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 09:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5845D245340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 Aug 2025 07:02:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8595E2F6564;
	Tue, 26 Aug 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DTiooAfw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 846992F60D8
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756191724; cv=none; b=YU8JIrPSeNyCROqEhnK5EEqUuO/glcoR/VAo8M4XkKEkW1OHJ7kFaLpmmabBWVQAXevtKeYeJwHlwnSzLkp/+GSVorcrXc6OHf9VNQ8lc2D4rv1hXNwMZeiasQpyPb/wTddwZ4I0dmdVR6Vjd691jm5VYbxjIpgs95nd1xvPzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756191724; c=relaxed/simple;
	bh=0HWZDH1eAsQwi2FcQw5lkDCnHIsfjhwLmEf1iRt7vT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DW3H4qsZIESBAw2rFsb/xeW0i4kknV+lSR6eYAjyFcT66LDu7ZU7nZ8g5aty4OUaKoeYWTkLJYieY5NPlPVH2n2kqKOLktu/UCMHfG4/WfiHsicSG7sfN20/a6MMTeIrJwVN8rz6WItk1QYCn3Zhv25TDrRlurmjvqHxrB4xp2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DTiooAfw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q0RksY015139
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m9K2WekX9kT
	nRq8yZxxjhrDbniYSZNxmfq2nx9Es5RA=; b=DTiooAfw66xn+wYuJrwUEawUBzr
	S8k2lc86WQttbuwoNsJg1eWhmKlupp5FPszPs4csgJ5dIVKiYhigeSXeCG2gN6Ei
	n1GrJg6qHJhSkWjhb+vzPJHzeTo7Ey41+SbB87LpFBD48Cq2iDQGmVlStIOavijD
	HS+4JJPMpq6QWEvq2s36zIiDFqDn7itA7c9DV115lYigrAhDqb//Dfm6jzzVltY1
	MYPtPqNtAgEsQRauapJchbiQdq0ljbsBXkXNvshri9KxraZYs2WvErOMmHg50XRF
	V+7snSNIKwx3RDI/06TbVF9Wb8677IWoJwJXJoJPhl6kxeym3bswtv0iv8Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5w2qx4b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 07:02:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b49d8b818d2so3488084a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 Aug 2025 00:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191721; x=1756796521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K2WekX9kTnRq8yZxxjhrDbniYSZNxmfq2nx9Es5RA=;
        b=KUQSjgPpUjSiCcUEDWW9IQ8YrXjDTwv02QwMHUudVcVEDvwKKvRb5AhahqPhzFndKj
         PvOc0s0LU2Y5wnxuF8rT4PCGImAa83RLK/dlHPRwbWHwg6/tFYWbUbKSj6RHqbCjuF6V
         i+9qC3tUs53UDha0NakOy8TzfI8g+s+hYL/GXdW49/btBInVw/H58KJZCGjJfylkA8dV
         gZecdBL5s0WwNsiKSdgDhEzl+/IfFik0simRXxSwlXQHQQ2kFLSBhy1Bol8AxnT2TgZ7
         qH14r5Q8jHjieMQdi7+WxNHgqX/yR46g4oyFEMM5IR1C2TG/XOrUvIv7g9QN9i7rfXCa
         WNcw==
X-Forwarded-Encrypted: i=1; AJvYcCV0qMa7UrXG2H7pSJPP+bXVB2n67IXEmibiJIheocfCD4xCViiAfQ4W+96htdzrpQOzL9q26ZXsprQaYtvw@vger.kernel.org
X-Gm-Message-State: AOJu0YyutZbLdq+VRDHlMKxD+6ho64j6OYAaMVMJnpLwYz4mlXmfYuao
	Wt7Zq4GzxfdfCUbSdPqW/yzdWaEXsBjeD0IqsDZ0itYXNxXaiyE06vUF1zeBsfG1504ij7Uf8y5
	b/ZUgAnBTZp5VALRYt7M+oDfXhVN8dTz6Epayzep0J6ggZ4nghZ4wlnBJfTuyvWUCaTOJ
X-Gm-Gg: ASbGncvsgfy/yB3neHe0j9abcSpXpu3aWpzC8T10ZpTJN6WBI8h8r9knFGBoCAGD7PQ
	pL5pbpUNB68x5RkBf01W6ARGSvgQ5B4xkgGNCGjnRDPAWR8MlQOhfCTn7FsMjbqx6vUdRnuNjkj
	Fop+cq9TQeE6W/Cmg9Xb4RFxcdTo2ZobNEoIris1h5EO+ZI1ClDYMqeiSDhfv8AKB3SYaBlyml2
	grhy6rkrLebBGcP1VTlE90nB2+kiB0gZL9z9ZZ6c0o91Ok2QAVH9mg+dxXoixlWJtcitPuNH3X+
	JiU9xIrRxw5V1PeW254yzl71wf5aB4wXee7jp6nylzihuJZEaLRUUcWN8gHbVQTMone8mzwJJ2A
	BHW136Aev6tZG+Ti8t6/l
X-Received: by 2002:a05:6a20:939f:b0:240:c3d:2449 with SMTP id adf61e73a8af0-24340d1c795mr21209327637.42.1756191720587;
        Tue, 26 Aug 2025 00:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErdrLh/EhVGg9J5i6FyPereXOVgDVfJgcH352jUBOkW9ABzl67CWi5xgFFU6sDrJzA/uJDHg==
X-Received: by 2002:a05:6a20:939f:b0:240:c3d:2449 with SMTP id adf61e73a8af0-24340d1c795mr21209269637.42.1756191720030;
        Tue, 26 Aug 2025 00:02:00 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:01:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda cross-trigger configuration
Date: Tue, 26 Aug 2025 15:01:48 +0800
Message-Id: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Z/vsHGRA c=1 sm=1 tr=0 ts=68ad5be9 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hl4cRc3ft4hpfJdQRooA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX4pTBreykxRdM
 nabOhVl/Ns7tBERhKqdCUTdbm+hXdXVIGeHrJK1isustg2xHe3KX11A7Hz6w18yDq03bV1r1zDf
 0u3vVn3ZI2ObRwM8LoUzGqCW6SXz8Tb9LdQW6y2j8/5Ol491syDTi8lHxoRQVNUUqfSwE+62hky
 OY3tpKPfxMawKow6dLjoK6N2IWpse0Qmxtk3B/rPkmwNn2ExiDNiyR/nhXpDWP9XyXYmi7eMGzG
 yhcRNvE7VgaKmmgVp1q2wuN3ClivjxSk9tahHiZe8XZ/iYX4DITpvdL95/TfhpI6ld8LISdcr6t
 +1d9QgnbYUq1CzES8hSxklaqhwODnQuSPVxnZeIGteVGNu7mdCF9g79Pnba89h9Dl0jY82X2l5X
 ldrGlSvg
X-Proofpoint-GUID: yBH6mkL614gWSJqyWLi0HHDA23tyVADA
X-Proofpoint-ORIG-GUID: yBH6mkL614gWSJqyWLi0HHDA23tyVADA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
These registers define the characteristics of cross-trigger packets,
including generation frequency and flag values.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
 3 files changed, 311 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..e827396a0fa1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,43 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set/unset global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 4e93fa5bace4..cc254d53b8ec 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	u32 val;
 
 	val = readl_relaxed(drvdata->base + TPDA_CR);
+	val &= ~TPDA_CR_MID;
 	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val = val | TPDA_CR_SRIE;
+	else
+		val = val & ~TPDA_CR_SRIE;
+	if (drvdata->trig_flag_ts)
+		val = val | TPDA_CR_FLRIE;
+	else
+		val = val & ~TPDA_CR_FLRIE;
+	if (drvdata->trig_freq)
+		val = val | TPDA_CR_FRIE;
+	else
+		val = val & ~TPDA_CR_FRIE;
+	if (drvdata->freq_ts)
+		val = val | TPDA_CR_FREQTS;
+	else
+		val = val & ~TPDA_CR_FREQTS;
+	if (drvdata->cmbchan_mode)
+		val = val | TPDA_CR_CMBCHANMODE;
+	else
+		val = val & ~TPDA_CR_CMBCHANMODE;
 	writel_relaxed(val, drvdata->base + TPDA_CR);
+
+	/*
+	 * If FLRIE bit is set, set the master and channel
+	 * id as zero
+	 */
+	if (drvdata->trig_flag_ts)
+		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
 	.link_ops	= &tpda_link_ops,
 };
 
+static ssize_t trig_async_enable_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
+}
+
+static ssize_t trig_async_enable_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf,
+				       size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_async = true;
+	else
+		drvdata->trig_async = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_async_enable);
+
+static ssize_t trig_flag_ts_enable_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
+}
+
+static ssize_t trig_flag_ts_enable_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf,
+					 size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_flag_ts = true;
+	else
+		drvdata->trig_flag_ts = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_flag_ts_enable);
+
+static ssize_t trig_freq_enable_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
+}
+
+static ssize_t trig_freq_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_freq = true;
+	else
+		drvdata->trig_freq = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_freq_enable);
+
+static ssize_t freq_ts_enable_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
+}
+
+static ssize_t freq_ts_enable_store(struct device *dev,
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
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->freq_ts = true;
+	else
+		drvdata->freq_ts = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_ts_enable);
+
+static ssize_t global_flush_req_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	return sysfs_emit(buf, "%lx\n", val);
+}
+
+static ssize_t global_flush_req_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	if (val) {
+		CS_UNLOCK(drvdata->base);
+		val = readl_relaxed(drvdata->base + TPDA_CR);
+		val = val | BIT(0);
+		writel_relaxed(val, drvdata->base + TPDA_CR);
+		CS_LOCK(drvdata->base);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(global_flush_req);
+
+static ssize_t cmbchan_mode_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
+}
+
+static ssize_t cmbchan_mode_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	bool val;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->cmbchan_mode = true;
+	else
+		drvdata->cmbchan_mode = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(cmbchan_mode);
+
+static struct attribute *tpda_attrs[] = {
+	&dev_attr_trig_async_enable.attr,
+	&dev_attr_trig_flag_ts_enable.attr,
+	&dev_attr_trig_freq_enable.attr,
+	&dev_attr_freq_ts_enable.attr,
+	&dev_attr_global_flush_req.attr,
+	&dev_attr_cmbchan_mode.attr,
+	NULL,
+};
+
+static struct attribute_group tpda_attr_grp = {
+	.attrs = tpda_attrs,
+};
+
+static const struct attribute_group *tpda_attr_grps[] = {
+	&tpda_attr_grp,
+	NULL,
+};
+
 static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 {
 	int atid;
@@ -289,6 +528,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..b651372d4c88 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -8,17 +8,34 @@
 
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
+#define TPDA_FPID_CR		(0x084)
+
+/* Cross trigger FREQ packets timestamp bit */
+#define TPDA_CR_FREQTS		BIT(2)
+/* Cross trigger FREQ packet request bit */
+#define TPDA_CR_FRIE		BIT(3)
+/* Cross trigger FLAG packet request interface bit */
+#define TPDA_CR_FLRIE		BIT(4)
+/* Cross trigger synchronization bit */
+#define TPDA_CR_SRIE		BIT(5)
+/* Packetize CMB/MCMB traffic bit */
+#define TPDA_CR_CMBCHANMODE	BIT(20)
+
 /* Aggregator port enable bit */
 #define TPDA_Pn_CR_ENA		BIT(0)
 /* Aggregator port CMB data set element size bit */
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* Mode control bit */
+#define TPDA_MODE_CTRL			BIT(12)
 
 #define TPDA_MAX_INPORTS	32
 
 /* Bits 6 ~ 12 is for atid value */
 #define TPDA_CR_ATID		GENMASK(12, 6)
+/* Bits 13 ~ 19 is for mid value */
+#define TPDA_CR_MID		GENMASK(19, 13)
 
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
@@ -29,6 +46,11 @@
  * @enable:     enable status of the component.
  * @dsb_esize   Record the DSB element size.
  * @cmb_esize   Record the CMB element size.
+ * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
+ * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
+ * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
+ * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
+ * @cmbchan_mode: Configure the CMB/MCMB channel mode.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -38,6 +60,11 @@ struct tpda_drvdata {
 	u8			atid;
 	u32			dsb_esize;
 	u32			cmb_esize;
+	bool			trig_async;
+	bool			trig_flag_ts;
+	bool			trig_freq;
+	bool			freq_ts;
+	bool			cmbchan_mode;
 };
 
 #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
-- 
2.34.1


