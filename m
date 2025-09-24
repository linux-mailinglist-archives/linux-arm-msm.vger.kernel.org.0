Return-Path: <linux-arm-msm+bounces-74694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF718B9C685
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 00:59:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D163E1BC2EF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98E5C2BE7B6;
	Wed, 24 Sep 2025 22:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kESsrkZT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903651552FD
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758754750; cv=none; b=JVQaQcPouC2kEQ01akt9eWIkAV5XGQMaoPTAbTLlWWDPSMGaWmOMsnCSw4A2Y8NcSm0C3iYLJ3sTWrlHyBbXtLnezHwzypZJBB08dlcljNdSOzMk3c1ctjFyuQ5S+aCYIm87SuNAm2MWXqpGKhyzE3/gtcZZaCUa5QmsHg9n/KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758754750; c=relaxed/simple;
	bh=yy3Xacla9UOxbqXpSFYiKXWgjPcQnywvRkT5dQdRoDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bFE+s1GDWyMi6SDoiMpvo58r5XRJx++gG5iJ9eQRTkLZ96s5AEsPZqTJsExQ7dbgObJTVx2snLaqAcEQNagPh3mYrMy8BLLY8nyAaAbZpQGU3L1EStSRfs9+rC1kSxDKrZoMs9a8BI/agR7atx43r38EBa67vtB8kfwYf+8EfM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kESsrkZT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCx2mT016659
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDXmYjaKFwBzPJwxWOUUE13s34TjJw8/HcqN0CXLaq8=; b=kESsrkZTgEelK5YC
	CqAmUELec/AyuN+ZQN+AVMIbaolhPEVPXzaBYj3b0pxo6R3/8gGwJvnhcSRHIEvI
	3ewMXz8AgG9Ays04HwIxMvIrtfB91UdnTclHJksiknp2QF0A75g3Ac1K5XnkUIEC
	dbxO2RG+DibEsK+rmUi/5Q6EsCWSMpfyozv61xf2v+q8/0HOhy0pnlkuW3Ga+BzK
	SVw6w9/UPk+s1QxSRvVX76Ft/NuS6srOsNX/luroafxRtFT5MzPxM8bEbVkgTYtT
	2oQfmZq1XJX18+HPij9TMOjXVFlO8EIvNZ6XF1hxGN/e7mi+T8vg3qM1knUXrdUK
	dtBCvQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhsn8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 22:59:06 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso275034b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 15:59:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758754745; x=1759359545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDXmYjaKFwBzPJwxWOUUE13s34TjJw8/HcqN0CXLaq8=;
        b=GjF236MYvcil/sgTF841UHefELzobEaaXZygGEvL1nQJJGN/OqaU1vsCsao4STtmT1
         SCHBZK+gj+lGnirnLmTcwiJ9ZPXEjcXBBNFWkMMktaleFlAqM1FW5rm3ZrxiEQQVYBzk
         JL2mt1uDasxw+Y3mLaxPKzi2/FI50kD3bBLnDDKsYEiLH4EV5DTRuNlGfEJcPs127ph9
         GGQ0fJ27qcwJmXFoP1CQaz34oc+4Htk2EgKLFe5cTRTzo0X7Ix196vP11a73NI6Wjske
         SMOrsiK3+QN6pSWvdreaMpJ4zKKR8I2g4sb2JvyRUrhezzZVROo/AgsR0ZZLzOuZMP4C
         N/WA==
X-Gm-Message-State: AOJu0YydX/YNXJtnOFAGsV7fZ8noBLQ/gbAOvytzioSMxOoxdUEAvuz+
	5KZha7VnqdBAzCkVwToJAkujBovx4zNjtdkN8s6l5+pDRZOMJHu935n6lqN4M4cs3OQo8fNdlz3
	0ooDOPn1U+JxG4fRtwqgvChoCkX4tTxsLIOX5Avhh5dEGhZOoIPyRdZvYVEriKsk2nkwG
