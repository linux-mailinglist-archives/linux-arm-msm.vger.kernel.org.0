Return-Path: <linux-arm-msm+bounces-74210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D4BB89F47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 16:29:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED14D189DDDA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Sep 2025 14:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B0314A7F;
	Fri, 19 Sep 2025 14:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JwVk29bs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480E5314A66
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758292007; cv=none; b=UOIFw80ax6q+OOBJpaSWIy4PBoGBMqYZBGRi513erWBKk9tnRTL4B6UI5Q2HUEhEzoSal8Ii4VWY4GwiAmD2b2GYUzI2s6CdIGRWPx/7lNU5gFwxmI/vq87PE+IVSaf4S8R3SYj7zplv0Y6kh+dSwnIectDVlmd1Lm379yDsSlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758292007; c=relaxed/simple;
	bh=P1sktCDicGuMGRykFaXjP7LWNk2asNLGxaF7CwSUW7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hw1hOlP9HR+GwXaihzCAj5REuzRYjTuGUokJPpayY8/LoQQQ+gxwmhRYzGX/6H2Hw19jqeJD7bl3dS3kSwMjuioC8WLLIkow49T55EfRNl3enbyECORUdd3826mFoMvXCFoO/YN2nA2n4Il+MFg3by27QFBGVGTA0Bm/GmUms4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JwVk29bs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58J6Unrv032419
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vWqKsvOTRWZThPxJdQQdJfugEpEjQHMoOZlOygwfbek=; b=JwVk29bsGltZb/yf
	eH4N3Gi4iDZkzH5DnwzoSfX+/ij9/VaHPcWvQsPb0M6cS8LSwwKuEGMcWpTcqnQT
	VM5RbwvAB2Zgz1NgQkK65cR616DvJqh32Pu3BkolcVTiBnwRkrEEg6ErG5vSps9o
	U8651LcHfJ/n3qebFgom24wQE8+uxMzpsbR340OjZG/S86ceuRd+YRwyFiyL8Bkm
	w6/hjFbf6pSmvAO+vkiL0MAI6ZT3rv/V5XMCUx5wPoykmxUtq7gaNUM26HB0Mp6S
	SJYea3/vQt8QvsY/UB3ax9WJ6InI+OFjm9+Tx8ujHNPRchZiunEr2sVKTHhZ0xY6
	cVhxMQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxytqpr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 14:26:45 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-245fbdc2546so4653905ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Sep 2025 07:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758292005; x=1758896805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWqKsvOTRWZThPxJdQQdJfugEpEjQHMoOZlOygwfbek=;
        b=TlBxEx18KHw0rKWC0rV6AwxccMc7kk7OLu8kL/isFNsPReza7uQC26ut43WKcXelkf
         lTLnsy3LA04DPxXTEAQLUhaERsn1I03oe/Au2CsovRSzB1LwP15kw2YZ8TFaazydzl6v
         rvaU5FbKogLbOBPHqvV0pfHtLkcOn8P8EBoRLV0HEPFMGs5oZYPc25scB9L7cthM3M27
         tCmuJkbbnO27InK4SefSEb4Id1nw9UyZVxtoMD+xFhHWMnuR2mNeQNFN7USzwTV6etOY
         X3LzjoTuJSo2SB0IVe+chX6hBtHqjIZCUQD2LWBsI6/f3HC09ZKO9fCUWCL+5RjQ6+T3
         PdyA==
X-Gm-Message-State: AOJu0Yw7Kck5u/elRGNLBVXTBdUiFblLWH+VyXGfswP5tlwUUPJ2whrM
	qRGMOkt4LLfEOlZ2T9d4pJT4wkFD+tLc8UCQRK0lqKIUXc2uZ5B/GJoxcw5i6hbDrNvQnDY7M1V
	EH5kNGZscoNTnwGFBsJH/6ba0gnXQf2tlOMjyEVs2T9ty0R531Cap7xuHsptw18M9SjXq
