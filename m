Return-Path: <linux-arm-msm+bounces-71195-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F3B3ADD0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Aug 2025 00:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 610031C8382E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 22:49:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A27532E7BDA;
	Thu, 28 Aug 2025 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUIvoBJe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E272E228D
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756421315; cv=none; b=qRuog1Bs+Ajb84ZiXaTdB/yaVkCOhcsrGZpDEVU5TeWcB6ymubyj/Qh/JTFGOy8u5sLt4Dt5fvvWSFgYpWhZ5Q+zmxhFtI/JPFgE6iyJ4LARHa4p7f8AcbOv6L/G/9GuARH14kqUGF73W7fQnAXfbwj5YxkAp2aZIrCDNWnCOok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756421315; c=relaxed/simple;
	bh=lBevXKdHONx87FeX9ms0nioXAmeKW3/lJZ9j12ovv/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XFX34aUk2ZBe7KvmxWf6dzj7j3yX8AVSeWwBsG4T32X5Z4nCXa8BbEB//S7LM+O+PaBbPxfAEijN4T/V2RzEsTmowxU2CdDHsQOK+a8nvUSnYrsHb5k9q25tfUrYwUOIa7+RmRakGfMsSSXTUDFlobasCX8/pINJXuhlPMWOK+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUIvoBJe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57SLWf75006305
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=; b=ZUIvoBJeZOkTjVNH
	BdeTWwQw9MJE3eS5Jb/1mmcRhaoxvmP00w7dfH9PDXurrZ/tu7xLqojnOK4Gh1xQ
	Q32U/ZTQUKNCQJw0xd6PrdN2viv7TKIRYKCLhL5UNctyYdJwjfltVX/l1Kim+4LJ
	GEL9oMXpJrWnFLGQUBRMM9fDA1noWep8HiFybFn49bDA6yz5JJTM+uvW8R0Ohy/T
	SYzcFXnkBKZ3R8DatrEYM9xuy6TjC4bz/Jf5swKiv7j9cfSJPkNhynTK/u+SslQb
	408NSYDWRCUOYHmd0Ll/XNTK6thnwRpbtw/h2i+HgAkgHr65L9+HCugGeXyVMLEC
	AeAWig==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tbpgks61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 22:48:33 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b2b3cd4d00so40333261cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Aug 2025 15:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756421312; x=1757026112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H010azYPB1dFkM9rbItrhry3MhtWqv6s9ueklIrUJck=;
        b=g01fnqWoD6i2aZe4wG2gusoHCjX924IMfRdi2RJzDE7+a3+aSevdn/nUtHl7CL75kI
         vfamPrRHTdPyKrC+8ppVZNlf9B1eb2ajE4GGOGsozUpanmWcyZke+g1QCNk2HRPW+xxf
         gt7h9qxQfOG2FDTxvjPjo/1and/NfkWdFjB0Ie5Xs11TQYn/lTgsv5SiqUYTka1ijbcV
         95TQv518ZR5R8yAMHRnwzliuQ65SE6hd4j27SR4xANizzFhAx294YjYnfhoQXscPv0U+
         stFHY8K38oopbfokDyVkt/WBjByAiTyOwniNnHDSBp9yJiYlrHSvg/roK9WZon+mbgEq
         BLhg==
X-Gm-Message-State: AOJu0Yzne72jbpoElxOs8uPoQYyjUR95QWG8eUd5cy6DRPdm7TTjdu49
	/ULEaXpLuZrz3L1RetJAog+SLwhKPpV0oU2Ag2iiJyvDuXXxkOtE5lPGtiDyLfUpxudeFp1+sYK
	0eAS0Y0L70e/OGFR/RxOELYbKq4/AI6x2bEIluTF/4Fx/y+8Q6YJgvDcP3lLXDr+hfG+a
X-Gm-Gg: ASbGnctz7HfvL8lMLg6dUzySLUfW4eFoPrsBbn1A4lkaM23UC/wDV5+4TcKxXm7w3zt
	aNeGXnASCRFsh+24F2Q+EVIn39kswM0ZmiuzEaVCk0PAZXsa+4BXC4h++Mor2sSPa5ElSmjxsv2
	q6srVqcvyFcnUpAYlzPVI8MQF+rrX90diM8yMtGy3eZIlw3Mr/Op5/2ABjfh6rD48IMDsI891Eh
	KELD8Yzgjno1ovDcY3YGtqafgaQCqeYypaPYSVVFNQXwUGJaZHqliXlTpFNAOHOpbAYk3StPafb
	uCXQhxNgUdqsxvolfA8+c7N/KAisXOEc4THesEg0Jq/WXB0gtgSuJEACfK5P69xCRxw9Efq5NJu
	T1zW8kHUx8YTG2pjYE1jCpSVSFkrE1yVlIbJXsLecVp8GNBm31lEv
