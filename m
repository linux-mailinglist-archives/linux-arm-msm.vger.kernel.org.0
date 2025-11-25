Return-Path: <linux-arm-msm+bounces-83166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E538C83889
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 741FA4E7E56
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 06:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7F12D372D;
	Tue, 25 Nov 2025 06:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="irHJg6WD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kbYuoNbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D002D1303
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764053305; cv=none; b=ktooGzIw0SRc45Fi7zKgJ8CLs8gHnyQ+veyI4v3LaVTDduhXt4T4I+DIfJ5z3zjqTVa8zGQDCgSnb/sjhiUJ8YX2NTTyiT8qDc8xKp5cehd+i8upKISyjGoXJYJOFJr2VKtEKThqI5mv3fUeZ+c8elDD4ZHL8P0L1Z0Bae875r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764053305; c=relaxed/simple;
	bh=kxy9a4TLd5+8ceU62mrzWPJsxyY/8TDAdyPRcy8Rc7I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l6TIvkzENLH+RrB2rtlKs59phM63bRmZoHV3D1Iig0XT3csnMa5geyuiGgFaCMvYEBvVvI3VSrZJeBxOg81Kxy/YE7kIq5wT3bY08p+Bp7MXc4y32bJ5qtT7n/vQIaN723Ob5IbkUu6O2St1292V9LjGSeaw2FAXJao0L7KoT/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=irHJg6WD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kbYuoNbl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP2glZc1847843
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2
	DnE5mRI8=; b=irHJg6WD7cntxoKTNohfvDV4zyRu0DBDOQPFKb8UwalMUrsB+LO
	/Eug3cKOk+ulkjhssTjJ2KuPwvIwdwp9TwNWNEwCn02fyfG+j/bJtkMOmLRjqPXl
	IQ4mSbmA+TGaFv99Tnt0iu7GP23kIj6zd2asjagicIcKCyQJxxf0DF7a0u4uUJ0e
	fUw6KlwkcexO0bNXVFcTj6RJ6acBzPnT2Htpq0UrV14vnNEXMAS0YqrySRgtCzAN
	OUisu0XkPJ2lXchwbho3b/cNCGd7h0MfU0bfX5dgVIfk2ZQq+0WcFO/fZ10aFcJw
	hxkWaJFIxdcNTtCsV7cZfaOWOVOSNBGrLIQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amu6qa1ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 06:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edb35b1147so130209411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 22:48:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764053302; x=1764658102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2DnE5mRI8=;
        b=kbYuoNblw+h/B0lEjCZPaVxA9MusZRVDnHHzE/G1hND7xz+7V3219lNBHg67PLWxAA
         ErChXmmhuoDQhhN9VhAuW0jT81d7dIVce9Zp2zqx/glFnTM5Jk1Uz/Dsa7pPHKCJUpt+
         Xh+XbJmO0heqLrnydwA07PzUjd/al76bgUfvgj6m0OyEGIDdK7/XmwETGnmXeKwmwPKQ
         sd1jjo1oSlp2ZTHBdZucI+s2Sk3LmsRRi1l5GKqWmNyzGHIedyPwteql3ajwh8WesuTb
         oYXYIsIWv5DkXKBYkO9F/yNfZmhFCRwudlxU/pPXZtTwn17heljq4zwFQfyFdeId6cWQ
         K7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764053302; x=1764658102;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dYOLaJjZrmBTHo4tXaOJpcaKaQKHs0XP9i2DnE5mRI8=;
        b=Oe33kbYfGcrPdAt7uGFJKF0R3vFaEZA0RRBh2URgbPsEO2gf00c88s+gaT1t4VLIVq
         CgYVEExoNVUAdXe4qvGyFni5F3LhL9RNTt5qWgtXn+Qof0459C29RAJ/fvEF9/uns3rQ
         2Xqr+I+I/arGUdnokWAoy5ubEGAYLQsPcIte0ZTRconeHtdYGjE3GYtS+pnbs/T3zP/4
         /u+ncRTUrCQRzSTVjEWoU+HuiESGPHWkCMzkv6eb/XBnh2ZExbWCxWeRGRGQbNpNmHuF
         2Zo1/cfk8Xs9wMeTCLuUKPuos8TGeROzmSMPFOWYaha7mdJnFTdkvocnGNvotlJjxgqR
         Hosg==
