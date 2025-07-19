Return-Path: <linux-arm-msm+bounces-65726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F992B0AF0F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 11:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1438C587BE4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Jul 2025 09:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22144239082;
	Sat, 19 Jul 2025 09:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ajGrBT/U"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B31238C3A
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752916492; cv=none; b=k+x3+Jeair5PrLzoBmGVIFuCG/xRKh3CcciLnIPG0Fi3PCDEtnFxnCp652NmeEDEIQICHzsAZwE7xWUbJuGlIZabYWOp5aISwb/OcaaMzL+9k+Lfkaz97mwLUE4ZgsowkW0S0oR3U5wX94JVw3dduZJyK+wco+pI6pEWkwdPqNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752916492; c=relaxed/simple;
	bh=jwVRqM0theHy/Aua39lYnAS5tUnNexlBP199jrO9fzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ri2mGZh5XRlUwk6aXM1ub4wh8m4LRmYuqB+6Hy6XiBC1KATz/xGS2V4UX8tg9gs8oiK52mPbekQ6aWNfY4YqYDEWiJyb/DE3+aXXUr0Hko5Ffl7x64fpm4PtW1fAmtdWBRC/TlX4KJ2++adiMkeiXXE18/H6AlFeffLr0HKyctY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ajGrBT/U; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56J8pi2U009960
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5wZDc5GWMWk
	tbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=; b=ajGrBT/UWPZPh3lDzNJCKksjJ58
	ScqhDdABcfpZ1w+Pw/FlHyanswabIFUYVjxiW2c0uAWzDWRwhDruiy58CXBe0OHV
	tYpBE68t5FVXquVTi88ZGucL9ul5eejn66A2LNvUqvRRgMg06QXf59zjKFaLuEBT
	zR+jQbGo1syi62E+OhIjEf5iTcn20thjkNH1cVBk4+XztCEfN7mSH9aMtbRzVkpb
	riEdOQqJSPb1nrNToDEWSsDUyFU9eeosMMGBXXfa/H6gvhX3ar95EbIygdcA6e5l
	icOxtA7C1CHRR/J/cQFL3S0tWECv3zJR3n5MqA/1tL76U9qbiHl1LZydpVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044d8d6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 09:14:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e2e237fb4eso495619385a.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 19 Jul 2025 02:14:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752916488; x=1753521288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wZDc5GWMWktbr2LV45DqbpFgPyVLPIoTjpMyPCwwzY=;
        b=DRhKetIWCjbHIIMEQ56Gs9zY1B45V8kT5X7EZVC/kt0pxdAQtixwTUpM92ogiTsBpT
         DU1hp11a9dkvtIUdiILFER4LYPWQ9hh7eNINyUstjumn9PTKbGq+HsRdfTJ9TQ3FJItl
         7efUXr3dk3CVDFRT52seAfQb3mm8AgiW60aYx6wrvXgggA+l/Ssk1OD4EC+hqEDLzPFi
         dl+2vw2BVuTzVAgvce+GJrPLbE2baX7hHcccZWXbdMvxAAjAjw42O4LB5baYz+xkN+kr
         3CWb7SyoY4nPjsln4s6cB7WpXC43dqAEAouJHSZz0VZAbOUI+z+/joY8lFXGmZ9h1F4V
         oFdg==
X-Forwarded-Encrypted: i=1; AJvYcCUmHlqtKuiDMqdiF4uocKsZl+aq+4DTf/ajrJL3Mt4aXCmdf96WvdUPDb7YKSXCtd7AfvenJWaPqAGTSKqb@vger.kernel.org
X-Gm-Message-State: AOJu0YyEkZiWP5kjb1/n0LLYzHDBM55ZznP0dLX+cXc/uGEI+/rVukXf
	Ul53KOnEd4rUlDc81WusZMWAL8zoynNcqJH7GCSPYR/XAlFuJpvgqC+MRc7R8vIEnnSON5LoWGY
	iUyKZXj66C5HY8PHKncCWiNl2EYXyojW5XcBA69u8eO1M1IgVNBtvrgYrzlxV9xIS7d0/
