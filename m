Return-Path: <linux-arm-msm+bounces-68908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F07BB2436B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 09:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2066C16E375
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 07:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EBC07464;
	Wed, 13 Aug 2025 07:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWCU/c9p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC9B2D59E3
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071759; cv=none; b=bQ+L0qKXwhQg06UPwLkavaIukzKweflJeZumlzzoUzcsnJ16xnsSzYhRcXLKlK9tszIByysA4Nt5MmRqvG1iSPMDTPO4rYkf6S/h6wnu1zT1mRLPLTj9F3YVczVUynNVraEh0mdQrGkUh0d9m55Pmg9Tk98E5p9RWE/eKLTbuXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071759; c=relaxed/simple;
	bh=N/EFTl//MUVpepPSVYfso39VLXLEkNVBQ8GJWEUsU5Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eRW8zQDB+Q4C9K+TvnXQ8FjEAyVlLTapeqxj0cEY1AdmTHNnKUPTKeKzS3GybaiX1RS2Aj9ChaHh7CtawApTZSFfGp2U2gxxrGEEwgmuy0GBcccVbJAoR6jXlyOEOCmytttwjNxqjIP5793Hu5o2FgvnLAvTyw0GUAJhXbGxEtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWCU/c9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D6mSpk030423
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PbxeIGNssb8EQVu2gX91Sa
	Cd/YhbWEN2gAOYLERC55E=; b=WWCU/c9pA94DPQT4oid+EvX0oHaVGN8N/YvZw5
	yN06bSa7E/pAw4xrLqm0kzDM8QH8Dbca4+egb1J3s3ZMrbNqKITeEvXq0xQbKQQx
	73eYmz+VNY86VhMkq+CrJreT4AlfROUUTOAM3uQx3a1xFlm2fZnvLDpTHl9Ki3BV
	ABGsxuHsWM8G97Ajc+pmMf7/pggACSUsqiQ2Y4bEOb1AU2+qlpLR/JFPGyvhUvbp
	gIJRukHGosjDEU8Om4I7dfcVtdlwG9w6r34ORRyZFmhfHv3O/N+aTLywj8lQQYuK
	BYVtiYG7TLNcTArRSzuNbc8UeuqsmI5ittEp//vLu1zRYBlQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48g9q9t2ed-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 07:55:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76bc511e226so6257089b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 00:55:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071755; x=1755676555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PbxeIGNssb8EQVu2gX91SaCd/YhbWEN2gAOYLERC55E=;
        b=oDOO0t8/sqDI/jCuRfG0ptHDSHZpWxwFojFNT+y0atCyewdGk/uObzwsXhfklyMi84
         3jec7yzGdCc8KwE4/3+FrejPz/V3RZ28VX6YJTH8/Orcv/8Dgwa3oKQzgqKIWEKeesCF
         99EowW+2i+0nPYOMVQbGXubCK6OZW6/BMlys606/a1/jxyroP+l54roSoJhYMkJNEc0a
         9mirRw5cRIejA6Z9PDU7tUBYOrCLil36TnY/u9yEnV79XP+7o7EkHxIpvcGGTkXMvG+4
         IZL6RjbWEzi20XM6PKAtnr/GK43A+GANwokX8CjHpLZ7Q2IBAiVu3sldKU8Ujt+KdQCA
         d5ww==
X-Forwarded-Encrypted: i=1; AJvYcCVtFzVvgAhuMDB42x2h2T7lYHHpouEkFGmJpO//+ZO7fAkvsoE1y8XX5b3Wq2p88pJ9Dnrfv2x+Vc2eTNJE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl11D+0QjGVXaPme9kVf5cSeFqLhIm7RMOmoZxAI4b7207CgO8
	QgPgBSn1IVqpGIZrt6WnRgddPtl3twXAnVaIUigyjyR8wedVPqvRKIA//8d5AVy0ojZsDPW7YY1
	s9bOGFwLy/iAYqofW1l/0ajft8qdBooyUPvj30zHz9Rt2ZJ40O8wtq1K1Ynq/C8Z5oFg+
