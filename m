Return-Path: <linux-arm-msm+bounces-71242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEF8B3B89C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 12:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A525F7BDFB6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 10:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A97C2E3715;
	Fri, 29 Aug 2025 10:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gXVXEKEA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8B01FE47B
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756462529; cv=none; b=A0BLyPYFsLV16FRJRvXmRDQ3o25TmYwQBK5QQBYRYXL73GX9TMPas9900+qhq3bt6l9ypjPuvYSyhs0jKIchBCy834pODbtFTuHjdTFHiJuPGjUK7/X3YhZ9f+n0IN/wzKGa+TFaPNQinWfshDcm9mhcOTWEdnXaxejU4aj+ON0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756462529; c=relaxed/simple;
	bh=+7IMzm3dJQyIaL5UFTpN5Juov/HhX3fmuiG7C1O9X7M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Y/BzEjC/D4wZ4j8Dy6huyYbOcyDztElvxFMP3lE0HEaD0TOme0YYwuwKoZnueGVoUYjE6zOXYEHTY1c06CYDxmpe714ALC7iiypvovDC0CmTht+bl578ryojDMNqbzn/oKkuCJRxfTqSztkqzhpxscCPOrOckpfuQGH1A4PmDiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gXVXEKEA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T85Pux027140
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1xKcaJgxrBPyjChsn3f82b
	01oSG8OtqTmJA9Agd0y7E=; b=gXVXEKEAyZQLmn38krTaE+B4AnljUj3UzCzPlX
	jPGkpGZKZb54inT1sW6t77/v+DNGZMdpV7H5X2YWRpUbDcqgEJOwxhPfhKOMnOuB
	ugXDjeA/5cAwHQlYqcyyzmsiEO/Bz1NLTLy+5h1Q+0c/pn5TOmTeFGDGNKA83/f1
	xFkLDdsSjzz0CmEYcIiQEGN8cnkyQRbjnh3Z+fLK2K1oICMYnJMgV/oEHblWtFS5
	rBWFnPA7hEuzD5As5Q3IaaAaKjvIyaFyKJ/V3/84mQdmjYZSHwXsD4DCny8E/jDf
	GLYFlyla0B1Ltt8KUrlnhr+SLeMkTSt6WI0df0qIK+SzWZCw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgnb4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 10:15:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-248942647c5so32540455ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 03:15:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756462524; x=1757067324;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1xKcaJgxrBPyjChsn3f82b01oSG8OtqTmJA9Agd0y7E=;
        b=EHVsqN+HSoyP5Sdf+rvYn656RfWjdUobM/pod7ec1itmZ0V2/P4Ck8kBM4UWCspVBu
         CcjbTq/G41vqOi9PGO7C5eLUAX848t7JzTJNuohxLuLWmUuTNtSMg25554nbayGP8gfB
         +VU8Mgajuhqtakd34Tbik8qXWaf6gcWNLFxUAwM9aXallZkseqLYDoNRoYsmVvi6Z8HV
         ASO7DSM8ZdvSC4YNmckEyGYnp9tx//G/Z9ccp1lufmUcKV6K5V8BhDMvCMUw0pDBuVuK
         7K5X9TcxKJT/WJZtNt+XJxPyFcxXBWvi0bny2GQn7KIsxXTGbaOMPYB5dQ8ITk4+ttqp
         asDA==
X-Forwarded-Encrypted: i=1; AJvYcCXWi9s71zKfA+E6r1dXVTNDFmTDTYLFww9X1B8rt3JHV5vZJDJ/8JGTzZyGT9Mnbl/XMyyuAlWEve9v3oC0@vger.kernel.org
X-Gm-Message-State: AOJu0Yxzsr0BYeYZpUxoN/sK7Jqyu2IF6s3+29RL5QsohluC/qGxbvZh
	JaoMUW91UtYUy5LNSQ+CmNuKQanOSBaHSo6rEq9y+deNKvociTeyQpAKJMSHVXHF0yxzUrMDxbH
	JserN+egxdK6MdEPfoDddLi8htxAA6U55Na9XV6Mu9XMZE02eYZ2XsgkKZwSkapgUgR3C
