Return-Path: <linux-arm-msm+bounces-97414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QGR6CX/os2nZcwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:35:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BECE28187C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 11:35:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E452630338B2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 10:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B640E33263F;
	Fri, 13 Mar 2026 10:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZGA1ALx5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VH7kGVaV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACEA35F169
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773397908; cv=none; b=X2j6RKbKnPZyWxbWaVNVoB5PVc+xrCt6Hhk7Uh3F4+ezuBPRi03Vz/fs+P112cfV16oBq8Ay3CaCr53Bv3S+eUJSjMPFqdVc90g7eB7CSEnmeRRqzadK0s67uZmEvhmeS0HdPnZf29+T9NxiHhihXjdxEhSWUGxCC2YqjmofDp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773397908; c=relaxed/simple;
	bh=xldEZlkL3TP9FPHEHS9y1uxnS59IKMaOFivpS/3Xf5Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqzYqjGUipCD30zM2u8MRG2TfKIVbSCTmuedptr+DwBATFreAZXSVUDbwcjX+PGWTCVV/6MJ69tC7k5zHqZEPF/zu6FGq4qkFnRT1kKx35meFcAMnWweYvQhdJ+0lSHAKUWghlT5ronqADxVDmBt7ojiDYkmkzwyLzkDz3wWLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZGA1ALx5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VH7kGVaV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tfkP3342548
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=; b=ZGA1ALx5Nw7NAUxf
	iHavz+RLs5A9WQ2kmgGWiRoC2bF9OyWSvNKcb8OALU7DXspyVI83E25FYBlu3bjy
	Gs0YLQTYORE0SUWsKE0yng0MoRz0rOHjN4XNjxDXI5qAXx8Me7C1NTkENe6DF6oi
	VpX+kqbP6QNVqdHvdzz0MQZbToheT1tvk2Swl4f0MGwNv6rhe8sv9KyyiIYOeUbT
	JwmUOABlwtn4f45DvwW6cHbLceexvZ4gqGFTeir8x2tx+LTeUuy8HE8VbkXcbFV1
	yEQCGaX9S9J5+Ob2fXMORuMEWTAcqaGmmi4FWt8Jv6o1tbu8wiUpFvJapYTC/ZCf
	cVucuQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w4d6t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 10:31:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso1485636a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 03:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773397905; x=1774002705; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=;
        b=VH7kGVaVQu6lwZ32yAe6/RobbzO4z9srOnLeyCGXD8zaZulRMx0X3Pih1DC14LW9w7
         cS+DyJXbV/DapVQMCIQQrOOZJn/gmE54Dv046cwT7WlEKSmKCENoe4ME1SCBEjZ0F2rr
         77Ewogbmgbr2nnDlOAcqn//K+9/XogGEQ9Kp6HjHwYxeDk1iVYsHNqt/Ns/GpTgSeeJf
         LpAsbd42gJvrGsycxx9yX8snx9e2WA7QSM8wj+lqjTg7rv7RwpwzIL0pzp6lpgpTpgPl
         KeQjvQd/tE/A539d7qn/jM6Q4/5/FPK+fYFfhw/+tfSPKcM9zjdGIpxkJnDaq0zePdMW
         cc1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773397905; x=1774002705;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Xvn1JCUZ0cwf2oMk92ZZMfp11uTKnNctokTsra0oTI=;
        b=htzZKVgaaIKWyRdIfSvaT56iM+jgrfLGE+mh+MwdXzMfqLy8ePcARqKPFMdyxJZmKf
         +36tkBFbTmRfPHe0q7W19V1l2+C3nEO29KcgjXJ3IB6EsU3lYOFunAZBUwOqu6W7V905
         7TKOj54XGAebPrKR4gGL+x9jcW4Sn/6jPlz1a7AfaMiYnnbnhuDGGWlSojVi9T8Ww4sb
         sGUQg1d47UQED5KnqRkb2iF1xgROoBDsoBq7VD2VPiuNFVWpWqvCxu32VpReU87VcKOt
         awhuiZM9nsHyKhViMi0mvGVTeMj2AnHvC6Jw80VJt/3+1+D+Sc15HuArnxogkrCo4Exi
         tFeg==
