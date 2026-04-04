Return-Path: <linux-arm-msm+bounces-101770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WCc3Nfft0Gl4CQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:54:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6D339AD73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 12:54:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 970093006477
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 10:54:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C510328260;
	Sat,  4 Apr 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YqPDcqCZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBp4EvOM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9122311C2F
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775300084; cv=none; b=ebSfDVIc6fe1h9MgJB87KA6dhOorMVwqbCYd4xtrvC+gf99/5nN8nmccUBWc85TV6d0Z+YDhpoe6JELwuAA9KSma57kssesI45MzIIRZocmaXyJ6BmhTXizAcLyUPbIsY2+9p337cBBYOkrlpkiWek4C+br35RPutPyADcu8aH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775300084; c=relaxed/simple;
	bh=sRmu5BpeXarcwmBWs/DDTiNjVkNjTGtekU+vMz42qgw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WLTg4N0tmfEGgJYM/CDusBQcWvqqZJ2sHumYmiUQ6zON0ZVpolJRzZOPF5h9rqVgZ6trLKJc8rf5gOzzVXm1QWGxQU56vMmwwvKYdB3Qf+Dk2foYs6Vq+hqIZm5zBjrUZ0ZVluy3jhz/6DLOu+y/YC2kVJpnMoRZMbwgp7uCrTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YqPDcqCZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBp4EvOM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6340KKiK1310198
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 10:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h
	4HjDRdhc=; b=YqPDcqCZes02c+GpDK4A7lgMf31fr+CDFuCIRnpOq7b2HrgeV6N
	1WKrPyl6R1XGppro5YbComfGB5c8GUmb23hkhz2VdmgzQem8OBQRI3qcCi4a1Fel
	OojavYdae101JAGjMRKzrLw4cxqSCuhoXbqbcv5McMQ6PIaljSXvQ6J/rpQ+ugyn
	RfcacaGJEh8bww/SrdeaZupidEVnmtrY/Q7K8yhG8IJUT7gTP6K2HphiyT6GOJU2
	wgqIY8GyuWCRxTvPasGOBX2932Pe77IFkbP7EG5wO4ARPvGHz13JqKZqRYldcINO
	+Sjzk5PAEm3z2ZSuQOTWN6U5WPrj66ZYIQQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dar0mgwdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 10:54:42 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4076dc16so122547141cf.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 03:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775300082; x=1775904882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h4HjDRdhc=;
        b=FBp4EvOM+pVJsdAo6beGBAmiKyY8qtsTMde+jv9Kgy2WbukM5uLKJbofT/n9k0NkTV
         oMWieDldC41pKYKKeQlrj2n/JnSR4qkKxcD9rN3dcpWke3my/cV1Jrxpn/k39Z9VI8TT
         7viie/XkQxcgaPNtxCh6Yi6KRrsOS/9Uy39YIRuE61S1J9E3xuoqFYcQ3y7uiN9D9yuJ
         ldUVzOTUesi3Xja8Q1MW/RL1dL3otuBXbtcZZh2L460hih1aDEZYk9T4qcCEQGf8p6VZ
         xox2iQJi5EGFTmuyeGHbuzgHD/2AQJ2DOKKt949PgDpKRAj1Ed6uJsuLVt9e6woCASQr
         tw4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775300082; x=1775904882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41ajGIUNHtFn4SoYa964bpN0QALsULBT27h4HjDRdhc=;
        b=X6+u+4CNpst8QFtWrVWN4oJ7gf+kAixtFYG3ptjznn9+ykoQwpckRJZtTbFjW8P8o/
         l8CDfOu3ToUhXjS0qqt82ZaQ7UIFjuiQb/NG2HIC0W+t3Z7jvDHBmFNZtAyeB/DeLu0G
         a1SbFdfzgkOgvjqXWhOa7QHhS6b5kXm6bUKwU2VU66GPl2abXh5OtHptZDzjlE0/aRTy
         eqQm35yyJig9ziPYANFJ2P1nBTf1q4O7RySCP+OAM5Q7ARrDB54Lid4fAqpTVtKPnFek
         plT6o8xaI+NiSFn/6EEy0zH6j+5TtgR5gBWUf4Bg77LDFNWcmDT2uNhIf8mDxaPstLrQ
         5tsg==
X-Forwarded-Encrypted: i=1; AJvYcCXs3pan7DYh3X/nl3HT8jzAQJRVbAB+USoUKHZIYPieAv3ZwNd0n7UBaEh7N572uzMZjtGXImb4qioWtK1+@vger.kernel.org
X-Gm-Message-State: AOJu0YzAVsmmrroOdHxKmIzx8ZyytW9OQHzflOC98Z/QoV+MwDEvvID5
	8HM4VKzBZCkFAuFJgUBl2/JQbpqrQEuwnyiyWT0s0ZjqL1+SIZD8TYanhWUrkNfRqAjyhRWg7oc
	zhPgdsDHCfCG7sKoIGxDW+J3234IOVWx8+dFX86yq98zG/ie+hoQRd4TS71Ex7aCKdrUg
