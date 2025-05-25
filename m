Return-Path: <linux-arm-msm+bounces-59316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 740EFAC3341
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 10:56:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BAB37A35CD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 08:54:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A62218D656;
	Sun, 25 May 2025 08:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMgSBbhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9217027468
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748163368; cv=none; b=lJh6l60sEr/NZzjDr0bSQmCpCB9OgnaXqQfi4p9E0YjP/YyhYPYhRtsfUf9V/i0YWi/uamCK8EPSWTFp1JXs+NuWKCiFOO04NTsat/qs9v5XKgHhsZ/PGCvOYUmGpI59truUTAGfTyYEjOd1QQ7J4bwDlkWf6z77CkzvExnh7aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748163368; c=relaxed/simple;
	bh=Gdm4fc4veXI3OeYSAjjpDjBbAvEys/rUB+fN/2hyl1M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Mkz2DC9AmRzNBLdO5wt4Wl3twLV4nx3perEY77r4ioDTVBGQWSdbI3e2TJg40yNaqW5RcCxwfwKfsxcVdH3M0SLxjcjckp0ahgjydKubbIqEXPvgH9Aij4ivvVBG070GNmGy6CDIbPe/3E05AEn2xtf5xD763kGA670eXw9b++o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMgSBbhE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54P6jHtT029276
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=x8Q50l5U/57EBNBZm4d0wG
	DjpdKN9xkqTD0QizmCGc8=; b=iMgSBbhE3CWwHZEq+/rx42JU+ly90FfnUrqc14
	7nI5VMpYKXC5C8WIKJvWQXbOwFoTOBZEZ+okczaAx82fXlI3wz8fdamafwBWi6y+
	uaOjTM3W2lH0L7LybXFeu3vMq58iKwZhrXIAIPKlB5scSDvd0MDFbCXe7iLdrnzN
	uzNHTHe1kNd4CuQIU61TCWTndGvXfus6OkOIK/6xC6rKQMLtZ56AMESva2DV5P39
	RHIUzSPh4bWNTE9sTG+wdsNl3C04xskL0AX+SM+7SZslAT+cunUTMi/fBeiOIbdu
	T2BRPwgrU7hhLkA0A8386cVCS6ICIYN8Lf71tCFQIywdjbfQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6b5hr08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 08:56:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23411e9eb5dso8834475ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 May 2025 01:56:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748163364; x=1748768164;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x8Q50l5U/57EBNBZm4d0wGDjpdKN9xkqTD0QizmCGc8=;
        b=g7jhKuSkzwEScbbu0Fk5z2vvSimBlaNTPkm2kaXLWRtP0r/PLpbWbXUkpskI8nVCTQ
         KyLWP9PwZ70yUQeM3fh5OqP6jhrShAck/KaDki7+AZQqlhN8JmKlb37F3asuOdJftDvV
         /Rr9LKX6Gv/bxVDVQLV0ajj3b1XLwZ+7UBY2wAIPpuvWtxR9xW5TYLcPyyBvAGF6g8Rt
         hkz5VHXKY5fMpoXxEMQwKquWjTTYp29LIUhV9cPzx0DwZzQUpcF+S7OHUX4oDJZBkiws
         ExOsK1UVeAW21W5jknyg/rvjTHNFbJGIl7d9Gh0fq3KwHNd29WrK4a/O5fk0LYRrSATb
         SrvA==
X-Gm-Message-State: AOJu0YxigBUvOuk3h8xaJGrCa8tSGmdi13gKlo2N/HTER6tQLOVSH0VE
	6L491AnLbPYaeMMOsQl9ws8pn8bWv52tJVc70Pth7CpZo7U6IjpnmLJoqvox7fVHfTonx1um04+
	6LHGrIQXSWnC9VzoUv/J1wGusrNz23sMCKPuS/iy+JGO3dVXtJVCheWUOaM0RGao+qDV9
