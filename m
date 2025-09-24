Return-Path: <linux-arm-msm+bounces-74728-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A034B9C873
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 01:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E42473AB353
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Sep 2025 23:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E764F284B37;
	Wed, 24 Sep 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGj2TUpa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F404281355
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758756269; cv=none; b=t2LaaVIr7EjeZP6tJDEhgkHKA7Ap8aTlFxZ8UU0kIhMMrE2dYIzw6to2zKaFZi77OYLHOt3l7MND0DZWfZHnhOzgk23I4txjemEbIKGLs5ys6Jh8nFJGEgK3Kykjo/7OYUOnx4GVvu4DxBi+ytJcaoTXv++IaQkCWTQQ0Utk+WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758756269; c=relaxed/simple;
	bh=mTfVTgvSGDQYS4dMJifAjU/6hmANPLDQIL/o0pGn4sU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gYow5xLOmbFMDHsknXFJ7iSBPMPsFednfWFSv4U2ZZPeJkDj9uMEsiox08xa8lWJdnu4lyi13NbA86QQjK3RlLnR64B/f77WK21NP4kK5CnYF50K9xXh3VtkVVjce54R0jNGcKqhGNbIQlq6AP+eXwLDQ2rLBBle1H7or5Gpt6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EGj2TUpa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ODFGKx019923
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KZNciS4xoZfftnPqYXRVX1
	EdzFS/TnwpUdZGiTkk/xo=; b=EGj2TUpaVGpZ5tAQWyrIQHlWmzqhr8hTR3EeAH
	3Odz2mmt+PPa0ETeRJHsSIy6R6Uvv6thRgcaGYChQv/1ueZi7AnAeqnWfc3T9PWh
	jO2A29JEQEgMl/etWTwNqvRh8HFEdAyS9HAWp4HxofVK8BX+qMwxXOkyYAsB1oOV
	qEeOoglBrbBjLlTjGDUny/jKYFo0TATGJO/ocML0dYcYfB8X51HGVPH/1BeeM9oV
	5rYxix3D+eIbaA0Wv2KqWwaNnq7N7vCryoXubzyuPsxKoDIhDxMoxa09AJkGT7RQ
	TQnnH+Sw2z2MvDp+49BPjJEc0aQ5FNy4kVDHIj2uQ1HQS8Rg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bjpdy85g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 23:24:27 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f3998c607so549441b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Sep 2025 16:24:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758756267; x=1759361067;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KZNciS4xoZfftnPqYXRVX1EdzFS/TnwpUdZGiTkk/xo=;
        b=MxByzofmtv9bJwV+EZi3Il4FJV+hruyQ+bHeVhZZlK0itpcbKCCyi6elPKppcIDVnZ
         gola+Jy0JY4GEFhAtx9yOLqB3f/O53acRfstd3S27eSxPKBGfgQlty2BFw9RuTFSb1zY
         k/KDCe9ExkT6Mp9QhnWMzItfJc7T4w4j88hAiRxDNHRloPp+oY2PRNcBiKQeLj4QPirD
         o3GGdnpgKVtTCdNUxlS73ebVrwgv9rYVRWYOYK7oSFgyMAQdHSjwMzkbCyUYVe61VXKo
         nvAKPZCtlZBopCniwu/ZvENECP46/WALu9NP3rYpC3AuGyAx4UWnS/uASVe6ltya46B5
         GOuA==
X-Gm-Message-State: AOJu0YwQZ/+/WqfoRhYzPBT8gbYln7rLRi2CFqTgmgAe5SLjrXdwdVar
	5CVjsc9qfc0gYV1QeXjuRWklnc8pjRTFSB/Rr0d4IGE21B6ol0ZXbgOtIVKwaf74gwZTssUk1N8
	2nM/i+Q2uz3J0mCF/Etcj9GZpQ7wjPDo4ICpi1YnPxFbteSHAeUDUS7whqeEdG8PL3Quj