X-Gm-Gg: ASbGncv37grDgeHwoq0i7NdTk40Na0ynW0RWGnsuTY0kAXGOI+B2dZI749yjN8yVtsX
	wHtWekJpjXwDSNuXxKT/GkzgR7O87m4sqmKFvbUmFiSrK/twFWy7dFTiQxDuX+fmpGrtH7dQUDv
	MPYrVV84c1CIUrrkEiYSX4ZYTXbVLXHhXPpZ/2ZkwGNAEGiO734rsJ0YV86pMIJ5fVgVXhN1IeI
	/7coNhrwYtFaEV7itCWJan2oCYfbrsocCHyNraxKFCFoR2l2isHpaeG3/Z9ZqYt+naL2z8j6YdH
	5s4O9yjt741XZxe5fgWPyHFUpHRc/5kFNs8yXlqSIaZrYBLdG77Fw7Dnis+jup8WCLzbx/T3f30
	2TY02UzlnrbaUwQc=
X-Received: by 2002:a05:6a00:4652:b0:77f:d4c:d815 with SMTP id d2e1a72fcca58-780fcf12f08mr1845301b3a.32.1758754745112;
        Wed, 24 Sep 2025 15:59:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXdNFszcYpPVOWvP7/6u2P7TMeM6jhJHuAYUv08poAqLgqu8gdyWlL7gMQG3iJ5ZaalGJe9w==
X-Received: by 2002:a05:6a00:4652:b0:77f:d4c:d815 with SMTP id d2e1a72fcca58-780fcf12f08mr1845281b3a.32.1758754744615;
        Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c2b70esm111166b3a.101.2025.09.24.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 15:59:04 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 15:58:54 -0700
Subject: [PATCH 2/9] dt-bindings: clock: qcom: Document the Kaanapali TCSR
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-clk-v1-2-29b02b818782@oss.qualcomm.com>
References: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
In-Reply-To: <20250924-knp-clk-v1-0-29b02b818782@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758754740; l=845;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=n3FQrcuYcggx7GKYI3TsEagZ4F/FDBIko9Z+j9mcdfs=;
 b=IQENasXY7UJWL4ilhrNMEq82ty5OnDeUF56XaQgoAs7z0brkBSWz8zHZOmQl/uS2VqHI7eiiE
 KtywVyWntZzAKphL0R0s8L8sB/qzZi3ZXKuiWrYT5C105JMSjK9C0lg
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d477ba cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=m9xIYplGfBuRHQtD53gA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 6qhWr-PLcUzy0tDAV0qismRU1b3HEqo8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfXy86b8BJcz99D
 WheH/xj4X9gonxNooWbKJuPeyhX5uFBOZMKseeE4Nk7IRBK9z4o0adAWKYj1M2bmGlcRnhBxJGB
 M7UjpXLFi0YBhkIC2GG3oE1F+uMOqZq3/W6RiaDtDW1ilJ0x0MOh1VokDCF2m4t++5uLM4LTVu/
 nQRJy81cW4zgUR6lpJlJIlc4tKXct9BaeAAgNI76ZtOJyQHDr8ujBu73UomjaL3CMBUurmJIdUS
 9QH10mpNDeF8NqisWXeTOVMGtFXo+Wqw2G7gaLnU7Xo12+duRHIj2fc+n5dzmISPvCUEWhjIkak
 rOPQsW3U/MtuhfegxFUn7xxdRuBpFV7Z/kJ8PLiCZaaQ8ORdWlhUshbIuyeL3TN/nHv4SYTAm9K
 M0lqB607
X-Proofpoint-ORIG-GUID: 6qhWr-PLcUzy0tDAV0qismRU1b3HEqo8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add bindings documentation for the Kaanapali Clock Controller.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 2c992b3437f2..784fef830681 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,6 +25,7 @@ properties:
     items:
       - enum:
           - qcom,glymur-tcsr
+          - qcom,kaanapali-tcsr
           - qcom,milos-tcsr
           - qcom,sar2130p-tcsr
           - qcom,sm8550-tcsr

-- 
2.25.1


