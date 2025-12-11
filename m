Return-Path: <linux-arm-msm+bounces-84981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D71CB4D70
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 07:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 846BA3015EC1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Dec 2025 06:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4BF280A52;
	Thu, 11 Dec 2025 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElMS7GCH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6gKAPJ/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3D22A4CC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765433499; cv=none; b=ASWCBPA/2cw4OSOG8MsVUwrzlw+X7L01PubS/C5ty59knNe0esxwldCmyxo6uc3DVlEk8LEg4bn3U62Yk5KgVbTGyPJ4j6pzT/GULgGvi97bCBs2vkAKvurW6/ApDxZjtYjM43hzEBH0U4ZcKUPvYCcLqKzxxuy9i/JAirV0Iik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765433499; c=relaxed/simple;
	bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F4AMbNAcrYmsAzW6RNdTaoUVP1zJhB3C4wv5MKXONAEMGyBKDg6dMw5kJWhjg630bXtvlmwuD2nDdB6tchCuJ1+aZvqt4yT/zHD5KZ1O3lRfYkWG7uzARaauiwlNo+KjkK7BnhtiS8TG0WJRXiVxW0vK5f8Dx/F8iUX9Jo5lc5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElMS7GCH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6gKAPJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BALRR503701309
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=; b=ElMS7GCH9V2NN20v
	UjfaBr6dwotk2cyymZgw6NjUcYo2cM8nlRKfmX/k3WNYZQuDmqedoB5d/WLmwxtv
	pMoOIvn4ULR6xU/DzBz+ntckwWzx5pAlPevjRMmFjvElWyeGs0Dfls33ExFOvRKo
	cLfed7IV4skiBnkbhpgglHc1kRcZyYLa4+Kix5fTqVqz0xHRTPTOsnfcDzo0czYZ
	g/QS81oHoND02CNnpZWznLN+d3YEI7Ji26Eweq20svagQg90vVbvco4l0peFphrg
	v7hyPJSEs3cF05gM9TmrhWgfkSn5UfzO2gNJNSMLyVDcBJT0Nur/vJnFyvmyuifS
	vKnBEA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aygsx17uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Dec 2025 06:11:36 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b80de683efso1058939b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 22:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765433496; x=1766038296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=L6gKAPJ/fTjVp8QbaqvzjoDk2pFsE9ENPKO/JFCuIYsKwRPJ6pYA0LNljx8FD/cQfp
         oU6QEfQ6o9VYgAGqwNpUjn0rjVJi4J+CQW8kI+XvKmmEfQPyOLllXM8JmDklxAmdmu5a
         1iXqeC9ghz0pLFOXj1fkgVI0llMlbNr13OfDoCQf/N4BWVb0TeCP6kp9PP/cZtiBYV1z
         vl2HySqXgDIblP2aAE4l7uFp55jvVXA8ragHmlhG8HUqPINflSaGSIs3PHBPGkwWu66Y
         sZc6Ek4OrnRF/N89VPI56nihwKqXzDwAq5qgq2Z9qFVmpU3sEeck4oBmplkVPOk1wWjr
         E0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765433496; x=1766038296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TjPxjq1G/MyM9wZuLe71IZ2aZxQ93j8UibxFtFmopSw=;
        b=HQ0sHpBqhuFTpLz1hwfq8WPQ3eRYpBPjEKFjszBR/tAKM2d9ulW2Ce16YdGdP9UPdp
         QEtbO86nY5aotbuqtt8AORfXCUAAvC9XmE08tgiTWZvIHlOp9exNEjBb63p4i1y0YDSE
         OXt4WRSvYIGS2xvZIuNBkNgX7ZV3pFP7iNzYrFo9RFTKnDEn5Pg2/PNVf8mdkccHg5+u
         g47vTXBPabAeO6R3RGbqJuGvNUtIPBEHrkvAnLVnStB2Ok/Hlrd5omD83hhc7NwBduH4
         KagiFkYNUu5ShtPM55CExN7o7pW6WyDRMZ2kvQrgcfKMHGXaXN9QBzFkXPvt7az+I2lA
         qBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW521M4UaJL+C96ajiCAJR5a9O3hdUHRx3OyMtP59Bwe6KwJ+/utcsG3vME9cVEmWBx3nxxXtHyJmgowt0J@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1MawIk0NQnNRNULs0Wbr12IHCyCWgfDUJb9l95bWQlZlHmY0B
	ZjFEDE1/pMfNtXlGggPYcyaqtoGb8fsjOjAp3uaCxIzaJq/Y1XQhWYVpeDiEpmUHnC6rPBWEEV2
	UgswHPJbth7bW8QtztW09knpc38hweVuTKxbC8qQR8FjjQLG0FhIQDPijk4GmckSydfdg
