Return-Path: <linux-arm-msm+bounces-70538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C5CD2B334AD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 05:36:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2808917E27B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 03:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7EDF24E00F;
	Mon, 25 Aug 2025 03:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cS6uwGiS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388A81C84DE
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756092939; cv=none; b=Aas4jF5oAwOua+zfrccYnn/gaGVYIPN1Z45sS+jvZ+V1Mfd1mAq38r6XRsNxzx/DrfdkxYLXCAHDPq2U/PeYKkX0fGHsmTjf67x0sFyd5u+txFUWGQFdz8IX8oIm8ZVV45+LglzyYLMTD93Wqjtaf5tPbQFZ9d6D0/Sr2QxwgMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756092939; c=relaxed/simple;
	bh=qZ9NL3rZTf4mXJQ9YET8ly6Im8x6i53yxwCgWen8p3Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mf04vXOgZ+pqhif75nA/zJkg3r4ojxHp9s5ZhxbXyfZHLD7JXb9PDo5zrgGlMVLnIOFG6ex6bcvcdHC2SR/jpywzFur8wAJWAiuD7Ydzu1qwHpOc2Rksy3xGbYmmREN9bAK2cozrP5Ptx+ooibAFMKI9Cd7X2EzFbgPa01W0fQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cS6uwGiS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57OMPC1h006049
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ryd2ucdQoY9f5gPBD78Vpn
	Qsr3dtA1iQPjb2w1Brn8U=; b=cS6uwGiSg0BcoDVpitcdcYWfx2TY8M713N7zgr
	dTx4/kfqoy4vWXVl4uDH6TLlmJSkU6eXGVpooLINm3vYOz9F7VA9Z9Xme8LcV3xG
	adGoKApUBUhqYpliVVYmNKZYft2eiqWqeeL1//KVc35wN7uEfZtRMGA/Ygh4kOe8
	jbUEa5jgqAxzAXDVHP3mlLra6gs17A9Qo2Jrx7bLDiEczislrOxKn9U0020LdemV
	8OkbywtdFkwPo/cvCKUUNLJnlhccJXDe+kfnVQ89Xyi5K10wYI/toYHk7Jd2eKmE
	t3tZGsZb1Xv3kUrcTTkwy4EzTPcFv5bc/frHOYAJvtag5y2g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thufvp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 03:35:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-24457ef983fso81321345ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 Aug 2025 20:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756092935; x=1756697735;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryd2ucdQoY9f5gPBD78VpnQsr3dtA1iQPjb2w1Brn8U=;
        b=oYYl92yI3Lck4e4dPCiXFnZbyijLK0pTbZMsFZF5pSAHz7lyhZTPU6lgXIn9lbKYKF
         ttuxHPGFaEyWcWJRx/qnbSFfmJTLuLkwj+pws3jA3fDTL8xvZRjBm70Sp5xMwy92FkL2
         X7C7SEAYbKX2jLawjmmmnDBMX+2qXWAP5fvMbpCAqVUnDMyk8GmXmM9iaNaKIY2u6ukk
         ynIUJaHLmEk8mhlgqQEjTq2+r1j8yXoS5cXuuXqMUgqQIEeqt4f4pCvfUXYouZ9ql5SH
         ftfwtMEc8JLsUv7DYY2b6WzjZA0DiASkXmB43pCVHWR98j7uJTvn9gQQU5WG3sFV4tqj
         ntrg==
X-Gm-Message-State: AOJu0YylxVS+RaVZVrt2raOBJHo7nxn179qP1Uv67Y5quWwJ7HvcfL1z
	YEQZiCKm3XhG5kCgiciDdBvpsXnAT7SjmxaUN+u2zp5H2mYr/iCON264Y1pOZvJ+OiBC8g7Ozxa
	ka/sNJ2o0q2JfcWSfrkEEkOT5dEGr+ncLsTwl2JF+p+CA8OWFO+83n+bSpZKKY6+G9Oel
X-Gm-Gg: ASbGncvPY7V0phkZ7Wd4zgNot/XaZyz7LhjdLRfHdwYg5u8TfNlHMuKATVseeiKrqOU
	gcPZyalClE6quJnsjPOV8uWm2A2phtstipmR9BN/fRkX+fcJhMkBSrhxCQNMcxcdp7sMVBziwNf
	jGYrfaCDTOXIQsTGBSiXUkEs3OY72RWbdBb8EAXR1E87cUdcqdhrlibHYw5hIVQJwAM66ySWlTe
	b/jHo78aWCL26pi38O5FupN2ySJ+hXRgCN43L/QAxjKzYwe81lNrJ06aDf3jIXWoEqy6o3nXMrI
	6a/6K1AzXSbhyto5wqQa7rE5GHZuzmGj0G78z82nCTO9V96+MaDSer6Y0jatNC7bb8IhDgI=
