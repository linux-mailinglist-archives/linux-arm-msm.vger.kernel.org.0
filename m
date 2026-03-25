Return-Path: <linux-arm-msm+bounces-99782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKMJC1Rfw2m1qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99782-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:06:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8065A31F742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 05:06:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1D9313123A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 03:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925E0349B16;
	Wed, 25 Mar 2026 03:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JKXzV0Gd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OxBm5dD8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3866334887E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774410856; cv=none; b=TUdN53o4bJoeMG9Ss2e7NrWqmCp7iXP77OjT0QxHD0jrqYI0h2GgFGPZp/tQvuQwSYsAM5YSKjjvZnzjH6HiJP1jEdOj5Nrl/0gilLfFVnNAZqW7POw+bf/VnehlvRdWoeY2anAfzBF9J2vZI7Z6NIcWQ3pIh2AKVBdNICMq7tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774410856; c=relaxed/simple;
	bh=icz9D1nxb133mkMj75IAh7jgTfSViv/krznwx07hW58=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U5+5j+mEMuc8N58CMWAfJlhMLbqJQyclAQ8KKRx4jREVs88Qy7AfDBH2CRzQyTIqb54msXqZmv8qXzuo9xTBcktRJXwPk/pXbvXjY6ZYKBOZimX2sbx71tnveVi63BnJowa6uw0J9YldjvtjV7Lnaf9wZfnlcZNTFaL2bqgrkck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JKXzV0Gd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OxBm5dD8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJngVS2075351
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=22yY2F/7WYB
	VxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=; b=JKXzV0GdAwtP1HFLnfadqbL44Uo
	jpkQrRAvpL17QfAkydK1MvRHMEoal0Bvg/OtXvWJI2sMN20v+LbYerma5CzqyYRO
	9hambebMcWKhct9gYpzm2NJ9VIM9CGOj+iKBv6HZ0uIY4xeIOFT/so6QASQz01Nf
	+V2bXE5UFPuo48ehswqjm4CYi1zaC7TrtffdfEeuD8GtbcnQQVvsOnR44nCjnemI
	Bta4JPG170kc8hC5MENoK+pcXs0aeDRi/krM2U0GBooJqYoEnqdU/fRAGf2EpOir
	7bFJPpjnnRJ5WTM76Hobxjj8CkG15r7N0VfWL24XXVmhpAkz+hTBizs5nwQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d41411anj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:54:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82a84f21bf2so19210494b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 20:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774410854; x=1775015654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22yY2F/7WYBVxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=;
        b=OxBm5dD8mKjV9Q2W9XCaix9jnlTmg4Of/sEtviDhb22AGBCWrPRqnkTSuZtkFVpOLn
         WUXh5bH3SNTfPcmdbGYBZwaNvfnfUhLm1LrrbZSzg/Rqcbe/1IWPLPng8oJ2ZFc74lQ1
         62uxQcZkIPRk3cTE8y1NgKcHaZr1mZqDT55Sm8Dv/ew4qrDust31OuI+DOfnOOt/yuc0
         1B/4XBc4N+glZRomUXMkZM9cINky4GdP22WG1kKKaMaftpNW+aOOwTr5Z7s4vjBHNhhX
         NKfn1KzwA9A1TVKB+2SZKV2yHAqnb1w5ABN4aflXfaIHZk0OVFn9fjWdF89weKot+Hnz
         iegw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774410854; x=1775015654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=22yY2F/7WYBVxuHqS7ff5XwOR2N3SI2/M1bD0Dzv1m4=;
        b=bZ6iEDMXLPQc6heXluGdCl/Zpru2RWjvWBeX+gfUosTZbG5pVaBOZfcrE7mxxmXifQ
         idBvelB1jZC6AElEGDh24PcvSH1bGBFEjQG8rw/UVpPdWdP0IKAAKhvMb40RSrN57JvM
         A3XEPCXzROr48npsU97i1OTlEBwetNc6UM6ru4vX8X+8HC1vh9A7NWYl+RHLXyrZlZrd
         H7/zxs/PqfWXYdOACTorJzA/rx3K+3dwOUrJyRii1Z08Z3n/hGTbQ4LCkYX4r7m6LMAC
         bGeEz+g29Ya72jS0RyCTdV/O36cnYxw8PpxcR9w/BCTmyBzwVagE0Zxkzwebbby3vPCq
         5ahQ==
