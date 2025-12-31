Return-Path: <linux-arm-msm+bounces-87085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 64516CEBC3A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 11:19:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 169A0300AC4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 31 Dec 2025 10:19:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CAA831B803;
	Wed, 31 Dec 2025 10:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gat5sku2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SQ6y8780"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B909E31C567
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176337; cv=none; b=eC8Lg37a5V3QFqSwTbU92VhlJZ1zq8NpIQSJlIMrJ5ypj0fCEtrEYsWEfoaR1nl9HUI2oBF+kHiyPpnpzF/1MCAvJDWWR7x3lefdURLP3vjl0sd9LxhPZ4/1EH3CynMigTBlzJA6Py3wdvzF8Wh6eoU/95NiTQREZ8nkAflfYIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176337; c=relaxed/simple;
	bh=ycxSLZjMJY1W2d6A5QmlmqRTD0JmQNz0hfJsNqjDZ6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tLMBNJkc2kQ9K34GzB4vzKdZ2PyNG3qvCCEPLQaua91KkHnY0E05oTwqgxRxeGszp5O6W6g8V/yCCmhWaMKBnV1FVw0JxVvrm0Sxwwhcusc70p628MUZIDkBzR4dx+PJbF8P8hsotzY/Kjhi1gdqzkvySId3QCRgAnm+3U5kj5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gat5sku2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SQ6y8780; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BV6E2jJ3539777
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8heZWDaHOOakvifWxZ5NB2Q5Bb6eZzFBAgGLW2eE8Y=; b=gat5sku2tDCAl5UT
	HmlJEkglY5bkUjlZxntdWU0C1q4ILcxihq4wuh7CaQPE6v4ln2gBmsAgZm9nqh7t
	x7yv4uhTdcYDVTIWffurDF3MXbYkMtOlOS+Uk1O6M2V7B1HULvu9YfJlGe8k7nDJ
	D1FAz/ELKlzZO/MeDq1398s1mwG6yVMruZ1qPUYXM1XF49FY/q66KSWD3QHHmGHD
	4kd4K8t0brycFTygteIyC4Lw03WTVXc8eFRgJvblhG7jTQ7h1ugq1j1KWJcF2Ykg
	KDXDiAcVfMckO1xXWTCWHE5o9VJc1/koJdw03AD6TKnDvCBFf0fnqH2drCo0ZNX5
	2+YEJg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bc88ykb7r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 10:18:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7f89d880668so15412237b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 31 Dec 2025 02:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767176334; x=1767781134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8heZWDaHOOakvifWxZ5NB2Q5Bb6eZzFBAgGLW2eE8Y=;
        b=SQ6y87806n45GTc9YQXkxDhKc6+si3D/fZhBhAv2aZLop43I05CpTp5LQKPP+ZIe3Y
         KCQTc4mGBYbdliSxdVc/hTGMkL5s4cA4GnUGE+1Xi9gsgghc9KX1duedOKF7AYEFAk1Q
         8i0qUb/km/4KEcXQ2WTv9i8S5wmA8t3gYwQidG34zNqbAjIDsuRndh3HVbZ7vizXlplx
         Z7sfUEkejj2sPK+FWtmSPd1UR9ESw+xa0v1BdBmlCcjjYHC3WSxC+kRoq9BSTROilJvU
         VCb7i3Ub6riWRpW5DH40z2hXTzj/P6G2oVuuvLDy5vUgkFx/6tX8+/e/sBrke0ciynLw
         N0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767176334; x=1767781134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8heZWDaHOOakvifWxZ5NB2Q5Bb6eZzFBAgGLW2eE8Y=;
        b=p3Q40krl9OprOXvQxoxOCw5WdBho00ja8pgr0L218Ky/JsC+i+ue48ljAjV/WJvfjj
         QBa1cPQ2n346/QBxDcxmvUkmjt4ZHEpchsj06ULYuhucbPq0x71qRiPEUfJJhZ7oAAT8
         HFmeWjuae7vZIB1I0SdO/Z4KNmvo6FEzYk+YxBwGKMQ1oqhNKjuBy9SB1M+hDtd8H6rc
         oKC2CjyLIV4qj6blYBHnKvkFcFRYHxyagX6Cb0nDyQZd4alVUuIMsE4jZcR5zxov9J1v
         iyFihjxsycDQf3Pi9iZ6CdUTq6O1jMeZ4dfWHh4r6KU7XiStklOn/Rx72mzx6PJl5r5T
         AqcA==
X-Gm-Message-State: AOJu0YzGdJ4DnkUgHSZIh8nEab4hqSix7rjh+gXcip24Et+CONTPr8LU
	cUsteiCqQMeCRxCJu09vRnZGVuUFkIxYJG2vG8f+CQ8Cq8oFOtzejHo75bkpketFBhAiwaAEHsL
	SgoyMzjixDPgHRNAsMFnHz8THFmCfARAZ+7ywsZd8oIEXN7BeJ3QtXyJ4iPnu+7Af2wJ2
