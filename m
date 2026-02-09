Return-Path: <linux-arm-msm+bounces-92240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id dVDRNDyoiWnfAQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:26:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 761A710D886
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 10:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DBD3A30054D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 09:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EA0E364044;
	Mon,  9 Feb 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="adrs/rij";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qqj6OCYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382BE364040
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 09:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770629178; cv=none; b=YZip6Bw5/h/4fjBgHwrFK6i92V8GQcR5Accxn2lhZGzWFwqebNgpXYYz7CyEbtQoyiDfL69f6ZdgE466+l7WK7vk3Wb46tufphbeGjEZvNzJO2XC9iRpPBgITpeG7TjKS3/Wq268fwlPUFHDLZf0EJVns2BSK3ZS1bzXX0mtAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770629178; c=relaxed/simple;
	bh=NSDDzvN4sVICK5kalyl4DaXX24Ug/AkElLXfEx1LyNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HRWnSDazkKrUxOVF4jZKm9wG3TmddwYYA7ImJr68HD3w+yenGJZI2mpLx/tF5mEvvsli6eVSLdcRTgBJ1B/uzbBG7et4drpBw3ZQMIn9YeqEetgoi6k7gzZ9Da52/uMhw943LfRAEpy6HkYYgmLSRyrw7axQy2TiYigr3VLI47g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=adrs/rij; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qqj6OCYN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6194TlMv2600912
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 09:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Oz4zhM8nUNvmCfbKB+KQXl9NIgA2NhYbqvO
	SqUedN08=; b=adrs/rijFKnFrpYOoKAcW7xq9fGVVEyLNbREQ2gMFyqiC6U1LAU
	v3f5S0nhTeOHtDhu98H3A1veihc3jb9vdkQ3qsY2vH0fPw261EpMWQcWU0no5Glm
	gunfO/+KCjqGWAngcJZb9JwPdyjwzG3X6QuDqmH1fnQsr3yblF5UJsLDA8MwOK6H
	cfJXMG2uj5WyQdSsZgyoPO1/bFLG+qTfUdJgDBVlu3Cb04L5RuLHSJuEsHC7Xn+5
	2Jw2d9T50j2kYMVA6afYaaj4Ul6zFbHG2vJfDBuaF5YJ+VOvHws/YhjM0UyV1qZc
	LX+MNJmWnyE9W8RrtOmXz59v18SNN0Hf9Kw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c78kh0xsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 09:26:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so1239497785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 01:26:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770629177; x=1771233977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oz4zhM8nUNvmCfbKB+KQXl9NIgA2NhYbqvOSqUedN08=;
        b=Qqj6OCYN7NlP+sKW6lX08lwQ9pGISM1kkTnuHks0JphACWun31M7HJ4yWLciytUnto
         UVZ3YcTh+6Yvb2kyi4BJbQ1Auz/VLn/1T3g7IXitfOyR1Cj9NE6lSrgTAidRX58ya7aO
         tlsA3iEE5Ob0mdWut4fz8o3bR2bhaPEjhrFgtZyeV7ctr8VMRKvCQQlYC5M0d1W29rAh
         AKhh1Kjn6RUK6cjm3B7loe7v8ZQAOlWltZS2ppyu0dSQq5iBO84iT/M3dJbClR0HIh3o
         RRy0ItdRl0osKKfzxOGLzplP2ROr2PlKNDx2fznSQRyqGCrRDguT0gV8tMI0Vh/R2eq+
         473w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629177; x=1771233977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oz4zhM8nUNvmCfbKB+KQXl9NIgA2NhYbqvOSqUedN08=;
        b=a1v0n0ze1rnmyqaWCVe8YWzTF9U0iu002YW0oksap+U8B5NZv8yCgTd6vNW0jxTEG+
         mCS/1Ih2pGNIKeX+SzONet4rjntr4VTmpGJGkGruqmlOyhQBJcjNU+ExoSEkOheP0p7K
         CXTmHfIBsqtCyA6h/lHW82ToGDMNYYgrRL/DPMzwJVMTEwv67fJCVvsOa5GCEs4ou9Ew
         wbFiD+c0Z4WL+rj2BzLsKvaHl9ts7v5828nLD9R8KT5rwBXBfFsouVu3/HGEa+QPPHE2
         essa7/gyNwo8BZIlKGfuhdQ5C4qGznSQ2YytS2qfxaY623CRndjEFcC8m0mx/bLVQtOg
         rB+Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+Mmk00rzLUMomDKPf/ngb7o02SsJ1ZYl1gAeCtXrM+6oedLQxF7F2q6ksc80//Vlw84wnP+HX+c+NKgDk@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo9u86pfWgEsOX0WPqvNLpaDhZoH7i/URF3NrreshaMybT2MwI
	xV4+DM/L8U1d7X2iHDLtBARWSJ/RKCJk7LUj68gAJaQJGqIiqaDkSU02oEDqswFMcFqEKMtdd7d
	Z102G4wIYlriXlwt01hWrIZTBMQeUJxXFeO7TAAlEhV89zZfai0Y/7hYRvhrmxYr8pojX
