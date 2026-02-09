Return-Path: <linux-arm-msm+bounces-92212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGtaGJaPiWlz+wQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:41:10 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B17E310C890
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 08:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C7889302F273
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 07:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8BED331200;
	Mon,  9 Feb 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RQyDLGhq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="htlodSp6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B60E1330328
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 07:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770622760; cv=none; b=cJ0W3nz2Z/IkgrXuRy8unffUNK+EE8tmGpeNPwVXC26hGXR6lkfXGzGdk9EZrvfUD/OdGdvMmbdgeZnYUd7Ri+8Oj51ShsOEl/YDHCVi1l21tRyiticfhhbT8Q9FF4whadjbs8QYQzolwtbgQ+FmesGb1JD60Kh2gnVkaFN3FZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770622760; c=relaxed/simple;
	bh=dXpWoK1qC2LFI7l5K9Rd9talSe+XPRjCp4OQe+Gv3W0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOfkuFacElVKXo5mk/zFrNWcqXOvX3kXXUP9kmK6oFvLWkWPqk38G1Q7EhZjevCFcMxjXoodCchLFddbvSnnSigpgnaim1oK9BpvT9shpcjrcdIA+TqBvjfEXfrY2CVMTmb/wgaX4lpTIrTHwUqr75fEkR5FCF+BPOq2frDiJow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RQyDLGhq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=htlodSp6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61940Wqb1656487
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 07:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	frgp34E/WaU2jaaErqrBitaPa6DnLEZuRLnd8cXrJWo=; b=RQyDLGhqWAPrCen6
	g2b/FEsBmlNJYyuJ0vezFnAvGDAt+KWAAn4Be9rGtrKvn0u1SESm63Nu+69w2ocO
	LZA0LmSWP5KXT8skDdMoh4yUp7KFWg1qVXswFHSdAMrPENkjf+gquBGnijYz3/qP
	dbinNXSjfGRelIFirDXPHlcPyR2/z8rR4VNglRznYwK2HjDXx0y4Kz/lFMLzpvEG
	miRcu5RtVKpJZOY/qe5PirNhstqOZbjn9lBzwRRS7E3kAvO5kN9c4yR8syODMLHG
	qXl4tmlqJnrlHi4vNtp11cTBTSPE6qbqRR7+DVbN9Zawr09iSh6guMX3egn9BXV/
	XDLx2Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862rmjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 07:39:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae3810558so12735365ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Feb 2026 23:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770622759; x=1771227559; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=frgp34E/WaU2jaaErqrBitaPa6DnLEZuRLnd8cXrJWo=;
        b=htlodSp6On7HIhqrIvIQwmtQAFK6trvmCHsMtC9P7ozg0wc/UCn/gMVOzv9i2xznhG
         ZLNrQn3U627qYH+iZRiXkBmPs/oNC+F4EJRkxOIBTEIoqZXUHM96S0enVh1N34cFM8t+
         GsVBHhDrolNYSz2Y6JMtXk+khTu67V6CHKWxhCdhw19JQwNJgr5H1QXEDBwuf/o8mxEH
         hSp+XIjX7nLC0eKs/zYxmu6t0ewOuaxykaJLqOFnxG+yC7iwg6KAkuzwEVAyrP+l4crv
         xUZuI8hkmvegs++7z/sPjEeUzr6AJY7p4bYH6RDFNSER1qqHO6fyisnbLizDgal4SOXP
         ZZow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770622759; x=1771227559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=frgp34E/WaU2jaaErqrBitaPa6DnLEZuRLnd8cXrJWo=;
        b=uAN8IEInR8K1SFIh+lEeRv9CLoUU65g6VU0USxbzDHzE8hlFl56VAEN9dRyf+KjUZ5
         /xJgWcxo0jkEPwINJPcjX/enxZ3QUCRDtLkP9j5aXzlNHyjBWdO5SELfDaNeDNpTaoEo
         wfhVhw4AmaNKIHp8rTVMiZxWbpl60g1W9l4FnYrV7xWUrBBjEtgFABkJFIgeRTE7w6fe
         DeLqke2yq94FAYV7InUc3qqvKug4VMzjm4DSob61BPCt8ZN5yed6kSGwKbTFJg9wY9HI
         +yJeuNpRNbfOJ19K6QjxS71HKE6U4Vl2XMo6E/r7h6SvkJaWgeplN5FryYjVBDBEP1jZ
         OVYg==
