Return-Path: <linux-arm-msm+bounces-79359-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E83DC18E08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CAF83189A555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:06:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0DD31352A;
	Wed, 29 Oct 2025 08:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IJdOyt9F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jHwdQuCx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B7E3126C0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725149; cv=none; b=Em/vMHUSAAszBWsvuyN3bmJh2vCJhtOnwWz9z32IY+94ABqx1BtsKwc1QnTuHRKKq5xFlGElr++Y8njz/FQ/oh6cFCCsSXBIZJm+r5NwJvfqD8jliD2cRmqifSrSmA4/em4MIeUd6jjFd7it1e5uDq1bHKPgB3uZQLttUUkHlTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725149; c=relaxed/simple;
	bh=KLTyHWEAcaKr1eRQGtyWJm7kWu7wVUNzKX0WRgsTt1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pwoXV3aE87JKg+I2HxNBb0p/aVZJyC8Ac5RiATy3r+9kiFidfdQPjW7xJ0BefZ3dlhOrERhbnYzVsdqq/lEKQWzdetRd7ZYw0Wpuh2DP+PO4UX+K3V4W5o5ejZ/HcrhwNeYz5KQ0JFhWQ0Cn3hpQoMGx98PNWftMrPeKmpVPABo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IJdOyt9F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jHwdQuCx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v8RS3692519
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QeivkgIAz76HiBHfRH/41C
	LBq7zxQHuMJPrMhMpbui8=; b=IJdOyt9FNkI52GhAL7ksgUSuZ9Y5RyhtC55q8x
	J050JEEMA44qPATGIDdmgc8CL7WWlPjrpibwguqTV/tKb0cQM+H5omnDKGUw0ySV
	+o0wEifCR4yHksAydoOcWT+Qg/KVwgjipZMA7a8EA4qq18BmDKBI4nANkzM+IrOo
	HlWzKLysbJ5kTc2qSIRDZjH+MmofV6R+IIbo12fg/xVnu0kmBGqAf44YYzzTlotI
	K7dWDAjqgYCg2KBWwfynIEUTdxCUQevOZ2gcdbjqnro/Ek320+mgTALEzMA+AF85
	yB+j4vfxqE4g2Lh9CNIQlggrQAp13v3q1NgvWx86vnaSdtZw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2hpx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:46 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28bd8b3fa67so58048845ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725146; x=1762329946; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QeivkgIAz76HiBHfRH/41CLBq7zxQHuMJPrMhMpbui8=;
        b=jHwdQuCxg4akwUnC31mEXMnxRzetjJwn/Q7fH1QlX0TEjB9dKynzq2yYOa/xipGuYq
         vLUjiRhmU/r0aaiQ26NxfY/8i2PfQ5y4VkUfYYw454M9uNGPOXvPWKnibL6MDbNyhp2z
         ETBRTnuuzwxpGZbbxdJUflQfmbrQsKek2g8YNZoyOXiFbUX+aUYvAEmejPM4OhwwMcjZ
         O76FA7vmmv/t1aAvqx93GmdFF1Vd6Uu/cgEcIOLemfJVmm+XLu4fqp67l/YoGIyGo7/k
         hEroEAOCM/E0rrTiaDxbVtYgEo0rC9opk9n0AoYWZ8NDx4CciE3hsV0Mav4ynqLnB+Il
         mBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725146; x=1762329946;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QeivkgIAz76HiBHfRH/41CLBq7zxQHuMJPrMhMpbui8=;
        b=gWfhCHK1wbD9PtlYNKo70EKAFNrmHtLcmzumwPn1qhVjc7KjCg0EvmO4PufJibyHXA
         awaWj7m6KC+oxjZ+ZFMla8n/6Sm/GwOgnV0aJPQjih71zH0MVaMSfbOsbOhl5h0l/B3z
         7tqXO2q3i3yBpARig0ql/zBQFZWleWjVyKIIgYPieEjwLoctozhBuKGrAguIP7qpTSQh
         10WTD821xSdHerbI6KmnEHfF/5I7ExNiMqOTswZlohwijE6K6bgjLwC/dPGbX83ghZPN
         gOtexlAtJTYc3H57HJY7WVlBY5b+cX3+rjlomWyh93RMTOTFTX0ZCb4/VpmuIuqDMXfN
         Y/ww==
