Return-Path: <linux-arm-msm+bounces-89075-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E38D214CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2E5CB305499E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:18:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CDD361DB0;
	Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TPfO69Dq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nqa+QD3K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4462D3570B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425486; cv=none; b=ci8sGF6sCp9GimpQHh2i9CfVhJ+qbC+eUtOS8NJ+az+1xRnxjUq3vmr3NAtacjkBVbHUWBYJIxTfSOV9yTtslj6xKS2BkBxeap86WU+D3QRQD+S7gUCgORztTKwrwczEpPJPdTPCo/ekdPhavJnSizHIkcu86CvfWjF5774UZQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425486; c=relaxed/simple;
	bh=mfWDFTtI7sOSzZDA/cYKPw2CbD6I6AAINmqyN12imAk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iYVy11WFEusM1RDjOxbgo/pLoGzbuqgk6VyhcSVRiUX6JFAgjS6BOSFXwffrKNRxUZw1Qw0C+xdc56+dL+C3g/yRjd6rsIrv5d1VRU+7Dx0fU+JzCpLxy4i/gGd5J/HccDIhdhQWfG1Q1SOl944MTCMqC6Gfa34YXshooVVxUxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TPfO69Dq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nqa+QD3K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIDdHU3460026
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DI6DC3zMUoG
	5LSvyEo1omeMMHH9suCgrXGLM485X7gU=; b=TPfO69DqhWTcqTOK1KxBJD+egA+
	35/rOpjLdhNu4WQGzdGmxdzam8n0qElOzv3rO7b2+HeaviGT+h8xVK0jjwsumBp1
	FDkTIeiO+t+D75JOZyvIih8wtNqT6/wcmCf1pabLFsv62aNZ3Rq9elwI3WE7OeWx
	dksGvRsKnNaElCbDumPwCsDPUiR+gclbLQFgV1uEpDCBZt6sLjuqmBfHSUs17+/W
	CQeKXFslrhSqXUf8pNwecwIlWB55mEbRx9BReWyKTjACe8oc+9q3/1W8kmtIZ4Oc
	RbTt35W9RDPL+ohwEXj019ga+m+PVRFN0nQqO/KM3TBf/4900OYkF9sIJpQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg848gdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-12339e20a86so258610c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425484; x=1769030284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DI6DC3zMUoG5LSvyEo1omeMMHH9suCgrXGLM485X7gU=;
        b=Nqa+QD3KOziy3fs+zWq8W7308+xBjmZehgQKxTeFDZscvkkdhYt5Q4WQ6JKVHeHmhI
         TqGwAVSCGZENsTFhDwY8YQU+epoUHOpJSQrqDW2jRjIqltjRc8xx+OCHo1aIGb4LSrmH
         p4Lg0EvV+uD/DeXS2gDMYnAa2IXrjlmMoMCwZ4qqpBk4QKv/KvfC+mrdQaoA8s3WrDWT
         XMUBZkpS2m0EgGt8dx7Utm5ExaqH71806PS1ggzizo4/5x/mlzuBrQDR0QhfbQ4pdhf7
         rMDh/iHB8JvepvbsMz6ecmeYXsQT7tDlCWCXznhl6n1kFDAvPxUPFKXSpbnjEwy7q/4z
         jjug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425484; x=1769030284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DI6DC3zMUoG5LSvyEo1omeMMHH9suCgrXGLM485X7gU=;
        b=oQspTirLW2WGxyCvSJyTZpNu7OKRL+GtjoIfF8Ab8nAzrNuJa08jzYbCYjzIFFtNUo
         3QRF+Gk/TeYl/LhGQx5HZ1AZHarTb2FZcZdo3NwRan/gFEWUJC4tvklVj8oV9BUtEm7S
         Xc1ArUrAmjwixbReTvGaaCFHnBze6uLYMdvLGw0IWEQwyuFWow5/pB4UgZ6R80T8SGXK
         dzQzvkUE38bmRJyicB1VQvgTAYeSI92jaXkAWEJCkzIBVAv2OjepaxeQXjYA2KT915wg
         fr+Tcxgw7UvFrooZQQO4+yMzd6r96tRGy0cK+MLeQJlVuIRYPh/5c9CUdufIXzuwNhaT
         bOaA==
