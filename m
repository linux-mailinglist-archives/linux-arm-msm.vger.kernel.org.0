Return-Path: <linux-arm-msm+bounces-95065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MFEbO2SapmnfRgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:23:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D1E1EAB8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Mar 2026 09:22:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E31503030503
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2026 08:22:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB02C388E62;
	Tue,  3 Mar 2026 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOUU2Ew+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STU/N1Gz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D171C388E65
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Mar 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772526137; cv=none; b=qgveb/iifwrRhtPYaUYIdFPkBx2LQE0QM/WZosL2TzI4nazMIhJktfCtrabRjIxJOoUPldtmPOwfyPRB1JG7amMhttlofgV4RJufVHTl5/wFATaLW8G3iBu9x50TjHeyCDDKWVDHXOv2YpZPMFcDgAwDstpTjV6y6S3SS8p8mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772526137; c=relaxed/simple;
	bh=xE27GKOEZNSjN+Feisa6XAswTITuHEQyfmXjp3fQCp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pp/FSkWoz+N4XTl5qGdj7IvqRNiSicF2IlCd/SWjRQhV9oV+t/D2Clo0DyPpUm6OIvTVwElsTx3CneLB5pakjXGNejoSEM0znuQhiy4RTJgIGfufKqn1JdMxoZYQLpHiG9DFZWLP9qN9oWNq/6V2yT5UIDQraq9vyXW82gf0oGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOUU2Ew+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STU/N1Gz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6234AfGS3561536
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Mar 2026 08:22:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iHkM4RGWTav
	hWaI9jNKz7pqeCJ9VcReMw352uYGKac8=; b=hOUU2Ew+I2A2AFUAgKHznZCkAgX
	d5K8bntcm2+OlEav/coAlExv496Flcgi/+svb1OWl3jfs1c4W/7LUxL/LCsXhMtF
	Pk9NTMMl9VEbXBx5ql0wQYSEgrL6HKZmZX7d2n9ks3dv5pejaaQSixHYItr4ifwd
	uAsjNfri0ZXbvpBIk3+IOWg/HBxkw7mJ+SWeOI7VBnVSl5F9MkUMPixNM9kJo7Mt
	Gua7Ylf01nwUBS1uMspQpZrnNOJi1CB33h2d88e90dkXrXpidzx2fCXz6J02x9/H
	+iIHcA47J6hXXVLIMuO5OB3Rl3R78eC8kLWXhjq6LL5WFatQlEwnM29aQew==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bvbwx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 08:22:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35449510446so5061287a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Mar 2026 00:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772526131; x=1773130931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHkM4RGWTavhWaI9jNKz7pqeCJ9VcReMw352uYGKac8=;
        b=STU/N1Gz32a3RoJz7fu3F7OpoRb+BGw68h3LU9j8RddAkuk3kQf00Zw1Komhd2VBxq
         +N8jPJ3RNz2S5idGFNS7otbMQ3KWkN5FHxv8KAIwaTWW480PL+QnTDPnQaKvLMTPYmKm
         up+Zk3rpUpQT+Hy5zz6vMUtqcTzhvVnSUx31p/d94QFMXWlbcBAti/8HXAUKIJa+91nj
         kmHAnR5CGtgl3wR+cOzi0g3AhDT37OyVPKH9izWC8OPyicOWyMfaKhsvqQ3w0c2H5vMG
         u2SvfJg3GzP4WztfjxV9kTQvyVcKwtbKqNX3/BzV71EL7HV0iJ/Cz0dazVgVQOZEgpz3
         N25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772526131; x=1773130931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iHkM4RGWTavhWaI9jNKz7pqeCJ9VcReMw352uYGKac8=;
        b=nrhA0ijCuyBaLc0IFCjuROq3N0rlxPgAxnD9QdHd9Y5SeFu25A5+d5YlB5PVPIlChK
         lgX2ij8vkHR7IjpHzFsw/RwB6ADSKzHdw1LzOrEa7UQ4VeWbymnWxUNv4DJCaN/9bANo
         S4rADu105iJ8vLD1UV3CaTlqDGDBcwX0ybmwgX16c2m2djGGMccXGItKjUo7tB0jqSk/
         B3VZ7OwVU/sUxrYgoa98ahbcDl3EMAPvZ/b5Jnt88TPOLX4dxOZF5QdzgZ0zh6qdnzUr
         LNGhsTuHrjOfbhSc/2jPywbqLtJYM/Kv8rG9wyM4VH+9uOHpVXEs3HiV5ufm3XvWs2c+
         DT/g==
X-Gm-Message-State: AOJu0YwyiymfLJR2WEYJDre3pOvwYWN927TjMJOYrxzGwgtIfhqSNYa+
	2AOeEUb9Bplpkpd89UaaInUhHL9KjlZFoNxVq9OXJuvBiedlYjHlmE0UOhe4uHUsNiXsmdq+R5d
	n9QqPMrppmoumZS5Vvah8kMndNQGhb5TjzG17iVfQA5yX0+oLVUbpPzEqK22h8eSTQwj/OM2uws
	M/
