Return-Path: <linux-arm-msm+bounces-109855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yNp2OwK0FWpCYQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:53:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 686D45D8052
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA3DD3178A29
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A58D1405C3A;
	Tue, 26 May 2026 14:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qayyh9Sn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dLSOck1V"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240DE40587A
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806562; cv=none; b=l2ajy+1BFkYshnEjpwMtMev6gI9wzAvTGDOEMNIwhZTBHeX37NYRyQ6+WHvtWgA35TKhnyMCE2rV3wOAuPQNYINFIH8UgB6mFVB1a7ncuJyAnQWW6Axxuip79d2XdXXl1NWmPgE61ta5IvFu8r+bjOfimKBSE2xfrreZPJ8lG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806562; c=relaxed/simple;
	bh=b9Rdi+IfVGJGVd0iCHEmLl2F9yeoA7YYGwM/7TZc/sc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRe+sbIHcgPYwPxf8TtssI75KOxg4AJamlNgXq5lHmKz3RwAtnNzwZhlEPOSg49YqvXuQDGU8d1156IbI31leI4uWmQqfFMvi8bK9OCfm0yaO9cZONaFY6hGy+zgh+urfGip03UV1QxSnpXa1wjZOetSvKy0tRg/iwdvt4gh/vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qayyh9Sn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dLSOck1V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QDhrqV2528461
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=; b=Qayyh9SnNbcVlqD4
	48hf350bK8RsqsDr4NQ0GNVo/s7hSkJZalrF35arJTah0tBe2W7pLXHpZkfQ2875
	LBBhAwETUVZ3b7bAcKC4mRRDSJx6jJ1LTEaFQtxzA+XUll8FglUHiQGONllLVYSm
	gG+j+NhEuqa7KdeQdz+sQx/CuURgX+nSWSFnrnqi3wi9kH/Rg+XE8fWBGr3B1Uyc
	TfRCGam9YacO9G+/kbwHIJPt3hSmnhLIOYQISqbiT6NcHeAQSd4X1oLDWBVVoyQT
	5PzYpYw/uJjSejAYzDgFH4lOtZjLanZpFq5WD6Zrto6n5wkI4maKSW2d5iZZ4Ni9
	eJp8Gg==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edcnnr8ny-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82ba4715b6so11491514a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806559; x=1780411359; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=dLSOck1VJqwWn7QVo2s7VK6jMu73i6mkieh/kVlCBIhqtNQ2glgkim6vQhusRET0rl
         +DcVIIfMGQr9KwmypE94lArZRsIVsWKwIHATy5AzyOu3LksaS0ZGrFEeGA1IhFHSNoPs
         RS73n0ITiJKmYAFPMDSY7wkw3wIztAOlTEYSOkqeRgv8TroZd6AXJjyX0z9tfL764IEF
         FH7D+EOXR/SvGjx+fcg0V7u7bI+p6QJ6LhUdwWln7swAq651ALneb7RgFT45VQ91/0g0
         JZnXl2Pvb78CZ3U7JSL6Cq2Pv2oJU0raxnva156uY9YHZl+yIl3tfyluq90/2I4ve6bQ
         MQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806559; x=1780411359;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QU6H474a0YDo59Ajjy8caYGbQkw3XHZEy73rL2NPd8U=;
        b=SXhvEEELTRXYxlayVD7W21O2CCIRc3VHXU+lkUDtEAtrwtburAIQbXXHqUSCY66DIc
         CnVdhj+zXZUYdBqpWz80TWmFTTH/pWSaXgph6ELHs5Kg7uyH5d+gBqEfTNzOzPW96wV9
         uX1KvSuPKpcJLFKPodJ0nirpI/1GujgQKRHGXyRCTr8ZpfBqP+IkOl5IVAULzFP2SQdo
         Hp6VcWK++XcJNJ0UtZQT5NTNjb1qnA+RQvCsUumRIhkom2Nw319gEYgFxwexYJzUMdHx
         kUpyZZQoFL67c6sUeJ5bBc/FEVtu5fNEo5rZVq8RZxZySH8D0KDuXcNzaoGH/oQAZl4l
         JM0w==
