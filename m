Return-Path: <linux-arm-msm+bounces-56503-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A999AA7332
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 15:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACBEA7B7201
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 May 2025 13:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 258DE253F34;
	Fri,  2 May 2025 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KPI99qm9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFD1632F2
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 May 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746191893; cv=none; b=L+MVVLKTJNez1R/yxf92DUxPh/ZLePs4WpqZlzzqosj1fuW8/TwfPKvBx5/ly+5T82Yc19bAn7Iwoi+qVBMdhZPGc1Qjc758jfBFz3qtyuBVBa3OUGL4Bmec4b6nuh4hmgs5dpnOk8SlUf1EKBtGELM5YegQcJqbx8onEXQJJRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746191893; c=relaxed/simple;
	bh=C2CySGd6ZHVIgvcnuI0Gzs0w0QJK0EJWr2JrYPf1iPM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UbwIzH45Mtz3S+DCnGdKbCJpnJiKAuTb0ytAgX2ncghVmW88mtyUxty33cA5Z3LrlfyQCYTilRNp+G18zRxBRAbfHLcSurg9WTPh6LzIcLTIZuyI3UVyN7PhNAfBOrA4VRZwu+FIeghi0khr9fO/q3mATnijtgOO/T/Q4f2wde8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KPI99qm9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5421Mvo5015020
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 May 2025 13:18:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=E8sL/zuc6D/PHkqkSglj+e
	mYjJifggg81Nq8wDBMLOE=; b=KPI99qm9ExPxlHVF6V5AebqLA7bcpEELoypiUP
	zEQka647HWR0dt/xoGLYcAx7hPXd1o2bAZJkvcrXiXV7xvBEwjIKYAiIpGHjGZfu
	BshfXi+vyvkgP/jVfOlPtFtSjG/Ezuf2Gh8h/MUNmF0HFwWVL7t4tOCoM1ufJBbK
	RDReHGzdNYtR6f+WTHMmc68kYsE1jnl62rNgSlkVKMEn0ox+2Q8C61zTbXGSFyb/
	yiaYRHz/y6QVAYmsTF5bsiP54nclO9fUmoKOuYIY/69jepq+FAVp+T5zn3as4LLz
	HCwz7mD3SQxoh62Ci2fTVcXtzRzXfI9PU+YzdFWpsv9PXUzA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46b6ub0ara-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 13:18:10 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7401179b06fso1911744b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 May 2025 06:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746191889; x=1746796689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8sL/zuc6D/PHkqkSglj+emYjJifggg81Nq8wDBMLOE=;
        b=WD45a9iTzo+Csn/FRN8Jz3nqqBCVGBqnjl39cmyFv/Zit8lG1V0LUctdOIP95fjb5W
         2qVhwxQzLk9TGsbI/sEfH40rHeOxUcI6AnnEII4gregYFxeTKCxkRb9a68cEXmzaH9rc
         Wv+pQtrGieU9UO0BpP/ARr1GGaXxzMGvABBXbbXMTh84ckOB/f0iRXiUvh3Za39KfJwr
         Jm+dsPXKhc7cnSulRSGBUl/nVZndHgKdGMEsKh3n8wFGdURvvW+VLrL/CrfPy+txt2vs
         YIHAz7/NN+jbMLsyIdudEakzMFPeHXgGqn1xCGqAFWqt+oc+wdq6WgCGkarK+AkyYf7G
         YnGg==
X-Gm-Message-State: AOJu0YxInG4xi69PFjt+akSDCCKkqHTIXTqFLjc7f2bJRsS153xiwsXH
	jISOZr8Nvko5SrciduYCX20Rn/LlA2XJSmgjkOh+Ql+Ds7CXzja3Sy98Tk+eQ+Ref4/tFMVGz+Z
	kv3QaA9CgECiFc3m0yxmD64xfqWUk19XMRtFQfFAhTRIeIxbIiy8iIv2wEbPsPKpF
X-Gm-Gg: ASbGncsfRSv19y9soHsfZkht09Q2utGfXQt8ZfVtQjfNaLRbkE5FX5nIHMTNKDvdjAo
	ogfDrmOlrCMj6yAYc8B37BG/MzNAdj9d49rv/ugo+tpIFBM8sEBiN81r5Cvk5l9SPvpNQNlKEwK
	FvjeGqAAy2po2xclO4jgVdmINFGfDUe4n0AwS/y80XL5P7U76Fb19ePi0A/CzGd8VTOlTqNih8p
	YhKxw9fQqnFeoC+45nvO/R/zSJBAlNDBw0fMTdpIv7Ai8nXVKIfEd9/xb5744uILkWLkIvJCeWb
	EMMuhfb0LAjyoQLTeZfwIvpR891d2yW26RfJQuFiKtx+RiOYgDezg2RNrjqIci7aQWmFH7k3iue
	8lYQvI6O2mVPDLn+4c9p71JgdtwmTTLGNjR+9zHefJREgeA0=
