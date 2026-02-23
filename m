Return-Path: <linux-arm-msm+bounces-93692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFaqMtVYnGkAEQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D70E17715A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B82923034262
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057562517AA;
	Mon, 23 Feb 2026 13:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXPAkUs3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cc6foyil"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD34A235063
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854013; cv=none; b=IRpzVRaM8p00GAIy95Y/MbaKFKcrl7bl65Cmcw7dRWbrNiZBQ2RLmrLYhjmKh9/QF7JpeV2v0uRU96705FbNQBcm52zQkrMtVXZfq944f3nGzP7rKhrQPSb/XqHXEWwBxVxgHFuVeY2eaW4KmAJ0w4YgVRC+LEPQaXTivjyAv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854013; c=relaxed/simple;
	bh=/GUdn0GZb/bFH2+Fzxbpy+HSrYEjuVkqs/bHseXM73k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KMNNprvl9QvHOspPjUiS5w+SjMLPhddIWhayDBZWDGr7pz1Ql6MQL8hswziNs1Gbt+mbY5nD8R4CzsqUowlEleO9p62Mrpd+mpESWpt3lph2U2Go3JJsxLanzlSkpfCn7N76Zx3I4UOVNTzOTidspEOBq0or9vZUV6wmHO0fZZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXPAkUs3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cc6foyil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8M33W331517
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/3QwVrE3Eva
	bkesLgBI2hGlUahrRvraAziHZ5pznDIo=; b=MXPAkUs3+WNOUJ06M0aAQrWsrYM
	Pe6a0UAJxdpr8pBbIKli+P+6f9Ed87NQwJZU1/6s8veP6ysZHEBORA6Kd8sJey9n
	twWG3yD7UQSY8+a0WTsM0tPfxg3A+17+7aaxorUZtlaN6OsFjseJkAHR3S15n9Ty
	6GKuzHWcFbx5vMMGnCiE6tSNd8s+nQqYbcvPwkbxMlvJ346gQHPb/UUfOhxMcf/D
	W7JqFs58F6nI1W9ENY8w2Q5mVHGaxI7ZE/fxfkKWS19UQI+GZVUaHNSUhI/Ez/VP
	LISt6lxHgss1nbyH+txZY61dYzl5ZNoIu+MMK7X5cYnnFnRHxRChpQ6DUeA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603mx4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:10 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70cff1da5so3566190185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854009; x=1772458809; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/3QwVrE3EvabkesLgBI2hGlUahrRvraAziHZ5pznDIo=;
        b=cc6foyiluBHo8590gs+XhDYDdB+bpV9IAlSxeNyufq6YFVhhdUCVw0TdFnOkO3+9A1
         hXZ7WDycZykJ559XXh35uGGdnvcsGTocipiVCj8cDZFEoiEHHztQ6zlxsYjz2kt9QbhT
         BHq4EHOa6RMMkMTnVMaPzvRMfYzV/kiNQMSP8a6yPUq6cezmNUsy3PSeNPllYAjIvxUo
         t9jOlqGAO8XCwjpWZfteyaVhNApz+hnu+LrKDAI4uZn/T2Tuz2Xt86aEjLgSQng+APpQ
         LPg7K0xgXm1vFb3tATe8hqJoWMqWjKFBbpbdMFDcdd+E5bMnMqv3C05nT3WyvRNYAOTU
         rbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854009; x=1772458809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/3QwVrE3EvabkesLgBI2hGlUahrRvraAziHZ5pznDIo=;
        b=MQokPkO9OYXT80/YQBeMqEySeVgw18rMYeWKyhHFEBblry4naE9wVYZ/pdUhOfDAIY
         LXehv+V3pd6W/Y/tNn7VuNtKDJ2h9Dh3bn98D8lGZ7imfHBWf8s4477dqL0MmHL73gdi
         /U8bK4CSf6PSUn3OLBmafow35cRkar59do2wK/WkNoU47VdTQKVnAns3X3TehQODk9Ty
         Fl+r5B0ELPAkpcbnOYiekQ1aX1K5XgHBYgWBYk/B3Syh8S8M//ibQYhSR4Ai+80szvJ9
         MTORYXzhwAmsu9jEkMIBtvlNqqkclhDH3Hs24liYC9/HWWPiK2A4FG/8aLDjmcmRAc73
         FK3Q==
X-Gm-Message-State: AOJu0Ywo5O81YApOQRgjayU2l4/aVBG0umk1Ge9bwtNZJq2/1hOMsnBp
	tb3vFSrP991M5cOQoQRsIc+Xo3WuzB1DPKthvkHpJeMmlOaBlcuv0cxsbwd+WVKPeLMUNvhIggm
	7EApoVsfPf3JK6nvgKqlixFaSuI9ji/thv0dSCLe96U6/cpyvszIED+Libgj0dssP6mmo
X-Gm-Gg: AZuq6aJrpwPhVGnWXaiWqJZBOiqac9Fkw7Nv0ySxgjNkOn/FXoZhXNEK27dnwfv2aBP
	vbu2m7wFeu19XjTGvk/L+7j+TC/vx8mtelkCCnSjtqLx7IWaoqQgqOf+rEsukAdyiXxXbthxvZ+
	xMHi983vuhFER28iQLUUgzvMgTzouhZFl/QSeMyDyEG8hYNZ61zSjdMJn46CgeEsZNRTxiBtzUp
	RxUTPitf1420wqA8FpY7sglgXxe6dmiBCBLrn3KJrh3X9VZpCGe362OLXGElMitctQ6gF+MGL29
	5jt0i/w41qstr1TGOrx51jZ+01p8ODI7UcY2WIg1yjWAoPkRHAA8dH3EElECCZxSV30Ga/FTCe8
	gG9XLBysDK/1/i4/WqRzY5h2jiYLrwxK4gje9lQIkdlseOcIDqa68hfg=
