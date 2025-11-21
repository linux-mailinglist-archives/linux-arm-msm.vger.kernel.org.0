Return-Path: <linux-arm-msm+bounces-82792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A0FC78456
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 10:59:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0F7B03640FC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 09:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FDAD348465;
	Fri, 21 Nov 2025 09:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OnQaCOZ1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXCm+G9E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF12347FCD
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763718868; cv=none; b=p/45LH0IUQjdbboD+ivBhcfK1ZK4TDkUcSDOsCn6WLVSAR0TvYAEYnTiFe9UPmaTBWvuFlH5LyR/cIHKoo5ZyR1+6vDN+auKDWDecpiqCZz3CRYKHxwCcvjlCfv89jaPhN72YAa1Sje1BQZlPAGudDIVvm//lIO+R2tAyjdxTI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763718868; c=relaxed/simple;
	bh=hq+Z8fN/tsuYSre12aAN7aZ5BrbtKhYVA5wDBt9ueKA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n3ZKFrc4vAJRnEpvSNDMeOUxHjROJMoitcDqTlU1qT/qy8nWyJPh7hGSBBLF43Zo0ang+BJIhyvv1z0WMwMZxJqNO6bTqTeLRuwJU+Qef+2qbbn2eweqczKnrziJl2Fh38Uw7T0qNYRCR7aHiykZIDUmqTs+XZwWAeYiZRjQD0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OnQaCOZ1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXCm+G9E; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL9Vw2q3048209
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fpB3dmnEifRS3f73lgV38Ruqg9s59JiO4Mro732h8Eg=; b=OnQaCOZ1V1Gmb52+
	XRjh07mHgmF9jxJknl/JO0s/hoiiIm3P/tlcMxuZJLpiXZlI9YGVPmAAnZpbpdDi
	hlYznO7Su5noFPiZkhxDbjcD5rhzqEd2w6Iuj+1H5FW0gRVqJZw/Lhsko4CMzVG+
	9Guw7E3/l6GRbj5cQ0GdVysfWsjDvPvqZCqZGB8Oapt99vIXbpABd+e5tRm6+D0C
	xFYt+1Kpa5S919WfkNkQdVHpsvus9M2fXszdvQiZXORW0dEdDedFHX0afi0j/I5J
	kNUT02ZBB8HN1PO006KsDMj/1vbkw6FxDcAGTtbhZYlxetu+F9GeznUIFl8Nt02h
	P/b+bw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajnhjr2me-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 09:54:26 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297f3710070so49142845ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763718865; x=1764323665; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fpB3dmnEifRS3f73lgV38Ruqg9s59JiO4Mro732h8Eg=;
        b=jXCm+G9EYwLpDlf5PLxf722wkz+j/H0hTJbLwUBtiDTj0xUGkCLJnmEyYxEI5mE1cz
         IdxRU3A73Yb6ZK4D539SCYPgtkTI7iW53M4G6aAoZ1LvK43Uw+0Ay4gV3f2ArHWhUMmA
         Ku3YtCfkw5/bXJ+tqWXwtX2p+acTPtKXjgZOWInYUpDEePvYZ4yzk8gvjeqN1suNfkpk
         azXpFrWtUsAaZMx8k1R7594NfUFGL+mApA0wQuxWmu6lpDXHLV3HwzzRmtLd+zeJ4utc
         iEO56fOoqA4/r1S27MmdxG4w7ABnGevyucHajhtybpTb8lFWtqauMLcuB9RxkuDm2pm5
         apqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763718865; x=1764323665;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpB3dmnEifRS3f73lgV38Ruqg9s59JiO4Mro732h8Eg=;
        b=V6F+Ao+TzoYgn9OL4JgA6BiG8NExzYrRVTNZ4ReqOQnZiUnsSPRuARDMy374LXnE00
         PyKZOxODyaV1r51KrkDQi3ZFRh5X1vFjDdP1rd/zFJpi/AGPsCdT6jpCd9w34UfYlFc0
         agByvKHIEOCUayQVGoK9EmgMgAGLNVyfMLxUKgssrYtq2PDkV5qI1zE+cTGU60Suk5Mx
         R15C38YcPQX4eUyQR1aH5MWgkW1IIsh+n/pSH51gqTy6IDw9sVD5SPLhs0bYc+r0mxgQ
         3D5QCRC55YAYyY6RSIGlHNCN1HGiEzP/G8ii2gUQKm6tX7RMy7reEtXRwDuE0WVudVmc
         RAvA==
X-Gm-Message-State: AOJu0YyslQynwuGApbnwhIACDAHyAUoJOj2rbhDn/ql4sxZ0Q8er7hiC
	esYYZYTGSqGZWhDYagMtzFZ1d2/z6sRjyVDWm0AciE600OHNP429agtpkgnyeP2VEHx+hc8Jc+x
	lXpaj0fxoNGpkzNQaTpYR9ocLkSalHFkAoWvbHHK5ArNJfmML/wFBM49pxoJhs/bWdcuQ
