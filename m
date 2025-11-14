Return-Path: <linux-arm-msm+bounces-81791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BFBC5BB25
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 08:12:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 59F2235A337
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 07:12:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 751CB2F532C;
	Fri, 14 Nov 2025 07:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iWo8tPpy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GHfJ/QeO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDAF2F290B
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763104300; cv=none; b=skm0XB7KY4AWKcC6F6IO1xNFTsyU+dd17P0/DimVvdFyhS92BDC4vj7jeDouCnsqHjkBw5IpeTjCatWQbCMCxyRHudoYXQV3Ds1YNqfb6Yuz/5Rwz5wlaIqPIp6XriBhzsgI69TSULvq84rFiLXqknVCpQ9M6/+Ma4Lrv6465RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763104300; c=relaxed/simple;
	bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EuwHYLoM9AD5L+YqNnI6Sby+2Squng8oqJdblDiFozxTZKzjcV0L2W2UaVGPi8aPw1H2HsCXoZoOxPqtupYXO5i+TFPenyhHgau4pl84Nwlz5bigmlQIjNiid0wjtOn39BTBR1K/FwHqy3gxPNdTigAWb0AtX/aWYNgNiNQg6VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iWo8tPpy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GHfJ/QeO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaeTd1629387
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=; b=iWo8tPpytw0rplvR
	LuR6pB6gfyQ1QLkNfws0i3ptdnakpvBVi4+0DHckgsn9stuq2ahjAmbyVCT/2Fl+
	BF0YobNSJHOQtthmC3wrBxKSzAIqCIk39hVLctFrby3+gQNv8/AeRVDepMu1ZQ2p
	aRwwirmp1zce2ySEi0bDNalP/av08ILDDqVdSZeD1exTFeJNmuxQ4/R6mLpry37r
	IRFduY55mh1Epya3HefoRZXRJCuEC6GmqFTedxXOcJwaUokAQsUxxz9T91x9irsT
	n8Nx1tJ/ZRv495GfD6cuoEkjRqKr3ZBFbn0cBume7NZDUfAPUsf03X6+e5qCPwgG
	6UcWjA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9d97av-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 07:11:37 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-882485f2984so40818166d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 23:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763104296; x=1763709096; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=GHfJ/QeOQzD3+f+E8aUahVB2rIBs9ceHvpOD7DQDYYjBCYWwoivHjALVP+AFuT6K6i
         2gKo+y/+i1YYnU0xcpiqMiMXLOutcaogyPzGC7HdON4O2f7Bmc3j9nwhGC753KRkM1WD
         wFTbGLqfdyaaD0j/HgDYbO+7VX+XaOEa3pCXD82iHz1P1KQOZlbeHs+ulZy4HeRy+333
         US/SgqX4NtkQ4VAYL0K707oj/Ec7+kjsVjpGveqLYy02g/aOUgKLrcWEgZATgWHhYRMJ
         84FlikmRt7VdChIdd2tge1UMJxs7RH6lWoJkeXES2UvdkisS0JXwPbdHOkSTWxWTK6qy
         Rnog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763104296; x=1763709096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=P2cxNG02rqVbK6Xamryhmd9ntHtyFViQL5//XE2P+9U=;
        b=REX4e86oX/QvoTDx2Z+gnSu34xg61iWBxBCy7BmB/vd6WdHuAj5BI4fmosqNbraAOI
         8Gif+G1va0PWo4OYLMRQ/3lj5bNsbCzYs6pne8J27+ZxnxDMDOcA/MthFBrpYU9z0ull
         3KfKtRDXtADVRHpiiPvJv0D1HXofONIum86um0BKOeoOtmUK16yVZPnqeW7Rb4pFjfFP
         rif+Y4f+QsVMrCciy0HtzySM5XEHIAefMEyKaUyRmUu5pA2+jX3QGWLX6UE/dzvZSYLP
         E/hxdSuwvDE8Z7PGO9bEYQzWuyazg9ohvpQyKOSdvpZ5Uq1X7OtV8qek4bh1Rh6ffQQ6
         74OA==
