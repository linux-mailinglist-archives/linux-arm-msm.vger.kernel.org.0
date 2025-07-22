Return-Path: <linux-arm-msm+bounces-66006-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0CCB0D2E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 09:27:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1C4E18845B6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 07:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4CB32C325B;
	Tue, 22 Jul 2025 07:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dvLq0ini"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD2A2DE6F4
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753169036; cv=none; b=BDPCa+UUUX89PiTSXOKdHlz+7yJlYw/8zyUSDAHpz3wI7ih3uf6U5Gupmw4xrfOstp5KiJfN0VSgmLa40v8Gnzw9Ux+OhZ1C8Zx5VCSZCFdp41rOvZ8IxS1wVHM5oagN9sfHqgXjTLYZaKbzicrZxKvwLrsEjbxQXMwWlG+8l98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753169036; c=relaxed/simple;
	bh=1od1x0khFrwfMLUnR4xw/dFXf07Vmo4IXF/QPtNukLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nCYn2nIDY8XmqfnfvSfpRu6nd40f2ZxHi9xSwUHhQLz8JBC2BpkL90Nha1HrjLMC2YIxWw0q/aVSVBcXskVLtcGZpuftIbynOJEjn5YciH9EpZe2DTMP3gTYgHmNObH8sQ3OluHDhETeGTSANTXXnrH19LqtNLuaSrQPibqTOkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dvLq0ini; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M4SB1W002408
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jEdBY03qFvh1fXbNADBz8i4gZfJxuCQnbh3vgnGp/88=; b=dvLq0inii3Od0ClI
	J6ur1tntciApdBWmuYfeNo/67ljujTZKIShJ+ZgW4YNfjFRVMWhhgC90Y2EsOUVD
	O8NiClFF79ORn+mdI5dOH1dSeZM9HZthC1yYN/lrOz+Iim363f/whY2K9iQsXVyN
	K35omPkGw3Ubk7tLBMznf2XXEM6iHsLxA7DYkZvUzWkDIZ9/UYw9y+cPNrDazlVp
	xWt4Xlnt5gi/Rq5LosSj53pczPkvD2kenR3OkBpNEqvflrTImogIFP2dP+lTTA5/
	rXYtD1ejbMujgflv6aJMdPGxtrjabsZJU9cGa0cbInUtQfU9A/RC38j7RsrQ8CqB
	+7vpDQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dgcj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 07:23:53 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311be3a8130so136780a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 00:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753169032; x=1753773832;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jEdBY03qFvh1fXbNADBz8i4gZfJxuCQnbh3vgnGp/88=;
        b=sFwxBPmnfFgGjflfI0JLmOzbGaO/OMp3KH8uWvrlDuFcMw9+eeXukk/BDXEVTFRcfN
         Kf0RNm+atK2M5GeBlxHTfOCMAKcdvVoG9pOFmXU3vyR0JzZWb4fTajlQXDpei+TFF6kn
         jC74gI1+YKf9K9lytJ2SgM/dClHnWshFD0SytB7MBx+ETMJjVfV9+eWTLTtsWZ3SJCHS
         JOknWrtUCA6mTJ1NHOdlglCFr4zH/caSZLkMs8+E71yyYrpjkJdahApp0QXDdSmMfOaj
         XJUyQkx91K5xaZvwxbnELyzNldiGfow7s598MmDRc/CDgOwM/58xhtWyWCD1TGURAmA1
         pkUQ==
X-Gm-Message-State: AOJu0YxG46D439993s37qg1hlfXsz0lrZecz9fNew0zui6Xddr8HGoYs
	bgpsp6OPHRwTleKtNR08rqdNRcMaUjaEvd0eFp4JnSuyXUhkA69hThuri2PWl8TxrGeDP8hfTXu
	nniZW5qVN5kjPfYlDNtAjGxhK+08sWQRI1PSt0ukOADwksCfdFP6ExR/f8RECBuHvojom
X-Gm-Gg: ASbGnctECjnNcB35nBa96WyM2f/6UDpYMtTx/THkPdPtLvby+ebF+tpW2agjx2/ArEm
	UyQhNpBzxanF89YMkLXodWZgOUCmBKBJ7s6RaLYcb5YYNBBRRC1X3S/SfALrB9whIHvE5OnOFr7
	vyWIdmEJAwDOzyFfmb0QbrNNOF4UszWNf7HtcWHyLY3whXOEn6Az2pzDp5cQ1lrz8/274GvsVLm
	+JfV0H7b0nSCveYrvru2tAYmhcNRbq/ll9GDKeZpfDWaBPilaX0MVOwwu6nIzBuOAs90XFlDJI1
	guV32FWy3wyzKJ/O1SfN8nHDjI1Dac9Geu524Sz6N9S5Ytnkqnt7I767/4ckuwRXLPyjWU/rGO1
	Aa7+8sGnVwxlZQKTgPW3CFf8ZMzKswbA/b6QM+cAdhXO8mEE1G5/2smnF
