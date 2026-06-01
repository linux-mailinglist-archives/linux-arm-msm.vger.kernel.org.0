Return-Path: <linux-arm-msm+bounces-110596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJQYD6SCHWqTbQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110596-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:01:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6F61FB8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 01 Jun 2026 15:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA30F30852B7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jun 2026 12:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D5D37FF48;
	Mon,  1 Jun 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C9w8nmJn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U2D+1std"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E1F39E194
	for <linux-arm-msm@vger.kernel.org>; Mon,  1 Jun 2026 12:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318558; cv=none; b=m6p4HcqKA4NtIPRuh2/9TNahTu7FsKZJEVA+TEWldDtGa0vpn/5luXhBdz2SMi8FH6rMttY26EH3js47GtTMppMSz99LL/+Nmodhpc5uN6kOb7QS/9uJHqEucRwPjUfRJEU1a8ikqzVLe5nVseTh9AjGVC9laNg4SyGefSZbAvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318558; c=relaxed/simple;
	bh=Y9Enl0Zph26PkTk+LomlG38/z42iBDvGRg5nU5WG7PA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HmED0lyGJPLsf5z52O/zUda65jFp7ZUt1QQ045Sr03quf6+p7R5kUENtTQungKUrXvW/OOzoMm/KHP9Qu4gS0MJkt8PVbdsploVvtWL6s2FGJUDaLUi11Hl8uEZzzH1ZnNNv0GfhBptRc0kkTW1TOhtd4ODS/UGefe0e0DJlgag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C9w8nmJn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U2D+1std; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fQsj1258152
	for <linux-arm-msm@vger.kernel.org>; Mon, 1 Jun 2026 12:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GxUOUnFMum3tGcWpetlvrIGoT2OHDlQe08hnJpSqFJQ=; b=C9w8nmJnAdQrcKo2
	cntyEEuj9hbkhktUUmjxZpwmHhbV8Ep6lXH6VfZd8s+qenqfr5P9cgr4WoBtAc5W
	Luv1FYYhZqruqTD/MzB8hXgsb3Utxh+HLN6JMSd6K3sKLaWEqiE9G8ZGSV/pURRb
	MtaUeSWkeSenbQbmYCnO0TLCAZ1SczlTa5o0SfZojb4cE8lOvmUlJlF3uTFc73TJ
	xb6kgzDv/fxNktHcvbGiiAp5U/RNtTdH8OqWX1DnS3S7dUw4IB1oqQt9zneQXM8A
	VhcPxNQ1f0IeZPQoyeB4JkBJBJu4tm0hxtsDipwiIyslt8yQLVesejwzcgtF/oC6
	pd0zNw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6sss0tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 12:55:57 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2befec3fd8fso30901505ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 05:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780318556; x=1780923356; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GxUOUnFMum3tGcWpetlvrIGoT2OHDlQe08hnJpSqFJQ=;
        b=U2D+1std9pue5/A73jXqrKmG1VNjXqpd6A6nsUthwCXwsRRiynAMOYiCxBSjdob7tt
         wShFPuFXrCLpud0JXvFskC/dGhID4KvAx3IBX4RGprqccO8A0Z84rBOSRsv9MnVsg8Kg
         fEpkcHf1S36YO7hl3ZmiVo0o1vl3BS36jVHauUeRMKlc+cqZZTPQi074lV3OIPip3aL1
         elCgpPl2UNvFZT/eJFXxM6BsR41JgVFLa0TgB6zpu0Ok21wr70rd1v1G+Y57MIGSh58A
         5P3wiZx4suFe0hM9f4PBMbtlYL131I/x0nhyFzX0WImEctcB/z/wvfEengifuIiK26ex
         MApQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318556; x=1780923356;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GxUOUnFMum3tGcWpetlvrIGoT2OHDlQe08hnJpSqFJQ=;
        b=DYHsE0mkOWbutczcRNKZvMWMZHdbhK3r32GEIqLLHLEuJOTwW5mdEB31OrfPqHd8k3
         sM66D/KF55gxorM1EuVxVsVMb2cnZyO9rmcZAVocoI9B1lSGYNvBs7I92bYG2guNNCGe
         K/nnCWTqgr07VTdZC+fbMgxm5VqPQmCtGEuLv6ZAUav3i65ebRUHP0y+frSswpeH8oFf
         CLubuDN8homdVFpnsUM4iwhmFEY9BEX4EHHz7S99Gl88DBDOcWMk3tP3DCr4LWx85CpM
         gZ9Cqq1UsztRwX58TAvt+EYd7Nbo2SbGQLugh8hZft+MlrU8aDWcFCE05fdO4Yyfr03Q
         ORaA==
