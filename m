Return-Path: <linux-arm-msm+bounces-90743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFPcH9yleGnVrgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:47:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D718293D9F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 12:47:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D34B305A6DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 11:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D85347BA5;
	Tue, 27 Jan 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gPMK3E0w";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9kupuDl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04CE34A3D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769514277; cv=none; b=skmsnA0VyLOnnOKcsV7VPuuxBw4W6mZiSsLGC/nMELTNwdBlNRYx/QvbfYH60dZOcyxSKE+td7one/bXPL3K4XiMvwYoIEpi6fc90+u4E080fgW2KpByumgduG0fN0YU5LqDrSQk8sLH5Njlv32DVUpB7+aVsDFtKu0De5OGWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769514277; c=relaxed/simple;
	bh=EG/h0NKEtW9o2PEPM2VksLqQusR11nWGJdHCLIV4svI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+2iPu4FF/P8rLzjrcfGi5cVOkoOo1a+wkn9egWBkacnG7DK+IuR506b66Qr/31In2UF+/cZfUJiiiKtV6Mtp5ythBZBzu2ltB0WSl1VttA27LaMxL2kVouwNYQAbqfmKBAsE54M5MZSYujurmpwZY9tdU24LBE/jevDMa2u2hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gPMK3E0w; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9kupuDl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R86n8o620693
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvfNSeiLLPWF6jua0MIMCVKk76jIDvFdIJSgrqD1rcE=; b=gPMK3E0wF+BMb3E3
	naFf6pfn2OXrLBGAh7diNSE/CWdmZHdYC0+57ZGALS74EYlbpRiyMi66Zk7qisS5
	V7TWdXO0prd2f3RVoyNIMZBkiP3T/dSI7H6z84v6GmFkLcG+0xfXYPbb58/XARFD
	424mv1t/6DbAaq9F4CDm3zRyXBfEbVbqqtjY6l5DaNDG5aKuPyqjLeQI/xjkE1P7
	XEvyEajGCKKzxG2cqxdQ6yuVdf9PBkcoCZU51w+8smjgrpqy4HkCe7x47GgQGzrc
	9ZpK1Bmc0nItt4X4NhFahpN7LN1+10+tasp29VaEinpmH4NVQh6EsoAOuFYc4U1W
	+h0Vkg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjegpnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 11:44:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso5318793a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 03:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769514266; x=1770119066; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kvfNSeiLLPWF6jua0MIMCVKk76jIDvFdIJSgrqD1rcE=;
        b=P9kupuDlhGJOLcw2MwrMPWbe5YkfmRPO4EffwXb6i8Obt71yZu0iRkDTs4Etu0LaoA
         Nqv+gcZnV1AuZipVRn6FVXv7Fo4EQBzKoAEiKsziaJEKTCzO9+AbhoNE2YpockAr2o0w
         vgN8yCNX3pauyJ0jZRrMLFI8/2jNKJcuBy+jjcHqhsswaFAySTDcOdVL+V08+xnzFlGI
         +fs2Iuv7AvlbRm1BTBEx/IHXpXLxg9bllouarSlt7MNAd4dKBJJ6bKSZl7wGSkA35d9U
         qtk7uk3dhv8cAOcbmzPrke7NiTER+HuxHYzSR7eIzJsY3YcVSfMoM/2lX3IEUXtWk0rg
         XpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769514266; x=1770119066;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kvfNSeiLLPWF6jua0MIMCVKk76jIDvFdIJSgrqD1rcE=;
        b=u39RdNer/oDK56DNFX/P+jmY26UajmOK9d99O87MDfiuLjCdUTF8fG5NVUvGHcDxoc
         e54njoYRVLzinivvvDchs/VfdeILJ6PxkS0mbHuaEnFxPCvZKQW5tlvkvNAzJgTBNbY0
         aIkTWu4NbE2qlxCQ1iCx+G1veQAiHN20O68bkAYqivm0+Uve8D7Butgxwugz7aUrAXLU
         BlY470cejf8mf2JWz0PAZFeKHt+6ZAZK6kmeXLQ3WWMzIQ7AyICZcmMxt/UAJfP0fMSq
         +HeqQybQnxC95ObQHrIosYyOnq5gq+hKp1JK6r7X+gKLQiS+lmMrzhHmbXEhTGrb8V0Y
         nZFQ==
X-Gm-Message-State: AOJu0YxoCmjU1la8VvKrEcze9jbFBgmSyspsrmfOptMvKSme2X/ljAay
	WbwRs+lAcNqQIeulWQzpkBaJgPSYyBu2TAfQ4VP9VySvybP2eSk7ylHQlNdzV9XmBel5/Kh8G52
	WYdgX3fgAEgxjXNjnpci4oRruTdhU4pimhMdugRaHU6rmhnLwdyep4LNVaqcIb696l/gj
