Return-Path: <linux-arm-msm+bounces-88709-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EA1D17777
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 10:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A7CFA3013BC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50DA2FF646;
	Tue, 13 Jan 2026 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ep6si/QB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBuDru8C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C233815C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768295025; cv=none; b=WBhyilZCNzjCfs6b5bhhUprwE+FxCpKS8eHUT3LZNHs58QnU6JTg5FMjEtjs3wiseIgpIFcmZ3Z6Lrk7zrK3jEfQwugIc1B0np1VBW00wHZOtauxGF3GmiuxeS3VvX5496IuKJeavDykr+Ffmz0OgFmKC51C1RQ7T/XmGSDTjmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768295025; c=relaxed/simple;
	bh=R9nZwPy9XRc15CVOKozFsAIrfAJ5dbYQZLjeVD3rWjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fvCluwEbH8lRmK1f3GvTVrqWCVvWaAsMdaIpwmlyCnowicBWTj9OdKTvBeCT2peBDj12TNMlViBqdslIN1wRkwmB08FRlmxsk3Ujc2GMzJ3lktCOmfOGS88cDB1NQaF4XD64yRftPe02FOBfuf0fFwD6wWa/i+2JduIkWVtmzkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ep6si/QB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBuDru8C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5SnaP3868705
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qkmijmGyhFvPEoMmJS0OwOoxZZwnFPG+GA3Si6C/b8I=; b=Ep6si/QBUkrDd2iP
	bIRaUnyvAhRwOmDHHg8G6Hk2zANcVZophW1xn5Q8n+BQCPGZS45awPqiCcQOTUB3
	NXdx5wiE06oyf3xxtHM9bui02AnCEvdN++rVFBxpubn5JAhEU4vgWPyWMV8Re0Ak
	NZ/a3DnXDfph72++JaXpeLqqjiYihsxw89is1RzA9bl6IZmfvgH1pqKstZaYWJQB
	cSCnuRexvZSuS0ETddF3oTytJAy8NawurkxLuyKYKRoWWt97HNfnd8NwP2cjC5SE
	1kIOt6h2NnWHOU8CkgZ9jEqa4ErWuodGtDg5w+lxj5XSu+pxjE0tN5PLyfQQYbqg
	IxFRxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnfxk8k6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 09:03:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eff973c491so192102451cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 01:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768295022; x=1768899822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkmijmGyhFvPEoMmJS0OwOoxZZwnFPG+GA3Si6C/b8I=;
        b=FBuDru8CXodzVO7lEDyxUO9EBXR7xvP6/0/fiGedgOucnhHYyZbeh6/0XSu+T0mgoJ
         o8KZOIKWP4fzGJ8DUcZQQK25UgbmHrPT6eX6Y2kQSpDQcQ+hGlYmDdUQ4h7zEWlwjV/p
         AIifVMn5nwoa+tN1hWTXEIZfZBnHDWDT64lYrPTvGVY2ep4E7p5ga8N4mTXJQxoKxV0h
         8V04aizlMtYlCDrW/CfzB6rUfkfm6DAJ3yDPxt+f56Bm4D04592fKitZG9yWKWSMXAAI
         2Md/pVQDWlg8Z0IGuZ+klwWlD2RYV8qc+dRoriZf1G/fAiaCvV24DdWAPWXY5sXzMgXZ
         O9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295022; x=1768899822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkmijmGyhFvPEoMmJS0OwOoxZZwnFPG+GA3Si6C/b8I=;
        b=DLhpPcBMlE069prsbL10Phset/bL4mOMaEdygY2UjHAp8lL8/enm9St5eeXwmZgDr1
         ik6xBYhf4wCPjxUo/ex9zoAWo8gfzliisYr7m1HnNuWMMnoIzY9Qbs1A0NQZ7ATAFpxa
         /vMaCYppW/MA2t8+IvtW4l+tWwQzbY+yyyX2ylFWs5s5I5mHH7iij99yqMLgRfuJp/rT
         mQtovxh7fAQqkAiwLisCc+xIx6bUkFzuwXqxRpJ3JjGSFRyyrU910/D//vftLjKQOKfi
         EJDSBjxlIpea5PbGFHjSXoLY2XFpmhLrpeo1S7uhryr3Kx/1q5uHkUAVA9pZd14ZuiCh
         ii2g==
X-Forwarded-Encrypted: i=1; AJvYcCWSX5hwqfuHVIhM+7pL5vvMdeprSd8c4FWAHwcjDJ5Xv4cOymwjAm77r7o8t7yRSFWlWZG6/NnEkjvznysS@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRtv3W8stS0hWGRdcRXtTKnorW6kFV7uRFV5w+4rk8w8qTLVf
	blbQktm/c4YP6NsogAIfrx9Y7mbz5nAyiS8fwmD43OVrNJxiDmvDFwk/l0GNWDmxF9ADRLKKF6F
	8zv/HqPSujDubeJ9yZVEq4v36z38dozzF+7AxcCu/QkdlgX8wa9/Cfgp5ggxovDur6ijH
X-Gm-Gg: AY/fxX647TLRuH2e+L3E25l4xZ5SAIosFNJ4kWnD8eqUzxdjNHI8mjpwJXvkEFJ+zo8
	YoKoSfDCnHCkrLLtUdqD4yIxinOkrJrQXj7cvN8ylbYupE6Tb2i4cyprWGWGRxlF7X1zJ1UcdpH
	75fsBnTEMI306pkp1+PuRtkzYbEiFlnbimZ8GF7EWE352fyYmBIujOAeJYRS2E6nnkxLw9b7Lyj
	WTvOV2EhzvE+I3D7w7jTyFUEYJvR1QiPAQTGFUPbD5erph7Y1vuwelS+Q6PGQKrqyz6SryqoUFF
	vF8N7IeiWCv53JrN8kBLAkkFpe6XtcIGGAUa4h1+IAb9xjp7PgqNDycIOPlsbqfzMijuA0hsRmP
	C8foagjgdUTKokLuuklg3ZxaeCJXrOq83ngf7Hwk9MYwjmB382nPSksriX78QL8rqHLqLP96R4t
	8w
