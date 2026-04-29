Return-Path: <linux-arm-msm+bounces-105242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cKKdHRYk8mlmoQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:30:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C7A496EEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 17:30:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5BF343009B3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 15:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 442CB378D9F;
	Wed, 29 Apr 2026 15:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCS8DjRA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Otfvzw7k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE87D377ECF
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777476279; cv=none; b=M3CIRdkEjTcY6PETfreJs6HobrUgpYV7YE6zW7YQ+c4YFc+/IfmcAbx4NM1Q6r5AgEo/vubT+cFiuw6rmvPPB8o1ezqVnGV7TtOW+gA2lCmYe4qVXSN5A3JLKcbN9ct4Mx8IjyuG3/owG4A/8jHPHrTzZhU5/zkogAFYIlalFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777476279; c=relaxed/simple;
	bh=h51VaY30oVcgyb7vKdtI6o+pR2fhhkIjNYTH8SmpLGE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=O+7EwhWdRELC2MaTg9d3LVsFhi/OosYcXtj8CjT4o1TxOTdRegmfw4W0SyL/+CGkl1dlzx9OHb3vCE2VC2a9HFXkhZV+BGKdu/WL9qyUhDaVC4esGkFyRhDl4TBoMvFME9W5nzXDR5wm1Vi3YDuJ5Pa2NjvPKNYpU6t7TEouGvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCS8DjRA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Otfvzw7k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63TCM3aJ2485258
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=118uGxkt14xVAFSp/1myEl
	ZrUnbYKTC4ie0A82Gcl5o=; b=hCS8DjRASIB8yzqFc09R19UgU9SH6Vmr7C5UQH
	Hf65h7oycDWH8AWI4HjQ7PxO7OG845tGXjsWxbih5RZWP1QBn8KFCOUoWEpYPSzo
	5cGwnbmtttA+D7AMSqv/fMC9bu2cBj3VhE62KTMEgdAHepzxrqQCJps7RSR3lBq9
	QPZAk1+mAPEFjexWE5TltHqAFU+fOYDs0PHuNZviQLPyub02f32k6+ooHBRjWqDJ
	KqseEfoIdbp5Eqjhu/2mCi9Y9ozOQdoypVIJKDmvZJDcIUMorARq5Y4TKK86mw6P
	XRaiwQMrJ/D+LkK+toM934WIf9XCZdHKoCvAp+a5WvVzghow==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duhx90nbn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 15:24:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35641c14663so14920266a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 08:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777476276; x=1778081076; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=118uGxkt14xVAFSp/1myElZrUnbYKTC4ie0A82Gcl5o=;
        b=Otfvzw7kmhh+6R1vqrviIvkjxVpQjoTXdxCmELpEGf0sqvW0nVECLo98/bDbqzuNac
         3/HBjHutVlk16tzNRYiL6gGnqRaTL4gv/jl+xOUzocCfsYTeK7K/buMSYLFvLx1l6hBt
         HSPX3SMf/qFHxl7UWb+/WWZBZsgbXP8+UnlXf1QdzM8gurvenc3IhthOhR1W84uyQ3fL
         W/smvMYXbai0CjnDezKK6iA0QAQR1SsagUaSxlQR5IZ1kEG2ityDHTkEJ7WxqDxE3O+f
         d6Ef0neRqVK/26CYEM7dpX4PF9/IciNzHS0dLE4BwA63Z+CYoHXThQYE5Gs5IA3QYIPe
         OH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777476276; x=1778081076;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=118uGxkt14xVAFSp/1myElZrUnbYKTC4ie0A82Gcl5o=;
        b=ai+KpSIaWDgVg+so8TuIx23crGPNRjCWPK94nQXg77+LWHt7xHQVlULSbNiEHcXK1w
         vPoPQXLuH3D97icqb0a27wGNXCOMkRpbpkuzKcQlVec8SQOBcfB+G+E4rjagMZQaySwx
         +OG11uDIxOrzZYfR2OpV52/FT/9eQuSO5onf7hHHaqNaQTKsUzLXeVB83ie8kW8Kkz5M
         M5M02+ZjkoJoqrnsvx7i0RehQQ2osXIABHXzBdRTyUC8pFNeVJ2Puj0V4d66QS1ad46p
         yhbOFTh22EXZ4bai3X/QqyI/kqkDzbrvoEQXyjNwsLpfrMXFW/Q2RD7zvUhNkCD/zdpH
         jdTQ==