X-Gm-Gg: ASbGncsTzKURvoutl3ACJLIEd+EUc6QD57zw1ntsYCpRVJz3UelkGoS7Xsik9aVywLG
	B1hPNsi6c4INpsCXGnUeeAYBL047WJQa+chPG6bDYZ2jrf9N/lbU7LeA+3fa09i08BIj582w1rq
	nc1yzUPRiG0EGRKcntxkTl4J8Yi/xF3jr53MMDmWWtAWfUSS3YW8UJIMYS2YFEmuYyi+VAsd6YK
	drkj9ETUCwODob2waub35YpK+0FAcgnzdtCu2BkAyh9IcN77KdjWa4h/5omeQY1w/rlDph5E0CG
	emXH7hv6+28Pg9Ln78yG4DDjv/Rlex5ZcEYv47emTKLrcve9NvX791Sp+wvqfE/BJkiD7mv6fPc
	QeO9FbtriWhYeyJfvoz/GUDAmLMSzJ+GV1QfVI2arzKcIJVqPRPp3lAMB7xB1gER7IfAvJxDWsH
	wIBpgcbrpGJCTlBIJXo4t0tWHS3/KFsA==
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr21790195ad.41.1763718865450;
        Fri, 21 Nov 2025 01:54:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/pR2+j6HSjjauAQKYZA2L6XYVEFw2YZuNfAxMalxMya5s7QdHduG10qJZdCIuInq5+JskWw==
X-Received: by 2002:a17:902:f706:b0:297:c889:ba37 with SMTP id d9443c01a7336-29b6c6a4a1fmr21790025ad.41.1763718864992;
        Fri, 21 Nov 2025 01:54:24 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm50557985ad.42.2025.11.21.01.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 01:54:24 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 15:23:52 +0530
Subject: [PATCH 1/4] dt-bindings: cache: qcom,llcc: Document Glymur LLCC
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-glymur_llcc_enablement-v1-1-336b851b8dcb@oss.qualcomm.com>
References: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
In-Reply-To: <20251121-glymur_llcc_enablement-v1-0-336b851b8dcb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763718858; l=2446;
 i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject:message-id;
 bh=hq+Z8fN/tsuYSre12aAN7aZ5BrbtKhYVA5wDBt9ueKA=;
 b=8yKUhcqT14Dlrcm0XIw7voIN2Rxw2ad/QmfWqSEAZcSHY2CSetR1Np7MTDJULTn2iPtd9P9PP
 zZPA1TN/z9tB5sikhz8lDU4szDt49mWvdCBLoI1wbFhcb584SydNEBZ
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519;
 pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
X-Proofpoint-ORIG-GUID: -lIkunPmp4yMwmZ6MqCrUGcrGWbbIksL
X-Authority-Analysis: v=2.4 cv=SPlPlevH c=1 sm=1 tr=0 ts=692036d2 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hk0jLN278c54h9aoXToA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA3NCBTYWx0ZWRfX6Yt82cV51/Bd
 Nn9aK3pjq0xe+dk50LZ69rHw/yHlUlMTBBJFftjWlXFHCTwzS4LwDECFkr1x86f2JsADIkn2n/S
 tiydSzoAt1Ry2JKKGuuJnfmgJ4b8jtI2aUJ5V1si9p70JEouE8SxqrmvtGAiks3GoWkEv1h1KkO
 wRdzhbpcBMgj+HelP9TCIUIP9GwH9aVMk/Mf+egABF5Sm+3yyOYcgVU3TAZ3gXLep//EddHFIuV
 OBzeljvvvmc/3hscLXGXDpILqDEL1gsITvgjOpniw+iOTG60P6VOX10/jDE9W+TsXOzy0YZozsU
 7oBVEUgXcuJnTpzwka4TcxJaNSRSvgl7NSW9Jv90m6+TqOBeeQmYG3MOxmmK+98mXha+8HSUd8q
 d3fKXWQa2a9+1iE6EvpTAGowXubn5w==
X-Proofpoint-GUID: -lIkunPmp4yMwmZ6MqCrUGcrGWbbIksL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210074

Document the Last Level Cache Controller on Glymur SoC

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 .../devicetree/bindings/cache/qcom,llcc.yaml       | 43 ++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index a620a2ff5c56..74a81baae0e7 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -20,6 +20,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,glymur-llcc
       - qcom,ipq5424-llcc
       - qcom,kaanapali-llcc
       - qcom,qcs615-llcc
@@ -84,6 +85,48 @@ allOf:
           items:
             - const: llcc0_base
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,glymur-llcc
+    then:
+      properties:
+        reg:
+          items:
+            - description: LLCC0 base register region
+            - description: LLCC1 base register region
+            - description: LLCC2 base register region
+            - description: LLCC3 base register region
+            - description: LLCC4 base register region
+            - description: LLCC5 base register region
+            - description: LLCC6 base register region
+            - description: LLCC7 base register region
+            - description: LLCC8 base register region
+            - description: LLCC9 base register region
+            - description: LLCC10 base register region
+            - description: LLCC11 base register region
+            - description: LLCC broadcast base register region
+            - description: LLCC broadcast AND register region
+        reg-names:
+          items:
+            - const: llcc0_base
+            - const: llcc1_base
+            - const: llcc2_base
+            - const: llcc3_base
+            - const: llcc4_base
+            - const: llcc5_base
+            - const: llcc6_base
+            - const: llcc7_base
+            - const: llcc7_base
+            - const: llcc8_base
+            - const: llcc9_base
+            - const: llcc10_base
+            - const: llcc11_base
+            - const: llcc_broadcast_base
+            - const: llcc_broadcast_and_base
+
   - if:
       properties:
         compatible:

-- 
2.34.1


