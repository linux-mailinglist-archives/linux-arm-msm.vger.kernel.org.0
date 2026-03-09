Return-Path: <linux-arm-msm+bounces-96294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wefJIOzmrmlzKAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:27:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6255923BA3C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 16:27:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1B211301395F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 15:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295C33E3DA3;
	Mon,  9 Mar 2026 15:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2ocoS8x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LwhQ3wyD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315983D9039
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 15:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773069881; cv=none; b=iiG+4eXLFr+dK+qDyZ7Mx8HO+FhM3QAeO99jvIB3oB+H5RDZY/Jd60vAqYBLMpF2Juz3rmV3PqNChQCYacMlBlURWsnC2n0fEd/um49bxq9l1LlV7nr0Ft0d5QJid+gP4vQCnQiz+xv9zn35NyUdBMr3pxOwMnOu8EvczDG25Zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773069881; c=relaxed/simple;
	bh=r8cuQ6b8f7Xo/KoqCVbaVcurxgNdTb1lBAk91JFsjJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sX1Vujvkl3oNYi7CUYNsqPb9jAxjHb+4fwfxXvYWYxk39JDLTC++ai0Pl2pDlAtghd5J0DTF1ag7kEoz8HBFpQM4XiEYhsL30sXqGaRTgq+wD/3MF3fvGUu6uyejfAs8oeMQiaccySVqbSrHSRccI5Qs+jpcb2tuje3bSLDcoy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2ocoS8x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LwhQ3wyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629Dqhek2137784
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 15:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=54zpT9fL548
	mlSdxSVINsQLVELiV7cKhFBd6utZbb/Q=; b=H2ocoS8xuEVZQg4nvfIwgILp7Pt
	VkZ3ecnSCcSYut8tgk4kPlqxqwrw9mpWozTkQycEDU9gZCdptGsCnGBFI3mchXKX
	5Q3ngGoDesK+DwCYCrzrmnL8IziJrIQAOjUjsiZFfQWLdy2SjlYpKKkx8xapXhXk
	iK4NUSVPW7Gd2CQpfYwHShPWGhvdPYnGgIseBHqIRy82X3e5+gCW1mwzcxWwY+68
	1SD+NEAbAN7WUxyRYKMotaGQkKaxQRI8757LHoNXvF/xUpw/xC+R6jzizKyHKJUp
	S4UdEhD64hY05w2SItpaoS2WF0a3qFInO23AhLqZ6IxmfcMA2KQuSJWBV9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyft09tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 15:24:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7de0e161so1034512185a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 08:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773069877; x=1773674677; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54zpT9fL548mlSdxSVINsQLVELiV7cKhFBd6utZbb/Q=;
        b=LwhQ3wyDl5wcWvksQ0w23G7rkMxKPiOLBqLxHpLHA4fHyCJ2qsEuk4hREO5C+QYY5c
         CA8EoWo3r5Py/z4pslnURD9GQC64yA273JCTf3Z8yY/HaXdv36FH8XIhZTX8i+0zwoHd
         8muSqv1mWI/iZ0lvc+zw0nrG9UwKrq9v631Atp0xhTkoedzI2d/uQ6X14bq77p63FXJZ
         Xhmdz1a6XLmJ/js6/kOAqdMalsWw2+vOP9pstCDcv0cALrV7IgygMMzJv4ZSU2SNA8iU
         sa6yqOQB4YMUsNdcgDiRcNKUhpMq2MzB9NzSuNLntRpZahEPdi/PsAa/BFhQTobLPwar
         sBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773069877; x=1773674677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=54zpT9fL548mlSdxSVINsQLVELiV7cKhFBd6utZbb/Q=;
        b=JsVYescUhaBVZ8CHEohTJXV0mntDzq3WOBnOefH4E4oRwdWgVfwZAdVGfso7lz5Uzq
         DHXoB8/UvOGBABAkCaFkbUTXIz5GIJM1o28DEIYXpsZmAgbCrwXltXPnN0Ovp2ThVGgy
         mM480c6MMPbYffH7g5lJmD094JbX4qK8C8mjm74k5tDPNqF2jebglc3wM7J2Mpi4uEdM
         whDWg2a194Bjnfbc0X1i7BBLGIqUYckBmCnsIYzx0tNL/457o6MUkkkQKvz4D1NMGC+g
         M4b0xP69B4nvWS+IrYCRs/IrsJnH2f77YKOMw7iS7xnUEJh/Dsg0OVCJ6FOignEvFyTb
         PAuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUddPlUiprWhzcm8rQ2xnrsZT4aFDisFgnzCZPFOvcNwdoAk0yRYDlElpBkMkxufkiUS4DMZxeXJwGtopRC@vger.kernel.org
