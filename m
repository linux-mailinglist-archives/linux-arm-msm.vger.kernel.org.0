Return-Path: <linux-arm-msm+bounces-74768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC2DB9CA6C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:39:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 52E6B4E3440
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA952BD035;
	Wed, 24 Sep 2025 23:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NigyeFxQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98092BD5AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757115; cv=none; b=i26WoqLpMKOhM4gL+KtbLuPe2F/Qs7xQJ0DMwR1pbCm8Q7vASizdW+kWZHX7HeL4zXrnYe8FbOahLeqzcw90gLbyOoJ5uRE9lgBHuaSwRsenrpkw2d1yyDIMikDyo6/pB6f6bu6ayKuGubh8n1vHYaQu+brYt2xo/ZDOMTJM9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757115; c=relaxed/simple;
	bh=h/M+YE7D6HI61MSGhGzdJ4IOvTB8zDpewv4W5jZaG58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Hf9781i7rzYSf3U0vir84jQcmQEYnczdBPTRQFJPJJtdGo+Uo9FhvGGrBL2ausMMFPy+Qb3gJrKR2Od00mzbruN2qCL/GkW/QFfjX8guvC2rM3JIBvh+8fRFtBKhpED0JnIqXHzK76HLaSt237QoK5p7qZ8n+v2cGtbXyYin6lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NigyeFxQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCGQvF016438
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0TF3HRPmEBLSIpIUz7r21D
	zVHSr1wz9ZwCuRBZA9gfk=; b=NigyeFxQRTSTldguITL38UgLud76gdEw0wfHEf
	fhqR3zYC5T1ILmMYV0Z2JtBU5/KGdOdXvdr1ujeeHrh1cxkAtwnG9XayJFtPCPtn
	MuubaxZaaWF1FbwHgR1VJmnD05HlkFZEnc1Xqg/3dNoHKT3KyDtMhzcGMxYdRw3a
	Q09SXRHgQ8l1gcIfkA92a4QmYQ81tTI8hrsZalQCXc4uULUM4w0A0g+Q7RPvdJOC
	Vg07SaGKEcMP9zHMSjxCILKQ8pA3C70QaYK1t8PkBhZmGjqexodQfp++wOoWhdOD
	MCoYfV42NB/3mwEAmZhIT3bVJiZka3PmFYL644XlPkyp1org==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3nyhvep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:38:33 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7810289cd5eso170820b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757112; x=1759361912;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TF3HRPmEBLSIpIUz7r21DzVHSr1wz9ZwCuRBZA9gfk=;
        b=uXbsLPsrZhvl9nyTcA6Z4M4vpnjNAxg3RM09W2QLUhxdT3S/dq7HF/9KPbzvxu7dgT
         9JPbF/8IczxbSJqZ4YW3ffANqzshER70apUoh6OwX3S3TDYhINC37WX+Xd2BMVIeCOCO
         qwlDsLpjmia7eHyZrecNPPwjKiZh2LKCzXWaPDxg8r7Jti0rXRfJPG6V5tWJTZiveE+e
         yStUgxcapRIQrSmVDZ7zp3q8Gx35hXTO2igiOta3tWKzLbzzkPtV8PZGZI0eZR4jzI2h
         ciHlZO/K5nPOOdEU8D06PKmAyNziIJkVtiNRG3d2i28KgKakxrfMy77o91F1QgPDbVts
         kqhg==
X-Gm-Message-State: AOJu0Ywk4p5+N9IAi9rMhcG/mk/tiTiXxgaLSpEMwVeqXphJ3IGgiC2z
	8dKWTLHLU0JYFB/JPgfqI1AzwFJ9gRpiap1xjpzTijQXN7sbECe+u6JX9bN6Q5D5wKtf4zZPv+5
	2asCVJuGfMD78j554EwkyLJyES8y/Nh8gNM/JUC2nNNbr07ydXt9BmDTdy3131DSshJkg