X-Gm-Gg: ASbGnctpy8bLUO/cyxwvZomYbNgJfMiTbtDVB/n2qwPErY0Luupgj/Ae1zDdCeY8hIi
	p4++i70jZG50cyjwx9FSUxWOD3sff678frVJfS5ET0L9lrNU0S5Ea/lqzUte+D64vTN7efl40et
	Dh46rwbMIOyF7JrE9sOO8nb5aFAAWJJlEr5E6NdrUL9vstQSucJojjBkXvHJrIzX5DrcgMVafOr
	FmSCI19bPYj16P0DAvXAyXggG1fMDSLMLnzfvEApl9qFE/Eyz7rSVi+jTTt254nmD5gaQIBqhwt
	ksEI8kyVCEAxKICzcTI0LQQSjXYN+0CD4oljU9iiBj6Nj/BexZ8SkB70XzghP1dSH9SDDAyxPo1
	Q5ye9LIbHZ2k2ZA==
X-Received: by 2002:a17:902:ea07:b0:268:140f:36ff with SMTP id d9443c01a7336-269ba54e851mr31024045ad.9.1758292004360;
        Fri, 19 Sep 2025 07:26:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBtw9O1YIv/IQj4a+YUdtcF7lbLdqW5i3TVkJdKbqiPJtUlq1ypRJ+GObJFqJNdPBxuhtZZQ==
X-Received: by 2002:a17:902:ea07:b0:268:140f:36ff with SMTP id d9443c01a7336-269ba54e851mr31023785ad.9.1758292003880;
        Fri, 19 Sep 2025 07:26:43 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-26e80409ee3sm2210035ad.80.2025.09.19.07.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 07:26:43 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Fri, 19 Sep 2025 22:24:31 +0800
Subject: [PATCH v5 14/14] drm/msm/dp: Add support for lane mapping
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-add-displayport-support-for-qcs615-platform-v5-14-eae6681f4002@oss.qualcomm.com>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
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
        li.liu@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758291895; l=4981;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=P1sktCDicGuMGRykFaXjP7LWNk2asNLGxaF7CwSUW7U=;
 b=2X7CL7ayyMh68sKe13q6Fk6OrKKt3egHncSf6zVjxLpBP3vMLZKIQjDAXDXQQvUOdNilyehPA
 9gmwCM/0MvqC1DxxzcHuX3wh3RsifuUj1Y35Nynd0oyrJDeBkuYOiTZ
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cd6825 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=0KckjaIG8F4YdJ3EJ34A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: SDt4rTK0eUVp36I9iRlRAKLAbDEBd3kv
X-Proofpoint-ORIG-GUID: SDt4rTK0eUVp36I9iRlRAKLAbDEBd3kv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXwBFutsqDGdoB
 1B1LqeB5j323sSSgNKhAW03xklthlMkDuqQVo+dHqCRRCHcmYAE4251eigfpCz1vKvR96ONOQko
 2lSjHGFbwS6ZQgg4tOxzbUqARSn0H9D+/TBE2MVVxLI1Cz9aBaOMMwhhE5H9nqJsxUEoAbdijiv
 fMCBxJv8VxIeB0JkZwyk787A6HiTL/2qN3QeFMimbe5Db013l0TYeMhAjujb+OhnVLjXdOEo/GG
 Zanrwuh/l4xUbjraDifocFOacbscht0J7A3b8X+G5P3Sfy+XiqkAIQelxwOXr3umsas+I0eiMVx
 B0VYolkkIq06C3uFvi4shWPlYr8FrdvnaN88oTLe52XBcwydpEGC5dxNPI1WiSd22Rasaajm6g+
 PxHhw23H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

QCS615 platform requires non-default logical-to-physical lane mapping due
to its unique hardware routing. Unlike the standard mapping sequence
<0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
configuration via the data-lanes property in the device tree. This ensures
correct signal routing between the DP controller and PHY.

