Return-Path: <linux-arm-msm+bounces-99111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WOGVNYnqwGl6OQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:23:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF322ED7EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 08:23:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 617A330470EB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9D53019A6;
	Mon, 23 Mar 2026 07:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGAXKBz/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sm5YXenb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D3F283FD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774250135; cv=none; b=UsEnlum+f16QgMPmeHZIkiu2V7fKWX1DU70J3i0wRiwWchkVmJW+DFbc2mylyILlvYl9UwZstn8+MXeVxSnGxE92dt+77BS5AMCYEU/KW1rPcseKOdvleCgEsQBBSwORHhB0KGdvW3GBHuT+NnK0T+aPO2SdtGKRWMuRj4L6pFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774250135; c=relaxed/simple;
	bh=61ZFZYnPKPd8FLwR4ye7hovbdEpgjUJh1k35p+MDMkU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hpvd1IA/h0cHRzNADhniRElm2sfkYBr9CPSQJ5gRar7Fj4EIlRxVZkPc2EuBvdwsST2Qlozt5XJYTJMqyZthtj8v5edJwiC5ed1CslDUyMjuyUa4gCPXDFhSY6gFDPnya/BTBLfPrVriUYi1MORvXQrIkpsLpPESMPhBAd/dRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGAXKBz/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sm5YXenb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MN8EiI3529248
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C0E4FZGh3Z/6gO71aQ5vJ0
	JrLCz1wkkdI/+bpz/bMEI=; b=iGAXKBz/bvz5KM2WOF0dMTBvkUNlIMyQzWzliA
	wWHZFbNdsBKOirGa+sPjvXtss75CcSKyoQn6IqCRM6NR9dhzRpwiGkEoc590E/bZ
	pepvEvmlmTDjU7sfEXeCeCAK2Br9vM+s9low6su2XCpJbnn7vfZoQJmoerrzER5f
	0hqcaD05nCLL7E8Injo2pKR2YpreTy0GUAiNQ86faWNE0nPZM3YUKRGpBx+nT41R
	IlvKK4XaduTnq2YtlaunzOsN6C78qbi+Qo+Cwrks4CIT0nwQdM8+THOieA+8qzOC
	u0fEZUpB6PW01JjseS0eciVGzH6/T6O+kFsl5Lj28MeFqTTw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8j6vg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 07:15:33 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-126e8ee6227so2182109c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 00:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774250133; x=1774854933; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C0E4FZGh3Z/6gO71aQ5vJ0JrLCz1wkkdI/+bpz/bMEI=;
        b=Sm5YXenb3uwQTOgI28D257XvtNq9+kMi4nv/qgcpRm6IbaiYbsIu6/v4XgRqkwB7Kn
         sYqW91LozdtotVRh01hr1K+ZLoAPPEKzLiO/mcG2fy3li+ZD+NM7q0rRSrn0GGinl/f3
         wvtvqt5OVhjNMFd+8ADPqkoXgoGL6x+s/CEZlGnTCDew32gvonHA2EKOC8G/3eG3iIcv
         MEKt2ayKplCNhgt51VBfmKtO4mmHuVfQOlW/zMdi4QDycJbT+9it9Io2PHDA9LOvJJPY
         R5VNt7a6pWGAXtbWlnpwpo2bk4Qr97Oj6L8s18rTiWeJNigsLD7Izrj8F+uk0ZAOXat1
         bd0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774250133; x=1774854933;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C0E4FZGh3Z/6gO71aQ5vJ0JrLCz1wkkdI/+bpz/bMEI=;
        b=fxhpb/VOalubd4m6jGU3w0+FKss5IROmiMB6VyVKWtBqO4q4jnqDgwMLvNKS9H+XNc
         4tvjBvMFDpT7VnYSvGbA9xZ8D5QJGKnxv76NOksnhZfItsIEoFvdbrfxYEfmPchXTinR
         5UNQPGVxvNAqikmQSvIwXUsGxJ23e+6t6DVUHZBS2SFddtlrS9wDf6z4+hXjfjWvPlj5
         PxnTTo65x173wmKB1fsWSrfjggK4mQdJwtkNDl6DSAJF/Uu5BlZ8GvJs6bhz5EbvFcgX
         4UN29baMWhygymjM8prS77DrRG4ZDQRk9UcDG8bbeSA4N7zHQnElNyGCkUMP4VM7lzqt
         WpXA==