X-Forwarded-Encrypted: i=1; AJvYcCW5Cho75TZLXaevmxHlZZNPGGRZ9gWJvHoD/CUmHzzwNGw80e0Y6z6SerQwW6rNBt/9EeynM+evtn+SnbYK@vger.kernel.org
X-Gm-Message-State: AOJu0YzkgQ3Fk4gtHPo/IKOxB6LrMR194n7UlypVizmoEFJR40kzerHw
	T6nAR61NmN+ztRvuzubp3OGcdWW7a/cwaXrruqdoYOWM5fRZAIRu1zGH/ywmqszssG4plzry86+
	BugsAphVxrou4h8qtg2R0tPGvtJ33v3k8IxOi2LL2+9xb0EGmbJ58WpT7QdbH1NG+jnDu
X-Gm-Gg: ASbGncv2OKRjzj81kRfAJHx8W8470KyUcnD8kEJrAuh1BNOqffAlQA+qfBZAcai0/jD
	B9vTWWGDhuylk+DprCVVUBR2ut9K3AGY3P6LLUP7mz0Dv8YBGHZ2xJGqxKvM2dirpCmOL0RfGxt
	R1mEDxUHiZLPvi7v6oBCMtfABC7Hg2cr6nnHnkYJekMcyX73EAO51hqmv0wl3NO+Ro3lB9DWJcV
	qZ7TqCnhFp1b9Gq2V/MvPDNdzUZTEMxtfq0/2PgcGgXFsn/eajd7Y6ssu7sCqHC2ERzHlrC88Gm
	iMk486TYCjmbLRS6N4bQCDNaEyagR9hY15VsYl+Zj7AwfawowJy0Qb1wIAbe7Hx0CZXOHG8J3BZ
	9mlFwz6vFSiFe+fhlhToYqsKcHqegTcphOje8UemLdy0aYw0pzw==
X-Received: by 2002:a17:902:ecc8:b0:269:8072:5be7 with SMTP id d9443c01a7336-294deef6753mr23722455ad.56.1761725145803;
        Wed, 29 Oct 2025 01:05:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/y7bkWhIxx0Myxzh6vjq+isdNvogeuTT3oJcV1MrMZQLM6S5Py7etz8cDRf4QLE50KCO0ZQ==
X-Received: by 2002:a17:902:ecc8:b0:269:8072:5be7 with SMTP id d9443c01a7336-294deef6753mr23721835ad.56.1761725145134;
        Wed, 29 Oct 2025 01:05:45 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:44 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/7] Add initial remoteproc support for Kaanapali and
 Glymur SoCs
Date: Wed, 29 Oct 2025 01:05:38 -0700
Message-Id: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANLKAWkC/12NzQ6CMBAGX4X0bEm7ID+efA/DoS2LNEpbu0g0h
 He3cPSyySTfzqyMMFokdslWFnGxZL1LAKeMmVG5O3LbJ2Yg4CwFtPzhAo84+RlD9IaboZFlXRS
 yx4qlpxBxsJ9DeOsSa0XIdVTOjLsmKWCfjZZmH79HdpH7+CiIFsr/wiK54JWUeqg1NgW0V0+Uv
 97qafw05emwbtu2HzgamczKAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Gokul krishna Krishnakumar <Gokul.krishnakumar@oss.qualcomm>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=2358;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=KLTyHWEAcaKr1eRQGtyWJm7kWu7wVUNzKX0WRgsTt1s=;
 b=faSqcdKYBrQNp77AXE7+l4Bwfer/H+ghqklHKylwMz6VlE3VL3AsVkgHEKNACI2O7MKpdBu8J
 y5N7wBgwkC3DIFWxw465Pjo7iEC2LV6lBuvQeTCakPPVGfL3DP9y1zH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: BM8oFZ7_whE_mtCpvsKx0jI04EbynAOg
