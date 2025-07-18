Return-Path: <linux-arm-msm+bounces-65657-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8773B0A493
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 14:57:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E8E47B7A9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 12:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A3E2DC324;
	Fri, 18 Jul 2025 12:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F+GrW1i8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D96B2DBF47
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752843437; cv=none; b=e89JX15kN88NLLW8+X0GNmwTHssAqQMVfEkNRkt3EcPydTbmop7U6tVWC4Kb/uNdRnlAKifY8siFrIh/Z8RXuNDM2bz9AHPK96FNEJvUWmpPYCO4Bs7/d0twytYvqwyEkyTged1aoePwqAvZPEPpoV4UjIyrgAkEyqhEWMU+5Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752843437; c=relaxed/simple;
	bh=qVmZIOXUQFEkBYP/pV3v0JXE/zkT04ONDS5v7oOZzEw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k9ahm0aODz7mLI0+HzjWtMVFNUW7NGrRp0dw3K4Qf4G/52XWYHJdsJ3uXbHuEj/Ahee099bByWRhYePtRPX0ABqfnRT3KE1XmcFsKXvvEkKYFK0evdIbA3hGwKoapQD9Av1pQHZzdX7Y/OsW+o5cjeXXoItRMYipzlVYFb7UdVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F+GrW1i8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I6ZY9x020802
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8zqWn4x2oAL+Qmb2/WLY8e
	d56xYAHyL4uYGypBmZTa8=; b=F+GrW1i8lrA3RZUxPAvF763wp8zEzjRFjhfNLB
	y853/aq+mSXGlAOYpLlXEi4RcO6XS0ofxksagKxTCI7rebTA17XYynABO8l9bAy8
	aEUfUuD2SpNqJrcumym8eApBjsmFEy7+l73v1wHgvPw3dJ8sC/B6KUT4O3o+5dRV
	tU/WjS1VJTereojeg7BE/l/N7V7lUE43WmqpNM164IGdbCFymiYtUWLWymTx3biT
	Ad9HNlUQ2V+M+xqmNlvfd6FlRMV7HFYa+34Z/71cC6uh+cfWhdC3BeANSu571tn4
	CNLtC+zm4SeR+XXyg7cusID6U85ovhJhdkP8Va1LYjH0gmwA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dppmfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 12:57:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23dc7d3e708so15424955ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 05:57:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752843434; x=1753448234;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8zqWn4x2oAL+Qmb2/WLY8ed56xYAHyL4uYGypBmZTa8=;
        b=jT+kFSX2SvqGInnZ+l8yIjGUkVRL1XbaVMoac3bIXsCewn5JpvzYYjOo4ye1dBpIvb
         0FA5yP2952YjJYdN4ttNKfgiUh/W/eGHpnTtYX0AEydEL6XWoL1CaxhYzPWJkJ/9YsdQ
         WYvyOnagzKReMxW4i98+SyD/gky7zPdxKCIS7VgcLgKYU1QRo/hbn9UYqqjUMIuR2zV9
         LH/UY126IEqxaVATePYEvNs5m1BYHAdb+EIgxinLu/XuvqpFv0C4tDBwtbfY/txJkCUG
         m7NcO0G4Sh8yg1ibKHZJoQ4R9GhGgaYrGsHo/bWSLkowP9N4AYdOIUvKyoEokONX+SF4
         npqA==
X-Gm-Message-State: AOJu0YxaOHrnjGvA0Jd1SpPXGAlzUwruzZHBMNpdruvr2hTI2R2/AsCC
	ew0el2Szi6w4UstJhoOhhyt92EYuMJN6akC+zDNml2rYDQmijpw0S7KyaHuy0j6gMui6yX42uLy
	zg9J9h7TSTix0JSJKtD/DljywzDS+vm3rIcVWW+vuKt8bTKaQI71Z25cO18EguxtCx9po
X-Gm-Gg: ASbGncsUVZ/37ddj2fftyoIjwmemwAlTDEfQIeCRRv13t86W3nBFuVwrKph6h0rNJjS
	YNJS+JPX6IUirHsAUooD9pInU5DTsOpPfyAb+7RfcOelP39D2rbEG7fyX0QTR0Tsz0rgnNcYHuj
	He7m1m/A4RMx12nPX5vZ1udZtxd0zFy2WNHWAohLEMEpIDHUcbkcSvp3vyMQB60g6ZsVgPXZpGT
	LDXRD1uY4nAGpC7xQgWSC7p7PMiZslpip82SUmycoN5p54GV1yROO2puwnzZcECkeZv3cgKEqfJ
	1ISAz4GpZ77+JgLU9VOoUDgWhGb2QQ3BZAZpbNYo+pWg49H0UeIOM/7cXmtQqeSY3jnEJhXoL5z
	WQQGFVjmp+R+qmw==