X-Gm-Message-State: AOJu0YypWGHM+wWleG548Qh4zSHrC3XAKxy7nFFof8OlM2RwMOH9v4zc
	yC9jFexoGQkbQi5hF8xi360KbvgkYB6qQqOLejqyj0ThsXm+RTPyPfcI73aD0krRvEqqmpHtVC2
	LQ5UGsX50I/X6ww6D5L0cu3Pf7b13nECNwYpCIoLIg76Rw8/2bTIywL3MGXz8z43InqUd
X-Gm-Gg: ATEYQzyEeUAIkJx8Tt1xOOBJgMc/c+ATIfSJnHK162yqmZ+Pi1iwmacMEme4SMReCni
	08OzeA6tj9OthL8TToXzw9WtegyGR6pqkFJjvOnvdNeqzWC1ViIiNnNwPvICP1QjsZ2hDVUuvpZ
	bQ15L0YqkiRLrFzAChde8KqpB8wh26xOvuwglUDxT8n3ch7eHDifUyecR/JHLqqbofG/wpkK9F+
	CdCJdZabhZ3f3buXvN+b5VIGLB2b7okpOeFSRufL/ugFel8IGvTv2RXXHm7Sg09jZZNoIXdrtEu
	QMbT6we6fJOi3+THAKhoYaePr0nz2gE2bdJJ4clBBlq8vRfxNXRx0mqk7ppQvPPMxMlRoaj33ab
	uTwgZHf/LrqkGHuv2D8wn5pZtczM3pob6tWAy5ECtEZ0fiLYhALEegAE43XP+SOmjXq7x
X-Received: by 2002:a05:701b:2503:b0:12a:7f25:44fd with SMTP id a92af1059eb24-12a7f254723mr1222962c88.41.1774250132615;
        Mon, 23 Mar 2026 00:15:32 -0700 (PDT)
X-Received: by 2002:a05:701b:2503:b0:12a:7f25:44fd with SMTP id a92af1059eb24-12a7f254723mr1222948c88.41.1774250132003;
        Mon, 23 Mar 2026 00:15:32 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14cadbsm13997886eec.3.2026.03.23.00.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 00:15:31 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Subject: [PATCH v2 0/5] phy: qcom: qmp-pcie: Add PCIe Gen5 8-lane
 bifurcation support for Glymur
Date: Mon, 23 Mar 2026 00:15:27 -0700
Message-Id: <20260323-glymur_gen5x8_phy_0323-v2-0-ce0fc07f0e52@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJDowGkC/x2MWwqAIBAArxL7nVBrL7pKhFRutlAWSmFEd0/6n
 IGZBzw5Jg9t8oCjiz3vNgKmCUzLYA0J1pEBM6wyiSjMem+nU4ZsGRp1LLeKWgqpy7EoUFZ5rSH
 Gh6OZwz/u+vf9AGpE931oAAAA