X-Received: by 2002:a17:903:283:b0:240:7f7d:2b57 with SMTP id d9443c01a7336-2462eeb705dmr137572255ad.28.1756092934568;
        Sun, 24 Aug 2025 20:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZlz+BrNXjKPCdx/qQt5dPlmZ8NTU+F+CBmNtLbnlpD6QJ+Eu4LuSzS//e9Ck4QkG1ZLKxHw==
X-Received: by 2002:a17:903:283:b0:240:7f7d:2b57 with SMTP id d9443c01a7336-2462eeb705dmr137571795ad.28.1756092934071;
        Sun, 24 Aug 2025 20:35:34 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2466877c707sm54859565ad.22.2025.08.24.20.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 20:35:33 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v9 0/6] Display enablement changes for Qualcomm QCS8300
 platform
Date: Mon, 25 Aug 2025 11:34:19 +0800
Message-Id: <20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL/Zq2gC/22Q7WrDIBSGbyX4exY/o5Yxeh9jBI3HTliSNicNK
 6X3PpOWsa3zh/AKPuc874UgjBmQbKsLGWHOmIe+BPdUkfbd93ugOZZMBBOaWW7psUUrGWu6iEi
 9rGVikQXPAilfDiOk/LniXt9ueYTjqVCn2yPpANGv1G31fIdqGg9Nh1MTch9zv0c615RRMFyHc
 rS09W5A3BxP/qMdum5Trpdl3CPMlNWMMEJvuJJS1oxyWua3zXno991w2i0h9+03IngEukDztK2
 YUMAcKKVCFIHVHsBFnmQCEySXrfEiJh4CWdzeM07DeF6bm80qd/dxv0uaTZFRzhgNiUuV1IPMy
 pvtD4bgfxh2KcQFsFo6aZP7h3G9Xr8AndwC588BAAA=
X-Change-ID: 20250818-qcs8300_mdss-a363f0d0ba0b
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
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756092925; l=5505;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=qZ9NL3rZTf4mXJQ9YET8ly6Im8x6i53yxwCgWen8p3Q=;
 b=wOyNd7e+GbOdi8G9BSuiD2ELPPHF1GGnTt/CoLuynz6f24q1qlD4nk+WsZystwKyZmkM17oOD
 ahNiNakwKMHAiuoPKrV9eUXG+v7P8RQ/W9txntcmuAWmcbhBwBTCZkd
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX6+WjEJXsphGX
 p12viI/+cMik1lWER8PF6XbsGG7Emz+icPqiAwm3rI0s/vs0/Ehn15AHUfXIm2wZbQy6hgiDJxc
 Q4HsZG80ROGMCIeJkAdfJ15KMnLDssmqx1g2BtvoqALJvsPAVwTTHH7uCYin5AGe2LsX4oPVFjT
 nKJSQMQ3sIEkU1Sl4l2cwzqA564g8KZHcxG9AswNvFFBVAR/VSI0wbjAQCFnOw45zo9qG+jWpky
 crJz0XcPXZEnJyYIO/7v+gf5bXR42I2I7eTL+b7Uw4j4IK7w9+6vFKK7t+lYnz7LgT+8UkJGtCA
 tJZNht3QTCHueGJDn/4QRVJwVr05Ak2T9PuPWgSQFXDdTUxa/M+vecG4xwb+ZnnTUjTXaz8bqa6
 jt0A/Bzl
X-Proofpoint-ORIG-GUID: ivd9CvRQfjF_2CD9F-oMzDzV9FjHhzPf
X-Proofpoint-GUID: ivd9CvRQfjF_2CD9F-oMzDzV9FjHhzPf
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68abda08 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=A9Q8OG8lNi9f-aPTaEwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v9: Fixed review comments from Dmitry.
- Updated the description of dp-controller DT binding.
- Add new clause only work for QCS8300(one DP controller with 4 streams).
- Link to v8: https://lore.kernel.org/r/20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com

