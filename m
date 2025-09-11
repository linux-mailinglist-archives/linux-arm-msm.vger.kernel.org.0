Return-Path: <linux-arm-msm+bounces-73162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC2B536AB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 207DB7A7C03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50A39353368;
	Thu, 11 Sep 2025 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MppiUhvQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B01A35335C
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602618; cv=none; b=Zpiuys1FTpColXZpQteoxE1sEET5KIuTBVj7/11au7ru426Z4LqwWvzoRkUjZCsRj+jbsXVUvh/Gsce9v3RDRsYH6v8fZFRmST2oGUjumJbCQeIa949okPSSES+XH2GCXcIDlVVvqjbgzgxAK+2UMWttINLWHIsY2PrdUufpOsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602618; c=relaxed/simple;
	bh=AKC+Fuyxo1BkLI1wsbmYerpKOrwfA3p00G/GMwPZd9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K+SKS7FwLDrbMZLSrNBmtDCvkpDB7zSmAJ/3IuaAVlk5jqWA881Mn9kNWdVXIJzqlK2HVdMF0C6VoZ/jRvtLbjsOur3bf1s+0uFdA6ERsjHTKIPchNb3c3rPdsA8Je3AOdBHxByqoh55pBOOKwhYrfw5F8NA+HFb75Q1orqbeCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MppiUhvQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEFPG002402
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UkeQMxAr6ZamlBQGMFUDK8zXlQaQrwqYsBfCE1ubPc4=; b=MppiUhvQqnv/UyCf
	C8y93r+1Wou1uGFXSKuxkB5tpZZ4ZvPzaHyKPxFqlPiHXhi1ll9FY4ygnjqL1IgE
	yeDOsg/8KVoWsqOH0wlnIq98TN0wQXNeedGco4C7s2S+oH12KsyHQJ2GWpWmBiFG
	YDQesmNfC0tbJnELwXjSCyFc2vFzZapkqEuFxqnJNsHzgGOVHnAIb51i3yxMNezu
	0NObjyCshnABM227D9WetURSp3XBkKw0U+gW8oPkzYxXBrj93ndzi1q90NAcDjx+
	iMES8rxF8Och+Ln4StHNGzNywLUdKpP6CK1oGwNPfqbDeIZbZuuF+2qKpX1Uz/H0
	JpLAnA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsga2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:56:55 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4d41eed745so231820a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:56:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602615; x=1758207415;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UkeQMxAr6ZamlBQGMFUDK8zXlQaQrwqYsBfCE1ubPc4=;
        b=bQ8XxAxaP4vMxWvu4wMigUXk8H/lqF1TRdKIHKOwFJDDbZKJNpl+QKRDTBo9ZDp2Jy
         tqoNxmyPDesbbNMnDkM4NKApkg3hlQPaiRvSZwtTDraqAhVb/2Mc1I0osXVWC5zM9YIu
         BX7kuz9CgbOWFhFyTsFlKpY4qzCq39uc89g9X6h3G9xZjUj+yVdnfFXCesYNc4Oat2k/
         WWKez6DXNF33cBB2v9mqW+EmmLGDhHt+nY5Cw3+huh1tQhKOWXOFE1ALaDsTkF6xGYij
         20uhfwc2sMGqhROIMdcM+JmaDuy2izlPRmvehDNB7wJVYz9QHiuZESpArw73NH/9TaMn
         aMPA==
X-Gm-Message-State: AOJu0YzU0w05IdJ9GtzRZ3ulxL7d7ZufvEiFD54eiwFk/0q2SbnQB8LQ
	gLLY7b0e9HVSrXNK/koEZ/82WG9cOKSZzXyOI7H3JGtAUnxsfarhQtQI7m97eYny7U9wVuhXnal
	wGhCtQi/UjEETNbIxwfZpTbW4NhRoAdcZkcD4y4RR6xTdtTx9D6hAS6irkMOz9mqxUoHB
X-Gm-Gg: ASbGncsDDLQpepcJSmGxND6woZJlDAgrZL1PO7x0qnXUbxC1EEFLD9mkeKHe1R1G5ms
	HnGigz9mzIR+qzHd9P+ECjpza3jLccuwxpVHKswxa5GZFwdIhayPTi8H3q8OpDGnPhS+VHGNc7a
	kIHDu64IJQCsCUNw6jvwdAmk3fIWPvbqQbgyWERa3fVtitPRotDj7e7FvZiyiXqQGI6eKJ/JbKj
	CxEeJLISv15H45C0KyNYAz9PG14S039mtORVfkDFkP9I9H9DuDtLiSNyahz57olF+vky0eFzUI/
	p8fvAHSqDXIc/jSyPSXn+wNQMiJsZ2v1HjhHErW2CWvncf2fg6KwVyE8NirA29Y7rR/BAJvwKKd
	toCS3nhz9Zyp+7e5X5ARwigPxD9ZlPSGWAJ8rRv5Wpeve0niYytiUdNAe
