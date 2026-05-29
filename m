Return-Path: <linux-arm-msm+bounces-110283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMIaBtKeGWq7xwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:12:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 13184603543
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 16:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E61D83033D60
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 14:11:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A84D3A453F;
	Fri, 29 May 2026 14:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gVwcA2x/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7i73p4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FAE3B3C1A
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780063884; cv=none; b=ieIaYahuA4nZaD9zioQ7ZmC+ybTR0gCHCBYWwh/L1LMvUEJrkfoXbxL/259lwcZkz3lH7WRHCZpodmRcO3etQFHzyN7FyRsQe2Xs9N1OgFInI24S8/8EQgINBK9VIv/S2ECuqGpWXV1IDWV0Jz3tAAYQ7kFylQgnHuEAYuwenDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780063884; c=relaxed/simple;
	bh=GOKSOFwIdS35aYputVHpifn9pnftZnjBGzZCN7UANlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JyJiUriQx5HD7PIw1RSo9IO0R1UCh76iKOLeD4vzo9NY+b3eIZtzLi5cIDx0CkDd4h+Kt3W67lJkFScPbzu3K1Bit8zJ5kNDUgQEAIoUC0XNHPFO2X7hOjo3xjLvpQuKjg3tdPHCojOCg9XRr1U3Fp2WpJoPRppLuOGRYJEA/Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gVwcA2x/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7i73p4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TDLgPU2748127
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=; b=gVwcA2x/MU6ZG+49
	lt7aXomIiLPZIt5Up94NuxGo/2U+Cql7PKTJKa2hAynYAc/sKtLVHO9I+jStXCI7
	Yjz9tDGF5PCZ+JK/830PkEr97X+Gwg9S2wFcfNvybkm/9PwF3k3Tmi+hJ+jfk0i0
	GHnbMFEcoR+ZOp4dZglQvFfxCFHnPA6QP2vhKgnGzjQCn9u1rRkxuYlm7w5to4df
	umFgS3siMmxxpQq30XYSRh1ZujZBd8F1IyBA+KTWVtRlrVPV2Sxf720UiOJaSLNv
	ALzfRuWblQaiN2UOAWEMsHYEOUZSZzGfKPKoSbWbU4OPToA8Co2/bqc/sH0ItmwM
	KsLZcg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eevug3whf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 14:11:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba718173d1so106229285ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 07:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780063880; x=1780668680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=j7i73p4kwS166m3ji21apsudio8ZTF8/1pZalGo7l5KbiuYo4Bg2Or93DBBn46YDoQ
         gnW7n5+n3HxYnAkQUznleRGG16PeaEV7LEl4pqTzHztrSuT7v8JH4pIVuaQXUwpdvUby
         JHwCl+eTPGQrpdWyErpERmaHwShLnRCxVKw1kLz37x/uqN8fOPFe0HyK8+Ji6IjJwdaA
         Ax7H1F9duCFe5Mnb5JdWbEhjYeQjIHv51XtBmJBRE6j2wwCVbvn+xcb3T37uUsBNNOHE
         Huu1khABPk4N3TiISq+8zKBA7eeRuWlaEVv3Kfqnn46AF635liaxOKaS7+rBnSZIFD6L
         pBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780063880; x=1780668680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+i0x93dM4hcUsHjMMZee7ffFLN7Mi7pIpN+pXHsXMss=;
        b=C9nBVqtu9dlBeJFNCxWycR9r6g10IVxx5ocEMceIS3FCYFnAW3Bs+LOgc7eVxL05LL
         r97K78BJ7PzylTyftToeqhDyYtB2QQf2ehlLOEtvyd+R6VIjSZW0KGzEmLteGkzmLECw
         Bbcn/vnUVZ2EvQgqjCDdjxialWdGfkZ9NzHQ4pCl8j3i+F9Csc/8vgHVvNpgAAqp8xXQ
         Y5hoEopYcpl2Pkmh1jMGFw0PvidC4ZbKEBASsjiLbthNtii0Tk3aRDIDOUS2JtIKUdnY
         cERdGiLnNB7lqKCCdCVLegdYZqICm9tF2Y7/0vlTdf8wxdRmK/HHqrXqsmCo8HdA27as
         UpgA==
X-Forwarded-Encrypted: i=1; AFNElJ9q0bYNEc3XFi/UOITkTZVUMy0eGqitmNCW9wvrWfP8ASMidDYAECYBpbkKfA7ZtNLKQKtoQ5KW3vQFro+4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywsyhjf9YXU7UE9PiVOpd4YIUgg697lhUiGQ7IpT6d1F1J4cvjp
	/LB5tpUcT/U+19kypTaVwi2T6PgIk9uek2N9otlxeERjYxj/+gwmQNn1aEqjb5vZFv3eGv0wFoR
	Qdk8S23TEBOik52RkGQoadutMriS44EBJPTIbgtZP507scjihlpmxyn19wdzahxmVTnZx