X-Received: by 2002:a05:622a:2588:b0:4b1:dd3:e399 with SMTP id d75a77b69052e-4b2aab5676dmr361928351cf.64.1756421312206;
        Thu, 28 Aug 2025 15:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOO/erwDQbpF4Fb6KhxbS74zgMW6cQ9wfbbmzdHGrqUotbO/43B6vA9aYP5MQ8v61W+56RbA==
X-Received: by 2002:a05:622a:2588:b0:4b1:dd3:e399 with SMTP id d75a77b69052e-4b2aab5676dmr361928031cf.64.1756421311744;
        Thu, 28 Aug 2025 15:48:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55f678452e1sm143807e87.85.2025.08.28.15.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 15:48:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 29 Aug 2025 01:48:19 +0300
Subject: [PATCH v7 6/9] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250829-dp_mst_bindings-v7-6-2b268a43917b@oss.qualcomm.com>
References: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
In-Reply-To: <20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jRBkyHcr8xMj4BTwupyA6gCqxajStjyC+O9UZ5EGgLs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBosNyxSi2897UPGWZ7+tGFFt87eM4WwDieX+9/d
 AYmK0GVlNWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLDcsQAKCRCLPIo+Aiko
 1cSSCACsQRdfjhH0Jaax+CrEha+9shhAT5RQvLhMX95pUZ2Y2o6Vhih/OvqKcCenfLYKTXOZ18F
 8oY6sJAu4UYge3f03Kp5+9J1rYLDRMfPiAsX+Po13rnS+sAflMR7Y9gGqZ7Q4eI5tG6XKUHxNcS
 ymj68EImGXDPxcj+tqACxj6MiRGFibqMCTea1hCoQIiYmjxpvAtPFAQHmc0BV79nQ9sviNijwMr
 6Yf8DfJeLIJpSNGrMnjQ0CPeEddn0VY+IaYoHzvmlcDXurmZzewpgykeUumiVfC3+/Z0rks4u7T
 y6UUq5jCI4/Umr0mY9xDWIymYe0VQaHgtrTltxNUWtTl44Gd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: NlGO5VtVnPZdARb7VeWbSzGAhRii6bN0
X-Proofpoint-ORIG-GUID: NlGO5VtVnPZdARb7VeWbSzGAhRii6bN0
X-Authority-Analysis: v=2.4 cv=G7gcE8k5 c=1 sm=1 tr=0 ts=68b0dcc1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=VjVaSBsDX57WhQYIrYsA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI3MDE5OSBTYWx0ZWRfX8aPMtryQ5dle
 DqgaT6BMprkjmTglrQt09umUuCOWRkRj9UZvMzF0nvLcqw6g3DB9/50IDZwTFDL0DO/oNGyhnRm
 KEb1sy9rRYvP58noVUnQVSY605+MJB7UaytXb1c+zaMJ8XfGfalWpWU/uU/YLAKb94zINaU0DKi
 LY7o7sYcmMqft6nvq1Y3ZHrEaZlbRyYl+/jqjnKaVxTolhMKQm7Ksovk/DXjhOS4uFq7qGJVlh1
 qS/Q4Y3RsCqkyvdN+BiVOL39YlK+An1HXc0zee3weJcRC7Wr/TPVbwCDEF+AO6rmUfuly8ms91q
 D/97/oSElKOLssmvpbJmiOWuAVAmspV6tHlGRrRdhyXIzvrYfNpbA2u9O2PRN7FaNQAGKwdRZWQ
 7vsqavrr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508270199

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

DP controller schema documents assigned-clocks and
assigned-clock-parents. However these assignments should not be a part
of the ABI: there are no actual requirements on the order of the
assignments, MST cases require different number of clocks to be
assigned, etc.

Instead of fixing up the documentation, drop the assigned-clock-parents
and assigned-clocks from the bindings. The generic clock/clock.yaml
already covers these properties.

Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 6316c929fd66588b83d3abaf01d83a6b49b35e80..afe01332d66c3c2e6e5848ce3d864079ce71f3cd 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -86,16 +86,6 @@ properties:
       - const: ctrl_link_iface
       - const: stream_pixel
 
-  assigned-clocks:
-    items:
-      - description: link clock source
-      - description: pixel clock source
-
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 

-- 
2.47.2