X-Gm-Message-State: AOJu0YyMMv9AoVtWPDmGA4vPtWmN1dBbnIaa1gTHJlcRED93d1HPfXfN
	s0/q4Zk6RBszGDJgcUCIAcm/vnp4eVNNs+CUbnQP1NPYPUmTpTGPuOWkaPLqhHh0vAWmKLvMOfq
	s4GsyedfnYf4sfAPqJzOCf3GLflY1KVRXexGNex+IqP7jrleAKcscJsH8WNyeaa/BLaQP
X-Gm-Gg: ATEYQzxXQtCTG11qJvuPdY2NTaFYDs/T99bsMYptufIfoYNyHvs0r+7Q/ii6ppmYn54
	ukEXChLHVqWb9DBdG980oG7In4AnTIlFMsuw6vLIndLQVYLrfqWIt1IVqCpEKsVPVGHG9D+2jN3
	kv3i0MC01R39EXZUlf0CJcEZAVq1WoFXU3LVicLP3DN7xFYcLpB5FaLMBTcy6C/RM6VFCv9wwRT
	nMVclCC8IUMzwGsWCmHAvfArQmhUuyJiZldY07j+oFIevfmzxfDb+GOxp/doQeuoFSCUowwEWlG
	z00wtJE2aiHY/QnTmpIHFFYVUiaZdMxvwW7vOYSF5QfgVOLngTVyfwjfZ5KUSVueBreS+rRDFzs
	CpSTXjQ0rxM8WYQ+uLxF5G76p76DO4hgvkpYb7iEfrHvz++mLOP/e1sw=
X-Received: by 2002:a05:620a:27d0:b0:8cd:7835:87f7 with SMTP id af79cd13be357-8cd7835897dmr871721685a.68.1773069877425;
        Mon, 09 Mar 2026 08:24:37 -0700 (PDT)
X-Received: by 2002:a05:620a:27d0:b0:8cd:7835:87f7 with SMTP id af79cd13be357-8cd7835897dmr871715085a.68.1773069876757;
        Mon, 09 Mar 2026 08:24:36 -0700 (PDT)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853a59fc36sm192812515e9.9.2026.03.09.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:24:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: richardcochran@gmail.com, geert+renesas@glider.be, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com, ebiggers@kernel.org,
        michal.simek@amd.com, luca.weiss@fairphone.com, sven@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com,
        kuninori.morimoto.gx@renesas.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, m.facchin@arduino.cc, r.mereu@arduino.cc,
        loic.poulain@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 6/7] arm64: dts: qcom: monaco-arduino-monza: Add sound node
Date: Mon,  9 Mar 2026 15:24:17 +0000
Message-ID: <20260309152420.1404349-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260309152420.1404349-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kzAt-LolfiGXb5QxR4Sh9HtF8hlM643C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEzOSBTYWx0ZWRfX7Gxem2Y9qlvs
 zPpwxQnqbcwnFyQp+UvfAWfNP1w58YeENBK+sUPF9svfA5SsmiwG6pyI5qPYhynQDqqMHk9p2Ld
 ObOETKjpXvN+CjYR02ip2L0GQ9eVU6r2KuexfI6bESXOvdWpbGVIqBa42KYBBlzExLaDaY0sC4+
 ef+lpkPt80f5AroZDTQgHZuyegRueR0spZ5UX80mWfdTJ2b3yTk6lMbi+MjuLOekLeqgpoIj7O+
 h3wtQUp5emZWkjB7efxV8NSAah0VlQbeQVQp3nfj/xlutAs+UtK2lqEZIrZ4tgqE7+b+mw5qeBy
 +FRxwjBWro8Wr8i40ut3cmU1b8EreFX1YYdU0Etbm9b0ymr1caxBJ0jafNuGitRrlO5vTlutA/h
 a1ha/l5HC/b6n5OproKD/ZAkUOAjKCS6M8lK5LbZhLnrctE7fRY+k1Cjag9FFzS6rbqu0N+mDDA
 kfHnlDa4APuFTENgpow==
