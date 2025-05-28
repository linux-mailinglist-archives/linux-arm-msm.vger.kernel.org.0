Return-Path: <linux-arm-msm+bounces-59668-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F6FAC65A7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 11:21:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C349C7B0B62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 09:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77521276020;
	Wed, 28 May 2025 09:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ln52FnII"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC03204863
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748424102; cv=none; b=Q05ss+iZ36f/MtF5LJiRNLYJGeHOED0LufpDFk/1/L0dhSbO5UZ+2CO8aRjyhiMqatNk7m3dZbxU9sdXKPX3TT5f4o3nsWOASe7ls4fmjKuyIGOCz9F300S4vlUoyFtgOewQie3bzugVITkv/uaP7xxtWDqi3phRemitmjEpnMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748424102; c=relaxed/simple;
	bh=rJtVL3NDhF4y5DFmGfxRMVAXGO+BDTrt0EJ0QuEI6ns=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OCuu06C2LfNPGP/DbOmK/LQOs92xsy9CGLGzCUQvnv7dBmgXBC6iKqr4FlAOD3pCOpZwwzBJ/NmJt8vNX/dcumX29iOAXPeZdqYcpCzDYcCYEOFhtI8Srv3HOHPo6cUvfxUeUYBBCb0NyiMrxs6NawivzIFND3Tryg+2GtlLNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ln52FnII; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S77E7J001582
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3DRqMWuo/9LCc7qXzV/bil
	l0X/zQ8yils3PttskPMyk=; b=Ln52FnIIbU37T6u197rbpe+MsSp1FgXQN73aIH
	xnYK3I41VSJYck2I5t2X0g+ufSJxBDTUuoeXPnai5ajAaSu7J9yEeS1ozH4gIRVa
	Cc7OV57kJ3SZiAxLq1Zk4dr/UdsHF94ScfBB0KR1+MRBmtjWw8E2RmU273gCXOT+
	9qTmc5LRHsPlmme31VEzZ7eO49Ci+2WSltJ+f4jUEdB25LAPPmv0pSD5Yx4qxVZ8
	2EAhfoNx0HG5G4cXnQrFE9zLYGnxPRTCPZwUmnPS7rQP1IhZpdVCVGearQyQw885
	YIsdn+SbzWeAoyuCzDXs1cd5IvfRLZ9IDFekxA9a6/Jw/oQw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavkugrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 09:21:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23228c09e14so61498295ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 02:21:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748424099; x=1749028899;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3DRqMWuo/9LCc7qXzV/bill0X/zQ8yils3PttskPMyk=;
        b=lwraME3PyRKWghc02cC/GIiqw9qw0kF8vELHcXPZOb1XKcTFwA+cQA0OrXEhrjFJuk
         AqyfHWfZnydmivXOiJXcGKsn3sUR1vDPhNjhju6P/RT0u+4UnZZMlRtCVGmCw+tVelwL
         J7rzyM2bbw2txK2T5LxPl/NHx4HmEsItOl3nwRvtfsyIyW/IPIBXpFhK4EODDZC9B+nr
         tITUfP/Ayw9Ybhj3/Ehqk1lg67WtFwVoVITeSDML4/ynzaiKuHntp6hW3REBV6NylE7w
         0dOXwFQiJQ5IAXc8HvAQshIS4CKzb3Iv30bxbHPFxkQJ5TyQoXTez4Z+1D/dtRbI3d53
         AxPg==
X-Gm-Message-State: AOJu0YwEAzedIJRiMja7Jm/Nmz1HbMV8E7CeIss1ikK013cKcK4rotWz
	QJwBRT75roTm6ZzyZCRFwmHj3CVnwm5Q6L9smdtlDKB+2rZ5I+jL4J86QpiosCltgODsjYn8m6Q
	B4L4esrIQnqRga13Iw0gCosAC8AjK6k4IksYEepEgT9rzh/TCdlKGZbBAMAxi1EnWwyNw
X-Gm-Gg: ASbGnctcTbsSaSB8RZv2pzmBX+ldtIA7U3J+Bd50IrcAd/j7vT6Y0Ny7zrvPYmo1EZ1
	LUSLYqdUg9O2Xea2EsUon3ImnU/+4cFAuu1MnnkKMU0PX5RpcZFD14Tr6FlVI38RyHXEN4ARkKS
	KEGsyEc4hGsbl/PZYxNIKi4zzky9oI9ceDf16tuXl81TnQA5+GbWfmKQKZ2RcNiAT+y46dm8eqQ
	9cEky4e4Q6xZPxq82SqCd1v1Qe6zBwwQtF1ay3Dm3qNLx/rZZUUCZk9ewx4CCmasoMyoO855MtJ
	GCTKbaD/1oHIAIFSCgyow+zyAw==
X-Received: by 2002:a05:6a21:4a4c:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-2188c3b0db2mr28606032637.35.1748424099057;
        Wed, 28 May 2025 02:21:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5o37DFxUmG5HSgtWJ9sRbQCeAReZRpjvgn4XA+4dS7Xr21VlTaAbQtVXKeq6pE2AJOFOE4Q==
X-Received: by 2002:a05:6a21:4a4c:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-2188c3b0db2mr28606004637.35.1748424098724;
        Wed, 28 May 2025 02:21:38 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-746e343c2c6sm833456b3a.134.2025.05.28.02.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 02:21:38 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v4 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Wed, 28 May 2025 14:51:30 +0530