X-Gm-Gg: ASbGncv+Sbxp0nWd9ce866WOpP6GQwWgbAqpNjW2bjkrDCt5Fa345VCLE/GfsHxYU1u
	Fke5FYUFOSEFy+7qlcwKXPbYH+DJsz4g2MImBgu9bTJjvOeZcCj6zdRoNBtN6LsQCS2Elk/ykcP
	+Pm9FYy9fQ3XQNK79EjaZ+gxAXwYb6PK3MneWZU4ZFhPaWwVBBrvFqr1z4Av6z4yRFkdg/qo99c
	X5btO1/BitgMRxAhm3nMEGAwfo/NjnvrgOtIHNoWBuNx+LwiKYyW/7P9/ubJQ8dipKp8pGs45iU
	VrMOf4lxjFEMxE8NfBV3hTc6tMhQhTNJcKzyQ9fGAVbGQd6CwkEpRclHee3d4l52
X-Received: by 2002:a17:902:e88e:b0:246:cfc4:9a34 with SMTP id d9443c01a7336-24875395b1amr151492565ad.26.1756462524370;
        Fri, 29 Aug 2025 03:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtgp+U+U5uatmdSx8ZasbDdBwKl1/vpZfFJ8DY7f9DIPtySa4vUKP/SOhlyw4v7Y/wEaDn1Q==
X-Received: by 2002:a17:902:e88e:b0:246:cfc4:9a34 with SMTP id d9443c01a7336-24875395b1amr151492045ad.26.1756462523776;
        Fri, 29 Aug 2025 03:15:23 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-249065d1b19sm20102775ad.131.2025.08.29.03.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 03:15:23 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add the support for SM8750 Video clock controller
Date: Fri, 29 Aug 2025 15:45:16 +0530
Message-Id: <20250829-sm8750-videocc-v2-v2-0-4517a5300e41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALR9sWgC/x3MSQqAMAxA0atI1gZqap2uIi60ppqFAy0UoXh3i
 8u3+D9BYC8cYCgSeI4S5DozqCzA7vO5McqaDaTIqI56DEfXGoVRVr6sxUjY6KpatK5dO/eQu9u
 zk+d/jtP7fhmE2LljAAAA
X-Change-ID: 20250829-sm8750-videocc-v2-6311b334f7a9
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: YBHtzB8N-W-fMYu9nw90490ytKZTSzak
X-Proofpoint-ORIG-GUID: YBHtzB8N-W-fMYu9nw90490ytKZTSzak
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b17dbd cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1P1wqcGgztCMLUttUvsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfXyEwvXSL5mMR5
 4jpuqoGNzGuHkMiLpCWuZKzJt+hP69tBckXh8+eq985zt1/avgZbZ8q5iS6xuPCdbJlQ3DbUgVj
 tI71b+xAn2QrvC2BWl4PWk81SXT6wvP1f/lZvssNcJwFJe3pWUq1rrgJW/Xm8pGrin3CK4TzpY5
 VrU1HVPjAjgcMoggTZIlup3eCre4AvA0FzylIXR4Cb5PxAXhZOBYdO7oAcLRnNTM5tv9II72FsD
 +5pvShaS1TzesK1HNElYlsxq1vQHUKwkTs4d/ge86OpPulWV+ehmXamzkM8lVrb0dWiAW9f0Wqn
 thXUeswEa/JDLwRDCqiB5GkMO7Eu/ixV8s2f9q39vAH20I64s5Mu+k2KeAZsZEdj+K4Q88+yKwJ
 hhrP+4gT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_03,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

Support the Video clock controller for SM8750 Qualcomm SoC. It includes
the extended logic for branch clocks with mem_ops which requires the
inverted logic.

Changes in v2:
 - Update the commit message for the invert branch mem ops [Dmitry]
 - Update the email to 'oss' and also update copyright.
 - update the RB-by tag from Rob.
 - Link to v1: https://lore.kernel.org/all/20241206-sm8750_videocc-v1-0-5da6e7eea2bd@quicinc.com/

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: branch: Extend invert logic for branch2 mem clocks
      dt-bindings: clock: qcom: Add SM8750 video clock controller
      clk: qcom: videocc-sm8750: Add video clock controller driver for SM8750

 .../bindings/clock/qcom,sm8450-videocc.yaml        |   5 +-
 drivers/clk/qcom/Kconfig                           |  11 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-branch.c                      |  14 +-
 drivers/clk/qcom/clk-branch.h                      |   4 +
 drivers/clk/qcom/videocc-sm8750.c                  | 472 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8750-videocc.h    |  40 ++
 7 files changed, 543 insertions(+), 4 deletions(-)
---
base-commit: 3cace99d63192a7250461b058279a42d91075d0c
change-id: 20250829-sm8750-videocc-v2-6311b334f7a9

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


