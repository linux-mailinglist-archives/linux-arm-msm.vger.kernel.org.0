Return-Path: <linux-arm-msm+bounces-109853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFg/BwCzFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109853-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:49:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C87E5D7E71
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8670730CE00E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253A2402BA7;
	Tue, 26 May 2026 14:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3DrVQ8k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cUT+wx49"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15A33FF8B9
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806553; cv=none; b=nrT+3+gXw0zyK0q2IrScVsZrK91thRQKOIvUvpwM9qM5O7e4Ke4Iebx4Fg+bgzcZ7l3NTc81DOr0H8y2kssfvO0AtG/kXAlvFnsvFu+aUiS6gEq+RLAP8uy6hsgIHrMgfetNxiIc2N66rPc/7wssTxMwsf0goKvnwZXnIv0mvEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806553; c=relaxed/simple;
	bh=7CPjDV3gT347BVwRIdRiO+KfIxW2/766GVcN3yxQ6iA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RDx+4OF+7BVDIGg65pyF8kkuAu3C0k+hHNMYnE3SfJbPXh5a27rHvWgGzEgZgaYcskshycAmTxJSHlib3opXLAOUvCDIaVsQ1AyuQUWEPjPA+OSI0oJepdCrbI+YUEC1FqSkiWdJ49hPD42jOGDSFg+hnd60jTfBEUJp8HT5wQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3DrVQ8k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cUT+wx49; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QEYCIG4030425
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=; b=d3DrVQ8kibecECdq
	5e8AI8zdo2z49Yhp3ixD41bW5GK89MCHb7kbrptCsrcIp+1YpGJ0Gs0+7DvYhrEw
	Hl7KSKUlnqf1HnMNcmHEpOnowuvc335bffuhItaxn117uNjFupmtrNeuvLiUcB+M
	wk/TETWCa0Mg/mkZEpM0qaD4yhukAdCx59cfIRSsRpeVE//c42S2ZhzWN6Jv98AO
	gJRd7VkcbJcmJtsqwo2fLaR1awMJODS8CXXyRQKqJ4pHxLsqPPU57GwvOYSXWl+O
	HC74Pl69Zil8WBBaRFLYiIDTzV0XqJ7+hf3IlZi4Rjc3C4ggxG80mL9Nz6EFtIG8
	9VNiGw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eddd7r1ad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:30 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso6315382b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806550; x=1780411350; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=cUT+wx49i0C2x61P0i6ICZwWyM+2mpzDWQevXjpGvFegF5SzrF2mxwgVBZMUb9ybPc
         vKWnAy50oWMlWN9+6DzLu7Lm8dlvFdkF+0PjR/q0bxwTS+pvuexD/fdomGhNx9ybPN03
         6XvnfbhzFLPLPwHAuFMgM49Z/DWwnWuyehLRnBKNhJcaYGZBD4C3QGsmvTfujXT1MKZx
         gE/5Ai4wYitFfI/T3WClx3yUObmoG9+sn9C5NqEHqolCuUfgjBYBHssPTfeNNO2qRGIZ
         oYUkJUmjzSjpMOp4tHy935swt98SeL5ghsl40BkJr7ZiSvuW6uO4PF4ghBVXvnBLhbbt
         EQYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806550; x=1780411350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dYBJoUSY2tXC4JkVJCKKmh/DGRM73qQJsyU7sSPqj0k=;
        b=ruLUKoivs6kkFv8E7fJqJQKMqvyvGOp2HUFBLo4DJexroe0LNn+bJMJhnNUislnyHr
         yyW8UegiN8ZHaZGG63ImqSTg09iJOPSDxLtIzitH1vVhvQKO2UE8hroNx7yYe+FkGxwu
         22IDtPj/ZeuId+GGFQLc5G9Rv0ynTd+QkA0ETa7x6Uj6Kwo8lFv+5hcA1I80tZSbx5Wh
         fvbgFxVly3mdv49PK1/kvihUwEJZuHuvPpuYCM24Wppd5lknUBk/FIedx1Tac+MPVMUF
         SR8uWsp1V5fUwh2yDNKU5AFDV/GuSrxXGDt8QYsJG1w0O9FckBlkWiRQMPdaXyhq6hUk
         XxHA==