X-Gm-Gg: AeBDietEjyyD+m1/QnJ7sd5zMwjplCcKdpqDtYKKvzVOKFreHrUA6DraA2A3HhaNKjp
	B1/wSDELzcVgnTr+TSNw/LK5PnXJxZoLNkP1oxpOrMdnfYkQUF2WNGlsqiH7tVG1w/4aDsKLaqG
	g/PFAE4kOo0vsQ9hH5bjZ/xSLls43o0+rbXR9qUAm3FKkqf3DdnN4C/S/6AD8fQ7az088ej5HAt
	gX+n/TWXFciFvdRxL2Q3uTjUT40VzlDInU3YXjruFjPsrvyxrBYQFEvPgsCgHSG7aY2ySz5dYi2
	F+J+/A/JJzen65jXzXm1P5FyO9TGee3Jphw6+HGN5YbABms3keSEPIwMWbBqjKLXCOW1f7YaopU
	lWTyRHonDzKJ1HdC8WPgwFP2uUg210o0Hdjam
X-Received: by 2002:a05:622a:7ac9:b0:509:379b:d48 with SMTP id d75a77b69052e-50d62614be4mr67571921cf.9.1775300082174;
        Sat, 04 Apr 2026 03:54:42 -0700 (PDT)
X-Received: by 2002:a05:622a:7ac9:b0:509:379b:d48 with SMTP id d75a77b69052e-50d62614be4mr67571741cf.9.1775300081748;
        Sat, 04 Apr 2026 03:54:41 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d58e5sm25219957f8f.23.2026.04.04.03.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 03:54:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: clock: qcom,kaanapali-gxclkctl: Correctly use additionalProperties
Date: Sat,  4 Apr 2026 12:54:37 +0200
Message-ID: <20260404105436.138110-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=867; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sRmu5BpeXarcwmBWs/DDTiNjVkNjTGtekU+vMz42qgw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp0O3scyS2W1bnaDSbdWrv71bJEGBdceLO5SLO4
 kytGboL6SWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadDt7AAKCRDBN2bmhouD
 1zzpD/92xOMy2jvIuKrwX0AvSrbz8VnPNAC/7Z+NgCpT1xptRAIbwmBRakX9JDhB6i8rLNS++6F
 TObrEr5b0/H7+vwU8YFfZu4M37zDI4yPKH1kE8X2MthaDKie0tlpk/SzoD3Sh2uBPDMi6VeAWx/
 7zDngDUm7bKIKuh46joxFyvCcfBPlv0Y5OlmJzmw5nETPEO1ADZxBLxwjW8WKVYuyZZFIxKnzKI
 ywL6gy1USSTJf+gOpEUTvRWZpav0sMkneJVNSblrdpuoVmxwXqJr4kNZB8PGJwr7gV2MX/xPCPQ
 w1g8rE3suy6ZNngNk2zUkObKyV7QU4sY5QalQgwim62d8B1TZth/1AKKbnRQaFZSL+ArfwL6sFt
 kfD9CI0nhp6jZOQxrgo4bvABQ61A0SjoY8Y/ht621WvtGzfB5j3ksjhlUekfyIOMR4+/qj7dO1O
 nSsqk7bOVnJaHCcoIQPvplnbMv2xGQv0F1obrosU/6wgTeb5Djf0TWpxgKCuwSMuWifJa8x4hAa
 iVOpgjLmRqMNEfvXqLsah9svjfxLSYQ5mzZCTTvPhguz4lsU6KUCQjZyK6Y3A2q8kuYGxrw0Vrr
 bRX2ai8xLAluekciCrbXEnC6mdoJjCTpmTGj3BedXmqyo5a5XVA5Hq8SZhtf1gvHCTMwqMR2EVI Qxg0eorOpHjwP6Q==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 17poHYgF9Lp2T_I4uWIMq0mz39wucrH_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDA5OSBTYWx0ZWRfX9dxYleQ6HF9w
 Xi4SKVk8cYYbTdRmETnm1AjA9GAT5cXgtvgUkRdt8uwlhbbrRqRIfBENkDltKPkCzPZfdAu6g96
 Q6JDbM+mnP++sSiaPdZKlg1DmEnMfShomwcW1pdxbmbp45a3XN/EqHM10z7T2dBH2hO0cYfIG4T
 ZVH/HUEWFpQ1eVYedeT8M5o55wcuH8NJokImzaICoMxSFziR3kYy5gS4JDpiRXZDNdDTOpw1JkS
 7b4xbaLvWC6EUUqFGBj84ZxAGwQAYTLO1lGbWxy+ljxvV+w6w796hjoIiq/nWyXVzFZXO2tQJd0
 vqSORYqQ/vi2kpG6JjZpl8hGH+tmXcA6C/3hfAZ8cG0y+cUfm0s0AnHs1Rsk/H7ViVLzeoRulY2
 bi8Dd3G26roftBHqBGpKliyk6q5NLxAfaHQCeNc9+YbzVxi98GqMFyaIbiQrEUcUiQdIh0XXEk5
 ecngUvSLukRSDS4ghlg==
X-Authority-Analysis: v=2.4 cv=PpaergM3 c=1 sm=1 tr=0 ts=69d0edf2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=T6h60DcBTnRI8d2fgOoA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 17poHYgF9Lp2T_I4uWIMq0mz39wucrH_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_07,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604040099
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-101770-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B6D339AD73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The binding does not reference any other schema, thus should use
"additionalProperties: false" to disallow any undocumented properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index 466c884aa2ba..e868963f659b 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -44,7 +44,7 @@ required:
   - power-domains
   - '#power-domain-cells'
 
-unevaluatedProperties: false
+additionalProperties: false
 
 examples:
   - |
-- 
2.51.0


