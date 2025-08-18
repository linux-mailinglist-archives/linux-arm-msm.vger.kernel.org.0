Return-Path: <linux-arm-msm+bounces-69470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5BDB29878
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 06:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AB20163D04
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 04:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD1C0265621;
	Mon, 18 Aug 2025 04:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hjeiw8dq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9F9263F36
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755491998; cv=none; b=FjuR/ulENardVWV9pltvwdlqrkCN9G9v6Qwcpj6qEQ6JuTjOLeLPIp0UbZRZslAFH3+5xSepde318Yr1JG3c1qKBC8h0S8YL4mIcPGVhc0c9TGh4kllxcO0cupq3bePue0r35Vj5lk+X2TKYG8yzd7UHOy++siw8VcwYMm62Ouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755491998; c=relaxed/simple;
	bh=KSLLj8Cg35yeXiOQ2rIw/G+j6qXlbNUMDJjZ9jdWyOE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hvN6nzuCuliOsTrgmhrc9txqOfAEbh6gHNf8l4SuzEmEr3Nj81fVzWzd8WAyBop6WU0F4PCXaFbZdOTMf5l4EghzYWiGfCATDmiGYLDlq602aurJ6sxKmIJMpBFzrQKZ9/ePtR+F77SchznkogeTjY5bqT7jNl0wvwW3hDimZ7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hjeiw8dq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HM02Mh021396
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1NR64GHFeask4qb8/xUkJ8
	EbUFcX0eF5pSEmHVElsFQ=; b=Hjeiw8dqZa0FvZQwmaaC35g2sbhv9opVUhjI2e
	xQ0vV+u1gv/C74OOIrA8HwnIC60kZpoCWFooXA++w+gH4/CHxqUD6kbSTYz6Tz7h
	LLq43uDDsCaroWUYJeMMaiu7XtObzSVjdoeAza5L5XVPWG/+j5iL1Y0ICSmsHl2b
	JdThMstTYZ+IZPTQ28hJITIMmBKs4vQRefDp7jRm5jpaWBMfBBdNRaB4LauSj3sc
	tdyhNoB29iCB5t+deHnojp+xIxwmXmK4J/5IjRyb63/E0EDukYVm7VH+DdAwZg7c
	uToOaUup/OC2RgsM5JSgsq5KWqbpMTKB8l1k6s9twRMkX0Kw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh0739v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:39:54 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b47174c667aso3300881a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 Aug 2025 21:39:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755491993; x=1756096793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NR64GHFeask4qb8/xUkJ8EbUFcX0eF5pSEmHVElsFQ=;
        b=GR16Lkj8sW/Vg75KFyTsvD9ftkjeqTfpzxRnzwdOKKoVqs0vbqyyfdM7dwOWZsR8u2
         Y6u+V1I45QOl+vL+3y7dsefXwBxlxLoegkG1BDVsesCKfWI2qlhPgimNa1rE38J9OwpO
         ElIDti2xkrFBR9Vt5NpWnMe7QZVDFgfcik8EtdwClP7CaFrycyeXoTBVvFHUdih+Tz09
         rfsH/Q1/9b3fTU+oA433IFWI7dUcLX/Zb8JfyD6PC4rUeK/IEtnXeCC816dYbLZbfRRK
         6d3VV7RrY5J2VZiH4yPfPAP4QPJDbuBUc9WtXYVi649rXv9MFVDobCF6+5VB1k/gc6MF
         RvJg==
X-Gm-Message-State: AOJu0YyMimyaUaXlXqhKEpYa1LFuK0qmwkaYxmuXgPbLvFSCf7rW/v3j
	sBx+7GeI8QjTWfNRARHY2aEKNzCL//LOQ1U/VNJjjFcQaYpAw8Pv/k7NPfDyb/6tiNABxuXlYvz
	80RBA2ytxUJGIA3Rn73KfNHyaWshK63yiOySUWWRBf/SRp5gtVkTFPQ00dTsI+fMSBp0c
X-Gm-Gg: ASbGnct72g+yqtZhiy/fq09kgH1oo09wqDnBn4kUUNztLLolWblAWC+lJpC5/3QLlHJ
	xj+6BplxbWu3yULSgN6pp1ze4s0hdzqbKqIvGRaCcQ/W4zkNtq5gZ15CH/gHkCYq9OZRIwvK1qB
	y4NSi9LmHUUO2NU449Yx9Mly643LEE9meSXDxhsjyq4t/cqKvJ8kSGJsTv0AHugj2z1kNbRlBs8
	PT+/mNvPv9wuXt9/bXtLA+H36OKDmhTccW8eWxY0S3L6NNX+QoasIFZ9FW8hQDFaM56gcBQmfd6
	Qw0byX+FTMYZXCci6QXF5R6pRz4ZoDgllRrtamG3vBKy4H9TFp2fN6A5MrEnrAj3Cb3dG5btPF6
	hJESOpuSmHbXtKgXfibKgz+1k3GiYdcqjUQpYldYrsE6tlDVaqnR4giuj
X-Received: by 2002:a17:903:41d2:b0:240:4d19:8797 with SMTP id d9443c01a7336-2446d75becdmr173584965ad.22.1755491993000;
        Sun, 17 Aug 2025 21:39:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6rIbGtm3cTNiMPouKeyhqMRXZb1S/1TN9Ws1mkPz3xtO2PINyibUiytPLz3RdpGICT6Go9g==
