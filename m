Return-Path: <linux-arm-msm+bounces-55115-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BE6A98847
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 13:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93F731649A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 11:16:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A942255E26;
	Wed, 23 Apr 2025 11:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R+UBqWbK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905261A0BFD
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745406958; cv=none; b=dWRNN9sCx9sc7JZphiNvg5wboWjppVz2DfKyaVAJkNa4c58wQ/HKZTkasEX2e0sqJ6f225jAIm9OCzf8+KJ22T18WnDa+Z+HDe8CiLTfsodS7pa9z3/KYhWsEZbfmICz6TkUluc2VLDK2VZoECT0jpfbB6aI+1f+Xo9+UCNy8Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745406958; c=relaxed/simple;
	bh=sbKZVCvGtdkZrIpTI8pX2iJJV/WIKTlKhFkyI8Uectk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Kb3pb+LZI5laxCF3AK7kMc+Yiudm7R6a+xUUt5GRbbKRz2M1r88IjrCNyLufO3+vLVbD/GtPGnD1U8iXHcpLIfhwkZwMw0osU9aB30uxTBMHwpK20b05ebpLAJwFU9merP3q1gXNq4Yt+UQYIyrIIDAM5oS+6gY23fLYZDIlJLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R+UBqWbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbimc024110
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NSUx02OYFI6C5J50Uj+1S8
	PyJZEpqQkJpG/qCn++FQQ=; b=R+UBqWbKFK2BTYPHRosXyf5xBSDtzNndIBr43Q
	LrbKZVeRdMwVEahvrmQyTPRM6nSQarJbN3+CBg7rolwe0KbtCHGOv5m3rwSIoG/Z
	zCvBuW0i7Ql68CA6lv4+hj9C7fLoVaI7H/bMYHL7M4hKwJjYwoyg2FNZR9Ks5wo5
	TehfOSL2hmskg5gZ1HILz9Kh+98Nq7Cg3DHM6DyDzwvyGdBnL5BgCqd/51qf4kpv
	A1hmJ6huTN/fDR5mTp8OIOH/FYaaLyzibyGFK2BbfFnrjQ7yxtjYWAofWDaGCFzD
	o2Fi8HtPOI+vTDTKCek+40LSQJ/YDG++u5iviOHZrgYyNcUA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh39w73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 11:15:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-af91ea9e884so520939a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Apr 2025 04:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745406955; x=1746011755;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NSUx02OYFI6C5J50Uj+1S8PyJZEpqQkJpG/qCn++FQQ=;
        b=EuLbvmtlQGAGS1JQ3XtQteflJxfV0EmjODzmXg/oLxrNSGD5BN9wv5lTJpwqF5oIk0
         FRh68SBE0mKVMQfg2YOGySe0LtBfRVFyAyHlM3qJ7R2yNeoyc8osFDoUsvX+V72EGrk+
         JxIMvUUApuskAD6dxxF+pgVhULAAfmyv0BfYNtmuS6deB7q9VLLnircvK1b99xDzEu5M
         +xqLq7XRlOpFtq4mZQ5Ja9npUEbJXxLhXFYz5OzUrmsQ8v6/Nkix21MlMB5Wm8kRSPfI
         8kE/btrkr5BWmDu5KhLq2GYQ8sVj5is/vjHJiaNtWnTSATP00mq0rtTFw0iJUYmVv+LT
         h2Jg==
X-Forwarded-Encrypted: i=1; AJvYcCXS5LY0LU2LnvV0+bd1l5SqNlXSaECtzy5u6RJm6e/WXfm2Uq0ij4zIXzvOPr9xx9veKNEGF4GfGqf6kBsT@vger.kernel.org
X-Gm-Message-State: AOJu0YyJsfytVVKLTf6gfZS5yIZz1kTrv/K+ykK2jnKDw1H/uFEtfiG3
	PAycje8wKIdjJ9MoQkI4d99NcOFGmt3kI7ypl/tmZdsh8COifKorVUrbKt3wdUv2mPpoZZZl6/F
	4pbrt9hH90M5j9tFMNWPdHyN2HcsW0rsyizo4PsvB/wK+kImAnGX7hWSknjoVmFTjOQSidQxenz
	A=
