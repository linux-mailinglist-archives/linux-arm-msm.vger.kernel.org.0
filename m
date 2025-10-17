Return-Path: <linux-arm-msm+bounces-77679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3515BE65CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 07:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E989587B07
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 05:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9323C30EF90;
	Fri, 17 Oct 2025 05:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHiQ2Fo2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB87030E844
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760677582; cv=none; b=gT6uoaCrr7mTbyb5hc483E/cMYUJ51AifGFlkZGakYO7TXmcfGPUtBjfrcVcI8b1clo4ZVH6/N3VR2VARKgMiVOkgbc8NVuc8fgS52YSwgNCq8SBiTOXFaBKIlWSVhR2A7zt0rZHrWn1rx3I0BwCPb8IxXHmzrDF4ViJ3uKinCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760677582; c=relaxed/simple;
	bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RP7mtIvbs9m8w9Ov/GjuBghUxIy7MfRyvZUarnth6ct3ohbjTKbZd28yeGCeuHegMWJBtnnt82KCqiTpBTgqAmjndX9HCxVl7xZULZjacrib/f0wLE67oQ++EB3jqUWiq2t0OjtXWUJM0cmdoEWdxLl4mZHECmURqvoIblSuFjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHiQ2Fo2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59GKLRvs016175
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=; b=cHiQ2Fo2xS7+oPKa
	NY5FJacszjQdOVgS44VvvuEy8IfPAPINeNIkQnehgP0b9mQvuOLO1aR9cvOR6V4T
	nyhPm60JdrtHIV58I1hTZ1JNkhOFLjF3ZHhQZgenA2n+HzXJFxkAxYzKhO4L3QfC
	gl2Rn+7bC4BGqrc5Fuu8DWyTRYHKNjaNkLMTztNGH6Vw1weQ8fVoG3IC5rw3nZ36
	Uu1DndDm+6qPpu3aVSr1ffWX4t3Eq9z0Qbkr2+/vnPszVLniFf13XPIkMI+jiozI
	6d7uwrbrNCAr/oAPxaBQpXaELCtbsqPhCBs/wzKHHHzd/fza5TALc5kuskqPQ4KD
	S2dg9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5u29e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 05:06:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8910b0fb780so24223685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Oct 2025 22:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760677578; x=1761282378;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25vQWjik0NkorLXRn5b4wPZ1S82r4D/v+C/waXiEV9Q=;
        b=DHM/glWMCVEl0fP4d/sKOWsorhpyLYX66kRZsPJptJqeVHUp9KMh4N7E5sgHtjuMmd
         4YApveeCEFIXABfp5BEUxuERPD+P7CoZ+qvDoMhuXmQ87GWw9VJ/viYs8ZDbGy8WBYWk
         GOitedWsrexshvwAabAt7bSIBL6cz2AhotQKCQACUm8IFHLOrXstmZzAVGBXIgfML5tU
         GgF3/3rg2sI8tsIQw1co4AYQ0MU0BouFngr0sdZ6v1ta++f5wQJVCLurh8A9rewqY9xu
         m43yeAKxmyAKcnAb8vau6An4g7vbcr+49iJ+oBjEhp0H2yai35736Mqcl9q+HV4EVLm6
         LiBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp7TxueyzMiG++4n6LNAjsLEJ0egRG9fUOpaDlCB6JZew0iSWDbRMipKV+7JcMDCkAFSZEN0ia0tqFP1pN@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+YKECo9mBb52UZzOg3taG3jFeXvmTgEMC66LTBcmCAbZkpXXV
	AFW+NOz3RUIoXT0bCvh5U2tnHA/X4ibdcWVf0IkAGAiXZwah6IzOQ5CN6UpzK4L8ZW63jYTVvO2
	e5GvtsO9GdvgM3kMlUzUNKJDA4s6K9owE7+huPqNaqbqqMQ5k8w+CVjCeB2s8kZRSsqij6TMKKb
	IRpjM=
X-Gm-Gg: ASbGncuZg3QxrmOn80DilZ/N0tcY2Bwip6c72LFGPa9MOaK7fyctsmT8d4K1LyA0724
	NebqJd2Cxg3Ji1ENPjW9/3smAMTk4a0FNPLGRpSCrIZZdJE/5fNPuWXQ7i41Y3aU5cWkWEBfVHO
	4pmn3s9Du/yeddx37FIKCa5Fvk3wVwBC8mvqzoP+V+6J5tqzNeLXZx3ZGHC6xt+NSCTIU/augdG
	thpVa5O1zOv1YAhzuJlTQXAEfR5NOMZVcEv/3eEWRLmJWfFKqGGlUj3CLmMFl4ufxduwrFoPCKe
	+GiEGGxuPIryJJ+N+9pTrZO2ntiCzP5Uy7WYUwuCdFJUvBUkbMW9VUhgnZcOGlo7iA/sHyUWJvz
	yTWzCod7jmVkNz4dy19Wo1r1bk0dZe84LT5RxIu3GNm3rVTncSzR4pkKtPxQcDh7CWw==
