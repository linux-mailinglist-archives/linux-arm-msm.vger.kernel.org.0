Return-Path: <linux-arm-msm+bounces-51727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA0BA674F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 14:25:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18A073BDDC9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 13:22:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A49D20E03E;
	Tue, 18 Mar 2025 13:22:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aFInx84s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5E920E026
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742304133; cv=none; b=neVwbn11Lmi2HNAcCMTJ4Uuo+XquTPEu6oT7cDmMyjIsGRsBO6Qj1AJwwAqpeCm7xsOQEhXaeCN7BZGmL7HTY2fScdATMN9a6jP7qR4F3Unnr41KN3pHsMwtgENct4tKWZGC351LNTLkE9YQJyvvezdwUHdk/pUGwRkT0hc2t+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742304133; c=relaxed/simple;
	bh=tLjVCeidA4XxC4ytznLkRf3RhpABAtXsV1uxmWtljSw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X77v2ybamDcS31RpVEO9vfXXBVf3QUH7smPgVuNKeFmr0in9k/JXrRaLL0cmSd5Xcm1dPiSMfjdY4mRo+AyNZV/DS4k8zfwxZBCpfr+MtD2PJT0dI7qOcIeQg9/SODI35JKWooacKgrxHNhuYYRhs1vP//aM1cidBp+dBMHmIew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aFInx84s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I9KWGw025504
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	35TBaT2+83Cg64d1PZlPRf7THWnfYz9oGJDXX9UMi2U=; b=aFInx84sQ8RRn8rX
	+ebrdMyeQtsOLzwuTjX0ks8vlW3s+vxGHb90WdnsqD3N07FmkHk9PLBfdw/0IiEH
	XBi3E9HYqs+hNndU9Jb9LR8rRgY3Wb36SAyRhjOMa0zYt9k7sIfGwazM/541imZL
	+h3fGB83LUrRRNLUSuo7eHkoBjJqgbGSrr/JQOs63l9o4XLUDguPhxgbDcOKGsCQ
	ocZRBTABb4AdK1kjPCIqH4Pl1JUbXkjSjMf4MZD16nYWHD8YYlrcb98F5XETw0j2
	JF4JEcbywHZRhnE++nuXGk4/IK9VKDAKV1U66Eguzqp7AVQV0Ah8iF0z8WY57FD4
	aqim+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1tx8avy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 13:22:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6eb2480028cso4638416d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Mar 2025 06:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742304129; x=1742908929;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=35TBaT2+83Cg64d1PZlPRf7THWnfYz9oGJDXX9UMi2U=;
        b=JwLG2o6CNT5nLhqRHYlVQl0Hsh1XM2T2426u3ix0YO6yLekxl7muaDxynValPMfJX+
         /Xi1cqHjBJKWI6ZVUmvgPYbpsBQ0Av7hta8lJ6ZFfJICXu0ox8cAmoTKIhm4gDZq16Bl
         GOe7JVoOEV7BGuKasb3x+hHDHtVCYfiDBtqfi1iS8rkZYsKZVpUbPWV8khfJq+p+PSJM
         /0+0hBONSOiQQm1C4E33k0LaY2gnPx8UvRqynx2MRIJ+RKBNTkxh98mIxb7WFnT4YElf
         mEzOFiFAASgvT5KlYxCUwUG6ruObEmNKYq5Mw+MbcvNTbbqgIFo+HSEoyoaoTWHRmVaD
         yExQ==
X-Gm-Message-State: AOJu0YwlDq3ye7kOu2L1c1Wo68SL7N8OUJTFk51H+N2vcscj+nFRBB1r
	YJ4WVZkwiERIRltUG838BHZtO9JGGlY88ExwY71AGKrfZOBtUdWCtz38AzJK8DWnb8FrIFeE093
	whO5oeSd2bo9waGXUZCA0xykWgJOu8LJUDJb0Hq/PJtOrsJgRT5e8lpUIx/tyGJPV