X-Forwarded-Encrypted: i=1; AFNElJ+SUfZswzyD565KjnrGBrHY4S4p13SJwXq28GmsrKOLBAIr7/Zgd5zRBlPdlQ3LqXmt3X35gvjMTeVfaLD/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4yAw+0EQwvNeGdCWdXffvZRWI4pe5c48nhxCevanKH82msaOF
	bkODf2UQpyiMQ7h9kV/tEsNSl+nLj1vLFG1U2PxDZkyhPRhfA7CbBhRUaVk+zK3sRiLh7qw7d3p
	agixEsEJgL4wr5iGaPQhfErh1p14dKxcLk4f2L3yMdJzdI7R6UKuFSUUe1puehdrDjv65
X-Gm-Gg: Acq92OFUPeCye/P918HkIUpUNk9r1ki5+cQJcgNtB9XzEphTHlBsD2nVUZLHMsvV0QA
	e+b8xbqmEO+LsbnMrq+3CUpdFx258CKUt6H6iHFklABxC2swRN0FWdbV2jN/OAjq1k3ll7g3L/m
	AUH9G0RFUMk3shMpybCilaB2axG11blQlPWeM4CTfpR2JpTaU7DSdrf4XjYzFc5kkM0laRLHiSP
	EA/OGyWgwU7Vlj+PGH0DQHM2IhDMXe8N7CjiO+5AKIiZEECS3MMShEgdOlQdSXSo/7ARJhqvoAi
	IPGtrskUn0mJilWw6lqzkFVhAtH8/0OXyuqCzUNCO1A66b2kHE3UOtUfmtOzp8BpxAS5o1O9B49
	vX5T9VzlFSgc3LaSvNQWTO/z0zvuxU+CbTHnxcwOZp+DSXKQtRj+8
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730392b3a.32.1779806559095;
        Tue, 26 May 2026 07:42:39 -0700 (PDT)
X-Received: by 2002:aa7:9a85:0:b0:82f:2243:e445 with SMTP id d2e1a72fcca58-8415f301995mr17730340b3a.32.1779806558448;
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:38 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:07 +0530
Subject: [PATCH v2 6/6] arm64: dts: qcom: talos: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-6-2a6d8ca30d63@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1048;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=b9Rdi+IfVGJGVd0iCHEmLl2F9yeoA7YYGwM/7TZc/sc=;
 b=fsVa27Uyywz9GSHvUf8xB88UX1ed1IqGjTVwOaAancFT19+AlIGoYxRrcONbOk+rVEKKqPWBt
 6fOQgHbCzBjBJxlRuYKC/eAdYk7fc38gv1W36Pb5JsyTAc5NJjajy43
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-GUID: t4YF3y7HdOMhxfIov05krrFTnyH_4qOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX1sF0NWwK5Uzt
 DpfK9Yo0Htfox+rY8fbOPlMBsNmSWD5p5jUiUpWan5RpEcrzPHG7hVduGofh8OSwuJkkKxzsw3I
 lR+EAPJmnlm4Xn00vGkOIu6xmgsg8GtWV+aZjYihi8ZLFV53dcXNjmbeYD8lyxaJPTgFxftFE9M
 /JpQawpHp4Jq/5yQjKjr2dq9MHhgiZH6X8XWWCnpCkS15kFwPv7a76lkkJi1bGwJdGUs3E8xG4H
 FABS1l/mrK542HdXA/1sTeyA0EOiE1FTIbeMbgMeCobIebJU1aVL7lwnfBu7BKAUBgNpHm8+iFf
 mkFGDFOu5Dq0zmm3Qd/qxKyJB2xkHpDWi3/sCFFBwcqS6crBv3MPbNiHeldTqfhgrydPw0M2gZi
 HBvh1LPkkFdXUptipkE0hEAMYH1AcylbYgM23B4wTlTPG8jxynO5PoaN8X91b/4rll54/wnhmSN
 xeM5akeofkPCJ2qKsfw==
X-Authority-Analysis: v=2.4 cv=VPHtWdPX c=1 sm=1 tr=0 ts=6a15b160 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=55tFDwK73Rs-p4iooc0A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: t4YF3y7HdOMhxfIov05krrFTnyH_4qOo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109855-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bibek.patro@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 686D45D8052
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Talos platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index fb1bbc51bb8a45832568da26847312e00cae722a..74322507f4e8c796bf9529a9f0adcafbd725ac73 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2090,6 +2090,8 @@ adreno_smmu: iommu@50a0000 {
 				      "iface";
 			power-domains = <&gpucc CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		stm@6002000 {

-- 
2.34.1


