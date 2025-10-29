Return-Path: <linux-arm-msm+bounces-79365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A5AC18E3E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03E23460E26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43813191C0;
	Wed, 29 Oct 2025 08:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C89gTu6R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhHDVnkR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EE3164C8
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725158; cv=none; b=daPSMdyZtz3vsQFz5HhEDTsUP2OS5NP0SJWz19l6DK/oNzUEgLmt0maex5+JfThMLC78LXAokvFO/qbUhMnzCb4hKISNuAImEeurbGracEmHd15AhrRCWDTJReQQwgd0vZl+BDObvobM3axwR8i148jbBbMDwRFx7fG0xAUupyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725158; c=relaxed/simple;
	bh=lHEUneC8ZRFILfNpU6bdJg56I1ugvFyyWle4SHV6vRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NJSwa01WEB4XO25NYe4r/ripBRLXUABKEe97X9fQs5LtUCQLzfjJT5g+oK/YONXqRordI9qbYNH6G8TRUfL2eKHkGIrCBie2Ll7kk/wSMW3fm+noBYPPH3ritlGIVA/39BYjVr9EKZeoO/LRwDd8Wu+x4X/rsX1Ry3On/R3L5rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C89gTu6R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhHDVnkR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4v62i3755078
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=; b=C89gTu6RsSLWPS77
	0rupFkGUaZID0MJ04Ex9X06Pfbl1DliJyHpXRJWM1+41ymoCEIxvkE36ABhpL22J
	Yuw7PhJg3RTqeki4qddbP40XpAZdmYqXX3lwuscIVJvwAqptpgEiNdCX5XAdHUvM
	Oirg1ARVEklCqvEDiamT/HZkpi2vneP1Qq8sAYagYQ+NaCw0CNbXlM8V6J+isc+n
	+bQzHR+Mz9nJ7fFScB03cPL4HaHBV2N2i5ffXE9hwSHQCKI3+G7QegEdmrqrdFK9
	oRz/hY4Uirhh+Pyb3Y4HD2vJAaDLR/7v+cCLDs2ehpTxWcC8iOI++KlVVTt48+f8
	BkuuQw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a01qr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:05:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294880e7ca4so122986085ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725155; x=1762329955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=;
        b=OhHDVnkRSI3XCryVQxShTKuj8DWKeZmZC6/wY5Azwlg9mahsBZLot4LDFKIvgQx4gP
         P+TdgKpWL+7vyT1l0THDs0GG4XrN5IUKZxOVp/pNN+N9WzEFtPHQ/fE8gCeAX4Be0uM/
         kJ1irPR+Qx7uvF4EoPYM7hVrkCMpfMFml7gdytP0tD5YkxevQighbWgSrq/qNGEMU9o0
         PTe7jmzhryBUBrEZW9lBgGfoK51YkxZ1gXpJva71xhOmlf6K4bPE19IyiVIg5rCku0d0
         f7mW9Tg5p+S4x3StY0o4Zl2KYER9BMS6LgxRMCtbkn7HdalXQhoIqS/HEmClcpdnnWr/
         PMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725155; x=1762329955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ofFGdSp31WO2sezoGGdCs4u+anOTrI9jfL6DeUVdYjk=;
        b=NA6KHs3VAtxJKr+uS9XgdWThoT0jn0kpuvvcN6NLfrY91Cldzt7xGk0vyN/hdz0fbb
         A2w47lHcMTuSriLQJU0t1Wvp8P0Tf+USUdrSPq7cZ+Ooz3Q+QzCWrF5QLf2Ylloh+gIV
         XAQMdT5UlXe3csKLV2513i67P1UplJ9ENaxvzIXTTwnHNZjszOcox2rJX2SobMdozd1P
         iOO+4ATfGxnKtPyKQdZQHOtx72TrlQsWbNxQhfPbksdwpomGKm6Vb0HKArqwyk+4e3Dg
         UsooJh8F8ljAJsS4TwGQ7SVQ1pAPkPVRPzD6lQKmW7OVOl5rUkcUVWtQE4eDJp3poEt0
         CMBw==
X-Forwarded-Encrypted: i=1; AJvYcCXSqju+gfYAnXKTsicHpPAQVFNXaAQZ7SJkacSIokKp1lbbdQxqxnuktSQrgSJKxGynJmM78Nl0p7dZUXtZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwSlgL8viOds4VOz9hbH9m+q5cgn6F8iONu16dT8eMIXRaaf1cQ
	9sKZ9v2Njdmqoebn0Hkle0jnX7QP/GJe0Dgmv4zL3puYw54iyOJoxRB84/6SkL+zw68qz66M96G
	bcxXuC8nEr+T1AtAMQJfp7EBFZAslgupqeFYlNrfpGhcjHb0FSGX7OlhkkmNCERey3klT
