Return-Path: <linux-arm-msm+bounces-100254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KeeOcBYxmkrJAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100254-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:15:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 250D334250C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 11:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2F9BC3043891
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:09:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F09963B9D8F;
	Fri, 27 Mar 2026 10:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZLN0aVu5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="INulmRav"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678763B4E9A
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606128; cv=none; b=IEMgARlAMK5oNw2RnuJfnAdeCGVoqHM0Fy7r3HFratkDX1qsFMIs3k+ZdLZ5naDgl6hCC1y+LWrLwWXTLZ8S2tC683GVcrOL1BnVDQn5oa8sQNBvRjGCR4vxBcXeddPx3gmrQqmE4fHhSSLs6/1hra6mnXU8u/6WTDZMvyXXaEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606128; c=relaxed/simple;
	bh=CNOKzvn5kD0XReRJC8TJ6vbCACz1YNhnjP6JoO3Pr4A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RVwgdrTV6Vnvp0ujs2cMNreodF9Pu2B5J9BbGc8XCa5ukCCa9GB7qQwgbNryDpbfRArrs0l1G1ep1fpyyk2inJhKu0Vofp9sKaACsxfHsBxLX6yN2I2sOwMbAQVUryX+SyO3wXel6gRyM/ptpvRTa6oVpJrDj0O19yjBef/EEro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZLN0aVu5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=INulmRav; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnf13713693
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=; b=ZLN0aVu5bbmI4/nb
	I8J509pHJtfZgwIMCOkHBBIsc4K6HW3KdOek1M/M0eCCIDfGiVmNYMBDxXxzqEOI
	6uxPS4pbqVWmqFxjSeugz5l8R0RLiXUAGT2fj2zUunoS4h2yU+KH+WVM6BFLcNj2
	KfVrCyqyewuJ9kozFvKHLPEq1G5X1WsC9gsbePs1DyUCd6cUdhMAT2TSqZ9WvIMd
	CqQRz4AdmTDyuifcRGFl0k1yxXbZGn2Io/dz/fa/ttsW4K8NK9dd84U4OXLQ+LV3
	VFmSQ0kR/epfWJXvsS+fHjAAhP9TjxYG2YJnHxUeC/TtEQLck9Eptyq9bocWrkoi
	39ZhBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5hapsmfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 10:08:46 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b0f4e632caso5439005ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 03:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774606126; x=1775210926; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=INulmRavt+pUXJ6kQRq/+qlPqkF17O+cAp5JTKTg1UmKAim3EZTqGMvUSFB8l+M0ER
         BS8GjuKyAYomQK76tK55F9efk3RVkgUOWJ2bwOaW5IlnpBsVk8fGZE7+dqWHHdGIyQ1G
         WUrONg9a6mV94NfBB5Lxpy5+ZOWzBZRcOHyIB6LL8NjmlxdF/PHjlfSj066XE9vwYxqV
         0FEUebTiOo/1OTPH1gWAounRjQYNkUaYxJrj5yHDd0DTppBs2SBDTcy1Vwi6f27roikv
         H0yLOI+nWx6IWHEn/XeZRkxKRpPJWL/ZohDAPxf9zSuMoGT+90442LcpZoRrqoMy7YzB
         uiOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606126; x=1775210926;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7P6zhpcLFC6aPfvZXVad/0Nrsu/6r+qZ2S++aXiCT/I=;
        b=mqLt/6tdhdEKQO5n3VmsRq4pcu9MONfOnAt+swFvoV9/6WzqKhba0K9yNnh+lmKPi1
         5AgMYlyUEJG8Ijx/hrYZjldasfIugR9mlSXUrqQjgeMkFcI85fu0mqEW5ISYlwyGxky7
         bHydPR/AJPCC9fSzuUVPaCX0QbgaCKt9h90wnozOSb8+doyy5dna6Dm2gRgZR2pcyYxk
         0ySQDX/D0bIekGNxurftTSG7XBiKkxHd+2fg81Hb3CeIPFXwmxrwtaHH7zZ80a0d6plw
         yAggRrO3PyAuj6wEWwoB+fXN+9/2Ej3lb3sAwhb4YqapyeiCFE//8vPDgWOm4oopKWXD
         Gwzg==
X-Gm-Message-State: AOJu0Yylv8lV4gM4NS23lhTkRLUIm+tXHBFL5pi1dP6TWrp46OonZyAZ
	PQ/tGmEVJIp8CoASBPhqyJWzU+13zVYPX4Z2y3H48C201zZfG2DSyc07zOguZOCYtGmeUfxZ7fm
	pQLm6P732/ms2a8D8ng1NCF9er8GXnPLlqicA2SQufgxcss8P2Va6VQ5idqfw8WxVHvTqQLsqf8
	fg
