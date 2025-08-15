Return-Path: <linux-arm-msm+bounces-69368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 308F3B281E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 16:33:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CC9B118977FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Aug 2025 14:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BDE262FC7;
	Fri, 15 Aug 2025 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aJYCvFgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763662571A5
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755268244; cv=none; b=Zss9N7Tzdzb3VLpPvSm4K5vgI+qKGrmbU4pC/m2tzsx36bZi86LO2pTNbA0Sw9wnlH3BRwFTz0Jh/19geuAJ6jMuVOd/IeIQFBgGjwCeX4GuMdAd/QV8XA7J0rIwb3ce92TQ7YTmQTHkSiTg7xUwDUpNF3JMOh+ibcp337zSsjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755268244; c=relaxed/simple;
	bh=a8ke4j4Y6LPEDYk1jRjeU6q11tENi0EWXo++z7UB0Dk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PJCH8lNrnNBF2q2ZIxiHydM95V+Dq3lMn6OJ83GN7aKw7bczf3A2v0kDNvSAxJa/Tr3gXxw3VLkJll4B6EeWz6Jz1fnI9riYI4b8JQRJ9HswPZhQFTHADQBE49/5ouwBgANMtH9xuHtxUUi9P1d0BVIbFXGouOeMhvSo/SmtDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aJYCvFgJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEJJ9j008958
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=; b=aJYCvFgJ18llElZy
	UoYH1NEgasfGOKpq7t6sIMLByYKibTopr+PrfcUnVZMvkdEFIE3d7guk2cLIV7G4
	Vr83aRMb288cYGJOeI4s6QMLsHS/XCKHlidfE4Z0+Mm2dbNKhmwxWzks7GXJmHc7
	P3nvmCSRKo7NxjoR+Ptk0G3qOZZOaHRU/taFRyT7SJWdZmBBe1DwJfAFFo5Ql01z
	P/PB9vqnPvKnWaXsoNEIPojHwrafEddrHgC9S0wFOE2oyJeeEk4pyYq2rJ1ayJ9n
	wW/90L3ACJvvk7P26rUvHejAfT0u4lR0L2yZfOI0o369nB/YgdYKxalZ4DEsRJLT
	88bd0g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6y5pc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 14:30:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a9f55eb56so40857196d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Aug 2025 07:30:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755268240; x=1755873040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CzfHCqMGwSglqPBGTXjDnFh1Uf1qA700EaDFGkGlqQ=;
        b=T1dDgLeYqPsoZR52UzQBzyulbAmj38qdReWN5MfCFVDpbl9DgJJFRTk5FxB0UxejUv
         a3Dn+FiIsLuhTCrgON7g3/2V+5W8Vf6+psXq3Dsh5TXXbZd7EIt6tzA7S/xEd5qd9CEV
         1MK9qgH+SLpBiugcqgMmm5e2pbmgClzJNmdlvr6HmueJOTJQUKEPKaHMyKXC+BjVGpnU
         FzCBmaUBrf3/97uUUXwNNvUtTir2esUF6yMHmpT1MlfCSySPJE4dvHH/If1lP+lqZCJV
         T+HkbUUBMCIRcGgH28rYV7cEuiIbdBNQkXYfOSvvD3ztYSdo6v+hfrLP94sqTAPF2wd6
         b6Dg==
X-Gm-Message-State: AOJu0YwQHt/B0VVCJRnOx5g0B+EbDybV1ZJ1s+H0oUVlOAQ84qdynN9t
	id0XPduEdli4Xa3sYy9w9wF04Lcsx0QrgT4QoHiyko7IA3a8GuPr4zfgLPscS2syS8+r65HUusN
	LNTFGTPNjhmVamaHUkU2jfOosgpHZNJX0RFAMx/GHhga+bI7Z686uOh5PYpdHQyOJaGSD
X-Gm-Gg: ASbGncu8vCf1QUKaRETlv6aPY0ClH6GB3r9kagjxlmWX5jrBtMAP0gIWhb08c4Jjjr6
	KvGhOQf8tiLeFjreppExs6AKxUYlQzh20aUXza8f8+T7qjofd7pq1EaeDCYdX7lTdIDMa1l+/rU
	opb9NsPWE8sDSCCddq2cfDx9mSsDOwPIAoXSIsH4RQ/wkIaqxajRhuE8dFP6ciAVZ17G//Sg0OH
	z1bLjaP6uTeI0EBj8kF2GWiphtNvha1BJf4izu0nEnXEKm7WYFWP7D/e2CnUt6xeNOlD+wMBIk8
	mmOC16WjKqDg8i2G7KJRXTqJZ8gP9t5hRcsydRbOakcwZRL0gjpAZMGylfV4BnQmx1bFeLZVXkT
	gsmWkrMLKtqr19PNFTaXoNeyLWVCWhbf2tbYK2r2EoYZhPkiCVpG3
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id 6a1803df08f44-70ba7c6fda1mr21010646d6.47.1755268239921;
        Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESu9wlfWDH7KhI+726PhxhS7B3c8t9B4QgXuWap5FzKvPgEw79c+md6NHYKPbonVOwZ8hFIw==