X-Gm-Gg: ASbGncuP8JRKi/M8vkMcvvdu40f9a5wLZWYIK3sXTrDygCVas9SuWqH6Jo0OXDrHxPJ
	cQ1qqVttmXEykpO9v8G9SqSYnYa3fY7u7K0b3D5zhfmykniELjbaeo16Pr0VKonUDSE7+ELyTYr
	JK3KkK+ClJoyeDzkMXhpwcuNlBJN/87MicsqG28KJDmVoc+7xciT0WlYgWP8NNZKP1G7GIeJL3s
	EqyrHOnQM0N1ybFLX/TECWozZPYSsE12dcbf9WyhHDJ2fGAb9PYvMc9sf40UpUwbe2Khjzjh8BS
	u5ndnyD5m4uxAi3oeeBpJkNSxdaH+B4ByIQdrKnmFAgQZLzA1S2siIIOCQQGdSqe3W/XJg65bhB
	xqoLDO0OH5Q3WuN/ysZKrIlLj2l0CTA2OCxyAErsRdIgrz0vruw==
X-Received: by 2002:a17:903:f76:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-294def30ed5mr17205305ad.50.1761725154749;
        Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0sQ6XdTFb2LBlKCQ/zHj45O0tHgxtuQUKM32YYiyj+0jGQytHyGDZXzy58NbJ4DNT3kWVWQ==
X-Received: by 2002:a17:903:f76:b0:272:f9c3:31f7 with SMTP id d9443c01a7336-294def30ed5mr17204935ad.50.1761725154150;
        Wed, 29 Oct 2025 01:05:54 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:45 -0700
Subject: [PATCH v2 7/7] dt-bindings: remoteproc: qcom,sm8550-pas: Document
 Glymur CDSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-7-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
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
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1548;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=eYKPFpa37xMNWR6oEwup8N8ConVWUukUmzw5FoOa2kE=;
 b=AvoX10IlqCOMl7HP84G4AyH1pNYxj9zO1ddYq4rGSLndb0DlsH6L5kcMxVv8CeSO8/DprCGRy
 IZnVfnKBgdKAQ995OIdqn8MPVmj2ZBqsHEggTNOuDQ+NnZB2chDwwAD
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA1OCBTYWx0ZWRfX4kVpzAYSIbrt
 QHJwcwfy2AeGSpzukzMAAJQ04dfrhdO7wrcyUtOWOotZ4R4UYqZcj6/Zhe6fDcNCtA2wvIU35h9
 fmMpHYwIVncitBhyJYH3B5/ADJerHtzGDpT8CYL8YwZtyg0n5y35lY4dKO5owID+vp2UMPjmUJH
 j4LaZebolmyG2CL7CEzQHZS1cp4JbdckQit4UKV4wgrMkOLsdZ64gCBFkycetba57BVxkTZmauB
 6kaAMkqB2kGyxdpjuQMmzWtVzqvAI61LS8Fb6aWkxkgq1fVLfneRDlMIcyQowkan23kvLZZ8OV2
 q8Vwuf5mUWuxsHPMGnCmtRsqDiLZ0/WeNkV8cLbTXETbkTANLOBb59Blw3fDbZRpW7pAvOmc6i7
 jDl+DlWgp5LA6RjM31M3vL90VzIQSw==
X-Proofpoint-GUID: 9lVuCSe9Ou9AVVxvSeF5oDoHVg8sKVU_
X-Proofpoint-ORIG-GUID: 9lVuCSe9Ou9AVVxvSeF5oDoHVg8sKVU_
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=6901cae3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=3YzqomBvCdNxOiMskVAA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290058

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

Document compatible for Qualcomm Glymur SoC CDSP which is fully compatible
with Kaanapali CDSP. Also with the Linux Host running on EL2, the
remoteprocs need to be hypervisor independent, the iommu property is
mandatory to ensure proper functionality.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 8cb839ba1058..117150cebffa 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -38,6 +38,7 @@ properties:
           - const: qcom,sm8650-cdsp-pas
       - items:
           - enum:
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-cdsp-pas
           - const: qcom,sm8550-cdsp-pas
 
@@ -103,6 +104,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
               - qcom,sm8750-adsp-pas
@@ -255,6 +257,7 @@ allOf:
           contains:
             enum:
               - qcom,glymur-adsp-pas
+              - qcom,glymur-cdsp-pas
     then:
       properties:
         iommus:

-- 
2.25.1


