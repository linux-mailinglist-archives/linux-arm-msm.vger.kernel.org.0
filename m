Return-Path: <linux-arm-msm+bounces-86296-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5859CD88C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 10:17:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5176830213F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Dec 2025 09:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B283B326948;
	Tue, 23 Dec 2025 09:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP60/UFt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IYRNutQB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91D1324B20
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766481265; cv=none; b=iHIEz7AEY/JqDiCPqmRW6y2pSkx/5FUM89EuC/NL/v4k9TGTO49Xg3f8E2J01zZnxIxwRXhejUNebprWi4fsRKcmlqjedkOmgBji67OkBYqhaZEkPedtsvYP+pYgYgCBRmcztVaqBbqYEAQzRrQ1d2IEv9gGpZWnE5Byf9ceqC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766481265; c=relaxed/simple;
	bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ermH0UNXCIyYi24P8HoMMl6MXbdNNhwLLGGcCTryIitkhkOqr9vufJmoUW4kjP8gPAbJbtcnCVWJLEKesvMM3W7StOAAEcdJm8vASeo41mTxWLUwLAh40MRrT6YO/ys43E9lGugiErxcS/5KpXk8/6CncQm8VVZKSQpq9bkFq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP60/UFt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IYRNutQB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7YYXG4045106
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=; b=nP60/UFtkw9yRrNk
	Y9ECioRL3azvpMJWndtSn6ger9EGibzWQAT7sZQO7/m1Y5+qLhG2ExK+Fdu3kHmM
	pTlPL3wJMhujnCEKnbGgZohrQWrmnCvT8iq3VpF0JTA3e69acKcUof/xda9t06Qc
	eDG691XNSwXlS5dUNYAHNM017HRAjQ/xTpXs4oIo6cOjj3c/s/Azp+jeW3ObPzJP
	Gi3VO2euPU4ed3rBoMyIS4UPt9ii7E87Io0hKkU5etwXe+6LzMDMsL6GKz9YYwEe
	AmzHaR2QA+2G6xxQkT4k5IvU9y8hKREK05EJC6ZyNzzGjfhyfBwuvsNRmD7haWFI
	L+42Ag==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha0cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 09:14:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so4828188a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Dec 2025 01:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766481260; x=1767086060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=IYRNutQBw240YKCnevtiorS6TPMlnjGhn5P50IZAeqQwintyDBiWcBC2LQUE3lsyjd
         Flpoif4y737bzQKj0gCrGy/56l2B7Yq4Vul311KIkXsEOp49B8X/OZaKH650U7jraEuW
         4OnYqy7o5SrZyJOfQipo1m2x2Qo4dCG9kH0SR3jhEVuv9dPSKSxXnOUBKKEV4wcvVcL0
         h5xbUSDwTQmWcebQup9u78mZ5FSODa3utkWd5Y0VmtmNORtN05pwj05VabcKobfbUqQB
         cllocYkPHfgZDCQ9wKe25Ok+Ev9yZZ2Zcd0b+NuusOhmfvwg/eVP5nszO9vPDHETtXt8
         cNmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766481260; x=1767086060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ei7mDZ2q3MlVYEacUwJ85Fk1uHEmR1bOQjZfe39rkRc=;
        b=WT57Pfp/sTd0UsTLHGdHiCd5WAgNaY91pjc/4O34EMlTGxh6a6Dt6ZpsA4TQqJO22P
         1354+9QN/8TiBccXWkoaJPmxURYQRirmpKucgAAG3st6s9YX0sYAJAtvpamyeOjIDJn8
         Shi2yzwYQQkArB/tUj5h9hUMyStEvtNCSiRM9xS1cUVKetwbqCVQ9CwNHodTR2Zg200n
         tDbNIKrpuQB+A7LHmdxG0HcCcvS9ibEBcDkAtmKGs/HDVyzaLw5quLiCmWfL5OlLEcv/
         csgKwMw5MmV3sGOq0Ki0B6KmzyGxyAQrY9OKimPjDTAHC7PO51LII+NGcmGUqeAHR1qJ
         N/KA==
X-Forwarded-Encrypted: i=1; AJvYcCX8CLnaXN8CfYNhcLHIN03m/hJMMCpagDJfZM/vltrUfnQROfd2BFn5rOhGU+czuFLRykkoucRAS3P9XZR8@vger.kernel.org
X-Gm-Message-State: AOJu0YzTzv0/aH7CNt2u97g8iXXZax537Ud2/n2gbmmECtKBf8jkfyYF
	lfQwAJjb7SRe/1CCx0iMczMOtWjvvy9Kr8pzxppH0/+aCRvtHmysjmaIiyfMEvpZg4byOsxiC6h
	4Q7XlUCnUGT62siCZhh9wNQdAu6ussysOtalq/plHovrvgvIPl/KaycWemWPz1ZQnXqS8
