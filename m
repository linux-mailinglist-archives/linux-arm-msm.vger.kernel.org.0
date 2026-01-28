Return-Path: <linux-arm-msm+bounces-90887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMRuFrBleWl1wwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 02:26:08 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C8F9BE7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 02:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E2E3C301750B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 01:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D6E72288CB;
	Wed, 28 Jan 2026 01:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/3ATla/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmZi9MeG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29F22264CF
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 01:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769563558; cv=none; b=Y8yPT6IVS4/YJutSJ3gXWpEN20ZO1U9tPyam1uqqwGgbFG9aUqCRy0Lga0Ommmb4AuZ646zIH8hFsMJunmX8FPIXm9v7caa9XkhkUdFJq9wOpQ4yujuHUOp5RLYx1S2qJaMDBdiUvI1bnthxQU0X3YJdvNSQvO1iX8/eemg2R8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769563558; c=relaxed/simple;
	bh=6+pIi4mts8ls2ucAU808UGnDPFoLgGsQl0HIp+39css=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jnmpDcy5AsfHATqh4kuEn3h+8nVRel2h8eXrKU+c2aPSEjDJ6KqjinCcxaNFl3omYPUOG6tg6H6zlsfAwvgb57BeRHvVbTYxLZsl15J94VNeVBAIIohXiU3BNi0+u9hJ/rzbx/z49VQdlIfxo+tdPBPG7RjEsf+aAZcU5vNckTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/3ATla/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmZi9MeG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S0ltja621204
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 01:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZdvQhphWMdt0H0Aw3VeUsu
	B/vX8a3bMu4OaJrTWMoo4=; b=P/3ATla/9uWR5wpEQdVSR2KKDD4qSxxQBn1o8b
	tmVwB0/kY6ZbJMDE/rFCQ1412QBqnKx5z8c0cHmT/nvzlSLa/YwES2lZx0dTSNzc
	13qwn+xC6/Zo+/17Hu8DNMCpPf1ZzVeDJC9CR4B9UtTwH8S2Uam7m593P/8xwu65
	Hm1Pc/hLjzpMvF/XmJKhGm31vM1yd8PgfAm8j5BUio7ZoRovNbSTS7wLwpAxNjPx
	MZYpDh4VEn85uyApUtKntZLEmir2tyhRhOUcTWThkrjfLJ4ULYemGEEESDkz8WDv
	wXojwEDxXh8UZ7K/GuUWILRZhT51HxlLfAdKCEOYkirWd+Lg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxsjek6ja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 01:25:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-81f5381d17dso4317270b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jan 2026 17:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769563555; x=1770168355; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdvQhphWMdt0H0Aw3VeUsuB/vX8a3bMu4OaJrTWMoo4=;
        b=LmZi9MeGgZjR7rvDeGgSuY067+6vteRkH2iIHNkiJz+mssCDpzNubEBE8HV1eRNG6P
         yaQZ0OB3AsIgIkKEcI4xoKVxDLf9Fj/SOwGti18XHruDh5P1EmQR6jFcONPtkrW6DuSp
         Yevbm4DkC4DKLmsP4yqmvtPBgRX/matOMYHawjDJTyPDTQaTb+5XPWnnLQ3FODet064S
         uhrk8nZg60D+BYi+0HYkTllHSbN444Cq82tvBcrXWlMTMYWJeuO0fHD1e51q0fQx6KSW
         zT0BsIiRGhQTrxuP9dUFXpDeCeXKkkZ1/28BarOex5GPtdnugfcPrL1MfiRERPrvz6KT
         8x0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769563555; x=1770168355;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZdvQhphWMdt0H0Aw3VeUsuB/vX8a3bMu4OaJrTWMoo4=;
        b=uabi+KehVKBgbcYI37y5NassAKZm2vTE56VrcHwSc+6hMBjdX+27LjtCxaHIXd314G
         IBDWJrdWpsaVfI+LSbv/SE3FtySnoc/KatSC9AY8HJiD6+/IkBKJJdurorilEMEvYBSn
         iyaFlgLXmS742Clq/9Yb151K6r6OFA4o57vzqvBI+LUetYsDGAJFEnigoOkXXjq/L+nV
         EXsPdZRa0BfM010PvPqqn6tp8Nnac4TVtQWrKJsNq00Gh0ScWddMS3lky5uSjDOZ4u9E
         LPapv7GicxZ6gYvn5h9SuYUPSLNt0wxkbP7u8wClzPYeoc+wDApxhXRwY3/+MvheDLTn
         8dIA==
X-Gm-Message-State: AOJu0YyQl8RdH/PVzvRB4cXPXd9Pv8mfhjA2G5w+3e8Mg0MzhOntu/b7
	yng+XVUw24gvRWsQQNf2OBx3muP7KwBOp3yXgpkvRyWrF3L5M9nPNmgycBdc1J/rW2CAizt+XQg
	JgVxQKtuoAd1/TjA0e0jkbxzgyLScoPIe2Vzg776UtXsMmZS7aNKXSGzPtsnabH8IKFlu
