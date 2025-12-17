Return-Path: <linux-arm-msm+bounces-85494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD6ACC7778
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 13:01:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 373E230378A0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 12:01:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DC8E339841;
	Wed, 17 Dec 2025 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MvLZplYQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Udab3tpy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D13E33B6FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765972883; cv=none; b=s0zdSB8luEH+IzxZ7cc4s+LLrf9W0KtGRFL+qRSuxcTHz1lfQ80KRrti1jQQpUvx9T3B4qu+r2euHSCrdPFiDjSkNODwEfmtZmBCPt12VOGNC6sy3zqCMwR4s36kwwavIlNt2Q8PmGUq9dJVto0dtxhe+z670XpPQkNd1wM3puo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765972883; c=relaxed/simple;
	bh=PX+L5WM+WvdyCH4VxcsnHz661zxSSdvXuMaFFouMbos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJykvTp7w5Io+Wac1iD3VKDf0KbdkD6awX66VHymkyEeHOqyQItHvtQQTHfuRMkLnUXNPi+j8uHiTOMxC3p0+QcBsaXwCTsc663skcrmRqe5SNNuXw2RIpWTjnT/cVOv215iuAKfAvIDElI7QYcSpcFYzvjNNDJPhh2NBsG+1fQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MvLZplYQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Udab3tpy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHASjDU1591239
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lYRWUTMN/CF
	ugWNOtordU4qRfBsPEyX8n5epXXTxcpA=; b=MvLZplYQOvU6sYUNe/fE4csRZ29
	kXqqqUBJZ6f73S7mx+bdOczF8awLp66Tk67EVKR7FhGPlUqHBimfc2/hRZadmO70
	AT3+0m7SAis2V2gnENucHAEE2Z5dg0VFkJzRluNoWr2Ie47HztyXC8c+SJUdlqdQ
	csc/H8zNI6ebur8LoQ6i1QZhIr8tpXy5w4C+KYNjGNrpkDLRgbvhhZzQJBgX/vHx
	naRrraXA4d2ivGlrOILS42BI52gL8D21FTrWsiDnM//lZAZ5wY/G8ITp4KSDBU6n
	zyILMHsbSRQln58j8q74fR2euVsc1FTAm/Hg4/x768wWjciOa76hx823TTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3fefja4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 12:01:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so119459441cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 04:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765972874; x=1766577674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYRWUTMN/CFugWNOtordU4qRfBsPEyX8n5epXXTxcpA=;
        b=Udab3tpyMucZgiizVw5ZWg2DkpHQ1IJ1P14VRUT5lv7PmDc4hPaRsjAfWa3WHhaV7L
         5RGi3+bFy97kHtEyWz46Hyx2iOlVpUAiKYqLRjEvqm0jFGHQ9T3kIUYgniyC7POjmoa1
         WYoJhQj60bvZVjD0CJX4EsqrdR7OAB0GDZ0+9sgGnyRKYphw97fAzS8oaGaz9TkZuBS0
         A4TpJMd1WoR2rqNfwOOZGGfehd/FjpDTNqPyIHXODJjMP4efx+lPCtpVexjhVhGF3khx
         EkHjWjpG7BlCUFzhoo+AfxiHpps5Xwzl9IJkQNaa/kLPsP0mFxznarsx4IH5s2mb3Qjp
         zyaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765972874; x=1766577674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lYRWUTMN/CFugWNOtordU4qRfBsPEyX8n5epXXTxcpA=;
        b=by8MtK5gz3lOTLgt5ljmxyRr/My52IJAXi/my/jteKINlCKL0f3tOyr1eznVUsZnTU
         2F61W2IVsbGiOObA5V2tj+afDC4sogeIicr2CMuPQ2zidHD93MqtszYYd3zQQTRE753V
         2yLUSNi6r1ljymunff8ND0xTRkzIIpQ+CYLRWW3ZVrvRDAYbxSjXbB7pKK2Vv5OKFA0Q
         4wbiFz3TqE9OYvyFWx2qO3Ag8rjNBs6FkYHKAnYmQfq98meolF8b9TAqJwKGFXnBBLuk
         CD1wfMhaN4ETS0Zm1mh54l6dD++kR7flTNO9R1RTQKJCgx87jV0U7x4pChmvVPYNUptS
         Rlkw==
X-Forwarded-Encrypted: i=1; AJvYcCU5z50Z6L4+ur3farp3jomeDyLyS6/wiEOBHP7lwrBDEqwEezYw6jb0xkc4J/ZO/A1xdqlHsBpbk9anpE+T@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo0fdMLxKsXXKxjJTh1A3/sME5SWoCdV5pQPwHN65ch58mlrFs
	sRbKNTkxAByA9UJdXwPm20vuVLEjtsRr+LYTlG93HWO725JFtP6z+awM4r7Z93/eD33Vbg4NGsi
	xNv3xVQkP5JmV8ysj/frq7PcQfgHf7QMYKswbGqbWS4Jn+guxux558GYAfcMngxdYwGr8
X-Gm-Gg: AY/fxX7UGuwQGTpxyqCdf9s5kPOMaBvlh17RUQiXymmz0UnRtYmAdi5Ur9wbBmthn7b
	gIRrdQYifRxGB5z45npPWvx+jgEn/W5KaIKqr0RPZuC/Jsum/H/HqqGtAIZpzvORY/SGFBydvkC
	2kwwljAK9x+I+Wo8sqDeNQQPngEPXKfA1rIkogKEaqVp6L1vssrNkl8lV2GIBDzgJSCYOIDGRa/
	Qg8VgRtASZ3kA0Ej+Z2+T50kffVx9WOGQVjyqaCeN5WxFx9JKdcCAV/VHLSft/QwfDyVKiTXREG
	GH63CGJldTip36NscgxTlaCNshjI0VnaANOFapuuQSi6VCEZWutlBf6r9xYHb2kB27WzvX8aDtH
	E02SyxzspMhWHg1EkvK4B/G3Q
