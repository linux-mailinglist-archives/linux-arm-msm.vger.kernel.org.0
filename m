Return-Path: <linux-arm-msm+bounces-84042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38173C9A5C4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 07:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E61323A5A70
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 06:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310CD3019C6;
	Tue,  2 Dec 2025 06:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFUmtDKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FTpaq04Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 545F73016F0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764657803; cv=none; b=nl5KJ/vip5OJuQdyxqGSy5FLprgItOvOmHu/bd+lQIWScUwRoi0BCL4N7kdb0iw+ZxAFNa/xf4e5xumtnmdFcTkOBV4E+tsnQtNLUsV8Sn/5CKiP3ljOz9+7JAFbZU86h79WpmZZg7dh6hdqcoLJbHv6D/6mcpWZcvh7tBgX5m4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764657803; c=relaxed/simple;
	bh=EHk3TrdZcUh7JFRp0sXEzGfbX5tPAbR/co7dEigVes4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rGFdj9YoLq0MOrTkiHtWWrxERRaT0dZYvXf4cjklDV5vhOXFNKYbdv50nYQ3KHSpBH8s4juIR2Upz/UxGcljUEXq7EqBSeEIohPaKGZrf6CQ4rvk4aaBXmKMWmXer8QiTHmNozQqU2OYPbL9njpeWtIfPZC4GEmz8gsk88sstMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFUmtDKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FTpaq04Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B24CcoA1591477
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 06:43:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U4CEPosLk4c8VO1ED7x/05VLZq/brB7mPtuz/Jxmq8A=; b=jFUmtDKB7kyAvsfs
	Pzm3Ouv06eEskmYHbf0WWPD9htXOn7iRky0pfD2/vIWWzwGV1tmfUW5yQO6Noy0p
	aPFpys+TdHKf1ov8edJ4PcB8RUfmAFfiW8ULfxQCqf0Lofmp96+pgv9I2lJr5HKo
	q1cAdkpNGGDaMElWRz/N+agnnUbSgCEoRX5jHWp0P48UY7AxrOloAVacL/UBjj4e
	b8Wrhao7FV3uML9sFePBDcmGrcHHvaLpgKQsQ4t09tSikNXEiM04Rp7MwggTXzcY
	CeJoOtpSd6PtCM1zPG//Q4gBCgGyt1RSw2msFcchVHAcTkgOF5eIyf0SXEYzBlCF
	5dY52w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr8cy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:43:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-299ddb0269eso61648025ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Dec 2025 22:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764657800; x=1765262600; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U4CEPosLk4c8VO1ED7x/05VLZq/brB7mPtuz/Jxmq8A=;
        b=FTpaq04YeIwOQB0baQviYzLZbbtQqhQUKNMB2WJfKyt62QGbXRYRZLoIyYDffFlT62
         D6Aj4PeQTb6705EnwwkFHcrGzGQaai3QYGAB9XKNfDnDXx/OzyU/sLEFfWuz0hAaR6Bf
         84S6e15lnav2XxI5LAJfuRm+gM75QZsfYLJ2WKOlhYtt9oEB1Bd8+X+k0AlwtS80x5wI
         eOTwp197GDYILf8mw9K3TEmg82nlkqjdOq6EShDCpnY0Ggf/Ps0KPdleNCjqSYeDe5nc
         0+06VVfMJJeL2QOa1Vyd+H3CD3jIGUnvFWAWoqefe4pi2FR9R5YQ8sASzBH/zT0ZUA+k
         htfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764657800; x=1765262600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U4CEPosLk4c8VO1ED7x/05VLZq/brB7mPtuz/Jxmq8A=;
        b=L2evbX1CZbVVWuhAagpSMTRka3J/4WEMHaQdCD7rkNk/DzzTn+QzgN/GndisVrLF2q
         h0NFj3TXpg3yUEcjtdYttt9ppe8Th1NRjr9e3eaJTvjA25yVgfdkOZRdTwH8mHOCdC3J
         I1imWQgt1um1ZctSmEREdeVeEnsISZezAQJxusRAg9ekhtp7b6V3DT3NClsfHDr5zFVq
         W6XTgrZnZWqkqa4gWHwbdiu2ZUvzNHjz4hqxwR02mZE5qvd9QUTI//oFDCGlYoy3t3HY
         jmiFjUSqUcRi8TmBMU5dlWwWoQ9KPi+RmI4QfOrmj4VGCYK+J7YRH0qlFDkqtV0kSstc
         gCuw==
