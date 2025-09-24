Return-Path: <linux-arm-msm+bounces-74777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 91123B9CADB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A66D119C1CC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:44:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A9D729E0E7;
	Wed, 24 Sep 2025 23:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Podo1Hbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7ED9286418
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758757422; cv=none; b=FEx/I9Z7XF9YE5y4kSq6rtZRm4m3aL+xFMnywlR0e6wbu6kNLmR1Uk4E04zM220I5q+Ewe18Gssr+8JYG5HHp0V95C4dkvM73Yfr5vF+Wd+OkOKuHnMWtHVVlh8kQDXlSvgRtjtiOAk974+olA0WVMOcuka6NzV292npyKEqeww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758757422; c=relaxed/simple;
	bh=t7uBoD+cSRGeY0frmDJc3GrPO7PyWVRw817teW4B4Uc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=cfz7adGI72gDu0bNQMv4SUxw3a5aMkS7GbWx6Jo34TGgAmwB9M4vMMe75OkxUBtJUnPhnIvfgnoJdZVjaaqW6OVWw/WFwQBsc2OwOeLCOLiVDrQcnHRcg+i/wp1ugQkr57oeUMQW6wqFbuO0LMD62w/FIGyM40D0fnm7DPbARE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Podo1Hbm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58OCeVre023770
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=In5B4SFUWbiVbNw+6JD72Z
	+7pTL+H4loa1+DnN9jm0Y=; b=Podo1Hbmk0Kex/9AMxoAOFKVXDzwOQ9Kk1v+9p
	Gv485gNO7rbFiXXgFdnYdhZLwwpX9scrgmy9sLfhodG5/cOx8YL3h59JAOwHyr9v
	8I1cjCZMNAiPNBSRjc4P2zBEkIKIfAkzF7AgQPYJH8VX+ycoRqJoC823Z7wMyJTt
	PDg4jKTG4MsmEincYvTr66qhD9EZ0WLnLxUNfLTNizZ5iODmla422V4q1DQLJlbl
	w+pnvMgr3vsJxHe3KvKqrqSPjYJB3ps4qZLTXoLudHEaZEW6RBI/BZGg2RJncUvT
	B2q8+quNi62hkjWoM1HMrMCAnrp69665SA4oMCF99ltYQDog==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0d3ps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:43:39 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-76e2ea9366aso300967b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:43:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758757418; x=1759362218;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=In5B4SFUWbiVbNw+6JD72Z+7pTL+H4loa1+DnN9jm0Y=;
        b=Is5afEMDw1KW6pmt+Qaip3Hsggczs9hQ6GesaCOI4W/v53niJeADv3OtOnHrt6ttHL
         qhXIxRrwP6x3S3cSS9l6w9exx/rAU/HanlvCXSln7YBA6XnQ623efb7VU+TDQAkLukMu
         y/sCEZ3buS6GEbwCYIGWvxei/sW2lfE0mFAV/LGBsM+CjG1YWzLtN1jB7sXUhIhvzwRv
         EmJsq5CiskCWWU8ArZqjcM/PJTQLVqs9oUASzHRReTYOsVvusRGu4zkOOUO/Zo4iDrj9
         904JyHE8wT8pVRSKoIOIeY4BRL/l38In9J2OQL1qc6r0t7yhQ2k7KfIsADkNOnyMFwL5
         Bf7g==
X-Forwarded-Encrypted: i=1; AJvYcCWN6UZNLTWKWutb8ZWBo+mEpqF99Tbq57mtfCX/WdX8AY/BEnM+qWHb79LuQFMADMXpgLqTHvopl7pgltPz@vger.kernel.org
X-Gm-Message-State: AOJu0YxTY6iGIxOYSSdMyrh1qJAH6nNwLbEe+uvDw53OTVUufDEztEQ7
	O+jAqSuHPhY6htMRgt63iCG3+WNdYClbRFuCREJ4+3B27DMRTX+h+sf3zvbk2V1Td4icsdSTGLp
	xRUe6x2UHc/NVu8SIuEhtclRKsobwARz5Olnl2c/1wzhS2FNNL7xDrqzF6SI6NetpSMdrHGXR4q
	IfR3c=