For partial definitions, fill remaining lanes with unused physical lanes
in ascending order.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++----
 drivers/gpu/drm/msm/dp/dp_link.c | 60 ++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h |  1 +
 3 files changed, 66 insertions(+), 5 deletions(-)

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
index 2aeb3ecf76fab2ee6a9512b785ca5dceebfc3964..34a91e194a124ef5372f13352f7b3513aa88da2a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1236,6 +1236,61 @@ static u32 msm_dp_link_link_frequencies(struct device_node *of_node)
 	return frequency;
 }
 
+/*
+ * Always populate msm_dp_link->lane_map with 4 lanes.
+ * - Use DTS "data-lanes" if present; otherwise fall back to default mapping.
+ * - For partial definitions, fill remaining entries with unused lanes in
+ *   ascending order.
+ */
+static int msm_dp_link_lane_map(struct device *dev, struct msm_dp_link *msm_dp_link)
+{
+	struct device_node *of_node = dev->of_node;
+	struct device_node *endpoint;
+	int cnt = msm_dp_link->max_dp_lanes;
+	u32 tmp[DP_MAX_NUM_DP_LANES];
+	u32 map[DP_MAX_NUM_DP_LANES] = {0, 1, 2, 3}; /* default 1:1 mapping */
+	bool used[DP_MAX_NUM_DP_LANES] = {false};
+	int i, j = 0, ret = -EINVAL;
+
+	endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
+	if (endpoint) {
+		ret = of_property_read_u32_array(endpoint, "data-lanes", tmp, cnt);
+		if (ret)
+			dev_dbg(dev, "endpoint data-lanes read failed (ret=%d)\n", ret);
+	}
+
+	if (ret) {
+		ret = of_property_read_u32_array(of_node, "data-lanes", tmp, cnt);
+		if (ret) {
+			dev_info(dev, "data-lanes not defined, set to default\n");
+			goto out;
+		}
+	}
+
+	for (i = 0; i < cnt; i++) {
+		if (tmp[i] >= DP_MAX_NUM_DP_LANES) {
+			dev_err(dev, "data-lanes[%d]=%u out of range\n", i, tmp[i]);
+			return -EINVAL;
+		}
+		used[tmp[i]] = true;
+		map[i] = tmp[i];
+	}
+
+	/* Fill the remaining entries with unused physical lanes (ascending) */
+	for (i = cnt; i < DP_MAX_NUM_DP_LANES && j < DP_MAX_NUM_DP_LANES; j++) {
+		if (!used[j])
+			map[i++] = j;
+	}
+
+out:
+	if (endpoint)
+		of_node_put(endpoint);
+
+	dev_dbg(dev, "data-lanes count %d <%d %d %d %d>\n", cnt, map[0], map[1], map[2], map[3]);
+	memcpy(msm_dp_link->lane_map, map, sizeof(map));
+	return 0;
+}
+
 static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_link)
 {
 	struct device_node *of_node = dev->of_node;
@@ -1255,6 +1310,11 @@ static int msm_dp_link_parse_dt(struct device *dev, struct msm_dp_link *msm_dp_l
 	else
 		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
 
+	if (msm_dp_link_lane_map(dev, msm_dp_link)) {
+		dev_err(dev, "failed to parse data-lanes\n");
+		return -EINVAL;
+	}
+
 	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
 	if (!msm_dp_link->max_dp_link_rate)
 		msm_dp_link->max_dp_link_rate = DP_LINK_RATE_HBR2;
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
index 0684a962d4ec93f7da764c4af2e2154c7050329c..b1eb2de6d2a7693f17aa2f256657110af839533d 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.h
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -74,6 +74,7 @@ struct msm_dp_link {
 	struct msm_dp_link_phy_params phy_params;
 	struct msm_dp_link_info link_params;
 
+	u32 lane_map[DP_MAX_NUM_DP_LANES];
 	u32 max_dp_lanes;
 	u32 max_dp_link_rate;
 };

-- 
2.34.1


