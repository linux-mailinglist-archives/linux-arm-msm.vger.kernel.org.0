Return-Path: <linux-arm-msm+bounces-87714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E006CF9340
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 16:58:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD0FB30B0F77
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 15:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C64C33BBB1;
	Tue,  6 Jan 2026 15:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AeOdqh2H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHF2UYlS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B833168E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 15:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714155; cv=none; b=N2mMzjG78XbOfQ6f+TVC7+4yZ3cfLSQe+g6mjdG8h220AfW5Cqujd7xuG3g30FLSt2OcUr6l0ShRplwB4H+9x3lyfkT7Ey7tedWVEhHwf7wOiuIxJteJoVVf53Cy9oaGCHw9By69rx7ucgrXhXcSR2lrtomHCgUXpaIuFPO+g3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714155; c=relaxed/simple;
	bh=s0E6TfSa6hTZvnNvyiD1r3StlrXb2SGLhoUrhrpf0vA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i/8B7YL2sGRipD34HMwIrOkGGrkooBLWY04DYmZY0OfI1Xhf4uoEFE27scM7rUnCU/u1UPb7BHRERJ3TnNxZySwfNMp9NjTOyq09CXuJxN1P5VPclJ30pDHvB2rfOMWPjNncCG4XagtMoI5o3q/byeuMzVqPEzmleXoWTunm1hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AeOdqh2H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHF2UYlS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606FKlW7184938
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 15:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AIjtUSFiBLS
	/NSPeW1sXaQDeFzH7a7re/A2GcCo2hrQ=; b=AeOdqh2HwWZKS1w9QzVQOHCNYNb
	g/JDq22gd2oa8C9H4OYoQPXd0whK+o3xbIbCJ4APzzyGhhKP+p0fDC7gWGPSrROG
	ZS7tZ9r3Tsl5/fNmc3/eD76skhprn99da8OyTMG7sXnKzGy0nbgVsO+zcF/NFf5b
	BeY4I8B3azcERdNuaG0rssCR/b44I6zJlcyOxpmGTkTusBUsjbTr3ge6kqVqdSBL
	x/fw5LCovCMLs5QzmqMslAfCg0ORA/VbJGxWJgNVNA6buKCe3YEvHDpAA1nk53Qi
	vxjjgJjJxNOc9jBfld8CxwBbPbvMXgGwcsVaKAj9+ENjP1gztWgx81XEZnQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4y0g24y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 15:42:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-29f2381ea85so25540935ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 07:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767714149; x=1768318949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AIjtUSFiBLS/NSPeW1sXaQDeFzH7a7re/A2GcCo2hrQ=;
        b=WHF2UYlSPimSN6ST8pqNJHYO1FVuHzqgRbIgTlHL4l+p90FPcorYO9KaHAhOYxEh6q
         1NWJggKQ5YADt02tLQWaWkqkfY8ldkcuiLcIyomG47ugwFA+KfBj03XsAy5Q0X17s+bS
         VFl/M+bYtVtqj4B7gNj9lIAoFFhnyjX2JiJdKGLEBL/tBX+6lUqLLkF8NvFWYy39++xz
         gOvfZ70qhtle3ERN1sQyHl6JR7PycPUO+G8LM/qvml+bhzwv6pv9e/o+YGL74Cg1Xwrp
         +SR0drIOhDpZdiT34byx9CJ0lPjjPP+c24xiKQjK3SFySewwM3KIzTlRLh/n6yL2Bjhk
         5Hiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767714149; x=1768318949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIjtUSFiBLS/NSPeW1sXaQDeFzH7a7re/A2GcCo2hrQ=;
        b=MYChQr0uIS8LK0uzfRtTrKEXffNdo8TRR47Vn4yGHty/vyOw210vQjtgKwuyT850kA
         48biKT2DxBdpYmxULGoCV8KnmmnxL59JnG2L+CEq4wme3SGkmkhY72duhmgH4ASunR7b
         18pnV2ffiRZSpkLn+1iSRvKjGuzkpr6yZRO+Q2AM0EcZ+71UbzuPB+uigl/dK9ElrgEh
         XITeQQupKDcpa1bMNJ6cFPVYTkPlA1/MV6bnTR7IInZfQLk353JgFiiaTQ+ALbGvL2Au
         ppi9mhfkih3bbVtcEgYO75G7VO+CAG4wfP4h2ZNNQ8QVHRiYDvm3xO42o9DChzI56Ucb
         6slw==
X-Gm-Message-State: AOJu0Ywiu0uS+9ugBAKdq0mA4kY2IvAo7dtouYNRn0Fzm+a7ugZxwhM0
	H4kjqvEjBHjl+f20Z+VSvcNuDYhEooD/LENiOqcUYpbwESuCfCuesv537rhtLzMYnDVFCQPrh2V
	/PmCQeZ0jy+fho1VovI3oP3UKSomF6OXtN8F4BDKQPwu0QunnIlF1XF+GO6Qas/1ARbsR
