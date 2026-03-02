Return-Path: <linux-arm-msm+bounces-94898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMv3GiV6pWm6CAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:53:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C20521D7E4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BCAB130AD8A8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:47:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EC293630BF;
	Mon,  2 Mar 2026 11:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSdm8kvf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ0NQi12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426521E1A33
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772452038; cv=none; b=Iv0+4ZFTsRmbDHmrNP6DOFHlR5h/pWUc6W7aU01WlVzlOU3fXdyiFiMsL919eeg4O6sDVAJaZBLGKYRI9pFrE4wQbC3yQpue5G0zERv4/i59Ue4eDBjPijtKtY8rMW9Vjkux9500QTq/ZBeivMHi5Dfxhk5nY0X82z9Pu84CeDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772452038; c=relaxed/simple;
	bh=qlET7dEVmaLfZCQy/ADJ5VWrWEtt9fNoSEsGwflOxIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=UkbpLDK5rPnPJB3rS8scvi6n9eGlfSA4cBUQS7QPZzQp7kLohvgk16Y76asB3VmOuM+EIz5g5W+HoBnDC0Z0LyPfGaPgJhnj29LD/INYVGwsatM/Rx5zdaJGbkad67HFFpNmKnnMhmW6/sdvA9q/RrpLs+NtDBqkDE7KRlbDBUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSdm8kvf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ0NQi12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6226h9p32504594
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:47:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qbT1r1wEl0vg1AsPHstEjS
	QrohURx3c03lED3xKLHs8=; b=GSdm8kvflWrEUwFO9PXzuBFxvJmRvVytCmihSo
	Yz5p1LEop/qN+7UrE/Hh2jzswnggmbTe7IKnw94Q5Cyjk2aKA1Dtu1DNfhdknVXR
	+zQBSxD7yTp4LglBUKYwnddfYhV9StPeFF2O7CAOSnOekVO9Iaw/Gc3zoSu5A/4U
	rzE54h1OMJVThNVOYc73u5fPri2mr/UcbZi0oNqa3cADayjo4capuJhBNfAWjtRX
	hKujM70twtYDYJwEX+/5ZJHLKHH1jnmbyoO/wQ2t+pGuZhN36LQBD2U/G7bW1SJk
	0POBINYU9daB+ZYprJrgGhhr31YAFVldiAWUlOaX74qp6zZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hes33h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:47:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae53ec06b0so27240645ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772452036; x=1773056836; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qbT1r1wEl0vg1AsPHstEjSQrohURx3c03lED3xKLHs8=;
        b=JQ0NQi12g/tzKVPh2eu5Z7HWMgTHWU3i1+JBNM1CHyxYrm4j7s22daxXQxfqb1tsTe
         rCDdVlLdzbyDI9P5ug7fk8VwMK9ao8TFWNVKZeZ1K2LdHuWr65igfOlhkny8vLRpAtEr
         Gpgn9vub9lEq3scjMMTs/D4mLSAIQoIm1iSh+GuNlTOLVHJJR+XqC02/IFGAXoEgMBvW
         9bW6/svWt0WxTjapFXNUZZPyEVWTl0WuCBfTkpbsvRDHP1L77JE15m8bPK8xox/PDHl0
         yndPND76Eh9ngnpDEDk9AEbmbhVD/JvVj/g4cT0Hmta0Vd53/eLWtPyaLhvUq6LnvEhb
         wsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772452036; x=1773056836;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qbT1r1wEl0vg1AsPHstEjSQrohURx3c03lED3xKLHs8=;
        b=GyAgDoCuhFdjWEIkFAC/LORNGUjgWujxdIi21/0t6Ps2h8M9ap1bn+l0VyhAyIvD6V
         zkC50dU+QIVV0LTBGSqo8gRt3yYv1TgbbZ47UtgNgc4zyE7eb3duRXFZmAUDhJgCrydr
         zDVm2huSJ3nnGIGoEDZnP7SZ4GfZkU47WM0eXrN1fpne5WelaJzn5RMqOhdadqe7n7YO
         EpJh05jI32tMqqda4LLRRcnA7WApoZTEZQ1HX936ML60LGOgyaISFQPONw2LmQhciQd9
         Z6cG2sB12cgm7E4x0cUAPPmdp66m6iz1ultbjMjzatbfj4+OUHbcmKe90TL1SmepeVaA
         A57g==