X-Gm-Gg: AY/fxX7gX2aaOAh/wMwLg7+iKZc1PnXx4PyAIW2Y44Uf6ym3+lPTbmIrreqUrUu3JCL
	RTiGuirM49UbZUdE0eD4rCHvZckt96nc2Oxm2Y3pLQhY7gG7QHelTx9ClHABdc7Q3Qb4ALwf4jb
	QCyA2U43tEeyN+CT8buZS7/CsiUBcwoedUnbXqTz1UtC1kQoUSteTNu5FFBaVMut871iWGrKQFZ
	PVpAp/4pqDYoL+mlg4u9ZDFS3fsDNRuu9RG0Tj1wA+a5+Qf4xs8ERHwTovM2QAn33i7AwM2DcVQ
	Xl84rMQnKUkTmVvWOpRzsJx24KXy8wjGJR/AkWG4PbKf+eqA6lxXG/3LhxeQmDDz7JFIXlQ4Sza
	9IHWtNrn0SC7WCtL5yjhaqE6oHM3fL6B5UaN8nkDuuGeBLRyz6cCqaRX5DqeP8npDTQyLcMNi
X-Received: by 2002:a05:6a20:2453:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-366e0de828dmr5308161637.19.1765433496083;
        Wed, 10 Dec 2025 22:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRbnY2BMcR/og395k0ubhGGjQJkENmpxSKjCoZ3XqllWWOS9akD1cLgbfkWaMN6h6ZrKAbmA==
X-Received: by 2002:a05:6a20:2453:b0:35f:6e12:1862 with SMTP id adf61e73a8af0-366e0de828dmr5308138637.19.1765433495590;
        Wed, 10 Dec 2025 22:11:35 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea065186sm11725945ad.89.2025.12.10.22.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 22:11:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 11 Dec 2025 14:10:40 +0800
Subject: [PATCH v8 1/8] coresight: core: Refactoring ctcu_get_active_port
 and make it generic
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251211-enable-byte-cntr-for-ctcu-v8-1-3e12ff313191@oss.qualcomm.com>
References: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
In-Reply-To: <20251211-enable-byte-cntr-for-ctcu-v8-0-3e12ff313191@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765433484; l=3769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=x79EOx0VHbHe/nWXls6UDtNS83yDuFtih92LzPbC2MY=;
 b=sagTWu5bEdNT35gpTyGdfKMRuJGqVH+fwNnNQgi3O6oNgG0bn+Zs93u6Acp8YFmnH/6Zcn2wW
 n77eva9bZwOCl4qhBVRZCRPUTa0lqxGR8cmgO3CQj+HsxQgciqmsfUj
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: CpH-wzPOaDJ29jqyNFzFj_SdedRSfX87
X-Authority-Analysis: v=2.4 cv=d974CBjE c=1 sm=1 tr=0 ts=693a6098 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=qQZ2XtAyJf2dEkEvaVsA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDA0MiBTYWx0ZWRfXx/UjOHntwvOJ
 IFn1ND0oNTLsa4G/sBPj2pFV2KcwVx5sFvfWSnaoBArHcdBVFkWEG54uRC/J3KMr2ANg2BsrVw8
 Y5H0XzKmSCHl9zbaqmV0FCfeVfj70Z6EhQHl6TpRglAXciguMY48VqP2NZDX/Mi3sh8gH9zEM4a
 O4uRxzn4gmca8W1HfS8cjlasBGuXwOAElHJozxXj4i5M+DDrPbZucMPviqF3htMzpDRmjaqcF2T
 wiSbMa/1tJXNU5XiOG7BWSVJq/XQd1gbQRRoARBUBPLw4B/yw9aoi9ni2fp0L7KaWucnYIlxHc6
 fLQEyi6HBw1G9G1G7PTkbR2SSTx1dbvLqQ0QInz+hAS6o04PF9wfjZuy5VdXTOjWKGKMElKrmRl
 wdnmdfIQExM5ecnPXaMA5g59g1VoOw==
X-Proofpoint-ORIG-GUID: CpH-wzPOaDJ29jqyNFzFj_SdedRSfX87
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-10_03,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512110042

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


