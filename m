Return-Path: <linux-arm-msm+bounces-70755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188CB34A17
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 20:20:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30B611692A9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Aug 2025 18:20:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6596306D3F;
	Mon, 25 Aug 2025 18:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsbjFYjB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E9F309DB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756145971; cv=none; b=lxEjX7Ir+9KAMN+WMTFx+bccS82t2rbdQR0khA7Xl/i7EIhkRE/et/L6vBzZMrAXsEhqO7Pp2sJTew9FpXj9Rtv14gBkMRS0EWJlNsqKv0M80s6w3Dxg8Oq8Y/BSbwgOIDNawnRBSqpmmHvsHXGaSa/mxWdfvpPNtCdn/7ujV58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756145971; c=relaxed/simple;
	bh=2CzEcrYm4XTOiqK8m34i8odSZZw0BFHNLZkz/gbIabs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=TX9lYCZ6gPw4UsSCT9jkTqDjLMi7D0vkeOM/kkbgtu5kiN/VJ1sUehip6Rco0OTMeAixSLSx4IxyKvEAaxSBkQYvCKfQgmYZ5hYXfPMmFFGN1DrK/C1WKO4Dmua073qgHPGXD+3/F2lGn19ExefAYZDKuBMQLOzcrymDU8e35g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EsbjFYjB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57PFfOTZ006050
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=A+MJf3gYcSkZlZ5iU+sJo7
	4M2Td1GfyUqV5Y/ilHPak=; b=EsbjFYjB2Lj8eO22JFGTanrUpr2T5fkcnKHUTo
	lBISo5uLYOOO3CrYD4hABr3v/aEBgBr+iIXZ1+SBMlRLUPmbwM68EyA239VS7vuO
	kmxeRSchNI2Rscehry4/xQJ+3Lj13eF6dW4LbkyVOI4rrNFldDflI8VidiYdDd0I
	BCleUG++tGokvRAENoJvsTgT8DGr1WxE5rlFYhn5pq8gnLVCwbH9nzxWPSshD8A4
	RccK0uy5B26//sNK4Wjj6ChFRMFeBHnuvrty1tv1n+6hlm1PPLe8CIw4US5brMAF
	hcCs0hygjh9E4Na2v5TCPkOWAMKPGsGZSo01lRqOT/NvLXVg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48rtperfjj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 18:19:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2461c537540so47587925ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Aug 2025 11:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756145967; x=1756750767;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A+MJf3gYcSkZlZ5iU+sJo74M2Td1GfyUqV5Y/ilHPak=;
        b=N32WM6rzeCd8qrTEGa9vAZxiRHl6B3weU4vQa+v8cunG4AjSujZQK5GSrD4MryXAzu
         T5wSZFogdLjGRdqWL7pVT9VhGGA56SCwacq2qy381QLuwVtBeIBQuAeVqxuqERMGFoz+
         S4Awm0eb6211OgD5pBwAExTyROnb0aOXlUwuMAZC6AgvAE0quiuRsy49fQMA+ZplYSry
         YURjQ/sUW8jY4QXBm4o4Vo6fuPRKi8kkPySZOml1HgiJHWgE4Hl8YOGOC2FiCsTSHfZg
         9fGBmxAVErliC07nJfLpUugd5PV8lYSNTWeS5A6+JdoOP5aJ8//sDA5Sc6G/sXtt3Vwi
         RrbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4XSQURrlJjw+GDfm4PoIpiFcaYrJrSGH/a66U2fZXUIM6jGNndzoIDsl0TO8t5LEXRHdDN7GSmjwo7Qx5@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+8FBhXDgicIunP4ev2lYYm9buKBg6Dab9htqNrKJiLfD9lDMP
	q7cau7mSpTGp/X38fH0x8zXsr8fIhmae7qfHpqGUfRaclJEVDZ0Ln69iFB654rtNB6YrQRlZlfT
	yejSyyFqQph/DWHekGtGhQYpDP9xHC5BZr6Fc+8G59kQqU2PAPTPf0gB6VARE88WXH4Xx
X-Gm-Gg: ASbGnctusHAiVe03K803gUUsrYvbx5rz0cjgruB/5TeV97Nc+DjAPhiIc7xaLLgVHHC
	xlDief/FiEZfpnKmrI9zfZd5JRT8boitDbspEb4VpCW2xlySqvC2vMSq6RL/wXLlv/5HtlNUgCv
	s0uaJ2tM96+b+CKRWEcMI5MhkB/ebEz4rinE28GhiGObr9C++lYZ7gqyGOxb9iKtOCqvo+4/pnK
	uq2l+Js8LfOYCXYTMGmW1Yl3O4uHT0B36YRs4twGlq1mOu3xNi+BlvWaSdxaD8c2/wWxBXsO2Ii
	r/ds+gxpotROmBipMrjc8qIfkoXr+IMMkfLa4qcD3qMNVsf4e8v2DOjElewjkw/W
X-Received: by 2002:a17:903:40c5:b0:246:cc19:17eb with SMTP id d9443c01a7336-246cc19229dmr67934935ad.19.1756145966957;
        Mon, 25 Aug 2025 11:19:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfrQ3rfUy1vjKe9ObjfuC5Y7lAp3eXHihBwf3qoFxZvehwnvsdwwga41y5vUdUY+s9TveoGQ==
