Return-Path: <linux-arm-msm+bounces-88398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C066AD0F612
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 16:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 84B5430464F9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 11 Jan 2026 15:52:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9FA34BA3B;
	Sun, 11 Jan 2026 15:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZmIYPdUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NZ8y6r4d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 594BE346AE3
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768146770; cv=none; b=UPSNkpZiZLqHYqrXqqBHDC2tLhFcmAzj2HjXpARXBrqITubwvK11G+ZTdRrjN1MiK/gpY2lMMcIeDJropI3E2Qyj4lS9aoAmMm4xsoc3xAJeybx5MV2PiVg4AiHZuTJc81cQaf5OmbgfNQmxXunoR3c0MZHrnZybThrAf82c3H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768146770; c=relaxed/simple;
	bh=8l+oE5/ydcmL36vqKsACJnrox1h/uViSmRXsmGplOjc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YHlCf1AbPxw61Mej36ZAK7n2QIWSw9286swrfIsLOlG9w/gkl3+YX1n/isvPyhy8tk2/ey1adrqF1tAm2Z9iY46XkuHd8opZsgdHnCxx0Q99sc/w5ck67MxK4wCJQMis/4RuxXquq1JDdhocaUdWcEj5FPdB3NcO6aQM973d/pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZmIYPdUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NZ8y6r4d; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60B9c3Yk2597035
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2
	hob/H1bY=; b=ZmIYPdUYe2/tTsG/rsinNKs3d5AraeT/tzZEUYvng9ivDXZfnPd
	0Dal5y1jM/yADyW9HNkrMBhzDO81KGnTV1NMPWJsYNYrct2UgyWbNIzcqWy/8H4V
	4N5epCNHeqZ3tYDALs4ScGlsbrexj9mPEQpVFk1XDkRe4LUBstYG1qr/+EAIeeyg
	vmNp3O6DWR948K2bGipO+Pt+dwpF3V6P4Pc5J1BEXvih4Z+UZYifSkGY0KHCfpdi
	yBv6k3qG2X3tYnva3dCkyedMAk9HoCxcqWpmnnEtG6sZtHUwLtwfTQkFD9KPVv2K
	L548MeJN6DsaSfXNMYghW1TKdjshPuQbaQw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bkebu2efw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 15:52:48 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-81f2481ab87so1052201b3a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Jan 2026 07:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768146767; x=1768751567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2hob/H1bY=;
        b=NZ8y6r4d5QbydAfNSfQU7bMhrUXE7O8n3kyLtfC/unzhLuIPCiD0TZkzQuww+qLr5R
         yClTxF9szy3IuiP7pgjbjt3fOf3JmUSmBkFOU29gsRVonZxhdnASbIkSRnSVLV0JFPiL
         M/AUxbuxf+2b/ozgYoioadcvQWA4JUvtm36NJbMkdHlqh7V3k+wkzZZ/RhejHxvjJWbT
         xJMBF6OeArVti1cBF+ksBad7XXzXG4cau+j2q/94QcbvqtiIDsqi6XH+WfyrMJNqPeQA
         VDhHl0fu5s4d0pnTviH7dPImBoScD6O5QV6/MEH3sYMr8A1vOANBXmo4ZhIQAl0Tccf1
         oi9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768146767; x=1768751567;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l2pDAmt+vZJ8y/1vGLOD/L9ZJDYKF5uRkJ2hob/H1bY=;
        b=YhY2qahcmd01F3ftLVYEhfec5iBj8h3pxx+H1nb91MlpNyqI4MX+jhqtclsgYrnucZ
         Rxa2nG2b6dkOY2Fx4btbfxbILDN2dRu8u7mXpjEcan7ig7BS3KPiqyqfJ+SsEKiQtKQ+
         OMXezQnAtXR7HkZjWaY3QL6+y/L/pnGJ7Yj9GeK0SHB/8A+/kujnb78EzXqtGM0wpfz6
         097PK7ilDQ6Fy0GYujOSjzJg7RzqyY5a7F4rnMmc5CX9D6jRo7ypSKBQCDLH3ZdTt1LT
         dggrJgSAV7h6FH4HNWXzOo3y/IFRP2bB83pn/XAHqaacIq4OJ9nsXzbv24yeSLqr1Wal
         HVLQ==
X-Gm-Message-State: AOJu0YzkuhSfFZFVJdodUd4oVb9KOLKLD9r1SI93L7RLdde89R19L6F1
	0BaIobJFqTBZQhJIediJJrnuhGCJBjo9GFxaz8xmymgPaShAnA/08rU5Jplr4xEH5kG8Av63g3V
	0LlF48Zyd0iAn6/BwmIOuDqs1/YObk0L9ByM0E6DPqc2X+r/f1hDN09SMLtugaFe0ufxA
