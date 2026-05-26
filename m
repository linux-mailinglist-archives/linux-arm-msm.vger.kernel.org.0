Return-Path: <linux-arm-msm+bounces-109854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FJKIdqzFWpxYAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109854-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:53:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A9E5D7FF0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 16:53:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F7B9300CE78
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 14:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD7F403E99;
	Tue, 26 May 2026 14:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="id8xhIpr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dq6YWTNP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AC23FFADB
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806559; cv=none; b=R5KfA4KgFxxgsQrrreqyYCEExWsuoiaxDKAbNzcq1F0yGFJ8TnL9fBxL3QrrPFlecJQ9h8f9D6cJtPFB9K81g9M6oTyfqmj8WHbTrvwE8qymuXbGruD7aqr9byhq9/BDTeMmZhghMvxsDVkmvOs4fN19ZcpM/c7okznK8R3OfIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806559; c=relaxed/simple;
	bh=lWkUuj08lvraeSSyxOex2Hdt1a0/ULuWaFXQJiE4zls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCpnFolCX6AQZn4dCibenJJrNdLh9at8g57dRQgqat1sTwLOlYOTarn2R11ymEw0FIY1GaJocCwqxpKBdPkgo6x04Ntp7bLw0Hn6g5zVccqhjiHFNha+fvfTo+mEsbEqRbuDPn2pjujvsHhMm93vWZFH8DhB/tTY1hbYSZS0H0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=id8xhIpr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dq6YWTNP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsUFP2385430
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=; b=id8xhIpr0lPQukpV
	WJswVOwAOr5F9LTpVLcbIs0I/1dzkuDWfSlWtyO4/Qdk6kuqsfe0KTji01h6fRpX
	aE0Up+qe1i943O7cQUG3TOE1hegqhm+dUtdJxz9x4mkr5t2z2he8DkYMOgOJ4E4d
	TPpcbPfd6FYs66V4tgZEHUmefs3BbVZVVX5J+gapLPVCeR8DmX5MssCXuWlOSPF5
	G0kG5taBkXVUvbcuX8PryRckr3rqp2VzOnSNJ4X4i2DhaVRNERJJk1zpiQB+6mss
	MeKeuRaz36WEpm4qawT6ZMaqiuVf+eZsKp0/RQ4pyLWbEyop1TKDvsvVQrdUsv/I
	GFhkXw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecnhs59bb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 14:42:35 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c82894155ceso13753634a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806554; x=1780411354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=Dq6YWTNPMJkCvnWGvKpM/x1cssrT7v58YuEZYG/r5zKOwnHM+J6OrpHXLpD3Nlzznd
         sjhK9dkJyf9Dk5fPmQQ3eekozejYUp2creiyf1Id/Wb8ABSEpQazJDoD0LdPXM1zIGmh
         Sq1C8ti5QYdhBlnQmMBOrdYFdw5dGd/RSxQXpiq3tmpJlM+8fS8xR2ReykyPDGWba86x
         2CEQ4j+z6pICHswH6SeY5QBTzQHochCXIfYTvWku300kbscJGb/YSo7Dzppyl6C5S//L
         m+pUAyZxBz+ZbQfuFW4g2AOyj9LpTrbpAGfGjR9RYv8RUqtZvLjaGMy8GovIX2N2WdMg
         2N+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806554; x=1780411354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oJ/lc59p7BwOjZy3Mym2EBtQ9PV9HmJ7odtYIVkNmW0=;
        b=YGJ+GSePZjhfgmudjHX+p66nOkcgGlw1m3DdAU9KWmzjBGWszKVetds8nQCwu5GsjW
         UP2QZPw4PDVCLzMFd5OrOW+CbxTAyHPI22nDYM4l98bSsdetLpPaLwY+21FORGFcO1dH
         TaJuucMznmR6A5jFHBmdfr0r6qVNxEqt1P6AzRLPpNktTcIKz0ZJ6GE4+Uf2OrDsxLsw
         1AD7b6jFeeZBN/Gx9C5fFLLLDmuUBd5RHuQS7yGNd8IlTCLFvlrBbqzLz6IiSgEMUnBT
         KORlQL+sMaMB+IERE8cNNiBryq/4hKBB10NfTmKiOzSRK6iX9m/JbE7W7a9q97iMM2Ux
         UVbQ==
