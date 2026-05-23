Return-Path: <linux-arm-msm+bounces-109473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HN4AKJrEWpLlwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6581F5BE0A9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 10:56:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D8F63008635
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 May 2026 08:55:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D399337FF45;
	Sat, 23 May 2026 08:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pF3do9re";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzOijT8/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA84362133
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779526533; cv=none; b=FVO8Y9kdbrogiDvVbKckJaFo9o6ATRhxMGBgtepyPYeuhabHIYOKr4CQFbRkFtlgVH+5D/QxCKqpfwB8vqrGuUJ7BQ01zUbcZ31sVNyhvAFopFUMLVXapsfQ2KzwzKxL/ZX7ms203IUVVFxIbbEP3SHDeDlM4FxbqwZJqeiMruk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779526533; c=relaxed/simple;
	bh=GfDXtP3q3Dcq71TorRZ+dyMBMVzxG86TTwppOvbQ4e8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=otMVk1hPhZgkrlsCXXt8ZX/9E9TU7Te4P1Bfmr86rzAJyEGnSY9TULQftzrL4I3EzzQugxs9KM8jbYO/VNhTZJzASwg6hiXTLZ22q6McZtJdkuojyo2CXLsnw+0bVdmCnHtG/Lb5RDp48uvG6LcsbtftqjWHSO/7nntYaEbS7cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pF3do9re; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzOijT8/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64N7sdmj1280612
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SMg/l/29667
	tIts74aebOptB25uIIPJLTQJSiapxFr8=; b=pF3do9reLJAYo/SO47Ir496b0Hj
	yfW/uGru/9LDxnF5TOCqSyUhdXGFC5dJf5YeqZ/6s11CRezMFJ38i1DxHbFQGqYL
	ATozJU3M+87eY6WugG5vNFiSpozHq/c3BheHUdF9Gpox9XAsoR0eF8Sbu0l4A1iD
	UxxMKF7aQj9XaTTbrjXh3+xlsKtMZIPVxJvrrpd8EIT/5OmKbcIQSvQjgM3/lx9+
	YkyByO2isHtP+xFlJ1LWhHDFAzz+R2kN3fD+PvIuyON3zp0x/sI23xfQhQgY11HL
	4tzZr2jfk0vr2PcPESjDjpF7TTR8R8C14kuyN/W+98AWgoFbRY6kk9w1fsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w036c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 08:55:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2bd00a65673so60648655ad.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 23 May 2026 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779526531; x=1780131331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMg/l/29667tIts74aebOptB25uIIPJLTQJSiapxFr8=;
        b=jzOijT8/DN9XOZwIem64QYye4IM1pPEE7thlfGbjaWHI5/c8qhmSaQghPCyc9mL/US
         Hbu4QmM9E44cdF6/uRZ2qrHyySfQN37K+rkNX6+2zWmrqMlLVwt21UdGCxhaXPqrW2wh
         VLBkkvWAtmcQ7Ja93V1Xnv+AOyD9Oc0BqFzTRn/B+tlMlapBObfrvEo4KqfGZw9+MSi1
         MpGnqjpUuNz1eoMSxHxftKVzOEArpBrxVOQs+CZhsaa+z3lxCVPgPtS1SoeRDusBDFR0
         2UjTi2mdT5lEYuZ4S644l/os/JQ90lEB5ImInbw6D9ZmvTDgahDv3+39rBRgpYlpIouV
         pfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779526531; x=1780131331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SMg/l/29667tIts74aebOptB25uIIPJLTQJSiapxFr8=;
        b=V3J2V7YohDY5wybqdpLeYLWv8DGCl2VgX64hxv1DWd71BwL8MMXBE3BByut/ni1OI3
         bCkSrhMVVgyt+cUsifPtbOQHXFScqaeWPPniVV3GCX1YEHKNY6jx1sF9ihxA9rIX8njr
         VXLCm1HhxEWQpKCnkXf6hjpzoGIFLSNsiBxy5v+wPjCTO38y7ZU8JPp+d42Z9S2By7i0
         F/WDaOgIM1BnqCD+fYqRWu8IiyyLhuDW3c6psRpPkHsjcbVcQWwScAFWpPrxDT2mN7WO
         TGl++wtEngJ0O/R5Bwsc32DU+xLl15V2q3gahlP3K5EjMQ9p7JW08S8cHLzmbm59mvSu
         EVzQ==
X-Gm-Message-State: AOJu0YzGi5RYJuS2XnykSNXDjzOhxs2IYOJQ1XpJCD/8nJuXm4EKh9fv
	ZlAzACzb7jFJW5sXQPGRZWPoylN6rIEiF4Bsw4Fd5rBDeJFiuNQ+6cOTnIGletCr4i06OQ6gZ6d
	31WeonhnmEEJK3ypl6HaiEbTC/EPM8JMMIyCwSa4peHEtuWDfGe4JvYYWtmTd84PsMTzA
