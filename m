Return-Path: <linux-arm-msm+bounces-106921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMwkFNXQAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:51:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A450E3BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 14:51:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E479C303EEB6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 12:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2DC73A3E96;
	Mon, 11 May 2026 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ovu99Var";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hO2p6hrB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 707A03A3E6A
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778503494; cv=none; b=jXSQ0QUHjRQPFm/IXwy8mwTMkeyxqexR79gsSn5zlT7W42XSq498jC9vPPAtrfk2O3WbHxOEL0NJ5fn7RBYRwmzZEG76vzauT5VkNz26XneYKgvz9NgWV9JkQh1GEfBsRyGZRlabTXzzO+uqVkNcQ9wMHtTVzpw0bXci0zw4AkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778503494; c=relaxed/simple;
	bh=n3Dj9ex9DeD+L+lQKKQOUzTFyrR50tsgxLyyinSeV2g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j5WdKFkStkZe6kEG0Ql0rmulTb7xeIfdkt4LCZ8pLHaE15qMVBaeuYCJ1EB48e9uW5csdPa67JW33VUASTF0YT0vK0dxW3qR/PyALBDrkMP9HDXkuhu5WoKAJSqcvwmT8fpuuWSKvweYMkder4XjJX+Z9TfsxsB4qtC/gVskneU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ovu99Var; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hO2p6hrB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BC4S8o1106952
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=; b=ovu99Var9NBTyTxH
	obvOKSasUNEjIzLpVq9sQKNXX+vjb8Rw3h5/6mg+JAn9jWEcEuFGE9sYRzM14TmT
	9vFJOm3bRzcS9ksXNI8A2JZQsz0cogO3G2zCSxJ5Pd3Q4qjh22AELMj3ESSiZKVR
	zMktBxYUiyqW4jJB59FomSsK9eiFUcVcdRVvg5QgZ+pK6ms8yUFoNck51Splk0A9
	FETR4gDzX27U4L6xboE2gozm9W5cU+cFtzel9+kfhIBztdZTsk/+viCEEex6QxhV
	wiyixMyxUMjZ5umUSpnlF+ma8fYc8Hc4iF92j7eqNFBd/1T6aWLPaxArelJ1gJlA
	jnbRdg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3esr83r2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 12:44:52 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd5e373be0so22093407b3.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 05:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778503492; x=1779108292; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=hO2p6hrBearv17CoeplkEsfYrq2k8ie4xs0RGgbQeGuTIAjEqiT4qNREWG1Ma+5Ha7
         yKw6D7OkfREPWhfUr9GmxctZlMVqCK0eJU6chg7MHqQearKsa5lEKE0Ss4R9GfuPsAvm
         cB32mhfXyzIwOgkm6Jy53P+S3SNEvagaMTLMbInFPUZqboMYmrKEQQjOfb1v+S2luD/q
         pyfQ4NJoXWhV/M6uVGom0L5tbkCYhO0mfy8nyd39z3fUvXBcsP3Lf5guR7e18/dfcd8w
         R43wir86YSq3/iMU+oIXNGbomUFDhGpZ1tQX+sxcyrX0Vl3TOXwYCbe1EuYrxaDyz7mg
         C9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778503492; x=1779108292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SwpSnd+xI/zib862gFlteSCwOFEFE9mObuftCHljYWg=;
        b=VMRl4pekKerXHWysAOkoOMKw9HM4u68t5sHJqjqKzIBFGJ40YvHWZFFSTG8aJJhTVN
         290ghoSX7c94cnJ6wBZIMMbLgHH0KcoWexYISVpxwLEz7uaJmoxuQONB2+zZ1DlaqEjb
         K2Tt+QcnWZxeL5axT91p7GpS81gilAp3lhuqqgxrSU38rttQUynNe8+EJ4xGy+ZeaRRM
         c4b2nYhrCBi3MJCQNqw9Cl7aovYxSAKCaeqekRDz7IkgMyYmEauBTPOxboISeZP3sg1f
         6CjqFgTqEILsvbpa2eEQHOTvZhlhV4fgpVdTa1u1oX6FMsrN218WZb1DnhmhNLQEA1Xc
         hCgg==
X-Gm-Message-State: AOJu0YyHwvKNLyAAZLIs1K14Zd/ALMSE7el3QFLPl4NKCbKm5gKsKcmE
	t5HMYNDQrgI8J6QufGrBg9emCK/f++eEGAygGtqZH09F+sYvtmZC50/s/gVyX028jOyx0ne0mWM
	HD32nEtNP2MMDAIr75G+47CfPBR3vTAdo4B942v87H7+XI0adBZcPofVHpuifbPggUox+
