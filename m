Return-Path: <linux-arm-msm+bounces-98160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HnuNElJuWmK+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:30:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 573982A9E57
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 13:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CB8C5307A558
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Mar 2026 12:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E98AE3BED77;
	Tue, 17 Mar 2026 12:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S9o5D+9+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dTu41WF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984393C3434
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773750530; cv=none; b=SCom2ZYculSGVPLi4Wemd4JN77fYV8EkoAB+C4JwJidT8Gn1zdOK2qN5rWZX2jDRCJShFAmQSL2zci7eDKxGN9ZzJQR/HT0IQHeMTp4Kaj1ee7ZodUomUtXlNenNFOGsNR3YHQ1Svb7Cn0W+lsjiSVDzKMkB0Ede0MeyycoiDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773750530; c=relaxed/simple;
	bh=HYU03RmzKUV+AwSkHQUZ8N2LxDpZ7clmdr+G5jIyeng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNge6vrM7nxWPv6iidw3skBmlTw84Mn1IDsarng2iwrwcYAklblzMDTzrKmsTaoFRfjeVzjyAIHZGyGoWx27AqapDUXyWkV4L3qNjSARSdgd1oVlmpso5DlD2BKZct908kb6oC1oww8KY9UW0uI6fDStzrNS4rNyHjeT9B7UvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S9o5D+9+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dTu41WF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H7cfYk1533916
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=; b=S9o5D+9+WYgvuc6U
	DI+m//yQzbBaH2CKRrPY51dcOomZKn2HF1ezwOh6XXAPkvVmvZpS0H2cwxuJ9mZH
	iL4ViGLX+JF112XDm5bfwXzk0a5Z5jpka9S6UXUbx1fCQV9sq9rR9HIrH3Klj7u0
	7JsBv1ERA1CTsoxDWGQ5ldBRl5MuGlYYk0XkZv4pmUlbE7uD21vvgaUWW6sR1mIn
	TALkhz28SVF66DKOCSDxL6Sk5NCgEc2Bm0H4LJCX6+f5+7W1+plM8cMUp4pUEQwG
	Gn2QEBeagxvse864yO+oXKWUh9EQ4d4TrY3THqXS6/QADy6ivz05kkvMdskrfCuj
	zZwmfg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxm5k41fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 12:28:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-829b7ed8958so19453095b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 05:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773750528; x=1774355328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=;
        b=dTu41WF09PLR3ytOEXlPzoEciXKetXYnFxz/gCdNm0jjkYvqwUccUlFLIaprqg/P6q
         pEB1hURvRLSXAwQuqx7U2Szb1aGPfTsfiZl5dLBKyEIdILT7o6gVGonAYiteT3HosMxw
         T6gjmKvO8k40WpEaAwZtmtBMREHCHimHm7/WnbvUNdotJHVC2StO1LigF4frXpN7kNrf
         s8sxjxk9wDFa0gPq5zI7Dwi15d0gsOn2IjWgBj5oW5AQ99oL+ydITcSV0WtUaQHBC9lN
         fCBEa9InXnzBgW7Tb7p4+af+kgm5FlRQpEAWDrgKsKHKCY94ReVllIcsepfYm4C4pOzY
         neLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773750528; x=1774355328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=McU9Jt1Kd23iuHTlAf2hKNHX4Z0V0K5fS02Dbtd3khA=;
        b=o4DeYPEYEPxekFgC5wzNCQNjjmxFq1489i1HgOtWG4xgVmGsdOloFiibZMRO/sHzaE
         ztSdy/eF3qogxhVhxRsKHDu3WDy3i/vdr0Rp8JqBlC2RDC1cf/WiAkuvGlb1wlGcX9Zu
         9oWB21ixesY7/bbIpoHkKqfacOLAo401U7GeQ3zeFJwGTeZT22p0rlKFQ16UV8la2hB3
         soFaoEQTlf1votMGZkM1M0Lyvn+UCdVgVBoMAX/QMrd59Xl1gvNtN7B1t7PeERWfRcJC
         6mF3kHbG8fBC9K+Zyb9XrlgORe55WDGnRsNi/DPChKyoAbvLS4goF9vexi4srZDbFFCU
         meTQ==
X-Gm-Message-State: AOJu0YyqAMJMwUHt8r+j6ikgHJEO3/KZ+SA9jeG127qHzvqEmi0RyYrO
	haLMKQ0w/Jrw/XXChsW5ypgBFbop2FIg1iMbgPsMs2cDuB7sdFiwePT4EeiViBEMwVwfVsrjwmE
	KuMDeXfHVRuhAQ3H9VxsAS0g4FCjKv3A2OkMnrpYAwy6INDnlZuj4dvcB7W1LvddusBs9