X-Forwarded-Encrypted: i=1; AFNElJ84JLV8hBXMC17WTktl+OhRkHUJQuCnwZ5MyL2gHTHXj6Vb3yiYNmBWnYhWiq+JgQHTHJTFQOo6fmMIRnU7@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2aKWTlqx/87hCLnerF1Y+ltmhz0Ra8iFYSIwWDBVZyn06Hogh
	DG4BL05TWJHwmlr+otqMaaXg0TIz+j2B1IATqK6z5KuddXVVkBDX1JAxwzzuFsZwE2jlIyXA9cv
	8jnNO+qa8OcMpHAdDRnmrB7xsWWI5wIt7cOHeBSOC0DLPk30Qh4oNnVDqRuqHp1WRoXVC
X-Gm-Gg: Acq92OGY7ol6OtX0/DFPR5Pu6pRFV8cH/H8a9/GX6ih56oxbhRlSov7bXoEPfNn4v7G
	CH6J3mvDEpt4wElyuaNPu+a+WamR+cVPEsZ3V9VplqzGZAculZihldMe2xwpFPyuO+16248hTzi
	0W7ijOIiuAT9kO45jXfx6egN5S91hakYG+nFCfaWKJoUkoEf80lfvGL8SkDNUt59nAAtJskJPI7
	jSixZHEp5EjZkFS28vDkfLw3jvfRjBBEMx19MIvUwhBEXz4AtJ/u76LnZ85CoATPMSTDUqd41Jf
	rRBIbqDcLHHlAtpCga518CQZmXM5Hkb+JR0MTb8TAzSTOlwbRWYKOP/iWdPQRv42xtvNakapFBc
	wkYcmsFBDng/qKyk1lVyi2+4cww04m7U9Ac9pOM5Z6UyWAuMx8sHW
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699459b3a.15.1779806549975;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:b486:b0:82c:24d5:63e6 with SMTP id d2e1a72fcca58-8415f158b74mr16699430b3a.15.1779806549485;
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:29 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:05 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: lemans: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-4-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1122;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=7CPjDV3gT347BVwRIdRiO+KfIxW2/766GVcN3yxQ6iA=;
 b=A/MmI4Ssrmi7OC54VaSN6M7oYxKCp7bADQdsPSx5UgsPBDQc5G12sWOGN7601WKlO+UYo08og
 Ad8Nd/5nmSyDIpYtetjAHcaFmeiSUGJK2WBXQkcB8NlOSmxjTTSqPgT
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNSBTYWx0ZWRfX2hx52Bn25d4b
 Bt7RT1v/Krf19ZKfeVXyhQs4HkyZYp9l4VdCHNp2xWpyhbtZ6f12iCBfWKeU0M5hij4qQCFcKTQ
 VtYAFKD9tzzSt4jbFFgvue8kjXQNiXCSBP8cvglMGvElwxPUgLs7NZ7hnH/dgurAq25uW4xAWvt
 ejmVcW+SmtMRtfUhXV2JFeDn67TXi8G4wJoBIWRF8jRyLZsUwCt/IZVTsz7AtDNM4eS2+anUHa/
 Ycc7/HLkRfbH507d+QzFUTCVn3a14JknoQK7f4bNDfWC54OUSL5HArq2wz/mimi6XLu5/V3tTsT
 ecInvnvsvNOw+AnM6CbXTlS9XAh8n+G+U/HV8K6JgSYzesHRd67dpNqPGFy53Z1nuGwByTMveoY
 vC6e+GR/UfsTuS3MUt3SYK5mVLU8XYLi3Yj40uPNol4BHpxONSQBXmV0F+5TyEPW6In9dJ1ozYR
 GqkPkQY1TQj1GWuJ3Ew==
X-Proofpoint-GUID: YQ2KzyDKDYQKFU0y2xfyUm-kF5WtRS2-
X-Authority-Analysis: v=2.4 cv=fKsJG5ae c=1 sm=1 tr=0 ts=6a15b156 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=JCeWlrImN8qIMoXkfH0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: YQ2KzyDKDYQKFU0y2xfyUm-kF5WtRS2-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260125
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109853-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,3da0000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.135.209.136:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6C87E5D7E71
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Lemans platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 522ba43836a2425a8612506f5f7113f291f34706..ac9f529d2719105609d997874a6319c7d04e1655 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4796,6 +4796,8 @@ adreno_smmu: iommu@3da0000 {
 				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		serdes0: phy@8901000 {

-- 
2.34.1