X-Gm-Message-State: AOJu0Yy5D6lNuvxuuvmr7QKJdZc+ksA4uBcK/6JyizFi6++rxvEckYmx
	29Q0xKYQLmmCcFUlKiUkAyWn27zbRLUohkksrP8Wdw12ZzeS06iyRfH+ob+2URrcUne+U+lXHeZ
	C486CXnMj6vE/4/+hTCz5q0/QIVDl4WFQsc+3qlKuDZM6EtrgJydsOfVGPSCGP+C9RtPG
X-Gm-Gg: ATEYQzylp9waGRv/lnRauGrNdwLIU3rioduedcas2opnWOmgeeyNpDRlGEDb9Li1Ofh
	32sdpzlqSLlB8W9OKGbKtRe8CexvyTJ44q1DElIhszDBYOIQRVqyMFVL58IU0Az7Uw755rsQ5Sk
	nbSz6FzVGkdt8jFVVGgq1/52cTDbPNHABoOz10iY6yjIK6pejfcHVBwHdVwZpaui7HuHgqXTyMJ
	xq7gQp4ZwCQnK2hDX+nkY9fEmcAU5AV3Up+7m1x4d6XuJJ5TGLQ/Ms/Aw7W3KLIj4XXXlVlKy0s
	42dyzvCBgB8+cpy/saBPd+cF0PNU7XSkrP8sYk1WA8nVNyue7cDUs9CSD2Vl3kkh8O348rqsBs+
	CC3urJEzPOs0ttf4+T2c3XAelfwiZ3POWiEQoIVtyl4fqWhSexJi40gZN99SDq5kzLLoYMHsj06
	MJDanQLk7jCSkP/OfKAv51A8vWDyDkVSnKpacu
X-Received: by 2002:a05:6a00:8c10:b0:82c:65df:299b with SMTP id d2e1a72fcca58-82c6e0e508fmr1766437b3a.37.1774410853895;
        Tue, 24 Mar 2026 20:54:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c10:b0:82c:65df:299b with SMTP id d2e1a72fcca58-82c6e0e508fmr1766414b3a.37.1774410853377;
        Tue, 24 Mar 2026 20:54:13 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0410870csm14220689b3a.52.2026.03.24.20.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:54:12 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, amahesh@qti.qualcomm.com,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V6 5/5] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 25 Mar 2026 09:23:38 +0530
Message-Id: <20260325035338.1393287-6-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
References: <20260325035338.1393287-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fOk0HJae c=1 sm=1 tr=0 ts=69c35c66 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: LrEWp_4PDRBuYK4qRN6m7vOq2R-0mqCu
X-Proofpoint-ORIG-GUID: LrEWp_4PDRBuYK4qRN6m7vOq2R-0mqCu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMyBTYWx0ZWRfX4llZKb3Ghrku
 3mWPVHppfGrSHmEQctTj9gch6iAN0mbjcSXGMFKcqvgZsQOYCw/V4ee38m22CIANKPCz94rp6zA
 2+iGszuz3lmpB+bVzvV2IfK2Xr9K9ThnWpRQr1OiZG4AYrB0fOlh5HYt3cc+eU6PQ7XnlfH5RQx
 G3uPrXyVVE/x2uECe3/hoxES6uq/kNL9PsCSA1sOLlAltOCrZQaMwDVwGvhvf0DkFPoUm9M7nGh
 r8cKxHeFDfSHx7Inx2FeOmMNlKy4NtQL5K5mS8AbC3XGggUICmAuzKqviplgAaBj7Ma5pyEH1ri
 R9GVnVL1C581nMI4NIKdUnU3OMDU3Xml3eWVLWLD1myIAbcI5fxmPW5axQdHl5d8h/a7yN9wKQn
 wT+atvXb/CB7rC1C2qi43oMkOvxgCTQfaUpZKCq+jUj/jKg2zUHHZuB0Mv/poOlmPIE2GlbPlLY
 0umuV7sPCbnzs8AvCFA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250023
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99782-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,0.0.0.0:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8065A31F742
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
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 690b90e3d6ce..88a5c63e8ac2 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -118,6 +118,54 @@ vreg_wwan: regulator-wwan {
 		pinctrl-0 = <&wwan_reg_en>;
 		pinctrl-names = "default";
 	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "glymur-crd";
+		audio-routing = "wooferleft in", "wsa wsa_spk1 out",
+				"tweeterleft in", "wsa wsa_spk2 out",
+				"wooferright in", "wsa2 wsa_spk2 out",
+				"tweeterright in", "wsa2 wsa_spk2 out",
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
 };
 
 &apps_rsc {
@@ -364,6 +412,12 @@ vreg_l4h_e0_1p2: ldo4 {
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
 
@@ -478,6 +532,62 @@ &pon_resin {
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