X-Received: by 2002:a17:903:2344:b0:235:eb71:a386 with SMTP id d9443c01a7336-23e25787f4bmr150855225ad.50.1752843434275;
        Fri, 18 Jul 2025 05:57:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHYON6CbyFCo5n0QsrLBf4KVyiRUd9Riz5PluvLbePaSFNxSP1zGqr5dGdMXpPObdH36pZLfA==
X-Received: by 2002:a17:903:2344:b0:235:eb71:a386 with SMTP id d9443c01a7336-23e25787f4bmr150854835ad.50.1752843433784;
        Fri, 18 Jul 2025 05:57:13 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3bdfe68csm12332435ad.183.2025.07.18.05.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 05:57:13 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Subject: [PATCH v5 0/2] This series aims to enable display on the QCS615
 platform
Date: Fri, 18 Jul 2025 20:56:31 +0800
Message-Id: <20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIBEemgC/43OTWrDMBCG4asErSvQjH5s9yolGDkaNYI2diRXN
 ATfvePEkC69/Ab0vLqLQjlREe+Hu8hUU0njhYd9O4jT2V8+SabAW6BCqxpw0ocgQyrTl7/J8jN
 NY55lHLO8nooDK/k+8/yWVlF0/KYz3grWpkwx/T5KH0fe51TmMd8e4QrrdW0YUGDWRr81+q3RM
 9pvjQpSSUPRQwdhCMGIFaz4QgD07o9WZA3bRtPg4tC67qnpfxrifk2zpi1aJO0tRHpq5qUhqP2
 aWf8W2sZ61ziFQRyXZfkDipVMaLUBAAA=
X-Change-ID: 20250716-add-display-support-for-qcs615-platform-50ef625094a5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Li Liu <quic_lliu6@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752843427; l=4390;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=qVmZIOXUQFEkBYP/pV3v0JXE/zkT04ONDS5v7oOZzEw=;
 b=PtrrPAuyAGTAfYcvDL9xy09xJmvcgY11BRMIUpoZBOh7xkKx8GvvJw/U264EvnwkKAFOUw3A4
 MPYprGLe8TSCLfknfKVFdfVhUbNU2mJcyUwUO2A8XFFrZdY6Tlikf9f
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA5OSBTYWx0ZWRfX9ulFkfbAiAkw
 qgz+4yX1uJwNkfv+r8C2FTsBs3d/JvYD9+KOw9oeDf8+4pKYVkbWnAHLtLUuhKVjr+P0ycvXyA6
 TPOAcxyGtgXZP3zWWGBgYLi/lTDPgAK6uo6DVBSJezkm+BMpxuZc92vJLMshqcacQqcL7vdMeOR
 HlWo85wZJbTVSvz2x8wsciSufpa2/1Cz/OtFhvoh8R0t4+obKA0opkwniNqbqlNvcpuetyLaRJ5
 qUboo2EDcWlDw4soxiSKIFVK/T+6LyYmwWnsuPQH0S91SQYviwOXOJ8DZSte58KdFlchFFgurMM
 ADucOT3xoqkbYkiStZMKy1cFX9ue2SUYgKycm0OtBIY8day4AXoIwAgZHbEMv545zbb+LsBCReu
 8LbfeMO2rXZeONn3MXMS573d9D/O55uiYSc/8NtntFMbSOfYonJvjqhKZCqdejpwD605ZCaK
X-Proofpoint-GUID: xe-RKRkGt47aFo8tk8TYA_ciXlskyGFX
X-Proofpoint-ORIG-GUID: xe-RKRkGt47aFo8tk8TYA_ciXlskyGFX
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=687a44ab cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=cPZTKmnv21vz4B3j65YA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 mlxlogscore=906 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180099

1.Add MDSS & DPU support for QCS615
2.Add DSI support for QCS615

QCS615 platform supports DisplayPort, and this feature will be added in a future patch
Dropped patches 1–7, which have already been merged upstream