X-Gm-Gg: ASbGncuY9eennLAAvZcMtKMO4uV1d9Jyrzv/FiSbWGUwHLmernohr7OYDud4AwUyyIj
	L0QmUDDipZ2PmG4egdooo/O/8FaCkSV7KknOO02Oc9I/3fcoibYYdi0JNoZKJ4e4b3Bzz0mIXCs
	HHiSqm6Ae8718T08yiOCM4iXMrbjYEFx6aueHfdYg4HrLrSVQT3xU1Vk/vv3zK5qkCSLgvH9PUQ
	nXsDIfz0aikTYNyamYgGf7um1Q5UBBJVzUOP08pFSJ7Jdw9RwoeDKAJxor2I2b9xCeNmhMxfrRr
	9wuV3bRJFsvrZsRnGxmJ5Ebs1LlRpQXVorTDq7W6ft8hatV+RjdKOMkGW8cD5CEXhvO2CjoptI4
	5XMqpsa0X2lCaJ95jjgOK3vipwZN5
X-Received: by 2002:a05:6214:e6d:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6eaeaa8e068mr235421946d6.27.1742304129526;
        Tue, 18 Mar 2025 06:22:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEid2bgsa5C6EGyKhom1hcOzDqdCNsgC6lqLPAGPrirEYmAM0zizkPcxE56W3DH8hIcoDwtMQ==
X-Received: by 2002:a05:6214:e6d:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6eaeaa8e068mr235421536d6.27.1742304129179;
        Tue, 18 Mar 2025 06:22:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a79c4sm1664831e87.226.2025.03.18.06.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 06:22:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 15:21:58 +0200
Subject: [PATCH v2 05/10] dt-bindings: mfd: syscon: add
 qcom,apq8064-mmss-sfpb
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com>
References: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
In-Reply-To: <20250318-fix-nexus-4-v2-0-bcedd1406790@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=tLjVCeidA4XxC4ytznLkRf3RhpABAtXsV1uxmWtljSw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn2XN19yjeAE/FrJ460aVoGzoua8M7KKbdxkvWW
 fkAut7kGcGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ9lzdQAKCRCLPIo+Aiko
 1XkSCACU5gFpR9GRidct5OYxUCvwTTBl0VvkrjXfm5OyvOGome0NlRe7kBR4WWFfsG3BbUej+0u
 YfikvKIAqKMeHbRXXm9lBNvHZAV47bNHobS3PLJ2gOB9yBgYrLBUOFYNh4Mr8U/JK+3LaQMfSpk
 U83YvM/skgqyHhikgZ1kgXhwoiWiyN3ZeWviiP+MfTkU+JyUNQjkvR5HXmmI7TU2DqgYnCdj/QO
 qvrPliGG++ZGYITm7rxp/0k6V0PVtGXtonhIROkIM+LsYdZp2tpTqlZTfPd/t8oL5PjjQOTQW7/
 9cYvA32EgCddLLgZJ3FGfMNC+hxG3N1Mi/s+01T/BaKQ6Cqc
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=W/I4VQWk c=1 sm=1 tr=0 ts=67d97382 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=Gjla_oY5Z_Fy-GYXBTcA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Da6jBT0xgkh_TDeZ_rf_AGspaPhVVsML
X-Proofpoint-ORIG-GUID: Da6jBT0xgkh_TDeZ_rf_AGspaPhVVsML
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_06,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 adultscore=0 spamscore=0 mlxlogscore=901 mlxscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180099

Add compat string for Qualcomm MultiMedia SubSystem System FPB.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0d2530bd05b8c114232926e3ba8b0fed99e276f9..60f153cb57d56b00813cf65070fc4636141c5b52 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -95,6 +95,7 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
@@ -196,6 +197,7 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
+          - qcom,apq8064-mmss-sfpb
           - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos

-- 
2.39.5