X-Forwarded-Encrypted: i=1; AFNElJ/x+Htmwtabeyu7piOGbcp3baToeXiQcuZLncVlDVIYMl8PIp1SWpgqw9BQO1TuMt5k6ZUn1UjXLKq9+X66@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0k8LqxW8RkrDWiIb11N0PrQVqWyMz8FogbpBzpyn6oiefpqS
	ce9rdh9+8glBAWTFgxbIK2Sggd67N/YF0vfjycK/ui8ZzIyCXywBbJ34JoLghThN+BeuucHy4fe
	nzsQhMu86y4Y9Bdb/P9pNcT96bL7R8ctq+V6F0pIa05m+N7MRZ2LxeOPOHhShuKFmAR84
X-Gm-Gg: Acq92OH7mKHjPkl4dJjm7a+og7w0xvJLRjGq5GgXtlyVH6SoUWAUXKDVVdCcUIADC9u
	cOcb6HJSCqJuPlU19srGv0kCW9teTRLfIlFl3AsoLRvYaM8KUSgoHKUPAZYA0ucn0SxaE91NhQI
	5H0HSQd8UmQhOQu4jvbswY8/dsQkLOy1n16XO0n4O8WwzqaDrjMuk1vmtAOklCNJRV7j79k1K2e
	AtJWvU80YGkYDEKVZlYuLbf+jw485YhT9igumgoLyLxFgPD4f5eL1snRmn2xTkXkYddD99Y7iOr
	zD/Mkk83yVJzM+GNtrQ3nN/3CvGjwluUDKCXA9ocL5E01IQJ9QlI34wXlp+5ax0W6ipP16CN/90
	9ddCtrKbxr6EYEucnEXyRRI6zdkY2EPZzBPgQBlzBvHvAjnJ7qf2b
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443828b3a.10.1779806554410;
        Tue, 26 May 2026 07:42:34 -0700 (PDT)
X-Received: by 2002:a05:6a00:138b:b0:83f:9c6:9c with SMTP id d2e1a72fcca58-8415f11f645mr19443777b3a.10.1779806553947;
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:33 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:06 +0530
Subject: [PATCH v2 5/6] arm64: dts: qcom: monaco: Add GEM_NOC interconnect
 for adreno SMMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-5-2a6d8ca30d63@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=1074;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=lWkUuj08lvraeSSyxOex2Hdt1a0/ULuWaFXQJiE4zls=;
 b=mIdUsT0ginPBt0NEy5rr52A+F4ILAPui5UJEns91Xrujoak/KyGU2jmd3zW303drZHEnRi6ae
 ReKZYHSyJHRBGAYXCc6RUDVjmkYlFt0lVyd7y87izB/po3f0Nt9KRjj
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Authority-Analysis: v=2.4 cv=Vd3H+lp9 c=1 sm=1 tr=0 ts=6a15b15b cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=EzTgQT2ADBj4VUy-sZYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: RKii2t7YQeElXkZyhWECK9BU8TwMeKnS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX3WHVCH5YlJZy
 B6wmNmBuhiUgb019skDwS3xQsY3GYGDh8s/vuE5BlQsBk6AM7CEs/PtLLU2Rs1a96uj88vHGwiX
 GXoA+LHvhmkvDsDpj9UQdaQF5jl7nu0i959ep6YOJMQr0Hl2DnWqu2B2QgNTauZEeocVfS1WPsr
 AZpya4bDFE5UB+88R2nQO3V0MM+h4Csh3UvHlOL14uj6GNVnjrqSpoGY0nN4FK3qDNorTPwNtvf
 leljP6X6Ggej1+aqB86eqULen2zqPjUJKqKPuAsEsAlloEvt8ni9tQsdmlS3lOwSJLGWN7AwIUu
 ybh2ip5kJTSPhqedifWTmjrqYNFpvwtV/ey0uSCfPc3xWiU1OPIbsN5xLToQjQMlZSwjjduQOwy
 151Afzpl5qgla1zLfIF40T7ZgCtXU3qTo6y7E4Cbg9lqWF6zCTqybgXLdWm+7+X0ngSf+lWbTOY
 he32DmM8HLeZT6AO0MA==
X-Proofpoint-ORIG-GUID: RKii2t7YQeElXkZyhWECK9BU8TwMeKnS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 priorityscore=1501 bulkscore=0
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
	TAGGED_FROM(0.00)[bounces-109854-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: E1A9E5D7FF0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Monaco platforms, the Adreno SMMU requires a bandwidth vote on
the GEM_NOC path (MASTER_GPU_TCU -> SLAVE_EBI1) before its registers
are accessible. Without this vote, the SMMU may become unreachable,
leading to intermittent probe failures and runtime issues.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 2660c161c3d74f4002aebff40634509e885fb3b3..00183ed67ebf0645e1da0c4674248354fa2af941 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5088,6 +5088,8 @@ adreno_smmu: iommu@3da0000 {
 				      "gpu_cc_hub_aon_clk";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		pmu@9091000 {

-- 
2.34.1


