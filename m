Return-Path: <linux-arm-msm+bounces-71837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADDFB41DE6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 13:58:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECF1C17ECA4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Sep 2025 11:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2209E2FC886;
	Wed,  3 Sep 2025 11:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWTXlbqZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F5A2FB99F
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Sep 2025 11:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756900705; cv=none; b=VbG+NNuqav59YhVP+PInp2wGpJbExARA82grvPFGvKATGcTDe8glltqySHDOwhipM4dWLChgXuqWjoCX+pk34E3W820EVhh05QOX6Zx7r66Tc4fFp3yN/Squ4k6Kt5Q0xxVo2YPD0mAIoTgOumFBtapqHeHurVAqJ1b0RqVU0G8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756900705; c=relaxed/simple;
	bh=ez3W78p0zTtxf088i7D4pbQ8b7ByUAjKoGhUjg8v0yM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Tg40V18Cb8zVM8rqc8fb5p/BRfjFe4Z3OE7aQwzq+L4aklqGnXWDlF7O7YDzj55kTZDOWZLM61NMdxe5Fl2PFq/6CrdvC9aSMsnF3kvRYz5800PSq0SOZ2ZC117HbYw9gTDlEMgipDHPmXsr9hcqnt23KQ9f4X18j05XDxdB07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dWTXlbqZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BF1ef013822
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Sep 2025 11:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=adL4EoeV2E7qkaOYZ7wEsJ
	r8JDiyLwLPPii5Tw/qlWI=; b=dWTXlbqZhxclpKFkQOhX309kJBm3xTtrNxMyen
	JWFI15QHX0hhFjrr2FLzgJ9v3Nc6N+4jR6hyQ/UtrtI1qfmMVUJWeD0FFUrxq87e
	cGo6+kX42FgYnlAzKH+ILFz0ZJv40fu656qDoWQ0fBj1Xf21vV4XrhLr1uuavn1o
	VUwVlRA0UXoYIUurMbfRCFm+DfhBwnzRFR4AOV5aVZJRtv5elRxOmLk9NRF5e48L
	01ul0e3nwx4QtirpmVFS1HHzpTg+oXoOdZByD9VrdqwYJaSUDUbhMMATEks43jqY
	Mw+kdbZwiDxDjLgjNxRSNdnrtOLXKkUXNytjPrcD2fqEYIBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3nt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 11:58:22 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-72023d1be83so54831886d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Sep 2025 04:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900701; x=1757505501;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=adL4EoeV2E7qkaOYZ7wEsJr8JDiyLwLPPii5Tw/qlWI=;
        b=hQCst1HKGc7Hck+Fm2J+Lz9GTWnDq+InDv2EmySRkWmmHmMEpim6/0yGfGbjmwefbo
         O9R1Qcs4DPAqN7F0tPDtG1kxNjdl7OF07mNxca8B1Jlnz+9tPQx1hRJ+ZVm8/AZ4ysu1
         On+HL3hBG2pQq8+XRFjr0/9IXPOVLOvkYBC/Fp/hxxhYFdnG3Sz4UGVrdedeYZ66Q7/P
         9a4tIPHyp4gelwssxSQgb4gSe9/nN/lWTlE9x7eLQBQzuasiaDDVsb3yP6TEbogWvEBi
         J/epjDfOCkqdYBEedQBhryvHV9J2CGN9p3pu94pKPggqf604edPTFtmxfpigwuUD+T0y
         Hsaw==
X-Gm-Message-State: AOJu0YzvU6FtwTQGuZdsBMcjKKc7Ocn4qWIVEgcolwPiw/KbTelVHRqd
	0kWh+VMLjL7eQC03Tb0BDJ3WveIi8fFcsuD748KDww9JbuuXUpzGpcl32u8yLkQfQ+MCKiSRpZW
	NEjTs7a1TYLlWWRfYvO8VsoJjxArbnd8GLY9aBeUM6Jx7/znrbZ89qLp8v/x9ngPZrcmR5ILzru
	5h
X-Gm-Gg: ASbGncsljbqVLnYEJs1FaVzFT4EOGO/MXUeXNXvcV8/7ZO8gcqO+m4nA8yvMZqq8AD9
	F5lirJOyVlzI/EP2PzIpfHrbui8wzuAWVU0OgrbfF79dj6/S4LvWQuKiTpFuHnDS1Wi0W+qLj1L
	yPql8KY6sLrFaNimLSZZrdVjMB6HSblyWz5IVqsM8PfkWaqpFReN9wrW0TgiD+4PuAyB6TaLwCj
	110g6huFTPANa4PP5sV3cRil9cvOkYeifDxvcCz1UP0CBkM0l/po57hXqqHxiaqExd/1C7uRqdn
	JyFUYiBIUh45T9IKEVgKoA197GlRacqaK3IUIuxVAfe9SY21LHNtVze4NrDAtnlFtoQb4SA46Jj
	SAPmkAWRWI0QDZ4v/ZzhCapwIOMH9vQmVHkCCR5kyYKDi1vt0YNxp
