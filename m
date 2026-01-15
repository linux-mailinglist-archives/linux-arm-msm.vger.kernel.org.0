Return-Path: <linux-arm-msm+bounces-89110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD2AD22A51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 07:51:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DA1730B02A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 06:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598902F49F1;
	Thu, 15 Jan 2026 06:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjTdSc0N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QsE6AtDP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD82A2F39CF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459769; cv=none; b=rvjJZ8vvWvFpcm91BqDfGZa8otrTow7jyyLmbQfzusGyLItelB6UZ/1QNgSB0V9GYgE9D2a0EXFGEpw+PXRyLyPuRbvapHAz+fb89C2a+69xSGbq8UjkbmU+dDOPNOoL+T6LvcuM4StJFGuaMWcbviVTiRC8eEAD1YuLqmWjQcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459769; c=relaxed/simple;
	bh=Sq/Iy6qwZNcXXmW//Su8Dzu/i0S03Jexh2wuTpuA3Sw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hEgw4+nP8BhwOAUPAciLdxbTzedRQJu481ujgcSLst69v44vXl+tuwzVWYfVJpenICbbP7TsrnYiTmZlhMInBo8B6iaq4Khqdlu/RV8eBYpsLmrMAeRL7lXjHxaVobSe9yRjFMw+9fO6q/7Yj+Q4zpelD2B8rXz0Ijp8RAH2zos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjTdSc0N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QsE6AtDP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F6g9Xf1554491
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7V5f3lUQlSKDknSLTZKtQ7ye+33db1JRV4uqxKnrhSc=; b=JjTdSc0NbcqmFdfN
	d1D5ckmadrNEfk76YtlXne7IGEep9jPRcwz9ldKEuUBcP00PL9y7hfApu/8y9IRg
	/6IE6WVggMJ8eUO5kDf8zj+ioTGwN751Wi8SfCmBM70g5S9ygLQBUWq9qia1Ly1h
	uiCyo/v8O6rECCeZh/kLyq3hzpaApG2qnBmXSVuxBiSBvDqN4vPLpXa3//wTx0x1
	J9csii0x/xwEmh0WPHFIARJ2EcoGoshuPHEN767o5J7/JDK6MCNowP8NWQPyW8B4
	pHn/ojc7aPw9wyne70TphIUPSwf/C672DmcOoma/1AvZpCj52R4XPUKMDbZjri/p
	r1KqFg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8u9rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 06:49:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2adc3990fecso403948eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 22:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768459761; x=1769064561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7V5f3lUQlSKDknSLTZKtQ7ye+33db1JRV4uqxKnrhSc=;
        b=QsE6AtDPh3740bvuTwwAhNWQRU/fXU3U5GsUwPsfjX3LyMpgFsA119AHWMtN5p3tjr
         7HARnkKQigkPEqlF1oyFtsJ6QyLYIdgYh3WPzRnAQWJ9K8I55caaWzvXBduE5OTLxJ8+
         ZSNPxd7uhmG446qJSkYRjhEcXBx/hIwkvjQMYLwXfqJ+3XdsUqUadlB4330NZgv9vk/w
         /KslwWyw6Rj3Ppm5K0F0BnOCkI+F8zK30EW7TvlyFrqLL09l1h+mA/lQLJmuq4GXwnKV
         lj/N8nbE10gxDjKkX7zVoW+2YtgNMPdjoz/0zhX0nyO7cSWzD4wyAUuYMzuFCLph1YIl
         Yslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768459761; x=1769064561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7V5f3lUQlSKDknSLTZKtQ7ye+33db1JRV4uqxKnrhSc=;
        b=MZNDc+jlNNj2ab7f5/utfwHFdZcJiHnA9xXwgInnZB9SRHCwm4kjtf5VI8Owhyp0Qw
         e0q6JYCa8t0E+xLNPnCYXaV+jZm1afLrZVtmUvNsVpCzw4vgc5RDYvosxrLf8lfPa8NK
         CVrb7ZXk7GaIBK1HfNwIKPxBf7o4Nyf55wNeGNyXm6RUdOW2iqGUwVSIG9LkCd7n+phY
         m4+udOPxFRx33F4NPSVssGyFLbd2/TBUWbYFUpIvMlgaLO8o2l0Symhrr/5dIPAnihpm
         H5/085eBH6M8pzypWXrogXuZlkZOq6uW3qxqXNgFBY8q0FCkCkk0d9eaVCuboRpUTM0e
         hkLg==
