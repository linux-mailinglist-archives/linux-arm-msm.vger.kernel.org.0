Return-Path: <linux-arm-msm+bounces-78280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 64146BFA8C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 09:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFCFA34B4C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 07:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C5012F998A;
	Wed, 22 Oct 2025 07:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZY6krDsL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353842F83BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761118142; cv=none; b=JnC2uwhlHRxr0Bn9GBN2Y80yQ9K4DyY3zzmP9gFwyry0wE9ygzLJuCiBHto/Zss8nhXKho3HMsFh9+uqUvUZXxRCzZTeZSsa2Tlzo79ZChN36+7+FZfoxsOKQSRkqv3lZl4Le3caM06qBscq9zqUMlvqpndGC2l/F/UzcxqM8dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761118142; c=relaxed/simple;
	bh=jwAg/fX3RHeusGY6KoIA8mmpz+S+raOvxoiw5Q2SpXg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+9NhtLbzxivbRP/Doz8mzs25us6fvOL8N1vJTM6R0WRoL0Y+F3utWj1q2QMad6kZewU+Cup+Bx2ZBSD/l8G1Z5b6S18V8G0EZ32ENRFyb2TK/d2V3iDFCBpm93fCYZyjwhP3WHx6cDVhI1TsTDNPl2ZjkgnzqUjVpEoWUQEVgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZY6krDsL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59M37QsY004647
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8MM3ZnxMKNX/HOlQQQw5DE4q0GrhaHbNC2oVd9aKK98=; b=ZY6krDsLY1xJbbiT
	HbH1xIu8cY7uQZ8vJTfBij7EE+8DmJTfyiKgRMsE8wEy2GyS1UjOeXoHSuRDk96r
	UMPKCBqP6qllq4/ze5/LCz86LgKhxKfY6otcGdqy3o79s0tXRWa8Rs/jdchMhRty
	2s0LwqepUf2dj9kZT9M3jW3fkwgiPcEfWw8h56HAH3Igi95baaW3e1oBeQrA4PUK
	pobQQA6pShAjZvpN5xD5pAab/oO/jO+NB+E+kK9m1T10Q86ly2ZcAfkd7kw/gktj
	alJpQSHGCsOCR6zr7QACO2zYwAbuZGFkiAMdRF6Wfd4POxa6lNWIS+PsQVtK2ytn
	F8wH/Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3nfkmrj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 07:28:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33dadf7c5beso2884190a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 00:28:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761118138; x=1761722938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MM3ZnxMKNX/HOlQQQw5DE4q0GrhaHbNC2oVd9aKK98=;
        b=RokhYzDJ6HglVhrsES1WkWbWF49+SEGNZHhkvI1oc+RI86Quhkyj5NfPso3eEtP8mG
         sKf2dau8UCvoWr5ED/6ZB9EZZiFZnUYOTKBLkCPquq/5bar6Yfg28zJapCpih7frA0A0
         Tjium1qL5SUcLXQWSn8yLPWGj5YMXJcTGNXNVZB0gPMaW6zZklkEjbE9ARbIYliOB7ju
         Ys4iDVCjMZ7etM6KRLexKKQDRixHXfh7sOlG4DMudE1GfoddvH3vR/Hr8oF0MjOy8iEl
         nX5pqzHTa/GtKlUHzWHm+uFoxfI9lqetaMux8FWWyOwer+iZrNukJNcgP4cNqaVTCsKT
         lB0A==
X-Forwarded-Encrypted: i=1; AJvYcCUqPRryY1XhpFAni6FRu/XuNSYL1NI9iVsA26VBGoLHACG9vmg5R1ul6bvnJqpdpHgeImp+MFvyodNaw+s/@vger.kernel.org
X-Gm-Message-State: AOJu0YyxCECTEkFV01yGyFKzDqvMWquJ3RUkM+SRzoWkojd7BtkZ/wQ+
	zm+5dlR3WwT0Il2TVB2Nt+DV/slj8rO8JLL2xCmyxkmlZ8jHF1rCBGK6nwIBArmGKt8vUvG/xon
	5vo5YvsnBvg5jioLVgINVjY4dN1DUp9P2KHRTfcRM4ymnHGSJpBjQhi2QzZQJ0krEIvXV
