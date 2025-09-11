Return-Path: <linux-arm-msm+bounces-73106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB62B5303A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 13:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A30151887EF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74B2631C56B;
	Thu, 11 Sep 2025 11:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W/3/0a2g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663BF314A94
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757589858; cv=none; b=k044kHJerR3GPgccvByBK9DkLHjmX79q+2NKNOi3E7924lgScuDhwUHEeQrFtjHtihD778Q/qD0vFzBfzjpMyHW5If6wEJDucF41yFXy+8JBVdIdtq0MLNUx+lqXvyXQkB0+325SvRNbNRCMfNUKSxwvxzCyThhFSm8uu0suxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757589858; c=relaxed/simple;
	bh=s/1T+D31g0bBfRYavOqwENc/3522k0AsmdZ12ZRSWZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mw2v6obSDqwg8oG+7emPYQF/sc2wQsboy8fEnQ9FLdypq/8BhdljIc2Gwl+U3Fjh+/3WT9jZMEucRRrFMCMmuueK3W3ldVsIOO08zJSpzGLOkxfpySJqkNVEf9eZzt8EkBQR4PNbwfji2nEvBt8ukGaXV2ckq1Vuj/JQelM7q7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W/3/0a2g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BBEF0n002402
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FDS423Gjn6+znX8tqCMjzT
	ud1+whZkmRe0whIAVRLPE=; b=W/3/0a2gR+Ps/e3URteG2ximy8KQzAk8FnuPf+
	iWE9rtDZnLlrQFP8kCQszJWYPfi+ZCcPvKnLZRjTUQrfd8lJ22aBHZbTF0V2nGF3
	1E5bib4U6HYO1fc+Nm+wavSqmpodxxGlonGHIGjKoR0QJ1+TUAhAUHeXFDS94FI9
	B+3IR4l5MfbCRpO9kx6HOi3T5E0PJ5VnJxmHVkYbkwm3MXQfcHBMIhcU/fpjxoh7
	cSENXlo8MS+581Cv+iPbPhuxM6d02QMEuu1TvpdvIfEDhDRi45qifixEgl4eoHc4
	Yc+lMHBz98sT/B+KK4GYEXW8HxrNo6KEOlaHG4qo+gTpIQZQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bwsfhqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 11:24:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-25c1dba8d26so6175355ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 04:24:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757589854; x=1758194654;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FDS423Gjn6+znX8tqCMjzTud1+whZkmRe0whIAVRLPE=;
        b=bE+n2RDnSVBKScdTw3czOkWT9CoMfjBZTkff/6Nlj3AZjSZQvgRflpe5TKbXgcaYxs
         juUNBiVVMW8YROhher3wMW9bZoUM2p3bPI0Az1e7ySZeS98xEzFuzZQhXVOQi6+y6QCI
         2SwdNUaaeHEK1h+1FJdbbxgZODyxH7NZxHrmNOW8mLd24LwzLIs8Z1MFOgfuX0aBJuAm
         EF1idl9DWczhVtDVnmPO9WrWb8VdkBxysFB1sFDBmzrCxjwmbDUgpf76w9fBXs2XSTa9
         nGuKsQzDYXVv2Hv1EeSXlcepuq0dSOSwqYl55genE3xkLZSOsq77m+XwStvZyg+3T9Vk
         twYw==
X-Gm-Message-State: AOJu0YyWo+VYiI6mNcVyZhMW5uf2x0Pg1fxzTKYj+yCsAyNWtQJxiSTy
	NAe8yJKCMmIMB+O4eeDNPAzmXhwji37vvtUQ3X0oquM9mk+xcc+lVczbWdzvsnI5ZAzwBnDDzIr
	/vo4dFQ77a0Nv0JrXAxHBoYnUyvtjl5lY2QLiSUKle81QFMxCVHUkemvz1EW1CmcQJLam
X-Gm-Gg: ASbGncuNuEvkoQm1QZvc1wFGwsc/3BoorDFn9qg23k2iGiO2E8qVZRX5SIKBu1Efp/a
	sv3iltPAM2zKskKPu7pAtSLc2ySK4OK/9oeSq+7gn4h79PEUgsyqjmeFlMAAxy5F0Mt5uRmboXe
	BpR6E2uMPjN6OdNnqWblq/4ucSPB+O7AvJx4fwA7PKtZfcbByvOHR4tZK/LUFGhM37A4T4tP4rh
	daUKXy2kInqKJRprFdSURo1RUYsTyLo2Oy0j1UK9c2YrjwN5I1OnlkaOFvGpXakX6XmS8RoaPGe
	CA64WkxeO4x2Z44dJFE/FbvsAk/OI9s95VLSrW4LPKS32+soep4Wzb0tVnGu+BR3m9BdYgEUpA0
	auWgDMU73pDKllXLz/2eKM4ro6HkPdOke
X-Received: by 2002:a17:902:cf41:b0:23d:f986:6472 with SMTP id d9443c01a7336-2516e69b45fmr251381615ad.25.1757589854211;
        Thu, 11 Sep 2025 04:24:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoBDLirfMfhmGKvavAai/ZI5dn47yVg9pTNdTv7KZc8akLZUz9rWyiQlLajY4JSGJBKzIqWg==