X-Forwarded-Encrypted: i=1; AJvYcCVFPTXf7iXGdHzSBTP5rXazIm00HaHhh5lQS2OtIA0QG2+T1Na4COFu17RnKc1k/RNLM4HU/7wUX7O6Ausw@vger.kernel.org
X-Gm-Message-State: AOJu0YxSrmyR/W93veJQ/PUMGbCGpzFudQlcrItss3eeMwPDGr2/etdq
	Yn3Wq8O4QzlJbO9RRV7lCTCEFxtp+8nftvfjV2KX09hM5AxVQ/t+wecRQlKlKWuaq9ohjcGKhWw
	Zs+FjiHooVnKJNk220BNZx+GPQpQD+lWH6tessQHdd/Uz9J2VfPSL32yV9tR/NC6vERTL
X-Gm-Gg: AZuq6aJ0cCYCtFVwPnZIf36AeYphAY+hIThcNuKJ/7aDvbsiAt0t8SYyP8Syd21MOjV
	RINrbGpOvZiqm//Q5CYeECTWvWttO5p2w09Wl0N/e32SMIRu9RmfOA3tsay1LrOlJpJnPjptf4F
	i/1bovsGe97lkJo6eNMbNnlnlXipMIWQZM/uYruGmPLcf6JrsRgV48eihyzTu1+yHAMz3RvCOJU
	H4lc6QdqHw2wOD5XCSYKltZIk1MEj2sGFPzr5OcGGNZWygnkxiqH9OIoVlUaT1HTNYSgCbP96Of
	wBVMaC7ROmXX6PDQiCdHjox1aFo0oZ88amy7lVeaY2YeoPWe3C66h7kvj05WbJ72Us8OiQkwvJK
	QaBbddVjIf1YwMVMcg7cm3gJEn9x1VpIWDATGXIWXXnuolh9lSgMP0/r0QjDe++zpJ7kyGbT8tI
	pBu8JsZiSg
X-Received: by 2002:a17:902:e749:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a95202c238mr102335425ad.19.1770622759282;
        Sun, 08 Feb 2026 23:39:19 -0800 (PST)
X-Received: by 2002:a17:902:e749:b0:297:cf96:45bd with SMTP id d9443c01a7336-2a95202c238mr102335005ad.19.1770622758757;
        Sun, 08 Feb 2026 23:39:18 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a951c9746esm99023545ad.39.2026.02.08.23.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:39:18 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 09 Feb 2026 15:39:04 +0800