X-Proofpoint-GUID: kzAt-LolfiGXb5QxR4Sh9HtF8hlM643C
X-Authority-Analysis: v=2.4 cv=F8dat6hN c=1 sm=1 tr=0 ts=69aee636 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nFBmfCUKH4FirDOTGbYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_04,2026-03-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090139
X-Rspamd-Queue-Id: 6255923BA3C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,glider.be,arndb.de,oss.qualcomm.com,kernel.org,amd.com,fairphone.com,bp.renesas.com,renesas.com,vger.kernel.org,arduino.cc];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-96294-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,3c40000:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,0.52.125.128:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add audio support for Arduino VENTUNOQ board, which has Headset, Mic, Ear
and Lineout connected to external Maxim max98091 codec, HDMI audio
via ADV7535 dsi-hdmi bridge.

Co-developed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-arduino-monza.dts    | 66 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco.dtsi          | 55 ++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
index b6db2a7151f1..be62b3dabbca 100644
--- a/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts
@@ -80,6 +80,72 @@ hdmi_connector_in: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qcs8275-sndcard";
+		model = "arduino-monza";
+		audio-routing = "IN12",  "Headset Mic12",
+				"Headset Mic12",  "MICBIAS",
+				"IN56",  "Headset Mic56",
+				"Headset Mic56",  "MICBIAS",
+				"MIC1",  "MICBIAS",
+				"Headphone",  "HPL",
+				"Headphone",  "HPR",
+				"Receiver",  "RCVL",
+				"Receiver",  "RCVR",
+				"Speaker",  "SPKL",
+				"Speaker",  "SPKR";
+
+		pinctrl-0 = <&quad_mi2s_active>, <&quad_mclk_active>,  <&lpi_i2s4_active>;
+		pinctrl-names = "default";
+
+		pri-i2s-playback-dai-link {
+			link-name = "Analog Playback";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 137>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-i2s-capture-dai-link {
+			link-name = "Analog Capture";
+
+			codec {
+				sound-dai = <&max98091>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 138>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		hdmi-mi2s-playback-dai-link {
+			link-name = "HDMI Playback";
+
+			codec {
+				sound-dai = <&adv7535>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai 145>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
 
 	vdc_3v3: regulator-vdc-3v3 {
 		compatible = "regulator-fixed";
diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 0727dbd44a75..ef2cea0db048 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2885,6 +2885,61 @@ lpass_tlmm: pinctrl@3440000 {
 			gpio-controller;
 			#gpio-cells = <2>;
 			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			quad_mclk_active: quad-mclk-state {
+				clk-pins {
+					pins = "gpio5";
+					function = "ext_mclk1_c";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			quad_mi2s_active: quad-active-state {
+				data-pins {
+					pins = "gpio2", "gpio3";
+					function = "qua_mi2s_data";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				sclk-pins {
+					pins = "gpio0";
+					function = "qua_mi2s_sclk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio1";
+					function = "qua_mi2s_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
+
+			lpi_i2s4_active: lpi_i2s4-active-state {
+				data0-pins {
+					pins = "gpio17";
+					function = "i2s4_data";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				clk-pins {
+					pins = "gpio12";
+					function = "i2s4_clk";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio13";
+					function = "i2s4_ws";
+					drive-strength = <8>;
+					bias-disable;
+				};
+			};
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {
-- 
2.47.3