X-Gm-Gg: ASbGnctnvdh/UPRqwVnlBvayWqzgEKNoAIYjVVR2S8CaLUjbxDKFn+LUuQelllmAEcb
	ddvVdD2kwb8nX78wgjkuY+98fBaDSB4cxK4PoGk+SGGLiCn0JrLVmNkSpRgPaYQTwjaQR0wM3tv
	NCWN7JMGL7WPpVI80BVkeK8qyLn3nNw/cGpbTh9yW0WsHGZs6Kol6Y1tGKJBZvwxfSyWZnPNYqN
	sJYVOe1Ehgas2TA6gZ21e09FysZKdCKZlmyaM105FfEZgTSdM2lO8ZnKyIpArVn+WG+Dy7PX1j/
	BWrAG8SJUPwQMHLHoCLbLZ0g8TMbe5MI/BxQ6ygtcpLMzGeb0wm3U8fIeBBboCTWDvmTZUrecmv
	FWLtW0DGgQ3BvPcs=
X-Received: by 2002:a05:6a20:938e:b0:252:525c:2c2c with SMTP id adf61e73a8af0-2e7c7500160mr1824693637.14.1758757112407;
        Wed, 24 Sep 2025 16:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG27SNNEo7XFBRYDt8iP2aB3NjvPMLv0tyORjPFSP5krdWqSm9v+h+GvSXA7/UKhqgsODYJaw==
X-Received: by 2002:a05:6a20:938e:b0:252:525c:2c2c with SMTP id adf61e73a8af0-2e7c7500160mr1824656637.14.1758757111696;
        Wed, 24 Sep 2025 16:38:31 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102c0709csm177056b3a.81.2025.09.24.16.38.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:38:31 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/3] Add Crypto support for Kaanapali SoC
Date: Wed, 24 Sep 2025 16:38:26 -0700
Message-Id: <20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPKA1GgC/x3MQQqDMBBA0avIrB1IImLtVYqLJI51KMYwI9Ii3
 t3Y5Vv8f4CSMCk8qwOEdlZeU4GtK4izT29CHovBGdea3nb4SRmj/PK2ouko2ObRhCk6KEEWmvj
 7n72G4uCVMIhPcb4Xi9eNBM7zAuTggIV1AAAA
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757110; l=817;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=h/M+YE7D6HI61MSGhGzdJ4IOvTB8zDpewv4W5jZaG58=;
 b=k+uJbL7n+ABJU0CdxxToAbgHkIkpiy7+s0NQex/HEk2EqUTeK0YRJRnpIER4U11Tu2BsNzTqf
 qPSJZ14jp0BBgwDp5BbSr3LVUgA5Xz6dsX3XYm3ER890/eeg0J7ndyY
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=EuPSrTcA c=1 sm=1 tr=0 ts=68d480f9 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=7VnHweOnuvEr4eq_jGUA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: eARAt_0HyEXiODOGryfWwhEh3DKEUJd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA5MCBTYWx0ZWRfX2klCQCBUOivF
 pReyVjLwtD6gRAiN0ovp6OF2faERz7rDj6Mdv/4OpmXvli4pEAssICoHJQBtSLdjjcgXHI58jIg
 0uKRxRc2ahz80KX9uVZhNWYpGoOkLrMeHQ3gid8/7agtLTRaLsw/vqFRpm6T0EZQu3TLpqHTNdE
 mdcyM56RbMNLjlFyx/k1vfzKREv5o+YyqRyBOfQXNsauT59x+cJcHCpIFwqvSw+662Dqqms+01I
 9vjBrtt7MMvPsoFHxUWDTnld908RW78p1hf2wIVG5aMEYzig7xHaCUNObJye0D1mRZen+HSxu6i
 PRjY3hxOUWLiDn1j8mDReOAf+DmrJIgF4kFhGIGObqeEwKVfMiJJKKVu+NWQCMNPj96PxKLbCQd
 m6KreFJv
X-Proofpoint-ORIG-GUID: eARAt_0HyEXiODOGryfWwhEh3DKEUJd2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220090

Add Crypto support for Qualcomm Kaanapali Platform including True Random
Number Generator and Qualcomm crypto engine.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Gaurav Kashyap (3):
      dt-bindings: crypto: qcom,prng: Document kaanapali RNG
      dt-bindings: crypto: qcom-qce: Document the kaanapli crypto engine
      crypto: qce: add support for QCE major version 6

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml  | 1 +
 drivers/crypto/qce/core.c                               | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-crypto-07eb1383bfc2

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