X-Gm-Message-State: AOJu0YzfEHgHLhyF/NybO6tUyuVlxiTA5zc+yS96iFmkrPF5Bowxbwb+
	42eLElPhGo4IZjcUdluv3CVG1+qAp7Vkw8n0cFG+OLNK1P7kEL0BwWPJX/4m8l5VeK/2UalljHk
	rxrOLWEo51PLKBgnqZn76O2MBIeI9YJlLXXr99eBm8fnEipPO9VQet2EV9e9+SvOKZfZJ
X-Gm-Gg: AY/fxX6o3YM8YqqjtGrdXp8qmurV7P8xcog1Vae9t9kUeukHndPuSPVPS9b1/By0Wqr
	jPUPMiu9PYxfQi+UZwA/GIm9HhGfNVZ/N0ofWqjhICNB4M+n9X8y1BoG1tT482UJbg4yu2yHOMk
	nPmcNbKq+TjH+rHB/Jx2D9+x/zdrx4IKlKlYxeBPeuiBkEx2JPNcyV0DXnd3ut0USteY+icJJMx
	360R3ErqTgQ1o+DVaHh6Uc+mSst2WqrKcDtkfQEWz5v77N58hKr/0RbeGewVgTyDssF8EOnyEAW
	qBGXaO3aJHaVrzqZgDsEURNk2p/VxK29OtMeIIGBpHFEj8Uy4N2ogaRNdJngoyr5/CtfbL+TXmS
	ZYDdMiK3nHynizriASg4YGL5oL0frKll8U1D+SVNvBn0Z5IOw21M8SqOSZ+pNXVOQovzJVQhu
X-Received: by 2002:a05:7022:3b0d:b0:123:2d38:928d with SMTP id a92af1059eb24-12336a7c179mr4753099c88.36.1768425483782;
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
X-Received: by 2002:a05:7022:3b0d:b0:123:2d38:928d with SMTP id a92af1059eb24-12336a7c179mr4753079c88.36.1768425483104;
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:02 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 2/4] dt-bindings: soc: qcom: qcom,pmic-glink: Add Kaanapali and Glymur compatibles
Date: Wed, 14 Jan 2026 13:17:57 -0800
Message-Id: <20260114211759.2740309-3-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX6x0f5kUt0qbQ
 aaJj6T/2u0hqjp2oRc6BsxHm46rvCLR/4l/2v08U7APUf4ZJhtQf10ccMXaRGHj4KLPuq+npVKI
 uWe8qjIwfs2Na6TZlsahJgSdoa2i9pN54D6DIZkM8nQ8/miNBT1ZqLHZK+k1Tx8fjox17NR42DX
 IkMQpniTFDm9W8VskgMJ5HqSx+SMYN3mfotwFVcF5mT2zJcucwQey+ByOCkPWe+cnjdiZW8iyPV
 tHjS9wGoZtstuSPoUzAougsSPgBusfxt1dwoomslk3xMmercziHusEDCFrwprP0ImPuqo1GJJi/
 fF+5qhDsrsIqXZQX8T8+PQY7xXJ9/iW6Hkw9BK9SieNUkJekqh0M5OaBbdlIUsnlr/xn+Fwd9sV
 9qFLNofPkFvzPIj+lUCs82UAMQMRTfEV5xhWyhZxIX2feGLjl2b4iqE4cUeNL3xO3oWY+GxA26Q
 xIeACBte2HXQIjNh5Qg==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968080c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3V0dzxXrMXP2z2Vy7boA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: 2zqSmCugsXP-_lljk0823EmWhXJRIbpH
X-Proofpoint-ORIG-GUID: 2zqSmCugsXP-_lljk0823EmWhXJRIbpH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140174

Document the Kaanpali compatible string to have fallback on SM8550.
Document the Glymur compatible string to have fallback on X1E80100.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml       | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 012c5661115d..13503ae79a8d 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -38,12 +38,18 @@ properties:
           - const: qcom,pmic-glink
       - items:
           - enum:
+              - qcom,kaanapali-pmic-glink
               - qcom,milos-pmic-glink
               - qcom,sm8650-pmic-glink
               - qcom,sm8750-pmic-glink
               - qcom,x1e80100-pmic-glink
           - const: qcom,sm8550-pmic-glink
           - const: qcom,pmic-glink
+      - items:
+          - enum:
+              - qcom,glymur-pmic-glink
+          - const: qcom,x1e80100-pmic-glink
+          - const: qcom,pmic-glink
 
   '#address-cells':
     const: 1
-- 
2.34.1