X-Received: by 2002:a05:622a:148f:b0:4ff:b29a:9af6 with SMTP id d75a77b69052e-4ffb4a52aedmr306492721cf.71.1768295022209;
        Tue, 13 Jan 2026 01:03:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNhJ++r8bFoVxVbXFvNb0bkYxr+Ze8eUj/Rww/YBbg/V6XAay6CZuJoV4fWf4AO2yKnIi4Tg==
X-Received: by 2002:a05:622a:148f:b0:4ff:b29a:9af6 with SMTP id d75a77b69052e-4ffb4a52aedmr306492331cf.71.1768295021766;
        Tue, 13 Jan 2026 01:03:41 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-890770ce298sm154352586d6.8.2026.01.13.01.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:03:41 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 17:03:27 +0800
Subject: [PATCH v8 2/3] media: qcom: camss: Add link support for TPG
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-camss_tpg-v8-2-fa2cb186a018@oss.qualcomm.com>
References: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
In-Reply-To: <20260113-camss_tpg-v8-0-fa2cb186a018@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768295009; l=8231;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=R9nZwPy9XRc15CVOKozFsAIrfAJ5dbYQZLjeVD3rWjQ=;
 b=pJKEiLa3YmQOsOOSOVTKL8xUWDAdtm8vvbxkb+8VTUosbWoC0FOY4B/ylJ+S2uhjLAIYH3fcQ
 nZqZ+ZAWOSUAaFt5ymCuvv6BZa45GcM9ddeO4F6S+d9uTW/j0JanKHa
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-ORIG-GUID: B9oZhOgTbXLjb4amUOl-yFeNYTE_Xn8O
X-Proofpoint-GUID: B9oZhOgTbXLjb4amUOl-yFeNYTE_Xn8O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA3NCBTYWx0ZWRfX1b/asyaLVt69
 fUuWzXzhr1t5ORhBOhQw1HngebdBpvGzealoCxgfD67xG7hjZ7vRrguCbaL28NM7oXwU+Yt1z5k
 5AlTxVQif2g3OPkf9f6L6c4UnXYxGjQs+gAiIriehA6gHIPAtmysoZV4inxS8H9eYT8CwBEc2tv
 NNPHAFjQtHgAO8SYrXFFOPKOK5jqchMhjSv5DDYi8cN5emECEmn/PtnYKy+XS1tCw2hYRl3QR+4
 bDCQuDGMJM8KwrRrLQaEB2b8SJqTv1GE7GU6y+hfADVdeSBT7vUI6ZdjHd5W/CknvsGx/HYUNrd
 CeuBc75SFwi/4sgLG2JOxKZ59FhSqNbTUakMPpfrSMM7Ip6mI74AfSxob7gutl9K0iIgcrqNJiM
 MZPlOACuG101FfGUDhJ6VbpDJHeNYCbSp9N8CMR7gEiCUnwqZGVU4fdf/BjZAQvGmif+qrHv7lV
 TGw0HvGY7Iv2ONlZSAw==
X-Authority-Analysis: v=2.4 cv=PvSergM3 c=1 sm=1 tr=0 ts=69660a6e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=D-OMaI2VJto731AKaP4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130074

TPG is connected to the csid as an entity, the link
needs to be adapted.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c   | 45 +++++++++++++------
 drivers/media/platform/qcom/camss/camss-csid.h   |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.c |  1 +
 drivers/media/platform/qcom/camss/camss-csiphy.h |  2 +
 drivers/media/platform/qcom/camss/camss.c        | 55 ++++++++++++++++++++++++
 5 files changed, 90 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 5284b5857368c37c202cd89dad6ae8042b637537..42fb299a655354face660308c3d535b09caa8ed2 100644
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
@@ -1263,6 +1269,7 @@ static int csid_link_setup(struct media_entity *entity,
 	if ((local->flags & MEDIA_PAD_FL_SINK) &&
 	    (flags & MEDIA_LNK_FL_ENABLED)) {
 		struct v4l2_subdev *sd;
+		struct tpg_device *tpg;
 		struct csid_device *csid;
 		struct csiphy_device *csiphy;
 		struct csiphy_lanes_cfg *lane_cfg;
@@ -1277,18 +1284,28 @@ static int csid_link_setup(struct media_entity *entity,
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
+			csid->tpg_linked = true;
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
+			csid->tpg_linked = false;
+		}
 	}
 	/* Decide which virtual channels to enable based on which source pads are enabled */
 	if (local->flags & MEDIA_PAD_FL_SOURCE) {
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index aedc96ed84b2fcc3f352160dcfd31554a671d0fc..5296b10f6bac839a3faa1039bdbf0fbbbe9456ac 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -161,6 +161,7 @@ struct csid_device {
 	int num_supplies;
 	struct completion reset_complete;
 	struct csid_testgen_config testgen;
+	bool tpg_linked;
 	struct csid_phy_config phy;
 	struct v4l2_mbus_framefmt fmt[MSM_CSID_PADS_NUM];
 	struct v4l2_ctrl_handler ctrls;
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