X-Gm-Gg: ATEYQzzxyFfw/oai3Ya3TBk+LEsi3HvPUFry2Jf90RseTMklYbGUzUHcPsJXjFrQw+Q
	k6cuuU7503AY2F3TNkZ0yagw5IG3VI5UTszQJCvmpHwh+0S3HMfUfQI3XYTv50WhWGY7iSdTZgK
	tQeE/tHFjO60INWWBbcFp9qk1TDvvhA+U/PTxINj8BeALKZTZT0J6SWcdp2TgSV2er9GviWFL+9
	Utx4wn5t6aAbJNvEn1wCvQVGQIS8jQMJ32zu5Rd5f5wogD2rNlx+1R2efN0euw9v+kxR2vkZGWm
	13ONnlnVYGQlZm4SF55DrlzB/m6GwOb6DoWehkMEP9Hzb3hHxWld2fMEvLs9RuXhO1qDRGT4zF3
	CHLAMBHbdoCFnejHdxaeGweJ3YdaumemwTd4bYPRoJPX8q2vMu+LoGe8Vb6IknUROu3MywMoOdf
	VC1UGb2TmUWb9iIUX6NnBg7UbSdoTs4ndFUw==
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr11726541b3a.38.1773750527674;
        Tue, 17 Mar 2026 05:28:47 -0700 (PDT)
X-Received: by 2002:a05:6a00:2482:b0:81f:9b4d:e029 with SMTP id d2e1a72fcca58-82a198efa10mr11726518b3a.38.1773750527187;
        Tue, 17 Mar 2026 05:28:47 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm16654056b3a.34.2026.03.17.05.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:28:46 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 17:57:57 +0530
Subject: [PATCH v5 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-add-driver-for-ec-v5-3-38d11f524856@oss.qualcomm.com>
References: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
In-Reply-To: <20260317-add-driver-for-ec-v5-0-38d11f524856@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773750505; l=1592;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=F4VqrzakaV/RHQ3yEPoFZkP98ctNixvxc2zYkiOSj+w=;
 b=HxjpBIE+Hi1s9KO6JtdKIM84VvhJi2edCNRGEKg2tTyJvj1ezKA3zF5xgWlQAWQuu76+aY3+V
 Iyg0pykm4duC/wY166LpP+wW5jmu4LFVb0wLIPKgos58Ivp+g1DAM2B
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=fJ00HJae c=1 sm=1 tr=0 ts=69b94900 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=QoH_nSX9lomw0ZZp7d4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDEwOSBTYWx0ZWRfX9Rc7nacPQdgl
 hLwI00Jnw+BCa7Wgp2LAzpkbQuJPSKIcqQOiWySIgKv/kpF9ZrxF0Epb4edU+rbcUSEgPYxEX57
 f8Na71ZFqv/58BPnKK7pCjdtbtv7UWTl+VBSlehaT415GMoouMexrys1qUtAYXLXdSEopVhEvdG
 Ndj9QGDQvKCP2kx4MfNxH8+7Chyv273BOQ3jLpluCndy8NgTph8CKggMKQ7uPskmjVO3WvIQeft
 S2Xnzj2OZIXF47xsKkn2yKgerNSL0fUjV56w7e8VfLEVqvwc6elJPTBjW426eD2Ds86G7iqwFYn
 WR9Upa15b3yIdp3qk9nuW+hm7HKTjoKDkCd6NcKS5cHvaHDhnNpVb+G1naOeFEcQawXcrwjxEnm
 USGF2GdaSsv40ZOgdXL1af3zYGJhB+bw6luMCwQTm7kpGzCp1EGoA3vogK3dU07Apz/8zs+Pzrj
 CtD7eyuFUFkibArviZA==
X-Proofpoint-GUID: Pdlj5Ifm-FD53zsounPNmMp6Gk_70-5Z
X-Proofpoint-ORIG-GUID: Pdlj5Ifm-FD53zsounPNmMp6Gk_70-5Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170109
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98160-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 573982A9E57
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 877945319012..ae24af25aa6d 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -367,6 +367,22 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-crd-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -490,6 +506,12 @@ &tlmm {
 			       <10 2>, /* OOB UART */
 			       <44 4>; /* Security SPI (TPM) */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";

-- 
2.34.1