X-Received: by 2002:a05:6214:d84:b0:706:dee5:fd3a with SMTP id 6a1803df08f44-70ba7c6fda1mr21010126d6.47.1755268239262;
        Fri, 15 Aug 2025 07:30:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef3f358bsm305661e87.110.2025.08.15.07.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 07:30:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 17:30:29 +0300
Subject: [PATCH v6 2/6] dt-bindings: display/msm: qcom,x1e80100-mdss:
 correct DP addresses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-dp_mst_bindings-v6-2-e715bbbb5386@oss.qualcomm.com>
References: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
In-Reply-To: <20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com>
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
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1755;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jGBROFXef1Ek+8wHh+Y3Ci+prYLBgIDZTxGb8ga6KTM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBon0SHDouVFwSMXsubc+sifkSHyNOV0hEn37tkL
 bqSE8McafuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaJ9EhwAKCRCLPIo+Aiko
 1TTxB/4gbz3IsGn9diGtjv2N5oYvAbdCdzHiv3yMsoTJal/i3X9QpJ3Ud66nYST/WdG22kwCghL
 y7bjJZ/Iu9LIOWhO25Qt0NsCoDROQspnDy/3/2+lXYpuuaVdi9bMyTPKR4oZ3nLsUy2B9wemtdS
 /rqpwQbDZCTcqo09i7ylwFNa2qQx66xVy8akja0B2jPMT9uzW/LfADYjGuaK/tUKPaMTZJPE5no
 djBSqP0D2JQ1iAoszmyCEeKWuMGecsRjj0qCXDr2QRkAYYt5x6kIbZM5Mr7DI/MbZgDJgKpyGnJ
 Uq6Eiy3aNNEEqIxG7h9GfNZ2DsGLF+z1g+fqKL+PWmMmV7ok
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX2Nvd52Wp+tkZ
 8wDY2q6Jko6LtwKgjdgIBS4otykYpy9unY0GXx1QZ+G8hu6SMPdkG6fZISA4W8zOkdW74mIC90G
 APHQfZHBtb1CG60iCZ2R/MyYu4vkmcfHUv82llePYGW8TMlX0XX5CuHmOkXDFLW7HHwxf82oxgu
 tnMCN+/kxMA+w98Ky67KwTPpAfEitYJojxVfatojALmGB31My1ixVOQDrKVHvF/2WsnAFnbY3Xe
 Oy6ZZqE/Pbme1x9fYFMrgO241vsWDcDf8anF1T9RQg3ApTxfKPzkih5oe3G0dR8qx5sW9Tx9zvl
 Q6B9wgrZe2clo6gjwq2cIoNhpKZ8jeUeeWeqEpmld5j/Q0KVf8bsaRu2QQrhDzE7Qdgevua7pao
 nheHqD4J
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689f4491 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=fvGZ3mk3BhhUN7shqj8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: NRyd3ZY5GkJkOwAZhYsFTZW6vLjsbsRe
X-Proofpoint-ORIG-GUID: NRyd3ZY5GkJkOwAZhYsFTZW6vLjsbsRe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Fix c&p error and correct example to use 32-bit addressing (as the rest
of the example DT does) instead of 64-bit (as the platform does).  It
got unnoticed before since DP controller node wasn't validated against
DT schema because of the missing compatible.

Fixes: 81de267367d4 ("dt-bindings: display/msm: Document MDSS on X1E80100")
Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml    | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
index 3b01a0e473332c331be36f7983fb8012652a8412..e35230a864379c195600ff67820d6a39b6f73ef4 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,x1e80100-mdss.yaml
@@ -170,11 +170,11 @@ examples:
 
         displayport-controller@ae90000 {
             compatible = "qcom,x1e80100-dp";
-            reg = <0 0xae90000 0 0x200>,
-                  <0 0xae90200 0 0x200>,
-                  <0 0xae90400 0 0x600>,
-                  <0 0xae91000 0 0x400>,
-                  <0 0xae91400 0 0x400>;
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0x600>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
 
             interrupt-parent = <&mdss>;
             interrupts = <12>;

-- 
2.47.2


