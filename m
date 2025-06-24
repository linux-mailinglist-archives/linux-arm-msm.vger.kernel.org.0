Return-Path: <linux-arm-msm+bounces-62156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 44709AE5C82
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:06:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8321899878
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB492550D0;
	Tue, 24 Jun 2025 06:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y2Io+6Kl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A325393A
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745129; cv=none; b=nXqGirtEqHY61g9rbsWfcqjdAJl2X915NJuT1jC2r9xBsLQXAEg7Iy8KxijlTWBC4TxJKpzBhOHVu4bVRgmgtvby/TcR1Zr+9oaB1SVJOlw0+Czbmhx9tlMidmS54gsIE6aVp7/i9UzULHG85UuLAvtJMavKvseebpVarudJLpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745129; c=relaxed/simple;
	bh=KepZY8zi4khOQ+LkoB9ldagpD9linYgqNDUu7qBt0Ug=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tqizr92T6bzh2JZlzHkavybs17FiyC+PYeMc3EvLkxgQeXPp3I4rVCsS4j5TckCWhUajVql3JIEwLjGZ0w7OknyX3o/qcRemL1emCsE626a55Q+vGW3ayxSy8LPUlnj8JYoRaQwQdROzbK+0G4EZWMnGjSP5pkoYE9A83LnKZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y2Io+6Kl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKmEDV016718
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbtexVl8cn7
	s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=Y2Io+6KlVtGgDnl8eTkmBjbzuiD
	vusDMEAoAl/dEprcwBUvXhP1l1zht8LOP3KcxwxSRVOXEVSGgUoBtjE1FOkSiTzJ
	XOxU5gyGVt5lLG6i/1UjVPLcYra480HMDUzd+DLUkgjngUQSP5ruWibU6pOAgqMj
	H/rsq0JBoTafxJL3EMumuOlnP897x2xWj3ozSmHxNb8NkC3VOlOZCpR7X9TJml2H
	mtFF489O8ebMCwkzgOz9bNXKHIFW5bYFqlS++4ZloxpvNiA5AkELs2/hM9EP4U8L
	GnDwG4JKAemJvjfZh9Ick/w9clactHXhGjV6TtSHa+8piM1M1tj829pk6mg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqhedv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:05:24 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so3134117a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745111; x=1751349911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=;
        b=XBXjIA33EyAhz3fTVA4meDh8DHtSK3H3nXWYTe+QoX5sWGScV4/731Jlx2yN3ckyl1
         cCrJxOWk8rbleQl1JH/ZGHIv+FkFXiyNlWjqq/YcldjZCWG0px/r4MqYftxwBZOBDUUx
         20AqXs9fGYnXnvXTeTANzo6IrntXGsl5VixEkM43MzE+5uobwC13XFCSW6A3sOalVk2e
         mgXXcULeE5C5noM6HaGZYdDZ6IfaR2ve4EO9yRGU1kr6OIR+BVDfvLSMX0L4PMUEt4XC
         v2IReqhgD7dBaepu213aFsXZQsMtTzcVIiG9kn6kAMoVGo9FiGwnRZ4s/Gv9oj4/KboS
         57tw==
X-Forwarded-Encrypted: i=1; AJvYcCU45ZW8AbnBKX863U4jUYwTZyWlzIzYBSs9+jLhMESRh+1prkgTEo9lKvNPC9kGdQc8UgmvpFIuZRlYoHCZ@vger.kernel.org
X-Gm-Message-State: AOJu0YzDw9SbayxZho4RhplMO3SzmqfK9JauIwCH9mWdNtEWhinoLu8V
	iWfFzK0TFMAPLuwktVKGAngG25vLgh/90qGCYcQEYVqI/bW/jdeyS7MS2eVnhMuW1pw92cgXQ6s
	sSDkHDNOQjCcc4QARPIJvxqKLeivy/CU5+C2niC+GyXbLTMaXSYeWzlbsNDP5+7vcAB+T
X-Gm-Gg: ASbGncvDDZin1Aok+daoOUaAYwFX7sItL/r08HdyX+XI6MUwox8sQogETYaV+mca6B9
	s/QTG5/JllSNE6x+rpewKRNsgEUIOexA3PNNlCkWh2ijHdBLzqIDmEUz95PpS/R//0fjvf/iuxz
	aOFxmMU26km2k/y9QL7+nt3YlVc/JX3+yOByYj1ff1wNpeac5q6XgHJ6kXc9Q/+YJqFONjuG9CA
	og6lwpB7a+G+Bo23mghMMVTU5aJCoGXYqbSoSNp+KltuINKcGxxFvyGNsiuF3Cd0LcmHmagsp08
	ghVPyNbo+7xZUii/GDcpi5R/bQQfmv1TB04N2xtNa8ohARyqa1+qT7JDTdPK1VIlKp3B7XI6wcS
	AaA==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278685ad.14.1750745111408;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/6alQ8oVUf4oBoB/kDRpinRzRgdoo/fUtBrPtywrip1OTrzz7TjJGaNQaFksnjaq2AYvlSg==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278405ad.14.1750745111051;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 06/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Tue, 24 Jun 2025 14:04:34 +0800
Message-Id: <20250624060438.7469-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XduDLCSWvyzdQfrMQh9Pf6vr744CxBIj
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a4025 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=k3jFKW3szlTOC2bxmxAA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: XduDLCSWvyzdQfrMQh9Pf6vr744CxBIj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX9khk5jtuUZen
 BgdeKjfJxq/NmDP6h3DSlZxs/zST4nRL61u1AvfkcekTvibNJX4QEtykdrEf8YLUseQAx2hPhBF
 Kq4fGIWVQpieAwipqVz48YwpTWz2WQm25EaZQi+ivhlxb6p45pJQ09PEhnPjLpEnFERG+0PG5NQ
 MO77KJm17icZwxITBD65kdjQ3ypFKGf+Gqmy954C4tl29URzBr+NvRZMzmAJ8Zmi7tjS5eeyJgI
 GWUq5mXfiYJurtd4mi7dXdG/VJpMQsKZoc2ady3/X9mJWXarkhr0OYfFHu2f6L5adOION/9zaz7
 BgSvBR+bw0/2PJwRoXn24a6B4CcqSibS8hojE25YYoxxwpxr+rFIszkJa3jDYCoKpCoNZ6vapn+
 HyH2N9GmVN1O5mhISDmvdy9Kao+tXLwmQwX39HRkT7QAe7i8yMJBt3YfHPlq9JVMwWcWcIJ2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240051

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..4609df80ae38 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,55 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+static void tmc_delete_etr_buf_node(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+
+static int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else {
+		sysfs_buf = alloc_buf;
+	}
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-- 
2.34.1


