Return-Path: <linux-arm-msm+bounces-59922-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BA0AC9518
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 19:48:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93DAB1C22790
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 17:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EB6E276056;
	Fri, 30 May 2025 17:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivU11vWF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76315275112
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627271; cv=none; b=SicJbUBajzeIhG/T3ftAMLB/29XvOuithW5naezJm0P4XqtgqQYbvEOThEqK/UWzpkmuLhHpHJQQW+Y7QANSBTdDRI56UO5mqXgxuioNYJzPws1w9IFuY+8YpMZoP7+KgHmM3EIagVIetr2PJkHkubPYG3ELIRF4BcMtJkZH4iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627271; c=relaxed/simple;
	bh=IFPkcO+SBBwiLHryCEam38Y/ThA578cS13ChJk/L3dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l8bVIvSTXUURiKB8X5CSJgtI/IwfL8uhXIzvY+IaIgNA3Kx7694yk/ibAOvXfNs+HdGJfZUfexdfNgsMNfIgZtjAXTt9lzsQeWHRUoQCwo3sN7sKcZi9wPZRxkq2NYZvHF1ZHvi6UZOXiEY1BGzYRCiMNImeJweQ2CuyCyAbWWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivU11vWF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAamCR031513
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=; b=ivU11vWFvW7EScUz
	KtK1O3hbxxvHfpR4zmrqB3AG1qA8UY2GmT6Pr8GqtB9zp0vwF5tIFUCARU7Ag/Gq
	cOx7ntis8kMdBP33dzBpxRjP3zSEFob/3pU7DlDBsPx1Ok8uGinvVV/ACmRVGHZ0
	RRdP03XuxewEMU6dFE2lCDIqphRyRQh4UPvNPM07S6wJy2ReY0WTyMRTmBeC5iM2
	13MRFoKRaE+6JY7Yyr5y0jkmtEe9c+WpdXLhyQZvk6lL35St9bq5791YD3kkGUv1
	jHU8EiFRgJLJKb5xscLcTRUBok7G+x//1WK0RakfUd5Vy/VptsCVNrEts0l25sAg
	/fzyuA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk221b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 17:47:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b26e0fee459so1700540a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 10:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627268; x=1749232068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=;
        b=tKLquFo6knesWB5/INK9n2m+0y41bLlUaF665cLoUK2bhVoirZVMfiQgXPXN2xu8jo
         O0QcPNSw6T3pMdzgQdqNbutZqA3TScs+3py6MrVQ1jQf+NoIcsjp0kBDbUOattNVj39B
         WwauvVqcqUhQtHhrCJMcagQC6U5fPvJdSFk8T/dYAE91SWyCD7IKLaLnplVnd6zXlFR9
         YxWz7U74I6w1uw4i8U/ELonOFg7u2lOFQ3n5LDEG3zNnRXhsWokHaCrOkdx7x5Y64bov
         EBFDWKbyDXBg0sQoGuhKaJHWVV21GwE+RT9cRCynBOwoSGbuN5L4p3HKfe+GdOdffqtx
         DywQ==
X-Gm-Message-State: AOJu0YwuwWy13vlc1/E5rQbPDtnrjuUhrswaUztAO7ILtAfy29CH6KCU
	/uioAuOrIaku0J1Ph8aGH6fFSbmFoN5odn+Ke3x87LqJmGB+nk/vwdWtY1HtrNfxYfeMtAUiKO1
	YFHruHXuzwNEuoZ0oqdJQC6X0AEerAxWmL0DPCHZoACYHbDwXZ9m0FOWg+NTtLcED3JVB