X-Received: by 2002:a17:90b:3f8d:b0:312:e76f:520f with SMTP id 98e67ed59e1d1-31c9e79d7c3mr14629902a91.8.1753169032276;
        Tue, 22 Jul 2025 00:23:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1XLfN2mY2sAshzziXsRcvI50Gk1XCHtzF71muk5tiUDPXXOn3B74zKxnqYqovSxD5Tf54Vg==
X-Received: by 2002:a17:90b:3f8d:b0:312:e76f:520f with SMTP id 98e67ed59e1d1-31c9e79d7c3mr14629887a91.8.1753169031768;
        Tue, 22 Jul 2025 00:23:51 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:23:51 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:14 +0800
Subject: [PATCH v2 13/13] drm/msm/dp: Add support for lane mapping
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-13-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
        quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=11603;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=1od1x0khFrwfMLUnR4xw/dFXf07Vmo4IXF/QPtNukLQ=;
 b=22uwtEHDknol6p+guCL6gTd6/l2boxMJtMRJfEpMolrKz8FrRthhJTl+UL9Si1r9s6y8ujyon
 3n8olREt5hfCEJWY7gDOhY7d5cMoGyNH1qXBbZus8RiMNOYEqQMIylx
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687f3c89 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=NfoP-xiufhIyd-I1U-kA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: oJ-JKMv-xCRZTYVjDIKUx3e58oF-Qr9O
X-Proofpoint-ORIG-GUID: oJ-JKMv-xCRZTYVjDIKUx3e58oF-Qr9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfX8QG5gQdFOa1W
 VjH9xdwZOwjB+SaVPlaUxUbwy2lj89t+fouZ1bSevQBPnq8HIX8Ny+SJoLWcMFV52h1LxTHNCdW
 8gqzmCAwJXYC+tKMJ+kppm7b9SjFx9A9AXFZRUJN9t8WFU62tReqev/4ZrO75fM1NO5AkMoe666
 mQxU1Kgx+sNXLFUGA3dVv1jucbk2ePXYEPF6aW8AzUbVo5mhzQfKv524YTnR+yNOMRuwANoiO3r
 RSp0KH/cN4FCyPtt5WXGEcm2HcRvPGCGu6B7FWnkVfWTM/1thj8ow/7TQjZL91e6K3Njw9c0OT2
 26mW0vzbz/MFJn26UWCspReADfLfV1JxiV0Xj+Tm5Jet3rUwWdbEkq1zPZAd9TojeQYSq1OOSIw
 HwF26c6siRIqlK8yhu1TSjOEwbUyznNdHK15BZF919jyYi4ZUcx9ZKhrdpBx/R3zIStRQCKh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059

Since max_dp_lanes and max_dp_link_rate are link-specific parameters,
move their parsing from dp_panel to dp_link for better separation
of concerns.

Add lane mapping configuration for the DisplayPort (DP) controller on
the QCS615 platform.

QCS615 platform requires non-default logical-to-physical lane mapping
due to its unique hardware routing. Unlike the standard mapping sequence
<0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
configuration via the data-lanes property in the device tree. This
ensures correct signal routing between the DP controller and PHY.

