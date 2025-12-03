Return-Path: <linux-arm-msm+bounces-84164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB74C9E3D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 09:37:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 36FDC4E103C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 08:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965772D5A14;
	Wed,  3 Dec 2025 08:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mfftMb4A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSNj6GQF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A292C11D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 08:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764751014; cv=none; b=sdy/cnHvN4OZZ5P/0XdZL9jIVWzcjNk3ZWp9Xb9TUF6S42zeuoLMae5bkNB9FEuxUWj0thNrSc50ACInrScYCnMHrnmv3uIrxScg2uZWFyE4agfnwlSJtMq2TqoBZW+ErFFpJMHuQHVzccbThZ8QsMqdAP9+3eUlLoNg4+2IHdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764751014; c=relaxed/simple;
	bh=wKu7do/16/FTGAiJYuD5Kg6BcEKBMLj4Fk3qrG7bFU0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UXIAC46sPHRzk261xmCJZcX+ZGPtQl83vio92HuX+OF9sE7vu8iYapTr54Em89pI3jIXoT1vaJGxmjCPLBB9RwsvawFdmMjvJ1eg0e4kyjvOCscKgHtcFvwZwFBo7Hn2utM8YaloxIo4iv2Smu93P4Ac0EgVTifB1TXhfI8FILY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mfftMb4A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSNj6GQF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B37eYpV918608
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 08:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2EFsXlxqAEO
	zRFKhrA8JZa6NI/XeJNBCRnKuMw7IHvw=; b=mfftMb4AR2L4cKa0zWv8gUjYazF
	s700UBsHEvN02qu49hL0p4lNYzKIFIMQhm1mwu8fbZG5KtHZoaI65IyXe9bl9YwF
	yVf0IVZ9fnLdahY2u5mmwZyNSw148S3CPLMjl2kZ/k53EQ4D1iLcLj5B8uIvj3ao
	ZO86jGd5o3hYaDLKl/JOpk/sSapU+YxVceAvqLYbjMSRcM3Qv0ntIAlTyFoKe+xv
	TmlNcnrCKbzFC+SoaR40Ji9ATdwWEf8gdShnYhsuxbp2S8KsyBDQHo82vzSu1FG9
	XCyRurX4tV85lE97uUNTvpsRSDAECbhD2c7/JU6tK8G4qQgkBYMc3gILwtw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4at8eb1n2b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 08:36:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f48e81b8so10473335ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 00:36:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764751011; x=1765355811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EFsXlxqAEOzRFKhrA8JZa6NI/XeJNBCRnKuMw7IHvw=;
        b=XSNj6GQFSek5BNiIAvnYfIK34ZAWlWqPx77PjPtlwHIcqnEfxdOdHB/RGfKVJutzrZ
         mkjjs2qALawM0uxkk4eunrIn5sgAQBTvgJeFlvxLIMxPOuFCaru+M8pMZheVxmBD/LUP
         wBzY9fWAeZHE2ZKqVrwy3r14DjoyvCRK8nEjSLt4Y4YOhVJAwZe+11QMf5DHZl+IwhQh
         7QSGGpICtelKdTtAw5E7cW7wBSKP+/WimnmSHMEPT90hjhh4O4TaoA4W0+TtCfqvgjD+
         Ige+w0a3Wi+ywtS2hoR/1+6q4aiUFUlqnRy5G8JK0qOYrgFSLtZmPOBbcjXBDxgVVQ3Z
         a4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764751011; x=1765355811;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2EFsXlxqAEOzRFKhrA8JZa6NI/XeJNBCRnKuMw7IHvw=;
        b=KqToyAbHLMyvW+T4sHXDunD1XV63UFu1unQsyBF//aHuWr6y1f9CsnlYVSWys0RwS9
         hkXXYU5NdnIJ0JWT+KVXzGc2qIJUsHisIWHUDKMCd07DP4HFetl7/FdPGWjVw+QVBeR4
         30tuf6Nlm7K7f0BJChhRgxLwCYlee30iQCz4lcZUQreZVgLgD4IrSUyXAWn98ZfBwloq
         NMpe1x8rstHR3AjwTxAcy8IAIXjByzZpLpyBsXQ4K0IU4GGfCkfAjZXtgdFLsOzyhrYf
         IC2jx9GZO+PbxDhWILZaPYu9z/bL8Ge67PbGdOla6P0UE1qv2PIIaPmYxqmHGfAxIVpJ
         Mspg==
