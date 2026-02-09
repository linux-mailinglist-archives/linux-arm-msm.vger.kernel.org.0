Return-Path: <linux-arm-msm+bounces-92321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AAB8FXPuiWn4EQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92321-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F9A1103AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 15:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77043033AAE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 14:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBD137B3E9;
	Mon,  9 Feb 2026 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B08v+FpH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GrksXugK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B38A37BE6A
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770647099; cv=none; b=SeHfP3IrySf/Hd6/yy8r0X5EHJ4Ta4ZWkjn11P16JQWAGF17cWedE+lYFAucLXjCZuLrEDv5SEMpaArV+hMh71zCak04KPdhYYEoN2sl/5mAsx3hAfCvTIsY5tWZIgY1F1oU4JZdzNg3thZJzRJY7njZIJSd1tw70DbN+vKuYs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770647099; c=relaxed/simple;
	bh=IoRsJldsLh4xyDO7ky3wH5t26O3SVlGrPc0d8TRGuQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s0Bx9v5y7sfvQxpUT2xW5ASjkyW9FnHCmNFQXNVBUPo2/sC06Xk8SfxCbdjU5xqaBO25zAk5J9b3wD6vQYHxJzg0BIc9FGo5NqHpdm7cMDZlospgHMnsalkETvdMToqs0Z/XZi6owfo/pTzT/FNvIOEDktmGF9b2pT4E2QZSYeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B08v+FpH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GrksXugK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6199sfZf1656367
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 14:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3eEMmidbzSj
	5WGaVZ1Hi+4ynYJrGY8J6+BH2fFtbhiE=; b=B08v+FpHav2XNxFs4bWwvagUlF+
	MM6bswQ6L3VGYNguL7VH+FtnFqIoZqMHgYz77NTZhwCDjhYJgKwMadmyG8tKMq+2
	tztbBogJgLrmdCKc3u0bPPvbXr15en8bdrCEaBI02fF7ZUaP0fZ9ciXDCItVXdP+
	UtmDVsIUMuVmTemJfpGIBaHERqIdubh4kHTJ4GZdbvzoNXkE544w772mxYZvYklA
	pCAzrPOjx3DfPD/qiH1yYEPL9bXdb0jA49djGZ2HBO95nRuCHsHnxHIBef7VlY0S
	AnyEzawiBTDobvCJfGuaZubpHwK0FcvAE6nGKBNJ9936eDZT6jaJpi83vDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7862t14a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 14:24:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so1307778485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 06:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770647098; x=1771251898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3eEMmidbzSj5WGaVZ1Hi+4ynYJrGY8J6+BH2fFtbhiE=;
        b=GrksXugKIUsVJPaUvkF/L0SKAEean8R3Gp9LdFpkQIJRjAJylsZO4bkIQupQ3Oxrzu
         TxXQMvOvvDKWshQc67b6PZbKpGmSaLFuxZttnand+wICjslwMfOOSrBBQ2X9QqJd2/CL
         lgXkY1kh9zCC1JXRUxJE8w8F+9oxTn8gnA+hMuDp+xybaF0D4amsh7R+oTVuU1LvUxcv
         1UDl0oimYp5s8sp7O1MMQlfSin5js7NyNhex2966rU+9KFx+mL/w52hx1qzYE8g540qV
         CgWShb8+2Hr7PDZSGxuvjxAMDsDO6Hd060Unz6TFNwvs3sEPivw623oblMmjK66nmEPG
         0weA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770647098; x=1771251898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3eEMmidbzSj5WGaVZ1Hi+4ynYJrGY8J6+BH2fFtbhiE=;
        b=cuCoX6JmItB/MRw5Trz0eBjTObRwoeGmVA2LFeJULJOIXtz2Q552TtUCQzR1g5IXdD
         2xH0stUpvfFQkjMjhxGUnxK5nuAVg4x5iVmLw4qXty/e9um/uMlrr5XoDZjmaDsl57E5
         pv6+5Jh0I7iwSCuIgdEBbZ2R3aDBzJtLQLUk1fsTe9OlGgR0Ggax7WKJLZv2nFBUF3cu
         +VAkknyVIHYHgEPkiI2gMiBJyJWJJAwc5U4TXcP1/QotfpQ1meHVyZIcbw3I4q8i2onY
         gOBxfoa54R2I0c9Bm3xJSDFbDcCX+JxwzHOydo6MVoFMmsTgKZdqtypV8XtmIQmXFUtL
         FJsQ==