Subject: [PATCH 2/5] arm64: dts: qcom: purwa: Override Iris clocks and
 operating points
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260209-enable_iris_on_purwa-v1-2-537c410f604f@oss.qualcomm.com>
References: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
In-Reply-To: <20260209-enable_iris_on_purwa-v1-0-537c410f604f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770622746; l=2315;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=dXpWoK1qC2LFI7l5K9Rd9talSe+XPRjCp4OQe+Gv3W0=;
 b=HHLVu7xkvSXzRidx3BKPWjg3d8fv/p2ukqCePX/udRh1gvd3SgQvNEv11L14UO49ObnTsNoew
 Gnrs3ATdxGjDLCkimB3i+DY7ULcBqRVLHZR5KHe+Jkc8EouxXAX4M8G
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2MiBTYWx0ZWRfX/EleE6j7yY91
 laO+s/A/LdrZQKdWBFVluqqT6Sttu7Df754TreHC2AyqiRhnkPGAiiBWGz/1GmS7t8b9YtZE+ji
 ZOB0YAPBOEa8ZhvgSmt9ImjEkUnyk8/gU6SFd3Ohc/W/aUV82HHsP+aPYuOQPtDohH24/cj6+qN
 NkbzMzZk5spu2vylGNHvLYyTazcGu1EIZpnaGXB663tCiNwi74RfPJgVMZ4vQP34zbjJfKDtSFs
 QVmg8pxqDiiaExNUwYF8pWNNffBUDd+x9lkYG+tfAWdDiwyk88PSCjZ5I9zK2kDBeisSSJJsRT0
 FE5AofQtfG/84Z7jqM9m8QjhG2atrICq0wQlOYTTDvfdltchroUegUB8SCn2cmLBR4bvrTFDyuY
 NSRguOG7X63KdesiQezP9GMDsM5NgaAIlLRQD2k2N253shMxLdGtFUIQ89jAqVMP9G9ANsXjsbP
 6yRUYFBeTPX2UfD9Fow==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=69898f28 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=4TMTxM8xbnWuMOlFmbIA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Usv3bj3XO6C4qlZolRV-K7Brwej6S2YT
X-Proofpoint-GUID: Usv3bj3XO6C4qlZolRV-K7Brwej6S2YT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-92212-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B17E310C890
X-Rspamd-Action: no action

The Iris block on X1P differs from SM8550/X1E in its clock configuration
and requires a dedicated OPP table. The node inherited from the X1E cannot
be reused directly, and the fallback compatible "qcom,sm8550-iris" cannot
be applied.

Override the inherited clocks, clock-names, and operating points, and
replaces them with the X1P42100-specific definitions. A new OPP table
is provided to support the correct performance levels on this platform.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa.dtsi | 53 +++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa.dtsi b/arch/arm64/boot/dts/qcom/purwa.dtsi
index 63599ba0a4f488d8f40f3e4d849645a8fa9ebf59..e97a78d71659c809830a0d515af9b0a6781ce0e8 100644
--- a/arch/arm64/boot/dts/qcom/purwa.dtsi
+++ b/arch/arm64/boot/dts/qcom/purwa.dtsi
@@ -153,6 +153,59 @@ &gpucc {
 	compatible = "qcom,x1p42100-gpucc";
 };
 
+&iris {
+	/delete-node/ opp-table;
+};
+
+&iris {
+	compatible = "qcom,x1p42100-iris";
+
+	clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+		 <&videocc VIDEO_CC_MVS0C_CLK>,
+		 <&videocc VIDEO_CC_MVS0_CLK>,
+		 <&videocc VIDEO_CC_MVS0_BSE_CLK>;
+	clock-names = "iface",
+		      "core",
+		      "vcodec0_core",
+		      "vcodec0_bse";
+
+	operating-points-v2 = <&iris_opp_table_x1p42100>;
+
+	iris_opp_table_x1p42100: opp-table {
+		compatible = "operating-points-v2";
+
+		opp-210000000 {
+			opp-hz = /bits/ 64 <210000000 105000000>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+		};
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000 150000000>;
+			required-opps = <&rpmhpd_opp_svs>,
+					<&rpmhpd_opp_svs>;
+		};
+
+		opp-335000000 {
+			opp-hz = /bits/ 64 <335000000 167500000>;
+			required-opps = <&rpmhpd_opp_svs_l1>,
+					<&rpmhpd_opp_svs_l1>;
+		};
+
+		opp-424000000 {
+			opp-hz = /bits/ 64 <424000000 212000000>;
+			required-opps = <&rpmhpd_opp_nom>,
+					<&rpmhpd_opp_nom>;
+		};
+
+		opp-500000000 {
+			opp-hz = /bits/ 64 <500000000 250000000>;
+			required-opps = <&rpmhpd_opp_turbo>,
+					<&rpmhpd_opp_turbo>;
+		};
+	};
+};
+
 /* PCIe3 has half the lanes compared to X1E80100 */
 &pcie3 {
 	num-lanes = <4>;

-- 
2.43.0