X-Gm-Message-State: AOJu0YzKW1JENyw7TVUZdj/YZ8Ys0aX+mes1rUZUu0i+9MLDR9wWb+v0
	xkyXSJloROavHQ5qoi5EEJBDU/gVHjkc2u3dJxOb3eRNpXqgZv+l8tyH9Y362o4VhiiQvHV+SGR
	+8DdyocaAQ6nUPIn3B5xN3NcCufSPFmSRCwMjMLeeje0d08eUXks6pA6W7WPFOCTPzRgR
X-Gm-Gg: ATEYQzy3C8nJffaISblpDeo3Aqw34u0WgrpJ/dKgPIxhQs8pYeR3K3aUBpjiT5oqbcp
	idjJB2uEZ8qvsabJcZBhork6Y6BQzcV12mR/Hj9eLz78MjsyZZ4WSM1BaBvydjG/wXx9YSzWEvD
	Bmf8s9xGo2ChGjn0vez50DjzQjHxKuAeAwBThz7Xri8FS9tq1yw0oQQuTJDIYbqHLkitBHtTulB
	vJiPcA4w9TFiFU1BkUTM0F+7oMwxaWyxCHkXJnissJ2cpREukSqFqYAUDce7kNNIW7VoISsCle9
	6sebnd15WZEDsw28UGOV0B+sa/beD5M5blNg/J2q9sZk3Z1yS7HA8nP5AvMlv1JeUMeli0Kyoj2
	5z3+uzgNY2IHd/ppNXY4C55ycZJTTZ0fjF9fTpqqtgb+AJSl/THJdTJ3r38EVq1jmkXubJtYDCc
	QzQG+cjGUJOAzLvpgajyaNH/EVp4I5SAOhfg==
X-Received: by 2002:a17:90b:3908:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-35a22055899mr2461295a91.27.1773397905185;
        Fri, 13 Mar 2026 03:31:45 -0700 (PDT)
X-Received: by 2002:a17:90b:3908:b0:34c:6124:3616 with SMTP id 98e67ed59e1d1-35a22055899mr2461274a91.27.1773397904697;
        Fri, 13 Mar 2026 03:31:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02fc9454sm8604577a91.12.2026.03.13.03.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 03:31:44 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 15:59:53 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-v04-add-driver-for-ec-v4-3-ca9d0efd62aa@oss.qualcomm.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773397885; l=1464;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=8N7OjW2s6im3g+0cokctzc9m2ycLJN/bB2F3iLp7CGM=;
 b=f8mLTT9leD61wtzAtfCRAB5ZhTMzEhqIRJgSK/TzgBXB0qkn4ndB5oyTHwLCgLZEfn9iw0Npp
 UNVsp2YDg9YD2314Y0ezS3gznzpTdipPpIIwudiEuSgd1XxPvwmiHf7
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: v3sYpu9qqpitRgc25Etj-hSd0mjMaZ6A
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3e792 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=QoH_nSX9lomw0ZZp7d4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA4MiBTYWx0ZWRfX6OhQAbjEkki4
 8MMmnnXkLXKhdQqQ0X5uyDphtMbkuFeqDhUUBWK4lSHzOXMf/MbMLk1jvXJ6EGL9uP17OjpKUw/
 8mqeY3EqGsAKSGaKK4uVFXn6sB4aNBpSDTm3Wo2f56WEDin9ZtB88VsyC5wV/puA0/UssfzvNRX
 Iwb1YAnXt2jJ3w++KRGEjNoB95lcRM0kLx4uE+V7BVjfPB13wJF0/nQOCcx4MCdga7vliFJ19tp
 wix+5iCbDS2O9dZFL2pO/0KgRR9GSrd4Mlfvnaa5iaDUYnb+Swf8gJ2y/lz1z509Ld7bahRuO5v
 U51Z48pJn+kprCcMyr84N7lxieSki620oXgnWrYjUSLiQuQfsRElattwmJISBbQdB6/JLukER53
 Jgle/um9usWSd5v2+JQfkF7G/zRsXB7AejbkfCEnfLnQocaLIdcHweRP57jF2s6I9OaToE7is1W
 RaFBRMn8grsWzdPPMWA==
X-Proofpoint-ORIG-GUID: v3sYpu9qqpitRgc25Etj-hSd0mjMaZ6A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130082
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
	TAGGED_FROM(0.00)[bounces-97414-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.0.0.76:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BECE28187C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
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