X-Forwarded-Encrypted: i=1; AJvYcCWjlEL7BFQDFEQMySzU/VLvcCrqxx8pC/zAvBnW2M2a46p3+fdsaOCECsKZQxC3LJGaow5OPNzZvo8/kZrJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzoIn/AS/HRv4Z9CZJ6607NGn8tHFsH0lsx5HA08hK416EDD8ia
	sja7diWIHYf1o/118jN0YMNv9E+iWBWsIyyjXX3WRR2rTjDNFEMKFNt6zLeIo/6bH6Klkrtfn9l
	Hiu5ISXyQbwiLNKFY8KKZ4b9rCfrnGhcRK8aYFHO5gcbiznEdzP0JyNvnJGLoZ9tBYU2D
X-Gm-Gg: AY/fxX5fa/WnUdDXRn5b9xL1PJcP7iIX7qhbXIH4kzS17JswlpKRhLJTl9V5hFn78Zh
	EfPIAsekuxwO2JjKiFAEJPYDMZE37NA662Q4aX0Z4rSxw1sgkh5BVtP/Xe4DBqLa55p8eInGa+1
	IEL1jRcDrdOSzQGW9ea7ImM1UI80Ulw+P/S2IfIjIu6URK2j27J12bzPnCqPwzEvwo+tmCuwmgn
	wVD4QxvT89PkGaC0Xk3CjhQc9D3pZXJiOeutzTlCX05oxg1/a+dlleCv/u7drfVYZeuv9FVfkXv
	IdAIVMdzLUCT8/z8T7Gqt3nIDFn4R8B7wEEo7jRSsxmgg67v4vOeAMC8ovxoMSAwyvUy2rqqOvu
	85p07X2xNZinxEhQWq4koE3heBwEKQGw25R8yPtkEobOpvXYQD5G6X3GmjMOo
X-Received: by 2002:a05:7300:8c2b:b0:2ac:16c8:ff8f with SMTP id 5a478bee46e88-2b65ba5bb92mr2480853eec.15.1768459760541;
        Wed, 14 Jan 2026 22:49:20 -0800 (PST)
X-Received: by 2002:a05:7300:8c2b:b0:2ac:16c8:ff8f with SMTP id 5a478bee46e88-2b65ba5bb92mr2480820eec.15.1768459759917;
        Wed, 14 Jan 2026 22:49:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b480dea94fsm3259143eec.24.2026.01.14.22.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 22:49:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 22:49:07 -0800
Subject: [PATCH v3 05/10] arm64: dts: qcom: kaanapali: Add support for
 audio
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-knp-dts-misc-v3-5-a6cc9e45de93@oss.qualcomm.com>
References: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
In-Reply-To: <20260114-knp-dts-misc-v3-0-a6cc9e45de93@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768459754; l=13837;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ZccoxosG6LHDvn86wr8NTYX/6mjcJ5LkYoqpuGxWEQk=;
 b=AA8/2HG2avZuRhCMkYGd8UJ9JBHE2leqYU+sj9EBvGMWn+x2aGDbVTqz0tbdilagugTPuVEb5
 eQCMJATPNbEBidJoSurB1CntwgPX1PLtCMZnwTzMA1O/kH/GSGEmF8p
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 7OBaGkJvUvaA1dmtNqUICcGjPwdEywBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0MyBTYWx0ZWRfX6q+ctN0xrqXW
 31xd6GgdSj9G9cJCT/g32lnKp3Fhq8rnkAnJ91GO77R2SKcLgFM7lzM6G96bgsazey2gCNm1TZo
 0Og2X6UHk3isI1sMTRFUk0eRAvN0tHWTX66xqnTrUqBAWzVumh2CK4+GkR78EipUnAzhr6r2fUP
 b+eo2bdi9PL7FWVu3lIB6QNHP/tRyno/4X1+FauQT8V8fe3tTJ+eMLiL3Ov3FvxYkYTib34EwFU
 T7CWfPT6V/HLCo1OpwadDIjd74uYOR3c2JfUo/uV+nTLQXgZuN1vKOsMo6hpoLVeY537k6WA8v5
 TuO6h8tgHFXSdANbmDwMmFdNtO4htsHrxo1uGFL6PXUqyYDW4AmkF3/BmQ3X/JRmPS9qf5rhLOR
 Vt/g6TK0Bouq/9zWhjE7R38Ddj+5WQvE+8S0Y3e5ntMpgWfRsWKfyR664/dmA1qwInbWPAA5ivq
 oOlEXqoBoA0u4pAf0Uw==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=69688df1 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fOvlSJoLLuNaJOMVFRMA:9
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 7OBaGkJvUvaA1dmtNqUICcGjPwdEywBg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150043

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Introduce audio support for Kaanapali SoC by adding LPASS macro codecs,
TLMM pin controller and SoundWire controller with similar hardware
implementation to SM8750 platform. Also add GPR (Generic Pack Router) node
along with support for APM (Audio Process Manager) and PRM
(Proxy Resource Manager) audio services.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 396 ++++++++++++++++++++++++++++++++
 1 file changed, 396 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index d344eb376ee4..30705483ca20 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -16,7 +16,9 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 #include "kaanapali-ipcc.h"
 
