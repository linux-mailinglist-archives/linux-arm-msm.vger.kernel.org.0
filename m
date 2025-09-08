Return-Path: <linux-arm-msm+bounces-72455-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1029AB48259
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 04:02:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E284C189CF29
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 02:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833F71E25EF;
	Mon,  8 Sep 2025 02:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HsBIkjfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C4C1DF73C
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 02:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757296956; cv=none; b=mrIRktNcPXKnjQn+Rav/1YSByp62sOhbQBH0dm12N+TWbwekSYGSdeXvUADcUYjah5Enq/AFsnNFGUs/FbcxSyxTs8CwNTwo1J9IHpBpui04msCSnBGuZrdLt2EqLtGDUCfFWgbicNpuwhvm3M0y6Jr1Q8L51AT/EYBJIrGfnJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757296956; c=relaxed/simple;
	bh=qzd5gVviJkuX4BcigfW/YZdkjwAG5WVRtPg9BE+cAXU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n/DOvPUlfz2i32N2jVVMTC6C0Jo8XFRUd5lS4pGS/iHG5yKdGxYXXQRSJdA6/DXzX82Krog1tvMAhHpVyl+Zg0cEckTxqRk+62YpKoyMusg1/2yw50De47CM9VSexMaPAYnAjKcfEO3xHPzDE8t5oP0Pt/feg8OG2CKQpJG4yAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HsBIkjfb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587M0WJd012105
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 02:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOGihsR+2JZnyd1bIX/cqtdxz8sWBUYderONs+SBjZg=; b=HsBIkjfba6BrFK9M
	f5PrcVXbEMYws3OZNAZ87xm3/12htmJF0CGZRkMWVLzvL7nzYxIpjOh/PQr6WnDQ
	QsMbsb135aTucZQs0E/+MxyaH2n12aksuZOOBlFv3SPRvGMusLOK39MLgUpcQ3Sz
	e5T386OWYWh1Yl70qr9lTXkcSOUaejPaFcpG9RS13wljN35uLA4IpZUUBLk8f23l
	Y3IU396HfTLLlAqKeUstybDF4jZcgV3/xQmm5opt2TmqX8YLPex3g2mTvS3T8zvv
	0xF9y3z3+6iqq3prb/Ne0yhlek2RR4b1iqePOjYXF2276a5OKRELxSK3Uwnwau8W
	W9M5tw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapb5dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 02:02:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-244581ce13aso83738935ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 19:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296952; x=1757901752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOGihsR+2JZnyd1bIX/cqtdxz8sWBUYderONs+SBjZg=;
        b=KPTlr+XsoDqqYknQbR6TaWrRdGtYZ498vDeLEfZvKrGTMrph2WE1udC0JKZOfaf6z6
         qQM6U+ongeNf2rjL2SoWhwpkaC2LOV7SrWksx+nNdM/83IZkz2Kt944IgMweGm7nHTq+
         WLvEIZLwQgXBFwj4XKqFrHf/cQayqcAht0m3sP81pXMr58P1S/3m/+P+CvDI39zyCRIx
         GfkIvqdoc1KfddExw6DoTy7mOnuCm/b6RnorLTHiTeA0PzNffqU9gfKyAgRvoRnyExkJ
         aXAV/9nBaW47+iayWQ5JYNb4RB4jPhme7JywMTtXGamOixvVTEHu9ZiTJQ/2anE6Y7ry
         ZElw==
X-Forwarded-Encrypted: i=1; AJvYcCWnd2dH03CRqleAItgl16BIJNFysJ2WSxLiAaY5pz2fZGXi4qCMdufSCcfmUIi3hWRkI6uYylmMCXrez2NT@vger.kernel.org
X-Gm-Message-State: AOJu0YwUAsD1hmUNd2fPv86mHGcrWxbenfmrh4rHdQrQrWUEd2CBO8r1
	e3qIDQ7pw1aYhB/395GvLiDlR4H8xA7l7W6EObZgR31bKwOGEDU6Q4SevsT6uKb0xeaZKjm/1VK
	2N5LufOQAdqDKeaoaCNYhwLC9FdNcrhJfsZjrgC9lu+bKLVeZ4c94R95ODrZmo9gDO60X