X-Gm-Gg: AZuq6aKfWviQ1h1I0bN+P6An1fjfOpX7vTouvRh/qng5F9F0lQkrmTqVctpVPapdkFe
	7uAIMDveX5iOf9RvkfXovBUnwFxWXsC5M80ulevQ3wrK32CkxbnY+ebnE6pMZ2tpRUOesT53mTU
	27bqRABkjar8hswTfh7okwAG6Nt7N4m4/gYnPVsUT/4nVDM6C+RHB9pXrraVizHOdUBmuzOXr95
	eR8iJ+xQYG/vhatCBX01ogTnPupwPWdsOEvmURxVprXI2DLXbW58jiHOqt0e7XLVWTY5sr7WMrc
	Mnm5dTnB55Wc/uywU9Ts1j5xDHp340TEndqdYbwogjpiSghbyc3PM+eBw5x7vLG5Lg/jmlk4jBZ
	UD0a12qJ82ntPoXMBSoZ8QUKw4A==
X-Received: by 2002:a05:620a:4004:b0:8b2:e666:70d with SMTP id af79cd13be357-8caf0c459dcmr1514317685a.43.1770629176549;
        Mon, 09 Feb 2026 01:26:16 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8b2:e666:70d with SMTP id af79cd13be357-8caf0c459dcmr1514316385a.43.1770629176149;
        Mon, 09 Feb 2026 01:26:16 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b2facsm25654044f8f.9.2026.02.09.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:26:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v3] arm64: dts: qcom: x1-crd: add USB DisplayPort audio