X-Gm-Message-State: AOJu0YxORy3Y9A0nnS8bHXMKsHIMFZ1l1HIrizsFFla8gLCnI0O+caR8
	opv/LLnV3e4BBLikownotSSDYe9aHjFfDLSTJiKjfK9h4fq9r9+ge9UDUfj9ciCReN3N63WcCGc
	1P0p+Kn4f39XaJnM3casp6lP5N7//h3qBu2pTw62a4BMBUf07lXCpxACbn61QwIP+q3wc
X-Gm-Gg: Acq92OGHE5JLm/3Gs9PMtxKpsgQtzDfF0ash9WjKgBvR539WxYnlVOvX6xO7e5VUj60
	5XEuufpuNe6HT6MyzBYE90IFpMjY/63rU+N4wIXgCMVKHMvuQczfBdbnVLNq/0L2BiETtZExVW4
	Ma4DS16Y5/HF5LSxkj2ZAdb4c+ueYzsg30+lbqVPAoojpSld4RRdqgdS3Hvxl6uoC2uetyseluc
	Jcq0OB/uLCAOZos/Rf8VlnsuFQ/f+j1ojRi23H2HBmwGMhIA29impn2SxlkF3emW4cycf2k/Fsd
	YcULvWAo9om/aj6d+2VQsIMT9ae1jETJurv27g0E3kyEjUG5+DCiXzrBF+JzHpsfPBo6Xu0acB3
	SUWXBfXwtAU7XKEJNfcAJeMZdqn2fQ6CHD3O480JGdbhQU48=
X-Received: by 2002:a17:903:3c05:b0:2c1:2fd:47ea with SMTP id d9443c01a7336-2c102fd4a5dmr6792075ad.4.1780318556089;
        Mon, 01 Jun 2026 05:55:56 -0700 (PDT)
X-Received: by 2002:a17:903:3c05:b0:2c1:2fd:47ea with SMTP id d9443c01a7336-2c102fd4a5dmr6791625ad.4.1780318555537;
        Mon, 01 Jun 2026 05:55:55 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a21f0bsm98584135ad.34.2026.06.01.05.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 05:55:55 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 18:25:09 +0530
Subject: [PATCH v3 07/10] arm64: dts: qcom: shikra: Add CDSP, LPAICP, MPSS
 remoteproc PAS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-shikra-dt-m1-v3-7-0fe3f8d9ec48@oss.qualcomm.com>