X-Gm-Gg: ASbGnctqzVIyNjH1sN6BwlDFdSBqhuOv8vr8U5bLCai63qUbmXTcpSS/RGy8ixl6E1e
	aYWtJQc/aTkfxgU3M5PrwcNxNy+GTP7qIrF1Hlz9RM9svhk7FjXkhShpv32Phjaq0eRbIOYMjuG
	zUS4ldlvl1SwAhB7rAgObcsqcCC9tOh704ECGugDLgkq87KMhvSqAmKs3izo998R25DUesBtdQq
	N1jv2HypWZ2LdeffGehlDBlSbc6Rg9U+AF/MSIu6vT+OJL75v+p3vLh5EkBayF+kqo1fm/E+jqG
	oPLzrJH/fTod570SsJ6465n40zv2kwUgBar4loKC/eutzBUbj1pgsCKIudUzT+P9rYttYA2Q
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id 98e67ed59e1d1-31214ecdba7mr11894992a91.14.1748627267628;
        Fri, 30 May 2025 10:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYM6Tq0PT3L6Et0ngnLO2GAyc7Ioe4U+bK3yEkIDizDcSa6y+xjFo072yssMT+EmgOBPqQIQ==
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id 98e67ed59e1d1-31214ecdba7mr11894951a91.14.1748627267236;
        Fri, 30 May 2025 10:47:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:26 -0700
Subject: [PATCH v2 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=5805;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=S1XB9+JaEMa3iAt9Xnmf/DC2ThwkEN2OZRdUbvXaoBc=;
 b=lSebu3NXgPMqfVrX+ZExdEw0Qt9hbmK4Ngu6DhqZ8NRNYqWLC0MYOXj3XB+BigjIDIQIaX7Gu
 Xns8rhdsQs+CIcPDZ5zlZf1FMy3EZgvEUmv3T8M8JY4/s5MYN9ipqak
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839ef44 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wErF9Qt5opcPDqNnyToA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uS8UAzJWt-X9UC0bhMoz3ttLme6weGs9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfX+KCFtciC8fO8
 f44W6SSn1ocGomhcxtGc2XXqqLKHmYWpgb6n7yhu2xUZ01ct1Ajy7ro3Q+AXe0UkF0YW1vkI5Xd
 GD8M1cvxryeIpY22hYjAvGq+onikhsML4HhLq7qf/0OFzXQ+FlYkpzn61zl3uULSRxWmA0xFLA0
 zH4zXV6Ll92iG8kfavmN8g3RBLWEbj7CHKT1wbBlbwtC7+KugEL1dGshAYnIcX5ZgmqpF3PinOE
 gRi58NjVpdoxhiy3FX+51cYeIlSMNO/fyeAEGvIf1ZluDut3ErQ2GDf8rQ7XsyjoATU85iLDP4A
 w5doS9q+D1i+ocSqll0dMBiRrIIORuHltb4jjpInS8q+lodWM5nJvluB8lejCyNwl1HxECYq70A
 tlWhbMmssFVZiYd22sOcz2nyf5Wi1cb1gkCiIUwyDoOJ9NE2OIJO2pldcX39BqOuF2fS9RoX
X-Proofpoint-GUID: uS8UAzJWt-X9UC0bhMoz3ttLme6weGs9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=942 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Current documentation of assigned-clock-parents for dp controller does not
describe its functionality correctly making it harder to extend it for
adding multiple streams.

Instead of fixing up the documentation, drop the assigned-clock-parents
along with the usages in the chipset specific MDSS yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 7 -------
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml         | 1 -
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml        | 2 --
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml          | 1 -
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml          | 2 --
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml          | 2 --
 6 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 46a50ca4a986..a63efd8de42c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -74,11 +74,6 @@ properties:
       - description: link clock source
       - description: pixel clock source
 
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -208,8 +203,6 @@ examples:
         assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                           <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..951e446dc828 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -393,7 +393,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..a1f5a6bd328e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -216,8 +216,6 @@ examples:
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
                               <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..f737a8481acb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -269,7 +269,6 @@ examples:
                           "ctrl_link_iface", "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..7842ef274258 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -298,7 +298,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -389,7 +388,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..3cea87def9f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -401,8 +401,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
                               <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.49.0


