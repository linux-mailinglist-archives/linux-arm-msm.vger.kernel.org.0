Return-Path: <linux-arm-msm+bounces-62151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2C8AE5C6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 08:05:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEBDB1897041
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 06:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E722823D2AD;
	Tue, 24 Jun 2025 06:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TyhHVy5r"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4413D23909F
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750745092; cv=none; b=J9lRDbUkRRLdkLYekcgvOL7F3VP8pJKgTFAYxZZDdNZa05XiM6CHcdvyvhyAXy/L8vew7rs1tSfZGLUS8qulzbq5sJ9Kst+ImeOup6PY8tgSdeRkiqXdr6yCjW3jy3CKYKZAjA/NFm+J69+ZfP+lUVRFaPjHT/tExPpJxv3+xxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750745092; c=relaxed/simple;
	bh=n3EaXaaNhWYWmkdCOUG9x+pdcHBoegUPElZCXFPVc0k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FNcRYvJ/OQkWRjLWvF3h3EOpMzV0NsIQf9HPHdWJ6beY1e4rCcq4xh9WtUH4uJd0mFPqCaxcQKCEJg8ijlnBhyA8qElA0s6R7JhHLi9VLxtC2HGaKI65tZj4H+vSdx+/EOZaiWK4gGnKJaikTiSKSeIKOqi74QDy2TODB8E+Jy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TyhHVy5r; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHf00e026740
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SXDZmqpfj9O
	i17S+KvFoTK0GaAZ2Kfc438E97avizmc=; b=TyhHVy5rcxyPvLe/sRdeKCTKrzN
	qRApGnsNnaQf/VpGRLGJ3oUoWTW+DYHp6U+l7V+Flfx2eHPBQ55pPZdfAbgoz+ud
	Cohw3Ebp+ORsQebZD3culedijJ6er9q8F+7JV2D3CRQn4O1ohiLNMF1UNGPqCe5H
	voC96rCJa4PRb3fs8iQ8vuHG+65M5Gp2fMhBRoUlqZFyumsyejebSdevU9w8oYkY
	nrZwPo9z3zo56l7832wQh9ZNZc78zZwBR+w02RRij6k4m+A3xEsYEGHvg6+AdeLt
	X6Etjs3m4sL5Be+WF8r9PkwwqeDS8ZI0AZCjCYiPcsQoY7iWQruZjlNzX/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqhece-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Jun 2025 06:04:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23536f7c2d7so83258955ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 23:04:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745089; x=1751349889;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SXDZmqpfj9Oi17S+KvFoTK0GaAZ2Kfc438E97avizmc=;
        b=lzf/AO+7+g80uJmf6iU4cNm3BNx5kbFDzo2F16HhplSAXfIGFaXQEsK6AkuG3qapCU
         l3J5XfokukWdLADU/WXjtgErRiadfZX1gUCGEzAkQggJjZ0cNaKJrZbxUN0nCvGDOBED
         fxJElDksNPzf1dN+tyeb+HunjDIpMtknO6O9cGwMNEEdNWRUjJR71QPPfa0bJsNmR9a2
         U0WnhzNGrfe1itHM1VSaSximvKX4cHz8PpaXrVbBiHH+UWcxLx2qZz1FgODo5tgCZrjD
         iFd+/knRGVQsfExvEAWihXQbxKRm9JfRi3wkTPREa/AmYRLcDfdwGssxRETSmLb1wlbS
         y/ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQNE/xUGgJ11NBPyCPjY5u5/zxGtU0SjQiManCgMEvy6LT8Qijzah1FvalqXbbFV0nGs9sckGPdvpBaaG4@vger.kernel.org
X-Gm-Message-State: AOJu0YzoE6gLnn+Tpl1GUJp5N423MUFbruOeQ0Z5Jx/FUDn2XRDsOdQU
	yX/tRuhQH2b7IGXlIn8VlhI985JkTnvC1ULOLoIDXQAo76goYAnWVjaXu70gDhB1IGUJxMVu5Xp
	PvyOKRPft6ExpekPJ+HvpPtEfLEO7drb96V570kRmjAqcGx8M3TSrjuBf0CkDgLJ2XNzB
