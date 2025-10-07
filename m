Return-Path: <linux-arm-msm+bounces-76240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E131FBC226A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 18:49:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0E2919A5036
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 16:49:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 971EB2E8B7A;
	Tue,  7 Oct 2025 16:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GELZehE2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B3F2E7186
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759855763; cv=none; b=OMeX4b8Y9gnCXii1M6d1fQS4p/K0ztHHWLDXCr2TABTLMNgb6uWUfP9LFUuZKfP8SuaVnluBhDl/T26aUvFVRiO1ji4bh9CJkVAZQeIXjklTnEPCrKOa79sIThX3oxie1sGXCQJ+/9Q8mpBzsyBNZjCZNDdNQI8pvANzqryhHYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759855763; c=relaxed/simple;
	bh=yQcmBzzoF9DWalLjee8gEifniSD8YVltfiDi807djjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZ2ItlEMVMSOVunDMxLKNzcTiadcT/6A9hlU/iRHwqqw7LAlyy2gGt78Ldd6X6V/w97KyiIG8e3KmD0gawWT8pIVZWnEjJEckpGQXlaeC8RJRbpIH7vhPTF0eiTBP6lfMiSn1BZYBHzOr+gQk1MFo4Ye3ff9Hac52orkn44k5QA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GELZehE2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET7C6031525
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 16:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	64fVTnFFfZEl5jGpLIwHf1DYoSU0yN7CegjL03AoTgI=; b=GELZehE2ShGlnKQv
	C22iyDTQdnd++qArj5K4i/pJNOxfiMc72Funw1edh3X/rboFvFCRmroeZUwe2+y/
	ARfiuKqDiLb7ZaKtRFZPScvf62cov5SZc5hMzuR0blXfJ+HFtNsIL8iYnhzr7nEb
	pYGkycI4v3H2u65ojadcQwnt0ILKyX+HQ7uEnTKs4RrJckIwnmMQZOSu82nKj5Vw
	wNWnDWU1Lpf4e6rUB1fDLxbjkaXvadsP/KNI0vGG7EecblolS1Cndr1FP8eGZ2MI
	UURa5c+PEIbZQUhvbTv4qza+jK0XAjz6tko/b9iGsXlf1mQtFYxXY1+W1FB+zWdH
	EKqCbA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk700gc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 16:49:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-27ee214108cso143179795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 09:49:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759855759; x=1760460559;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64fVTnFFfZEl5jGpLIwHf1DYoSU0yN7CegjL03AoTgI=;
        b=OUd2AqsM3oMOTaVQVzBHqE3fLiqUap4UfjxeX6YwXn9uU2AykuI3/XDLNeK7ZHz2Mr
         bCccI59eVlmhpsqdtceBd7ntAZ+iYqL7ktl//CmxCAYt1Kxk7SdKTeTwTK2WJLZjIOoO
         sOU/jT6dTYznC7sK38JT51Y2DgqJp6fg9/0kThItr8UaDIDtjkY8Azu8RaNPOhmzuxIC
         9/p/RClyqLeL4JbYIjcbsmrOnZEvLK9fXmrh81/gpJWCtLpNlKDmZnSbVJTOIs5uI57I
         eEeQ3mSynVvA3QNkbXMOKTw7tP+KxjnFXNQ6789e4GAElkWhCQgnVjaXixZxAVAChpqT
         gYkw==
X-Gm-Message-State: AOJu0YxXEczBO+NWIV43HJx8fYswY5164ky8Ma2xy+ijlo80X/LAUBgz
	a3IEg8AWYk32nyF/6IIGq9rIUb+Q4JVVsMJ4FjeknsWNCpcJW1O1oBRSL6dKNhzkDySVuPAAeU0
	BefLiGykzWhZMRtNmTnCi5s9ZG0tiIuJXbFS157U7jklvwcJITwBPi0pP/kmnwsyeczKW