The DP PHY supports polarity inversion (PN swap) but does not support
lane swapping. Therefore, lane mapping should be handled in the DP
controller domain using REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c  | 10 ++---
 drivers/gpu/drm/msm/dp/dp_link.c  | 71 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h  |  5 +++
 drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
 5 files changed, 90 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index c42fd2c17a328f6deae211c9cd57cc7416a9365a..cbcc7c2f0ffc4696749b6c43818d20853ddec069 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -423,13 +423,13 @@ static void msm_dp_ctrl_config_ctrl(struct msm_dp_ctrl_private *ctrl)
 
 static void msm_dp_ctrl_lane_mapping(struct msm_dp_ctrl_private *ctrl)
 {
-	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
+	u32 *lane_map = ctrl->link->lane_map;
 	u32 ln_mapping;
 
-	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
-	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
-	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
-	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
+	ln_mapping = lane_map[0] << LANE0_MAPPING_SHIFT;
+	ln_mapping |= lane_map[1] << LANE1_MAPPING_SHIFT;
+	ln_mapping |= lane_map[2] << LANE2_MAPPING_SHIFT;
+	ln_mapping |= lane_map[3] << LANE3_MAPPING_SHIFT;
 
 	msm_dp_write_link(ctrl, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
 			ln_mapping);
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3a28f5f16d083486752007ceaf3f7..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -6,12 +6,14 @@
 #define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
 
 #include <drm/drm_device.h>
+#include <drm/drm_of.h>
 #include <drm/drm_print.h>
 
 #include "dp_reg.h"
 #include "dp_link.h"
 #include "dp_panel.h"
 
+#define DP_LINK_RATE_HBR2      540000 /* kbytes */
 #define DP_TEST_REQUEST_MASK		0x7F
 
 enum audio_sample_rate {
@@ -37,6 +39,7 @@ struct msm_dp_link_request {
 
 struct msm_dp_link_private {
 	u32 prev_sink_count;
+	struct device *dev;
 	struct drm_device *drm_dev;
 	struct drm_dp_aux *aux;
 	struct msm_dp_link msm_dp_link;
@@ -1210,10 +1213,73 @@ u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp)
 	return tbd;
 }
 
+static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
+{
+	struct device_node *endpoint;
+	u64 frequency = 0;
+	int cnt;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
+	if (!endpoint)
+		return 0;
+
+	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
+
+	if (cnt > 0)
+		of_property_read_u64_index(endpoint, "link-frequencies",
+					   cnt - 1, &frequency);
+	of_node_put(endpoint);
+
+	do_div(frequency,
+	       10 * /* from symbol rate to link rate */
+	       1000); /* kbytes */
+
+	return frequency;
+}
+
+static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
+{
+	struct msm_dp_link_private *link;
+	struct device_node *of_node;
+	int cnt;
+	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
+
+	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
+	of_node = link->dev->of_node;
+
+	/*
+	 * data-lanes is the property of msm_dp_out endpoint
+	 */
+	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
+	if (cnt < 0) {
+		/* legacy code, data-lanes is the property of mdss_dp node */
+		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
+	}
+
+	if (cnt > 0) {
+		struct device_node *endpoint;
+
+		msm_dp_link->max_dp_lanes = cnt;
+		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
+		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
+	} else {
+		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+	}
+
+	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));
+
+	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
+	if (!msm_dp_link->max_dp_link_rate)
+		msm_dp_link->max_dp_link_rate = DP_LINK_RATE_HBR2;
+
+	return 0;
+}
+
 struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 {
 	struct msm_dp_link_private *link;
 	struct msm_dp_link *msm_dp_link;
+	int ret;
 
 	if (!dev || !aux) {
 		DRM_ERROR("invalid input\n");
@@ -1225,9 +1291,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
 		return ERR_PTR(-ENOMEM);
 
 	link->aux   = aux;
+	link->dev   = dev;
 
 	mutex_init(&link->psm_mutex);
 	msm_dp_link = &link->msm_dp_link;
 
+	ret = msm_dp_link_parse_dt(msm_dp_link);
+	if (ret)
+		return ERR_PTR(ret);
+
 	return msm_dp_link;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index ba47c6d19fbfacfc58031263e4a2f5a6d9c2c229..b1eb2de6d2a7693f17aa2f256657110af839533d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -12,6 +12,7 @@
 #define DS_PORT_STATUS_CHANGED 0x200
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+#define DP_MAX_NUM_DP_LANES    4
 
 struct msm_dp_link_info {
 	unsigned char revision;
@@ -72,6 +73,10 @@ struct msm_dp_link {
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
 	struct msm_dp_link_info link_params;
+
+	u32 lane_map[DP_MAX_NUM_DP_LANES];
+	u32 max_dp_lanes;
+	u32 max_dp_link_rate;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 15b7f6c7146e1176a80b5c9d25896b1c8ede3aed..ad5d55bf009dbe60e61ca4f4c108116333129203 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -16,9 +16,6 @@
 
 #define DP_INTF_CONFIG_DATABUS_WIDEN     BIT(4)
 
-#define DP_MAX_NUM_DP_LANES	4
-#define DP_LINK_RATE_HBR2	540000 /* kbytes */
-
 struct msm_dp_panel_private {
 	struct device *dev;
 	struct drm_device *drm_dev;
@@ -91,6 +88,7 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	int rc, max_lttpr_lanes, max_lttpr_rate;
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_link_info *link_info;
+	struct msm_dp_link *link;
 	u8 *dpcd, major, minor;
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
@@ -105,16 +103,20 @@ static int msm_dp_panel_read_dpcd(struct msm_dp_panel *msm_dp_panel)
 	major = (link_info->revision >> 4) & 0x0f;
 	minor = link_info->revision & 0x0f;
 
+	link = panel->link;
+	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
+		   link->max_dp_lanes, link->max_dp_link_rate);
+
 	link_info->rate = drm_dp_max_link_rate(dpcd);
 	link_info->num_lanes = drm_dp_max_lane_count(dpcd);
 
 	/* Limit data lanes from data-lanes of endpoint property of dtsi */
-	if (link_info->num_lanes > msm_dp_panel->max_dp_lanes)
-		link_info->num_lanes = msm_dp_panel->max_dp_lanes;
+	if (link_info->num_lanes > link->max_dp_lanes)
+		link_info->num_lanes = link->max_dp_lanes;
 
 	/* Limit link rate from link-frequencies of endpoint property of dtsi */
-	if (link_info->rate > msm_dp_panel->max_dp_link_rate)
-		link_info->rate = msm_dp_panel->max_dp_link_rate;
+	if (link_info->rate > link->max_dp_link_rate)
+		link_info->rate = link->max_dp_link_rate;
 
 	/* Limit data lanes from LTTPR capabilities, if any */
 	max_lttpr_lanes = drm_dp_lttpr_max_lane_count(panel->link->lttpr_common_caps);
@@ -173,9 +175,6 @@ int msm_dp_panel_read_sink_caps(struct msm_dp_panel *msm_dp_panel,
 
 	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
 
-	drm_dbg_dp(panel->drm_dev, "max_lanes=%d max_link_rate=%d\n",
-		msm_dp_panel->max_dp_lanes, msm_dp_panel->max_dp_link_rate);
-
 	rc = msm_dp_panel_read_dpcd(msm_dp_panel);
 	if (rc) {
 		DRM_ERROR("read dpcd failed %d\n", rc);
@@ -648,60 +647,6 @@ int msm_dp_panel_init_panel_info(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-static u32 msm_dp_panel_link_frequencies(struct device_node *of_node)
-{
-	struct device_node *endpoint;
-	u64 frequency = 0;
-	int cnt;
-
-	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, 0); /* port@1 */
-	if (!endpoint)
-		return 0;
-
-	cnt = of_property_count_u64_elems(endpoint, "link-frequencies");
-
-	if (cnt > 0)
-		of_property_read_u64_index(endpoint, "link-frequencies",
-						cnt - 1, &frequency);
-	of_node_put(endpoint);
-
-	do_div(frequency,
-		10 * /* from symbol rate to link rate */
-		1000); /* kbytes */
-
-	return frequency;
-}
-
-static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
-{
-	struct msm_dp_panel_private *panel;
-	struct device_node *of_node;
-	int cnt;
-
-	panel = container_of(msm_dp_panel, struct msm_dp_panel_private, msm_dp_panel);
-	of_node = panel->dev->of_node;
-
-	/*
-	 * data-lanes is the property of msm_dp_out endpoint
-	 */
-	cnt = drm_of_get_data_lanes_count_ep(of_node, 1, 0, 1, DP_MAX_NUM_DP_LANES);
-	if (cnt < 0) {
-		/* legacy code, data-lanes is the property of mdss_dp node */
-		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
-	}
-
-	if (cnt > 0)
-		msm_dp_panel->max_dp_lanes = cnt;
-	else
-		msm_dp_panel->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
-
-	msm_dp_panel->max_dp_link_rate = msm_dp_panel_link_frequencies(of_node);
-	if (!msm_dp_panel->max_dp_link_rate)
-		msm_dp_panel->max_dp_link_rate = DP_LINK_RATE_HBR2;
-
-	return 0;
-}
-
 struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
 			      struct msm_dp_link *link,
 			      void __iomem *link_base,
@@ -709,7 +654,6 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
-	int ret;
 
 	if (!dev || !aux || !link) {
 		DRM_ERROR("invalid input\n");
@@ -729,10 +673,6 @@ struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
 
-	ret = msm_dp_panel_parse_dt(msm_dp_panel);
-	if (ret)
-		return ERR_PTR(ret);
-
 	return msm_dp_panel;
 }
 
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index d2cf401506dcbaf553192d5e18c87207337664ab..921a296852d4df65f817665d3e1344f2f7c9ece7 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -41,9 +41,6 @@ struct msm_dp_panel {
 	bool vsc_sdp_supported;
 	u32 hw_revision;
 
-	u32 max_dp_lanes;
-	u32 max_dp_link_rate;
-
 	u32 max_bw_code;
 };
 

-- 
2.34.1