X-Gm-Gg: ASbGncsCk9tla/fN6Xj/MlWkw4CjLlbvbpImYLi5Ypd6GYl0yCN9eCGiNOFzS6KtSWu
	utPZcWRjc78tw5Id10Id9DC10gzrh+QVAy5P/I0DJZBYziaNGpUFTGo+IMgcs5SV3oU/2OcongV
	QAkzL9FF0Q8v1CZt6KKm8Eeh3BRqssMMR9SwwWvxMoJ2psbEUqbZGPREtsmHBQKcvhV811Uajik
	kDsINY/2MCSLzp62lRuaQt4+ZPo9zSuSmpXlqqdjcG3ih7LgG4PUEvtBANrs4QmQY2wNHmidcpN
	2Y5v7JPddDm2sc0WJa944vplCszug+6K2t8e5ohjJFhhmD+gaqFtbZ0YrqxpDVFwl+hpg6kdIb+
	RkWtV48ZpZanB0pk=
X-Received: by 2002:a05:6a00:170d:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-780fce1f6edmr1769872b3a.9.1758757418205;
        Wed, 24 Sep 2025 16:43:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDlOrNCje4Yf6Bti8pW+x17hT253jff+SFz9WfQJSBDEqdRLA+UARXeByWoA+aLojWJr5O1Q==
X-Received: by 2002:a05:6a00:170d:b0:77f:2140:9685 with SMTP id d2e1a72fcca58-780fce1f6edmr1769847b3a.9.1758757417745;
        Wed, 24 Sep 2025 16:43:37 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78102b64599sm192088b3a.70.2025.09.24.16.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:43:37 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: leds: Add bindings for Kaanapali PMIC
 peripherals
Date: Wed, 24 Sep 2025 16:43:32 -0700
Message-Id: <20250924-knp-pmic-peri-v1-0-47413f8ddbf2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACSC1GgC/x3MQQqDQAxA0atI1g2MI1brVUoXY0w1FMchKaUg3
 t20y7f4fwdjFTYYqh2UP2KyZUd9qYCWlGdGmdwQQ2zDLTb4ygXLKoTFQ+Rw7aiPHbVNDd4U5ad
 8/7/7wz0mYxw1ZVp+lzXZmxWO4wRd7X2weAAAAA==
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Fenglin Wu <quic_fenglinw@quicinc.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758757416; l=653;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=t7uBoD+cSRGeY0frmDJc3GrPO7PyWVRw817teW4B4Uc=;
 b=VQhNc+8yRnhOFDbwK6RZoyv2w/g1+PdrKQffBcjCCY+Crg3fyOgSPav9opyPXX6Srem+8r6DS
 PKd+UiruCN8C4iS2nf+4Tc/RovOGdSPPK6/k3QePF4PR1n2P7Ja74zS
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d4822b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=w1v-58I_rqdrY5_ohRUA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: 5oHPXT_CuwB3i-mqPkZrSQm22c6xI_VP
X-Proofpoint-ORIG-GUID: 5oHPXT_CuwB3i-mqPkZrSQm22c6xI_VP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXwo/6llU6s50R
 +gz3S4h51Ztr0Y82njNqi1l/cY0L3NMwVtzeDUTWxDw4ZJjeZfShDyincTSR32MlE1X5/c6Wdt7
 4oePhtQivGmmiLr2onGzdnc4ysBRCZ4dRZ1zBcPI7UVAz/GdifNp3baSh/01tqzqyZUpQgo0erE
 EcAnFjCS4PCP6Mml5eFUKCXAoTinONt/Q4ngH63z3r2xaA+8bfernoM37JKBq0tZsIVZjDQuO9r
 G7fLl/Pli44SgS3PWul4mTeYP4/s2o3p0Tran5PHwWBqeeciPGFttBUDtGnCpLq/m9+UuqmpWDo
 HhWrGs6GSZxVsk8Ac+9/kWa6wwZWI0oHYA06H2r1g2n7FmL3sxTke3H8GXUbtKxpi2dNgbjvRDN
 gmPPSLCo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

Add bindings for flash led and PWM devices present on Kaanapali PMICs.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jishnu Prakash (2):
      dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible

 Documentation/devicetree/bindings/leds/leds-qcom-lpg.yaml       | 1 +
 Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250923-knp-pmic-peri-e067c827c531

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


