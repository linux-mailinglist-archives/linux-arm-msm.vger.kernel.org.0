Return-Path: <linux-arm-msm+bounces-85213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DDACBD1E5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:16:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B482B3019B8D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9F8532D0E6;
	Mon, 15 Dec 2025 09:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kaYs8M+c";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WJDh9wRz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BB632C33E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789658; cv=none; b=BZfWyd/wqhZQYpHYg1Tjh1lCZQglgnF7mVz0arHWQqUcMnhz2P3OrlDOwoCRNxRcvymtlrAl5C/sapFU0edb4J8QITacsVb0vzvxHAEClIa95qJtBpxtefOWUyb2EYZ4jgQtvQDmVEB+cYGv4uRosf5jfnmx76vJs6wlNueSxhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789658; c=relaxed/simple;
	bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YsbU9TTqNup32EfUNqVmhdpYB5sjENHLxHVwx8sVuYYtpasUDGlGCl5NWSGgKAT1UfstUT7ditea3WgjDXPRaUmEyZoYDGt6rvCYruRxk+LBjYktGGUluteYbvEuhan2BjWS6DM6O84viL4/Io0EnwUbQkgVfVxfDv7yTM1RNGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kaYs8M+c; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WJDh9wRz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BF8NkYT2674040
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=; b=kaYs8M+cKUCTwQgH
	tWWpwE3LoGK6IS9ABT9B9IJs3z3Ah7/2SPiF9hOp5d/b2wgbrlnJ7vwyctJLB21G
	hDz4JWtFJOQvDV22udwB1ie37nvF+oUfE0TYn4tPcb2QIXi1jBEMK+1Lj5Rzcqsn
	Qs5qeYYNq436vSzJAldiWMuYWicBlfKzm3DYMagEMFHLyiumjTcXI2YTl4SDObsX
	sEYM+6klvTaYUE0BCd6rhGgLDAKLfUHzQcF/VhB5CvLiUa24VQhjLCB+bngzreyw
	gtyDFZiXNaQvOozpvzaENxklwYSliMuG0UERamUQZNKKPhXuyAF4bUlWRQVa/5SH
	6GZm/w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11c6kxcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 09:07:35 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso3647843a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Dec 2025 01:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765789655; x=1766394455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=WJDh9wRz0iW0RKISadgz3Gdy0mvFS40IqTTJSkr99O+WU3MYUsWl0y/smxxjoF4Imp
         NcJU/vSAMnovTJKvaH2JTz0uwQrUKQA/WNMCib3pyliesB2TAQ+FC1lz7NfvQao9qMNJ
         yNukSgWzKm9QzPjpR0U48SHLo+6ga5nGJkBt/dIT4bKZirlYuXEN3IUsOSyDalpiX4u5
         AqdOer4D3XKrZTtp+woRoWoLpRVv8xby9MVN/zrmA2Er5v0OxsjJIImVvBFVzhmzyKrp
         UCwK9rqJVUtVqwLz3hR3z3z3/tze4NoH6DEvZPwJbWI7Abgwb2jF5I0p8BoZn6qC7zbW
         le5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765789655; x=1766394455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BsoJakIjxjZ0DCaogMC7NG1jegf2J7ave9kJyPQ5Zx4=;
        b=Hkw0BqnCztOTc9PqKzLqNv7jY7cKWF78KilB+0RElNSzOBQEYqPzgVZ0PGNKMXYy12
         SAesiBtPv5avsj3Y55sbDmQOtVzRAbVXg3cIhqscD8dBsU9OWqSPeMawx1n/mSb64iCf
         g3lXCyoZqztgJT095uQ58MBOT4JakK9iCkLJewenmkEC+eM6br4fHfzEJ4UmVjAGOznC
         ikJ5Se8mI/z5UYh97Mv/Jgs2USZNXgYOYZjpYhrOcXoPdddeR7SQP+8u2sqGs9HUqyYU
         Old2K1wlGSoA7BrdGXl5DZYwGGXxFZV8p5B4d1F5pCLhfqzCg5/wTpFS5FEBDts4GGT2
         czxg==
X-Forwarded-Encrypted: i=1; AJvYcCU24Xf1MHryHWxb0f8l+TpDp8yFfnNX0iZyV1WEbUdI4sccR187rCfqy+1tNhS56YM12AVUuwl/Bwhq77Nd@vger.kernel.org
X-Gm-Message-State: AOJu0YyP05Kh7b5YefoQYCnm+lTPTi+YsnPvIffiTGtr8J7wGIHXeRBR
	rwC7uBP4wRozipZTkqndJAryuCYaw8TTx0zd6fzWo5tj+icl3Zbh+FEwDduDOj/WGF7S2JCpgZL
	icdQhsLaZVlAb3F/b8Bbz+++marqDMFi5Z8XeIRcG8aU1RmUdonrXJvYqEEoUsOjMPFWv