X-Gm-Gg: ASbGncsZ5sYg4TqIrNqu+RV/Irdhm7lxjGGkaYem9D8mWh3iStXSn0S7Y7qKv6kXCaF
	QK2d1u5M8M2ZhUCUEggWCjuchXoisEd4P6m9aUomXPNg7S1XMPKHUDoM9pu2qsUBOmP0aLMANuM
	REDZfRUm698TQvTSVXDFNHm45KjrMMni48Ke1n7D+pCB9+kbxd8fj3RtEZ69zj3/BBaqsUWmXLM
	Kpp/PuBkwnGzSblYf9f5amj+RBgnKNZHia1QivWcFt0mCry2ZOIttDH3Sb3M5tcH7efPL6j+kDx
	VLiG7BGRNuQ1zxay5KGs75dIv28UG4z64hZte2KemlxpUWL1goI6VtDVlGMo3YQmkExPYQPHV3A
	GDvNIZa9AShpormM=
X-Received: by 2002:a05:6a00:4f89:b0:77e:cac4:446e with SMTP id d2e1a72fcca58-780fcf0c79bmr1746149b3a.31.1758756266777;
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8pZDBqMmBGUYCq5JA6tZWwAcXM/OTJCyVhBNbzZ8u7884rMNBKHjRuMnFGdMkg5lXMtDJQQ==
X-Received: by 2002:a05:6a00:4f89:b0:77e:cac4:446e with SMTP id d2e1a72fcca58-780fcf0c79bmr1746129b3a.31.1758756266349;
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810238ca6dsm194173b3a.8.2025.09.24.16.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 16:24:26 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 16:24:22 -0700
Subject: [PATCH] dt-bindings: watchdog: Document Qualcomm Kaanapali
 watchdog
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250924-knp-watchdog-v1-1-fd8f3fa0ae7e@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKV91GgC/x3MwQrCMAyA4VcZORtYi1Lmq4iHrEvWIHYjGSqMv
 bvV43f4/x2cTdnh2u1g/FLXpTaEUwe5UJ0ZdWqG2MdLP4SEj7rim7ZcpmXGQc5RSJLkkKAlq7H
 o57+73ZtHcsbRqObymzzJNzY4ji8O+rzIdwAAAA==
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758756265; l=1025;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=mTfVTgvSGDQYS4dMJifAjU/6hmANPLDQIL/o0pGn4sU=;
 b=vh2YAAt0+hRveOEVepPOWT2IBEK3RQNJ2Hj16CUoLVIIbLSbTX1JqcSp1y8XZUqj4oKCif9+g
 jF3FskmXJ/2D0SgUkwxFnVNQ0Pooa28J/IXvvBuVuS6WIJ3ijbC9S2h
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: rzMhIO1Z4vs2j6DiwIvE9qOGyst0koSY
X-Authority-Analysis: v=2.4 cv=Pc//hjhd c=1 sm=1 tr=0 ts=68d47dab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=eTIQKQMR0C5kcNTfsesA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: rzMhIO1Z4vs2j6DiwIvE9qOGyst0koSY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDAyMCBTYWx0ZWRfX4Ddpe674R9QU
 q2KUi9xDNlCLrF5vOAywrRh43kfBhnWjosrDQ6u7BphZ+KFLGB50QexlZlI0MUunCAEQCuzeRuR
 mWMwvyB4H62RqpUs1whB+PUeoZLTrQDrVLU9Fsyf1EqLkEV6i7MUhGTaG7BQG7gi2VF25o7y9Xu
 8j03uTZ6ZCfF3vL81CFANjY+FXUFOqm6eEyBGrNir2NPZcHOetGyYd+03UshMWCa7l2XfROM21F
 uJKclnTVOU9SPW1Kokzugaat6IOo1HTNYPVSv7A9vChCJz1qHoX97WPxJLksjXrIsQQvO7EYnx7
 qc8V9vlemptfH4Mb+0Ah0r7LDC+3Xbmr4G6weoaJwtTO9pdZyFfsRYk7Eq7IGEV9UWvVnVwTn85
 ir3qruTz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230020

Add devicetree binding for watchdog present on Qualcomm Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 49e2b807db0b..54f5311ed016 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -22,6 +22,7 @@ properties:
               - qcom,apss-wdt-ipq5332
               - qcom,apss-wdt-ipq5424
               - qcom,apss-wdt-ipq9574
+              - qcom,apss-wdt-kaanapali
               - qcom,apss-wdt-msm8226
               - qcom,apss-wdt-msm8974
               - qcom,apss-wdt-msm8994

---
base-commit: ae2d20002576d2893ecaff25db3d7ef9190ac0b6
change-id: 20250917-knp-watchdog-9f42faf7fc17

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


