Return-Path: <linux-arm-msm+bounces-96970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sGzvKk9jsWnsugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4FE263C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 13:42:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AAC993006994
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Mar 2026 12:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B223C3CFF7B;
	Wed, 11 Mar 2026 12:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A4YU5IE5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B3t+fSGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C263C7E01
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773232962; cv=none; b=RftlNoxECPICmDJRLbsIihcBrGtFmMskfgiAa2zvpvUfZ2iDq+oh+kwMB3VcIXj18O3JACnhHR2IlWewsH6BpSQfRpKNU5VjaXtxZAPhU5B9DlZuBve317y8L0Knsu5Dau3njFnvFzsxmM69fo4uEAoFo90b1Arm2cHbxqCs824=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773232962; c=relaxed/simple;
	bh=0vwq1vZeNlNbU7G8d2aXQ658vp4AMCCyraxUz3OFeZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8nDRhRe0ofsaroHYfNGcXyiFu3+h+Ygw/voDTC/8xwQDTZI65kQ+/YcIlJqOzJqJH1XcpwhOBVnNHQgSNPMqYyPwX5TtSINBnw5evcvsFqMwcg87JEIeCUoa74U3bCpkV4oFdKCasA2nWC7cmjEPmdmVCVMggXq1XBZidTn/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A4YU5IE5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B3t+fSGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BA341j2038151
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2U3Gp2xDVXO
	XKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=; b=A4YU5IE5ludeJKaYgxZTYdXo70i
	4FL3q0OjRghZ51Hshi3zGaBL+gbTW5tZbAWepZzEHhrt10UnwRGN+QfA/l841kiN
	+aUzo7SMHrVzhcOMJkTcUv7JlQqyTyNnPduyO8IOrt0KWfGy98RYZY0Vxo1fjm1z
	P5WKzrxkjewI7ovcej9rkOE+rCfPzJnMDjWemHxk6O0yi12JalTqc/rw0VmA6dGk
	6g0GaMn7ianbwUpsWH+OXmLo0ns5jC964xyvbzILpClPu+eirsyrRf28Fzkp0/QG
	tPUae4CXFjO5Z4H/0u98PXuOnR3EyiO5akQsqgCu2erDuwkx00kM5FKyxcQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu6a5ghpp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 12:42:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd781c0d90so532495085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 05:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773232959; x=1773837759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2U3Gp2xDVXOXKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=;
        b=B3t+fSGLrR5Jky7w6/16N3nXe1LM+/XVCqmsu3AtDWrATo9me+pAIJJPVRrPzYgS1r
         DoxBUv+lGKxbAlMMMCOUjcUHHEOr9OWpYtZBI5asG2ZNXS2/EaV43GbwBt0Cr9jw4L0N
         caGKAN2JvOnJuMNa+1clfIQ6cy39GFuzbHz6mP1SkqLWm5ejpSy+wm+muTe+duwArwpz
         PwQBV1tDgezhPP5t1aykwDvE7ZM3R9U9a+FxJPdRtDYKev/wpLgJYybwirhw3qP1b7OD
         J7Dd9bgk4RP0TrGKbx093CWFY+7o9WGCsZW5Pj/vnyPJITyI392lwguBSOIkcyswzlGl
         WJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773232959; x=1773837759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2U3Gp2xDVXOXKph+r3nIMKXy68BE2t0+cKb3wRzVPu4=;
        b=uqz5GVHQP6yqFL+eU7MvUyvATpIG5EDHch0ThoKe4rvi9YJHEuqYeCgmmPK/4Ma8D8
         dB1CIDEUrklNLzUyyoq/pI482CYfhDSH55QQ3F2T1P8gCV6UlIOWg3KirvbGvikm+YtY
         0LxImrIOGN8CUEG31yxhdVo1rlJO6/SJ96LhSy3Pyaer4XVA0Wejo5xz+y6iham4KVkt
         CSY7hD5lCUWpbCaoEnZ4OcbOfLaMy0j0aiC5izxXsKop6bcXZSVthiSwii+MJfueHpY0
         nlHdkpxE+ThSmlmNMgetEpFAiHyLj8iTtXrRmIRoGqk8CrKzVueomJ/u6Tbid7cRqgVi
         ePyw==
