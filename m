Return-Path: <linux-arm-msm+bounces-80061-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DB856C2A51B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 08:28:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB1924EE6F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 07:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3758529D29E;
	Mon,  3 Nov 2025 07:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeTD3fv+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ql/RKui/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3BE129BD94
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 07:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762154746; cv=none; b=NMCluytrdVM41luahLTkYpuf31s6ffpKuChkpYxc+MEXrYyly8f7ubboPhQpek0ypW0WHnqHFtCeGNrjeQxgzJ9BKOBzXwN6TBCKehUJT6o7BZgX9NVza3FHfZby+nbLelgknC21IOLwS2uryYHOJIYpp5g+f3K+nT/DSrqaab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762154746; c=relaxed/simple;
	bh=it/MOisxVfDih1bwUKUY/3WIDaekbtJqXnEPn67jB0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q3LjEFcNcCoEWz0SyfFoURnbq36Jr2PAs/aHIA96Dk+9xAcm0nMUExHbTOuYp5p7dA8bN6N0+rzGJEnb3U4rgas2FJm+rByOsqKdHl4LCFpM4bhbc/D7R+zm8G1e8gD0rCIVBa6VwFaJBVQBut1Q5hHe7+SE1uOWqo5ZtwF73ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeTD3fv+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ql/RKui/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A2LRwN21125324
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 07:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M96E95v81BGMEft8SKoinv3cFweaMMHz2Iy3nHHg9Gk=; b=aeTD3fv+bfHVUXoq
	HZmr43o68BJYSdTRl0po957GB/fhxQ9wBvpBukY1my+7qDN0W8fAoZbwf9c+vgwT
	T+P9igg1NhU1mSWaIEK7XkB/Nq1Nr8rmKHtRwJWzDFbo4JrzZEOvAreFK/t5PAQm
	lC3kjHScKhEJ+URrIv6nRMIudY6vZvqcmuY6WXbzhOsV0x26/ngkRghCxVttmfvP
	hdunDCUeoRleeiSk+ngmD6ap0kE2q8xW4KUqqXUjKb7O9EoTiP3iRhONCA7xcLm0
	2VGk4MLc3HYfn662GSeQNZegAZRKLNgu3JgDNgM62GlJwgBiq/V+xNsynMuHK89K
	fDVeag==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm3m2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 07:25:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78104c8c8ddso4033368b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Nov 2025 23:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762154743; x=1762759543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M96E95v81BGMEft8SKoinv3cFweaMMHz2Iy3nHHg9Gk=;
        b=Ql/RKui/3kxwwGjp6pGkz7jhNhrFY6rI8TdWLLLAmFJ6CUhHvx2lKEqLDHNEfKJgcF
         cLB+GbltybpucgNJ/+rk465SylXzIVFv0OLEqbMhKBVcSxB2sViEjBKPrpM2Gp4wOQBT
         OBuqhYxo0KcJJo20qbPM8Jbf2GZBs3zf1phWiSe1ejdk0ctb5g5hbV1CsRlOHWc/i4oS
         zQFem4DwVnKG9FISQSAHJXnawSj6RoLl0Cwf0H/sAdu8XjkRR7AJz11vLYZuJamkxk39
         pA/XSaS9EObmdawW9+2pYUj34yQUBNmkxpgrB7n3H58Kyg6ZAeCnZifHm4lF11wknEAC
         PfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762154743; x=1762759543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M96E95v81BGMEft8SKoinv3cFweaMMHz2Iy3nHHg9Gk=;
        b=w48WYNV4cqwaFXdUTJmSG6Jl/GJGSXvG8OT/J/YencV+uPJZzXARUcZXAq/znXbXxH
         wDeSUPgVmpAxK9LWv70leYU0G+cXLORM9mPF10uqZlWz8AXdqfoMI/GMqxM9ycvOGveK
         Ay9XmNU+UqA/ufTW5yTvSRuLC53Nu0+g6pqVXk1SSu1mh8Bu7rlsvrcBY7x+qQ+nKwox
         1oYwrKWUs8n7huCGryHKG0ro5wyukUAxRQStPSq3uwkKLfBpZWP+wxcRP3i1poVwIeea
         GLqKzyHz4FAe60vMHrpy5dQ0tsex7rHwX0gA2VHDsxGs9qHFU5/vyKJHQDxaXp7sCES4
         8Hzw==
X-Forwarded-Encrypted: i=1; AJvYcCWXyWnFKrMMYZzTfP6TGWkroKdQZcTLSE14XhbAX1BG6Kz3oWfP1XhkAGDP82U61UqGkoT/X8JKQP2p3eei@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/J6YjsmnyCLUkhRiM9lU5IhU7YjpWK4lrPQbs69qNaUrkD43D
	ERVXsjmKql0n0wy1/NHO9VugQejxDHaxAz2Ecu8/y3/Y1dpLniHNpLA1hNzFvv2UgB32egOTG6t
	8cKD97WS6MuAjd5kHN/+/lXyqcXokxgAKmKmtP3ETsmfHemrbQ0k2IdhzQpzS7cfH7Mjr
