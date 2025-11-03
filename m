Return-Path: <linux-arm-msm+bounces-80155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F7C2DA3E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 19:20:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 44D8B4E3F1E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 18:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFD02264C8;
	Mon,  3 Nov 2025 18:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f67hquYf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBQaO6cs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E8F2356C6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 18:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762194019; cv=none; b=jYM5W+1iyfDNF4ZTfPLQGFck/eJBf+cUZHDA/0HsBXCOD2yxTDseib3WFYrKkHyDQgPp3sGQ7QTCGlFmHMX7TED7FW+UjR+EKrvhqFhEiM8xChcr6t56iJ6avrvxEss7yMHiC1VoMYkAO1+YliM/zzKBoEl7KZr85wRRAgq6DwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762194019; c=relaxed/simple;
	bh=jGSlDAGxynOHmJuhn2T1ac4wri0g8xzLXd69YnmiHTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h56nzjosvPzA7/TGv+2uOg4RnMTwDbbajVs1+NK95lBANOal+Jv20QXW5QSmPoQNnbTlSrBL1Cc6lGvO0TNvnakOPXn7i8krxjt+ZkvNgJkuahFTWt73LeFHURPreichf097jEqCU61noxWdD3Jw4+fvmrz4bniCxCPcnK/u448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f67hquYf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBQaO6cs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3HJ9Ea3730403
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 18:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=BJnyRumSg0R
	XQ5jL6XQy8Cjcv8UyAXkVuVPdDNneIY8=; b=f67hquYfirQOjnGUZc05s1ufDV9
	HlYl7XMUJaF+6kadznjiT0bV+GUqeDuYNWZWbh0CTb0WRI6jk3ekqLFf3XtaMThg
	d3B3HVwfrTuDP3fBCRq9vdCcg5w24nLdKRdT2HWTIb9HmHqOAFxdGih5TALvs/Br
	YOe9FyN6/bn1royvoZ2Sl0Cxe6lARuhdGBQ6hDpsyroQId0vgNzELXNuT5NbDYH5
	oNT5xTWmSGxzogB9R1T1O3WEfqH265wJ5YVgR3iLkb5jkcz4RUh56lsLAPB0OSqY
	jXboFi0KQlPg6cNO236OEO/oGzlxx7NtNBbWhYc6FN7KGX2d+1CPExnYbmQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a70p886ac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 18:20:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eba10ad6e1so62080901cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762194016; x=1762798816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJnyRumSg0RXQ5jL6XQy8Cjcv8UyAXkVuVPdDNneIY8=;
        b=IBQaO6cs+Sc/U9g++R/N1L4uO9gqLcljlvT1FegJW86zCe1Dl/7EJk/VUd+1njEXfE
         DmyZBhhs3+kyvTx8xBtDvoH/BlaDkdr1cScrBHdPhEQjc7ozoXd6dq4b08p5QEFYR9fj
         cNnveF0ftSuWHT7a2O1wkRw7gGjyXVFHOvEI69FlsIni9YTkbMhsornwrjdSi4qYvHfF
         1nAWx8ji7y5F4LO2hKOIyS7cNBwoTH40pYSDELb4MKatDGSmNCQilEP5K8C9KaKyVFeS
         ZDyDbLAT/MFnReD17rAtdYtmAC9z1b56NzjGgIsWHISiQmga9MER9LA0MMCLviCUgVlE
         QewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762194016; x=1762798816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJnyRumSg0RXQ5jL6XQy8Cjcv8UyAXkVuVPdDNneIY8=;
        b=nWzdYYENPGRXUv3CSaddApjDLUhj9zSGyhZuiqmEG1h8DQv6eGN7aEj+u3v604MzJR
         a9mOZHy/w5y8SAE3FtT8XD4PMPfxwQShD4ScrNQ3mgn4zEyMNSnrm3fJnVi12MumUvr1
         KjL7XbyO4b+/3LEe7x5dxnVCrl23L+7Z2eDGORLJndaqZ7F9PqV84HdSrb8nTBKTERAD
         9NcYxYXLaWoYYW/Rl0kJjLTRlrgP/54EEpiewwZN65qW+xWMnvgkeym06CDLTNYh4rrP
         oOFB9p9w0C5OXMpL9cl1R3Veke3yGfvPZBr3bLJ5iy4XTtoAV7OvCanNynKQgj5t4tFX
         DjJQ==
