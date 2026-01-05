Return-Path: <linux-arm-msm+bounces-87424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B2BCF3AAB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 14:01:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AA19A30022D1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB4A14AD20;
	Mon,  5 Jan 2026 13:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jgN/S4ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bJCE73Go"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA3E155389
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 13:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767618071; cv=none; b=B+kD+cguYZBycQhHiPNDXiC8I2i5WnZ+JqQezh7B8Q4lz+PxzSqV02OQAEmN04MXEZaoh1wzl/DMehXRdvgbMUjqAzVlEr2z4U85fC/zwoGow2BUsgjS6/dA2R+FlMxIVYnRaZ4ZSDAlR1xV3UVB6/cKikqPVKRY0U8d+4i5GKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767618071; c=relaxed/simple;
	bh=KUBroAaK5Bbv1lT9S1pX111SQFa3T0jUHkbzK/G1qwc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EpI+JuR4nNYLF0z99jLo29eyutXOnPvi/S2RUioJgJwUqcTf+WZtuKrqVpxZ/rYfZrgLMVJGVTvoiZlGzdRSPQPuRkgXMyLe4rpJa4GyajYBKvNjPobc5S/6WfrXxdKutVYrg0tYOl/en4Dc+N90y9hixHOJqCfGfpjwfWF2Kek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jgN/S4ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bJCE73Go; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058w7Zd593907
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 13:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=s+mlhvXsNy8lSl0CNn/vK72nZZmq5z+IsRW
	niGzgAWk=; b=jgN/S4ubea5hgGolKXMsN6Vb7CrFa5/6Jhcl2CExJrdzo9oVeDg
	5gg5p+HRvCA6b59xdhVT2EHL5bAPnA/ysYLFD2zj4jDqTGsST4Jcos9wdFyTl935
	CSib28Rjr5OfK0bZiW662REIXNb6ZqMzZ3kmq5WWNsNehdC1CgPrQ+HEXtVT6huN
	UTXFLM+iSrqAXJY0+3zRwBCW1LtR1xsQjfiuz4QR2OEFvGakMUvmKszSHOHh+ujX
	Wq0FHE6EQ8JHRlx8vHWn8zmhakdh9VgWWKTT6iRQXELn2poPKUwKQYGbHydULEG5
	Ww7ALuRlTRFWgCD+L5hp5oStc1MkMF/9sIQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgku9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 13:01:07 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29f1f79d6afso197591185ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 05:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767618066; x=1768222866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+mlhvXsNy8lSl0CNn/vK72nZZmq5z+IsRWniGzgAWk=;
        b=bJCE73GoV2j7xbhyccKjIrft2kLtrxY4TreACHX2XX8XKgDNgfOlVKU6DawrsnH2i7
         xH9r2rWiO4OoAPXOqO288t0SL0k6/JQJd6LlshNpp42s/RlZj6dNItASRTrn/AdPFtwx
         kCo1ux95xA03Tvdgri9/hGT0Jx6OKDbBA3AMX1ZSLI2cbWIZGrKeqKkfJrjsaMNS2IOQ
         ljUkDG9ch4r2L7eWDQHCJ3LTj6w3A/7+omd+Hmn111JTI/ULSdRSZD2rFAoIIpQnXtcy
         FVGhZE2jXO0d5REpqsVVmK/7FK5UtyNgqjOvNeSK3TBo+ZBWSdmpk/4RxKwYze2LT2cb
         UU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767618066; x=1768222866;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+mlhvXsNy8lSl0CNn/vK72nZZmq5z+IsRWniGzgAWk=;
        b=asIPydIlgkhoJsy8+Tyo32ZajBu4FuT2EVHDvuGlbQ+Nq8F6Js/6ku9ONEt7s5lUCq
         x//+j/ssMg7iw+N16LdgLlsyeyKt9EbcpbEKn+co/8P5lcotH3IUfq2Zq3vbK4/uQowP
         OsG2gwSFMh6jETTM7zTLk85pFBkQXgNgG8vr8bSi/92p4M6iU4mQdpWWx+WQtnNwAfwL
         PptNC5gnf9RaOWlreCbGpX25JhM/aBwCpteG81A23DQ09xI4rIv1Tm31kTW2IoZ7XErX
         ioL3UTzUQ/gtFOhZJr1Kl78cAIthCX39M2VkoJj7LKPeAO7XvYfS5JRsraRwhhkMm1+r
         DU2w==
X-Gm-Message-State: AOJu0YzVuv4WhS6nxgmTUL7t4Do3F41OKj/06cltxb9bLyX6BCM/fOqN
	JDnWAplp+0o27fHQ/5dQB+Z3Lj2dQOt06DQhdkLlUFbQsog+Oibr2/FKIhSYubFdW5pwCigM8Yh
	0q8H9deplScqd2TtCRNJSkVuFg1W9T3vThQW9PEsNciJWvVxT7wIlFhI1NobTQK7QmnBWKkYIgU
	S6