X-Gm-Gg: AY/fxX4J2U9dtp9ffNHIYhuZWEy+yURe2ndi3vvUDYnpQsgSqVHuJ+JHGI2f5ksd7VY
	vj8MxNALkZqm+zHFVeOrNp5SRDUiwxHCl6CZfn21eD5Vu4vR4ZKbWgKDugvTjn7uTRsu7rrvBmV
	BOhCJ85QmN6HouUpkC+LLEYDfvpdGOJtXuXBvafvw6CuicjlgAxEhpTtidMOwMEZDi6B0zXT4Gq
	7EnF2ZLf/M9LdBvdZoiZa0xqGZ1iUsTR1haLKCaM2zkYT1WXp4yiORhZPSYysb9pQaz+oY2K10f
	0tu9mlvmm8ezliuDiy46nvw/zMUuSAMUgnDnHTUmKDKl1dNm3AhADc8fYE0q0hYUzDJ4o5tn8s9
	Zuzb0J8/H4duoOuxyRlOa4ylRwgiYr+Mc2cZhk0D7AR9WSFp5WMZPch6L64Ue
X-Received: by 2002:a05:7300:1897:b0:2a4:3593:ddd6 with SMTP id 5a478bee46e88-2ac2f8704f8mr8056393eec.3.1765789654548;
        Mon, 15 Dec 2025 01:07:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjsRxD1q6NbgLLxbdi6j/Z8uU8zeTfk34+ycCqNaAljYK91SRJlHoQFhSCZZaElNubLA6ntQ==
X-Received: by 2002:a05:7300:1897:b0:2a4:3593:ddd6 with SMTP id 5a478bee46e88-2ac2f8704f8mr8056370eec.3.1765789654047;
        Mon, 15 Dec 2025 01:07:34 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm15439671eec.0.2025.12.15.01.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:07:33 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 15 Dec 2025 01:07:21 -0800
Subject: [PATCH v4 1/5] dt-bindings: arm: qcom: Document Kaanapali SoC and
 its reference boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-knp-dts-v4-1-1541bebeb89f@oss.qualcomm.com>
References: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
In-Reply-To: <20251215-knp-dts-v4-0-1541bebeb89f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765789652; l=973;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=PQu0wItBZrUuS/K1W/yh+H8uckkQdIBZbL7HMrihDHY=;
 b=jywXv82NxPEeKpIV8HfI9Jjw1gGvCsgHnDV5meuxZRaHVUhrgx39/cn4TPdre7DBT6U0hyiHb
 QyNiEcXtLQABCfscyjtXszlVQMxBiDyx2OGcP/ktS7IqT1wrrE7iTTm
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=actsXBot c=1 sm=1 tr=0 ts=693fcfd7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8VIqy9Yext5eKz7IjugA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: M2-JvtA-OxYTLIrUpms9n-s0pa7hiOkR
X-Proofpoint-GUID: M2-JvtA-OxYTLIrUpms9n-s0pa7hiOkR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3NiBTYWx0ZWRfXx/iIoJyuhVW7
 DxwzI4ZVPW93xmFPPas8KzFPX+xPaxPUx7RRLqsYtSQVNK7DVRSAXYPMtySH7BdxnDqLn5+LrWp
 9vNGqvIu1oyHmvW7jeWQ3QMQGnTdD7rMJW5Cxt9QdyhMIlcTSTc6Oxi7r3leOepoD9onFcPg4+J
 IpttDntI2udSw66o2k/ZzwZuQ63vAdAvnWDDa0/P2Wd9O6xWvh8AL8rCU1lmL9tXeB3vWf419Kr
 9Z/Ji0vshlCXv4cg2s8bUrsZLP8XWwryEeTecc6/oxyKSb0c75B/ery3O2fhoba64eMT30SWEIv
 dX8Vo53HJHeS87wW698Dnh10+0QN2jIFu8pGXFCwsw4YWZ6szlpb+GXT1tUaieG3L4TPQYF715o
 rPaTXB+B7lJEWKhOBpfYZOlyTpT/VQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150076

Document the Kaanapali SoC binding and the boards which use it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..da287cc9119b 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -327,6 +327,12 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,kaanapali-mtp
+              - qcom,kaanapali-qrd
+          - const: qcom,kaanapali
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.25.1