X-Proofpoint-ORIG-GUID: BM8oFZ7_whE_mtCpvsKx0jI04EbynAOg
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901cadb cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=kDz7l3ViJ1xZ-f_3I1MA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX0KroBQkKdPtG
 8yB5DXE2fypTPLFrBfki3ETMEkn91EF9PsNddm1ZN4RkuiV/pkNWLMBobUWpb1RK9inYXaGR8FE
 nlRXG9GFqY97w7D/jLlgb0h8p5ZnCbLcQGMXRXlRzwXiXZhW4h2jr5KeA+1haZr2/EdK2T77578
 M/0HJ2s5xgnVlAfYAA8XcOH9+eR/S+GqqC+PVIxmpX4rKE3dDHwYB9Vg468ppBTvmJSJUDS7Oin
 Dmgj9qTzIDgp/kLhzNOApzur59b7l105yTc0AFiWxY079YlfkxgqNw6jhIFOoy8Gi54qh3Hrxbi
 faPg/t2dQ56oqRVWQZK9Ju20NcYJ0w5juRdbLkurFpBP3+LZd34f5GDLJwYn3tlJZSeHtW1Vv87
 7zP4P88xGkiCpBU5N0IxQplBIghaYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

Add initial support for remoteprocs including ADSP and CDSP aon Qualcomm
Kaanapali and Glymur platforms which are compatible with ealier Platforms
with minor difference. And add initial support for SoC Control Processor
(SoCCP) which is loaded by  bootloader. PAS loader will check the state
of the subsystem, and set the status "attached" if ping the subsystem
successfully.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Drop MPSS change
- pick Glymur changes from https://lore.kernel.org/linux-arm-msm/20250924183726.509202-1-sibi.sankar@oss.qualcomm.com
- Drop redundant adsp bindings - Dmitry
- Clarify Kaanapali CDSP compatible in commit msg - Krzysztof
- include pas-common.yaml in soccp yaml and extend the common part - Krzysztof
- Clear early_boot flag in the adsp stop callback - Dmitry
- Use .mbn in soccp driver node - Konrad
- Link to v1: https://lore.kernel.org/r/20250924-knp-remoteproc-v1-0-611bf7be8329@oss.qualcomm.com

---
Gokul krishna Krishnakumar (1):
      remoteproc: qcom: pas: Add late attach support for subsystems

Jingyi Wang (4):
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Add Kaanapali CDSP
      dt-bindings: remoteproc: qcom,pas: Document pas for SoCCP on Kaanapali and Glymur platforms
      remoteproc: qcom_q6v5_pas: Add SoCCP node on Kaanapali

Sibi Sankar (2):
      dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur ADSP
      dt-bindings: remoteproc: qcom,sm8550-pas: Document Glymur CDSP

 .../remoteproc/qcom,kaanapali-soccp-pas.yaml       | 134 +++++++++++++++++++++
 .../bindings/remoteproc/qcom,pas-common.yaml       |  83 +++++++++----
 .../bindings/remoteproc/qcom,sm8550-pas.yaml       |  26 +++-
 drivers/remoteproc/qcom_q6v5.c                     |  89 +++++++++++++-
 drivers/remoteproc/qcom_q6v5.h                     |  14 ++-
 drivers/remoteproc/qcom_q6v5_adsp.c                |   2 +-
 drivers/remoteproc/qcom_q6v5_mss.c                 |   2 +-
 drivers/remoteproc/qcom_q6v5_pas.c                 |  81 ++++++++++++-
 8 files changed, 402 insertions(+), 29 deletions(-)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251029-knp-remoteproc-cf8147331de6

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