X-Gm-Gg: AY/fxX6Kvn/e5GYwDYD+gpWnVdJXr1w0VFjArj27XhSIOBufbDaTewFxB6i9K2oYcWW
	S41tP2XciWl68ukseS8KQ5ZuQdJ+7o+CTgufcMORJlql2jcyXRKSYpmSq2M/sp0njz5FqPwIf10
	BF31a+WsBlX8zzgz/DwFo0j0UmbdtaTGYenpbuu9xiTSr0ImgmcwdBUYHExeU5YkvfZKqUJt9BA
	dwNaA8v2E7jTwjAJG6FYpX1H9ig6QfpbudkGC233d8aWN/V8Z9zbEfOfowREc6JHH18E7p/4DEo
	PGpQxvWL/zewyx7F4Hu5WKt5hcLscPT3Uka86x6HHz50RtxWZbRq7fZAGVOiVmPwk87Rtp3RvQi
	RWlDkgy2EOcMDzZWN5jeJUFVay7XQ0UVESYez9A==
X-Received: by 2002:a05:6a20:7489:b0:366:1953:1d30 with SMTP id adf61e73a8af0-376a81e2ab5mr30841918637.5.1767176334045;
        Wed, 31 Dec 2025 02:18:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbVD2tnvXayer5KlqL9Yjpj7hw/s4UeRBkJLNIkLJX9P+PbQBgWwAyPvl6syrmkZLsdsjPsA==
X-Received: by 2002:a05:6a20:7489:b0:366:1953:1d30 with SMTP id adf61e73a8af0-376a81e2ab5mr30841906637.5.1767176333539;
        Wed, 31 Dec 2025 02:18:53 -0800 (PST)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd61b4csm30085504a12.18.2025.12.31.02.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 02:18:53 -0800 (PST)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Wed, 31 Dec 2025 15:48:45 +0530
Subject: [PATCH 1/2] dt-bindings: interrupt-controller: qcom,pdc: Document
 x1p42100 PDC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-purwa_pdc-v1-1-2b4979dd88ad@oss.qualcomm.com>
References: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
In-Reply-To: <20251231-purwa_pdc-v1-0-2b4979dd88ad@oss.qualcomm.com>
To: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767176326; l=1213;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ycxSLZjMJY1W2d6A5QmlmqRTD0JmQNz0hfJsNqjDZ6g=;
 b=l8k3/S0fsFnaJjXHXSRzZXc4u2UjE/Xc5jmQy/pL/8rE3D6uBTKbH+9q5fjchJcda7UZ95U1z
 7Revqf2H1KRCKIFLP/LGv8IZ5rZHOlw5OAyG0Z5Uz0/Jjm7uulCbMPw
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=POcCOPqC c=1 sm=1 tr=0 ts=6954f88e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=CaasDedagTLKq8XiIZkA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: vpT_r0Z-3UresV0Z5Y8wg8dOcRQjmWgY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMxMDA5MCBTYWx0ZWRfXx1CG0+Hf8RiW
 Mzf8lWRxg4/AMG0DPnbEHKHJ8bvYOiEW1gXYV7LKZxAGW3c8ZzpijAjS5Ecft9oIhTBwui/UUJN
 1pDwclXlEDoExvnoCYeddAthct5zTGNcth65teKICz5BisxA9l5KqNFceL9cm9fxEwxLjZfIB0/
 73MVZZcmKoy+WalS4OUUrvk3V/huHZOAZsvgqbJPkbK+nfk3FOjJhWAtVlSCusdp9RIM3x6XSxR
 ELA32DMfxMM/KR4YVr4rVu6BFh1h/8rMzihnw4b8RTCdhmiNcFhRlkUVfRo7w6kaoQ6dZXL4ROa
 JWQoHJLaCc0i8JxbKJyECInw6AHIZAa8fTjN/c1Zsb905NCkVDibNsayj1lZiP4N7Ou/YzXuZIQ
 7G1vGn/7wciySFDx352QNaJ7n1T+k+WnHFV3ni79rMqTQHG1M6MMyXro4OI9OwvfNZkpxuRueKZ
 /LiEbT9I23dRjmM/zdA==
X-Proofpoint-GUID: vpT_r0Z-3UresV0Z5Y8wg8dOcRQjmWgY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-31_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512310090

Purwa shares the Hamoa (X1E80100) PDC device, but the hardware register
bug addressed in commit e9a48ea4d90b ("irqchip/qcom-pdc: Workaround
hardware register bug on X1E80100") is already fixed in Purwa silicon.

Hamoa compatible forces the software workaround. Add PDC compatible
for purwa as "qcom,x1p42100-pdc" to remove the workaround from Purwa.

Fixes: f08edb529916 ("arm64: dts: qcom: Add X1P42100 SoC and CRD")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
index b26246de31862dadd1bfb2a3a93a64ca9fb1c2e8..01abbb980e11152d2fca84507c9587c3a025c39a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml
@@ -53,6 +53,7 @@ properties:
           - qcom,sm8650-pdc
           - qcom,sm8750-pdc
           - qcom,x1e80100-pdc
+          - qcom,x1p42100-pdc
       - const: qcom,pdc
 
   reg:

-- 
2.34.1


