Return-Path: <linux-arm-msm+bounces-108768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GES+CP3CDWr32wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:19:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9D58F75D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 16:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 846FB303BE83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 14:18:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CB963EA963;
	Wed, 20 May 2026 14:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eve0ZU44";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GzKcQv1/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D213E92B7
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779286730; cv=none; b=qVVDS407yw7ITUyjKb7RFwnKLBC+6srFzZRVyB/fSZ9CXKxb6OAjOT9H1boCDpsChFPVYhrQGn2vai4v4MmmHMvMMEuxY7sgegXFjC0rqcgkfTTl5nyD1ZOrY+o1CutP/kVNRKHUt0Fe6LBbgdGKmT3Oix5d2sKuTEDFsI2f0JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779286730; c=relaxed/simple;
	bh=yz7ySbkOciVrRIATjh3rTH7OWdCvTZnxmsz3vBzo1yA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IFTNAkZOfeKb67V5MkEfgjjzExjgkUFEAjeClh0e+D0OVu/ct6TeR9Y+6wV8wGjqnJrD8kBWggTSjM0lBAitlXrqIBIZF8ys0GS8jOGzOhehq2lRuuLlLx+5dB42zupUs6T6APkzDn/xIyU76KdWk9ekC2Kh4fyz8YKfHYKaMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eve0ZU44; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GzKcQv1/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCe2nJ316416
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RP3He2Qs3Es
	9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=; b=eve0ZU44oQ7MWwZxmt2Ox30bRzt
	jjUT1bJctZWEFtPtmseFEsPNMqCetnWihO/6Uuoroncn++wvGVxg8pITbVTShF8i
	0k3UTKBumyR4M0CjSWRfLfLLHGIv/d5LQg8nJIUr4+YRysjAlM+np7k093fDALUG
	tf3yVoshQciEtiogOQq7BjI46P09e+jbeXvA8c4w9aquOk5z0c5VdABO9HP4b/SV
	/5Ce8jj+psb4x7u1q5ONvTRJio1py2ebSw/3Ow/7v5v/FNSILHwScFWaAx8iZYu8
	jv5X7mT3p/u4U2uezwbtH2MuCoP0TSgSVMkGiaJlyD23vuQrIdillGdyZjA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9d5qrbuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 14:18:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353b042152so6747448b3a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 07:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779286724; x=1779891524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP3He2Qs3Es9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=;
        b=GzKcQv1/9aPuZEejZOQYU0kO2z+RsFO0TN1nJnqaOvHTfJbU3SvoD9pfX/dnrtN24u
         0rR1L9h+/1h3o7P+3kha0pzBbMcivJCAck6JtyD9AnFJrRl59bKXZU08aY+xORm4a4Nk
         3oLfDQP1ikocXdyJbQNckk6PKu9ReagjCXbZ/ETg6JA1S7RqLQsjAvzcPyuxv3kxkGZn
         8+7vp7bepyboCPH39CPgUdKMGRA3lU7xo41cx6KTfBxgF2Axd/V5y2dDbxbMU3rIDYZQ
         0Wb5x4trqoTy0pocVkCR6FuVo12h2j2tsH9GtB4Tyu/qqPEtQ0B2OcfSNxXo7upSvMCq
         lLqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779286724; x=1779891524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP3He2Qs3Es9JTBGP0xfD/r8VdM0S9VtDRQmSy4sw9Y=;
        b=CWjQpQDWvw+0IPNlXTcF2tzzUHWh4CZrOyxBZGzdLtbFYQKgEww9vzVGgX7F2q93l1
         9yjpHCD+SLsZA5R11El38gx411iEreSWmUCfE1DKUvT2bId8fFBM9A1pdPH1yXLKXfle
         mdmTkz42xuMkFYbixitWU8N5urK/rX5L8Ahz7K475caQsWQPVeNSv5+EGlWNLatAtVW1
         R4q6Kof7nFKnKyfocWHPYi9RnYhSpwz86yz7L4I1fjJn/Yk+AfDdnQt/Sk30WE1C4JZc
         TUa8IGMsAdH+NXDhKiv2rJ8gO0Cvyri4DgQfcSvGqa7tABu2Y9l3EhlW1JDDy8mW7hXg
         upXw==