X-Gm-Message-State: AOJu0YxJnAbTXCoJVejkTP1vPSBtARNECwD5lG09yO7gIzyWYGEXK9g4
	Qk3ZO3CJsqKzwdJQF3sWd142r7L6VOJGYRlSK964s82SvD2LGm/un9muYEDlO7SLqdGzu08kK9X
	8xhBUSJyeF1IfcJptI/lAYw1feiH8xdZuX4NVisr+1n1KEEVSnaGdi8WV88wyCKkeep0l
X-Gm-Gg: ASbGncv38KmjqGTlUYJvI+TJiP5JbIMAtdMhU0y9iuWHt8Tb1AX3+u64OympNyIkGpg
	iHmVz1EhY7I51futYc+ry7wsS+BI010Xpf9iPuXYIy0dPVEJRIr5qhvhoINj2leIbt4MgV18EEh
	fyyNtiNcsGowQ2gCj7Xg4EkzewuJkt3HoCBh1lH+nFApx7DnhoiYkg72TR2ci/QuvaMLuQxvd/S
	ibc2uY+gpjyzza8waSs3jreOcArtXk/d1Dpa/XEspNiUJMqAzCvmgxm8Pg4DdzKQ7394177Iy4/
	orEEJi02meqcBRaFBpirDRMhDkGDX8ATuoEyCLNHNfT2GVflwlPw3PgoVpqeUs6PkZPhCeGNw/V
	C4tZ0CanOjOSeBx+gRbd6rAxE4zApQpqNcQDC0sGHZg2NXXsVDw2cZcBpqGDb4JdiSAoS9KQ=
X-Received: by 2002:a05:622a:178a:b0:4ee:2080:25a7 with SMTP id d75a77b69052e-4ee58890015mr175373581cf.38.1764053301900;
        Mon, 24 Nov 2025 22:48:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUrdLr9BYpmQGzwmJ0SlyS3ENg5HvEmRUR0WaX5UbjFnWzh16r0Uou0347IEKlQMLAz7iT3A==
X-Received: by 2002:a05:622a:178a:b0:4ee:2080:25a7 with SMTP id d75a77b69052e-4ee58890015mr175373341cf.38.1764053301424;
        Mon, 24 Nov 2025 22:48:21 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 22:48:20 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
        quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
        yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: [PATCH v2 00/10] drm/msm: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:48 +0800
Message-Id: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Rv2p2VIafb665dkFqYubRADXV5_q5vzm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX3RRlRX9QzxXa
 eh9qsWF8QgvNPWm2iFzgpHeS3VH2Ih5REP7eSUCUgTTCD2dlEuCg2IjT8QSa294t9RhbPPZCkxm
 aY5H6tu8wU47mvYeCo/0RTVG4Grti6T5DJNpTxT5uekKSawakrNsEBrtkDtoTwCcNc9JTCls96G
 HozRC3nQ24X0Md75Joh2CMiXkyZqY2TuGMXXeAHXoC7VZGmGdNtW+X8UCzPkH7oxiFn9jHjYvDs
 xwJsUFzS0ObXyR5Mftll7J4MBtc3wuz8EoSOtStBmFVZMS6vfaorRbmptr+Ho8J2s1pLizvw3Wl
 1ucZeILctd5bpFxwu6i8RDC8g1OJ3/5zbsriEEnz1+b4JhTicV6tdYSc3xWnUo7GreaRty83EKq
 banwbRnRgIlYi4/1eQURBhQqE+21EA==
X-Proofpoint-GUID: Rv2p2VIafb665dkFqYubRADXV5_q5vzm
X-Authority-Analysis: v=2.4 cv=S6PUAYsP c=1 sm=1 tr=0 ts=69255136 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fD7pSEWciPXgxqq5vjEA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

[PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---
Yuanjie Yang (10):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  28 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 276 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 264 ++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c    | 224 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  22 +
 21 files changed, 1631 insertions(+), 175 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ssppv13.c


base-commit: 45a11c04b1a6fa180e37c4a2011cabbcc50cb48e
-- 
2.34.1