The dependency has already been reviewed
- dispcc dts
https://patchwork.kernel.org/project/linux-arm-msm/patch/20250702-qcs615-mm-cpu-dt-v4-v5-2-df24896cbb26@quicinc.com/

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
Changes in v5:
- Drop patches 1–7, which have already been merged upstream
- Rename dp-connector to dp-dsi0-connector
- Rename dp_connector_out to dp_dsi0_connector_in
- Rename label from DP to DSI0 for dp-dsi0-connector
- Rename anx_7625 to bridge
- Rename anx_7625_in to dsi2dp_bridge_in
- Rename anx_7625_out to dsi2dp_bridge_out
- Rename ioexp to io_expander
- Replace legacy `interrupt-parent` + `interrupts` with `interrupts-extended` for bridge [Dmitry]
- Replace legacy `interrupt-parent` + `interrupts` with `interrupts-extended` for io_expander [Dmitry]
- Update interrupt type for bridge [Dmitry]
- Update interrupt type for io_expander [Dmitry]
- Link to v4: https://lore.kernel.org/all/20241210-add-display-support-for-qcs615-platform-v4-0-2d875a67602d@quicinc.com

Changes in v4:
- Add dp-connector node for anx_7625_out [Dmitry]
- Add missing qcom,sm6150-dsi-ctrl for dsi-controller-main.yaml [Krzysztof]
- Change VIG_SDM845_MASK to VIG_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
- Change DMA_SDM845_MASK to DMA_SDM845_MASK_SDMA for sm6150_sspp [Abhinav]
- Remove redundant annotation from sdm845_dsi_cfg [Dmitry]
- Remove redundant blocks from sm6150_intf [Dmitry]
- Update mdp_opp_table opp clk to correct value
- Link to v3: https://lore.kernel.org/r/20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com

Changes in v3:
- Add reg_bus_bw for sm6150_data [Dmitry]
- Remove patch for SX150X defconfig [Dmitry]
- Remove dsi0_hpd_cfg_pins from ioexp [Dmitry]
- Remove dsi0_cdet_cfg_pins from ioexpa [Dmitry]
- Remove tlmm node for ioexp_intr_active and ioAexp_reset_active [Dmitry]
- Remove qcs615_dsi_regulators and reuse sdm845_dsi_cfg [Dmitry, Konrad]
- Rename qcs615/QCS615 to sm6150/SM6150 for whole patch [Dmitry]
- Rename qcom,dsi-phy-14nm-615 to qcom,sm6150-dsi-phy-14nm [Dmitry]
- Rename qcom,qcs615-dsi-ctrl to qcom,sm6150-dsi-ctrl [Dmitry]
- Rename qcom,qcs615-dpu to qcom,sm6150-dpu [Dmitry]
- Rename qcom,qcs615-mdss to qcom,sm6150-mdss [Dmitry]
- Split drm dsi patch to dsi and dsi phy [Dmitry]
- Update yaml clocks node with ephemeral nodes and remove unsed include [Dmitry, Rob]
- Link to v2: https://lore.kernel.org/r/20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com

Changes in v2:
- Add QCS615 DP controller comment in commit message [Dmitry]
- Add comments for dsi_dp_hpd_cfg_pins and dsi_dp_cdet_cfg_pins [Dmitry]
- Add missing port@1 for connector for anx7625 [Dmitry]
- Change 0 to QCOM_ICC_TAG_ALWAYS for mdss interconnects [Dmitry]
- Change 0 to GPIO_ACTIVE_HIGH for GPIO flags [Dmitry]
- Move anx_7625 to same node [Dmitry]
- Move status to last in mdss_dsi0 [Dmitry]
- Rename dsi0_hpd_cfg_pins to dsi_dp_hpd_cfg_pins in ioexp [Dmitry]
- Rename dsi0_cdet_cfg_pins to dsi_dp_cdet_cfg_pins in ioexp [Dmitry]
- Rename anx_7625_1 to dsi_anx_7625 in ioexp [Dmitry]
- Remove absent block in qcs615_lm [Dmitry]
- Remove merge_3d value in qcs615_pp [Dmitry]
- Remove redundant annotation in qcs615_sspp [Dmitry]
- Remove unsupported dsi clk from dsi0_opp_table [Dmitry]
- Remove dp_hpd_cfg_pins node from ioexp [Dmitry]
- Splite drm driver patches to mdss, dpu and dsi [Dmitry]
- Link to v1: https://lore.kernel.org/r/20241014-add_display_support_for_qcs615-v1-0-4efa191dbdd4@quicinc.com

---
Li Liu (2):
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  90 +++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 181 ++++++++++++++++++++++++++++++-
 2 files changed, 270 insertions(+), 1 deletion(-)
---
base-commit: 23528367fa2447e7a2c8d91e899dd54e89c0a1ef
change-id: 20250716-add-display-support-for-qcs615-platform-50ef625094a5

Best regards,
-- 
Fange Zhang <fange.zhang@oss.qualcomm.com>


