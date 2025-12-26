Return-Path: <linux-arm-msm+bounces-86644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B25FDCDEB35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 13:33:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C3D3300942A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 12:33:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7C2868A6;
	Fri, 26 Dec 2025 12:33:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CmQo6Kxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+nub4le"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9FD35979
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 12:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766752399; cv=none; b=bzk11na3CU4QvqW6DTR1cQ0PqNoyU/KvGgRwBvoEBqpuIgfGeikI/zqXnb94Q1f9Oc4Rv9xqAKm3xCwYaETMxt5LRU3HF/iMGF+Ijh7UB/GFnoJ2R6JrcDRSvBa6mxtIaw/rckghCGZ4kQU5e/N/2tAXsO3DWdhAXqyccsCKVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766752399; c=relaxed/simple;
	bh=BfXcXEGjOp5PexTkR2J4p+xf5jzu6P/9zQKbeX/afhE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JVNGxhfcf7SU6zCf0RNQEDqt1WyXQ3LumvvNoxKNKQxuvkmmuZNxqAidST30ChjF8n75r+xUe0FIlNev0+T/TG/cewCKhzJZ8OyRqugPvuyJjsoTHliUTYHZZmtP/sJFDStZ1ERPfOeA12WCNaEU61ZZoL8FDws5+OFwQkOQQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CmQo6Kxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+nub4le; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQ8bjtn586949
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 12:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=g/2ZBukE+OSOHiQCIshOHY03F9Rzucomp9k
	2YNJaSVU=; b=CmQo6KxyTZpJ0SUJMuBsePgQDCcAY1FwufjfGGOfLxlnTLJoUpK
	FVz6PZf9V9Rmyq1OS29gyrKoay1pfNtYwcrs364ipEApQMdIPncwthSj22sl69fL
	7OBAY+bPf9eoxrIREBET7MaNDKwbesNamufg+UB88NvSgNu3iX+34zCO42cEtZk/
	jsXkNbLKlp3bBdnll5JXJa62agqsXP0iyO0cSYY2ILOWALsmV2u9xGVLwtv20o2B
	On0jSJs42Xu5InRHLj3q116LFyglJBPNPdCyLIDiK29x5icDGW70L9mMHU79mtlI
	mIM8tTWrQSuERLg1AHmTjlRgThOEsOxma5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9bgm9n5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 12:33:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7d481452732so14422339b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 04:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766752396; x=1767357196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g/2ZBukE+OSOHiQCIshOHY03F9Rzucomp9k2YNJaSVU=;
        b=D+nub4leIi+0ny2wAjVs2SEKrx+hBU+f7zGzDL6UGuZufSy3NhVJvP2iPLL76BsokV
         BW9TzcjFqYgL68h8Qcsk+NVX5QLAh1iMgMqoYVu9eyXmTlaDXkng1C3BwBtrMkYQ0pML
         OetP5D6GdphXksUIFO7Sa9k4rWMuD1l7bmjao+2fr5UAsuMPAuIDedoXQ40oA9LcvE5n
         YabNk2bV5+pPCm3eP2QQ5R3nxv+v+cK2MwP6Too2mXjknx4YkwTxt+tN793YsEL8++iC
         TG7RqL5q40NFZF6mcPguVnqsjiZEx0IetRVIt4mkSXuHIffqRpRsfGnba2a71njqnmhH
         ENxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766752396; x=1767357196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/2ZBukE+OSOHiQCIshOHY03F9Rzucomp9k2YNJaSVU=;
        b=IJGYld8yc9htp3U7wO9phjdwZiGNE5uT5PRFkhHkUHxse8VGTSmmf/R0uODeW1tLwj
         /2xhcUCa0J4bNfnxSvKEangGoCgiHfd5VD6m2qLgDi3xK3+Zf5GQIUIc7kNZ5vgfbkTC
         24KN4vQg/49wVMeIqgPTKn1zJ2wzLZAHy0MUf5I3yqzhjnPnbKSBViLMnyt35s14Ms0k
         e/iNuzDlWh/ME0sV7Ux4NEDMVH1LDLo73mWsbRbW1psaACeC+nGi7UOBjpe2Wl5rm1qP
         q94EoYaLAGAdOC6sgloGDcvvRLkxiJ2KFAhu7JifMtoS8pkGLPkq2RSSoROVZfINcj+5
         nR0w==
X-Gm-Message-State: AOJu0Ywk8nUwvnFw8w9GlvGi+jNQ5uiFg5xfx3DW+wSH+0Adm2gYERY+
	T3OB93n62Ye8U+D3H9VDsWs+MqGAWIJaKXTfsI8v5MQgCHYB9DM+O8GywjCl4U9JadutmbiaAn9
	JaQdMQXRDLgm00u9mO9zGXsv+7b0EtiMKz3Oay7svePRLsuYJxmDbFTulYSIKwlnOeDxq