X-Gm-Gg: AZuq6aJeos5ujznzjmHBLwud0kBWCPo+u3aX5R12q6jrSnKL0ER+mrzH9SV9nvlvapH
	mrhqSwc7ITvS1k/lzWrZPUbGYhXU02zreOKOQuEJSCOFXubjRRbil+KxQUjEhjux8M2qUDjndL/
	P9/RKQHOXdQ2AakqZp4Id91zG/o+5fHsEM7pSrIKwLVbMpmfSUCG/gDLBkIeAYImlj2eTGQNB1m
	fPwb+13QSoHzKrU3wELXd8jfnzj12bgKB8ntcXbE8Yn7dwiW8GaW8gyAc3pmSW4VGKyfrBnUP0W
	sGGj4wJweBuwZ4gRRgY5VwBT5dXuUEzE+vxjmMKtSyblllFM/+vBuNdvPnKNEEenqz27RXLijlE
	30E4bey6xnwIJwM6Rrs6whQPlgwkqhK6VKnq6
X-Received: by 2002:a17:90a:e705:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-353ff8b3d60mr1194801a91.3.1769514265334;
        Tue, 27 Jan 2026 03:44:25 -0800 (PST)
X-Received: by 2002:a17:90a:e705:b0:34c:2f01:2262 with SMTP id 98e67ed59e1d1-353ff8b3d60mr1194774a91.3.1769514264766;
        Tue, 27 Jan 2026 03:44:24 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6230d5dsm2392301a91.17.2026.01.27.03.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 03:44:24 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:13:50 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: talos: Add EL2 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-talos-el2-overlay-v2-3-b6a2266532c4@oss.qualcomm.com>
References: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
In-Reply-To: <20260127-talos-el2-overlay-v2-0-b6a2266532c4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769514252; l=2352;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=EG/h0NKEtW9o2PEPM2VksLqQusR11nWGJdHCLIV4svI=;
 b=s4zMFY60940scorzTLpqTZ+730OFunSflNfKLuK6e54XCkUbdPsfZ55xuhVkk2co1/nq2Nx61
 hLUiQnZXB9+BTdZlTai2mEY2hrCOF4WIPMtyAc+D5OUkVLY0/4jrlIT
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5NiBTYWx0ZWRfX4Db5vfjxxX9k
 ai8nRE1Vlqx//2JTrWSht3YSx+3MIBcDN7GDHdjqeaQ8BEYIlcDNQNRd8HVmnheWG8IaiFPSyij
 GsGI91NAzNxrbH+KNbc8J5FCy9rcH4thWSXWqnL+m8+xbWIsNO2pilHv3pzXtxw0gABSVFlYOMJ
 lPFPciirAZksV2vQPMiJEWJ0NowCeyx+GIX0KpfYZRLlUU17Nrer2F46R+ZUnwgHt4Di6sX8Uos
 TVRXZxun18BsTJ6N3reeGw8TfkrMJgd9eYwJ61tJ1WnGABGbbaNuG4EPcBwP/okO2QHdCl61G0D
 t9qjg0LeB+dquN3PafGD3M8xDydqqKwxyrjx6bBzaaWERGBRPZvqYrfYWiLTt7wEGEHFRmMFPwf
 ZUtlJs1qMpYJmoDorcqoqek54X9B2c5cPzu08Cu6Je0YXcesf/vTyNfxmceYid4733pr2XqELxW
 vcWCDErMaHreDr5UPfQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=6978a51a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0HEmIXWpzLlmP88VegAA:9
 a=QEXdDO2ut3YA:10 a=eSe6kog-UzkA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: qK2hTxkj-SeYFAMx5G6vxR9z2ofYchvy
X-Proofpoint-GUID: qK2hTxkj-SeYFAMx5G6vxR9z2ofYchvy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270096
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:url,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90743-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D718293D9F
X-Rspamd-Action: no action

All the existing variants Talos boards are using Gunyah hypervisor
which means that, so far, Linux-based OS could only boot in EL1 on
those devices.  However, it is possible for us to boot Linux at EL2
on these devices [1].

When running under Gunyah, the remote processor firmware IOMMU streams
are controlled by Gunyah. However, without Gunyah, the IOMMU is managed
by the consumer of this DeviceTree. Therefore, describe the firmware
streams for each remote processor.

Add a EL2-specific DT overlay and apply it to Talos IOT variant
devices to create -el2.dtb for each of them alongside "normal" dtb.

[1]
https://docs.qualcomm.com/bundle/publicresource/topics/80-70020-4/boot-developer-touchpoints.html#uefi

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |  4 ++++
 arch/arm64/boot/dts/qcom/talos-el2.dtso | 25 +++++++++++++++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index cbf7d89e432c..48ecbea17a4e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -141,6 +141,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcm6490-shift-otter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride.dtb
+
+qcs615-ride-el2-dtbs := qcs615-ride.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs615-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-radxa-dragon-q6a.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/talos-el2.dtso b/arch/arm64/boot/dts/qcom/talos-el2.dtso
new file mode 100644
index 000000000000..f6818c058d72
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-el2.dtso
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+
+ * Talos specific modifications required to boot in EL2.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&gpu_zap_shader {
+	status = "disabled";
+};
+
+&remoteproc_adsp {
+	iommus = <&apps_smmu 0x1720 0x0>;
+};
+
+&remoteproc_cdsp {
+	iommus = <&apps_smmu 0x1080 0x0>;
+};
+
+&venus {
+	status = "disabled";
+};

-- 
2.50.1