X-Gm-Gg: AY/fxX7c5hLisSJB8UZZIGGgQUMXCMra7XdPwgBAC1b/oE34Br7u9HMuW/7bQGrhVKi
	TolWqoKwi2UJauB6S55Cy6+c+ogXpwvh9W0o9LrXyrIDXSjHWf0VyB2A0zUC8FE6qLasSI2Xv4Q
	g6iJogLqVMgM3sK2CSNWtuYk3Nr1DO558zOvymh8a4ca107i0/jVqxqZ1uXUCl2xdyUp7mx9LfG
	UETI4DYDm8YPxeF3SfXpQifuG/6NdNcwS6S1Jeq4fKxtMe6fRMsA/Jb7A8a9QIt1QMY5ILk/jvJ
	6zLIpM/LAi6U5BOZu2u8sDl7iEYA6RCLKeXzqANGExCQOalHlL7J8yS4fHVYatUAXyUN0lrqr69
	6SwW17okQSh40CJd+iC6Qz7gBqgod2bSd2EtubJDmpkCUMNjlZZAdU8NFQJ3GJnSAA06t47a28W
	E6fPzdsMb5MsQxhP1QIJZ7KASNS+m/kQ==
X-Received: by 2002:a05:6300:210d:b0:384:d0fc:f518 with SMTP id adf61e73a8af0-3898fa174aemr14449378637.79.1768146767358;
        Sun, 11 Jan 2026 07:52:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxPuuDAYDdmjGEASuvCN1GVxCQSLBpt8L2f0b6eOml2ugb6D2LyZDOnn16Ta/XhQo/7fJhjA==
X-Received: by 2002:a05:6300:210d:b0:384:d0fc:f518 with SMTP id adf61e73a8af0-3898fa174aemr14449360637.79.1768146766853;
        Sun, 11 Jan 2026 07:52:46 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cbfc2f6d3sm15188241a12.9.2026.01.11.07.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 07:52:46 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        rajendra.nayak@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Glymur watchdog
Date: Sun, 11 Jan 2026 21:22:34 +0530
Message-Id: <20260111155234.5829-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768146754; l=790; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=8l+oE5/ydcmL36vqKsACJnrox1h/uViSmRXsmGplOjc=; b=hiOGL4coSK0fhqmbF62bkwvEPEtn3I7vPgcqdzePfY0EQENtfuO7pCelH74ctkfRxH5AOaeDV K9YNMMot8iyCFv7NCRkaW6UZTyphJFRYxVP9zU8kzwXcDtcH9Mw0v0i
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MqNpEM8BHoEVMN8X8agHSn6vfthRHHNE
X-Proofpoint-ORIG-GUID: MqNpEM8BHoEVMN8X8agHSn6vfthRHHNE
X-Authority-Analysis: v=2.4 cv=LeYxKzfi c=1 sm=1 tr=0 ts=6963c750 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=FN4xVkFXDHB5uStvxEgA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTExMDE0NyBTYWx0ZWRfX0PlOD92dEn/L
 excEGGfS6uoiU0ReZj9kxZMfNK1Czi3gPpul4GYaccL9mp94uzUM2Z/eBO7z3aqvDfM2MjPY6xC
 e3st1doGW/J0Xya/JnHyeIyTzjY3NkDyt2SbBg8WQbHW7xXIrAJf3wfA153TzVe0QDWa/Lrye83
 8TcRjRHpgbOaaRG4Fpa+1xnuqgjBrE2EM94+IUzYT0mDwAXiTUgUq8Gn/LpyxXV8Mt5HbF1HlXt
 e6fL/SL/vyhU9cRx+QKWIrrtio/taNttRv2+KVJ7NCBnin39i/nZtS7eWd7WHiLVdrTFAt8OoK7
 kMDmNKZl6tblOVfve3U8wIHM0uT9eAZJjYMr8Yiut6THNsuRAvdw/j9mQu9Xr+iBtlydNzamlZs
 +X+7VAxfQddHQT2KDyf5OnorAyzXTNd1bVzY4yR8p7yNuq7PK5n9TJVPHqU32Ao6L3VMmBJhlEC
 3/mcOJrFWQYRQ/zmpGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-11_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601110147

Add devicetree binding for watchdog present on Qualcomm's Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 54f5311ed016..f5eb648e2801 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -17,6 +17,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - qcom,apss-wdt-glymur
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
               - qcom,apss-wdt-ipq5332
-- 
2.34.1