X-Gm-Gg: AY/fxX4Ht0eu3Et+n9SEbK/m56SAFeJYj7BqC33bCpi5TVlPcsF7cQkYmUoO58YXhXi
	vN0YVbRB4qt7QmTVlqRA+rLk+l3Rxi5KXudT40IK6CsgDvA+wMsbXQdYSHTInNGYoCsB4rgZlUh
	svQyBZvWZaz9H3gHcFWOTZ6sf4RZQD7pgafW8wwNPoW3lgabYUgpHVsbxYzhG61W+ulv11V6p7J
	ZsDwE59qfxxOsXS68tTnQP5Qxy9tjPo98Aac5MWx59iM2X72WjM7BNEIcskuhyGyAAB+7eKwUfC
	+j3gDXjecohLlYr1iwTQvN4szskegQB8ZapiB6XZK84oBxAtR7XEqJgBLxwvCqhyyyh9ltnOUoY
	WCiuALp9iHXJ0L+PRRUoTY7sHQsTipbzBDxNFo60=
X-Received: by 2002:a05:6a00:e13:b0:7e8:450c:61bc with SMTP id d2e1a72fcca58-7ff6607cfc0mr20758574b3a.44.1766752396528;
        Fri, 26 Dec 2025 04:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8MI8Rsi/LtsZDgsB+f+KdxfQyaRAkXtJdRyh9xD3gT718ARqDmeISlTScYQFTQB0dDWVAWw==
X-Received: by 2002:a05:6a00:e13:b0:7e8:450c:61bc with SMTP id d2e1a72fcca58-7ff6607cfc0mr20758552b3a.44.1766752396050;
        Fri, 26 Dec 2025 04:33:16 -0800 (PST)
Received: from hu-anshar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7a93ab3csm21853696b3a.7.2025.12.26.04.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 04:33:15 -0800 (PST)
From: Ankit Sharma <ankit.sharma@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ankit Sharma <ankit.sharma@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: sm8750: Add capacity and DPC properties
Date: Fri, 26 Dec 2025 18:02:58 +0530
Message-ID: <20251226123258.1444419-1-ankit.sharma@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: TEFQaAqsZAGP2WXyc4qsImN8yt6oA6fs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDExNiBTYWx0ZWRfX9M982Rt76SuF
 2So0dPomnlwCPUc0z2/YOA81AgKuPoseb2H87qPKBgS4ngQM9EDv6C9wGHJrr+G9fGLOpDQQeUt
 HWy7cOcsWW7Yg3QU3U+++nuZHgn5zxAntKVXJkoeVdHIBPbDt/0BxwFJmU8O9PeNr1C6y/03lkc
 io43wOnfOFfaV9fhuOe/UpQOer7qW70SuAWBeHw9gz8O0W4BhlQjVVS0AdE8722fW1WCmtIoVLb
 prgr3tlSSo3i4kvxgtJrE7rOVqoDKao3bjxRk2EkUs3KMizJfesjB8LJABlKCUeQX0ohth81Y+f
 e/1UWN2ztNQSlcVY9GBOOZepAaD3mJsiQnCFgAYLuqKi7ZhUj4hGOtHdY8y/h/n2CJMsV7Z/S3k
 8O4AEFAhtPp442Y3Yg4FzLSGQW5dNqGWdsj108pO1KFafK2jhbh4Qs1lyl4HG6gxUmBwkXxoOzn
 C06NQSy01X7gX8nX5Bw==
X-Authority-Analysis: v=2.4 cv=Mbdhep/f c=1 sm=1 tr=0 ts=694e808d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=w7H_r0yA3_GDxpqraYcA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: TEFQaAqsZAGP2WXyc4qsImN8yt6oA6fs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512260116

The "capacity-dmips-mhz" and "dynamic-power-coefficient" are
used to build Energy Model which in turn is used by EAS to take
placement decisions.

Signed-off-by: Ankit Sharma <ankit.sharma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 3f0b57f428bb..c93511bf4625 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -37,6 +37,8 @@ cpu0: cpu@0 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd0>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;

 			l2_0: l2-cache {
 				compatible = "cache";
@@ -53,6 +55,8 @@ cpu1: cpu@100 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd1>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
 		};

 		cpu2: cpu@200 {
@@ -63,6 +67,8 @@ cpu2: cpu@200 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd2>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
 		};

 		cpu3: cpu@300 {
@@ -73,6 +79,8 @@ cpu3: cpu@300 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd3>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
 		};

 		cpu4: cpu@400 {
@@ -83,6 +91,8 @@ cpu4: cpu@400 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd4>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
 		};

 		cpu5: cpu@500 {
@@ -93,6 +103,8 @@ cpu5: cpu@500 {
 			next-level-cache = <&l2_0>;
 			power-domains = <&cpu_pd5>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1792>;
+			dynamic-power-coefficient = <238>;
 		};

 		cpu6: cpu@10000 {
@@ -103,6 +115,8 @@ cpu6: cpu@10000 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd6>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <588>;

 			l2_1: l2-cache {
 				compatible = "cache";
@@ -119,6 +133,8 @@ cpu7: cpu@10100 {
 			next-level-cache = <&l2_1>;
 			power-domains = <&cpu_pd7>;
 			power-domain-names = "psci";
+			capacity-dmips-mhz = <1894>;
+			dynamic-power-coefficient = <588>;
 		};

 		cpu-map {
--
2.43.0