X-Gm-Message-State: AOJu0YzvuUQj0otBIj1gdsrWa2uD+ZB5OFo2/1kfUji72u3f2DQELGDY
	R37QoZsjPtK5EfVLrmZX60lCdbuuFr24BviMu5Y/7Uc7GLl+Nfu1UWmsKkXXSUIEaXoZ7RpySru
	S1xJ/lB5CH352JH4tUhrl+9ULFHHnJIcKvmDZJEuuI/EmqOFKqPwKW5TcB+HnjGu6HmyH5TzaJo
	XU
X-Gm-Gg: AZuq6aJVpdi5haWCBr5neElw90EV+WoRCtIvXV6r9LfEhBISs4klOu44m65f0uWqJcu
	pTFYwTHP3R0ueHLQsGDuQ1jXzwbuRm4sqeka7CCknLtlzp/beaSknpgaKQCYv1lvWTRCXmQ98BF
	WZIbbBysOVDVj1pFqKZ+pNtrVxfO13E2iPe8a0EeXb/wvu6UvotVW2CLv186qrsyZC8yQpM6R9l
	oZVNEqG36fs0JpKrppjvHFQKc+sKU/Qm46VNVLqtzKKs6GoR18rCB9Cfy91YtWW+HlwBUhDgrr5
	Woo/rNIUaCTKLlJXLdrQEK5B+pTXj0jKQq31pCjfc3oWrXkii8G6hG1DmSArZuQUfL1FP/+9ARI
	AlkpPm978CZJ5hRvUcAZTaVArWfOHMSmEJSyTuhJ9Ar4=
X-Received: by 2002:a05:620a:2a16:b0:8c7:9e6:3a7e with SMTP id af79cd13be357-8caec1c2994mr1471856785a.0.1770647097726;
        Mon, 09 Feb 2026 06:24:57 -0800 (PST)
X-Received: by 2002:a05:620a:2a16:b0:8c7:9e6:3a7e with SMTP id af79cd13be357-8caec1c2994mr1471853685a.0.1770647097295;
        Mon, 09 Feb 2026 06:24:57 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm28296634f8f.28.2026.02.09.06.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 06:24:56 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] arm64: dts: arduino-imola: add support for sound
Date: Mon,  9 Feb 2026 14:24:27 +0000
Message-ID: <20260209142428.214428-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260209142428.214428-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDExOSBTYWx0ZWRfX2CiIg9oDK1Ak
 rCPg3fzkxcFjLH6vvVBcIngIOIi2qApFtKY7BGzKaRo4sK2G7ev9XX6719bcF2WN5lTcfVcLORy
 64ce3UYSAKO2u+sNPUbtqu4bRfpyeEfUsq9xDRadeeMpIO61XsflEHwZ7SQjd5fZnIjmhy0tp0F
 aNndiw6CjCjD26f+67s4qzSjTrDT3GN4csxct7BQ9wcha+M12B28iaxisjYcJsnInHKoKqCAMnP
 YmX/+lESTYjV0wll7XyEerml8lve5k0TOFaBhoTeLwLXZw2pvamIyEJHo1jAigAOWENYSgQQYhV
 fyyO8+YK9fGAp5Kz9eY86AKqeIJ2sW7hlPAMy73x9pC/ZcRUYPxcpLIYyrSkZduEcJfMhdAfN3e
 xiFEn1snWsvQUyPIMTaZkT7fLpkA/L+rMEjY9XAznng3MBBgqRnAoAV5JPhM+7FvTORvpjuWhgo
 cPJhPuaonRdcz1vciMw==
X-Authority-Analysis: v=2.4 cv=bZhmkePB c=1 sm=1 tr=0 ts=6989ee3a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=LNtkodg__a2-xnBQD9gA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: ILKO4i2m3zrklcJP0VOAZ-PgjJxbEczY
X-Proofpoint-GUID: ILKO4i2m3zrklcJP0VOAZ-PgjJxbEczY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090119
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-92321-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,f000:email];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9F9A1103AF
X-Rspamd-Action: no action

Add support for sound on Arduino UNO Q board, which includes
- Headset playback and record.
- Lineout

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../boot/dts/qcom/qrb2210-arduino-imola.dts   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
index 197ab6eb1666..f36f7ff96252 100644
--- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
+++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
@@ -109,6 +109,98 @@ multi-led {
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
+			link-name = "HPH Playback";
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
+			link-name = "LO Playback";
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
+			link-name = "Ear Playback";
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
+			link-name = "HP Capture";
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
@@ -333,6 +425,51 @@ spidev@0 {
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
+	status = "okay";
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
+	status = "okay";
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


