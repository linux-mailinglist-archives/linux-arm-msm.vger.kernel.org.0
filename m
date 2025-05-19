Return-Path: <linux-arm-msm+bounces-58384-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1A8ABB790
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D48E17B052
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 08:41:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7808126AAB7;
	Mon, 19 May 2025 08:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O9C0kV7R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD826AA93
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747643669; cv=none; b=MIjdQ9IogxxdVvR3SOrFgYdfuWfV/TLf7xhho4XknB21X8nAxq5hqRS5/ZKV3MD3Eex8tLeSuOQZFw4wQhqB2f9z3SUu9fbqlRShyN0PKg2Rezr6kjmv/k0stQasG2mfV6Dj+P7kbpuEWSO4k4EEW/kpxavTQrrCB65JHOSTImY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747643669; c=relaxed/simple;
	bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sx6TKsidljOs1gs8NNs/GenfXDGdO2qwj4xscmPYrG0RE7cAz06Q5JRyxlGKGMC40G/JEu+BCZvWJmUkBpAnqe+aRQ6FCngN2zSUSwlIBObdF9Y9rI4hSsdU9Kj8+SRUUeVP0EaqDWThh3oFtMwU4KaFAyAU3EsjRYH+xgoMqLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O9C0kV7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J4Er1t014113
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=; b=O9C0kV7RE333OnX0
	RUJbHELNfSXsniZBtX7T6FdL9GedxrjzyWhR5i5FwIRn5qo3K4aUSP4Cf7+8ILCu
	XZN4d0E30U4q/QyjrUUwBtbP/q2g//Ptucf4K43synhoGIFIaJXXJvWQ0SsR/0lM
	Wbuq3guAdFf1Bx6Rx47wi0+yGF+2jt3z+C3K0B24Ez8J+OLXPmHHOxDrm6lAsXlB
	Ljo9pE6RYDiq4lRcmWL3RkID+OrBO2XtTqr5q8ILb+7Hs/svOXsJSGkGqXQ1oXOh
	pCoeCNOzQop2l6a0sedSVHGFGs3b0z6OvIS0P6wXjYZ72K3ZLyJM28Jzbuwals/1
	MD/OpQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwengqv5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 08:34:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742c00c9044so1060668b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 01:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747643665; x=1748248465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyEF3SaC2uCwCA8G8SflI+3/OAOcfqozcvxOAxElUuA=;
        b=OlVo/DKSAhcIUyV3uuhnklyJDySC3dZCIF+Txpjlg8K1QCZNboLLiAggSnvJhCCPBn
         TIoUXAz/77q243vfeM4IzFqftSYuMacqbb32Bhw8i+pkuWqPujJCEUqQmwfV10xFppnJ
         1rDC2CEE4vQ7wLhehJ4f0SBDmxO/K8jQ5hwQFoPB3J75YS6Sg4Ydy61d6V+GCXE1k6yw
         XTn3VutzmyHKONkv6pWrXHRUA27eaRy4rnvtQk4TotWZbUYGcTp/XgUoCBFqu1rpkJUO
         BOEeZ7B7K7BeVMco+QiU7gkC6xUj1+3VOboelSAHXquJ+w7E+DL4foYEbIcI1EOhAxUf
         OOYg==
X-Gm-Message-State: AOJu0YxWGwfoSoI8CS7r8saexFVAteWuMT8pyeDpkIxJkXqEy0H9wYeD
	aWZbHIVHtMm7gTa6ZP26ZikfpoIhXlhTNs5rfyzf10NbLiUWbQ2YQK+/D5RNDsfTGCFNnswP0o3
	ntwSASXEI/9Ht2/PTMBPut5tGb+Fm4eoovN+8UIRgyV6ZKgN04Q8muoIVhdWAPDKdUzTy
X-Gm-Gg: ASbGncvxGikXjy5MQEkj8M78dFjUWzx2EaCFrvnPXW/9X+48aEGaC3PcPmoWQ0eA48A
	fN9Wclc44A+JqnF8mw914+81TK9fu061SOQTJkuVF/xyA1YLlQ8m7dGntYAs1zUqTVkTQuRJTwW
	KHgFafkLl523U5pc5g8wMyM3YGvYcLMXTto6czuFtd3wWOxIQjJ20prHOKNxijy1PJ524eN1BRr
	ysjUxHnaZjw0lv++LnjPgIyBWbC1bj7m8AsPwJDXUG0aU7OHkFqXhYBZM9Fid3C36psKsIH0DzY
	wKBZN6q9fm/AHM9+1JeqNNHyBc+BC83ZUj6S3TYG7zYtT/uupDRKBApvwyS/HRJrfFgtzw8/wSD
	GJeL4pigSmJNrVR2RrmtV4IXmH4TC5+k4Aq5tyM/Wc0d9ZFc=
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336819b3a.24.1747643665222;
        Mon, 19 May 2025 01:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJQTKw6lhnL36oUfmMNkC7r1OozD6njZlSoHl1rvqW4Fnyq6pePRJv/f81pLWmiXlgsxToig==
X-Received: by 2002:a05:6a00:2790:b0:737:9b:582a with SMTP id d2e1a72fcca58-742a98de014mr16336787b3a.24.1747643664821;
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a2cesm5705475a12.9.2025.05.19.01.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:34:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 14:04:01 +0530
Subject: [PATCH v4 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-wdt_reset_reason-v4-1-d59d21275c75@oss.qualcomm.com>
References: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
In-Reply-To: <20250519-wdt_reset_reason-v4-0-d59d21275c75@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747643657; l=935;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fqBew/FA4DoCqTsvrtKiOphEfEC/JCHBHSYBznSUuYU=;
 b=4Tg02kg9nftr++Xi2EeCTYjzRNEjyorie8LjM/S9D3N1KpNzzT2t+nX0iGVl4US5bQP8KHmI/
 wD7HrED7G3bB7A1tEayBLv5Z65ywx40IJjm/NtYMtIZ8KIAhA1KzutY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: S6kGAhtpKluTmVoc7LWtt0UaaUIv9Vx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4MSBTYWx0ZWRfX2/YMBJc376Sw
 Kcyws0PiKACMitgqN4isf9AHsRat+J6i+i3JUHP2GDKq78QA9sE2vuphqN+9Uss7LgPg53j+SRz
 rBAT0j727JnXXH3VQbmHJ6Evn4cyvigqFoKMgIuAH4DYGkVNnnDB3MPzINVxkWWuo4xZVOejpLC
 MRAQzAlylBKsnpIFmHi97Yd88k8N/EZXK5MStPtqvgq7LJM8cQDgldLi4/RPTTZ8zj50NmJPqco
 S4+NWaxpi160sUFAJa3HlqOVhgFpaf47aiyJak4Sg4rwAM/oeJXawRtt/xC3dw/EiZVZeWEABxL
 lNga8zwBD8nxAKXyGE8D2w+j5GpujcCNnzhJFS0NhHWu+XoNry/qTpMspC8W8D0BndgsmybKGTY
 2UIbvHZT4AJcAG8o1c721ZCdQw1Bzybr/Yj5/W/1aMI/zNEStTA3NZbJqf+ahQDsJhvKW07v
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682aed12 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: S6kGAhtpKluTmVoc7LWtt0UaaUIv9Vx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_03,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=990 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190081

Add compatible for Qualcomm's IPQ5424 IMEM.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v4:
	- No changes
Changes in v3:
	- Picked up the A-b tag
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


