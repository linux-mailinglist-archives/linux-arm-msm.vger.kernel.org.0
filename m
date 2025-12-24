Return-Path: <linux-arm-msm+bounces-86512-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC2CDBBEA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:07:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E1BB2301135F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:07:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F23232FA10;
	Wed, 24 Dec 2025 09:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDscumjd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PrAFx0+j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA35732FA22
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766567230; cv=none; b=Zj/G5OQdEvXmTq6slVZHqVxn5lJFz1vD5pxCXaBLYY2vYNEm4HZRJjDmPjB4DVbwtmE0nohMDAkILAs6JAJ8aSd3/Oi7mBOkcQM/tPR6qcs2uQ1Lj1sqmrwkdcGTRj+F5dLfCJ07cFI8Mk6B5LqqVHzcGpuolSJpPeYHpjFbsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766567230; c=relaxed/simple;
	bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CWYhCa9sw9x3FetKfmN49AIczoYbm0ZvakhFupyMfMS8eIkD4WJVOqKGQHZecOoEQYdehm/Qwk2kkvINjEIGw0y40FvYIMtB57HPq8EmboZFLKXm2FytFhQY+P9zOeNNVYtrXLg5OMCw3cDkMkCPyzACSegsCk+siuIrVAyMd4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDscumjd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PrAFx0+j; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO26Wx5461408
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=XDscumjdhCvlQT0G
	q/9wE09bSUcmwIuE36rs2C8PAN+c2FqQGvH5yPCoK7Joxyw7LiB6wnNw/XiQyszL
	zIiQLONjVDYIqKe3I4DerP76VUks8T+Ass1tJAeCHoQLPDPPk4T9HHdW5PavM5tP
	IVdtHwplSEnwect+0F9iZqLWORvzi0j4RFOQBTGi7s5D28xrZf3Td37e5E3bdXoW
	tiR+mTJfPfynHIIX0XKKHKJYrnbX+VdpLjeBzc7hCAQDlm7RqtzwguAsiwXcNwkF
	FkTuONKTrRzHgseEoMFFG/Q3usNstR+OhI33uItnb/vC5/RZbh0XkxcXvS/HNfAp
	D8KHIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftqaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:07:07 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0dabc192eso128270105ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:07:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567227; x=1767172027; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=PrAFx0+jIw1dECwVwE7YV3gzg1AQo3d1fIra5zx7q/XAb88Agp1l/dcGMKqJVfZvfE
         7Mv3OShwtk/JsoxSiZI0+Nth5FeWZv1BUkRGLDrD2YrzBUKpZPjvpCrnQ1K0c+Kxx+rt
         VFvbXkFRz09VWT7yIoEQW3piYSqZmpGQPeCOzkZSYQKfY79RBxzkjyaRdMDPHJbTkuMI
         ruNPLcwUFRekK7p53fDVCGCCzBz84BZkmZPiFBeSKOIU6yVWCCvteZ0BKfyBD99LJQ6N
         6GCXnOXskQiXBJEp+p33mTDNkFxg610sxba6F+KdIa6JTZIK4uACI6D4Ghrb9JuJ0B3g
         KltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567227; x=1767172027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=LEP0qkjnxpCwRpNMyH/B2j1o3KlAYgspH9oukkHQQMkE243pu681ByErp7mH4VrICA
         chSGN4Jnk/kONDTkYfZ+e5x0iH1J8rJSVlORbF/e2d+YXlHT0L+1XGJmkyPdX7nocE/2
         rniigfPPY+cBDDjr6GStkJIjmIjVxvdcx9QvajDXRzqEpFt4bztQ7h1TSXq9ai7bZrm2
         H4prsgxdnkxg+U7sLqP9AS23CBNWfUlCUJWBWVpgD9Dxqgu8CmGsfrJ8t785ggsRnho5
         3ZJHToYYH5rrnuVUJN8NNr+0oTLMMKWLa4K+7C6b1qc588DGjS3b6FDExsYKpN7aThNE
         WVPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqanQNdhPeZE1VrKXyjihFcmw4S7oNMX/BIZDG3cUut9NXtGiCYgshI/p3Q6QsqlQbhCy89ryhjIrlpJBH@vger.kernel.org
X-Gm-Message-State: AOJu0YwMGIQczgXm1DRcq/4aJ0W6eWed9aLI7G3N7PvrVjjJvLwjwZae
	2RdxEqgLV738Jh8s/5lyb6yLuRea12SqNQV5OQD1NZxsH5a64r7JwZ43eFhZUVwYKFA93ko3tEG
	p0gl6hB9ujZBohkOGxTF9iP0lh+HRg7tnteBNT0WCaHWRi+bC8MWX1kbGnii13LGvAOhp