X-Gm-Message-State: AOJu0YzjdQqiG0mGFsgwijybIWpIhnKX1e/Wp8yl61beBEm/lymVLofu
	T0ZfG+P24IOn0/cSF/f4/cJoVEcsKNjyuMhy6r7fmlvIpt1CGlxMXOip0RGvBPMHyYk/8mq30SO
	4uAJnD7nBkM9edIamttaolSPTJJlUSr+o2JUHbdM4yy+3eNtHXYT5HF3xL9yNZM2WSTo0zREaLV
	ay
X-Gm-Gg: AeBDieuB1Roafokge0eyurdCZXJCNIyMaD6quVRKFOf6YZe7Ry8eA0N7w3xOD9H2hAx
	UxV6liRVQAZoqobm/RN7Nn1vW+07CO26M7xXluSjXUKPZftaf3r9ZI+EaJy3EzTNbLvpQwdCWPf
	aBETOlCt46NBzG4LV7awytljLdpbgQ5nhR0k77b10vYzcYjkjuLLS76O2AsWE1xPJLFkc3SBRo0
	mS7DKFf2KQHAwwApAApMMGCD9eaEU9TNsH5tGIaeZbyaF7bUWOsAlyBotjKIFWIW7e2bwRX+Jd6
	77XcjysbXB+rz6HWYsKFt7ThJfuMN5f/uDfGUi9IueP9V32ORBZN5OqFhhPhASwmAVzrVWF9plN
	qPMXRIVpXzsEGyBRl91nd9A0KBIwZVe0PhL3qM0G1wBIlB9wUwBwaqq9tX1P4/nksgo2ofSbl5U
	sgqcShalN+2nXcW1ABe800W7K2fvABesr+hhSYE0vdv7vI6RaaAWVjfqX8yey23Fhj3A0=
X-Received: by 2002:a17:90b:3e88:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-36491fbf185mr8336417a91.6.1777476275849;
        Wed, 29 Apr 2026 08:24:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3e88:b0:35e:3103:d4d8 with SMTP id 98e67ed59e1d1-36491fbf185mr8336375a91.6.1777476275209;
        Wed, 29 Apr 2026 08:24:35 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bd588ad5sm66732a91.3.2026.04.29.08.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 08:24:33 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/4] Add minimal boot support for Qualcomm IPQ9650 SoC
Date: Wed, 29 Apr 2026 20:54:21 +0530
Message-Id: <20260429-ipq9650_boot_to_shell-v2-0-9b0dc3d1f3a8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKUi8mkC/3WPzW6DMBCEXwX5XEf+wSZw6ntUEVqbpbiCONgGJ
 Yp49xpStadeVjvS7HyzTxIxOIykKZ4k4Oqi89csxFtB7ADXT6Suy5oIJjSTklF3m2utWGu8T23
 ybRxwHClXNRNVp8qztSTf3gL27n7kflxeOi7mC23aw34cAeclA9PL9sfL+IMm9C8tjdNEBXCLU
 Ore1rxZ+Z5iICK1fppcagrU2IOxDHoLTORdaAkGlJS9VF3NOK/AiLMke6PBxeTD43g8Z+0FDmr
 J1T8/rpwyamSFprQSeMfffYyneYFxL3DKg1y2bfsGxPiNiFMBAAA=