X-Forwarded-Encrypted: i=1; AJvYcCVDAdxe+BUX0yCFqBL0LM33r1SnzKyBpqMK5DtktmXRdjapoRaW+F7ZYBjLaEt2lrVmLOX8ALWuwaUvszhx@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/DZpzuNAJqKqMoIC13EH8Fd4AZNQg4ZJmiA8b/9g60VIJ3lsW
	WBq66IovYwD5WIuuHoUqAi+pmAeZIlvzOUTaHMDFp1hDiLcJXPPaQVTsvw1oMXtK6tH8I1aZPDa
	WTrcW7aXqxjdNbvx56YrzfIwmilkTHBAaNeUUqev6sdIwfCNMH4Wd8/7RG2gLxQn2uq1l5aQWYS
	l5
X-Gm-Gg: ASbGncshS5rwLeaju0q/5YFbwK4SJmDyDHSTK6HNVyF00eLEr04Mpi7k7OJh1YJetG+
	CVAYjrUXeyOiOS2XxHJeK9yGhkgPnwZ0pDSMK/VqJ0syqFtnv4YC92fnCZgGbJBVt8F3oZ4PTHh
	Wr9gSNtviSjSt2Z39HivXrVe5so3NQ2QA9zILEsz0BhvcM746ekXGsXWkyMNWoV6zkmKTf359yY
	MyEjHqmdnZg0O3AzUV/5GRxvoxGwhbsu9hlwFxercn1eNDVOrwDpj5HoSEUebpdauaT6nPDjslA
	jjBqSZ/yO6M/ec8aqoLzoObAWeHTel2zwVjTYR+d06ELkki/Im0Hy0VP4LenGRgqg+8u1otjgAA
	O6azGzPA2+I/ne0fQwS/rSdprp8bwdO//kxBxzQt5m1FFlZ6ocCwNAV6eAImwc4Jh/g==
X-Received: by 2002:a05:6214:d8e:b0:7d2:e1e6:f79f with SMTP id 6a1803df08f44-88292698c76mr25592866d6.47.1763104296529;
        Thu, 13 Nov 2025 23:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsgG9pi01gCNpzs+G5nsmU/zFJkM5Z65NF6uhZctdBPeUne6WFTTsV8ipn9k95oGTPIxw96w==
X-Received: by 2002:a05:6214:d8e:b0:7d2:e1e6:f79f with SMTP id 6a1803df08f44-88292698c76mr25592626d6.47.1763104296007;
        Thu, 13 Nov 2025 23:11:36 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-882862ce056sm26336666d6.6.2025.11.13.23.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 23:11:35 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 15:11:19 +0800