X-Gm-Gg: AY/fxX5tVv3R/VlrlKeduzqVjWpwWXrzamNAnqzFZwE8M7vV7BmTJ8gk1do7gZTcYiM
	lJArxRd8XnoAMzf0PotqxRDQdEPj2a4lcf49U70K9LZh58JtcJHhxvJz/zth1h26rnMJ4IntOxz
	Rx0SdjOedF3noJBNOMiQR3iVE7rppD9TNGO/VYULpUrD+cNAuZWjHwcx4ohSR1rQ43fJ6H6+O8U
	240Dx3er61Q9cj5XEVYt3qPw0qQ3Nms8GsANfNV6CTLWJNYFnsBX7pM5GxcPvWCROppoPpqid0W
	zRTu2AA39/Jh51ijLbQSz1KgbfdawwFvPJclM2qRAH5q3v7ijpmd4vWDYq4JX8bIx+5moByS/0Y
	AQvRneQuwEoKgl3z5FUttak6TAx6zNs48uc4+tH3KFlSuPUssp+10Oiatz7j08W2w8pLneS3P
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr127686845ad.51.1766567226991;
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHUOmvjkE5jwGJCb1wUcNBlhuAbPgrp6XJATw6fq12VDVQFcyEJstSLNscyietWEtLwkYnlwA==
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr127686615ad.51.1766567226479;
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:11 +0800
Subject: [PATCH v9 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-1-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=3769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
 b=Ah6yDC0yixoVi0q8wSVIKghtnnoYfvtBJTeVvk+aonsv3NXB7C4bH8t4+1K3l/vrrufgWoUar
 EQUzPjule/GCEB4sXHar2a67gpPHVoCFrE9le94DD2JN/ELf3ckIfg8
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: 5cpM_uzwv9mPIhMYvtcYtOWk2oei8FER
X-Proofpoint-ORIG-GUID: 5cpM_uzwv9mPIhMYvtcYtOWk2oei8FER
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bad3b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX8ZX26P6b0hYd
 QYMou058rq++jhHJAAy2Uv2D4ZhIniPOPOOeNz/8fMJS4Fl2ub/ncVGghvW35+N8nyEPVC2rotr
 S8RFw+Pv6zGvIbJ1BZey9J28f0BtCoFpL0jOnTtGQomf7ZIVOCBhJOwtPt8rO3T1SncVGxi/Gge
 rxCRaQZlQOxSl5Ep2w0aPfAzfCniTTUbm76KpBbvgr1GAW/ImQOFjH5e+OWzyIPLtHjnlhSvASo
 oYcO0bA6x0CnfxDHqagzXXOcldHwL1n8F/f/isms9SKulUKOrj047F70C12gXEUmzS+SsGJ90lP
 /je8v2lVP0Qb1c8sxSHfyc6m9W8DbCuUI7Z9zO5BtU6dMILOoqI4upqbvPCXF7bqfpc24RYz8dD
 APKbiLNN4nNMHu+lc4pOZvzPNAXW6QjHA3Sg1hYO6k4bHVJ2S2Ci/aq+mEvXhC5QqdpqVYg8Owk
 Eb0L86Qrcn90z31xhqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240078

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
index c660cf8adb1c..0e8448784c62 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -585,6 +585,30 @@ struct coresight_device *coresight_get_sink(struct coresight_path *path)
 }
 EXPORT_SYMBOL_GPL(coresight_get_sink);
 
+/**
+ * coresight_get_in_port: Find the input port number at @csdev where a @remote
+ * device is connected to.
+ *
+ * @csdev: csdev of the device.
+ * @remote: csdev of the remote device which is connected to @csdev.
+ *
+ * Return: port number upon success or -EINVAL for fail.
+ */
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote)
+{
+	struct coresight_platform_data *pdata = remote->pdata;
+	int i;
+
+	for (i = 0; i < pdata->nr_inconns; ++i) {
+		if (pdata->in_conns[i]->src_dev == csdev)
+			return pdata->in_conns[i]->dest_port;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(coresight_get_in_port);
+
 u32 coresight_get_sink_id(struct coresight_device *csdev)
 {
 	if (!csdev->ea)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index abed15eb72b4..78be783b3cb2 100644
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
+	port_num = coresight_get_in_port(sink, csdev);
 	if (port_num < 0)
 		return -EINVAL;
 
diff --git a/drivers/hwtracing/coresight/coresight-priv.h b/drivers/hwtracing/coresight/coresight-priv.h
index fd896ac07942..cbf80b83e5ce 100644
--- a/drivers/hwtracing/coresight/coresight-priv.h
+++ b/drivers/hwtracing/coresight/coresight-priv.h
@@ -155,6 +155,8 @@ void coresight_remove_links(struct coresight_device *orig,
 u32 coresight_get_sink_id(struct coresight_device *csdev);
 void coresight_path_assign_trace_id(struct coresight_path *path,
 				   enum cs_mode mode);
+int coresight_get_in_port(struct coresight_device *csdev,
+			  struct coresight_device *remote);
 
 #if IS_ENABLED(CONFIG_CORESIGHT_SOURCE_ETM3X)
 int etm_readl_cp14(u32 off, unsigned int *val);

-- 
2.34.1