X-Gm-Message-State: AOJu0Ywa3yub/SXOe9EdLHuWEWleSLwmrRWWGYfhHC7FHjrppdGmmEYk
	+7D0tv+PmgmT6rGm+pxvAdqcswEm4dksMgtCBRwJh6WRawWLBcCjAvmkmzg1rSBSFFdyzFETxcz
	9E+LAlGFIAkA9qTdSYyYMQxs/01xqL7b/8yUH1TXMeUdMZ47K/GVB3KCf56mHFU0zee9J
X-Gm-Gg: Acq92OG/wut80WP5sU+UHdguNF3vrBpW4js7QrkQdl8v5xAQ7dvwpRUvPFgYmwuQbqU
	wRClZz6AVgnTFPjcjggdZcovM2Wyw6DAC5BXb9es/Ozqom48/+renHM1EltK2NrGuYIZtU2GqDy
	V38xibKPMCLccrlCWlCQUrLo5CkHzgPAcbuIpaeJ3qDoCcVabWRUSHvgQiFZYfAh6Ibe81VIBD5
	vj6mHauka8MJobgN5A+XjmkSjYP65/8sj9woSub08cOPyUb3Gg1I0ea4fGMWwe9/tw2xJZwER7G
	75TQttJWR801Glqz6uAALKBtkDeqBD9SrrN6PApsqSAFBJ8JIoSZbvZsIy0wuORdchYVi8oM0mq
	vbZfXtD5oha+6evjerYoeAx6HiWJMskJV29brPj0xrbnQBDa4FsEEm1BDaNk8Kvd9ttQkvMmaEM
	N3s+rAZj3QpsMVUyFfphUoBijvWkm0SAIrSsem
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr25120041b3a.36.1779286723901;
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:299a:b0:83b:c487:43d2 with SMTP id d2e1a72fcca58-83f33df451fmr25119999b3a.36.1779286723462;
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
Received: from hu-sibis-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19775c97sm21990803b3a.15.2026.05.20.07.18.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 07:18:43 -0700 (PDT)
From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
To: robh@kernel.org, srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V8 2/2] arm64: dts: qcom: glymur-crd: add Audio sound card node
Date: Wed, 20 May 2026 19:48:28 +0530
Message-Id: <20260520141828.2724689-3-sibi.sankar@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
References: <20260520141828.2724689-1-sibi.sankar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEzOSBTYWx0ZWRfX4K8JT1cZ+44F
 AOuzHxO/sI9ZB6gDvvu+A+DYZOmznqzHhH26bPUzLXPe9WNzVXClFNe+NZvNUwDIMN1T/a08nDB
 wd9XWh3nhWKvBajxMOYU4WrUJPcg8ZOCB5wP6s/jrI9lusmqY1gNeezPy2RJD04o5xy5FiYBl69
 Svr94NvTrj5Y7bQn5BiX07CDwrv3MPdT57KR2juoy09eAGAbB4BxRZsFcpw0KQ8m7hYkEC3eylB
 9zSoL7tgICE56nvRpeFu6aNG9f/DaTzZqlpc5KCu/r1cgZt/ssTay9acls7vFvawzvZbsZDqlDN
 jzPgsbh5W3MpSll27WcYQacoBTZGC1cLcRt2rpArsWn2x0hREsYOsd46r+XzUVUFC1Ka1lm1Q5h
 eEXNMZyL16bNC+ZtgVCF+e/4gvzA6NRI4gbonC2jgnoftOLaCpuEPuI/qpngOIbAyvdEf2CjmQE
 3zcdsDzOJiduf4m1Amw==
X-Authority-Analysis: v=2.4 cv=QshuG1yd c=1 sm=1 tr=0 ts=6a0dc2c4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Q9KsY8QRZZO8mUXd1LsA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: TsqpMcrpMAlYFo1jYlt_nWy5guLS9fka
X-Proofpoint-ORIG-GUID: TsqpMcrpMAlYFo1jYlt_nWy5guLS9fka
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200139
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
	TAGGED_FROM(0.00)[bounces-108768-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sibi.sankar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.0.0:email];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AFE9D58F75D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Add the sound card of Glymur-crd board with the routing for speakers.

Add device nodes for the sound support with WSA884x smart speakers
and playback via speakers and recording via DMIC microphones.

Co-developed-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 110 +++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index e784b538f42e..4c00d09f766c 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -68,6 +68,54 @@ switch-lid {
 		};
 	};
 
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "GLYMUR-CRD";
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