X-Gm-Gg: ASbGnctOHlBsNqWWKsjAQEfeRNUoHgzcQiwU4w6hMh3r1BtdR2gaufQjgcA58evCzKr
	jHiNRrnYdZ3vpKzQa1ZvWinimBf+tVCVYgz1jeqDxggndnDRnp6QF3lIeCO6gx1iD/f4kvhhLzH
	H4ZN1c+8BmE4Dz3M3xInQ9nEiwaYMZTf+1Y3e5KIYYmsycshUnfWftE5XAk2vWb3eoL/RK64Ssd
	eO4kFw9UPbI7/V9+lZ+8xT0EyVdRS+6EAXLNe2vceGC9CySuq40HnIG3YNMhC+1/upBYmX93cKT
	R9HSSeuOl0r3q9PbVEW3pwbhx1LH7d8uVbYcCtRncmoV/921I6GjrClAC9peFQ7fuopYsTBlcWk
	M6JgxIk9T+wjgS7YjlqUZwCCkw18=
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr80558845ad.42.1757296952409;
        Sun, 07 Sep 2025 19:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEPMBDMwU4ZeTYAGNAbVmG2Eswoq+QPv2lxOCPjVREgO/b1eKZg4RlBnYo9ANXpCxNn+uZ6Q==
X-Received: by 2002:a17:902:f549:b0:24e:e5c9:ecfd with SMTP id d9443c01a7336-251728629c4mr80557685ad.42.1757296951163;
        Sun, 07 Sep 2025 19:02:31 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:53 +0800
Subject: [PATCH v6 1/9] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-1-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=3773;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=qzd5gVviJkuX4BcigfW/YZdkjwAG5WVRtPg9BE+cAXU=;
 b=D0xPJj+TDYxZODNsXVWs49Rwgvy06gQZ21co8dTaDv+o6EHqbig8HL8glyKgk99jan8igO+zi
 8TViphBaah7BKBeEaTX3CM8ekMKd1bM/McOqMljiaqCMiW5jrdeW3PM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68be3939 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: kTON3ozcRCRDn9YbNHDKgbhreEiorRw8
X-Proofpoint-ORIG-GUID: kTON3ozcRCRDn9YbNHDKgbhreEiorRw8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX1Twt6T6NW8wM
 vdWXUYnpBSDX6HgFjkZYCUMEhI9MW6XaycEbBosmRTVBRqjG+HJi/BYWim9sWQFtNvkAuKxe4Qz
 FK4CjIW9Kw6DSRGU78P97eZxYOKuppeE4C5wpsBCTc0c5+l+XRzmBvUmzxek78wA21zI+tOk9OL
 9/9MgL2R6LrBmpKKHd5D4u+bOKJI6RsI4zCGKMrUNRfyfY9JzbDx/gCyg5IuHo11dWu41eeDqYA
 blvL66/iG+/JAuvgkVMAbF/9TEy/mIsiDpz6PI3SQTSSgr7ENAE8ip4MWzyp6SzOSbuWk0YQjvo
 Zu58ydQDbBKFR6qlZ4D6tm0926k12jHpljIjZqNROS+wmabOJd/PQURKF0G30W/+EWPchEEBprJ
 WWt9sevi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c      | 24 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 19 +-----------------
 drivers/hwtracing/coresight/coresight-priv.h      |  2 ++
 3 files changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 1accd7cbd54b..042c4fa39e55 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -580,6 +580,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port_dest: get the in-port number of the dest device
+ * that is connected to the src device.
+ *
+ * @src: csdev of the source device.
+ * @dest: csdev of the destination device.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest)
+{
+	struct coresight_platform_data *pdata = dest->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == src)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port_dest);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index c6bafc96db96..3bdedf041390 100644
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
+	port_num = coresight_get_in_port_dest(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index 33e22b1ba043..e51b22b8ebde 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -156,6 +156,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port_dest(struct coresight_device *src,
+			       struct coresight_device *dest);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