Subject: [PATCH v6 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-camss_tpg-v6-2-38d3d9fbe339@oss.qualcomm.com>
References: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
In-Reply-To: <20251114-camss_tpg-v6-0-38d3d9fbe339@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763104282; l=7489;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=eTxcwVlzQOBnGz/0g5KnnF/PMqyyWhweSs9zLsLncSs=;
 b=VG9DEvoFjekbys0i/dppAAcGpLMs0589AKDsTcUihFaMmMbD2Vaquvasb2x4h3Mi+bP/G9HOX
 6HH5jFiE0ZVB9H2Y5qzOlCYTJbOFnG8yGYuIfOX35yvXmEF17wXfUb/
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: uyNXOTSEdzCMSpUmBPB8AM1t9iNqjvbi
X-Authority-Analysis: v=2.4 cv=Rdidyltv c=1 sm=1 tr=0 ts=6916d629 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: uyNXOTSEdzCMSpUmBPB8AM1t9iNqjvbi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1NSBTYWx0ZWRfX0g2+nZhF80FU
 8nExkKMd0BLwnbDRmTg2/6/6PcqLlgVbRUkbaz9us9ka2m4YPG81K0FPOXf/gTnySVKef21YUNh
 fnPkpK4bWK8Xavrup1cQLHWhj4HJFQUuVPHvEJqBh4PPGHf+LFBZ+uZgYYYB1LJ72VvtyKyddUg
 Hf/ypPlQ8AQbywBWQmi1Do+mxPV1RIZyPAREXURyuXrvUu3ey8hj2XZTm4eqrYbXpjnHfs6o7jy
 aiog/6Lx7krnNU6cYprA6M0Kf1FEdrKPItE1Uj8uZipdZc3pyxXTJNnvFJ1i6RjbxEfimJ4+cYO
 r9yHAF6A4Bym8sSmZ4RNpjCDcbJeeyeMFAKtgKrfYwB8LqCRGoLvI9unuX4XJNTbYLz2FCgUvm1
 orv3ssuKL6T3ywDqsV0uxThC5raJQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140055

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 43 ++++++++++++------
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 55 ++++++++++++++++++++++++
 4 files changed, 87 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..aea3267289ff887330480fddf3f8e35d9dda69e0 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -35,6 +35,8 @@
 #define		HW_VERSION_REVISION	16
 #define		HW_VERSION_GENERATION	28
 
+#define LANE_CFG_BITWIDTH 4
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -1227,18 +1229,22 @@ void msm_csid_get_csid_id(struct media_entity *entity, u8 *id)
 }
 
 /*
- * csid_get_lane_assign - Calculate CSI2 lane assign configuration parameter
- * @lane_cfg - CSI2 lane configuration
+ * csid_get_lane_assign - Calculate lane assign by csiphy/tpg lane num
+ * @num: lane num
+ * @pos_array: Array of lane positions
  *
  * Return lane assign
  */
-static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg)
+static u32 csid_get_lane_assign(struct csiphy_lanes_cfg *lane_cfg, int num_lanes)
 {
 	u32 lane_assign = 0;
+	int pos;
 	int i;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_assign |= lane_cfg->data[i].pos << (i * 4);
+	for (i = 0; i < num_lanes; i++) {
+		pos = lane_cfg ? lane_cfg->data[i].pos : i;
+		lane_assign |= pos << (i * LANE_CFG_BITWIDTH);
+	}
 
 	return lane_assign;
 }