X-Gm-Gg: AY/fxX4nmGinPDdshq9RxO5okD4ayxMxvrqPehOl0oYo1bdUMGkKcaji6rWESazVJqE
	IUEFduhQkqgVakdJJ7VD0kXsXExXXkU3APXRq585D+UxJx6bnwmSPl7NXsuH2NF2rSpb+uZqMAR
	koRjXiJkwL7mWPpKuA3i31TSjrik4U0AgGsxLfm4S516ljCF3psz1VdDTZ/MZMuG4Kpb+yE5+fe
	fGB0oa96LH1UJ6HrBlFQkcWGcl1SbIE+NFoxwM1vJp+0OsMtuS/SKH1L4jpP/UWV0v6+2A5S6Rl
	ylfb3sdkwjutFb16hEWkvQa/UnKKEn1gkUB1++XBe8SOcyycGmcuwQz5MXbdKev8VJAgP5u18sp
	ab5TiXg79/RqJM/cS8RmtI5e8q8wBOJwSEOEV8saA+Y4I/h6SiUTc
X-Received: by 2002:a17:902:ef52:b0:2a1:3ee3:d00b with SMTP id d9443c01a7336-2a3e2d88c2emr39917475ad.13.1767714148956;
        Tue, 06 Jan 2026 07:42:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNU89AUHGyd5fl6xpGJ5YfiGTUlHmSXmkc8WqDRmjagennnun2O6SPUn43mKoyCxqZ312+Yw==
X-Received: by 2002:a17:902:ef52:b0:2a1:3ee3:d00b with SMTP id d9443c01a7336-2a3e2d88c2emr39917065ad.13.1767714148405;
        Tue, 06 Jan 2026 07:42:28 -0800 (PST)
Received: from hu-pragalla-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cd492esm26606395ad.98.2026.01.06.07.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 07:42:28 -0800 (PST)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
To: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, martin.petersen@oracle.com,
        andersson@kernel.org, konradybcio@kernel.org,
        taniya.das@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        manivannan.sadhasivam@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Subject: [PATCH V4 2/4] dt-bindings: ufs: qcom,sc7180-ufshc: Add UFSHC compatible for x1e80100
Date: Tue,  6 Jan 2026 21:12:05 +0530
Message-Id: <20260106154207.1871487-3-pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
References: <20260106154207.1871487-1-pradeep.pragallapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: d4QvnrACGQ2YoYSB0sI3mNkfIw5lxmmo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEzNiBTYWx0ZWRfX0v3MXLmH62qO
 gmX4brCh1NoSC7YmKkbzSLVwaht1G5RSyCVqrf7fAs5/U6d2G4be8ZyLA5BlVM4BQ/0pUumQEVr
 BlDL3cJlHI4TkbTev/NAnWUobnzrL57DdCjddVM5A3euJL2QBKjaYOAcObR8uvp4YChyLaj0Atw
 QQDAvLsvIVQHXjwEnCoTnd3FTZYoD0GcOgqb5t75LrIJDCkePP2zUrM7KenNqWSq8JlXp8hr9/X
 jCHZojCRsa59vEGtcBLsH7Nfnxuk18sSzMHOmChqJK+wAtwv5bqmZp+vWARXpXzS5nihyQpD14I
 +f8mSDlv2KrI0hD7EX6sqxUYllb4fohhkr9VRj1hMNz6ScbbXja7UAJH0WQKmrMQe+l9/dgjZSz
 v918YSXUoarwpi4HElR69MPULxrkfB/BA9W/pIqJozqT+aOixWQ1l9PWje19RrNhwO82dLW/a8g
 UtoC41ArjpIDp+/Osew==
X-Authority-Analysis: v=2.4 cv=eqnSD4pX c=1 sm=1 tr=0 ts=695d2d65 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=hvc5qC8Ar4ZKm-a3tUAA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: d4QvnrACGQ2YoYSB0sI3mNkfIw5lxmmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060136

Add UFS Host Controller (UFSHC) compatible for x1e80100 SoC. Use
SM8550 as a fallback since x1e80100 is fully compatible with it.

Qualcomm UFSHC is no longer compatible with JEDEC UFS-2.0 binding.
Avoid using the "jedec,ufs-2.0" string in the compatible property.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 .../bindings/ufs/qcom,sc7180-ufshc.yaml       | 36 +++++++++++--------
 1 file changed, 21 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
index d94ef4e6b85a..fe18e41ebac7 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sc7180-ufshc.yaml
@@ -31,21 +31,27 @@ select:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,msm8998-ufshc
-          - qcom,qcs8300-ufshc
-          - qcom,sa8775p-ufshc
-          - qcom,sc7180-ufshc
-          - qcom,sc7280-ufshc
-          - qcom,sc8180x-ufshc
-          - qcom,sc8280xp-ufshc
-          - qcom,sm8250-ufshc
-          - qcom,sm8350-ufshc
-          - qcom,sm8450-ufshc
-          - qcom,sm8550-ufshc
-      - const: qcom,ufshc
-      - const: jedec,ufs-2.0
+    oneOf:
+      - items:
+          - enum:
+              - qcom,x1e80100-ufshc
+          - const: qcom,sm8550-ufshc
+          - const: qcom,ufshc
+      - items:
+          - enum:
+              - qcom,msm8998-ufshc
+              - qcom,qcs8300-ufshc
+              - qcom,sa8775p-ufshc
+              - qcom,sc7180-ufshc
+              - qcom,sc7280-ufshc
+              - qcom,sc8180x-ufshc
+              - qcom,sc8280xp-ufshc
+              - qcom,sm8250-ufshc
+              - qcom,sm8350-ufshc
+              - qcom,sm8450-ufshc
+              - qcom,sm8550-ufshc
+          - const: qcom,ufshc
+          - const: jedec,ufs-2.0
 
   reg:
     maxItems: 1
-- 
2.34.1