Date: Mon,  9 Feb 2026 10:26:08 +0100
Message-ID: <20260209092607.23644-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=NSDDzvN4sVICK5kalyl4DaXX24Ug/AkElLXfEx1LyNc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpiagvsonlTKbjI0XQQrnpEVRwW3A4wjT5t1XPN
 KAlVLMxqOGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaYmoLwAKCRDBN2bmhouD
 1zyVD/9shjOTA4f1CWEuzKaRrbGYfnALTf4QRZYUAllhqsuC0y/5mDHGz7NhX1fwFvHnT5VPba7
 AfAAtqDHXzPFJ2Foyg1LReb7Y5PuwsAsMYXImWPAb9IQl7jSFZdpnBT4Op732Kz4XXRenoPhQvB
 3QQFBXG6BISVJTR68lPrW+QkZsnGAKqVC/QJKGaJyAxjr/n/muN5SMgM9auiILDpK8LU+MLw+Ys
 dqawJV1O8HAIeKHDMskMeJpvSPMkia/Yw62zEmD2EOcJQ2ZKVFX6PBIeZLTYdnvjbhgA1OjyWGH
 PP2tEeRb2oP4ZNXJbpTvYz/grrAUbteub/BFYvkgc570Ng+dD5pZ8dbwxJik/grzsxTMgj13zuD
 +oU0SYMqdtve5BQDdJEjVLpH28URbi3uJ2yDcM0RQhBeAhXhZjVkj1/3fSbV04nq/CgIasWuW3Y
 HZ+/wDj7Jp7VaWaypGrt6dRBFWYmq01ct0knv4q8pq1OG2obeuIinC6sOXsKbQGTA8WVogBLZrG
 eY0kIgrLMdFOUZ2os4ay4K6qFODWUUsWkJGnigX57kWtTaH2fXXHXUQGkPyuvIXHzsL4jBSBdGN
 AvKx0NY2L7BdHXIJmVeEl9ZcB4qKEuSVqFhj9DtSXhGHgkoXKZhB7Ayk0iotUs53YmCld4EUx2u 54yP3pDt7flTrVQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Nt7cssdJ c=1 sm=1 tr=0 ts=6989a839 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=bC-a23v3AAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6ODwBvgpoHaQwxifY08A:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA3OCBTYWx0ZWRfXyRWZ4OHkwETb
 gklWVeAEP+CiR2zZ47AbW4dhBUDsLvOyYMX0KU1SFuEWgTtWqhCfyhbMalHKbgzufxaOo/HtM8z
 RyK9dpIspUg0XAR97oZaHHKsxMXKkaOgGziPl22Y6U0O5HHVqXYSmJAI6yrp44IgH7gan/I1sLw
 dpUJWLCAhBGo4bjd0uK87TkyCo5fAb2XI2g7PtlTFbXQ+YJfxjhljaQ26Mhd6TO7k63JzuupI5V
 fknFVvGfReg81c9ItOKTOXns6+9HRfASajMGwCUq/OzjS+tTvWD6AHk28naRCzkNk6ky1B72vdW
 iWb33MIo8VF28GImZmn9DIdCSWINQYD1dzpyn2lWtyG6V9kr83/zD8qV0/z7xz3J7OPRWm4lENj
 eecKtqgS2TNEKmYrSyQAz7ArmD56OJfZcN/48ySEBVotZPDTNrkNs9q6vs2M0j4nvJWH986w9L+
 hCyTKbvOAzciLeeG/mA==
X-Proofpoint-GUID: 7cDINzw0YaLSqSjTxHNdWzinLs8xj1tc
X-Proofpoint-ORIG-GUID: 7cDINzw0YaLSqSjTxHNdWzinLs8xj1tc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602090078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92240-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,linaro.org:email,msgid.link:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-0.996];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 761A710D886
X-Rspamd-Action: no action

Add support for playing audio over USB DisplayPort (the two left USB-C
ports on the CRD device).

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Answering comments:
1. No clue about third port. I do not have a reliable working CRD
   device, so I cannot test it. I add what I tested.

2. Topology and Alsa UCM were merged long time ago, so btw without this
   patch CRD is negativelly affected or even broken (ALSA tries to
   configure non-existing DAI links)...

Can finally this be applied after a year?

Changes since v2:
1. Rebase - sound-name-prefix are now part of DTSI.
v2: https://patch.msgid.link/20250624122933.54776-2-krzysztof.kozlowski@linaro.org

Changes since v1:
1. Rebase (x1-crd.dtsi appeared)
2. Re-order cpu/codec
3. Add blank line before status for mdss_dp
4. Tags
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 36 ++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index ded96fb43489..9e43b48496f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -226,6 +226,38 @@ sound {
 				"VA DMIC3", "MIC BIAS1",
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
 		wcd-playback-dai-link {
 			link-name = "WCD Playback";
 
@@ -1152,6 +1184,8 @@ &mdss {
 };
 
 &mdss_dp0 {
+	sound-name-prefix = "DisplayPort0";
+
 	status = "okay";
 };
 
@@ -1160,6 +1194,8 @@ &mdss_dp0_out {
 };
 
 &mdss_dp1 {
+	sound-name-prefix = "DisplayPort1";
+
 	status = "okay";
 };
 
-- 
2.51.0