@@ -1266,6 +1272,7 @@ static int csid_link_setup(struct media_entity *entity,
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
+		struct tpg_device *tpg;
 
 		sd = media_entity_to_v4l2_subdev(entity);
 		csid = v4l2_get_subdevdata(sd);
@@ -1277,18 +1284,26 @@ static int csid_link_setup(struct media_entity *entity,
 			return -EBUSY;
 
 		sd = media_entity_to_v4l2_subdev(remote->entity);
-		csiphy = v4l2_get_subdevdata(sd);
+		if (sd->grp_id == TPG_GUP_ID) {
+			tpg = v4l2_get_subdevdata(sd);
 
-		/* If a sensor is not linked to CSIPHY */
-		/* do no allow a link from CSIPHY to CSID */
-		if (!csiphy->cfg.csi2)
-			return -EPERM;
+			csid->phy.lane_cnt = tpg->res->lane_cnt;
+			csid->phy.csiphy_id = tpg->id;
+			csid->phy.lane_assign = csid_get_lane_assign(NULL, csid->phy.lane_cnt);
+		} else {
+			csiphy = v4l2_get_subdevdata(sd);
 
-		csid->phy.csiphy_id = csiphy->id;
+			/* If a sensor is not linked to CSIPHY */
+			/* do no allow a link from CSIPHY to CSID */
+			if (!csiphy->cfg.csi2)
+				return -EPERM;
 
-		lane_cfg = &csiphy->cfg.csi2->lane_cfg;
-		csid->phy.lane_cnt = lane_cfg->num_data;
-		csid->phy.lane_assign = csid_get_lane_assign(lane_cfg);
+			csid->phy.csiphy_id = csiphy->id;
+
+			lane_cfg = &csiphy->cfg.csi2->lane_cfg;
+			csid->phy.lane_cnt = lane_cfg->num_data;
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg, lane_cfg->num_data);
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index a734fb7dde0a492cf6e33f53e379557665d54f64..c15990d9d09cc8f9960729bdc112d81751b4938c 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -800,6 +800,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
+	sd->grp_id = CSIPHY_GUP_ID;
 	v4l2_set_subdevdata(sd, csiphy);
 
 	ret = csiphy_init_formats(sd, NULL);
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 895f80003c441dcacf98435f91567f90afa29279..b7bcf2bdd2124f77b5354b15b33aa1e0983143e8 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -21,6 +21,8 @@
 #define MSM_CSIPHY_PAD_SRC 1
 #define MSM_CSIPHY_PADS_NUM 2
 
+#define CSIPHY_GUP_ID 1
+
 struct csiphy_lane {
 	u8 pos;
 	u8 pol;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fcc2b2c3cba076e598bc8aacd34efce5d71713ca..43fdcb9af101ef34b118035ca9c68757b66118df 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4145,6 +4145,19 @@ static int camss_init_subdevices(struct camss *camss)
 		}
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_subdev_init(camss, &camss->tpg[i],
+						  &res->tpg_res[i], i);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to init tpg%d sub-device: %d\n",
+					i, ret);
+				return ret;
+			}
+		}
+	}
+
 	/* note: SM8250 requires VFE to be initialized before CSID */
 	for (i = 0; i < camss->res->vfe_num; i++) {
 		ret = msm_vfe_subdev_init(camss, &camss->vfe[i],
@@ -4233,6 +4246,23 @@ static int camss_link_entities(struct camss *camss)
 		}
 	}
 
+	for (i = 0; i < camss->res->tpg_num; i++) {
+		for (j = 0; j < camss->res->csid_num; j++) {
+			ret = media_create_pad_link(&camss->tpg[i].subdev.entity,
+						    MSM_TPG_PAD_SRC,
+						    &camss->csid[j].subdev.entity,
+						    MSM_CSID_PAD_SINK,
+						    0);
+			if (ret < 0) {
+				camss_link_err(camss,
+					       camss->tpg[i].subdev.entity.name,
+					       camss->csid[j].subdev.entity.name,
+					       ret);
+				return ret;
+			}
+		}
+	}
+
 	if (camss->ispif) {
 		for (i = 0; i < camss->res->csid_num; i++) {
 			for (j = 0; j < camss->ispif->line_num; j++) {
@@ -4337,6 +4367,19 @@ static int camss_register_entities(struct camss *camss)
 		}
 	}
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++) {
+			ret = msm_tpg_register_entity(&camss->tpg[i],
+						      &camss->v4l2_dev);
+			if (ret < 0) {
+				dev_err(camss->dev,
+					"Failed to register tpg%d entity: %d\n",
+					i, ret);
+				goto err_reg_tpg;
+			}
+		}
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++) {
 		ret = msm_csid_register_entity(&camss->csid[i],
 					       &camss->v4l2_dev);
@@ -4380,6 +4423,13 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	if (camss->tpg) {
+		for (i--; i >= 0; i--)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -4401,6 +4451,11 @@ static void camss_unregister_entities(struct camss *camss)
 	for (i = 0; i < camss->res->csiphy_num; i++)
 		msm_csiphy_unregister_entity(&camss->csiphy[i]);
 
+	if (camss->tpg) {
+		for (i = 0; i < camss->res->tpg_num; i++)
+			msm_tpg_unregister_entity(&camss->tpg[i]);
+	}
+
 	for (i = 0; i < camss->res->csid_num; i++)
 		msm_csid_unregister_entity(&camss->csid[i]);
 

-- 
2.34.1