X-Gm-Message-State: AOJu0YxPuINQ1FY4aJhN00jYXubO1aDx67W0mttEFhIGILd8FcPsCq2s
	9sk+xbXsfKgwxD7WgbvhC0V2STp6kCfOabccJ/0q1Ivqde22s0su89H2jNMaitZWS/I6RkObawn
	Q9QYeRcD61p6Ayn8SQmnf4bwHRfkpsBPVYhex9geivnnhF91Ja9AQv2SzXRgxcVIa9Kw+
X-Gm-Gg: ATEYQzyR/iNx3p3WsDe0v6qbTBz3vyg6sfnh2rPR/PPjNJZRIVmSKgniXR4HJaDEW6R
	T3cc5VE3tjKWHIdMnHXpSD9rjkE2ERoCQqQTtYGVxt3T56oqgVdCuOp5KoP+MpxlyoVGFROiFu4
	N32jmAMDtmQsOgFVqUJG343x73uvlo14SNj7w6KF29rYNJg/rH37x5tiqVb+4BqmDopGv6FIfAs
	LJfhgLK/zRdEVSVEJTqxBmF6z5NowhpkrUrKmAE4laq9u7OB2nYsZjegG5BHVBD2ilpHVSvcdNo
	bD/7GRyD8w7Bu1HogOQt2sDKWaLxcsSoWWAa9+CRQ5bcEW3Kn0W3vTmZzplx14Sgy6/h+Dyovqv
	fMzoXduj+kTuQVPaB69JJiDe6vBA8/FtExWS0eMIeKYbP6bCNfTMulLEMl4N+5M99ypJ0IQWvI5
	b2k448LISPf4GjWDkKcv8Zh1Fh5MwaUlVIQgQ0E8Z4zvusp8S0
X-Received: by 2002:a17:903:2346:b0:2ae:4fc2:d951 with SMTP id d9443c01a7336-2ae4fc2dacfmr24621795ad.27.1772452035810;
        Mon, 02 Mar 2026 03:47:15 -0800 (PST)
X-Received: by 2002:a17:903:2346:b0:2ae:4fc2:d951 with SMTP id d9443c01a7336-2ae4fc2dacfmr24621495ad.27.1772452035332;
        Mon, 02 Mar 2026 03:47:15 -0800 (PST)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae496470d3sm44674915ad.15.2026.03.02.03.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 03:47:15 -0800 (PST)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Mon, 02 Mar 2026 17:16:56 +0530
Subject: [PATCH] arm64: dts: qcom: glymur: Add glymur BWMONs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-glymur_bwmon_dt-v1-1-f4939d75bd47@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK94pWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMj3fScytzSovik8tz8vPiUEt1ky8QUs8TklJQUEyMloK6CotS0zAq
 widGxtbUABT+nlGEAAAA=