Changes in v8: Fixed review comments from Krzysztof, Dmitry.
- Fixed incorrect description for dp-controller in driver/dt-binding.[Krzysztof][Dmitry]
- Fixed incorrect description for ubwc change.[Dmitry]
- Link to v7: https://lore.kernel.org/r/20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com

Changes in v7: Fixed review comments from Dmitry.
- Rebase to next-20250818 and 4 pixel stream series V6.
- Add more description for the dp-controller dt-bingding change.[Dmitry]
- Reorder the MDSS change and UBWC change.[Dmitry]
- Switch to the OSS email.
- Link to v6: https://lore.kernel.org/r/20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com

Changes in v6: Fixed review comments from Konrad, Dmitry.
- Rewrite commit msg in dp-controller dt-binding change.[Dmitry]
- Optimize the description in MDSS dt-binding.[Dmitry]
- Pass the sc8280xp_data as fallback in the UBWC change.[Konrad]
- Add the DP controller driver change.
- Link to v5: https://lore.kernel.org/r/20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com

Changes in v5:Fixed review comments from Krzysztof, Dmitry.
- Rebase to next-20250717.
- Change DP compatible to qcs8300-dp due to add 4 streams support.
- Add QCS8300 UBWC config change due to rebase.
- Add 4 streams clk and phy in the mdss yaml.
- Link to v4: https://lore.kernel.org/r/20250120-mdssdt_qcs8300-v4-0-1687e7842125@quicinc.com

Changes in v4:Fixed review comments from Krzysztof, Dmitry.
- Use the common style for the dt-bindings commits.[Dmitry]
- Update the commits msg for the mdss binding patch, explain why they
  reuse different platform drivers.[Krzysztof]
- Link to v3: https://lore.kernel.org/r/20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com

Changes in v3:Fixed review comments from Krzysztof, Dmitry.
- Fix the missing space issue in commit message.[Krzysztof]
- Separate the patch for the phy from this series.[Dmitry]
- Remove unused dependencies and update in the cover letter.[Dmitry][Krzysztof]
- Link to v2: https://lore.kernel.org/r/20241226-mdssdt_qcs8300-v2-0-acba0db533ce@quicinc.com

Changes in v2:Fixed review comments from Krzysztof, Dmitry, Rob.
- Decouple the devicetree changes from this series.[Dmitry][Krzysztof]
- Drop the dpu driver changes and reuse SA8775P DPU driver.[Dmitry]
- Fix compilation issues in MDSS bindings.[Rob][Krzysztof]
- Correct formatting errors and remove unnecessary status in MDSS
  bindings.[Krzysztof]
- Add the the necessary information in MDSS changes commit msg.[Dmitry]
- Rebase MDSS driver changes to https://lore.kernel.org/dri-devel/
  20241127-msm-mdss-ubwc-v3-0-9782a7c2b023@linaro.org/.[Dmitry]
- Package the DisplayPort controller and eDP PHY bindings document to
  this patch series.
- Collecting MDSS changes reviewd-by Dmitry.
- Reuse the sa8775p eDP PHY as a fallback compat.[Dmitry]
- Reuse the sm8650 DP controller as a fallback compat.[Dmitry]
- Link to v1: https://lore.kernel.org/r/20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com
---
This series depend on 4 pixel streams dt-binding series:
https://lore.kernel.org/all/20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com/

and separate eDP PHY binding:
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/

---
Yongxing Mou (6):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm: mdss: Add QCS8300 support
      drm/msm/dp: Add DisplayPort controller for QCS8300

 .../bindings/display/msm/dp-controller.yaml        |  26 +-
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 282 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   1 +
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 6 files changed, 316 insertions(+), 10 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250818-qcs8300_mdss-a363f0d0ba0b
prerequisite-message-id: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
prerequisite-patch-id: ffeeb0739a4b3d310912f4bb6c0bd17802818879
prerequisite-patch-id: f0f92109d1bfffa6a1142f2aaecbd72a29b858c0
prerequisite-patch-id: 9cabb6be69b17e8580a2cffc7aa2709106cc1adf
prerequisite-patch-id: a389a2e4eca44bf62bb2c861c96596368be7a021
prerequisite-patch-id: 4f02ab9314f95984ab7dc9b852ba4d6c676746a7
prerequisite-patch-id: 62d643df7c88d8db2279def1e4b63a605e9145c0
prerequisite-message-id: <20250730072725.1433360-1-quic_yongmou@quicinc.com>
prerequisite-patch-id: 2ea89bba3c9c6ba37250ebd947c1d4acedc78a5d

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