X-Change-ID: 20260330-ipq9650_boot_to_shell-159027d548cc
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777476269; l=2587;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=h51VaY30oVcgyb7vKdtI6o+pR2fhhkIjNYTH8SmpLGE=;
 b=2hG2KNlQlYc43LOvAu+LsUXlN8aSGKMmZnVCRA86UUf/9x6yN0vWxB55QvPmHtVml2Ke8H10G
 +gVBIbNdvudCoqFgEp4/VSUvZNRqq8u9U3iGlM7Oqi8HPy+iSM3p/1O
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDE1NSBTYWx0ZWRfX9+AYd2P/AZYR
 dg9GQ4nxVl8TvzaqICHiwTUJGmKC3IcCtbmRlVsYPCjmwJllvfKhZL/aixTtLNGDXVrbdlzyjsB
 5vtrHBt1eD9QbC9Z6NbV2wtzTiIqVTtaXzysvVBA7SRBj08oNVELqKfRqjaP3qERQAMqaXWlHbv
 69iM4p7wSj/ZbeHUbFxcPJLS9DVssbpxB+XHOSoSoBeqnHbSbEhgqyCHmLtRANYbbGUamC0Fc8a
 IflUraFb9B8QCyVxFdYDYTbxK5qxef02c6D17TJERuow0L6CKghSA461O16d10BWHAie6d8VAn1
 VK3cbY0vdGYDP9rwhtctAw4qR42ZmnD3Oc0h/FtH1j7vxLHwSu+ObDQZCmGk4zvJv2nD0wdYKaK
 45Yp6poPuQviIbmSAj2lG/j/JJ4Xeko8x31BepjKXJme5vjR3xkh7BWeR46rklOkAPqxYJJKRA/
 +W0SK3bTH8Uu3UQwudQ==
X-Proofpoint-ORIG-GUID: b3PpGRlX0Sx5EXN-DEAYPFDWxPbydwfN
X-Authority-Analysis: v=2.4 cv=O5oJeh9W c=1 sm=1 tr=0 ts=69f222b5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=YURS4O9UCPS1-Wi1IM0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: b3PpGRlX0Sx5EXN-DEAYPFDWxPbydwfN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-29_01,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604290155
X-Rspamd-Queue-Id: 10C7A496EEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105242-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:email,qualcomm.com:dkim,qualcomm.com:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm IPQ9650 is a networking SoC targeted at routers, gateways, and
access points. This change adds minimal support required to boot the
IPQ9650 RDP488 board.

Compared to earlier IPQ SoCs, IPQ9650 features a heterogeneous CPU
configuration with four Cortex-A55 cores and one Cortex-A78 core, a
2 MB shared L3 cache, SMMU support, IPCC, five PCIe Gen3 controllers,
an integrated CDSP for task offloading, enhanced PPE capabilities,
and DDR5 memory support.

More information can be found at the product page:
https://docs.qualcomm.com/doc/87-96766-1/87-96766-1_REV_AA_Qualcomm_Dragonwing_NPro_A8_Elite_Platform_Product_Brief.pdf

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
- Collected the R-b tags
- Add the ARM64 dependency to the GCC driver and enable it by default to
  align with Krzysztof's effort to cleanup the defconfig
- Updated the GICv3 interrupt-cells to 4 and added the ppi-partitions
  and hooked up with the PMU instances.
- Made the labels to lower case and kept the \n before status property
- Dropped the defconfig patch
- Link to v1: https://patch.msgid.link/20260415-ipq9650_boot_to_shell-v1-0-b37eb4c3a1d1@oss.qualcomm.com

---
Kathiravan Thirumoorthy (4):
      dt-bindings: clock: add Qualcomm IPQ9650 GCC
      clk: qcom: add Global Clock controller (GCC) driver for IPQ9650 SoC
      dt-bindings: qcom: add IPQ9650 boards
      arm64: dts: qcom: add IPQ9650 SoC and rdp488 board support

 Documentation/devicetree/bindings/arm/qcom.yaml    |    5 +
 .../bindings/clock/qcom,ipq9650-gcc.yaml           |   68 +
 arch/arm64/boot/dts/qcom/Makefile                  |    1 +
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        |   79 +
 arch/arm64/boot/dts/qcom/ipq9650.dtsi              |  376 ++
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/gcc-ipq9650.c                     | 3795 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,ipq9650-gcc.h       |  190 +
 include/dt-bindings/reset/qcom,ipq9650-gcc.h       |  228 ++
 10 files changed, 4753 insertions(+)
---
base-commit: e6efabc0afca02efa263aba533f35d90117ab283
change-id: 20260330-ipq9650_boot_to_shell-159027d548cc
prerequisite-change-id: 20260326-ipq9650_tlmm-2a1cea46fc91:v1
prerequisite-patch-id: 13d4c96c03378602b50fa7a976e57f97f960b018
prerequisite-patch-id: fcc2de8f1b615b06fe2e509bdcb1ffd719274dc6

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>