X-Gm-Gg: AY/fxX5rgpASfcwqhSdTI5i2KKNmuZ3g2htkaAkynI4xVHT3dYlB8LzzDR+FtmbBPj8
	edSCa8N/GCwhUKxcz0y/qrCp0+ox0dzyhCBCvgxa0gycBlnUcPAmPh+hhVXyMYsL7g5oMCJKuiQ
	HohWxnhogAN2DYfQiRvH9Q3wj71KT1Acq5kK+jedqyDB5rG7HrROeRZJpRft8NKJcKJEh/4cXg4
	zD+T8fZmSrcl3Q1Ds3RdnMxdL9ijsGa+S6HsdKeFxRy0ONvcWL9vj0ntEuqf8IdPmkULNhm6/3+
	aQ5dmiQBqWGA31WzFwvKygDJRQnk6HQlKcskV2DF/TbpKm61aKqJqMxdzEDaM295JPIprNBjdv2
	WqdU3HM029zki75naIRdXlmZqUPoKWb6MqwiTQi7s24sLzCZzJyvi1OQoASV4
X-Received: by 2002:a05:7022:6886:b0:11d:fc64:9562 with SMTP id a92af1059eb24-121721aabfemr15308105c88.1.1766481260241;
        Tue, 23 Dec 2025 01:14:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEig7H4Sj/NNpGtkeBj3J0vNaMeTY8cvFUplTk03xO27LlR4uZBaFqyfuST076f3uY+IqdPxw==
X-Received: by 2002:a05:7022:6886:b0:11d:fc64:9562 with SMTP id a92af1059eb24-121721aabfemr15308053c88.1.1766481259627;
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217254cd77sm56931833c88.14.2025.12.23.01.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 01:14:19 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 01:13:48 -0800
Subject: [PATCH v3 2/5] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-knp-remoteproc-v3-2-5b09885c55a5@oss.qualcomm.com>
References: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
In-Reply-To: <20251223-knp-remoteproc-v3-0-5b09885c55a5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766481257; l=1361;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Y6jOHq4W1u2qm06T2h+sJqsZsHdgNBpFta4hr0KK6gE=;
 b=L7fombA41fBJTWgLYam9k58LNXz3ZFDMLBftWxE+qd8jNjAZcwtGvPbnYJbs/yhdn1BvU2wj5
 nQvU0KE9rNmBz3mz607okeyIRhgg0SNCWNZ69qn/en5yG+3Qe6nErNu
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: i13VNglWTdjJPE7Wjy__ha3uwEI_WKzG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA3NCBTYWx0ZWRfX+fy15nKd0trr
 SHGNkQpIc7OcaGPP1AejhKUYFG363bqgKb4ogNF8nr+lO0hU16+Ae+rb6xLP/QW0vmvYG3K03JQ
 oW90HF5qG3b5eBChOdSKUnNb9fmMB6n3zn8rHffxrxm4VCY8kq1+sM3Pd+PfI4nViw4vXTUAVIm
 znyK8YzF81E3PDHgUSMXrWpLmBX4Qh/ALQVY+OlhmSYeKXulpdZrhajtGS6sSW6xsi23M4SaAUu
 c++O1WzQpbCndTum1lUYoM+LYuLdUVAhAEnx1L2zR2DfLZfF0uZlvCKn5ypYBUynzqpNaCC0ntT
 m8GQly0UpMB6BnM1m4tFieh9B6nadrrMIc8ByYivncS7Qi1EKLsIxvVL2M6HCZ2TqGQ4d+L8+4n
 IWD8+2W8Y8R9FI8SYDHeo1y2BDq8cPm10Og6BlHTpYl/ajhBer/VqEex2KGel4ia5Gcegb6yim8
 05HP8DpLZPQEUymj3iA==
X-Proofpoint-GUID: i13VNglWTdjJPE7Wjy__ha3uwEI_WKzG
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a5d6d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=JO5o7z23AXsBd-kSPjkA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230074

Add remote processor PAS loader for Kaanapali CDSP processor, compatible
with earlier SM8550 with minor difference: one more sixth "shutdown-ack"
interrupt. It is not compatible with SM8650 because one memory region
"global_sync_mem" is not managed by kernel on Kaanapali so it is removed
in the remoteproc cdsp node.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 31dffd02125a..3b66bd106737 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -35,6 +35,10 @@ properties:
       - items:
           - const: qcom,sm8750-cdsp-pas
           - const: qcom,sm8650-cdsp-pas
+      - items:
+          - enum:
+              - qcom,kaanapali-cdsp-pas
+          - const: qcom,sm8550-cdsp-pas
 
   reg:
     maxItems: 1
@@ -98,6 +102,7 @@ allOf:
           contains:
             enum:
               - qcom,kaanapali-adsp-pas
+              - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