X-Received: by 2002:a17:903:41d2:b0:240:4d19:8797 with SMTP id d9443c01a7336-2446d75becdmr173584665ad.22.1755491992595;
        Sun, 17 Aug 2025 21:39:52 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446ca9cffdsm67505765ad.5.2025.08.17.21.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:39:52 -0700 (PDT)
From: Fange Zhang <fange.zhang@oss.qualcomm.com>
Subject: [PATCH v6 0/2] Add display support for QCS615 platform
Date: Mon, 18 Aug 2025 12:39:19 +0800
Message-Id: <20250818-add-display-support-for-qcs615-platform-v6-0-62aad5138a78@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHiuomgC/5XRwW7DIAyA4VepOA8JGwx0rzJVEQlkRdqaFDK0q
 sq7jzSZumN2tA/fb8Gd5ZBiyOz1cGcplJjjcKmDfjmw7uwu74FHX2eGAklYsNx5z33M44e78fw
 1jkOaeD8kfu2yBuJ1P9Xxk1Mr0CnsiMixqo0p9PH7UXo71fkc8zSk2yNcYNkuDQUC1NJotkazN
 ZqKNlujABdchd7BEXzrvWILWPCJAMjdhxasGlojQ6v71urjqsk/GuJ+TVZNEhIG6Qj6sGrqqSG
 I/ZpabvPWkNNGC/SrRr8aCfOPLylUNUvmaKwN9fGIneZ5/gHiCq+DAwIAAA==
X-Change-ID: 20250818-add-display-support-for-qcs615-platform-5b02a42c555a
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li Liu <quic_lliu6@quicinc.com>,
        Fange Zhang <fange.zhang@oss.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        xiangxu.yin@oss.qualcomm.com, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755491988; l=4970;
 i=fange.zhang@oss.qualcomm.com; s=20250714; h=from:subject:message-id;
 bh=KSLLj8Cg35yeXiOQ2rIw/G+j6qXlbNUMDJjZ9jdWyOE=;
 b=apX3K8Hq30/LjAiJzwF4nwd40nWbeRYJeeyIp+MlYZuxEcpwhq8xxf9nfOJINyRiXSBAvtxLp
 aUVO5f7z0BuDBbIcnedKRLcOxe+USvW43thtIuuw4uhykjV+gGAQUVq
X-Developer-Key: i=fange.zhang@oss.qualcomm.com; a=ed25519;
 pk=tn190A7bjF3/EyH7AYy/eNzPoS9lwXGznYamlMv6TE0=
X-Proofpoint-ORIG-GUID: G4PR2-464N2nyKD2CoWAN5L-Q1d139c6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX0Yjw3QbYsa5f
 Fdz/CoQSb82K2HDBglXzHmdmbjFErKL2WzihGzxdxoj1BgeaspQ+ewC9lephRjYrvqxnH7xQluo
 qzT6lF/PoxJ1KhYVuIvEvlocZs/mOK9QMOx4NZaLmDgUK+kzADblVvN/OR28GR1ZRozvNnhRogw
 GTb27lSs0Zk2GF6nJN9vfeEv+Ghq7zfHzcnjcyKF82VkPR5iX6SfEFdG7kBwC9NjnL4tUi8xAX4
 nEJ80U58XHSB7vcKT+b7/yDp8WIBkM86j2Wr4ixxD6L2/ej3sjOqWX8SGbrl1ymvD8RiQ0zNW5g
 nBSeuEM1j3qHyKUBM1LnRabheE0TvDkl6R5HwkLSSllc5uJWTc2tm375kCy/P0G4hSKCoTm3npo
 yzigp2s0
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a2ae9a cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=nxEaKfvGoP9ROcwm2F4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: G4PR2-464N2nyKD2CoWAN5L-Q1d139c6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

1.Add MDSS & DPU support for QCS615
2.Add DSI support for QCS615

QCS615 platform supports DisplayPort, and this feature will be added in a future patch
Dropped patches 1–7, which have already been merged upstream

The dependency has already been reviewed
- dispcc dts
https://lore.kernel.org/all/20250814-qcs615-mm-cpu-dt-v6-v6-0-a06f69928ab5@oss.qualcomm.com/

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>
---
Changes in v6:
- Add qcom,dsi-phy-28nm.h header and update dispcc DSI clocks [Konrad]
- Change mdss_dsi0_phy reg size from 0x188 to 0x124 [Konrad]
- Remove assigned-clocks and assigned-clocks-rates from display-controller [Konrad]
- Remove gpio header [Krzysztof]
- Replace legacy `interrupt-parent` + `interrupts` with `interrupts-extended` for display-controller [Konrad]
- Update mdp_opp_table clk [Konrad]
- Link to v5: https://lore.kernel.org/r/20250718-add-display-support-for-qcs615-platform-v5-0-8579788ea195@oss.qualcomm.com

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
Signed-off-by: Fange Zhang <fange.zhang@oss.qualcomm.com>

---
Li Liu (2):
      arm64: dts: qcom: Add display support for QCS615
      arm64: dts: qcom: Add display support for QCS615 RIDE board

 arch/arm64/boot/dts/qcom/qcs615-ride.dts |  90 +++++++++++++++
 arch/arm64/boot/dts/qcom/sm6150.dtsi     | 182 ++++++++++++++++++++++++++++++-
 2 files changed, 270 insertions(+), 2 deletions(-)
---
base-commit: 7ef84751db83e45a12d69cba309f2af0ac9150c3
change-id: 20250818-add-display-support-for-qcs615-platform-5b02a42c555a

Best regards,
-- 
Fange Zhang <fange.zhang@oss.qualcomm.com>