X-Gm-Gg: Acq92OElpzTcNdzqiFD/vUM63i9Bo8VVgTbP2WY2zO730CATahrtYhyEoGiG9b9JWcN
	pYo7cV5NEbJ5huLEGU5d01wqNYmmrJYrmqZImkCK5mTtuGj3uCYNuAnPXPGOuufODJwNO/VJ5pi
	ynluKLjGvlkEDGHAFYSH/Xp4jphIziiBiaJPh0pRtGZs6gRuifVUdZjQA3oNG/lZ1MRtQoNC/ud
	luEeJRRUxQDyjigrwq1/Avqs9cHg8skUybC3XJiShsS9oECOJYNeMmYkK3ZCK8tlfR3Fcx4IHtP
	0H+ai4UHGvoL3XRaADBKFNlvtM8/tmI4poUW3BZ7hdE89MFBIGE2sX7UIfNOPf2f4WdPD2g7jUN
	O+RFGuHOi07rDr2T1/w/jVhmyj4s/79BATZ2YefAYKL0AOrJr7L5iVZDWR2zoAcd7x+G64qSrNW
	n7icmnqUnU+yawNWUztc3bD9q6wMPOo5srlw==
X-Received: by 2002:a05:690c:6f06:b0:79a:7157:879 with SMTP id 00721157ae682-7bdf5f37cf8mr236305297b3.50.1778503491710;
        Mon, 11 May 2026 05:44:51 -0700 (PDT)
X-Received: by 2002:a05:690c:6f06:b0:79a:7157:879 with SMTP id 00721157ae682-7bdf5f37cf8mr236304927b3.50.1778503491111;
        Mon, 11 May 2026 05:44:51 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6683794dsm149641717b3.27.2026.05.11.05.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 05:44:50 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Mon, 11 May 2026 18:13:21 +0530
Subject: [PATCH v9 3/6] arm64: dts: qcom: glymur-crd: Add Embedded
 controller node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-add-driver-for-ec-v9-3-e5437c39b7f8@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778503462; l=1650;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=3BLnT5OTOT0qEyowVKSfm/R3DNxg4MouTyG+K4wg5xE=;
 b=3CLxLKMZWjYGcc8sVDt2ljebZvhb+xMrUwE1NMhn0WujeBJk5jz/RhBAnqhUVZ4F4HDJSNICu
 vi3oWU0IO0aDmLIQiQI4vmd6z9Z+AMTHQ9zd2TtSc3L37y15TmRFfiA
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Proofpoint-GUID: Ivwn_5YspbTjF7mctd5yuccWnhXASGsl
X-Proofpoint-ORIG-GUID: Ivwn_5YspbTjF7mctd5yuccWnhXASGsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0MSBTYWx0ZWRfXwNyFbKdsbbX9
 ZJIpViUJem1t44XxcfbKbx7ztsJnARWeh72XdJMAATzFUfjfy0fpUyu+kgfZaH+tEFe6qc2x4co
 bEteZYLN45dihcM6/u3aeuOoRX91ib4zVLwkdnnPBgvVxyBIsksGx38OCptc4rN2/pra5Q/W+dL
 9N4RsYyoyPF8lqOkKred7MPRXBAWBqd+D3J4A4DaPyBRnWK3uapWhYh0rnNtvH88Nc04f1d6cdE
 riaGBLgo0i1efwV8Q/YDFukCFf2w42QeO7bNbxn2RM/3iwUI+Q/m+Y+fCVzFdGhiBqjyBKt1tTA
 awGVhcWjrB6XPXM0iNlven5YmZdu+NkyHNAhi5FbWOlsSarOgmb2rjzy+HpwXDG8u35lPAAFe13
 iI7X19rxjwMFa29BNMZ/hhxe4RAyOnmxneWcvFaAwFxYbU0ZbxpY64Le07ZyKN8uQQz65JGfvUB
 tRxUpBS99/MvjYXCQvw==
X-Authority-Analysis: v=2.4 cv=G40s1dk5 c=1 sm=1 tr=0 ts=6a01cf44 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=h-fhkJo0eXD2C244oGgA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110141
X-Rspamd-Queue-Id: C34A450E3BE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106921-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.76:email,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Glymur CRDs which adds fan control,
temperature sensors, access to EC state changes through SCI events
and suspend entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 2852d257ac8c..8f684f3402ba 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -433,6 +433,22 @@ vreg_l4h_e0_1p2: ldo4 {
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
 
@@ -565,6 +581,12 @@ &tlmm {
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