X-Gm-Gg: Acq92OHh7RYRVNaNgwUwTCFXIpXoufWH22xOB7+1Sf4p9wgEImAYOONwYPXWMDNxetE
	MAOdxS//oQ8FKiOpHTe/deuwLLaB5bIZAls3c9+JELMZRJ+rxeTzwXoJMf+N4OgqFL+ZQYpBXF+
	7OzNf0JjajTDyHFUWJLBcDgKhbolP6/rD93UceFwbbHgTqgHrmRvHPVA0Rlg/5TdhG5L7XMn8Sq
	FOxeOMglQ+lrE7kgbsO77iEZcL/xyZo2YsghMbLjVv+R9+h2FvDrDSUH1WLADSf+hzMFJGkGkCP
	6EtIQdnxSJIvuYRBC3VnUm03qdyyboDlFNChoB1M6R7bINmCmZ6BnYgw+c6UUiCGmlxu/swzVaP
	5ZbAvp4AkON8d1J2wYVRNF4FdKPzg2k6nWetr9XF7y5S2GxpZo8WXNkRoiogPSTVdaJvEEnZNM1
	sRd1/Nox/qoK+Q8fOxhBRBOxmE0taYOCdfuTyU
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr58569305ad.20.1779526530831;
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
X-Received: by 2002:a17:903:24c:b0:2bd:d7c5:927c with SMTP id d9443c01a7336-2beb09b70f0mr58569015ad.20.1779526530331;
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56d68adsm49105395ad.32.2026.05.23.01.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 01:55:30 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V9 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Sat, 23 May 2026 14:25:11 +0530
Message-Id: <20260523085511.2532669-4-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
References: <20260523085511.2532669-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a116b83 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=p3rkaTs2iMnfG9m1iUMA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIzMDA4NyBTYWx0ZWRfX1kiYCGrjkApf
 F+g+WX9Nq70MXpJntzs/PsjmsWGDODhDKQ6LUytZPA3tHvfrLk+l63BYGVIb7/VJm9FYVv191bD
 7UtftKo1TcfXnnuhpOgH5sO3Ye+5tW34Xf7M/7FIZOi1TLyS2M2em15pscctmSmSewQLifjIZkB
 4WEQAwYaC3TXnzekx09dVwVcmWuIpnROIm+Ki4Ob/8BRiRHpHh8fbyx+GcUyn5JOpamzSuPuW6T
 fuXeMO7aYTNizFvZ8O+7+Zjkg+C1dLYQzAPAWZPLErRJ/TluFRhnyuAEmE5HxsjIK6dAOqjvMgq
 5hi9BuoImKX8zeKL4lx7sqtyBp0rbZdbSphhOSrTZJR44CZsGLs/d+hTfgjHg8mlKOfKsnMzFjS
 c+4FAm9rCiFlutry3mkPN8gEdJcZDQxb/djgz+ecDNZMmKeHzmqsl+EzmrZUwADBWKyTOHmrhyn
 20DTIDMNpqhkgbGr3iQ==
X-Proofpoint-ORIG-GUID: uViWAm3uX8ggQXJRckI1P_V8toVfQcqE
X-Proofpoint-GUID: uViWAm3uX8ggQXJRckI1P_V8toVfQcqE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-23_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605230087
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109473-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6581F5BE0A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..6c272fb6081a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK1 OUT",
+				"TweeterRight IN", "WSA2 WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb",
+				"VA DMIC2", "vdd-micb",
+				"VA DMIC3", "vdd-micb";
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			codec {
+				sound-dai = <&left_woofer>, <&left_tweeter>,
+					    <&swr0 0>, <&lpass_wsamacro 0>,
+					    <&right_woofer>, <&right_tweeter>,
+					    <&swr3 0>, <&lpass_wsa2macro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -444,6 +492,12 @@ vreg_l4h_e0_1p2: ldo4 {
 	};
 };
 
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>, <&dmic23_default>;
+	pinctrl-names = "default";
+	qcom,dmic-sample-rate = <4800000>;
+};
+
 &pcie3b {
 	vddpe-3v3-supply = <&vreg_nvmesec>;
 
@@ -571,6 +625,62 @@ &pon_resin {
 	status = "okay";
 };
 
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, Left Woofer */
+	left_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Left Tweeter */
+	left_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterLeft";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&swr3 {
+	status = "okay";
+
+	/* WSA8845, Right Woofer */
+	right_woofer: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "WooferRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, Right Tweeter */
+	right_tweeter: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 13 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "TweeterRight";
+		vdd-1p8-supply = <&vreg_l15b_e0_1p8>;
+		vdd-io-supply = <&vreg_l18b_e0_1p2>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/glymur/adsp.mbn",
 			"qcom/glymur/adsp_dtb.mbn";
-- 
2.34.1