X-Gm-Gg: AZuq6aIDzVFU4QW0FQJ4aByzU9L+u3+zChhKd564AgO2LOT6EasN/g+eBdmgoF1Lqs/
	2bsylVolHB97cF7H0W0oOWEoNSLK6DSjW1EOKZo9s2GwmuRSG+Q63AAg1U7aT2k9hVrHLFG3N+7
	ENVGevAsDL7bbIfUhAeh4+ecW1aU36ivOoK7goWqUY++/VpmVW1g4ejqWewcXetJZ+gJS8AzuCh
	HxoxVpDkcFdnRksr+G0CmnA1V2gvvnKTIF0DEan6z7REqmxsFMVo9sdxofPhHXZ/a+t5iR+lvM9
	9C9tn93dEOMUJyzjrUcciKghsFLeCJxFKBjbbEukiUj/E8klQeBnihIis6ack3aUJ4frjRvZs9m
	hpIY3UBdQeJBjX4pImC5gg4YyzROHMgIk/1OHOa26iMMrnQ0hRagRdNEr5t+Q8MH/VhiDF/V0
X-Received: by 2002:a05:6a00:bd12:b0:81f:9bdc:9ef1 with SMTP id d2e1a72fcca58-823692f0f62mr3181724b3a.69.1769563554620;
        Tue, 27 Jan 2026 17:25:54 -0800 (PST)
X-Received: by 2002:a05:6a00:bd12:b0:81f:9bdc:9ef1 with SMTP id d2e1a72fcca58-823692f0f62mr3181695b3a.69.1769563554142;
        Tue, 27 Jan 2026 17:25:54 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1f188sm769801b3a.13.2026.01.27.17.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 17:25:53 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 09:25:34 +0800
Subject: [PATCH v2] arm64: dts: qcom: talos: add ETR device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-enable-etr-on-talos-v2-1-ba77063d6b62@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAI9leWkC/x3MQQqAIBBG4avErBswg4quEi20fmsgNDQiCO+et
 PwW772UEAWJxuqliFuSBF+g64qW3fgNLGsxaaU71eiB4Y09wLgiB8+XOUJioFWrNUuvOkelPCO
 cPP91mnP+ANRNXxBlAAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769563550; l=1702;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6+pIi4mts8ls2ucAU808UGnDPFoLgGsQl0HIp+39css=;
 b=K4zBQWxhBMIh8ab/7zLL89QAzYi9prQXW3eJG2VwQF7paq71CACGuYjyWzoYZe5qnnZetZwFs
 /KpPUTtCkDSBL/4OCDvp/DqB7lveiFmP9j/rK2Z8ZB7k7i1aWhFb+ja
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAxMCBTYWx0ZWRfX0EBWNcCO/QKX
 vZTc+9uGfssEEmm5gsEMGJ9a7LWfUhLx0EYBDuOowntp4v0Sec/5+2yhr4+EdAg8qs2JjTEaOQC
 OahAX982FUyf5UBwmBosDHmHa1TYaTvqKtcy8tPiPM+OEzL0CSVOKRNkBX8Yl9pV48lCX7i454O
 idy2KfferVvZR4O3CnXquD/cM5NQqQOOZ4y3jBSZn+EG7fNicJCghuf+LYwDMtRXbrSD9eZ4Cjp
 WyqCvEpIZYa+Lop4cdQYaOJkj/64yvMhsEHTkTMOjykLGFa49NzRN3RBE50uU+VQ8PbEqJkIBNg
 du8/+t7FFIv6WwPtJLEwbKAr8t4CrLhK/el5x0lxzQF2xJRyOegCDMqogO6PI8P2MP9g6AdhUQ8
 m3WGqXynWATtzXtvOXSKumaxUXnWIrXFSekVDBwY2jSPsK9CtpTTBz3FjzMByJ/VPOle2bvfmp5
 TZ6g3Qtovv5lZSazpoQ==
X-Authority-Analysis: v=2.4 cv=Qelrf8bv c=1 sm=1 tr=0 ts=697965a3 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=rJ1OjL6diA_ycIJh-hIA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: YC1JWXB26MZoh_HIUhUsU39mNr_wWIeB
X-Proofpoint-GUID: YC1JWXB26MZoh_HIUhUsU39mNr_wWIeB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280010
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90887-lists,linux-arm-msm=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.92.73.0:email,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jie.gan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B7C8F9BE7B
X-Rspamd-Action: no action

Add the TMC ETR device to store collected trace data in DDR memory.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Chnages in V2:
- Remove the un-used label.
Link to V1: https://lore.kernel.org/all/20260123-enable-etr-and-ctcu-devices-v1-1-5fbb3423a2d7@oss.qualcomm.com/
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 75716b4a58d6..544b1a2fa027 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -2253,6 +2253,14 @@ out-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
+				port@0 {
+					reg = <0>;
+
+					replicator0_out0: endpoint {
+						remote-endpoint = <&tmc_etr_in>;
+					};
+				};
+
 				port@1 {
 					reg = <1>;
 
@@ -2287,6 +2295,25 @@ tmc_etf_out: endpoint {
 			};
 		};
 
+		tmc@6048000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0x0 0x06048000 0x0 0x1000>;
+
+			clocks = <&aoss_qmp>;
+			clock-names = "apb_pclk";
+
+			iommus = <&apps_smmu 0x01e0 0x0>;
+			arm,scatter-gather;
+
+			in-ports {
+				port {
+					tmc_etr_in: endpoint {
+						remote-endpoint = <&replicator0_out0>;
+					};
+				};
+			};
+		};
+
 		replicator@604a000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
 			reg = <0x0 0x0604a000 0x0 0x1000>;

---
base-commit: 4f938c7d3b25d87b356af4106c2682caf8c835a2
change-id: 20260128-enable-etr-on-talos-ee30dbac706f

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