X-Gm-Message-State: AOJu0Yxu6jVPjc92fr98Tl9ZNxfhR28YQvREIy4tHJ1sIM0dghb/3/xk
	9duLEazD8ZsdupEAAFg+6dHNrT3EwjGtyIf+cxb7yQt2BR8Gl/MdA2+/gNpR01G1aZDmzKQt0/E
	721LoDqHCeXx66aLWFiodueIV2i9fCwuOOUegcd2Y8Bp2Z0lYW73kMhKjtRZH3KAmexKH
X-Gm-Gg: ASbGnct7RTkQILihqd3cSPUoK3XOnZAoJfUMqdJFaf7TyXeezlL+CYyg/tHLdCOiTzC
	9qjP9WP+d8taHjHcN2vJKZ+/9DQ5GKat+aMMXzYcMGEzlewKIKRVw8cbEIkH2/lF9bSAxKj/cD0
	H2rgMlt3WiR9OvWgJXzv8XCcJ4yJqOoSHulI7LSWIci8RQFmcDJIqiFR3wBbhKYYVqtJrCOWJLm
	WHFRezDd+9ODhOxstcIU8n0uJBejYnr/nKFYz8WJPo02zUs5GCq7Sq+5F6683fCmR8pa204dMRQ
	nRV2rwdJKh+JaQWtzWe75I1hXKPycwLv7joJBwLlu7ALWohraMMyYjBwM4WCWNgID9s0XBQqcsI
	p1N4XCONzvVysdsVqByBwce1JW0yHq0md3HE/w9U09n+/F8aSboKC5/YbXx55Lz+1Dg==
X-Received: by 2002:a05:622a:5c0c:b0:4e8:b56a:992e with SMTP id d75a77b69052e-4ed31079298mr192039741cf.59.1762194015843;
        Mon, 03 Nov 2025 10:20:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoptK7u0v6sAyMbPtU9mrRa1NJTRPDFdDvOuaz7ftNbENmIT08/ZU8ZOsevnKESRJoGRUfcQ==
X-Received: by 2002:a05:622a:5c0c:b0:4e8:b56a:992e with SMTP id d75a77b69052e-4ed31079298mr192039201cf.59.1762194015297;
        Mon, 03 Nov 2025 10:20:15 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:8842:5746:daeb:a8f8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c53ec2csm169096545e9.11.2025.11.03.10.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 10:20:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, sre@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 1/5] dt-bindings: power: reset: qcom-pon: Document qcom,warm-reset
Date: Mon,  3 Nov 2025 19:20:02 +0100
Message-Id: <20251103182006.1158383-2-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
References: <20251103182006.1158383-1-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: NENELdMnX9gLzwTlUVQ5o_gK1KzEgImh
X-Proofpoint-GUID: NENELdMnX9gLzwTlUVQ5o_gK1KzEgImh
X-Authority-Analysis: v=2.4 cv=AsnjHe9P c=1 sm=1 tr=0 ts=6908f260 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=M8sXMW5dAYDte-7YvdsA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDE2NCBTYWx0ZWRfX1xJN9FGX4Zip
 kbb8s3GL9yj2f3jEzlCIVy4PjTS5XLmjKlhbxUx/lGJPqn3FOeflRSeC63g0+qq84b2QTuXJ3nk
 HD8EhS7uGqAm3RygGBTd8xVMOP9hhHrc2F9GYfWITT9kJrmUwTQ+wPBV8yR0hKYtpVjRz1PXAHp
 TUdCf6hZ1jbglqQ1boTrbI2azGQbsWVShyWyYFOqlLXqcemNvpk0J+xqFWVWQJ8jlNEPHV/tnDq
 fSPAIM6WqzSQLMkz6nL0Qg2zpMOwfMtPEndgzj37+uaWheFIevoAu36W3iAWENFNNpztDh3YeVg
 RN0UQk95oHaZMR1BIWHkS2whzTz6/+XQhcFIyjlFq8UhOvT69eDKkNvjH9y1+zsORCmocEUdEWL
 MUBMDIXrlf7D33sU5WOlB7sx21AlWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030164

This property can be used as a fallback mechanism when a warm reset
cannot be achieved through the standard firmware interface (SCPI).

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/power/reset/qcom,pon.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
index 979a377cb4ff..ad8691c87f4f 100644
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -38,6 +38,13 @@ properties:
     minItems: 1
     maxItems: 2
 
+  qcom,warm-reset:
+    description: |
+      The PON (Power-On) peripheral provides support for warm reset, which can
+      be used as a fallback mechanism when a warm reset cannot be achieved
+      through the standard firmware interface.
+    type: boolean
+
   pwrkey:
     type: object
     $ref: /schemas/input/qcom,pm8941-pwrkey.yaml#
-- 
2.34.1