X-Received: by 2002:a05:6a00:2884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-74058b21917mr3667070b3a.20.1746191888814;
        Fri, 02 May 2025 06:18:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGnJlGhBXgkli0DVnltPlz+Rz3Rlz0Tns84nb67FojZk7pFA9oqlxADSBZO8yIBi2J9haR+g==
X-Received: by 2002:a05:6a00:2884:b0:730:927c:d451 with SMTP id d2e1a72fcca58-74058b21917mr3667021b3a.20.1746191888400;
        Fri, 02 May 2025 06:18:08 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb939sm1525886b3a.61.2025.05.02.06.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 06:18:07 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/4] Add support to read the restart reason from IMEM
Date: Fri, 02 May 2025 18:47:48 +0530
Message-Id: <20250502-wdt_reset_reason-v3-0-b2dc7ace38ca@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPzFFGgC/x2MQQqAIBAAvxJ7TjCtyL4SEVJb7UXDjQrEv2ddB
 uYwE4ExEDL0RYSAFzF5l0WXBcy7dRsKWrKDkqqRtezEvZxTQMaPlr0TWCmjKtPq1baQsyPgSs+
 /HMaUXgjRewpiAAAA
X-Change-ID: 20250408-wdt_reset_reason-e12921963fa6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, bod.linux@nxsw.ie
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746191883; l=2135;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=C2CySGd6ZHVIgvcnuI0Gzs0w0QJK0EJWr2JrYPf1iPM=;
 b=soBqD2Is5FZGH42QT7as39Hdc/zedRJbshj+tTlvhcydtgj44+D/FlIhZbi5N9U5HF50hLaCN
 rDeReQoGfG6CApzwzr/oOsq20DaT01Eu9cY/slG2Zw9i2yu8n42ABBl
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: YkXMuoG55f1Y8KO7mQHgo3beEwkJlpk_
X-Authority-Analysis: v=2.4 cv=KtlN2XWN c=1 sm=1 tr=0 ts=6814c612 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-Vf3EJXieAsgESLsksMA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: YkXMuoG55f1Y8KO7mQHgo3beEwkJlpk_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDEwNSBTYWx0ZWRfX2CJG1+8fBVI4 d3sBU9GVerj/+i6f5MAi7w/n8fJSI0tcn4jBWC9xr6dmwtCD1PpgZEEV1ThKACa18av0ycKj5sT 1QOcDnhdIubWXvOlU2i3eoMLC4mZtl+MTIRWlOeo0DtY62rB3nb6hogkT+P4Kz8aKNgobPNtTx/
 vsINX/s8dVJYE4z2uSvG45pe5mBHN7LJA736J8Q2P8fj2lqeJSW9PUfsP8RP7QXa/XIs2WgI5D8 1BTNkS2e3vgIJ60XH509LpkFuwUUikTxeXN+YvfWDViYWs3cDg0oazamkoELCg6VUj1Me6qO1cP ZNZZ/zxIj6FClM7q1+vY8Jm72BuLHzYO22Og0NUwtoZG2wsAVCQzLaUd3Xiz8U6eBT7EeMtVOx2
 cJ0iicTfhdH5QyvuW+3wzaGjtEcnrIfnFlnO6gQOQjUlJhVf30eFr2Kr6Qr/mzvkn2UC9X41
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-02_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505020105

In Qualcomm IPQ SoC, if the system is rebooted due to the watchdog
timeout, there is no way to identify it. Current approach of checking
the EXPIRED_STATUS in WDT_STS is not working.

To achieve this, if the system is rebooted due to watchdog timeout, the
information is captured in the IMEM by the bootloader (along with other
reason codes as well).

This series attempts to address this by adding the support to read the
IMEM and populate the information via bootstatus sysfs file. As of now,
we are handling only the non secure watchdog timeout reason.

With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
as below:

cat /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
32

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v3:
- Picked up the relevant tags
- Dropped the fallback compatible handling
- Split the driver changes into 2. Introduce the device data in one and
  extend the same in another for the use case
- Linke to v2:
  https://lore.kernel.org/linux-arm-msm/20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com/

Changes in v2:
- Dropped the RFC tag
- Reworked the driver changes to use the syscon API
- Link to v1:
  https://lore.kernel.org/linux-arm-msm/20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (4):
      dt-bindings: sram: qcom,imem: Document IPQ5424 compatible
      arm64: dts: qcom: ipq5424: Add the IMEM node
      watchdog: qcom: introduce the device data for IPQ5424 watchdog device
      watchdog: qcom: add support to read the restart reason from IMEM

 .../devicetree/bindings/sram/qcom,imem.yaml        |  1 +
 arch/arm64/boot/dts/qcom/ipq5424.dtsi              |  9 +++++
 drivers/watchdog/qcom-wdt.c                        | 47 +++++++++++++++++++++-
 3 files changed, 55 insertions(+), 2 deletions(-)
---
base-commit: 3e039dcc9c1320c0d33ddd51c372dcc91d3ea3c7
change-id: 20250408-wdt_reset_reason-e12921963fa6

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


