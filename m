Return-Path: <linux-arm-msm+bounces-106923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEcKBjPRAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:53:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 522E050E45C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8ED5930C18E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E753C5DB6;
	Mon, 11 May 2026 12:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nDjNFKz4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmTlvH2w"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125CB3A3E77
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503508; cv=none; b=WYFiFcyRlFBRGRpNTeavq1+Fl3D7cLLlbYTFWcHqa+NOn97FHWzdA5Gsl8TEG2a5IgTfTqgfHt6vFvCkbrhPrz9gpW2Y0WxlFfTsUqRhipeMb+eIC0mdJjDLWVyVG8I/GFLbZgSHWxJvoRX8zc35Zw2XXGntG5GLDvyrka3rf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503508; c=relaxed/simple;
	bh=+E4tZfMlel36uwMhdXbJ+b8CyJSQUpcuObNpX2cZjj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QZNuWiNHTkmCPsWhfH7bbITkP/KVZboarm3yjzJ9GQ6z2x5DTWBMThiiwniAw9PqlnTRc59A4UKBJfalxs2COTdE7BqL7nvrm8VN2GgDGcJEcREdPVvtzfvBpVtgPQyX2q10Ijpoa81sA0uorp44W57XAk3ZgD/g8jEqiAtMBnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nDjNFKz4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmTlvH2w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7A4iC1258461
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=; b=nDjNFKz4YrY7G8/d
	t6ePcwklcFqSiNS6kr14CWfLVkcWk1QQj1PN43Qnc+bV5CIwtVPBDzt3e0vKIDs9
	/79dsIETCHCNYHZREPwkxNPGwJb+vhMpzgr1/KuBLUG10VEk73pmroNg3o4jnZ4i
	TpBe5OaNvAM1XnQlqmIkmNl+umd51z/jdhU0KYQVEQgtoRj2H4LI+rM/qf5uc6/3
	3AFfsiZ62LgqLVU/q0lFYYXxPZQ6WlU8uiwLJVIOhWNwQy/SNZ6PkUG3JQgawIQw
	z/vip9IVPPhSGMX2OZ00ewXYpD2GtEI8pTAB+9ZC2dwTpjJIg2YZtjYGhnboTKeM
	cGZXdg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ag215s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:45:06 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7c0dea734a8so17402357b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503505; x=1779108305; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=YmTlvH2wH7VREZS5xFr/F4oBULbnNZQB4WW+jnj5hG0Xhk1SD8wuQ+9nDrVxrdTyvJ
         E0yGb5mh4VQOcWK8mhQIvr5jr+FOfjml1LQarW70yWGuzhTzJM1QfcAvJOVfL67O1LB+
         bOEcMUPups4ZfnHjL3iYRmskc/j8BgBBXS3Dnzyhl7ejeNR8VTNv18a57zK7avabp6JG
         PaadSS0+X3SNSp6X2EgUCKtJJdwAghI1a9TkH3ZM/cfnACZcVGE/tz71eT/av629Tal3
         fRlm7RmC5D54OBZX002aQJ9OFaM+zxkAb2XwhS7hOc3sL7dEQiYj7FB6Tugo69bZNsQf
         b9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503505; x=1779108305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XReiQn22kMCzGHeyxP3PcAro8SFN43+wajCGNcXyMl8=;
        b=CHY/FyHpQg+Bpi8ysQl5h2aw3LV3zMmg6Hk/gOeljdB28rLVMTOBHDODKSrDZFFbYY
         FOcLlTr5nleCql4Dt7vPkmWJeQW8kLFeICnSCWbKj+SCnfwaJYzLFLHiAJih1UeBXFg7
         L/pUzeosk/xczcNzfASQg7u+dbvR0GlB+q44sl6hbflEIWv4+66syYTZoy62CsdcHDp7
         Q5ZFRW6W3JPPZunhRU05Kx/BDDVFCwNTMoajoEwpLMKtbLnbh+M3QD54Jx/5Pt5YXP43
         B9K+vqjjTSFMCit2FaTm0giQ4SNaMGja/wK3JgEKDKzUkWuHALFU0VXMCFngzFu9Nbwy
         d33g==
X-Gm-Message-State: AOJu0YzQKH3ArrLOIGQwfsIXfzB8KPQMr9VWPjP1Hxcx3ePFhPVMnj6X
	vfag75P+NK1GyfLKgSbQ6ZJOXUguC6CZVB8EbKXXl5AL11zmCBVNqfKI4N6LE3SO+dEJngKpLSo
	9ytysS55hF4bl0DKvlZMQ6WjhVnqvPkkDlhmhYQXWF1QUeyUUAp7FjzGVKlLMW/5ff9w5