X-Received: by 2002:a17:903:40c5:b0:246:cc19:17eb with SMTP id d9443c01a7336-246cc19229dmr67934395ad.19.1756145966420;
        Mon, 25 Aug 2025 11:19:26 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-246688647acsm74174015ad.87.2025.08.25.11.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 11:19:26 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v5 0/7] Add support for Clock controllers for Glymur SoC
Date: Mon, 25 Aug 2025 23:49:07 +0530
Message-Id: <20250825-glymur-clock-controller-v5-v5-0-01b8c8681bcd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABuprGgC/x3MwQrCMAwA0F8ZORsI1eDYr4gHjXEGu1bSWZSxf
 1/Z8V3eAkXdtMDQLeBarVhODXzoQF63NCraoxkCBaY+MI7xP30dJWZ5o+Q0e45RHSsjneVEpP2
 djwQt+Lg+7bfnl+u6bqtaSM1sAAAA
X-Change-ID: 20250825-glymur-clock-controller-v5-07c400e8b530
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: FCUKPvx3vST8Po-QfhR4drj6R72v0rH1
X-Proofpoint-ORIG-GUID: FCUKPvx3vST8Po-QfhR4drj6R72v0rH1
X-Authority-Analysis: v=2.4 cv=Hd8UTjE8 c=1 sm=1 tr=0 ts=68aca930 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=0T6YAe87-15ivgeVu1UA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE0MiBTYWx0ZWRfX8hekty+45EHo
 pgG6/A8Of6Q9I788mksJHOWMYbqig1cTy/URRNRBDBfHbdpIXGa+hSbVrC0eJpsq42Tkz4aLMlM
 RLjLnCkuhU+dG1e+G0uoV54SQeG0RLEPa0vsU3j8rDrdXkwdzF49izJZPFY2ZuHS//Y3UKJ3tg2
 lrrHnjODplAuDHSRPPdJFwQuTAAj/CuhTdL98n1WwcJ8JfhgvRDPsf8t9Rs1rWoWMHqxFhlcEth
 4IyXHz1iZefEDJBo+Ug+xpVRvrlc4eQLE7xCTUBL8b9MwWHGd3LQoj738Ywic0XIMC+WQWqqcwY
 qxTRXZpBxDWL2gEkTI0B2iIWOXqt06RC0/ChmJlufFb5pRmVbSN3WJ2w/epEjCc2naL0OGRAUPW
 kC3mEsNJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508250142

Introduce the support for Global clock controller(GCC), TCSR and the RPMH clock controller for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

Changes in v5:
 - wrap commit message for 'TCSR Clock Controller binding'
 - Fix the GCC documentation binding for the clock descriptions and
   clock phandles for 'pcie 4b --> pcie 3b' and remove extra 'pcie 6b'.
 - Add RB tag from
	- [Bjorn], [Krzysztof] for RPMh/TCSR clock binding.
	- [Abel] for TCSR Clock Controller driver.
	- [Dmitry] for GCC clock controller driver.
 - Link to v4: https://lore.kernel.org/all/20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com/

Changes in v4:
 - Update the commit message for all dt-bindings to incorporate "Glymur SoC".
 - Add the xo parent for the TCSR CC clocks[Abel]
 - Update the GCC driver to cleanup dfs_rcgs as part of 'qcom_cc_driver_data'[Dmitry]
 - Add RB tag from [Konrad]
 - Fix the broken previous patchset links.
 - Link to v3: https://lore.kernel.org/lkml/20250729-glymur-gcc-tcsrcc-rpmhcc-v3-0-227cfe5c8ef4@oss.qualcomm.com/

Changes in v3:
- Update the commit message for all the dt-bindings [Krzysztof]
- Update the commit message as required.
- Link to v2: https://lore.kernel.org/all/20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com/

Changes in v2:
- Drop second/last, redundant "bindings" in TCSR and also align the
  filename [Krzysztof]
- Update the year to the copyright [Krzysztof]
- Align to the new Kconfig name CLK_GLYMUR_GCC/TCSR [Abel, Bjorn]
- Use qcom_cc_probe() for tcsrcc [Dmitry]
- Add RB tag from [Dmitry] to patch #5
- Link to v1: https://lore.kernel.org/lkml/20250716152017.4070029-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (7):
      dt-bindings: clock: qcom-rpmhcc: Add support for Glymur SoCs
      dt-bindings: clock: qcom: Document the Glymur SoC TCSR Clock Controller
      clk: qcom: Add TCSR clock driver for Glymur SoC
      clk: qcom: rpmh: Add support for Glymur rpmh clocks
      clk: qcom: clk-alpha-pll: Add support for Taycan EKO_T PLL
      dt-bindings: clock: qcom: document the Glymur Global Clock Controller
      clk: qcom: gcc: Add support for Global Clock Controller

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |  121 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |    3 +
 drivers/clk/qcom/Kconfig                           |   17 +
 drivers/clk/qcom/Makefile                          |    2 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    6 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-glymur.c                      | 8616 ++++++++++++++++++++
 drivers/clk/qcom/tcsrcc-glymur.c                   |  313 +
 include/dt-bindings/clock/qcom,glymur-gcc.h        |  578 ++
 include/dt-bindings/clock/qcom,glymur-tcsr.h       |   24 +
 11 files changed, 9703 insertions(+)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250825-glymur-clock-controller-v5-07c400e8b530

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


