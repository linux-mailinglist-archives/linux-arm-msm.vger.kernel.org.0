Return-Path: <linux-arm-msm+bounces-61585-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD67ADC98D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 13:38:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 336883B415A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:38:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02C2C2DF3C0;
	Tue, 17 Jun 2025 11:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i68Q+jvS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF942DBF77
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750160310; cv=none; b=be267RALUJOOysj1Vh4ri+UzyMIqp3KSA8VlyKuhxWV4lTR39SStyIL7oCbMPRXdzK8yXpSee94FI23XkxdUoAbtcJ/7zWDcmXgB0qvi5K4/1qev/mG4GBA5yQlBI6uM1n/7hmItlyvT5RnVXGIfAvce4ZFPR78TpjcBSvoDvVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750160310; c=relaxed/simple;
	bh=AoKaRIePSZxkPcYuE8HxMSWHLnp27kcoD7fgZtCZvYo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dBDC0vZXPiA6In+qgmQ4k3PSAYrptLPuf7L7v6Q5NtK0yZLmyZYW0xt8Mf2NLWTn7ix2E6MB97VVFQsK7Ndk4SituppiKugXM2H6VVn4xTcvdaCUr8Q7gDxgFmncjZofvhBFTbAmsijXgP3QpR2DHQKoWviewCYNzMzwY2oxp7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i68Q+jvS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H78Lhk017925
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7NrIe6ld/xYMBbLACN69Ja
	xaxBEqU9wPH4VfOYfdgdM=; b=i68Q+jvSqe+evsGIoqS/2oQqADv/L8bjLr28FI
	jOVLjOPll83vCdBD/5nQ8aE7qmktiiWqYbA9EuyssrCDmSiAElCvEpOMRc6GLqWh
	o/IQNRPlWwfzsrn9Bz0H80ysvsRIWiXwEVL92w66m5DZs6/TzzeWOdXSc5zN2vM9
	OFGPDY1eTnOzTbvKhCvm7dc1DcociCQ4WTXJeDPXv/s0U3hxRXy1YmFPEWl02Oj5
	XEn22ST4hDaQgScOC5ki2TUclxOswkY7WU5oCoKWQa6mYkdyfoE+vwotZYOqQUig
	21aYHFRaPwh13ED+otzN50gJVMGvob1hZzhCgxEShOTk8lSA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hd065m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 11:38:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235f77f86f6so46933405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 04:38:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750160307; x=1750765107;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7NrIe6ld/xYMBbLACN69JaxaxBEqU9wPH4VfOYfdgdM=;
        b=AsEv1uG/RjQxq36E/2O/8cnzECXTrj5ywGtdbj+u7jZ6EKFaJKOyZzf5jjtaNJMl4x
         1TQYh2cOtCvfjqWNKD7byQSxppLQQrT5qJobk/UMHN5XnKbyAf0JF1lVmEYiGCxQ98N1
         24wMGqY5xuwz5NGJAOZPw2F1TIr55UTrZIehk6tMI8pSXUEv+/YB+gsAbDxWTQN4mQfO
         4qOMFErfBh00FXBoC5uPUPDY/Pg2hB3lFoGY3ZjQnDFMjJNLoSLAtLW9ZjP7DhqeLIHC
         tsCHSUJv1HhEdDZCkf/Q9J3rf2ztHSosyd/YiTVsks2hJ+M3+2XI92wxbc4Q8/6mcArZ
         6JvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmuirZSc9XK1VqlJ5fANEGWtkIcG20TgPmN298dxl9oq4CC0T86rrcyT/GKltCwRbnvFliVC11m8FmO/+b@vger.kernel.org
X-Gm-Message-State: AOJu0YzIq9+VB2yV7oLyA7fWq5xKoas/VGSMZlKQ5kcAv975rxYnZt+v
	zDVUE0Ag18RKvuBHUNkC0xdBWUTUmIvoJfGK1cqAUsgmvNitLB6u0985NGDJTVeRZl0+y3A3gTl
	MihpvN2wKpRFfPHrMdrLdKB+AZRa2RRixvv7W4c98/ZTop8As13qxj7BsCn1vYgtA5cZr
X-Gm-Gg: ASbGncs/4rz9PhfWfOYqn+LO2F/PdQbp4hsUBxVZn9dtW8x0GsBRrjqrlrJ2o1hJvau
	2FxjjVF3gnt/Th5ysQhB9wVncI1tAC1MGOhdrKbsXH7L5Frj++1xTS/WYAWhQKWARDu3/cAZXAa
	dcnOd92BBM49kRy8sU7wmHyEfHNngcykkASrAfitiHjx+jc/l5XdRDhGNARSRmIKD2tTHheWHor
	X3ByRPpAejQbd4AColzcLc3DFSFUs6M1wsYraXETnEuUdO+6JP7Sx8q42iAyhh53lfuMFUk5fX9
	EndtBZCklkaBbs1OmPhdw+7+bIPp9TOgxCC4QyhEePT7ABU=
X-Received: by 2002:a17:902:d585:b0:235:f45f:ed4c with SMTP id d9443c01a7336-2366b13c99dmr218323535ad.24.1750160307385;
        Tue, 17 Jun 2025 04:38:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1NoTubG90HYcYq9U1zzEt7nR7yUJ1t9hJT2vkcR9u8+zt72VBXQPtx9/r3VZrB0ybU1dDpg==