X-Gm-Gg: ATEYQzxWdiLv+fXDURvqujEt1Us8pi86iug72D+9GoMGszr6xgtVNgoF46kJlabZzZs
	aRqLba6btqnaoIDC0/TjH3EISWJPiNTR/Sh56ZW2VZQN6jCsSLejjN8GVhgleeEyFCqpgOFlieS
	E8I/Qk1o7HFZkh58zSy7Vp+Mcq8Rh2ul3MTk2VCeCyKB+1EStjqxRyreEV/XV/9dp1nkAb6t74l
	oLC6kPha60x+W9RMlcyG/XJ54yzITSSc52KJIo9/QUaAvU/UNk6+l0FVIGwadEjswhBJCAY0QgD
	ok78j20MknpCNai3TgYBaygvrQRqMcIwWtOlqa9rzQYnd/tKc82UTDkzxlbQRuz5iXlZMzcLU8u
	CGmBZD/r8sGEjtQ7B2f1FCrZx6yqQ2f3U8Jn4f72R2O/tKht58zEpje/ztgX34oH3GRSu/7idoV
	nffg28pzoqB54ItJRIjqzD9KEdY4TmEgl05Q==
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21795785ad.36.1774606125277;
        Fri, 27 Mar 2026 03:08:45 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr21794805ad.36.1774606124738;
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
Received: from hu-ajainp-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc786b7fsm74465675ad.20.2026.03.27.03.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 03:08:44 -0700 (PDT)
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 15:38:17 +0530
Subject: [PATCH v7 4/5] arm64: dts: qcom: x1-crd: Add Embedded controller
 node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-add-driver-for-ec-v7-4-7684c915e42c@oss.qualcomm.com>
References: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
In-Reply-To: <20260327-add-driver-for-ec-v7-0-7684c915e42c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774606096; l=1504;
 i=anvesh.p@oss.qualcomm.com; s=20260313; h=from:subject:message-id;
 bh=pXx3AWCW1rDtKny9OmTAQa5CSZy7BRS7KSH0ZkBzrwE=;
 b=Fgof54/yHZmx9D9yhtZ8gNlARnkAkDOMYZ0K7Xn9LVlywkbmqZO2RpZIW2JpXwz6ZZT8Fcdnu
 5B1ogQt6MyEA2N9bMsC3KbiGn9ZRUUZyO0ohwVfNav07fssLsFav5ul
X-Developer-Key: i=anvesh.p@oss.qualcomm.com; a=ed25519;
 pk=8o9EG7gkPe2Er9y9UVCx8MTdcFCwU8Pa54hBZPuduXE=
X-Authority-Analysis: v=2.4 cv=TqnrRTXh c=1 sm=1 tr=0 ts=69c6572e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=gaXMZf0GDK_To7W6ZIUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NCBTYWx0ZWRfXyyVk0x+/HW/4
 S7+dcbEJ5IUHpHoJAgRX2w4Ol/rK2QtXIpOtmKlbQ+/0P1HxkfT/rqsjCH+FDXOFN+FzCBD1EPY
 1EkrQQyVKb0A5y3oAz6fxwxo9VzvGpgQz/3CDGMj4aGFaBcCgJo9nFC4sO+60m9a0t1Is2rcjQ1
 REZtejaTw3CqODymbpKO7kW8/h7PA93SRRHt+j+EkKM0TjZnhDQAUh9HJx6G8jGGm3blgc22QK8
 GyIe0YL/Hhn5parNp8eMD8W1UjTrS4JeqtHuCWnsdLds2qN11Y0Qjwf7GYhfoR5PMrHuRQZuHEk
 YcVqJ6vwL621aR0chGiTXpyrccnWYFjgf7fltXeWUAXVN2wN06zrN7yOBGwLUEKSil1yx2rqJOv
 XGItCSg3QkyQNhJl61RV4DquWLOgTKtBpGnpUCfiJMD7krvOa9QcRLbHR4P+YRN568ihY6IZhLM
 aaEdJ4t5Qm0UZyTTKtg==
X-Proofpoint-GUID: AM8D567CXVqzzLFQVmrQkN1PshgwgEGT
X-Proofpoint-ORIG-GUID: AM8D567CXVqzzLFQVmrQkN1PshgwgEGT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100254-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.76:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 250D334250C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Add embedded controller node for Hamoa/Purwa CRDs which adds fan control,
temperature sensors, access to EC internal state changes and suspend
entry/exit notifications to the EC.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 485dcd946757..1184169f49cc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -1074,6 +1074,16 @@ eusb6_repeater: redriver@4f {
 
 		#phy-cells = <0>;
 	};
+
+	embedded-controller@76 {
+		compatible = "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &i2c7 {
@@ -1517,6 +1527,12 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
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


