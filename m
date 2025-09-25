Return-Path: <linux-arm-msm+bounces-74880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98FB9D2E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 04:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B6574C3847
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 02:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32BEA2EA73F;
	Thu, 25 Sep 2025 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FoDhhdoE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530842E6116
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767350; cv=none; b=r1OTtN6Jc7ihCwg8M8uUiOANX/if4qi5ujSFG0I9AKnQexa+TpXh24dlQnGFkLCLBLRkrXpESul+eizXVMBBJ0PUn/kHVS3b/TwTg1+B30qBpfydUSlROrurjAH/94WPOu7pahLbTfbzFLhwXgkaE0euvCwG65QPHfpPjSsxJIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767350; c=relaxed/simple;
	bh=OkC1mLtz16qVJoq2dcpPz2WMUUNz5fHtzWVOhSAQHi8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GgSbm8uk6ObewdqtS/v/eOte5H+/cQaReD5HotVYDY3d+cO8R/WlBYm5vpXXR5OOrRkbVugfV721b3pjv7wPVwhpy253kb8rhaSokn72SL/rPPdDvUQQQpn7Izaolp59GbrvX/h1N0Hhl8lo3zz2R3P9ZOdW4DlmJD3wiaN4S+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FoDhhdoE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58P1T9k9029974
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GwDc2ByWl5B
	YnzIa/5w++Oacjx00R55NFfYXUv0r7SI=; b=FoDhhdoExc/E0oa/RjY6gsGt/Jh
	V2wlsOgUWGGySNr0nKBxTNQ524GE66k9a1tr6uGHvlhxYOvuusqqfuZLoufZv3E5
	InFF9mK4clImcK31E4vXy8zGJVaNJqtlN89+4ziPsWF+sBh/Fyb/0rglEyVf7kpf
	inT29eT8B91jGnDgs+Z4Hs8fU/7w+O5tj2hTyPzX2LQnF0USyrqITFnnJd788LiD
	fy+eN5IEcV9c+OEkHuyMuMceYfWRyZiLCCpThAe4EZlwC7x3NdR4u7Qe2H1H3Di3
	k5Y6MgAqOai0gDG/WUj/SnTuhQf5TOhNwvGjBTBFJ6n0SM5L2MCrshKsYmQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499n1fpata-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 02:29:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2697410e7f9so10232765ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 19:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758767348; x=1759372148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GwDc2ByWl5BYnzIa/5w++Oacjx00R55NFfYXUv0r7SI=;
        b=sLRIZZST8NGGfnPim3isjTnfhGl8mSTtCNlP7YXHWJyAZ4iiKbt3C3ups2z0M9Nskt
         VkIpG8noWAbtOEbvPH7P8eRyk+mp7gGbGJoEdtLkyvhlMdG+rOX/hEjzTPoEvIuCO4OO
         bGaIvhv3KKaaav22s4S73f+kuKj3ClekEhlIL5btuzT5jqpYSDNhzrNLGK8Ecxk/MUqO
         byHezOW1ZjanG2ENkidBmSOGrbCTiXSkA6VAZN3nJwN89uKJ/ez5JTbAvzSFVRYlFzou
         m04i6YUdg5eCGVC+qEhMhUjysreydGorHjRNRCjOTdc/L0gCilsQZmVr2TodBeh6J9Q2
         +U0w==
X-Gm-Message-State: AOJu0YzuZ4dg0QQ1nX//uRkCWAoe9uSt+PssnPxK0uNNigXyFjWzeOdo
	YR/n3PxWZ4BG9zXhheoyUBae0AR1FmQgMXHL3OpcHofWx8RBnExKoev4Kmp4UAVE+RIChLHm+an
	ai0ac7KaQyB4ZoNYvpcbcKHJe4CtDlM5pS8ZvxEbczWmPm1CJiN21q4YKCZcdxzhDG0Xl