X-Received: by 2002:a17:902:d585:b0:235:f45f:ed4c with SMTP id d9443c01a7336-2366b13c99dmr218323155ad.24.1750160306988;
        Tue, 17 Jun 2025 04:38:26 -0700 (PDT)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d8a1919sm78246895ad.66.2025.06.17.04.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 04:38:26 -0700 (PDT)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Google-Original-From: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Subject: [PATCH v5 0/2] Update PCIe PHY settings for QCS8300 and SA8775P
Date: Tue, 17 Jun 2025 17:08:18 +0530
Message-Id: <20250617-update_phy-v5-0-2df83ed6a373@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKpTUWgC/2XN0Q6CIBTG8VdpXEeDw6Gkq96jtaaAyUVqoCznf
 PfQraXr8jvb739GEqx3NpDzbiTeRhdcU6ch9zuiq7x+WOpM2gQYSCa5oH1r8s7e22qgoE3G0Bh
 AxkkCrbeley+x6y3tyoWu8cPSjjBfvxlcZyJQRg2WgisAjie8vHqnXa0PunmSORTFCoPcYJGwL
 ASX2gillPjH+MNHtv2M82eGBYeiyFQJWzxN0wc7TVRwIAEAAA==
X-Change-ID: 20250513-update_phy-2cd804dd2401
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_nayiluri@quicinc.com, quic_ramkri@quicinc.com,
        quic_nitegupt@quicinc.com, Mrinmay Sarkar <quic_msarkar@quicinc.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750160301; l=1584;
 i=quic_msarkar@quicinc.com; s=20250423; h=from:subject:message-id;
 bh=AoKaRIePSZxkPcYuE8HxMSWHLnp27kcoD7fgZtCZvYo=;
 b=cilGk9gcJ508r33BUqBd6d2pfmj8yu2jxGV6L2W/kO/iu+QelWDRZ0xozeuMjjhiRFyKAKUJt
 tQdCy4x+8roDabUYn2kNt+syORol+a4pUSyQaoj6hIrepv+/jLVUzQ5
X-Developer-Key: i=quic_msarkar@quicinc.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDA5MiBTYWx0ZWRfX+zAlCFIxg0a4
 rbDaal+4roIE2fuJ/kgSZij8RFmEESttLBryyYuGkwwzdGYdpxxs4Q9EzgkyH33fX1B7y9hB4qq
 Vnuf/NZSMCtj6CrqIqnDemFNXDX7dUsxvfm/II1KlF/k6MXG+nboCYKgbw5LqPlvytbV78iG42b
 7UK7qduMg93aNf/Hwk6W4d0kTsEPoxjg5RX4eowUS/HK+VIQA0ZziGwewRtwfub2ZYutd5haJpX
 o3OSVpKgIf4guAhum3d/MW95mUscQoYKiTqDMvxz1QxW9f5hmCUhb8TT9kiYH9XUkMwAyBH9Mg/
 W0crZ4ge+5Jwz+5sfQU4dwNCvbrvQO7jXhT2DLm4pILYoBocHsKReT6ha4PSRmclrQSS2EgCuof
 gWXUDcGejRuahBBDQM+m2QbW8snuwrMwVE1IU52uaBMch3NqjEZm/4i3eD8yw4D6i7cGZZCw
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685153b4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=dGWFimBq7PPEW5IeLiwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: W5dSpq9-G7HzRXOiuyRjlZPIcOBrwGDG
X-Proofpoint-GUID: W5dSpq9-G7HzRXOiuyRjlZPIcOBrwGDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_05,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=575 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506170092

This Series is to update PCIe PHY settings as per latest
hardware programming guide and remove max link speed dt 
property for SA8775P PCIe EP.

Signed-off-by: Mrinmay Sarkar <quic_msarkar@quicinc.com>
---
V4 -> V5:
- update commit message and add reviewed-by tag in patch 1
- Link to v4: https://lore.kernel.org/r/20250604-update_phy-v4-0-d04b12bb89f2@quicinc.com

V3 -> V4:
- update commit message in patch 2 as per review comment.
- Link to v3: https://lore.kernel.org/r/20250525-update_phy-v3-0-5b315cd39993@quicinc.com

V2 -> V3:
- update subject in patch 1 as per review comment
Link to v2: https://lore.kernel.org/r/20250514-update_phy-v2-0-d4f319221474@quicinc.com

v1 -> v2:
- Update commit message as per the review comments.
- Remove max-link-speed DT property.

---

---
Mrinmay Sarkar (2):
      phy: qcom: qmp-pcie: Update PHY settings for QCS8300 & SA8775P
      arm64: dts: qcom: sa8775p: Remove max link speed property for PCIe EP

 arch/arm64/boot/dts/qcom/sa8775p.dtsi              |  2 -
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 89 ++++++++++++----------
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-pcie-v5_20.h |  2 +
 drivers/phy/qualcomm/phy-qcom-qmp-pcs-v5_20.h      |  4 +
 .../phy/qualcomm/phy-qcom-qmp-qserdes-ln-shrd-v5.h | 11 +++
 drivers/phy/qualcomm/phy-qcom-qmp.h                |  1 +
 6 files changed, 66 insertions(+), 43 deletions(-)
---
base-commit: edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
change-id: 20250513-update_phy-2cd804dd2401

Best regards,
-- 
Mrinmay Sarkar <quic_msarkar@quicinc.com>