X-Gm-Message-State: AOJu0YwcLqd+XgioJTdvcBFNz9j3fGupO15Az021093tuUUQQf1fxTP9
	G8TFamFxedISMPuVUrhocLc97QiU/Zzzn2nNVAHJfX0U6EJQGNz9JrvuHG3+jFnhi2o+9du9GJD
	PpFG+IAJI5ffYTRfQmO2uAVRpcDUZvlCg7ahcS3kf2ME9+Y+l6pACjrRd5007eyuFVfCm
X-Gm-Gg: ASbGncs/VqRO3wPj2CBqKVbX2mnoxbXFvxWBC6qFByTY6vbNH3Bsc+WA1hKIT91n44I
	0Htm+kq14mwyAO3Xhv+nq/Qbz14pKHZKjfs06cbm0FP0KE3ya8+gPbkW3sVZRGAiTNCnXNcB/vW
	M6ekp+D5KSIwKn5xc+Qjfkhp1V2IgzPezRt0XV4AUEel5gfZ8aJ0GF6NBXc+VDUJ/y1Psfhj2RE
	DngjYmVgHr5DI3Cwty5QbkOM8ZoqlJe9Sl7TI/M6ldsDYmRymy+q9/wkZRObBaeoKz7N/OJpB69
	6wXVHKk0t/DQTQjnjahucXsD7YKJk/4Up0nWrgkIKy3dx0Y5uKCR5rZrHq8G/pZnQy8ocOYqWMA
	udxnhAluP0S1i/qegxAuNlqJCfBa84VYoHc2djcdJHuWw4+A=
X-Received: by 2002:a17:902:f683:b0:297:e1da:6fd6 with SMTP id d9443c01a7336-29d5a4aa753mr68233145ad.8.1764751010991;
        Wed, 03 Dec 2025 00:36:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9OwI3p2D4ZnJgtRbXnVvtY9dCf3GI7+PTZnV9WfMVvJs8dUV+jaL+sM1GikJSL7PgiIv8Ng==
X-Received: by 2002:a17:902:f683:b0:297:e1da:6fd6 with SMTP id d9443c01a7336-29d5a4aa753mr68232885ad.8.1764751010510;
        Wed, 03 Dec 2025 00:36:50 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce41785bsm175707985ad.20.2025.12.03.00.36.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 00:36:50 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 1/3] dt-bindings: phy: qcom,snps-eusb2-repeater: Add squelch param update
Date: Wed,  3 Dec 2025 14:06:27 +0530
Message-Id: <20251203083629.2395451-2-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
References: <20251203083629.2395451-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e98LiKp/ c=1 sm=1 tr=0 ts=692ff6a3 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=rf2X_MbSOQWHk9B6mvwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: Jvis41X-XxR2Dnq5YpteUJ_prtIjL57q
X-Proofpoint-GUID: Jvis41X-XxR2Dnq5YpteUJ_prtIjL57q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA2NyBTYWx0ZWRfX/KMPOjZ8OEQ3
 btFL54XRGFJpY8wwZ5mcjBXXJwgEOySEdhI4PFnTor9RYYL7P5cv3o6a/JkiZNtJYb6CT2+BBqG
 7m8IlEORgWB0HV7T8kF6X3/qikF/tQ2GFBV77b9TU9a38ZUMYMuqrqKGPE6PUXUCFOzXcLHYWth
 DITfxMLL5oLs/VbI3hX0/UXDqsxPLgzTWrQh0b6rrHrp2+9siJKoWaS9hVTVA6nOgc4cQgnRi4h
 bwr7pwFYv1ZYBA2QCx3nJBKn/Xxd6ujRstz/VnL/fqicwZxHwoX7wUEIcwxfx20JjwkWAwkYWwl
 0CGM7wOFXFFjfJCxVX5L0il2H2RCNkfXYFBOh4f7RclglzWe2VdFrEJQAGCu8/RdHREAGMvGdTI
 HP04M9EMmp+Mt1MYM5/O9oshnrIigg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030067

Add squelch detect parameter update for synopsys eusb2 repeater.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml  | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index 5bf0d6c9c025..8a9251ba3b54 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -59,6 +59,13 @@ properties:
     minimum: 0
     maximum: 7
 
+  qcom,squelch-detector-bp:
+    description:
+      This adjusts the voltage level for the threshold used to detect valid
+      high-speed data.
+    minimum: -6000
+    maximum: 1000
+
 required:
   - compatible
   - reg
-- 
2.34.1


