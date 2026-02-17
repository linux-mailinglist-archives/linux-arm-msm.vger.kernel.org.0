Return-Path: <linux-arm-msm+bounces-93163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AlV7FQ1mlGkpDgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93163-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:58:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE414C344
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 13:58:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA86530379B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 12:58:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04E6A3563C5;
	Tue, 17 Feb 2026 12:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cnE8LoL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e94M/rHX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F3F3559DE
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333111; cv=none; b=SG5AI7Aa21mKLtTB3hpOdsIHGnmpk5IYkizscxHlTh+wL29HQ4ZImNesiE67qh7CR5E7PaV83FKo15KWpjcJ4A6QhR1MWbLlpIxL59PBdNEPa+hrGb0zOV8ofB1wlwbhH9cgQaHjzoXpWykqYqsrOLC7dHOTDGqdXaR4xXEwWZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333111; c=relaxed/simple;
	bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u+QpLDRKvTs7QNCtbO09RX7RwgVbzy8ktLsToAUVM+4TIH9/ht1gWf1P8FE0BU+owf04CN63mg9d4hRSOIi8FNHKGYdJZYc4hckCOpEMneZhwTxwvDa9kDvQJ34/yVoB1dMJbb53vbolQML2Z15HIlTw/wRVOXKnX/9EcfZY9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cnE8LoL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e94M/rHX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H6UjrR3394972
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5
	ud1RiF2I=; b=cnE8LoL/MaWGEe2zGeDcL81c5V614A7WZrAaWXCTcH62rSlPwx/
	qFuNPLBTjPhezexQiaPsswyuoCwqvHyUMTuprnlrGEX4LwkrxizYhhrNOfw8w8xD
	YfAILVhnr/+cSPzefwyHa1OAdqzizSxthPt15InrXDfIJ02PZKsKAnxhEywiH3hv
	0IPZGlPUwo45eOQlUD2nfxG0C4BEHmeeEU01z8At8wMFeG+luWZvbCPiaVmwGlZu
	bpqoPz4WWSa92Al2/uJP2kR4Opkzv56cZSYDPR/Y5s41d5yJvw5wzpC/vHJ1QRPM
	WYVj0gbkRg7dy2ZkI0hGxIcaSgd7dCaTnlA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khakdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 12:58:29 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8946f1b8691so275324856d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 04:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771333109; x=1771937909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=e94M/rHXoilBW1EIwTzK74EKtWKxFIXQB//TmPLesOCh8BsfIlAWSVh78kJwxoXrdT
         ukMNq1lSos4b5DDeMfywsxLRU599t13Wza5Qm1Vz7V4cuHCyUfMyOKUXAIeP9SgTBWTg
         fXAc2CldIFydk1TvKLXJJxrhQYXebJTKg1pnEATE8WmSI3DzUZDu2WlpU109cIoEMbRB
         i9ZcLBor3/NGxyMm/Ynz/M7JvJhCnsUSDFYqYEtf6rMklYsKvUyTtkbMhi8UnbZ8pOtc
         pJdqdgK0u9eRQT8d8uOk2YrgQWlfiKgfR8i0WAKHFmDPuy0u+JhAiPvGvwOXENtqMTQU
         HqmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333109; x=1771937909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjpGNItXzQUrVP2qT2sTaSiPzVbEmllTeq5ud1RiF2I=;
        b=CyStMEn5lrUGDjikMZfTcbZGVkbmGUEIGbYA7fFyn84OB17S5B65579Untc5nkUud4
         YSSRsmDjqYHlX5yxWvmYbhCIxqVb2OFcdMojaizSnw9mdru+QG4Fu2wfaTPKWvsf1wsE
         jGf1WYE4UKi5tG2ckl8vyzOLklCdedYZXtI0xCEZOfSdFjBmCtpezRxbIshUBYD6Fwj5
         3Ruzo+gLWqVbjQ3n0rA4SFBtiu+zdc+ENaxRaUKXP+QRtn6HMrNFzEQGfTyau36k32P6
         nPDrh8LRxN37jFdCkBcT5nwoGtQoAiNutMA+Ko1Tt6z7tW37tE+m6qPdZgTR25rkzDyw
         wqvg==