X-Received: by 2002:a05:622a:4111:b0:4ec:f410:2470 with SMTP id d75a77b69052e-4f1d05fd4d5mr225626861cf.71.1765972873802;
        Wed, 17 Dec 2025 04:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHQI1m2qHZ5HeqRGgibGPpTrBW4BqDUkUQwJ0iqh4hFUy19xPY4ECIyvrO/p4rYRNg1g4TNsw==
X-Received: by 2002:a05:622a:4111:b0:4ec:f410:2470 with SMTP id d75a77b69052e-4f1d05fd4d5mr225626311cf.71.1765972873391;
        Wed, 17 Dec 2025 04:01:13 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b800530cfb5sm254826066b.39.2025.12.17.04.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 04:01:11 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback over DisplayPort
Date: Wed, 17 Dec 2025 13:00:53 +0100
Message-ID: <20251217120051.98198-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251217120051.98198-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1854; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=PX+L5WM+WvdyCH4VxcsnHz661zxSSdvXuMaFFouMbos=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpQpt3Lvf/6uLGOS3FMKJb5Iz7yTvdFQJ/O5SEe
 +8DzH6gXNuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUKbdwAKCRDBN2bmhouD
 18I7EACXtvc4DUECOyz2tOGwB1kTTbjTbbsA8adGXaA7ytDu1CjHhfkBr3OHrqxfco9u3/iNefz
 ErNKcH3hQX5yn5pFsTQM72Fd8qXW52fByGD9pXBMDxbK6L+7jLRb40gt1NRZFIvDpryBgLrn6cX
 WnFvNDPP0k/+H6q8JyxRCPsVs+4iq8eA12HkG0N3LgOk3H4xcKqvtbW4m1FNwL8hM3xP1iLqhEM
 iSnmPwnTLVBPhc14SBXYmI2dIaWTfqpn0z8L0rWovnV2xq24R6WADDXY/QCL/wFpwCSEskkur6S
 gGv+d43Z57vF12rXyKSdXnaPsu0m7PpMYkFFH6VatNT6GYAgNzdwwseUkIS+ifxNJqD3g8qKBsn
 o/1i18KxmwJ0J23vD3o81ck3q5aM5qXeibbdQr96zJHWWxvc6dL1wYXgDa/HrxSQsA2L1Z1z0Vn
 iOZKH0VKdNUCEwjz9GBXkfQIz0o3TiDrhnpr2rbFddL+4llra3eqC9tCpnytqCtXqyaJqrY1Ykp
 EMKhv4JDd9dWGSa1L+J0xPUTRDR+w+0afVSc81TK1SbfKBqHguxsmMTMtD5T7xWY1WBdZafkZDA
 OFcw/tcTGXI1N0VkfA+FGnaMOset3a4DYbs1ZG9Ru6J6P7eogKtQ7Q3XNQRHpHBUd06DRw+4Y+V naOQ/o7yqON2Viw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA5MyBTYWx0ZWRfX63I0JSt+G9cS
 Je7pjAUybzRqzLI4pMxhNgYWWIigWv9UhUKxpTf6i8K02PmgAqJ5CiOzgww0eIVUlWNzKYm4dEj
 POhhFXcLdS+r1uEAPIVtFSLcYm02m2aC0tdI3q0emtrlOE805faBn4h2WvHBgqcudneB8Miniog
 7+NZcY/vsuKaIaNtEZ1uTU9onyQkNFomtB9+qfzobGtPkXw1ev3kMolEN3V95KeexW9HJc9wrCH
 HpF/tjOyCgHN1QJ1uuYn+yn2N6HLHR1mC6JXqT0DcbvUluKrNVBrfqCZn0x+jS/RaB5VGuyskJs
 2eY7vO32AtVVk40Li/iyC8zAMtGUpXeoc1ZesToc/wOTHuNNZDi7JGJjsNEe3JNPqdmNrSr+fCk
 OAZ7kM4/JXkOXRvDICFfOZDBSZtY+g==
X-Proofpoint-ORIG-GUID: 2tGx54iDhB0TJOBHKBakDxNMs-OO4HIy
X-Proofpoint-GUID: 2tGx54iDhB0TJOBHKBakDxNMs-OO4HIy
X-Authority-Analysis: v=2.4 cv=R48O2NRX c=1 sm=1 tr=0 ts=69429b8a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=_cTrUepPJVVRW-beqBoA:9
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512170093

Add necessary DAI links and DAI name prefixes to enable audio playback
over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
should carry respective DAI name prefix regardless.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

ALSA UCM and audioreach topology will follow up as well.

Changes in v2:
1. Move name prefixes to patch #1
2. Rb tag
---
 .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index 80ece9db875a..7aee9a20c6df 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -351,6 +351,54 @@ sound {
 				"VA DMIC1", "VA MIC BIAS1",
 				"TX SWR_INPUT1", "ADC2_OUTPUT";
 
+		displayport-0-dai-link {
+			link-name = "DisplayPort0 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-1-dai-link {
+			link-name = "DisplayPort1 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp1>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_1>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		displayport-2-dai-link {
+			link-name = "DisplayPort2 Playback";
+
+			codec {
+				sound-dai = <&mdss_dp2>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai DISPLAY_PORT_RX_2>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
-- 
2.51.0