X-Received: by 2002:a05:6a20:2584:b0:24c:a32b:3257 with SMTP id adf61e73a8af0-25335c7e406mr15883712637.0.1757602614408;
        Thu, 11 Sep 2025 07:56:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFH+ljRMdbPiIHSCn8YGlmKWIWihBjrdnIES0fij+YdgfVI3o2GbtDdCWqUoidRG0rpQ86RYQ==
X-Received: by 2002:a05:6a20:2584:b0:24c:a32b:3257 with SMTP id adf61e73a8af0-25335c7e406mr15883671637.0.1757602613821;
        Thu, 11 Sep 2025 07:56:53 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:56:53 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:09 +0800
Subject: [PATCH v4 12/13] drm/msm/dp: move link-specific parsing from
 dp_panel to dp_link
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-12-2702bdda14ed@oss.qualcomm.com>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
        li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=9507;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=AKC+Fuyxo1BkLI1wsbmYerpKOrwfA3p00G/GMwPZd9M=;
 b=Z3/U8IQnRXTX5zBDO/gGB5EMPCiYrBxhLu6qiMx/COvqagvbqZ+f9Ng0QAJM8Q274cylKYQVw
 RvCNF0MD2kjDZrVGTQZYftg34OpjDjyaZZLhmSbzJgsnGQ9Dv8XdHPd
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Proofpoint-ORIG-GUID: R2A0dvmp1DsJkL3LMHKquu7f9IFtEyY9
X-Proofpoint-GUID: R2A0dvmp1DsJkL3LMHKquu7f9IFtEyY9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX1z2vbmlO6tXR
 i786fBIHqmJzHVzqYMBUf9wTi8o3juWikCWlmxq9mB9a2oPszY9xCKOGcrj+ymhqsbGpNOO14as
 4Mtu0xFz1rVCP89iwxufP+ZViBGpqHWr3ZphVsQ5v6KbXrMQNovlfo3/LvVZUJzcNZxBZuYqqtZ
 GfWzXAIABdHugG0Z1CbHVpw++nA4WtmHG3GAmJ9yM0A6kTgnLQQwbRs5NP3c7TiGwfJt5nj58eD
 cXI6lUriVV2Cm8f+gpjxkDf0OH7W5ZylEJ/5r+97iQfG3unnd121y5eNAgqIWqDbjp/twmlZftF
 onAYH7MUAbkSUOexHQck06+sPCQSBQozsWo1A1L3UDg97M2QmGt8R4fhDiJCLf7gg6GxP0qI7PK
 tBYZWQhM
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2e337 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=MCbuoQoIk7qV-7NvgO8A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Since max_dp_lanes and max_dp_link_rate are link-specific parameters, move
their parsing from dp_panel to dp_link for better separation of concerns.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_link.c  | 63 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h  |  4 ++
 drivers/gpu/drm/msm/dp/dp_panel.c | 78 +++++----------------------------------
 drivers/gpu/drm/msm/dp/dp_panel.h |  3 --
 4 files changed, 76 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
index 66e1bbd80db3a28f5f16d083486752007ceaf3f7..caca947122c60abb2a01e295f3e254cf02e34502 100644
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
@@ -1210,10 +1213,65 @@ u32 msm_dp_link_get_test_bits_depth(struct msm_dp_link *msm_dp_link, u32 bpp)
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
+	if (cnt > 0)
+		msm_dp_link->max_dp_lanes = cnt;
+	else
+		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
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
@@ -1225,9 +1283,14 @@ struct msm_dp_link *msm_dp_link_get(struct device *dev, struct drm_dp_aux *aux)
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
index ba47c6d19fbfacfc58031263e4a2f5a6d9c2c229..0684a962d4ec93f7da764c4af2e2154c7050329c 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -12,6 +12,7 @@
 #define DS_PORT_STATUS_CHANGED 0x200
 #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
 #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+#define DP_MAX_NUM_DP_LANES    4
 
 struct msm_dp_link_info {
 	unsigned char revision;
@@ -72,6 +73,9 @@ struct msm_dp_link {
 	struct msm_dp_link_test_audio test_audio;
 	struct msm_dp_link_phy_params phy_params;
 	struct msm_dp_link_info link_params;
+
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


