Return-Path: <linux-arm-msm+bounces-54474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA98A8B3CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 10:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 906427A837F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8F8122FAC3;
	Wed, 16 Apr 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO/F75jJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BD22309BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792174; cv=none; b=JOkKPpOslSU7puheymUmMXU4+Vq8zC4QjE9ZTrBfnpSfS7stU7KHP/+fY3aTl2bBLMJPCOZ8iUxn5X3q2MbnhlycOaqKKVornBkuxJcK6FdKD0lJpq25xpsoss4w1aw/csboFFolBg+WIKjrHf9LUiUp1UxkYV4FQ7B5MYDx0Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792174; c=relaxed/simple;
	bh=SAyK9sJUeGV2KdHd8ZazsiTrrxo8/0P3PB/Buc6flu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VV8RHmbdwMEn07L7GbAREWcnbiUZzxz6Lu1+Eb/FMh51PH3GA5w/SsgMufutezEb1tTO/W/qVWIwMnsh69DDR+6HKaKG6YSeWOvNwrRkunZyXWf4k07kKSwuaKXhkoO29ypfRMNHPHLNmLt+1jjEUi8weHToW2xAqUEPWMmXnyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO/F75jJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JO44022009
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWNSmWOtUtq8/CJoI1vzXJVwJ8IgTPzBjgmc3+pQA80=; b=TO/F75jJPZd4f7LQ
	qJH84NNGPdM3fV1iHm1EBp47GO6jJ00mwqB4oxdVWjmBZ1RmP0RZO7fqxDMislZO
	DRpsU6BJ1+15pvMXwCsnL9sYJFFTDX+eMy9ZNL+aJoWK4Awr2W5hf+OpzOO0sMZB
	pMXsDHY+oBHFdIF1Ny7rjFqKJeY1UKe5CFmt/uNbkl/o/iUD1pFbEsYEMc4nZs2w
	nMH3ERWanTGOqWnOt+H0bPJy0FXWb8GdChPMjBQXcrickqtW/vLjZ+MT+JvpGS4G
	X9lpYVQmafg1VVu+xz3//Os+coWBVLF0c0te1Y4dYsq/9u8/i+6WHrIwpXFnHSZM
	2csuvQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfgjjt0a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 08:29:32 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224364f2492so53761475ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Apr 2025 01:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792171; x=1745396971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWNSmWOtUtq8/CJoI1vzXJVwJ8IgTPzBjgmc3+pQA80=;
        b=btCO5cGiQ+9gvbWZhmt/lTC/ud5HbjokGkh1Bpqo6dH+DD0zEdfDLGn02/jYnFtKWX
         lMlj4pzpyo2UMKoD/G2h/KXO02SebN0aCXb3yTEY3GCY1dXWzh4D/995Mn19qeSSrIXG
         EllUF5qj6aT4lR5L59Vw3nA7L8/mVFeZSlo4ZZ0F5BfD6/4noQT3nqMRqJLeYduC1Huu
         2a8gjJtIalGj5hVQ8iJOPpMm2xpyx2eBMb0wsFdrGECJJxdCqbcYjrEZCwFQxZjqVT43
         Qs5FcSO0g3fEj5u7hJYS0hTq5N35GqC5mIN46KJclphTrW/WHRgIR8WGeRsyNgnpF+7H
         hucg==
X-Gm-Message-State: AOJu0YwKJcm+3Gupewha05nxnghepheYu0mCv8aFB7E1msutt2PVPwz9
	51B3gq55c9JVyfD6YQi/I3L9zbnA+TzxJT/hxJj4TQE9fTLYVXI+6LJWQGsjZEeTDsE3qLHufV7
	uf4XqK+kc+SAHuUNujQchX8KJq1PIVBiQMvzFkkgl9hRIf0DcnJtYehS5P1OBs7xa
X-Gm-Gg: ASbGncuAd/IIBM3InuyBokY8NL4lVmUQZws+0jNDeN8MQuU5BirWcrlZduJWv0zcY0H
	IFwoertAJdkiTS/Zx9LgFyDVwf3JB/UPivwhdR7Ora/kGDVOpfnFAp8hFW70S+DnBUjVQwx2oFQ
	w7xznqvaXyGTQLvAe6HaA/fBEI6jNA3KyayPYyRXmZIBBhEekF4cznqtMqo1nk8JOllPL9pukmK
	ouP4ypSb8JoNyI3upXS3wZ1wg/tV40m4dDQS3CQYQIpwkpe4pVb4q+15+Jw9B+xF5rA1D/ZxLeV
	6keui03pkXNUIiQ2OuhL4uhFncWn/XKRlrWeeoQnAFpGi3RLvCik3512mynI3fvQIgydsQ6qj6d
	MkcPY8+vOOQh3MQtyKZBxBzD2/rAJUWCzrchXZhYoei9fcSQ=
X-Received: by 2002:a17:903:1a0f:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22c3597443dmr18676275ad.40.1744792170744;
        Wed, 16 Apr 2025 01:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeUfHjjSZO1m7gR90fkswaHOTEejRvETuSsQKkbL+XX8T8042X1GJo4LJcRd89F1ItixjHIg==
X-Received: by 2002:a17:903:1a0f:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22c3597443dmr18675835ad.40.1744792170409;
        Wed, 16 Apr 2025 01:29:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:18 +0530
Subject: [PATCH v2 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-1-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=846;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SAyK9sJUeGV2KdHd8ZazsiTrrxo8/0P3PB/Buc6flu4=;
 b=mbNxlNeS9QipHP2Ao6yWsmbakQOC98yMhCWN30kr4omaRSzkfFDuyQxkTt0g3nr/kO9jTOdll
 7zEBuZD9HlDB03IudL6c7bMcxpxKcRUw6zPujmfMVFKyHCWXQaf5AU1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: AewzQf40itBo0u4Q1-V9PE-Xqpfi68Ld
X-Proofpoint-ORIG-GUID: AewzQf40itBo0u4Q1-V9PE-Xqpfi68Ld
X-Authority-Analysis: v=2.4 cv=Cve/cm4D c=1 sm=1 tr=0 ts=67ff6a6c cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 impostorscore=0 mlxlogscore=897 mlxscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

Add compatible for Qualcomm's IPQ5424 IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- No changes
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