X-Gm-Gg: ASbGncus2kHyhu+RMaczskYfzPoRflvnhBWvn3x+0cIKYax0nr46Z86i3jFETIAcqLT
	8yD05kljbEmmGbT2yw8m6snQv3rMDro1PQuzpArxQc9o45gXXP1BPw0h6oisDv7L+aRs2ELAU9Z
	XWjPHtJaxskERsJiv2UCnyp8X+dZ31Evys3FQRUS1igw8HJGXVjk4kG7a+SEoYiq2WOSy40oaD0
	ExZNSgMO4sEeG5/264kPIKKqiELrQ6BR4WO3fhIsXIr3x+wJFh998YjMTe2e3DuGSMHwRxFOkhq
	1yetAfmWeDylnMcPku5utepWQ1EDP/nriBgcujlCoj+VfZRxYNnkLdKg0gq5UkpeJH+Iz9Vt3Ty
	hHZZoc68I2Cc6p+H9
X-Received: by 2002:a17:902:ebc6:b0:26c:4fa9:64d with SMTP id d9443c01a7336-27ed49c69e2mr21780795ad.5.1758767347712;
        Wed, 24 Sep 2025 19:29:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMKdq/R1VOIoSCgX8QYg7ZQfJNKKkQRcAu0k1AT4ZkR8KlDibAwSZZsHxhiLM+nIZarqOfg==
X-Received: by 2002:a17:902:ebc6:b0:26c:4fa9:64d with SMTP id d9443c01a7336-27ed49c69e2mr21780475ad.5.1758767347265;
        Wed, 24 Sep 2025 19:29:07 -0700 (PDT)
Received: from hu-wcheng-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33471d711ecsm499881a91.4.2025.09.24.19.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 19:29:06 -0700 (PDT)
From: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
To: krzk+dt@kernel.org, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        kishon@kernel.org, vkoul@kernel.org, gregkh@linuxfoundation.org,
        robh@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Subject: [PATCH v3 09/10] phy: qualcomm: m31-eusb2: Make clkref an optional resource
Date: Wed, 24 Sep 2025 19:28:49 -0700
Message-Id: <20250925022850.4133013-10-wesley.cheng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
References: <20250925022850.4133013-1-wesley.cheng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: gscCb_-k8fXP-qgqySMiRQw6SpsapVIF
X-Proofpoint-GUID: gscCb_-k8fXP-qgqySMiRQw6SpsapVIF
X-Authority-Analysis: v=2.4 cv=No/Rc9dJ c=1 sm=1 tr=0 ts=68d4a8f4 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=8inbgvmG2iPteTk8MkMA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzNyBTYWx0ZWRfX5lvQnqSREdUN
 qDWUhf47hXM7SC0MJSQnC03WwQFiyCOkXbIwWAUAe/l4oBeXPw5C7nKDVkwNN4O8g0ZYrIltvLf
 txnD6u4o9TZbdekIbrR/aNPZMr4Hvq6u8mEl58FXK6SLzptECbabcWPq2fVPG9COl8GWDWWXo9n
 5Zm6rOqmRxy9f1GYC36fgxZD8QfNkzncZrkA3+GuUJiV8HdgsIf+s0NvDGPHsAKLM/UKWjJbc9t
 tUg4NLFvt/PDvi/KDzSlPHu5KghkirsVhCP1AL8I3WsVYFDR6SqF5oXViMVfKA9cGT3it/Gm2lX
 LLWYZmyEm2rEnU3IitBRL1wDWroNWbZtMC78VtCAl/+cXEv49AFpL6CrMksSLdt1qzYdYDXzpcL
 37ZkAj4r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200037

Some USB subsystems that utlize the M31 eUSB2 PHY doesn't require a clkref.
One example is the Glymur platform, which contains 4 USB controllers that
all utilize the M31 eUSB2 PHY.  However, PHYs associated to the primary
and secondary controllers do not require a clkref resource.  Due to this,
mark this as an optional clock.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 95cd3175926d..f8a00962f937 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -267,7 +267,7 @@ static int m31eusb2_phy_probe(struct platform_device *pdev)
 	if (IS_ERR(phy->reset))
 		return PTR_ERR(phy->reset);
 
-	phy->clk = devm_clk_get(dev, NULL);
+	phy->clk = devm_clk_get_optional(dev, NULL);
 	if (IS_ERR(phy->clk))
 		return dev_err_probe(dev, PTR_ERR(phy->clk),
 				     "failed to get clk\n");

