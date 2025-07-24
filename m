Return-Path: <linux-arm-msm+bounces-66466-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E9618B1066A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 11:37:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB8731894E76
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 09:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7965F29B8D2;
	Thu, 24 Jul 2025 09:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lI7Ro7Hd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC418285058
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349366; cv=none; b=hpTsoJNresw2r9aQhhbtNbMKWZo1IkAE6wEuMSnDgUpQ+YYIZSdvaNAOMLOhoc453uIPxMNtb724m8i9pu/n9bo0aWlSYuubY7SNKMZkJowZlMAoT1/QmTBtWkfoqSVF0lgBhp5VigUnpcdxBRoCtsslMHUi8eK8O4ldczP19Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349366; c=relaxed/simple;
	bh=PPHlJY0DBTcDAyhfFMcfSfIO7XmnVHjq+LatoXOHmkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=utdUbsa6uBp4yeeeE/GsU4CaEyyki/SoGXFH6lFCcrCyOp2JTVCD3x4nKjIT2LTCxF2rfctNTzU6g9oZGOXUI+T75xXI0uvQUR9f2TzQLB/3l2e/5grRMYyTVucMi2R064PDA3lWH3lxHyTdJHBPCKqlQlUFTKUae4g8738ykrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lI7Ro7Hd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NMXNm5022020
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	moYVE4cTWaiaAnOXhb632zZFM1UL32qTF0JTX3SvtkI=; b=lI7Ro7HdcPEwvycZ
	i9oVlLDxas5mhM78zMZFs7DZk1h9GerNubNEHnL+M4ilmDOs5GXKW9HfqFSQ27V1
	p4o8Se822Q+o4u7VbrQShnhpqJYGGm/kWg87lOe5J2FrguL2U3sDfaC1xJBexAIa
	URbHPGL/55JGF0M253trHrFE5X73PwQTe3GRkppDs6+QvO8D7IUYYkjBBNbE+PMZ
	rI5bnVHniCnrioGFgGLVM4FDVCBSGBoZOtHrkHPCCmJ8APzIbfUOt9Nnh2dqF+h3
	lAY3/Pmce7kg9DKPUM0ynqj3WDRHC237tTfKzWUyHDbHGf/NMO2Haf6sfBRbXxLm
	93k9hQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dr04p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 09:29:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235e1d70d67so8229725ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 02:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349363; x=1753954163;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=moYVE4cTWaiaAnOXhb632zZFM1UL32qTF0JTX3SvtkI=;
        b=YEdBQxI0ahh4YkJglHKQnM/qtH+PgZr8+6lQJdXy1/Ci8+uDC/C3nK5Y2SVd+D5xtj
         QKUqRj1vUp6J6TlQJm8lE9QYHxfxICwdDXAI6avei6MduYq2hV9InOnTFpNHLwPHXH+c
         kYVjt0i+TTpLoTpr50u6FiUZ6RAXBFnCcI9McN7xofaCXkhkFhdPXgqjK+4AYVcZWAS7
         T0VvVtDu6HTN30CvkKr8SFHWwuzazZZ9Az3xPXEh9pPpbfz9g4l4kWkqCxechhluhNfm
         PUfr98G3PvrOZObZdJewQxGN4CwqKR22p5SwInL7rhY5OGgvJAF3WCFBesM8cov2Zo//
         6VSw==
X-Gm-Message-State: AOJu0YyDuL+OLyr760BU86GE5Fs1Gr0/2o1zXAn4CMl5AH8aAU3431eA
	QqlKAQzK/Z7uEiKrXytwE1yDt3S0t/zZIEdNRm/L4PX32rUlLYekGYIwIa+P6YiWZpLwkQB4SgT
	p4fwivg6DkMupB0jewdgzlUsirFvcchhzc0pUKWEGGJ3f64aANRIaxSIALcxgMNZSiHRx
X-Gm-Gg: ASbGncs2m2zNq45mc74O2Ux4UBK3k+6uUHs26/Ti0p5NZEPoKGIo6PB1DCxktfXr1zQ
	j7MtyMseL2zMQwgZU14rJZaAMaAclrmCNw4tAZBeg4+zeYzplJWhPht4fKuSySGVkqpGdCqCLks
	QS96+XDaeDkEkZFcdMylk2Un5B5bSCH2rzPv9/ogigk17GMLYJeRkST6FbDZJQsuSIRw0vgK/CX
	KSJtWgwtXi60jZWAlyG45HA6FUPgFbPQh7agcZWRhus4KwNYN6kWOwUIHCR/d53Q9hmYLZzpgbJ
	WKuxnonavamiATmeCp6ooBDwQpnwQFRyKuOi7pE5Ve3ykM/47/ePYBrlb9Dt/6lh
X-Received: by 2002:a17:903:198b:b0:235:e942:cb9e with SMTP id d9443c01a7336-23f9813ac30mr82925655ad.9.1753349362729;
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzUDlAxoq2iIvpAwTAbSpSv3iI8qSUmVJX5tT0OXMmNLVHMLk0kaGDM/qQeIZUKeuV+/ACeQ==
X-Received: by 2002:a17:903:198b:b0:235:e942:cb9e with SMTP id d9443c01a7336-23f9813ac30mr82925285ad.9.1753349362286;
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa475f8a0sm11276505ad.24.2025.07.24.02.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:29:22 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 14:59:09 +0530
Subject: [PATCH v2 1/7] dt-bindings: clock: qcom-rpmhcc: Add support for
 Glymur SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-glymur_clock_controllers-v2-1-ab95c07002b4@oss.qualcomm.com>
References: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
In-Reply-To: <20250724-glymur_clock_controllers-v2-0-ab95c07002b4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=6881fcf3 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ZmWPdgOBrplkPgKrADIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: wGbr61FPp9hIzscQMr3JhvtO7NsNqhxG
X-Proofpoint-ORIG-GUID: wGbr61FPp9hIzscQMr3JhvtO7NsNqhxG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDA3MCBTYWx0ZWRfXz4bF6rnphDtL
 PGnggJzpVzcfyoHcuMggP5Et8Hqg6WpI+ippOGIMXc1GRutD4oW+g+6g0oVhp3dG0x54EbnNU4l
 6tNqibESxbM/o4OCUtA0TeLMP2WAyog7ZNFA5XtgftRHn6O6y6oAJr4pZMkf4PWYlXIN+PheK7m
 c+lMSXbFZKbd3MnUhuQ2oXCkT6vvmbsnZ3H0Emuq0uJeCEC3coj26V9XaESOxf0UeTiQxRCNR/9
 N/kkbyk139Q5g823eqjGWXB53TtdnLCBQxPfxdU8V/e/bW2Dm+Z/GPC2bfys9PTU3TvwW7HooO/
 evGVSqf64Rs52vJVazPDuEvCaIBobDL+rwDuJRPGAnNkK6uBghj+IeJcZ6NrvWta2e0o955tKs7
 wPDOmJhc2gtbBc+JZUl6GyCI8WsVOuuRViuRImpzR+1G6n1dR4h5iLb9czzIlL5XDXFBAXaR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_01,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240070

Add RPMHCC clock documentation for Glymur SoCs to ensure proper clock
configuration.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a4414ba0b287b23e69a913d10befa5d7368ff08b..78fa0572668578c17474e84250fed18b48b93b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -17,6 +17,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1