X-Change-ID: 20260302-glymur_bwmon_dt-c9ad6acddd42
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        pankaj.patil@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com,
        pragnesh.papaniya@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772452031; l=2957;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=qlET7dEVmaLfZCQy/ADJ5VWrWEtt9fNoSEsGwflOxIU=;
 b=wmIClfxwSUPlFLXTqqqxoBvGDe2ARWQZORYPnZlEKYdpCXnw3TP7bWjffhV/EGosnTazUORNI
 pTv2BLSBnL7AF/2T0jMiFtRheCT3T7ucekR7NSMfjIgJalFZ6wprBVP
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a578c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ZhnK2y179Sr6Q8Jcfc8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: PZB2Fw6gJrkqf-SMzsSJcICPTJN3lDGI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5OCBTYWx0ZWRfXzbffPCJN6Ny+
 jiff198P9WgdKiDDGYgK7CtcfW/VskevfrwN+EznawjGIFz3BkmLEMx5gp3VytLqung+XfKvuRr
 C8oz97mDYo7UwNcIi0n4TES3h6wSme4GraJI6diFyPY8FSJKm6teKO/h+Htr6foZuAzeTpc0nXT
 KsnOCM2G4dPgC/wfvDwKoWjE1shn/oa26Flrdwbc/4sJdPt586C36CBd5yEToyg2oSNPnCi9tEk
 vqPI4mDs7LnHznmVE1dGIJ06f9kxsFuV0obLoBHeUEhqnZkSHrWPKVrRwynHo85H1aQdrEGSsN6
 VSKs157YX6ds0Mb0Qc4yXel6jHlZZuAxySUif/W8cOgApKmzDbyDuWdHZku69AMDAIW5MTV1K61
 UxzwDEGpXgXxP1nSRQ9A1MgTIsXWhjfv7m8is7rdH3x2PoPqk+RV/JifLH3/FndPH6Ic5LjMuAt
 W9H9R41nsMuCc1td93Q==
X-Proofpoint-ORIG-GUID: PZB2Fw6gJrkqf-SMzsSJcICPTJN3lDGI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020098
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94898-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,100c400:email,100d400:email,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pragnesh.papaniya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_PROHIBIT(0.00)[0.22.227.96:email];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C20521D7E4C
X-Rspamd-Action: no action

Add the CPU BWMON nodes for glymur SoCs.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 87 ++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c..fd947b1a17dd 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -2264,6 +2264,93 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
 			};
 		};
 
+		/* cluster0 */
+		bwmon_cluster0: pmu@100c400 {
+			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x0100c400 0x0 0x600>;
+
+			interrupts = <GIC_SPI 903 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+
+			cpu_bwmon_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-0 {
+					opp-peak-kBps = <800000>;
+				};
+
+				opp-1 {
+					opp-peak-kBps = <2188800>;
+				};
+
+				opp-2 {
+					opp-peak-kBps = <5414400>;
+				};
+
+				opp-3 {
+					opp-peak-kBps = <6220800>;
+				};
+
+				opp-4 {
+					opp-peak-kBps = <6835200>;
+				};
+
+				opp-5 {
+					opp-peak-kBps = <8371200>;
+				};
+
+				opp-6 {
+					opp-peak-kBps = <10944000>;
+				};
+
+				opp-7 {
+					opp-peak-kBps = <12748800>;
+				};
+
+				opp-8 {
+					opp-peak-kBps = <14745600>;
+				};
+
+				opp-9 {
+					opp-peak-kBps = <16896000>;
+				};
+
+				opp-10 {
+					opp-peak-kBps = <19046400>;
+				};
+			};
+		};
+
+		/* cluster1 */
+		bwmon_cluster1: pmu@100d400 {
+			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x0100d400 0x0 0x600>;
+
+			interrupts = <GIC_SPI 901 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+		};
+
+		/* cluster2 */
+		bwmon_cluster2: pmu@100e400 {
+			compatible = "qcom,glymur-cpu-bwmon", "qcom,sdm845-bwmon";
+			reg = <0x0 0x0100e400 0x0 0x600>;
+
+			interrupts = <GIC_SPI 902 IRQ_TYPE_LEVEL_HIGH>;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+
+			operating-points-v2 = <&cpu_bwmon_opp_table>;
+		};
+
 		cnoc_main: interconnect@1500000 {
 			compatible = "qcom,glymur-cnoc-main";
 			reg = <0x0 0x01500000 0x0 0x17080>;

---
base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
change-id: 20260302-glymur_bwmon_dt-c9ad6acddd42

Best regards,
-- 
Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>