X-Gm-Gg: ASbGncs40i/G+RXxP6/bKlNtaoqq9coTUG11au3GkfrtXhnBVhvG3jA07gfq51s8MoH
	mJNjfJlwehegRD6hM4pCyGNU2F1dBQjj2Pdy2/atmYLT2l3E77k3rCr5L0gOC8unriW+lIYyvha
	l7hijudXmDxPkA3o12acT5V1q2JkF4AmhTz5M//NPzrkdrS/x9KQ1KOY5Xz03o7qM/GqfkTZjGy
	QIBo6cRoXHknJs3/jThoCvCYdJsTTVgZ+9LTYU9LTN4mtMsBVT8RnbEAVfqg/UAPQHe0+4BI58l
	NxWInkVE75styToPf8IffMdserVc6di2+4059B+U5G6u5/wJRaUIRLNoDg13C2XqAFDZk7cc0Kl
	nkNKwXyzjoeTYzR7m8QRDbklgB3o787ck6A2dNVT06G7T6obwyA==
X-Received: by 2002:a05:6a20:9186:b0:334:a901:5544 with SMTP id adf61e73a8af0-348c75c5d97mr15917288637.0.1762154743323;
        Sun, 02 Nov 2025 23:25:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4xu3Hv+neO09FiVIrAC49ERe34bC9UyG9T/3SPtqajoz8radq8B9TcjU34i5hmAQ9ig+lHA==
X-Received: by 2002:a05:6a20:9186:b0:334:a901:5544 with SMTP id adf61e73a8af0-348c75c5d97mr15917250637.0.1762154742828;
        Sun, 02 Nov 2025 23:25:42 -0800 (PST)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93be5ed9e6sm9350951a12.27.2025.11.02.23.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 23:25:42 -0800 (PST)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 02 Nov 2025 23:25:07 -0800
Subject: [PATCH v3 2/2] dt-bindings: firmware: qcom,scm: Document SCM on
 Kaanapali SOC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-knp-soc-binding-v3-2-11255ec4a535@oss.qualcomm.com>
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
In-Reply-To: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762154737; l=1133;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=it/MOisxVfDih1bwUKUY/3WIDaekbtJqXnEPn67jB0w=;
 b=pIgQ0stqL4uRbdRq4cBpjnJhXqSeTqjynGD7xBueDqKtUMybPraualBpVaT9hgvvDa3r4/wo4
 YEeiYFEzPsmCVulSPgnb80TX+FPwoJ8aq31h9mbuOxyoOldQacMZ8KC
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA2NiBTYWx0ZWRfX1jAdhUn/tHqD
 m+uhZVuU2ABF6DPZJUM2w4OKcDBU4T7ADSsseRkMTB7MJnwrCnNTqZAl+5RdfxIB5iknQSBmgAT
 dz8jnUguolrH5ACooWoN9TRoP9WISsxHahAZyFemoQsd/M3Zc2kvzGv1OjwQN0fDuzt3O8CpC18
 0YFa4WUe/QxmEfOrwDyReupNYBhM1HH3/w8Mbtoc3Z0WOB5jTFomqn6uKujTK5IUvJ1H1vtnIoP
 ZF4hopPW77svKBJcrQJrCfPMKElNFh7nX52Cx13z2piX/1Yxnyj7yqaXAfeKCJqNoqpOmbMg5jJ
 MpsNgMKef7pPfYBcL0OiIFUs3nnEfPMdtUekttlb9K9y/HEnFbIuoH/adUObSr0wOqHLfow6+06
 wcHpL5d3bpYVbaouZTVKc8AA0VJ9SA==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=690858f8 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ffYJIid-Q94gFHaen9MA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iPzL6M7P7dmQCRunVXS2kJ38jjiu2aAE
X-Proofpoint-ORIG-GUID: iPzL6M7P7dmQCRunVXS2kJ38jjiu2aAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030066

Document SCM compatible for the Qualcomm Kaanapali SoC.

Reviewed-by: Eugen Hristev <eugen.hristev@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 38c64c3783f8..d66459f1d84e 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -32,6 +32,7 @@ properties:
           - qcom,scm-ipq806x
           - qcom,scm-ipq8074
           - qcom,scm-ipq9574
+          - qcom,scm-kaanapali
           - qcom,scm-mdm9607
           - qcom,scm-milos
           - qcom,scm-msm8226
@@ -203,6 +204,7 @@ allOf:
           compatible:
             contains:
               enum:
+                - qcom,scm-kaanapali
                 - qcom,scm-milos
                 - qcom,scm-sm8450
                 - qcom,scm-sm8550

-- 
2.25.1


