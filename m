Return-Path: <linux-arm-msm+bounces-68692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE52B22191
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 10:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD91C565E2D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 08:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A925D2E0B6D;
	Tue, 12 Aug 2025 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJKin4ld"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A262E8DE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987867; cv=none; b=MfDpZqyhxgFpnPqN2fV6jXtCmlURLTEKa4fn5EOk6t0hWttVUTpyuqlNtQaQMs7b7xc+yMcFqkfAVHPFdxLGREEohWPWnrNgmjX2OOs23+PuzIlm0k1JSi7ad2hnV+DolbmYio9lDC/nLBeAVLcfnWHq7pYu1u8SnMhzlfhdbUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987867; c=relaxed/simple;
	bh=xtxhewrRdxb/X3PMc7wN8egXSrqwQkWhSbTXQL2ZeWY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ifgoiDV3hDiPbQGuoUg0kwzXofTBNXDH/z7quhyfbmoddmlp7ZDRBMp1oAabujv+LlWMNEI6ssL1mGLRBT24dhBQ0I6ARUb0ayZyxlG2hbyN1j/cb7vRSE+8VeKx86E2b8NaxaHP+2NpGynyrTIGlomFcB5uGOnZayT6FA8aFzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJKin4ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5YBhH018331
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=riURT7yHCOP
	Zx38hIetmNcrk/xUqPrSJU9dLdU0LRDM=; b=GJKin4ldmrNMZD8zcr+1NHBAgdz
	//9AbRH4PQBcUZ9fxecK3iWVCNevMsUQte/Wa19fuvpNErwbWvdgEdtGLkJJ54AP
	6QAeJ7nuYET1jC7bT8urMGONOZ58wRSdeD5+WG1RoAnOrjryp5hdW5hQjFBiigWi
	sKtkF8ut80Y0AWUkhzTVbfSnQAkAhlYaFeDwx5ZKv2EBmFoVTA4DiOVa7FeSC1pE
	0mnzbdi8Xag38oKA/LfJenvYvulhigEPEVQtvUjuaoXUuKadvy5UoGYs/Oje5b+s
	1SYOGRR8kkdaPM45dusXOyT9nW/nzbU6MYQRYCbjs+VqwR6xjGCpurrsN8Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g7cmy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 08:37:45 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2fa1a84566so4552112a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 01:37:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987864; x=1755592664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=riURT7yHCOPZx38hIetmNcrk/xUqPrSJU9dLdU0LRDM=;
        b=fT6rXw/1mtQc7HHwy1TgDEjwQ9MTZyDUFQ39F2QLAGx7DSZ01kkp7zCI49eRLd7zlx
         xx5GZscbvyWbY2XXlI9ZR0GQ42CC6ZgHVh5flxU+lMGpPhJA8SIo9ehAmbc62wKniJNb
         WPhIEL/xIJh2/IyqNS31qV+Dmip7frz7U/a/J3BQ0ZtGhiXjHak3gHMcgqklzj0MpN3M
         ZXJd4ztVokSpR2asphR5u0GwyMKuIBjvXqc6urss+0IqP+HeFhQl4MFRcJ9bpqbcSCq3
         ZmpZMPEl7CVbH3UUJ37DRjxR8EHwfnmL5a9kBGD2RyhcrciPw553YZmi9AQwflDY8oee
         nAcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq4CtvpXZ06Ip40jlxLTBGswDtNLx0jDMU+DlKnIa04Jj8eqb9wcyRiAVviabF6SxICH0Ou9+plk3SW4dT@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ntAsi5JABzCtEkXix+yb+JzCQ/moD7cg8bB8+YnzyA4FJwQT
	h+hSlgnbDjDeTf895STJ1W/vDCq0BuHolI5IAml86bv6jDxZFKXXSk9hkDMI8kbFJOhc3urX1aL
	KzcVrYahD58Oui5lOiUib1KQHyjB4tstWVZTd8h7XAFpuXnsE8f/nxtYW91PLiQ1kGR55IGNAoK
	fnrk8=
X-Gm-Gg: ASbGnctxqZeChGMxQOE8IsaRAjOHSUdP4UHR6VhohWhp1cHg+EWuC1igOeGHZdN3NgH
	caNxcqxqweST9gBenIHRWzjA24sk6P4b/+QJ7TvboZ8PXPQ/r/Kgysa9cvCIiYzHN6QKohTRLOF
	zvTtZTF9NOWEJ+V+APp6ZXyChUOFr+mJQDdoRTWrBwUg6v3E/RYexVz7sWAfm5OyMvVZbied8Na
	mYgcwcBY/iX1I23XZMjTIpJ2byPumO6ExYy2JsTb2kPf3c6o1QiuLOPqgaXS7L+8pZGwIOMin61
	1H9fIYm11VeiPHZmkyriCroV4a1nTfXKHBIJsZjOUZUMLevzqfEhx3Q23MgC9SRfxe0AjFQirFV
	sZCo+HfTL5qBvT38tleo=
X-Received: by 2002:a17:902:e74f:b0:240:11be:4dd3 with SMTP id d9443c01a7336-242fc230cd9mr37045645ad.3.1754987863939;
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5dAbW2Log0v6AuB3l+T7D5XFDndUH0k2jF1NznPuDRg5AqrmtsIfJngtinh2TBDJFxMffEA==
X-Received: by 2002:a17:902:e74f:b0:240:11be:4dd3 with SMTP id d9443c01a7336-242fc230cd9mr37045195ad.3.1754987863460;
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:43 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 1/9] coresight: core: Refactoring ctcu_get_active_port and make it generic
Date: Tue, 12 Aug 2025 16:37:23 +0800
Message-Id: <20250812083731.549-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689afd59 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=UMME_An3wchvczm7DuYA:9
 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfXx480flK5XQ1P
 fPXBftDAtrg4H/QvJboPptoM3ZdVnYWLRRlzsqk/STGeeVpWWoRw9/A1F/iV5zcqADCB0LQ4bd/
 nocv5x8Tl4MQ6WhF3CmRnxvdcvj/wwcgQVBfntn9Ndhp9p6s3UnIlMd0yOfPZFB0JwReXZtDujE
 W62rEvXTL85XkYL45uLVjoGmxDF0+TLNqFMb5GavI9BbgyW3HzhjYgD5iiWwil7KC9j/VxtLXjz
 8kvosUkIsAreLOfBgESV2qKq3DxVWHn6IlNu16gXXGobELMmjrjO3boVCaxOfc8HChwARPrevvE
 JfdQYeR5w23Qv4fcWLSOHDuvmOkzi+e0p8GA0Me0riwsnnxUsHQ0tnwAPC36eX/q3ZH9LVAvPSm
 4AmIW2+L
X-Proofpoint-GUID: 7a2Kpm_FESr-k8W5Pe7R_Czqca_FLwEk
X-Proofpoint-ORIG-GUID: 7a2Kpm_FESr-k8W5Pe7R_Czqca_FLwEk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031

Remove ctcu_get_active_port from CTCU module and add it to the core
framework.

The port number is crucial for the CTCU device to identify which ETR
it serves. With the port number we can correctly get required parameters
of the CTCU device in TMC module.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c  | 24 +++++++++++++++++++
 .../hwtracing/coresight/coresight-ctcu-core.c | 19 +--------------
 drivers/hwtracing/coresight/coresight-priv.h  |  2 ++
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