X-Change-ID: 20260322-glymur_gen5x8_phy_0323-3d5b4423617d
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774250130; l=2842;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=61ZFZYnPKPd8FLwR4ye7hovbdEpgjUJh1k35p+MDMkU=;
 b=KkZ7rLhZr79BzD4FxmnR/UMUXo1EuSRdH5F3WzfxpQBXVfKd9V6gb/4cq7V64bXkY0jpkLRkX
 XnM4aKoeuFZDdSTIRouyHc9pR+L1A2WIoFPdmEkAHDMCFHqA5/AtHJt
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1NCBTYWx0ZWRfX9fXqOEnUm3ze
 JsbciwJpIU6vZzIcnWu5Q8e/kOt5mIZr4bcyhAawxBu/+bfa/t0pYvzfPLPCX5c1bs9pVUO3P5g
 oIpFNksItaww4nAGRgVpecvrj+ke84u5LUT/BX3KaH9PpXIyXtxMmpZPjCL/e4o0HOTG8MD6YAD
 q79Xz3Vv7sXUeYHnWbBtErHjxDC7sGLKrVW+QfVHcfa8uHcAfJgoE3XYRWZETJCVwsMYiS4w1Va
 lb5D83ewCUrOdn6czN7tDbKmNe9bDv23TklVfxkBgxSOga9Zpf+D7xGmKJCULOdeayiidywn0FE
 MvWdOcbruGwKeuhcLpTPTYnxHqVW+8PLGJTUcHJv2gCexNlJFYxTFCzmT13iTjxgeS1wfiB3oh/
 D5+T2zYyZlRARZJHIvuHduAQfxOji7IwIBCiPCSWolbuTXPIk6Ke1+s9Wy/bFYjFt0Ff0r149WW
 4GYg2qeniGx7Pjyln3w==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c0e895 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pO9I23orwyiV47DujX0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: Qw5AOmC3U_gxY5k5kxqT7Nbl-M4PHmjA
X-Proofpoint-GUID: Qw5AOmC3U_gxY5k5kxqT7Nbl-M4PHmjA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230054
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99111-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3DF322ED7EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch series adds support for PCIe Gen5 8-lane bifurcation mode on
the Glymur SoC's third PCIe controller. In this configuration, pcie3a PHY
acts as leader and pcie3b PHY as follower to form a single 8-lane PCIe
Gen5 interface.

To support 8-lanes mode, this patch series add multiple power domain and
multi nocsr reset infrastructure as the hardware programming guide
specifies a strict initialization sequence for bifurcation mode that
requires coordinated multi-PHY resource management:

1. Turn on both pcie3a_phy_gdsc and pcie3b_phy_gdsc power domains
2. Assert both pcie3a and pcie3b nocsr resets, then deassert them together
3. Enable all pcie3a PHY clocks and pcie3b PHY aux clock (phy_b_aux)
4. Poll for PHY ready status

Changes Overview:

Patch 1: Updates dt-bindings to add qcom,glymur-qmp-gen5x8-pcie-phy
compatible string with proper validation rules for the unique clock
sequence and multiple power domains/resets required for bifurcation mode.

Patch 2: Extends the QMP PCIe driver to support multiple power domains
using devm_pm_domain_attach_list() and enables runtime PM for proper power
domain control during phy_power_on/phy_power_off operations.

Patch 3: Adds infrastructure for handling multiple nocsr resets by
introducing num_nocsr_resets and nocsr_reset_list fields to qmp_phy_cfg,
allowing the driver to manage arrays of nocsr resets using
reset_control_bulk APIs.

Patch 4: Implements the complete Gen5 8-lane configuration for Glymur by
adding the glymur_qmp_gen5x8_pciephy_cfg with proper reset lists, clock
configuration.

Patch 5: Add PCIe3a device tree node and required system resources in
glymur.dtsi. PCIe3a slot is not present on Glymur CRD, so there is no
changes to glymur-crd.dts.

Changes in v2:
- Remove pd_list from qmp_pcie struct as it is not used in phy driver.
- align clk-names on "
- Link to v1: https://lore.kernel.org/all/20260304-glymur_gen5x8_phy-v1-0-849e9a72e125@oss.qualcomm.com/

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
Qiang Yu (5):
      dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add support for glymur Gen5 x8 bifurcation mode
      phy: qcom: qmp-pcie: Add multiple power-domains support
      phy: qcom: qmp-pcie: Support multiple nocsr resets
      phy: qcom: qmp-pcie: Add Gen5 8-lanes mode for Glymur
      arch: arm64: dts: qcom: Add support for PCIe3a

 .../bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml   |  45 ++-
 arch/arm64/boot/dts/qcom/glymur.dtsi               | 314 ++++++++++++++++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c           | 129 ++++++++-
 3 files changed, 468 insertions(+), 20 deletions(-)
---
base-commit: 785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
change-id: 20260322-glymur_gen5x8_phy_0323-3d5b4423617d

Best regards,
-- 
Qiang Yu <qiang.yu@oss.qualcomm.com>