X-Gm-Gg: ASbGncvFbwD9KQRIc2Wc64m02KwbYioVky4ND1zefkffAVWv73khl2gWEBkw6XEg4lz
	r/CAZ+ZRV0EBfZ6x6hbDwSGsyPnqXPsmTwJ4Urm181F6t6nQY/FzAhvSGH81BJ0DkzWsP7CR+CT
	darjvcyh48jqab/5kNLTt/YWCVl2B1hft0O/q/7MUWMSPDfPAxUuj9AUOYozuXvt/5hZofNGUIG
	+fWzd0WT6ydE1cE7DnC9vWws4hkCLwoZKEb6BayT/FKz9YUa/FrAAm4G+frAXOMLEd6EUtJeCQv
	HlnoSQFz7jO6mUcKIzAurQbp2Kvlimbmvs7RlVkSfCP1pymuxwsquKJ8GijN+HE7lAGiqTWQ
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr5078995ad.40.1759855759227;
        Tue, 07 Oct 2025 09:49:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFjslecCe61NM3LsrZB6iTB6HGCtdzDllatkqmlEEptEDY1li5Q+TFUuNY5rlkX2+LZYBPuQ==
X-Received: by 2002:a17:903:910:b0:258:9d26:1860 with SMTP id d9443c01a7336-290273ffeb7mr5078675ad.40.1759855758625;
        Tue, 07 Oct 2025 09:49:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1261e2sm171990825ad.38.2025.10.07.09.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 09:49:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Tue, 07 Oct 2025 22:18:46 +0530
Subject: [PATCH v4 01/12] dt-bindings: remoteproc: qcom,pas: Add iommus
 property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-kvm_rprocv4_next-20251007-v4-1-de841623af3c@oss.qualcomm.com>
References: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
In-Reply-To: <20251007-kvm_rprocv4_next-20251007-v4-0-de841623af3c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759855750; l=1163;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=yQcmBzzoF9DWalLjee8gEifniSD8YVltfiDi807djjI=;
 b=eNgm6wLt3+Ue42wnQTOpuEaYPRaxtNeiY9CgLvnlGlttjle8kCO0E3SwUGk/4jsz5Fiv9CZK7
 VwQO+7gcziBDRo+DfyiJUIH54HwiUkn2h+mLfm2LqOxBPEflbGLup0V
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX7jfTF7Bfc5b1
 sf6Mm+l7DPzWQ+q7fkOar7ak77OOE4o8aOWMDx9JSD1ac+jie3Eadlan5EpVgRIx+K/MPZTiXeM
 D5jElcrbX5cmoHRqtcIz5YH/nW86TMY5sKhz6l3lexfe4zvExFQeHRl1RxlqSYf6tP2bIoIdpm0
 zatFGx73ETA9JZpzmqZj4fs8q5YejqE60mMRabstA1Gm6+qHlN9gjzyksxus8RbW3iwc+CsxDJr
 bhSq8Mf3bX5AvDYSRGSKniKpqeXGPGg12oNc1ZZDLNqyxHWM4VAaWOsBQXLEmI26NN+kyneBl8O
 oRem9Xu+oj4ma6uBFljkYRapfneYV1sMSxrsfb3u2Z+o92zEbJZOtwFFat67VGYh50YmKRZcZUw
 jm9I/NEOHnJrfiSZXLQHThfYB/tLyQ==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e54490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=yGyP_gyn_XtU8QVV77EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: m5RAceGi9rgj3QBoVKfEX-no77cgToiU
X-Proofpoint-ORIG-GUID: m5RAceGi9rgj3QBoVKfEX-no77cgToiU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

Most Qualcomm platforms feature Gunyah hypervisor which handles IOMMU
configuration for remote processor and when it is not present, the
operating system must perform these configurations instead and for that
firmware stream should be presented to the operating system. Hence, add
iommus property as optional property for PAS supported devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 63a82e7a8bf8..8bd7d718be57 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -44,6 +44,9 @@ properties:
       - const: stop-ack
       - const: shutdown-ack
 
+  iommus:
+    minItems: 1
+
   power-domains:
     minItems: 1
     maxItems: 3

-- 
2.50.1