X-Forwarded-Encrypted: i=1; AJvYcCWSJhou9A/mmqqOJh5/1L8gDNmg79uhpt547hfxqbjVDqWMkHcVaWDwXCy1+kbRVtbAY+ke+yCy77W/hqq3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4TcexERiIdEOemhCLKYzFrd0E3prd6l3Eq9qYDpwYwlNpycFp
	p+yr/DElCAVOgZqm/3FwRecnK2zp7Hk+P10w91nXSfs8MpPevxDSCyjBhsQgsNFsTdLcVx/f5Bv
	1Eo30Iyd7LRKN53BUojkowxr4uNQXkNDy8r80m5HNF72McmsXHHKYRvxMhBaNIVC06mkSvNUj2d
	VS
X-Gm-Gg: ATEYQzxyD0EuCBM9sHTHMkwQsoI2p4twv4twNtnXmhZg3OsskbvD/JiXFinglObGxlc
	idneekPMu+WkL6sSgAKJMOW3MVqgnVIRB0AKMsgJObL4OJHSWY8CetY3yVykgAy3fMSmO0UYjno
	ebaJJ4sEuPVenrlfD//YZ/FycbX/QX3VVdcJY5NH8oJsu/VW/LSZgfJOgln6ejJkUCUULylPhfV
	DXsygxkBFLfw7pflwZRfKXvyKkLIpa6SCcCqcoPDJflMm3NBTu97D5WHnK5Y9ZcV5zU1eK7zf9w
	fgoFxgz15ysmzvvBNb+sCTJ0Yso6nH8Huhs58nXmDfAvN+aN4PEmwYBmhXzQ0z55O+w+K1Ori6M
	8LaZIMvfbEGCMHV6ZBVgeWEr7X5xMtqrA8UhbGIyp8qPvp7bPbSDVjAk=
X-Received: by 2002:a05:620a:7104:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cd93b3cfcamr747696785a.3.1773232959186;
        Wed, 11 Mar 2026 05:42:39 -0700 (PDT)
X-Received: by 2002:a05:620a:7104:b0:8c9:e989:9d8c with SMTP id af79cd13be357-8cd93b3cfcamr747691485a.3.1773232958697;
        Wed, 11 Mar 2026 05:42:38 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0caccasm39011365e9.6.2026.03.11.05.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 05:42:37 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, linusw@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sibi.sankar@oss.qualcomm.com,
        mohammad.rafi.shaik@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 11 Mar 2026 12:42:30 +0000
Message-ID: <20260311124230.2241781-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260311124230.2241781-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DY81TF2aTF2r3i9Fl7KLJpt427IAS3o9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEwNyBTYWx0ZWRfX1j0+h+MYUXub
 PzabtGJ+kRAe5s4I+DFQnRmQGGxBuZ9kYyLARN2LNxF4h+GwMnjSxF0HFAfccv1W9LLPIyNH2i1
 IPNEZg6B+fXYEcywnrzVSg2P0S1pKbgUKnUJbrLppPDfGRbL5BCCDgJA668NGGQK8J+45VYQTKx
 e4wL7c/JOpVt7Q0Sgd7udcAHn9v9hdgofjGEmSDYFiG7Pk7FNO9CRNJvT/6hVJLiGTvt2OK+59o
 WlYlPBqR1fU/cRLeme9k9bnLLu0U4qVSKrBo+49/9S0p7c6V+yLOtLNj13ojfLqpo0VCnj8gAw3
 0CN1xS4PqKyimZ4Uz3fVqDCwlr2FJNXxsc7pfrAwTxHIZ6/80Io0F9rVV3C3vHerjhd1dB1H3L7
 VfRq5UAsVuMrjFs3zg+gN6Fi80Xm3bqbOaHEmdffXIbEfO/qRlds7y3sPcIf/nkQ5rUwCXrA9OJ
 8JU6jHqv0oyQzTVhB1A==
X-Proofpoint-ORIG-GUID: DY81TF2aTF2r3i9Fl7KLJpt427IAS3o9
X-Authority-Analysis: v=2.4 cv=TtLrRTXh c=1 sm=1 tr=0 ts=69b16340 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110107
X-Rspamd-Queue-Id: AD4FE263C0E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96970-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add the sound card of Glymur-crd board with the routing for Speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dts | 110 ++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dts b/arch/arm64/boot/dts/qcom/glymur-crd.dts
index 6b7f91a3a968..39e15184940b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dts
@@ -121,6 +121,54 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
+		audio-routing = "WooferLeft IN", "WSA WSA_SPK1 OUT",
+				"TweeterLeft IN", "WSA WSA_SPK2 OUT",
+				"WooferRight IN", "WSA2 WSA_SPK2 OUT",
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
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -367,6 +415,12 @@ vreg_l4h_e0_1p2: ldo4 {
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
 
@@ -485,6 +539,62 @@ &pon_resin {
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
2.47.3