X-Gm-Gg: ASbGncuGv/hoQ2Ta8cfArDpTfsP6fj7MzxPtWKKOUgMeFhh1u2tkglO7jTRk+Ii+8re
	yhx/tdqST/6hoNSs/gD86MWm/vMeCR3Tzc527aOgXPpj2HDA72jJBL8PffYdYenDG5Sp70iHIQO
	NSrVkSSZ+AWsRHsTrSIz2hM5yXKFpzvW8hpGSVRlpf7sh/SXGaKXezn/2fvG1aLsk2Vt46HLdbn
	GhRX6u4KYdK1T8JzJOKi0RQNfyMBF6ogpP1r/g8B9CWuAFygCqSHk67iChwZp62WHGkpsRGVjS9
	qMa5uZlWpSpE2K9Qpo3PMjVxTR0+7+vpr9tXOc3qBwL2mwZoOWd2w14MgjuXWxLCZf72+nu0CCe
	Y8Q==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269830955ad.35.1750745088741;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHGFVEgHMh2e65wgJoSytM+YbUXaFUdaLymaIwIAsqFFbJ5e27Dt9FJEOhG05p9+rpg/ktWw==
X-Received: by 2002:a17:903:18e:b0:234:9094:3fb1 with SMTP id d9443c01a7336-237d9a7321dmr269830575ad.35.1750745088368;
        Mon, 23 Jun 2025 23:04:48 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:47 -0700 (PDT)
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
Subject: [PATCH v3 01/10] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Tue, 24 Jun 2025 14:04:29 +0800
Message-Id: <20250624060438.7469-2-jie.gan@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vZOTWtUDR9CZWxFXX2dCfCkLKA52agFc
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685a4002 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: vZOTWtUDR9CZWxFXX2dCfCkLKA52agFc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX57SYF1sftwON
 jY8sw5CRchdjSsHIjTlIySswvamri3FK51SzNMpwROWI5Kd+P5pUUpuchM7G1T+Hw+Nbu9hdxYa
 GbBQ9X6rjS9uERSAJPAXjf/CtaRpYgAyuxy/TAEwAmhUaFGc4Q/wjIlX3CkpdZ6JMy4cNsLGSKW
 wKrngUc/0jn4Cf3Sd4JxlXVt0pumcV9K4U7/p1YEP/B+S6BwnKE7otbMjGGAtnoquTb5LkaxCAw
 YAtziPSVX+jRCbYmxHuqz3qEtUqmwxVuFO4jRqd9o+hflt2d8YVb4fzvfrEGPzv4kbOz7Vlrmf1
 oGzH4Vu4eoNer6nanSTfl84USqzyzmShcvrYnOCobCyxpeUrtAaFcJyI9NKPyhm5c11F/029MJb
 7NowRE0W39s4Pm+Jg133gPF4zE2os62rRFPCaIROYDQkcAKnZDOzbtEd+RrjhAYUY8ug4JSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240050

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index fa758cc21827..8aad2823e28a 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -579,6 +579,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_port_helper: get the in-port number of the helper device
+ * that is connected to the csdev.
+ *
+ * @csdev: csdev of the device that is connected to helper.
+ * @helper: csdev of the helper device.
+ *
+ * Return: port number upson success or -EINVAL for fail.
+ */
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper)
+{
+	struct coresight_platform_data *pdata = helper->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_port_helper);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..28ea4a216345 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -118,23 +118,6 @@ static int __ctcu_set_etr_traceid(struct coresight_device *csdev, u8 traceid, in
 	return 0;
 }
 
-/*
- * Searching the sink device from helper's view in case there are multiple helper devices
- * connected to the sink device.
- */
-static int ctcu_get_active_port(struct coresight_device *sink, struct coresight_device *helper)
-{
-	struct coresight_platform_data *pdata = helper->pdata;
-	int i;
-
-	for (i = 0; i < pdata->nr_inconns; ++i) {
-		if (pdata->in_conns[i]->src_dev == sink)
-			return pdata->in_conns[i]->dest_port;
-	}
-
-	return -EINVAL;
-}
-
 static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight_path *path,
 				bool enable)
 {
@@ -147,7 +130,7 @@ static int ctcu_set_etr_traceid(struct coresight_device *csdev, struct coresight
 		return -EINVAL;
 	}
 
-	port_num = ctcu_get_active_port(sink, csdev);
+	port_num = coresight_get_port_helper(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..07a5f03de81d 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_port_helper(struct coresight_device *csdev,
+			      struct coresight_device *helper);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);
-- 
2.34.1