X-Forwarded-Encrypted: i=1; AJvYcCXytdtTROjyjdgFC80z7uDiJuQ8mIRMXt2YXSJZHCoepv/lotJYcd3fdsppD7s1Y+rzsjan+OP7mptG4Lvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9TyxamIWQgWocZl0HUtGWS7EF9wFQ1gDUwDStm+hBIpw8TJtm
	xNa+YC49t5AsIgV/8rmAQcOa86tOVvi610obJLZViAjz0yRvtH8Ic3ef+am2AjSFNgYH4ILuXZj
	2znap+weMDuDMLUb3Pm9b453sV8RPYq6iNdEkHiv8cma7qCZi3+eiaTI2rfV1frbeAQc2
X-Gm-Gg: ASbGncsnqBR4xDZi8ud4LpOnzJGuhhgApfe3fAKUw3sL1FphS0GDPXp/0FySklo4ETP
	ewj5rFLvi6xJzSl2hXPmsPbXE41qZ0XYdxZZMH0cm/93BKMGWqLu7rnAqfI8DGTGykzQigCnpZZ
	Z5MTOr5FtpQQpEv6S7pl2wXFzt3NoQgxviuaLVmMQlIkKHhWAumjoXMpRfgwsf3Ba0Iy0TPQBCO
	mAMiVAu6U7oj6FzyHkZGBKlotQqrv/0qEolhIlOSbaER3KqOB+AQ+W07kNlCm9NgDgFxDnvcxAe
	iC6b46v6CdcnSKh46Si5uVsujdBooceb/NQGW6UCuBY28sy8ysJgnO49zJD0hJiZdJLFdExD8bq
	7MB8C6jJmHvTBkCc9/M0VKVXPksRJ3wzYbtMFdcRswFUiYLXu/F79Ytx4Z1M6V5QO0G0qJ2aX5A
	DBdg==
X-Received: by 2002:a17:902:d58c:b0:294:fcae:826 with SMTP id d9443c01a7336-29bab2fa50bmr322287755ad.59.1764657799638;
        Mon, 01 Dec 2025 22:43:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmz69O+sqegGqvJXNp/6khVCSF1CST5oB/umMY14G4/IE96n6RMjq94/Om9UK6eOYz4XsexQ==
X-Received: by 2002:a17:902:d58c:b0:294:fcae:826 with SMTP id d9443c01a7336-29bab2fa50bmr322287495ad.59.1764657799070;
        Mon, 01 Dec 2025 22:43:19 -0800 (PST)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bceb450cfsm141821675ad.74.2025.12.01.22.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 22:43:18 -0800 (PST)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Tue, 02 Dec 2025 14:42:20 +0800
Subject: [PATCH v6 1/2] coresight: cti: Convert trigger usage fields to
 dynamic bitmaps and arrays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-extended_cti-v6-1-ab68bb15c4f5@oss.qualcomm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