@@ -2669,6 +2671,400 @@ compute-cb@7 {
 						dma-coherent;
 					};
 				};
+
+				gpr {
+					compatible = "qcom,gpr";
+					qcom,glink-channels = "adsp_apps";
+					qcom,domain = <GPR_DOMAIN_ID_ADSP>;
+					qcom,intents = <512 20>;
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					q6apm: service@1 {
+						compatible = "qcom,q6apm";
+						reg = <GPR_APM_MODULE_IID>;
+						#sound-dai-cells = <0>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6apmbedai: bedais {
+							compatible = "qcom,q6apm-lpass-dais";
+							#sound-dai-cells = <1>;
+						};
+
+						q6apmdai: dais {
+							compatible = "qcom,q6apm-dais";
+							iommus = <&apps_smmu 0x1001 0x80>,
+								 <&apps_smmu 0x1041 0x20>;
+						};
+					};
+
+					q6prm: service@2 {
+						compatible = "qcom,q6prm";
+						reg = <GPR_PRM_MODULE_IID>;
+						qcom,protection-domain = "avs/audio",
+									 "msm/adsp/audio_pd";
+
+						q6prmcc: clock-controller {
+							compatible = "qcom,q6prm-lpass-clocks";
+							#clock-cells = <2>;
+						};
+					};
+				};
+			};
+		};
+
+		lpass_wsa2macro: codec@6aa0000 {
+			compatible = "qcom,kaanapali-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06aa0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "wsa2-mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr3: soundwire@6ab0000 {
+			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ab0000 0 0x10000>;
+			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsa2macro>;
+			clock-names = "iface";
+			label = "WSA2";
+
+			pinctrl-0 = <&wsa2_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+								 0x18f 0xff 0xff 0x0f 0x0f 0xff
+								 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00
+								 0xff 0xff 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00
+								 0x00 0x00 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_rxmacro: codec@6ac0000 {
+			compatible = "qcom,kaanapali-lpass-rx-macro", "qcom,sm8550-lpass-rx-macro";
+			reg = <0x0 0x06ac0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr1: soundwire@6ad0000 {
+			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
+			reg = <0 0x06ad0000 0 0x10000>;
+			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_rxmacro>;
+			clock-names = "iface";
+			label = "RX";
+
+			pinctrl-0 = <&rx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <1>;
+			qcom,dout-ports = <11>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff
+								 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_txmacro: codec@6ae0000 {
+			compatible = "qcom,kaanapali-lpass-tx-macro", "qcom,sm8550-lpass-tx-macro";
+			reg = <0x0 0x06ae0000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,kaanapali-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+		};
+
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
+			reg = <0 0x06b10000 0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+			label = "WSA";
+
+			pinctrl-0 = <&wsa_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+								 0x18f 0xff 0xff 0x0f 0x0f 0xff
+								 0x31f>;
+			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00
+								 0xff 0xff 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08
+								 0xff 0xff 0xff 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00
+								 0x00 0x00 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff
+								 0xff 0xff 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		swr2: soundwire@7630000 {
+			compatible = "qcom,soundwire-v2.2.0", "qcom,soundwire-v2.0.0";
+			reg = <0 0x07630000 0 0x10000>;
+			interrupts-extended = <&intc GIC_SPI 761 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 40 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "core", "wakeup";
+			clocks = <&lpass_txmacro>;
+			clock-names = "iface";
+			label = "TX";
+
+			pinctrl-0 = <&tx_swr_active>;
+			pinctrl-names = "default";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <0>;
+			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
+			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
+			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
+			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,kaanapali-lpass-va-macro", "qcom,sm8550-lpass-va-macro";
+			reg = <0 0x07660000 0 0x2000>;
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk", "macro", "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,sm8750-lpass-lpi-pinctrl",
+				     "qcom,sm8650-lpass-lpi-pinctrl";
+			reg = <0 0x07760000 0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			tx_swr_active: tx-swr-active-state {
+				clk-pins {
+					pins = "gpio0";
+					function = "swr_tx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio1", "gpio2", "gpio14";
+					function = "swr_tx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			rx_swr_active: rx-swr-active-state {
+				clk-pins {
+					pins = "gpio3";
+					function = "swr_rx_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio4", "gpio5";
+					function = "swr_rx_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+
+			wsa2_swr_active: wsa2-swr-active-state {
+				clk-pins {
+					pins = "gpio15";
+					function = "wsa2_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio16";
+					function = "wsa2_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
 			};
 		};
 

-- 
2.25.1