X-Received: by 2002:a17:902:cf41:b0:23d:f986:6472 with SMTP id d9443c01a7336-2516e69b45fmr251381105ad.25.1757589853668;
        Thu, 11 Sep 2025 04:24:13 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 04:24:13 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v12 0/5] Display enablement changes for Qualcomm QCS8300
 platform
Date: Thu, 11 Sep 2025 19:24:00 +0800
Message-Id: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFCxwmgC/3XQ22rDMAwG4FcJvp6LbCexXcboe4wRfJA7w5K0c
 RpWSt99Tjq2rl1vDBL4k/SfSMIhYiLr4kQGnGKKfZcLxp8K4t5Nt0UafW4QDrwCxRTdu6QEQNP
 6lKgRtQjgwRqwJH/ZDRji5+K9vl3qAfeHzI6XJmkxJbOo6+J5QTUI6ndNm8bGxs7HbpvopChQW
 fE6gGAMjdn0Ka32B/Ph+rZd5edlHnePybya5JJXK1YKIWqgjOb5rjn23bbtD5u5iJ37IaxJSGc
 0jutCGKfq0nGvrVU1KEQualTahqpmirGaCWODQzLf9h7T2A/HJbpJLsd9h6T/hjTJfEyppawwM
 FGG8u6YxZvUlcHZjTEHgtqiqoQWKugHhr42qhtDz4b1hnlU4Aw8MBj8IhpuF2GQFSWdsRJLVcr
 /Njmfz18gpM/8WgIAAA==
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=5558;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=s/1T+D31g0bBfRYavOqwENc/3522k0AsmdZ12ZRSWZI=;
 b=4V9nK82alAe+CFeWPPLI9h1X/7x+HJXL74IAe4kqLJYxSFTawMC5SkG4spPySUgesQh2Jhn2O
 eXcv04ReFQyD+/kBaZ3KEOfd568o1GxAq87zM2S3lY/XRSg5rrPY6B+
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: xMvc4N3wz_Hn02nDI1RxM7I2VewgrOnA
X-Proofpoint-GUID: xMvc4N3wz_Hn02nDI1RxM7I2VewgrOnA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX6EVa8/jMtWYt
 8tDcemhJLA/U6uH+H+kBq7l0JVys+TFv6RubpLA24kil0e8nuRM/fIa77yrUlMgmpYKH8gfUG8P
 8cP+VXokknJnrC6GV8x8vturiCtGr29GudBORoOw+VTTIp4TXWFvi9XE/aRiKYx+slguHrb6mBw
 8OidbHZpNjyGiS9+Oj+VBcW3W3pshtIpvmmvxn8E71qWRxEpjgVf3KZdexxpYgMqWyTwpflAkfC
 wqBcmGetuDiT4PkxmAB97B1cDTQk1J4j8snlIg3Fr9QI0+TVGu5teIgu5meQpdURx143AgxSKip
 XRHzaOWSBqXQTUSRB3QUOlqoG08KSmAzdJ3tc4rcfjNqJncmuBQvTnpI5I+9IhVYH4fa157xqte
 mGe3DKCj
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68c2b15f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=A9Q8OG8lNi9f-aPTaEwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

This series introduces support to enable the Mobile Display Subsystem (MDSS)
, Display Processing Unit (DPU), DisplayPort controller for the Qualcomm
QCS8300 target. It includes the addition of the hardware catalog, compatible
string, and their YAML bindings.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
Changes in v12: Fixed review comments from Dmitry.
- Use SA8775P DP controller as fallback.
- Remove QCS8300 DP driver changes from this series.
- Update the corresponding modifications for the QCS8300 MDSS binding and remove Reviewed-by.
- Link to v11: https://lore.kernel.org/all/20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com/

Changes in v11: Fixed review comments from Dmitry.
- Rebase to MST bindings V8.
- Update the clocks-name for QCS8300 in dp-controller.
- Link to v10: https://lore.kernel.org/r/20250901-qcs8300_mdss-v10-0-87cab7e48479@oss.qualcomm.com

Changes in v10:
- Rebase to MST bindings V7.
- Update the P2/P3/MST2LINK/MST3LINK regions in MDSS yaml.
- Link to v9: https://lore.kernel.org/r/20250825-qcs8300_mdss-v9-0-ebda1de80ca0@oss.qualcomm.com

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
https://lore.kernel.org/all/20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com/

and separate eDP PHY binding:
https://lore.kernel.org/all/20250730072725.1433360-1-quic_yongmou@quicinc.com/

---
Yongxing Mou (5):
      dt-bindings: display/msm: Document the DPU for QCS8300
      dt-bindings: display/msm: dp-controller: document QCS8300 compatible
      dt-bindings: display/msm: Document MDSS on QCS8300
      soc: qcom: ubwc: Add QCS8300 UBWC cfg
      drm/msm: mdss: Add QCS8300 support

 .../bindings/display/msm/dp-controller.yaml        |   5 +
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    | 286 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  15 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   1 +
 drivers/soc/qcom/ubwc_config.c                     |   1 +
 5 files changed, 303 insertions(+), 5 deletions(-)
---
base-commit: aece0ae517b9bdb725113dbdbd8f409a236bf5fc
change-id: 20250818-qcs8300_mdss-a363f0d0ba0b

Best regards,
-- 
Yongxing Mou <yongxing.mou@oss.qualcomm.com>