X-Received: by 2002:a05:6214:2349:b0:70f:a1b0:2f6e with SMTP id 6a1803df08f44-70fac8fa36dmr153972926d6.53.1756900700976;
        Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkjNR8zJftYH2Wc07pKXPYfc0mFr7V0otUSeuc+zOAN4SWBaLaXJ/nivFkjHennbtsQ19wjQ==
X-Received: by 2002:a05:6214:2349:b0:70f:a1b0:2f6e with SMTP id 6a1803df08f44-70fac8fa36dmr153972436d6.53.1756900700282;
        Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 04:58:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/9] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Wed, 03 Sep 2025 14:58:11 +0300
Message-Id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMtuGgC/4XSX2vCMBAA8K8ieV5dcvlbn/weY0jSXlxgbbWpx
 SF+912VoVDL8hC4cPldwt2FZewTZrZZXViPY8qpaylwbytWffl2j0WqKWbAQQnaivqwa/KwC6m
 tU7vPhdXSxFiVHiEyunXoMabzTfz4pPgr5aHrf24FRjGdLlujKHhR+tIrGbgB5bfHU6pSW62rr
 mGTNsKfoLmWfC4ACbEErYyqJXi37XJeH0/+m4TmwcgHY4WdM5IYCxVyB05bLhcY9WAcL+eMIiY
 EKQwaSZJaYPQ/jJ4Y4XREbVWUS58yT4zQc8YQg1boQEtLZxYY+8TAi9dYYiCAcdSmUtjwgrneB
 6FH6l9Ow30aWPAZiykpDZtVi+fhvfF5wJ7yr79PVi4liQIAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ez3W78p0zTtxf088i7D4pbQ8b7ByUAjKoGhUjg8v0yM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1WOlaFmFjIYTeG9HX6eI/ke20dxqwsfOOjm
 JJvTI6zj+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVgAKCRCLPIo+Aiko
 1e2RB/9l1GEJPABtTw7pbT4uzyjnWDx1YYY041Z0VdTx1lD+5xczNcAZrkygMlSwHeB4+sgPW0T
 Ej9Uev9JVkm7ynQSjSfwJwxPsJ9slhA9GI74CpXCZ7qtFprObVkMqJ5B4tUeUJCUKoVUJ+KJtMo
 idp1N4dDfEqk/KxJL7pz8az5x3qDW/xG2CbpphsiTSyVxX3yxPiMVmtDHxgfBDmr7uCO7TVEKYu
 kRd59fForDoiaFJ8MSCtGhIqtTY2jtzmV45Nl2GANpC8BJNx3gOaoFpDwVnzmMFJf24rt8D/spV
 OVL7AkwwuOjhp2RmUZPFv6QN6YrCp02TCIb1tVaShURjtBxv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX310BxkueNRl7
 qPdOXCOMq31cVEelAzPhuZA2To4HalQ8PPQQ0L7D2VTkX2fphIUqscU+ly0GSTrmLD7ErGEXRjv
 9JP0ZXuiZtixDIlR0/u+BZM8z6N65oIzDOlFR8K0U/AEl3kVledzvZIeNEB35ip7wbW4I7t1bP3
 w7BTDFFAVsx6SkiqnEcHGd15sKfJsCgTjLnWwKQkCUeIon8esl46mpvRe7spvPnrDlnAwIdRkL8
 guXaEBAqShsv68SNxxC/eXekGMZOpq2A2TDB3AnXvx9LuAZ3IgewXvLeuhWieXE7IeI3R0v2bEy
 lh09Nx3qRito0PeVB9CkweWdeKcqcuvNYu1C7goUdRALkEbW5coQBHvobW33hmQzq+R/qh3iYnP
 SdA3o/Nl
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b82d5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=rtwBFDCfVmBUUsGphOkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: vTHG6a4QzdOSEy_xC6WK60b6J1iMFJ9O
X-Proofpoint-GUID: vTHG6a4QzdOSEy_xC6WK60b6J1iMFJ9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031

On some MSM chipsets, the display port controller is capable of supporting
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

---
Changes in v8:
- Expanded commit messages in order to describe that SM6350-related
  change is not going to break platform support (Krzysztof).
- Also added restrictions to clock-names properties (Krzysztof).
- Link to v7: https://lore.kernel.org/r/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com

Changes in v7:
- Changed fallback compatible for SM6350, it doesn't have MST
- Reworked MST schema in order to remove nested ifs (Krzysztof)
- Didn't pick up Rob's R-B tag since the patch was heavily reworked
- Added P2 / P3 / MST2LINK / MST3LINK regions
- Link to v6: https://lore.kernel.org/r/20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com

Changes in v6:
- Switched platforms with different MST configrations to use single
  properties entry instead of using oneOf (Rob)
- Link to v5: https://lore.kernel.org/r/20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com

Changes in v5:
- Removed SC7280-related comments, it has no DP MST support
- Link to v4: https://lore.kernel.org/r/20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com

Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: expand to support MST

Dmitry Baryshkov (4):
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P
      dt-bindings: display/msm: dp-controller: fix fallback for SM6350
      dt-bindings: display/msm: dp-controller: document DP on SM7150
      arm64: dts: qcom: sm6350: correct DP compatibility strings

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 146 ++++++++++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  16 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  20 +--
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  46 +++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  23 +++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  72 ++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  30 +++--
 21 files changed, 376 insertions(+), 116 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry


