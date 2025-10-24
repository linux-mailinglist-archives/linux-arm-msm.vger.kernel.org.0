Return-Path: <linux-arm-msm+bounces-78666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 08842C04531
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 06:24:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6167E4E24E5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Oct 2025 04:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34C526E6F7;
	Fri, 24 Oct 2025 04:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O6Qu7Oev"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C502459CF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761279876; cv=none; b=Ju73+e8aKqqF8Mtl2KOdrIviX44jeN6qdjrzU3QT9xKNqmHtCsjsqTTXla4duWAE3Z9r+ms8mq2B0CD0tlznHL5qxUhbOApdgFojmGzusmaSierdmwWdOnMRhqULD9qiCKOID3EexGpFrFzIhQ3mxSHiNhBUdsH42BvINcvvs7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761279876; c=relaxed/simple;
	bh=tGAnsxVqZ1qFVesJkjyC9fOf0J+rr570DONtErHUzuQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sboEpEIdxz+7lFmA0s9ASEorOwtnmopDn1gmQu9rK+O/lYfmXXcvpwNm+BjAF7L07+aZ4URtY16brXpUWgBV15YF64MIBxDb9Iams2NNx1WoOaKx5ZwI2/HM0D00omNoelPzT9KIc11VZ7mo2RB5Q2dT9lAgfless9IIgKmBJhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O6Qu7Oev; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59O3FMcP016014
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=kz1Ixhzrfamiim6k99Hz3J
	JL+7qgj8J0kxsqetjMV1A=; b=O6Qu7OevskHW2JkdvLynQZdMVSR4goEvJQiqsU
	6yN2OXgCcdaPHp6Xxs+JMIdiKtYZY+OudUgWaDxuCG8iV3BaCeQqTydEDrnMR+ea
	FU0pTK0NkyiFeQG8Nd7eX66kVZmv8SI5xP5Daz6yi8TMKlAbkx9oyHk0z3RD8oli
	LlW8m6IT8+TpOAoxYBQkiFjK0/YaIMFwgov8U6oZDiFT/ghAYo+Hj05HAxKmnbAY
	DhKxtP8IKv9ZMq+wLAKw10QpUNakpEGJ04uKfJvM4xQsdPQVIp8gDJCKIrtNK6ij
	ztFzF6jAC5k7nxao2K3Bnh8c8j9DRJFcbpm2C7oInTeh6KYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xkpsgbwn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Oct 2025 04:24:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-290c9724deeso14788785ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 21:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761279873; x=1761884673;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kz1Ixhzrfamiim6k99Hz3JJL+7qgj8J0kxsqetjMV1A=;
        b=tzZKM/K/XebTByaBvzqA+vG/zA7+bS+uTXU6CxbdBr1Jxgail0p6kVj+ksNTw6tfZ+
         kq2nm6ygjr/HXbJo9yfmOvoTqu8jkXSfJ0CppWiVOxJ3OqOiN2Qaqx7T6OEwAs9+k07x
         o2zhVj6Aca0dLT1aodIQKfICoqhov2Ej/eIwP4QS23xz0eMOzQ4RwnSlMde9o9zu4VOF
         qTl5l3NMP8TiFXmmjOklYokrkMYlM5VtZjOYVBV1l/EWCO34JeHw/vfk59OeTaRyJkXi
         Y6fojUnfENIm7iPY7BgEHWNWudu/0DngHjhu1EIfotXT66U/LWMSlS9Z4jc7eVm+XAO+
         w7DQ==
X-Gm-Message-State: AOJu0YwwAGfas+mhW8MfNbRZehy4o9jKP3ud19BS9AkD2X+eYXBGf0Nq
	m+I5qdA9aYGBRE/evhBJ8x9mfb1VUeKdDtOk7XLAJ9VZiYk1oJ/h5sLhikmiCCTrOc0q0CzSulx
	pE5pu2nrX8PUu6hZuPcjMrz9JCCFTnXIF+qPAwYCKtGVrWIUnUdi0tFNCaaCxSDojJTSn
X-Gm-Gg: ASbGncuqwm0QnI/tLLqcK/jIF3SOkNl3Ch9FO/ISGfw19YdZ52kGyaZyRSSxMc1IrDp
	53MfYaWpp70PF074UmSSbPj4+0JlrMNUVxKxpa6YylWMUSohwNV9AsJ/1X1pwhclsWhBHSJZUCO
	BimQwnoPM+3qqqKyF4JjjHraNEycy4jc349RpSCiNHxeFgatwFDBQaEhV+ZPH7ucfOxmmhU5oWP
	StjdQ/Cymlx/aUZGBSGn69CveT4FOIiyzCL50ArDYXVfVQyY8sKDY6t0VaoXDscApcY+Oyh5/5w
	F96fETcQ+2AS+iEXJBJRvncurK1ImLS7BHc9ySVYwa+mQm4TPLOTOTYs8DOxsEvpEC4tXY3auD+
	frkvkmiRTLpnHfumWGJkM+0Y=
X-Received: by 2002:a17:903:2b06:b0:272:f9c3:31fb with SMTP id d9443c01a7336-290cba4dbb5mr344374455ad.58.1761279873248;
        Thu, 23 Oct 2025 21:24:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEw6FT4ACDLV4j5sAg4XbeH0ScrROVimqV0RjPACCbizARSrEerK8lT2E4YB5UHI9gIweZj7A==
X-Received: by 2002:a17:903:2b06:b0:272:f9c3:31fb with SMTP id d9443c01a7336-290cba4dbb5mr344374085ad.58.1761279872753;
        Thu, 23 Oct 2025 21:24:32 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dfd0576sm40259805ad.67.2025.10.23.21.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 21:24:32 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add the support for SM8750 Video clock controller
Date: Fri, 24 Oct 2025 09:54:21 +0530
Message-Id: <20251024-sm8750-videocc-v2-v3-0-6286bbda3c8e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHX/+mgC/32NXQ6CMBCEr0L22ZL+UAGfvIfhoZZFNhGKXW00h
 LtbOYDJZJJvkplZgTESMpyKFSImYgpzBnMowI9uvqGgPjNoqa1sdCt4amorRaIeg/ciaXE0Sl2
 NqYbatZB7S8SB3vvmpcs8Ej9D/OwXSf/Sf2tZUlRW1c4aKbFS58BcPl7u7sM0ldmg27btC5eLV
 Zm5AAAA
X-Change-ID: 20250829-sm8750-videocc-v2-6311b334f7a9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE5MCBTYWx0ZWRfX03ZwEuKnoGl+
 Sudx4yP4U3WqFZAyl5unjVWil5uDV7k7RGVRrZ1jsrfZTa7jNxev0gJzgKLSGPgG+lC4Rx2MzN5
 kZvpBqcZRy23WlBQGqGLKgMXAKCorz24wrwHUi36MmMbY4BQwivPXdNUJqMj67LJ+G3zpK+K6qW
 9yqKf4fZBA/3Hh3fioCj9NhmA9PVAHU1SHz5DNxslgI6vyNVbTluQE4gSuLnhLI/ZaLGR/iGIrI
 uHQXKMCH/TvRKc7xVvoQLaPkNeWEKrki6ENKZKjZjiNrELn36hDj3sqS5675tzkgxFCpiQj3IY9
 bvQQfPl580AfoLSgNpVVGkix5Ia3rG062e2jfWq5UyjqxrikgabwHgto8e7YDUfPKZE0eH2mlR8
 BzLbkbPJchmiTQQisNxKdTM2ueeoHw==
X-Authority-Analysis: v=2.4 cv=FbM6BZ+6 c=1 sm=1 tr=0 ts=68faff82 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=1P1wqcGgztCMLUttUvsA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: natX_s9gQ_3GAy39zsrq0Ws5xi-2lRtH
X-Proofpoint-ORIG-GUID: natX_s9gQ_3GAy39zsrq0Ws5xi-2lRtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-23_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510210190

Support the Video clock controller for SM8750 Qualcomm SoC. It includes
the extended logic for branch clocks with mem_ops which requires the
inverted logic.

Changes in v3:
  - simplify the logic for handling branch mem ops for non-invert
    and invert logic [Dmitry]
  - Due to the changes in the branch mem ops the ECPRICC which also
    requires branch mem ops are updated to align to the new code.
  - Update to use new _desc infra and use 'regmap_update_bits' to align for
    better readability [Konrad]
  - Link to v2: https://lore.kernel.org/r/20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com

Changes in v2:
 - Update the commit message for the invert branch mem ops [Dmitry]
 - Update the email to 'oss' and also update copyright.
 - update the RB-by tag from Rob.
 - Link to v1: https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (4):
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      clk: qcom: ecpricc-qdu100: Add mem_enable_mask to the clock memory branch
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   5 +-
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-branch.c                      |  10 +-
 drivers/clk/qcom/clk-branch.h                      |   4 +
 drivers/clk/qcom/ecpricc-qdu1000.c                 |  30 ++
 drivers/clk/qcom/videocc-sm8750.c                  | 463 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |  40 ++
 8 files changed, 559 insertions(+), 5 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250829-sm8750-videocc-v2-6311b334f7a9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