In-Reply-To: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, quic_yingdeng@quicinc.com,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764657791; l=11022;
 i=yingchao.deng@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=EHk3TrdZcUh7JFRp0sXEzGfbX5tPAbR/co7dEigVes4=;
 b=rfWFNPeqLs2m3d1ZANKeGBcScEpjUwqAL2uCsg3Sa+pbdy682Ft9mbOKsOf5bL0PgIVkMQwuX
 KjM6alLM856CASByihVQ2PwMmSFEuo1COuKjH9NuStcYuD85OpdmbV7
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=QWvd9DuX5YKvc7/VfWGCElGNr3HbCyig5bEb+lUUohg=
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692e8a88 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qBB9sKLMsZVO1SgW7bQA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Gka2K_ZozZ9223j4EE6zAbZnYVXGiEkU
X-Proofpoint-GUID: Gka2K_ZozZ9223j4EE6zAbZnYVXGiEkU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA1MSBTYWx0ZWRfXwdKYMzF9JhBi
 m4pn43hhFvsy1nsjnCNHucIWnfkmdmU+7b43RsAscpqEpJj2//T1UyoSX5WEjgXlUZa5FGL25jx
 wzHC4L+2t6h+BOU4cUMIJDJHzbBk+61Fou3z9pBz22cuS/7jwPAatfenvjWTC58k5dx7V2b6oy/
 VJVv0oj5/D6pcnStt2xcw1opKdoWLcn202mk3FIA+0l0nZhzfPOcbYv1gpsfNK+qy355mX3/lBF
 8I6X20XeYF0kxC+zHhtP+AxoAWrxb3X0gMzhRirrQlOPEA5K+qDEujDeu4i4xPK3fubViqICcGK
 C+LiNI0scvp7wSsxR9V1SWfa82OPEeNO+vZDISgkkyW1Cw53WVWx7fP7REOFcVur8LHj5fzwtiV
 78GdxMChWKlNaCPm+imJ+tNrfUyqjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020051

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.
Additionally, repack struct cti_config to reduce its size from 80 bytes to
72 bytes.

Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 58 ++++++++++++++++------
 .../hwtracing/coresight/coresight-cti-platform.c   | 16 +++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 10 ++--
 drivers/hwtracing/coresight/coresight-cti.h        | 17 ++++---
 4 files changed, 65 insertions(+), 36 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index bfbc365bb2ef..f9970e40dd59 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -214,8 +214,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -234,12 +234,33 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max, GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32), GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
 	config->trig_filter_enable = true;
 	config->ctigate = GENMASK(config->nr_ctm_channels - 1, 0);
 	config->enable_req_count = 0;
+	return 0;
 }
 
 /*
@@ -270,8 +291,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -293,12 +316,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_alloc(dev, in_sigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_alloc(dev, out_sigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -314,7 +345,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -325,8 +355,9 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
+
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -339,7 +370,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -349,18 +379,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -892,7 +920,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d0ae10bf6128..4bef860a0484 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -331,7 +331,9 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, drvdata->config.nr_trig_max);
 
 	kfree(tg);
 	return err;
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 572b80ee96fb..a9df77215141 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -711,10 +711,8 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int size = 0, nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
 
-	if (mask)
-		size = bitmap_print_to_pagebuf(true, buf, &mask, nr_trig_max);
+	size = bitmap_print_to_pagebuf(true, buf, cfg->trig_out_filter, nr_trig_max);
 	return size;
 }
 static DEVICE_ATTR_RO(trigout_filtered);
@@ -926,9 +924,8 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_in->used_mask, cfg->nr_trig_max);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -940,9 +937,8 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
 
-	return bitmap_print_to_pagebuf(true, buf, &mask, cfg->nr_trig_max);
+	return bitmap_print_to_pagebuf(true, buf, con->con_out->used_mask, cfg->nr_trig_max);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index 4f89091ee93f..e7b88b07cffe 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -146,20 +146,21 @@ struct cti_config {
 	bool hw_enabled;
 	bool hw_powered;
 
-	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
-	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 ctiappset;
 	u32 ctigate;
 	u32 asicctl;
+	u32 *ctiinen;
+	u32 *ctiouten;
+
+	/* registered triggers and filtering */
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 };
 
 /**

-- 
2.43.0