X-Received: by 2002:a05:620a:2911:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cb8c9ec06cmr1140384085a.18.1771854008990;
        Mon, 23 Feb 2026 05:40:08 -0800 (PST)
X-Received: by 2002:a05:620a:2911:b0:8cb:4a64:f482 with SMTP id af79cd13be357-8cb8c9ec06cmr1140380385a.18.1771854008520;
        Mon, 23 Feb 2026 05:40:08 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:08 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 4/5] arm64: dts: arduino-imola: add support for sound
Date: Mon, 23 Feb 2026 13:39:49 +0000
Message-ID: <20260223133950.221234-5-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c58ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LNtkodg__a2-xnBQD9gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX6faCTBPBdzqp
 2oxxzOquMlRKVrcXGYeLtzSz5+JEwpvVZif/nnwZhLnZwpuQGSm0CgOZsZcdZoN4WGXzJ3MVhcN
 9dzPc6iYA+ThTxGiT8oWPQH5/qhb5eAdI+fqcyncI/tdGkWak7ZBQ44gYxWmWkE11I1mk4BvveT
 qXvjvJ5Xu6GYxyXqHeGRANnBIRyHsCjo1K6gih0WUYO4RsgX9VXBXi1AdXJkzCn65XR3KNPQLkF
 DBbCMsyLdLfZnFOJihv/fltmDd1X3A0sKq2zxUHm/ojPnyIYW4j7F1TxFLpaV63tPNLHn/V7zgl
 nBhg7FGBO/o6ialT8zbmfnbcgY4HpJ8jUW94rSGU89bbO6RIEyod2IP1W53+tENUYMZnFVXixVu
 sGa4S+uuHWfk3cMLQobxy5oZhz1EPtz8MyMez0kP7jg+FA/e1emU3wPYdj4zntwt6MtQCuGlmyq
 FHixqtA+ZkkklvgkxMw==
X-Proofpoint-ORIG-GUID: Hfevq0d9bUvU8FaNIjqoVBkvlUGJmZxI
X-Proofpoint-GUID: Hfevq0d9bUvU8FaNIjqoVBkvlUGJmZxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93692-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D70E17715A
X-Rspamd-Action: no action

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 138 ++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..53745684ead4 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -109,6 +109,101 @@ multi-led {
 		leds = <&ledr>, <&ledg>, <&ledb>;
 	};
 
+	sound {
+		compatible = "qcom,qrb2210-sndcard";
+		model = "Arduino-Imola-HPH-LOUT";
+		audio-routing =	"IN1_HPHL", "HPHL_OUT",
+				"IN2_HPHR", "HPHR_OUT",
+				"AMIC2", "MIC BIAS2";
+
+		mm1-dai-link {
+			link-name = "MultiMedia1";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+			};
+		};
+
+		mm2-dai-link {
+			link-name = "MultiMedia2";
+
+			cpu {
+				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+			};
+		};
+
+		mm3-dai-link {
+			link-name = "MultiMedia3";
+
+			cpu {
+				sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
+			};
+		};
+
+		hph-playback-dai-link {
+			link-name = "Headphones Playback";
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		lo-playback-dai-link {
+			link-name = "LineOut Playback";
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		ear-playback-dai-link {
+			link-name = "EarOut Playback";
+
+			cpu {
+				sound-dai = <&q6afedai RX_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 0>, <&swr1 0>, <&rxmacro 0>;
+			};
+		};
+
+		hph-capture-dai-link {
+			link-name = "Headphones Capture";
+			cpu {
+				sound-dai = <&q6afedai TX_CODEC_DMA_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pmic4125_codec 1>, <&swr0 0>, <&txmacro 0>;
+			};
+		};
+	};
+
 	/* PM4125 charger out, supplied by VBAT */
 	vph_pwr: regulator-vph-pwr {
 		compatible = "regulator-fixed";
@@ -333,6 +428,49 @@ spidev@0 {
 	};
 };
 
+&spmi_bus {
+	pmic@0 {
+		pmic4125_codec: audio-codec@f000{
+			compatible = "qcom,pm4125-codec";
+			reg =<0xf000>;
+			vdd-io-supply = <&pm4125_l15>;
+			vdd-cp-supply = <&pm4125_s4>;
+			vdd-pa-vpos-supply = <&pm4125_s4>;
+
+			vdd-mic-bias-supply = <&pm4125_l22>;
+			qcom,micbias1-microvolt = <1800000>;
+			qcom,micbias2-microvolt = <1800000>;
+			qcom,micbias3-microvolt = <1800000>;
+
+			qcom,rx-device = <&pm4125_rx>;
+			qcom,tx-device = <&pm4125_tx>;
+			#sound-dai-cells = <1>;
+		};
+	};
+};
+
+&swr0 {
+	pinctrl-0 = <&lpass_tx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_tx: codec@0,3 {
+		compatible = "sdw20217010c00";
+		reg = <0 3>;
+		qcom,tx-port-mapping = <1 1 2 3>;
+	};
+};
+
+&swr1 {
+	pinctrl-0 = <&lpass_rx_swr_active>;
+	pinctrl-names = "default";
+
+	pm4125_rx: codec@0,4 {
+		compatible = "sdw20217010c00";
+		reg = <0 4>;
+		qcom,rx-port-mapping = <1 2 3 4 5>;
+	};
+};
+
 &tlmm {
 	spidev_cs: spidev-cs-state {
 		pins = "gpio17";
-- 
2.47.3