X-Gm-Gg: ATEYQzyiN2knIPBMf8bjvISUKv/duRgsQrwr6fFbmCDDPypWfAWoDU/sHNMoQdixSKy
	jzk1A5uqYyvtThJLJI+8dJd8VCZ6DJ6+ezaNeB8munFKUtr1nM9iygs/uz0Qf6gJmoQRyLhpM/6
	rVb5ZD91/53jupLMG+ZoYTQYhiAaRvi4uea4sST9TDqPWon5/YpP+Kx7p3+vMcFrNM9SrFpFPwN
	2XA1TeEStp7Z25cpuxBJ4HS3jGmJk1yisFLBYEajwPtwqQ3gDtBTj3V0psp3eRosii4bx9mG+3p
	pVZyQLuGJiTwPlVAxyyH9I9nTuqWD53TQq4eRsrYDdSURjU69PlKkNWKNnRm0JxCf/PtkLrJyKF
	oWg7RBjwcQnpJJvFCPi9vcPXaPBraoCvwRIMnsFBrOyPMojcBvARyG4g=
X-Received: by 2002:a17:90b:5288:b0:359:8e5e:43ee with SMTP id 98e67ed59e1d1-3598e5e46cfmr4703862a91.19.1772526130438;
        Tue, 03 Mar 2026 00:22:10 -0800 (PST)
X-Received: by 2002:a17:90b:5288:b0:359:8e5e:43ee with SMTP id 98e67ed59e1d1-3598e5e46cfmr4703849a91.19.1772526129992;
        Tue, 03 Mar 2026 00:22:09 -0800 (PST)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4e2f85sm1797214a91.17.2026.03.03.00.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 00:22:09 -0800 (PST)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2 1/3] arm64: dts: qcom: monaco-evk: Enable GPIO expander interrupt for Monaco EVK
Date: Tue,  3 Mar 2026 13:51:55 +0530
Message-Id: <20260303082157.523847-2-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
References: <20260303082157.523847-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CHstAtl1aKyws2ch-5DUmOn0qCEB5XB5
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a69a33 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=eeKseBlHB-RYfX28oeEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: CHstAtl1aKyws2ch-5DUmOn0qCEB5XB5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA2MCBTYWx0ZWRfXzRoDkGP/rrgS
 uacDoxkdT5OsVdSBDgh1cb0GPoYBFgOjZJLdCEm9AVYV72y0cDPqeKNai2q0QVebf3Do72/3IsV
 GMbVKh7Jct41CX2QYgZ/CgsgKQsCFZa33XEfP+966LiiXAbwRJhzftFKjLB63UgldbJ7Yq4mWbJ
 oG51MevTQJ2nUpRS5QbBxD5Nz6XRqzam9zHvVI5xWdiBMk9Aq2aEG3FtU+J4c+PilTwUxcuwIjc
 kVMdsFKZ28XTUoCBxZCCG8zPD1IgQZyfc+c3CK+04hQrW1DQCjZBsMgKL2/vdPkq2O2yLL0B8Wl
 3T8KT6BXmNrP3FkROcY0xwI3verMiwTw3gIWQbLNGBcSZxoHMavDKhbX0BJ7s7SLVXZvPH9MJga
 ewMbSDkfJYzuckQv8Bjn2ZUDOdeiK5dFEGRM477Stx0dzHfauoofIWtpjqvaYkzLpjE32peoQ6P
 7E9MMbgjHMj2rb3A+QA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030060
X-Rspamd-Queue-Id: 82D1E1EAB8A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95065-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,0.0.0.0:email,3c:email];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Enable PCA9538 expander as interrupt controller on Monaco EVK and configure
the corresponding TLMM pins via pinctrl to operate as GPIO inputs with
internal pull-ups.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 77 +++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 565418b86b2a..03af9bbcacc9 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -362,6 +362,11 @@ expander0: gpio@38 {
 		reg = <0x38>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 56 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander0_int>;
+		pinctrl-names = "default";
 	};
 
 	expander1: gpio@39 {
@@ -369,6 +374,11 @@ expander1: gpio@39 {
 		reg = <0x39>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 16 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander1_int>;
+		pinctrl-names = "default";
 	};
 
 	expander2: gpio@3a {
@@ -376,6 +386,11 @@ expander2: gpio@3a {
 		reg = <0x3a>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 95 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander2_int>;
+		pinctrl-names = "default";
 	};
 
 	expander3: gpio@3b {
@@ -383,6 +398,11 @@ expander3: gpio@3b {
 		reg = <0x3b>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander3_int>;
+		pinctrl-names = "default";
 	};
 
 	expander4: gpio@3c {
@@ -390,6 +410,11 @@ expander4: gpio@3c {
 		reg = <0x3c>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 96 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander4_int>;
+		pinctrl-names = "default";
 	};
 
 	expander5: gpio@3d {
@@ -397,6 +422,11 @@ expander5: gpio@3d {
 		reg = <0x3d>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander5_int>;
+		pinctrl-names = "default";
 	};
 
 	expander6: gpio@3e {
@@ -404,6 +434,11 @@ expander6: gpio@3e {
 		reg = <0x3e>;
 		#gpio-cells = <2>;
 		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&tlmm 52 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&expander6_int>;
+		pinctrl-names = "default";
 	};
 };
 
@@ -495,6 +530,48 @@ tpm@0 {
 
 &tlmm {
 
+	expander0_int: expander0-int-state {
+		pins = "gpio56";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander1_int: expander1-int-state {
+		pins = "gpio16";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander2_int: expander2-int-state {
+		pins = "gpio95";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander3_int: expander3-int-state {
+		pins = "gpio24";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander4_int: expander4-int-state {
+		pins = "gpio96";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander5_int: expander5-int-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	expander6_int:  expander6-int-state {
+		pins = "gpio52";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	pcie0_default_state: pcie0-default-state {
 		wake-pins {
 			pins = "gpio0";
-- 
2.34.1