X-Forwarded-Encrypted: i=1; AJvYcCXh7grdz+XUckdzczGeiGMfaNTdZ7hywx58HKKRea4NpI9zR59K6NZJhOJCnyXSBemifIViD5O/1mMsXE8B@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfx3ej1SttGLruJo/ay4eERKrXEcQkn0FP62h+SqqqQW2pd3Gn
	k2dyh0PivUenDIA18rc411wzxz05QJ+v1oDTGHsqV6nloELxXVOvsH0VNzHGXaxBbVlsnVNfnS1
	eC//GZaP4h5uGh/581Cd6AibB9Ni38jVTGt5hskpNkMvvjCSb1PTgXHuFxq3vCFr4yKDT
X-Gm-Gg: AZuq6aIvUlF+TK21Xmi41rEQ57oVB2S0ocpq5EEzEW84xtG52m+cbhXlTEtOV43emmL
	hA3tXCyC4RTpX6W+TJ4TQolhfWwEysnUnc5tY3+3aQ4XISmHVI70IKTxiPJ+jMdQZ99s1XOvssm
	S+2u3fwDo3sV3JWXi3WDApVBXd8/s4fhFqQ7Nt1jkv0cb+eZ8SEw59niSChdyvrL7n3Oy+2zsZ5
	lqImKDW81tGXrr+H3YoNtMlY9ur5+epVBLV2U4xuzBqxNpJrxOuRD8lGyt2+cp/II7yIiaPbhIB
	7pFYme3H3yyxSqENgP23nnP/tM2mrudlpz2mZPXSEFGHlV+r1yd4Xiot4qo/QzKrBWhZpDV6cJA
	Qyz2IlhDKBSVIRyhbmqcID/AceK2Pv3xrtPx2qA==
X-Received: by 2002:a05:620a:40c8:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cb4246f35bmr1472711485a.69.1771333108878;
        Tue, 17 Feb 2026 04:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:40c8:b0:8ca:3d7c:e74c with SMTP id af79cd13be357-8cb4246f35bmr1472709085a.69.1771333108467;
        Tue, 17 Feb 2026 04:58:28 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483801ff9b3sm229088465e9.13.2026.02.17.04.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 04:58:27 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] clk: qcom: De-acronymize Glymur SoC name
Date: Tue, 17 Feb 2026 13:58:20 +0100
Message-ID: <20260217125819.281209-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3178; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=WUGnTOWFqMXc2ozV9o4D93c5ZNEJhDsr5vmysU5SqCk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBplGXriXpz7WktQLUwWYvIUyE59iv0LD3W7dKxp
 YDI22efk5WJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZRl6wAKCRDBN2bmhouD
 12/JD/94P9bANG/t49BHTN11QmJbtCihBT63U6GyZ89KjIBtsHNW6Uikx601sJ3zrv808Hr/P/U
 gal5h9x1sQYxe2NpcKiCbXW5iBWY9QoZDwF6zYtAAInWgj4cH83A91RkOAdp9P5Fa0+S7dCv20X
 YlOa5j/hU0X/CKnwiMBCTspDiBcHUVyx2cc7ba32XIrajqwoN3CPfPR8Yg324xjTrFKYkKMXsz3
 5UC6N2+WTbZ3eVEI3omF/FGPR/I59Qaio0TgZDstj0XPwPQfuFs81NVX6MCBm7sue715YsUKyDP
 aox4AO4LU2+DLmKQi51NvAnjEncIVnL817AqOqNOJTt8nGgp3vj2RQnJ1yoAGW9seImuxUn2GYr
 lWObna/z5ADGKYrknP2bRUUP0gqoraMtg9ciXAR+lfxnDj6gwsETvHpMPhWnzINBnZOJ/F58/ze
 +/oZF33tRoOPdCqfXyJ996IscdkuzxxLGsz4V+jdsvG0acM7UPIOZOAFQO+WDCYyY0USqnV6KaT
 ZQI3xYEXb5Ol7J3VeusClvsa8nA00W6RQpGEAouHjVIumum2XSq2KnuiY2IOWZ7Al9yy+O4c+aE
 hzYEjjf7TK0mhXc9ld/0lh3TVWr31NdLjIWhtab2skU/pj2kheQWdixZ9YS9FuQE9YqFaSuQiaF L4A7Q96LT884syg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=699465f5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=aiRL1Prnfr7jdu2lDmUA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: wbKlPgHMXuSAweItcI1-22TiyGeDELqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDEwNiBTYWx0ZWRfXwjAWHFaWCMja
 BF0ZaBI3sA5LzY6aNG4yBjGurCWJdpHXgEnF6mdXThP+6D8IK+CARCSGzAXsl2ww0s53zCKgAvJ
 o2G8UK3jOu6pxhRurGaOsA70/Xz+mcfwYyQpo/yiEKcx8Ke6Zybpz9IL9hnZxWajuXTrEgQ3pbR
 hKnPwbRnPIYmZV0Q122N8Twy4ty0HeaY1GaxMigLWJwOFaRsrne9fR25cyMVbKjkyaYit48CbJd
 C6c1JrJb51gZpxX41FUnW96QETcZ6p/veHpRB0xV+iaMM7HfoZ9bP2k0IGYQr+IoUAaa292+JWj
 KH1UZpiYrQCKflwLmKp0thFZACUWAlRmMxj7TWB1eGQ95YUgBHL59EGSJJhU8KmkFnQxwtcvm1i
 d+rhyciqPuKimYqEiE+vij6Fqcs2WhFEnzYzmDSdR1I7JNrJOzBA4Y+BKjjKe6mE2wCON0Cf0cs
 jQgwbg93Qar0dPWzkrQ==