X-Gm-Gg: ASbGncswq5JXl2X+8kP7RK02mUb5LNrv4/UTOQnHvmKrqjBUu1vptpq56pWe4zMtVBL
	BjLqwdmqjvgrhIpMdRyUt6rCxAsXAA21BwUGNxantN2j7J5n0a6j1ZC/gLkxMfUtJn9A0Wq/axR
	G6eFFXiVQRPgGj2TXez1vS2GBRyUWgRmTvcJJwrVXl6Ibpwe4fNdf00a5bVqRu+9f0IffnSxT+u
	EhwlmMgkRC4m1o7JgElDtPW8GwawpnyO9C46wgCp3DzMFu/O4p6EAtYSKGQ0scgf6SreH5Vgw1C
	HOGGC9noB4j5Gzk3derx/e0Rqg==
X-Received: by 2002:a17:902:fc48:b0:224:76f:9e4a with SMTP id d9443c01a7336-23414f5aa40mr75715515ad.14.1748163364607;
        Sun, 25 May 2025 01:56:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGlNh2c5ZBjpomhhQkOdvv+tvQtcBO11xKSSSzt+8aWCSn4K4UCGHr2Xl6QAkrplcMOWgu0g==
X-Received: by 2002:a17:902:fc48:b0:224:76f:9e4a with SMTP id d9443c01a7336-23414f5aa40mr75715315ad.14.1748163364130;
        Sun, 25 May 2025 01:56:04 -0700 (PDT)
Received: from [10.213.103.17] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2340531be85sm29609805ad.104.2025.05.25.01.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 01:56:03 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Subject: [PATCH v3 0/3] soc: qcom: qcom_stats: Add DDR stats
Date: Sun, 25 May 2025 14:25:56 +0530
Message-Id: <20250525-ddr_stats_-v3-0-49a3c1e42db7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzbMmgC/23M3wqCMBTH8VeRXTfZpvNPV71HhJzNmYN0tWOjE
 N+9KUQF3Rz4Hvh9ZoLGW4Nkn8zEm2DRujFGtkuI7mE8G2rb2EQwIVkuCtq2vsEJJmxoVnPJpMp
 aKIDEwdWbzj427HiK3VucnH9uduDr983U30zglNG80xWvAFSp1MEhprc7XLQbhjQesmpBfAQp+
 I8goiC0zA1Eh5X8j7AsywujaqKY7QAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748163360; l=3176;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Gdm4fc4veXI3OeYSAjjpDjBbAvEys/rUB+fN/2hyl1M=;
 b=NJp5EoYFKrWZzLLhZemKLZCMdiVIIVLpX/Y+4hkV7d1WdQITEUU1/RI63VvcUmivbULLLJVwD
 0ByOmhJIuMyAbe/cn8CJ6jZiuO79+TaL/vU3joTHIAvzjxiDT09RqWT
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=ZcodNtVA c=1 sm=1 tr=0 ts=6832db25 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=ubf2v9fuHxWRXcPCyOcA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI1MDA4MSBTYWx0ZWRfXyMxj/8mjgL6U
 tzPp7ZqgOckitw6arSjk+C655PhPpfVyTRk3F4Bb4h7UY42R1sUthQmfmjVv4l9CYcf61CTcfxD
 BZCPQWJHgZB4s1T3lFVwxYGo3cpYrn1KUu18hxI1kWX3ur48iJhXqfcQAfP+gyI6UDOJpxIQg9t
 wl8y5fFHdBd1WiueYxeS2zNL1eXXu2usKyyUQEH2zypRVHjlAxUIP6mhw6QD3kQqdte521kzxqc
 eXm2+NevmelzSXrqIAHO/Xf7wAvxXuG4Gxfvm7uyCKzntKuNGWf2I8j+CBzfUV9l7bLMX1eVQQZ
 zKdYXy0MAht9PSFzBQLtmIHFostWddGIdcAo6g6Rouf80ZG1m9xE9zb24/VdyMo0P1WZyN4Qlbs
 3o/zKQ1GmkvF/2PQGTJ211C0AcTdcF1ZYWGiK4UPJRsAQ3WankkIW1DYfY2OVm5aKRUd9+rv
X-Proofpoint-GUID: TBE2yrPJqRM-2lyTFK9fJ2slybY_trMM
X-Proofpoint-ORIG-GUID: TBE2yrPJqRM-2lyTFK9fJ2slybY_trMM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-25_03,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505250081

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