Message-Id: <20250528-ddr_stats_-v4-0-b4b7dae072dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJrVNmgC/3XO2wqCQBCA4VeJvW5ljx666j0iZPZgLqTWrkkhv
 nurECnUzcA/MB8zomC9swEddiPydnDBdW0Msd8hXUN7sdiZ2IgRJolgKTbGl6GHPpSYF1QSqbi
 BFFA8uHlbueeCnc6xaxf6zr8We6Dz9sMUa2agmGBR6ZzmACpT6tiFkNwfcNVd0yRxoFkb2FeQj
 G4EFgWmpbAQHZLRPwJfC3Ij8PmHArimVjCjsh/CNE1vkKF6FC8BAAA=
X-Change-ID: 20250426-ddr_stats_-391505b3da6a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Doug Anderson <dianders@chromium.org>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748424095; l=3340;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rJtVL3NDhF4y5DFmGfxRMVAXGO+BDTrt0EJ0QuEI6ns=;
 b=VO7z4/3CUDsnlfSgN+Ac7UZ7EIHTaUqmcGU9py6Z2lgOZYZ2YSSY0lNvY7KZrQHdgfaZDmaWK
 f+NRcQfEdNzDkrJ8JmGyyvQh9yis/CABVVUTxpFnCh8qf9KXGygTb40
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 89cinphY9OuPkGKg9QdMHt08Z20OVoc_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3OSBTYWx0ZWRfX7N22gfy/YCNk
 101Ho/irDsknD+G5tl4at5OTw00ZL0Funa4//bSWZCT3upoYRCSXHyP791rV5OZZchkqPFUxFf/
 Xz6mmbnydmPkT/cHT5zBUHK/bOZSwX1JvlMRyGtRD4gAPvhiknbF3L5PGRHMJl/JztkHQoR9AL3
 0razwy2iGSXij++/muUx0AJzCIZqH1xLZG5Iy0G165ti1VXCYhDwGI9xozm0quPWmgGdCAtQeEV
 qXMrBtAeZR/eyTUpUcztdxoQFdREAgGGCpyswrD0L/ujFXXVlTNZZhZpLUoJ0HIA3cZkan9yiGb
 ddS8ZeF96EOkIS/eNIdMyVerV4s+N2mfcSXW47lbSjpUg3BVCg1Yjx9oVR+6fb9ndSmy+cqVU+t
 SW1y0vgDByCvhcCEV9CDSAapzJp8I2UCJRO6OGt8qE3x0heDLTcguJ6Sjz4ZNMa7gERpft20
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6836d5a3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ubf2v9fuHxWRXcPCyOcA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 89cinphY9OuPkGKg9QdMHt08Z20OVoc_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280079

This series adds support to read various DDR low power mode and frequency
stats. This was added in past with series [1] but reverted with [4] due
to some SoCs boot up failures. This series is more aligned to downstream
implementation and fixes the issues mentioned in [4].

The series [1] tried to add three feature support

A. Reading DDR Frequency and low power stats from MSG RAM
   (targets where DDR stats are readily available in MSG RAM to read)

B. Trigger QMP to ask AOP to populate DDR Frequency and low power stats
   (targets where DDR stats are available but duration field syncing
   requires QMP message to be sent to AOP)

C. Trigger QMP to ask AOP to populate DDR vote table information
   (To read different DRV / Direct Resource Voter, CPUSS, DSPs's votes
   for DDR frequency)

Current series do not include reading the DDR vote table information (C)
part from [1] which is to be separately sent potentially including reading
other resources votes like Cx Rail level vote information. These vote
tables details are not strictly related to DDR Frequency and low power
stats (A) and (B) this series is adding.

This series updates respective SoC devicetree with QMP handle (where DDR
stats syncing is required) and it is backward compatible with older
devicetree as without the QMP handle present, ddr stats can be still be
read (duration field will be read as 0).

Note that [1] was only partially reverted and hence device binding update
for QMP handle [2] is already present along with the fix to have
dependency on AOSS QMP driver in Kconfig [3].

[1] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-0-5981c2e764b6@linaro.org/
[2] https://lore.kernel.org/all/20231130-topic-ddr_sleep_stats-v1-2-5981c2e764b6@linaro.org/
[3] https://lore.kernel.org/lkml/20231205-qcom_stats-aoss_qmp-dependency-v1-1-8dabe1b5c32a@quicinc.com/T/
[4] https://lore.kernel.org/all/20231214-topic-undo_ddr_stats-v1-1-1fe32c258e56@linaro.org/

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
Changes in v4:
- Handle clean up for qmp_get() probe defer case
- Link to v3: https://lore.kernel.org/r/20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com

Changes in v3:
- Use correct format specifiers
- Handle qmp_get() failure cases
- Link to v2: https://lore.kernel.org/r/20250521-ddr_stats_-v2-0-2c54ea4fc071@oss.qualcomm.com

Changes in v2:
- Mention count in decimal instead of hex
- Update read failure cases to return error code instead of success
- Fix typo in comment
- Link to v1: https://lore.kernel.org/r/20250429-ddr_stats_-v1-0-4fc818aab7bb@oss.qualcomm.com

---
Maulik Shah (3):
      soc: qcom: qcom_stats: Add support to read DDR statistic
      soc: qcom: qcom_stats: Add QMP support for syncing ddr stats
      arm64: dts: qcom: Add QMP handle for qcom_stats

 arch/arm64/boot/dts/qcom/sm8450.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8550.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8650.dtsi |   1 +
 arch/arm64/boot/dts/qcom/sm8750.dtsi |   1 +
 drivers/soc/qcom/qcom_stats.c        | 131 +++++++++++++++++++++++++++++++++++
 5 files changed, 135 insertions(+)
---
base-commit: 393d0c54cae31317deaa9043320c5fd9454deabc
change-id: 20250426-ddr_stats_-391505b3da6a

Best regards,
-- 
Maulik Shah <maulik.shah@oss.qualcomm.com>


