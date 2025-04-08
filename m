Return-Path: <linux-arm-msm+bounces-53472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70483A7F893
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 10:55:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACDA8441DB1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Apr 2025 08:51:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8783265637;
	Tue,  8 Apr 2025 08:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kutGx/yK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B858265CD0
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Apr 2025 08:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102210; cv=none; b=QXXNeDAlLQiowhKFaDjniQ0jkzx7/jR/GSrqLOCc6ktUV8XASc+4BX0S24pJ6XLGpa+PcKAhONv/x6p7hT344mtnCiNGtYxNJTmN/fanUqVJtnAjaIEkIzXn2hNZeBZ8L/gbb1sKdrc59I4upsnWXYk+i9zPler61raSdKiGnBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102210; c=relaxed/simple;
	bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R6L2Jq3YJBXAn5m+vtQEqsAajNhKjSUQWyUklqwsHsgqVIeZ2AAcdK+vsMX/KEwFriPvL9x2BikQvCkfXQsovkkKJKX5Vb6U12FUgvpF0q9YwtFF+TiQzZyMTFQ1Q3WIKcIQpg5SqzG/KiVn5+2l9rTdfi03dQpuMCDq4qjvjKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kutGx/yK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5382GPMv010549
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Apr 2025 08:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=; b=kutGx/yKbggNJQeG
	WuAhf7Mw3vhhfb9LiQqVIqVhUFgokqtSfW/LhB8UX1U9jF5jJmHd6dvES14O18aw
	AqGPjh4M5N97Gr534lXDovRL8NISc6hbQz1qGAmwBBHqZMKQidjWlRnAFFRANeeO
	ApypCZuPrVg2AYe2TE/b01+RhGmbalwJy4BghoUddbDvDNVlGf7NgLx+f7mnVZxA
	4OiJM1kcvrpVFrITU23jQLNEx67j67RGgGWEiucC2tdFNDGGJzAu6dKWEJkyPaPP
	PtPUXGtr+HPFWWjq0+PVU128BBETGoptV0bqI+ZH8LCoxbhoiiHAG2SGBpilKsVo
	3aSNMw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1f0m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 08:50:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso9033455a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Apr 2025 01:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102206; x=1744707006;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q47arDcgQykw9X0fgNGTxtfQg6akjxMwJ/SPAEnCyCc=;
        b=BIoigfh81KgDFGZHuVxq4Hx4s+bFNNum+I5/bbeBRkchl8/sLIjYxBNPzxoszF4kWa
         uG/6dh3DLJWkj4CiSoty4hJWWOdjN8zue+zmBe+6uqhNC2gribw7e1a/r4Z9L8u1lPek
         Z5XdD7RRSPN2bQ4g0BkHyAQP2guYtr8ZaTaQ1COqqwGTZSksXpIE5szfJ2TAXQdTvBo2
         7R5eF7lDNMm1idWl88djS3ZOKPdU8sNv3c6XKaFWyx0xsFUmN8FPAs2ZKrCMpmUjBO5y
         +71hbgtCLX2e/SdYLP8222uGu1CTDZyg+hlwsn+B0EJZMSJqjWwBZ8RYOkIBTCUVa4u9
         7HeA==
X-Gm-Message-State: AOJu0Ywi/GOfUqwdYQmQkVcmoq3Okv3IcO/AK/tHRETAzbZiqGnPNZfi
	hL1DqraELG9YOpoN11Ht45rsz0pCqqsX1BKenj2Wwox1etWQ/WFqsXmjwC1LWMUxIRevL7GNvjS
	NgUtiFtSBJLXJws8zdIGue1wAONDjJbOZDjxPo+4asHi9kJouH1au9ujXQOU48pRG
X-Gm-Gg: ASbGnctaVvR7+pE/jA0ANmAiBMdnVFQ9x7pJOF4FKr+aWd0/kX3hQT8SmG/0sk04NP8
	Hc/Eb04dUUfeWfWAyn9rJbLuTqyk41By17vgin+mrlv9WRWCcn//x6BRC6txj1iBNJ+TfWK76uX
	1INbojzSY7uCCRgAAeCJ9uzR7FCDZcgvFl0n+egbNc3ZtoMkwuCon4bhl8NCV4Aua6DqejUQAAB
	L7dCM2D+C3hPWPD4J9LW50Dz8BunNmrTiZUrHZrLGTfuhf4oZu0kPMKhR0o007MJXFNddkwuWPO
	bwPiZT117hvJe2rpL9EKM2lKSZTY+OWOciHw7cXZUh9GgHVpG1Xrk0+0NOvsQQKI3ZrAkh3KHjs
	eJN08d9eiS+cPwsrq/ofjqPFW+9seq6ZpTGu7jYvC1CulbfIRZo4=
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327917a91.23.1744102205662;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7DH7NvrU8wKbJuF8yH1TuTvQSsT4oQgoNTmptJ7MMjVhu3ISVAbO0QfF9w4AUCG7qUA/JKw==
X-Received: by 2002:a17:90b:6c7:b0:2ff:5cb7:5e73 with SMTP id 98e67ed59e1d1-306a62664cfmr17327891a91.23.1744102205331;
        Tue, 08 Apr 2025 01:50:05 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057cb5a823sm10480846a91.34.2025.04.08.01.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:50:04 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 14:19:51 +0530
Subject: [PATCH RFC 1/6] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-wdt_reset_reason-v1-1-e6ec30c2c926@oss.qualcomm.com>
References: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
In-Reply-To: <20250408-wdt_reset_reason-v1-0-e6ec30c2c926@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744102197; l=810;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=Yawf0GxWstkt3RpP4+pzFnNl4jf0NXexGE58yTNmCj0=;
 b=JWJb4uqlg8iaJcsGYGBQncP/6c8Ml6a1AITVQdLVCNKbipPyQXyr70nJk/5+5RK3LNsLMhDaN
 1HPrcWroCEvBjrprptW2FfsUOBBFXvjmawZFgLN8vdinBYi+WA523Eo
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: xnY-rD5XuWvmp2R3ouS99s18uNxgaDzI
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f4e33f cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: xnY-rD5XuWvmp2R3ouS99s18uNxgaDzI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_03,2025-04-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=849 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080062

Add compatible for Qualcomm's IPQ5424 IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1