X-Received: by 2002:ac8:578b:0:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4e89d3a47c8mr36061891cf.64.1760677578253;
        Thu, 16 Oct 2025 22:06:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWoFJ0er3XmNA2MfPambnFGk+UHtKnSzrmBzbda9gHXA03fZsIi/ofXmuuwW4bOSbI87KnLg==
X-Received: by 2002:ac8:578b:0:b0:4e5:6c5e:430a with SMTP id d75a77b69052e-4e89d3a47c8mr36061541cf.64.1760677577565;
        Thu, 16 Oct 2025 22:06:17 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c0128c9d8sm57641916d6.33.2025.10.16.22.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 22:06:17 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Fri, 17 Oct 2025 13:06:02 +0800
Subject: [PATCH v5 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251017-camss_tpg-v5-2-cafe3ad42163@oss.qualcomm.com>
References: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
In-Reply-To: <20251017-camss_tpg-v5-0-cafe3ad42163@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760677563; l=7448;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=gcL/fGPQekLTQNIGUzZcdgTs72eyqB3Ncf8Yq2nY0h4=;
 b=Heo9ljOtLQ/JcSwEKehl45lcRkeQ9+98sYsrLAB3G/8XiHBm9U+DwtH61jDTyI40g6e7sT+wo
 8OwvzboEzMbA7s6sM5EwqbQ3iH2aUibjcUR5/u2OjohrU5/ysKmnPW5
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-GUID: U91Zggdj9RX3-lOTIEgC6zVxi79Tj_Kl
X-Proofpoint-ORIG-GUID: U91Zggdj9RX3-lOTIEgC6zVxi79Tj_Kl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX9onnIbVg5bNG
 PFLHIBYxlEZ1Yw1pIGQY62yAuzQWil7ogpEm8mtqMVNMcQ0mBEzfkQ3Sda4IpaBuzZ2ftU/WAAD
 3MIEDiYlramI5N57dDR6Wb5R/a5gBFz8z5Z0I3X5rYJLR1AplEjSuuIUVZGMIDNmyKNKny1F1bi
 gvLI1X9Qw3LQraRHY2atf0mUxn5gq162HELOqlQlrjlkAFrLr/G7bO3mnPIYXwG9PmK3f+Y7x7v
 z9GbrJNgoY1v+e1dj+KmRca8Y/O1Gb//WAqQpdar9DFBmBlgtR7LuV7v2juu+FMwSTIMZnAEv97
 neNoAk9U+akiYQSnYKXjJnGbfDum0XatYvCCN8+COl9WfdelONvVf5CAkwn4jWMaJjstC06gyCy
 xjU5erCHEs4pQzl01F5zAQhgq7yLIQ==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f1cecb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 43 +++++++++++++-------
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 52 ++++++++++++++++++++++++
 4 files changed, 84 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..196cbc0b60e9bf95a06b053c69c967e345ffcd4b 100644
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
+static u32 csid_get_lane_assign(int num, struct csiphy_lanes_cfg *lane_cfg)
 {
 	u32 lane_assign = 0;
+	int pos;
 	int i;
 
-	for (i = 0; i < lane_cfg->num_data; i++)
-		lane_assign |= lane_cfg->data[i].pos << (i * 4);
+	for (i = 0; i < num; i++) {
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
+			csid->phy.lane_assign = csid_get_lane_assign(csid->phy.lane_cnt, NULL);
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
+			csid->phy.lane_assign = csid_get_lane_assign(lane_cfg->num_data, lane_cfg);
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 2de97f58f9ae4f91e8bba39dcadf92bea8cf6f73..680580d7fe46a215777f3fa1b347f4297deea024 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -799,6 +799,7 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
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
index 2fbcd0e343aac9620a5a30719c42e1b887cf34ed..2ede19e1347ae32f2f6919905b535352bcd134be 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3691,6 +3691,19 @@ static int camss_init_subdevices(struct camss *camss)
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
@@ -3779,6 +3792,23 @@ static int camss_link_entities(struct camss *camss)
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
@@ -3883,6 +3913,19 @@ static int camss_register_entities(struct camss *camss)
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
@@ -3926,6 +3969,10 @@ static int camss_register_entities(struct camss *camss)
 	for (i--; i >= 0; i--)
 		msm_csid_unregister_entity(&camss->csid[i]);
 
+	i = camss->res->tpg_num;
+err_reg_tpg:
+	for (i--; i >= 0; i--)
+		msm_tpg_unregister_entity(&camss->tpg[i]);
 	i = camss->res->csiphy_num;
 err_reg_csiphy:
 	for (i--; i >= 0; i--)
@@ -3947,6 +3994,11 @@ static void camss_unregister_entities(struct camss *camss)
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