X-Gm-Gg: ASbGncvNLp1qyykCkjCrrvpO7hGe9Z0147hl0V8wcB8RezUV7O0DCb6umn1lznhugXO
	tihPEcQxJfYeQYxTKnEfx74EP6wXTiyLrq8p0n/ZkUbwLh373/gCW/ZSenGSJtupO5qtC5NjXUM
	J8eSObijZlY2osHEQs+LqHvmBcxGJ0dD81CoEyqjRJMRIjFoonBtdK8V61sQMva26ufp4gjm+fe
	N+GFXZhQd6L/xUoRGjT9fJuz1pm/ickxOwCWPEtye022NzcXBJljDpI0pdEFtnTprSthOLBhPn0
	OMHwFjm7s3LKC7oT1MLlzTCvTSRl1mdPGfCPeHU8R8v3ZJpWBkxMAWpJOgDBaztj
X-Received: by 2002:aa7:88d6:0:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e20fe52ffmr3695006b3a.24.1755071755280;
        Wed, 13 Aug 2025 00:55:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFejr+/favLOO8iLHlOBozznAzz7xZoBuIk5htMdciv+yIGlKh80pmUms50GL2E13VJAOM9w==
X-Received: by 2002:aa7:88d6:0:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e20fe52ffmr3694973b3a.24.1755071754778;
        Wed, 13 Aug 2025 00:55:54 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfbd22csm31395754b3a.65.2025.08.13.00.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 00:55:54 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v4 0/7] Add support for Clock controllers for Glymur SoC
Date: Wed, 13 Aug 2025 13:25:16 +0530
Message-Id: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOREnGgC/x3MQQqDMBAAwK/Inl1Ig5LYrxQPIa7p0piUjYoi/
 r2hx7nMBYWEqcCzuUBo58I5VXRtA/7tUiDkqRq00r2yD40hnssm6GP2H/Q5rZJjJMG9w36w1sx
 KW2cmqMFXaObjn7/G+/4BxyDCIGwAAAA=
X-Change-ID: 20250812-glymur-clock-controller-v4-59887f028a7d
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=CNMqXQrD c=1 sm=1 tr=0 ts=689c450c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9iZiYaJo2d43-za_6isA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tTRTwhZCGiPYW1Bw9Gygxt1rYZpGQYdb
X-Proofpoint-ORIG-GUID: tTRTwhZCGiPYW1Bw9Gygxt1rYZpGQYdb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE2NCBTYWx0ZWRfXzUMF5ZA03YeB
 sys4p+Hh8knuxdG+kiVAcbe7UENB3sPHMnmlky0WODhripQjHXzuAp7yvKpH4v1a4tWLL/RNgQH
 2WIsMzf545wnwUd+DkFUFXihEhh8imUI0B+SDoXkq/G4069dZcppbePOEwta+5lyhN2s2k+jSeY
 on9tX3ENudA4Hx6ghlSPrOx++rug1LjmzjnDXj439zsDqKEVS/5dsI/pR9N2j6WYr8koc9K3JHa
 FzueRvwLrHFGJysV7JmWV1oi3a76+fKaGnW6nlYeX43XAvamBJFNu+yNQuo+eh8ROXLKWTYzUvD
 THQkDcu1eYhWd8jq1hoVr9gS3KbWWEN322wNuGDcHQSxjaiaOCeAU1GwiwkP8zjYlb4n9a4b8i0
 ll9OXTjX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508120164

Introduce the support for Global clock controller(GCC), TCSR and the RPMH clock controller for

Qualcomm's next gen compute SoC - Glymur.

Device tree changes aren't part of this series and will be posted separately after the
official announcement of the Glymur SoC.

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

 .../devicetree/bindings/clock/qcom,glymur-gcc.yaml |  122 +
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
 11 files changed, 9704 insertions(+)
---
base-commit: b1549501188cc9eba732c25b033df7a53ccc341f
change-id: 20250812-glymur-clock-controller-v4-59887f028a7d

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