X-Gm-Gg: ASbGncsADCH2/4de6/b8OAhTLXqrXyn+mszbVEz3GqI9O3SBApjJBeJ9BINULQt82zD
	O92jYBnUJfGMQM4r/GfvtU7EvpDWzpOgq4rzKVluJqDCk5h/wmBnBOoNXeK1f9TveIqbYxa1+MJ
	tNOUQZaO54mNOSLsBG6N/zxeceqluMXblVoF7cRV2NI7uIo1wJLBVvHQkr03pqt4axqlpl9fdxK
	EWd0tDLq8+XWAr8WWUKK2jI4qp5an6S6cHPZQriGESf1DVDoZKenQtM/yiNOlecx1hN+pC9r0A2
	Dh5OXHnc235wrz2FVMHFhwgvJFbkxYCR5LNQl0z+ZP3Xzw==
X-Received: by 2002:a05:6a20:c709:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2042e5a7f04mr4616928637.5.1745406955429;
        Wed, 23 Apr 2025 04:15:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1oF0s6obzV3U4IlKnfQWtWH5A8XquDAih6ItXry12b4Upr3sQSi2punkUoDTdQ1EXTQzwNA==
X-Received: by 2002:a05:6a20:c709:b0:1f3:3547:f21b with SMTP id adf61e73a8af0-2042e5a7f04mr4616885637.5.1745406955045;
        Wed, 23 Apr 2025 04:15:55 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13c5f8bsm8787322a12.35.2025.04.23.04.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:15:54 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Subject: [PATCH 0/2] Update PCIe PHY settings for SA8775P
Date: Wed, 23 Apr 2025 16:45:42 +0530
Message-Id: <20250423-update_phy-v1-0-30eb51703bb8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN7LCGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNj3dKClMSS1PiCjEpdgzSjtNQ0o8REA3NTJaCGgqLUtMwKsGHRsbW
 1AJYLAmlcAAAA
X-Change-ID: 20250423-update_phy-0f2fef2aa075
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745406947; l=983;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=sbKZVCvGtdkZrIpTI8pX2iJJV/WIKTlKhFkyI8Uectk=;
 b=tbbxUT2NStAw36vwNZbHcB/OftIz+gc7eZ+AG3e4twO62qUi0kC4fopP3Opuj4FQemtV9iCAz
 pqsRHi3A4IzDKCq37LEwttq1MOI/cRwcggX0UYu1IiSaWOVwUi+YTqx
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: neAfa82cSYhMVknEUnJ82PLoJ7sC8m-u
X-Proofpoint-GUID: neAfa82cSYhMVknEUnJ82PLoJ7sC8m-u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3OCBTYWx0ZWRfX3CYS6wIL9aqo Gr09UeVNVm/4MIcJxXAPAMiLFWA5tYHYMLMwkOD9oGIL9pupWxhAw2ov2hUE3vKzKzcsb4A2LNA 9opVnwiZSsJhAtnhNuxnFUlf7kBRY/2qp+QdQ8zlwDPhRsuNnuhu/+Ac6jbZHd4TBzMaMbAuo+B
 zmyNfbqWqpr2TOO10zOBampBpXONa1qiONH81XrzSJFz4RaYDVGT3y/i05OiEF+lByu7zM7WMy3 lBYJaGdi8R9polgM7xwlEJ2QSdyXOa5pbhSWbd3OnwZoYpe/4o8hSSIL4yf9CFtIZl+vPhY97mR Y9Plh87jJhpgROOVdy3cAEiPjbBENfkUssBo/e+9OJzMU0xkW+kk3YLt/l3PhNrb4Hvw+91lSWc
 wB2RCOyD7Jgvc7l7UrRcourQW1M6FxiZ5gxrgqiSbt4mQZm8tdp8VtueHNMp7OiRwqqClYc4
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808cbec cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LgVGyxlFbL_aAx061p8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_07,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=635 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230078

This Series is to update PCIe PHY settings as per latest
hardware programming guide and update max link speed to
gen4 for SA8775P PCIe EP

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for SA8775P
      arm64: dts: qcom: sa8775p: Set max link speed to Gen4 for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  4 +-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 68 insertions(+), 43 deletions(-)
---
base-commit: 2c9c612abeb38aab0e87d48496de6fd6daafb00b
change-id: 20250423-update_phy-0f2fef2aa075

Best regards,
-- 
Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>