X-Gm-Gg: Acq92OF8oqvYQ2FL0as0LtslDKj3wojVwZXh3DPS5aI/NL8nPWG+AL9JaP98umigZ5F
	pcqCgqPZk+VZBLST9m/77Xg+KXLEl8fa5dZjFfxQIZQZcF+PCRzqr4phxjFP1sbVdXe7p8ZB15p
	Wl6ECccRs1mQZURNTO2baNxrtaAMVGaJgSB43tRuBOyfwATfZp0O92Ef0guSO7wx6e20WooLWau
	uA79IcGDwVHgrei/7U/w0MADQruyADHQk124ztMIN66ab1zKV7FIiWPL9YQj2H6v1anp75W3ZFQ
	Z1DzLwMqbxg4I2EXAUBazonh7LHPm2AqPPPnhs3g4q86RnFqPB1XT3RSN6UxJC5FLTOaQ8oxVwl
	K8TSo4pm+3wk/sEa9KMelgOru4UTiyTD4YxURG1tSEmhBkm5N0FgjUEseZ+H2sK4620f0TNcf8K
	ayM1/t7GsJUOLAL9abRIaX0uXhpvuY4/N2NF83e2dLVIKZ
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304717b3.18.1778503505454;
        Mon, 11 May 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:690c:8d08:b0:7ba:fb15:3293 with SMTP id 00721157ae682-7bdf5dc7e18mr223304327b3.18.1778503504929;
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:45:04 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:23 +0530
Subject: [PATCH v9 5/6] arm64: dts: qcom: hamoa-iot-evk: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-5-e5437c39b7f8@oss.qualcomm.com>
References: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
In-Reply-To: <20260511-add-driver-for-ec-v9-0-e5437c39b7f8@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1627;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=v3xhy4TAVQzMuukJtx0ZPXFz4/C8vTU0vk3Dukc5Tss=;
 b=GmUcUV5QNEdwyQE3ykhFFlHYBB28J6Z+H/Hs+RW1suQ2uI3/v1jxMef+f7BvzLpuKo8M6wlhD
 RWcu87i0AO2DW2jN3d9AGlf7LKOgBebW3fJtMAk6bVtXUo1mSg4T03v
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-ORIG-GUID: _f252vIdgt7S7MnVPtvfVa5mqRMtsXKY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfXzpVU6O9rBNWZ
 ulGwqF+MUciyaUzmquZLRPOHs4DzyQekIPVgm9BkeNk3a4wVrdgeUIEqXr3EmX8/P1exHhhvliQ
 jAPuJXcuPlgl32E6aACorQX+Xd3/j+akOlY3CXS/h5ayOb5EM5evhwbVAvI8UhbLwuBIfOB0Cm8
 4kCljsffsEIUgCz35+Z7ob4MC9f5JeMEh4y2DwIzxlgrQgzV/G8bYsOEJxd4NijBZxxVYPbV8Ga
 Liu2TQ4ymSK+EhJ6LtkTO2Sz9qutS6r77qPQ4MgGx2UqgOaC6soGGJY7zyaJwwK+eSYsv4H2Cdq
 d8CFu2lEAz4BXiVz7T7WS0bU3psvH6f8YTau0fp6EUSWYsfNn3jowhx+Pc9ujbrgBukfl4KwhbS
 epXMaT94aeZiSotlIfz4MmEK9sw+orr6qfvfN5Jd2xPA11D2XK/0IJmtYXFceQktbSksrkG/PoM
 FQ5rExg6h7sldcgTlDg==
X-Proofpoint-GUID: _f252vIdgt7S7MnVPtvfVa5mqRMtsXKY
X-Authority-Analysis: v=2.4 cv=NODlPU6g c=1 sm=1 tr=0 ts=6a01cf52 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=um1wo07bdbQtbc5qrgwA:9 a=QEXdDO2ut3YA:10
 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141
X-Rspamd-Queue-Id: 522E050E45C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106923-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,0.0.0.76:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,4f:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa IOT EVK boards which adds fan
control, temperature sensors, access to EC internal state changes and
suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Tested-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 460f27dcd6f6..a0d2ccf931ec 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -831,6 +831,16 @@ eusb6_repeater: redriver@4f {
 		pinctrl-0 = <&eusb6_reset_n>;
 		pinctrl-names = "default";
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-iot-evk-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1320,6 +1330,12 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_reg_en: edp-reg-en-state {
 		pins = "gpio70";
 		function = "gpio";

-- 
2.34.1