X-Gm-Gg: ASbGnctYcXRHn6thyR6ZZIC2kdtB+CrdeKGI3nXOqms1bevdAmEVabSKiN524YXDXyI
	PoX+zw3iFeXNlAPZWaHqW6Gw4z8dBD24K84AK/M6vXi/4BY3e1tHqZsCYbsPpFyQXEmpvJHu0Oe
	faHIxCCEC0PnxO+nhO3LSrvBptosgPtyvEIhFDWbbfZBPJIUJrxt0ulV6VP7UMmg6eIKo7/CJtp
	wasRUX2RtRacrAdSyoRRIzniyct9kQZqJHS91scQkfwjUKYmXrOnpxhu6KBg+gTUr792Zqdpi3R
	xL1BLJmT1rYqLHrwG3s6j4TmEBYbeAsZMd1oW0dW9YrjsrtCxnX+xT/IABrEK2A1B3TjB8C+s3V
	R7jgoO3LXgN621XkDSO+Q75lDpqhJ9ZRbu/se0IOkaoGwGjfAsw==
X-Received: by 2002:a17:90b:224c:b0:33b:a096:2231 with SMTP id 98e67ed59e1d1-33bcf920efemr23228826a91.32.1761118138291;
        Wed, 22 Oct 2025 00:28:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoiORJH1jQ1h5FNacmn38SH9uOfXazAABC/+UHRf3iMOZk3OQRydS2TLV9FjVlt0+yyYmXKQ==
X-Received: by 2002:a17:90b:224c:b0:33b:a096:2231 with SMTP id 98e67ed59e1d1-33bcf920efemr23228800a91.32.1761118137814;
        Wed, 22 Oct 2025 00:28:57 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33dff4498d0sm1687342a91.11.2025.10.22.00.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 00:28:57 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 00:28:41 -0700
Subject: [PATCH v2 1/4] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-knp-soc-binding-v2-1-3cd3f390f3e2@oss.qualcomm.com>
References: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
In-Reply-To: <20251022-knp-soc-binding-v2-0-3cd3f390f3e2@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Eugen Hristev <eugen.hristev@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761118135; l=803;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=jwAg/fX3RHeusGY6KoIA8mmpz+S+raOvxoiw5Q2SpXg=;
 b=JXJoF0O53vOjmOQ2/dzhvBeiZjPXcC7M0KRAc0APkQo8S0f9QvNYWsrXfwuMj7oOEBFN9thhC
 XZABTsmlYPSCDtvTtBBDa0ptuzS7Bk80tgId1gA4wCGP5XiFCpps3Nn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: _6Qv_eyvHS6BJBCma8STltCuP8bV6ROn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNyBTYWx0ZWRfX5e/e+bc+zZGF
 vMUq0YJ0P2CXr5YrH99JVvnB0xU2mrVUwj2NLoC4a9k+ERhYqbCPo7If12oQy/QR+o+8gXDsjxy
 FDIsjwgSPItHKNSbX1ukkcYqKehz6ZIHhOb7YG4IFwIGPEaKLFOW9bW5JuW51lDMscdxyZGJqgD
 LyzDDSY7JGl1QvcPKEGXIPhtZcFdWYRJo+yh98fUMuJy73/IZlEgglFZ1zXUmV21I6Q87jDmv0a
 rlv2VTPjUQDQeDeksfk4J2456PpP9xnRpfo+JaIkb23DPsNkEw9H5S4VpaW9Cz5GQnUUixUsKyI
 zuu738Il/n+arnukuD8k9Xmo7MAlL2WZBzXuNmT5u2k+CJg0mdbdCCExUbK53PbibnwGm4gGJjq
 vzFqZ6AI0CDqCnzqTxPxGkjobtAVsA==
X-Proofpoint-GUID: _6Qv_eyvHS6BJBCma8STltCuP8bV6ROn
X-Authority-Analysis: v=2.4 cv=EYjFgfmC c=1 sm=1 tr=0 ts=68f887bb cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Ety4sU5WZCxzx5fwigcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180027

Document qcom,kaanapali-imem compatible.

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 6a627c57ae2f..1e29a8ff287f 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-imem
           - qcom,ipq5424-imem
+          - qcom,kaanapali-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.25.1