References: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
In-Reply-To: <20260601-shikra-dt-m1-v3-0-0fe3f8d9ec48@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780318512; l=5225;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=IaDoauPJHJLmeg0KCOp3wjoXaMuRxylv+BxtByokKWc=;
 b=sdkzBqG443jHdegGYp/cTWdetB41PNbQHKXDU8E4fF5KehlK9WxGcnEcIfxRMJjI4+hoXekjE
 Lzn9XZuzE9UC3IRrdADuCIPzB3CPD1GuvlE/1NLVoWw9eRbSbH+db8Z
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-ORIG-GUID: b6xnHyhlh28ImPIwknOCh3IbbQPgHOi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDEyOSBTYWx0ZWRfX6DqsVHOeJRFW
 6VYW3CbYOFaBBFaaIkExcRpffQE5i24KDsrEAWi0kipoAAsn1MZn/ZBUQNzWOFR5lM5pyRadeTN
 eza4rGFrqZxDxTDZ326G2WUm5SYmJby4omhOL7PeIrQC9+hPn5BoarFd3a2vZsK7b9qKjwAnbFe
 jZ3nGt/aBRmm4OGNVgrBuca2sXvQfVWsxPdtd4sLvRPmLIUmaZ00bk9+zvSYlsMaqd8c3sYGX3p
 Hkq8auiH38gBIp19D9ygt4OYhdFKdm3PqYJQJK+ERhzOsdGeFR90SX998BtKlXz3mlJ3GGW0iLq
 Yx+zHG+RSdpsG1BjWDvCO4w2HNtYXaVls/9rpVulwpPeTwB/1YuGkYwz3wFmkcG2opcDgfKkc2I
 KFqrns7eJkyUS3LpQoSCFGoRwWJa9r+qMCY/uN1RACPPZIbedy7ObcQDwq0RYt3rhSjaACMzwBs
 6cp/jDIGuvmE/ucU3EQ==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1d815d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=PL06LPxOd80rETEQ2XQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: b6xnHyhlh28ImPIwknOCh3IbbQPgHOi7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606010129
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110596-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[compute-cb.0.0.0.9:server fail,remoteproc.0.92.198.0:query timed out,compute-cb.0.0.0.4:query timed out,compute-cb.0.0.0.6:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F1B6F61FB8D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add nodes for remoteproc PAS loader for CDSP, LPAICP, MPSS subsystem.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 219c904fba29..445dd8bb7269 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1798,6 +1798,170 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		remoteproc_mpss: remoteproc@6080000 {
+			compatible = "qcom,shikra-mpss-pas";
+			reg = <0x0 0x06080000 0x0 0x100>;
+
+			interrupts-extended = <&intc GIC_SPI 307 IRQ_TYPE_EDGE_RISING 0>,
+					      <&modem_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&modem_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&mpss_wlan_mem>;
+
+			qcom,smem-states = <&modem_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 68 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 12>;
+				qcom,remote-pid = <1>;
+				label = "mpss";
+			};
+		};
+
+		remoteproc_cdsp: remoteproc@b300000 {
+			compatible = "qcom,shikra-cdsp-pas";
+			reg = <0x0 0x0b300000 0x0 0x100000>;
+
+			interrupts-extended = <&intc GIC_SPI 265 IRQ_TYPE_EDGE_RISING 0>,
+					      <&cdsp_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 1 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 2 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 3 IRQ_TYPE_EDGE_RISING>,
+					      <&cdsp_smp2p_in 7 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack",
+					  "shutdown-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
+
+			power-domains = <&rpmpd RPMHPD_CX>;
+
+			memory-region = <&cdsp_mem>;
+
+			qcom,smem-states = <&cdsp_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 261 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 4>;
+				qcom,remote-pid = <5>;
+				label = "cdsp";
+
+				fastrpc {
+					compatible = "qcom,fastrpc";
+					#address-cells = <1>;
+					#size-cells = <0>;
+					label = "cdsp";
+					qcom,glink-channels = "fastrpcglink-apps-dsp";
+
+					compute-cb@1 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <1>;
+						iommus = <&apps_smmu 0x0201 0x0000>;
+					};
+
+					compute-cb@2 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <2>;
+						iommus = <&apps_smmu 0x0202 0x0000>;
+					};
+
+					compute-cb@3 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <3>;
+						iommus = <&apps_smmu 0x0203 0x0000>;
+					};
+
+					compute-cb@4 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <4>;
+						iommus = <&apps_smmu 0x0204 0x0000>;
+					};
+
+					compute-cb@5 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <5>;
+						iommus = <&apps_smmu 0x0205 0x0000>;
+					};
+
+					compute-cb@6 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <6>;
+						iommus = <&apps_smmu 0x0206 0x0000>;
+					};
+
+					compute-cb@9 {
+						compatible = "qcom,fastrpc-compute-cb";
+						reg = <9>;
+						iommus = <&apps_smmu 0x0209 0x0000>;
+					};
+				};
+			};
+		};
+
+		remoteproc_lpaicp: remoteproc@b800000 {
+			compatible = "qcom,shikra-lpaicp-pas";
+			reg = <0x0 0x0b800000 0x0 0x200000>;
+
+			interrupts-extended = <&intc GIC_SPI 257 IRQ_TYPE_EDGE_RISING 0>,
+					      <&lmcu_smp2p_in 0 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 1 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 2 IRQ_TYPE_NONE>,
+					      <&lmcu_smp2p_in 3 IRQ_TYPE_NONE>;
+
+			interrupt-names = "wdog",
+					  "fatal",
+					  "ready",
+					  "handover",
+					  "stop-ack";
+
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>;
+			clock-names = "xo";
+
+			memory-region = <&lmcu_mem &lmcu_dtb_mem>;
+
+			qcom,smem-states = <&lmcu_smp2p_out 0>;
+			qcom,smem-state-names = "stop";
+
+			status = "disabled";
+
+			glink-edge {
+				interrupts = <GIC_SPI 286 IRQ_TYPE_EDGE_RISING 0>;
+				mboxes = <&apcs_glb 9>;
+				qcom,remote-pid = <26>;
+				label = "lpaicp";
+			};
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1