X-Gm-Gg: AY/fxX6Les6G08NgX36tMqU2CF+mSGkxIAZLhKGMZvMw1qtQZVaLAqCMrXCxwyrS8GD
	p/IGsBYyF+h8VTJPjcP7xodeBMXRFNCBzMm0o6Ptyv3nZdx1ep+aw2FQR1QOtkXAyn/j9SEbAG2
	rEmqE2nHUwN5jrI2NUhg09hG/IosrHMxIrT9WHoMDnGa+fogTn0PcyxNAtYjdfDAZ4W101rJXKm
	0JnEqFPE449nUoIZBrUq3b/mKXR/Fhx9KAbnuXvE8fAjq9CL19rW58nSj6wTCgy0jR0v3c+xe4u
	zLhl20AOTwQTrQaJY/S/XiKZIql2GLU+2sFGtZ0LU2SUERonBZ5CHWr/2Gyc1C1TVEtwvmsMiW5
	8Uhv12buh221F6XxEVBe9+EaeblrZT9anjFAygfxEYbFllP5VCbV/fNhaf+ZLoJPQPovY4/w6m4
	9WThTGIBHzqBS1Y3GVJ0XCWC4n/J4KHg==
X-Received: by 2002:a05:6a21:99a2:b0:366:5c4a:c49c with SMTP id adf61e73a8af0-376a9acee7amr48531163637.41.1767618064761;
        Mon, 05 Jan 2026 05:01:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnXjdor+J0/E7p+z1lR4CgVKT0yRTOnaTzr5aEPMuazaxpRkxvohNumGCpG8Zc98gK8uhIHw==
X-Received: by 2002:a05:6a21:99a2:b0:366:5c4a:c49c with SMTP id adf61e73a8af0-376a9acee7amr48531016637.41.1767618062587;
        Mon, 05 Jan 2026 05:01:02 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c82bbesm458870665ad.35.2026.01.05.05.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:01:02 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, conor@kernel.org,
        jonathan.cameron@huawei.com, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur
Date: Mon,  5 Jan 2026 18:30:50 +0530
Message-Id: <20260105130050.1062903-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767618050; l=1079; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=KUBroAaK5Bbv1lT9S1pX111SQFa3T0jUHkbzK/G1qwc=; b=WA1LXBy6m/Y7E2WzbWD/VgzUWDDrbPjJpWW9iC6KFDWD8GBbC7oPLzyVrvm1/tsRAcKA8sG4S //TiA2lm1+hBHpmgBbqVuBKNGDEHdF8k4m8x8q95QeAyDipyITyc3xk
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExNCBTYWx0ZWRfX38Ae6r37Bh/M
 j7HGaW92PqpqvcfOQP37P9qbWPdfAsezZlcJOQSSEaUpoISXe6WL+mCIhnUPl/fzcf9rGUVaqYo
 ySY95aecWr39PxF7HvM8PCOXJF1w+37uJH5FqCSnJ1Fa9jRfVd8VoWRrTCXJ4XTEyYdamQ8/U9z
 xW4GGtHrDlFT33O81UbXA8RjwRq9Yua+QJaGWh806rhFUdpnaBNA0nBrtAgmWy8i2PjvTXG2kwi
 FnFKOWkQzhqm+P2kCauEIIhEY8+7FKuGG2XIA6IdHODh754qUu4zTJcuvyQKdfsVFcO/GeOW+gt
 ZwKbTKmj7jI8vC4uo4Qo3fCbNSUAJnoLWZxZla0q6DNIBfPR7ct6pb4kmyJjGttdYd80R6x3N8t
 obCeqI3ab5hKdN/qkgeWQ+xG9dQPjeG9OuVeB0SN3ZmoJcSbMHPbNWI+pH3874oqxdA0Xmj/sFe
 svkiHF2gyiuRS9gC5ow==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bb613 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=FZLDNw1aQlwFuODRWVkA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 9fwx1ZLBN58l1QDMR5cdJMhD4kIubexx
X-Proofpoint-GUID: 9fwx1ZLBN58l1QDMR5cdJMhD4kIubexx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050114

Drop redundant llcc7_base entry from Glymur LLCC reg-items

Fixes: bd0b8028ce5f ("dt-bindings: cache: qcom,llcc: Document Glymur LLCC block")
Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Changes in v2:
- Added Fixes tag
- Link to v1: https://lore.kernel.org/all/20260105122045.963277-1-pankaj.patil@oss.qualcomm.com/

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 4e99c405aea3..6671e461e34a 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -119,7 +119,6 @@ allOf:
             - const: llcc5_base
             - const: llcc6_base
             - const: llcc7_base
-            - const: llcc7_base
             - const: llcc8_base
             - const: llcc9_base
             - const: llcc10_base
-- 
2.34.1


