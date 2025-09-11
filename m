Return-Path: <linux-arm-msm+bounces-73163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E02B536B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 16:59:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C35DA03F81
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 14:59:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CB80356915;
	Thu, 11 Sep 2025 14:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HN2pgsX3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFFC34575F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757602626; cv=none; b=ZZXhIkdTbBnUqw6g73NotK1+ctnGlNxEUgngrO6roKWfPY/1C48OEX+I8ptq7v8vm2oj4+w4MeZZL77cAkTxdsfbvPgl1NHhBh3TLGYtntzlyL4OuunyHyQVh49PloHpkIkviceoX3bLR9XDcY440XKCMmpglimi3oxCXKaPlVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757602626; c=relaxed/simple;
	bh=ydjAKX71QvKWvvFLsD1Bwlw16HeAPipo1gwgyRawXAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tumKX/yQOZtaM22Evk2fjgz1CeXqPgeFJRJOctGGjqbhKcTbcTaaR92EEjz1dUFTKnIWhw1PuhhmR1o+o/llbQKuJqZ32oTt0nxR8l0/r1OR+W8YQIDhWKf8eq0HJf5bHWwWW89oIf1r/wlBPGHipcxzniGaIcZEw9QOfS21t2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HN2pgsX3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BDDVSv019089
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	poPQezAqO5CLn7JGsotj9+FaLlUAX0s+F1zX9jDxN/U=; b=HN2pgsX3P5FMk8Su
	utmLP/T3KSP6vXamGNxCKBRVa44iNls7G8Y71g06GkmxPX6xGrWthrp/5gqCynKG
	0otlp0H0Woc9BYXwwa6uatpMUC7bSjuUSVpc/D0tSB159hSzalZnUx+H6mj3fIfh
	2gp8c9/7aN1fFJEnEzBCAollbIv6+xnY4j/1uElptv70SIQh6TIxHutA+HD+O1wl
	QyqOOi70Il1WevVSV+xnMY4AfXT4okiOywhozyt2bCksecvAS6ddwmAFDu9CqsZj
	zlXAkkttewOQ23mhEk4bCicq+WCxUJF0WLm6ULDRyOgfdW8HiEVN3lvsUiy5P7if
	I2R+eg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493qphswgu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 14:57:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24ce66b9b3dso2178595ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 07:57:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757602621; x=1758207421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poPQezAqO5CLn7JGsotj9+FaLlUAX0s+F1zX9jDxN/U=;
        b=pF3p0UfUKvdCvDsXM41mbanV9JN15mcREx+V4S7ji+AFzUYLtfbdsrLbIdugkMih+o
         T4Fy/Ng5n8rr3EZBph9OqBjo7dRDYIHGoeRKVN9c69bbMbELnZ0fGoAFE8xXADgqTmx/
         K/ogHmYMZJN1mXKdKt9oceODurQ5Q7CdVf5kT3V5ndwm5+baSlzMm+2HkyOPnlaGLwB0
         hZQ6eFgz/27Sx5XKBlBmsQl8kDYlo5mklPFh527k/hd6g13TuSijB/d7eMbdDkYY4QlJ
         FQPR9A+1FagQNZSi33GdPC5EPsNVMCMG6UMacB6yXkOTsTHYzFvkElNj0bQhsEUlBefE
         Eb/w==
X-Gm-Message-State: AOJu0Ywiu0aMpDJ56Hs8uTF1/mSaaMY8SXpFArVsWdeTUgP/lhHzA/MC
	X1tnskdHzByA+YVejcaWjuNIhkZSlXvEPpTij4EKltSv7i+tnHJKSm9BqCItKQjkXh65+AApft6
	hujHIaSTtejJThKXShLMjlhlzFdNFxLvjs6PUG6qNbQ+BhBM+U1nQLMX9DMCs7Lmf5dW4
X-Gm-Gg: ASbGncsywjsR/eqQQJs5f2E3MEllI2A7jkCTJ8KkCUkL8UucksyT/yL5KTUJBVvUFMF
	rfZatPHdzHCr6tDGncshQk0fp1hq0/8QQwmP/wrTq63x9MH05EjGTmYQNgYhZdptCR0oGFSGIp5
	rBN+hbzvRkvQYy8QZlP5QpHqQVxI0KIsIoThrXs1A7N21yCg1ybELJuV7B1b8ua5/VaO6kouWgh
	8bcwyLY8fCo15QJUERBCdi4D4WDd30E99zPQSINAlXGZ5me2xpNccbgO3HSi7fG3PSWwoVRqYB1
	9I4DLwHmLtSmcH61kYrjIWRFpkmoj3e/OmKe8QLshOk4jqVHibay/6u7TsXwo/UMd7YEZlyVplf
	sPKlODq5Yf7r79yVB0K8xEh1C/jSV3gcEeDKOGUV2jb9J07JzhsblQGSv