X-Proofpoint-ORIG-GUID: wbKlPgHMXuSAweItcI1-22TiyGeDELqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-93163-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0CE414C344
X-Rspamd-Action: no action

Glymur is a codename of Qualcomm SoC, not an acronym.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         | 12 ++++++------
 drivers/clk/qcom/dispcc-glymur.c |  2 +-
 drivers/clk/qcom/gcc-glymur.c    |  2 +-
 drivers/clk/qcom/tcsrcc-glymur.c |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index a8a86ea6bb74..7c50d0965d8d 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -20,30 +20,30 @@ menuconfig COMMON_CLK_QCOM
 if COMMON_CLK_QCOM
 
 config CLK_GLYMUR_DISPCC
-	tristate "GLYMUR Display Clock Controller"
+	tristate "Glymur Display Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select CLK_GLYMUR_GCC
 	help
 	  Support for the display clock controllers on Qualcomm
-	  Technologies, Inc. GLYMUR devices.
+	  Technologies, Inc. Glymur devices.
 	  Say Y if you want to support display devices and functionality such as
 	  splash screen.
 
 config CLK_GLYMUR_GCC
-	tristate "GLYMUR Global Clock Controller"
+	tristate "Glymur Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the global clock controller on GLYMUR devices.
+	  Support for the global clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as UART, SPI,
 	  I2C, USB, UFS, SDCC, etc.
 
 config CLK_GLYMUR_TCSRCC
-	tristate "GLYMUR TCSR Clock Controller"
+	tristate "Glymur TCSR Clock Controller"
 	depends on ARM64 || COMPILE_TEST
 	select QCOM_GDSC
 	help
-	  Support for the TCSR clock controller on GLYMUR devices.
+	  Support for the TCSR clock controller on Glymur devices.
 	  Say Y if you want to use peripheral devices such as USB/PCIe/EDP.
 
 config CLK_KAANAPALI_CAMCC
diff --git a/drivers/clk/qcom/dispcc-glymur.c b/drivers/clk/qcom/dispcc-glymur.c
index 5203fa6383f6..c1facd4e80f2 100644
--- a/drivers/clk/qcom/dispcc-glymur.c
+++ b/drivers/clk/qcom/dispcc-glymur.c
@@ -1978,5 +1978,5 @@ static struct platform_driver disp_cc_glymur_driver = {
 
 module_platform_driver(disp_cc_glymur_driver);
 
-MODULE_DESCRIPTION("QTI DISPCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI DISPCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 238e205735ed..19f4b3cbcdc0 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -8611,5 +8611,5 @@ static void __exit gcc_glymur_exit(void)
 }
 module_exit(gcc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI GCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI GCC Glymur Driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
index 215bc2ac548d..9d9621a61072 100644
--- a/drivers/clk/qcom/tcsrcc-glymur.c
+++ b/drivers/clk/qcom/tcsrcc-glymur.c
@@ -309,5 +309,5 @@ static void __exit tcsr_cc_glymur_exit(void)
 }
 module_exit(tcsr_cc_glymur_exit);
 
-MODULE_DESCRIPTION("QTI TCSRCC GLYMUR Driver");
+MODULE_DESCRIPTION("QTI TCSRCC Glymur Driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0