X-Gm-Gg: Acq92OF0Z+qZa1iNXajNWqjXg1csb6bCrogITehNOCAMlDUJ4QFTiuy1AwgvnFcuuuP
	5MSLBa+/3KuHoMWev09XMQ9hS/EuyDF7lILdLGKWBb8X2JDQRug63g/RK5qnLo8IuEk+AiP2bPo
	E+GeWOaMH6Y7Vs0T416nTu8Cqc8K7BHXelOWjQlXB7pbEjaty5Qw4dYdt9fI6rjUjp5Pbw00wcE
	vssEcOsGYxjZnbf/VpqeLfPUpCUAx84fesDlN1QlXhUKaI3vI6RpbP/bVm1k83vPg9gzcb5gb9a
	LT9xmTSlIcUR5DDTY7ggkygx8ykHzg1w7jchhWfCCIsTab0uSYLjHTGDXTbgFcxgmwEIwphNFkj
	bXXVUs5YktwPjQEjkvYGEDTboOA9OLahdwWTcgjzOGwzUBvpthhDSyvcoMxD2dx5YnV8b
X-Received: by 2002:a17:902:da92:b0:2bf:3302:d882 with SMTP id d9443c01a7336-2bf3302dc6amr8435745ad.30.1780063879920;
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
X-Received: by 2002:a17:902:da92:b0:2bf:3302:d882 with SMTP id d9443c01a7336-2bf3302dc6amr8435055ad.30.1780063879412;
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a00a53sm30775215ad.27.2026.05.29.07.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:11:19 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Fri, 29 May 2026 19:41:10 +0530
Subject: [PATCH 1/2] PENDING: arm64: dts: qcom: sm8750: add reboot-mode
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-1-7c32161cf50b@oss.qualcomm.com>
References: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
In-Reply-To: <20260529-psci_sys_reset-dt-changes-for-pakala-v1-0-7c32161cf50b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDE0MiBTYWx0ZWRfX7pVt8no7ERfS
 SY3q1d6pFV2jwEES2oiooqkeOMRxU8IPPcEb1PRAVppmuN1GHwKKrRF1ofBTbBdGvFIOCntW4QI
 4d0InQHMGTEEAFoe0SeveUhyk8MGu4W6WhFSqWcVAsmU8eEdDEqoDfcaNs0cb5zp4bm2qsq1mY+
 w+svH2Unc3VXflLLOFxoMoLopJDwani5v/fzTDSb+mfQ+69Kp8TUkkA9sjRlsNSygwSPbjHrPI5
 D/1aE0Q0A35oRkR7mJwD/jljWhv+QkdnY5W9XdqC1xjB/d7Z7DFX4DErRwWm8Ois7aY1Bo1eFJu
 YNcM9R9i+xJGnb0w+JRKcdDE6hzCZCxxySCo+g+R4t3Wnz7dPHuG5q0UI58R/sb+8dUvuwXOt3F
 kod25+lv2yFh70lE80cCOuW2/YD+8ioMuVtaSeGcTdFXd6vDpUh9QG4WwqMcSA1riTx3tzuCTWh
 b07UgW+O1HzBtcNKu9g==
X-Authority-Analysis: v=2.4 cv=SNBykuvH c=1 sm=1 tr=0 ts=6a199e88 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=t9eHAnW7oJswSNK9swEA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: xKB7QG-NTHlyjQKtMOO6BGshhRGyCArp
X-Proofpoint-GUID: xKB7QG-NTHlyjQKtMOO6BGshhRGyCArp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1011 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290142
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110283-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[anurag.pateriya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13184603543
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add PSCI SYSTEM_RESET2 reboot-modes for sm8750-mtp and sm8750-qrd for
use by the psci-reboot-mode driver.

The following modes are defined:
- bootloader: reboot into fastboot mode for fastboot flashing.
- edl: reboot into emergency download mode for image loading via
  the Firehose protocol.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 7 +++++++
 arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index de19b4dc214e..e5e2efa2218c 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -1425,3 +1425,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 801c46d55602..795d0d34e47e 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -1154,3 +1154,10 @@ &usb_hsphy {
 
 	status = "okay";
 };
+
+&psci {
+	reboot-mode {
+		mode-bootloader = <0x80010001 0x2>;
+		mode-edl = <0x80000000 0x1>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 5d6374a23e3e..58ff34e91893 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -261,7 +261,7 @@ pmu {
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 	};
 
-	psci {
+	psci: psci {
 		compatible = "arm,psci-1.0";
 		method = "smc";
 

-- 
2.43.0