X-Received: by 2002:a05:6a20:3d88:b0:247:55a7:695f with SMTP id adf61e73a8af0-2534547a5d2mr15322014637.6.1757602620800;
        Thu, 11 Sep 2025 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+T6bihioSO0fuY5YfCxHZc3M0pBOMOH657Ze5hznhiS0Qw6xXefqkICG6PW275tVlLquow==
X-Received: by 2002:a05:6a20:3d88:b0:247:55a7:695f with SMTP id adf61e73a8af0-2534547a5d2mr15321976637.6.1757602620256;
        Thu, 11 Sep 2025 07:57:00 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 07:56:59 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 22:55:10 +0800
Subject: [PATCH v4 13/13] drm/msm/dp: Add support for lane mapping
 configuration
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-13-2702bdda14ed@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602528; l=3440;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ydjAKX71QvKWvvFLsD1Bwlw16HeAPipo1gwgyRawXAA=;
 b=URK3ZuXt8hjr965TBLqTHuckNd4RoPiuWF52jnx2F/+KEB7ZTvapur4qpeUyfJbHmlYbZS0xK
 D3ebmdp3LzLAeFch1oItDUO95apaxHczikuX+uQP2i/doSYgA6mFisz
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=aPDwqa9m c=1 sm=1 tr=0 ts=68c2e33e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=knvC0gF5dBKrktezL5UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: CVmWa2v0kTLCjtbknFg-ULDk5jtgFqsc
X-Proofpoint-ORIG-GUID: CVmWa2v0kTLCjtbknFg-ULDk5jtgFqsc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDA0MCBTYWx0ZWRfX4tDYev+q4KcI
 znVTCMQ4lDGorY0ZOlVfWpJ9vb7Kj7cYkWIvsa4jvtRNwOfZWRzTv8HKHN5toT2QYJsM9y0MLL0
 7mpZUkWSs/bZqL++NTUNI3IRkW/x3NsdOwmHYhjFIAq9sczjVvDsP62vYA/YxFL3x8nxoBL8Jqo
 9QLycNou+Y/uK/a9az0uy3Xm7JF07X9cVOxxi8qAPqtplavEnOEEZovhS3Be91ZYFG/hD2YlPt9
 s7tapwI+36a5zlIyRJ18k+EOM1fYztv8bGs3AkIOzali2Pw/POzc0w/qz16uvumquXp81k3nA8O
 YQSU88decBR1PnaUJlKlsPw3/PwkCXEEQSFp+O+oQ9SzMXx6G2DZy8yoBkb69xZBoZFpJLXz7K1
 Cruxnzss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509110040

QCS615 platform requires non-default logical-to-physical lane mapping due
to its unique hardware routing. Unlike the standard mapping sequence
<0 1 2 3>, QCS615 uses <3 2 0 1>, which necessitates explicit
configuration via the data-lanes property in the device tree. This ensures
correct signal routing between the DP controller and PHY.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 10 +++++-----
 drivers/gpu/drm/msm/dp/dp_link.c | 12 ++++++++++--
 drivers/gpu/drm/msm/dp/dp_link.h |  1 +
 3 files changed, 16 insertions(+), 7 deletions(-)

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
index caca947122c60abb2a01e295f3e254cf02e34502..7c7a4aa584eb42a0ca7c6ec45de585cde8639cb4 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -1242,6 +1242,7 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
 	struct msm_dp_link_private *link;
 	struct device_node *of_node;
 	int cnt;
+	u32 lane_map[DP_MAX_NUM_DP_LANES] = {0};
 
 	link = container_of(msm_dp_link, struct msm_dp_link_private, msm_dp_link);
 	of_node = link->dev->of_node;
@@ -1255,10 +1256,17 @@ static int msm_dp_link_parse_dt(struct msm_dp_link *msm_dp_link)
 		cnt = drm_of_get_data_lanes_count(of_node, 1, DP_MAX_NUM_DP_LANES);
 	}
 
-	if (cnt > 0)
+	if (cnt > 0) {
+		struct device_node *endpoint;
+
 		msm_dp_link->max_dp_lanes = cnt;
-	else
+		endpoint = of_graph_get_endpoint_by_regs(of_node, 1, -1);
+		of_property_read_u32_array(endpoint, "data-lanes", lane_map, cnt);
+	} else {
 		msm_dp_link->max_dp_lanes = DP_MAX_NUM_DP_LANES; /* 4 lanes */
+	}
+
+	memcpy(msm_dp_link->lane_map, lane_map, msm_dp_link->max_dp_lanes * sizeof(u32));
 
 	msm_dp_link->max_dp_link_rate = msm_dp_link_link_frequencies(of_node);
 	if (!msm_dp_link->max_dp_link_rate)
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