X-Gm-Gg: ASbGnctvzbk+Mvxa5Zabd+5YZjg398UoK+BkIHtOG/fdMaXcMibw1lslhUoh9rImZVf
	jIdBt47BSe+bfZJ4GFMqavR8I4uPQN5lHQHPPewUvhwCjYDAPAzCWAIFdMJemAneS8WA5h0UdE4
	M9YOPSustxKqT4TjYE2wdWSoPJzD48AiNE7SaMk/gIfCgseUKQhzQx170Vn3tYNxe4zaRm9Jvef
	KUzLnMSJSClxNtCqKOOVblK9eXT6ZLXWg4H3QLSLd0HH54FmYkocz3vZvFrFBdhsu0clvUW7Toy
	bTWxZ3suhV0B4i3wN/O61eFzSOrs0SLw+exNWQ2if/nEzhmDQc5rYjFKegTZXCGn+jF2/+GHu2H
	ScQi8Ma8f15bbv21ITwvyBFahM83rCSDlZYI8vZbdQRgcLt7Dy2dN
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id af79cd13be357-7e34d9f79e2mr1305490085a.60.1752916488091;
        Sat, 19 Jul 2025 02:14:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDAN35XkTBQM2UPvbexmAbV/sfM9zAiC11TqR3XTg/5fyKgjdicRbMY+x2+0LlwRcobf3JYQ==
X-Received: by 2002:a05:620a:4050:b0:7e3:4415:bd05 with SMTP id af79cd13be357-7e34d9f79e2mr1305486185a.60.1752916487632;
        Sat, 19 Jul 2025 02:14:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a90d4ffasm5480891fa.6.2025.07.19.02.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 02:14:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
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
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: [PATCH] dt-bindings: display/msm: dp-controller: allow eDP for X1E8 and SA8775P
Date: Sat, 19 Jul 2025 12:14:45 +0300
Message-Id: <20250719091445.3126775-1-dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687b6209 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=jb3qBSlP78txkkNFhucA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JKsvlgp87OsBKc_STwrPAfizBlYon3BW
X-Proofpoint-ORIG-GUID: JKsvlgp87OsBKc_STwrPAfizBlYon3BW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE5MDA5MSBTYWx0ZWRfX8913FT5Jrvlz
 VQYYrpiqMCpq16xTvQFC/vJscJ0kj70gvz22LOOzCfFCKgZzunr52hNqJQGwKQf6HW1OoCyVpvc
 azawXpJOShy+Rt0oI1fLu//yvB6+F+XfQLvjJMFfvOVXMworEc8rGAWsHhRCj2V5u5WOQbMVM51
 8QgCI3AZi+odYnzTyvqlPmqafwQ+Qvt+DaTZlRioa8/UOwrbw2SR0zA+0Wqkwd+/Prk0dd/p2Rl
 VSYPUNEzH622JjJwSYYgklWWWyexzRJqvjsYx1oszyJHV6BlG6fE3nl843Glu4CDLxynw9lh9+O
 d9F0Z1oZ/WeLNcPOED9HsYGBE422YAc0SOfY/kaVq1KGiv/mRSAS0Klr5Wvums3w0P+60vrp/b+
 GCNqIcPAgazc0JetIEwS/xEIV3F1ZhOnOg1cRQuDtGjRNvyr2yVp6H9iNfMJohwWyV/kqVFG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_01,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507190091


On Qualcomm SA8775P and X1E80100 the DP controller might be driving
either a DisplayPort or a eDP sink (depending on the PHY that is tied to
the controller). Reflect that in the schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---

Jessica, your X1E8 patch also triggers warnings for several X1E8-based
laptops. Please include this patch into the series (either separately
or, better, by squashing into your first patch).

---
 .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 4676aa8db2f4..55e37ec74591 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -176,12 +176,26 @@ allOf:
       properties:
         "#sound-dai-cells": false
     else:
-      properties:
-        aux-bus: false
-        reg:
-          minItems: 5
-      required:
-        - "#sound-dai-cells"
+      if:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - qcom,sa8775p-dp
+                - qcom,x1e80100-dp
+      then:
+        oneOf:
+          - required:
+              - aux-bus
+          - required:
+              - "#sound-dai-cells"
+      else:
+        properties:
+          aux-bus: false
+          reg:
+            minItems: 5
+        required:
+          - "#sound-dai-cells"
 
 additionalProperties: false
 
-- 
2.39.5


