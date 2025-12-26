Return-Path: <linux-arm-msm+bounces-86662-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B6421CDEE75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 19:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 543AE30145BB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 18:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 046B126B2DA;
	Fri, 26 Dec 2025 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b1Ltf00D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTcRbMMw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669AC274FE9
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766773827; cv=none; b=litL0GsnvgPFmHgvAjbHgL76KtIIoKB1dFg549gzLPVD/kop2BN+x/gWzoykE/SD4uBBZTxGLY7eAN6dZ6KD2tjMAdR8RX0K5WR03ak3w4+mHRnoiE1mECUO2/FCrK+iqzOZ+ZbzlpZ6dptGh1Qb6/Ju0bFX1J+ShDJbhKN5HoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766773827; c=relaxed/simple;
	bh=5dTgJd08Hj+VK9BytzXaVkvC+Zi8xcPYy36Mus4jT/0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hlh/va+obIvLX97wnzwUBfCsU0x4lny/akzUQlxW4OY33jX9HKf6mnpS8+ydrzq4nHqC8gAl7+kYOQLq+qkKFAd0LU0f2ub9YHg+WfI3W4/eI4ItX1ikoF3B4yFeHgoao21qEtQX8HBM/Dslo309w5KohjN8671XE2iBjfepA0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b1Ltf00D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTcRbMMw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BQEfobS1333520
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=; b=b1Ltf00DQDObPEQ0
	Q9M/2o+wTDuEwwnD58nUYRULQ7+WSl+Xgm0MjHxaJowksqHI8ObIFOAkDcSj3nkB
	iWlCOmDaTVYwM36mmANN7r8heDOIZ9oCwDqRuHnUgAVq80nFAnUo6yfWT6mvg22D
	QWR/h+dOhVd2sakD/VZxrhpHYwACyc8M1FhK2ckhpFwlzRp5eEY0elC3tmP0GrYy
	z7JoqPI0gRVZJX9eV5NbVedZ6y1R6z0XE0EalBSTa4R2amy9VVih8/QzGYzanVId
	79Eppc3uA0pJTBsJQOpp+wANE8BfGIt29D7+SqwearUF3xy7PFmf3vSjREd46blF
	gMRO5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b9j1d9pbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 18:30:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-34c93f0849dso7445942a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Dec 2025 10:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766773824; x=1767378624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=;
        b=iTcRbMMwxay47hxhm3vwWK0bOS552iDF7q1/I3IbRjGCoi7EgTE8FRiDTP7xK73NjQ
         hYJJ4mBakC4NctISL8bgpuG+8hevpPdHMYsGPrQya8mx9Rua7jqBsBYfGstLmhbjU93Z
         iwUxeztY/OaSbWoJfgV1NfM812qI98I8RqciTZui7UWem5ddTcrWgsxebf8ZNmhEgdHV
         vJ/9nOcRhh8dOGbOwuSfI4jjtOd4s4lBZ9d7LOZjzzvMmde0HTWbwgbCI3E2q2YZFe+W
         kXGyIwqh4RJ/8tG6FZ5Omv9k5VqVZbFF7NLrFd3VFc9vezzPWPgbSyncuCBPA0cbB3Kd
         aLDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766773824; x=1767378624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RgAmFhI7swuPIf8WPcGiUXJ7Xp4sUyKMt3c/cd48bxE=;
        b=PPGm2zyWS7YGktyXyzAtS+zWP+cUAv39MN3vw1KALVWLiHpMiscV4yLu+/dmhFwDWg
         qRY7Cp8RkGU2G3/+1A993Qr24KLUXb4o6cijscsULZgVClERxs4tZ76a8cUsQwhLjwv1
         W5ACCkmkTHrJoAqg5ucjWTV/XrjKkc2czDWLRfw4ZA/l0cj9Lu4FyUgV5pKRZpAn92+S
         4Bb0huO0/yaQ/nhCHA5NFjTIZEZebTB6ni2FHlsDANVKZ8RSkin9nr1OtPKnQQ3ghQ3o
         pU+oDvf3WQoBqOZ0ueztAJ5HOL5+4UEwp4kL1IwcrhlmNiwWkU+N/lU54jFAgd/jfxU0
         ME9g==
X-Forwarded-Encrypted: i=1; AJvYcCVArOKUduViveIvyTeiMx/HjBW2vsaMsGMjhuyF4MLYj1Yhvwpn+P0446AwLmgagUzJpp0H8DuKHsY3ZNSG@vger.kernel.org
X-Gm-Message-State: AOJu0YxedoLhst/6p7zbfTdLSaWQYDsZdV/pGvY26GnAx6e8zkTZVzZ1
	qvxSm80YwJmQYOUUkVbOBkXGt2M5d9DzXt3vgRkmo9HepIYSqb+gPzWibrlJd8HClummN+eCVRr
	t78QZV8oS3prTzmhIGexJ5XGbwFEZOBJP7ItMojpVQhRQzXHhClQgFaWxJ9pvL0ewfBVh
X-Gm-Gg: AY/fxX4lU0Y9CLPjqW2IxUtUgvy7a/RISjf1lYqIjA56FDyMAz8dQWbz9gKyVs6V/Xs
	Tk8LKIjg2k51uWmlesZTiDQ4x70eaLBiMMUApICWWTSD5k4HSiQEsBaL0J+nLlUpAItzcqCUkOe
	NteHZSR+pJvsCqCBhDMd81sKqtnpEm0QHvjFYxvsd+szJBHu8h7kaMhEcDNKNXmwTDZ/Ql0UehL
	5vDYWQiRKhJDuzHyRAmn5x8rRJOcL7HICZI9togeyxF0Xt8Etl8kyFhXNnuBZE/48SNWiJy5cw7
	G70YVomckmME4YyXI6FCMXEw/Xemsak9pUo7dLM3ZoLYxT8UdBNGY1ARREYnkvqaUgNjlHtM7Bv
	kZgupwU/DQVAEI5CyXBMvypj5hUR8Ow8VYg==
X-Received: by 2002:a17:90b:2803:b0:34a:a16d:77c3 with SMTP id 98e67ed59e1d1-34e90d5d6d0mr21217650a91.2.1766773824286;
        Fri, 26 Dec 2025 10:30:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxqzDaOi7TeYzJ5Xh/GgEoe2tstfUdz928XPlxJaz216BBcTVVcEWqmIz4NI+E/Gqd0G21qg==
X-Received: by 2002:a17:90b:2803:b0:34a:a16d:77c3 with SMTP id 98e67ed59e1d1-34e90d5d6d0mr21217615a91.2.1766773823669;
        Fri, 26 Dec 2025 10:30:23 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70d65653sm23808883a91.5.2025.12.26.10.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 10:30:23 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 26 Dec 2025 23:59:36 +0530
Subject: [PATCH v5 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251226-qcs615-spin-2-v5-3-354d86460ccb@oss.qualcomm.com>
References: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
In-Reply-To: <20251226-qcs615-spin-2-v5-0-354d86460ccb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766773796; l=1791;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=5dTgJd08Hj+VK9BytzXaVkvC+Zi8xcPYy36Mus4jT/0=;
 b=HfCwIXMsyvhrdpkseOTWeZc12Xt7mv13lFpk9j5FJ8oClUtZqBtZfMzvQFwJH4TcllMLqqcNR
 fyKNK+gYp/7DxfktVguqA9aUIreiPEJK+WPd/uleFx2amCvM7MPUJko
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: G8L4YpVVmqJ73nAOU3D96GhVQ8yOg_Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI2MDE3MyBTYWx0ZWRfX7m8qBdu7EghQ
 mzzqZeRaJsHphhAvGQGu3Q1p9WSdoAavL0WzLRryAq0ob8qQSYmqZmPHb2Mw2B0GGO3wMV3JQrd
 ezioaNQWcUDTZ20CCEjK2GGQZPt1oyAWm7oDpQ/gqnYz6b2DIJzEnmExVEcKTIB2cdn7S4IH57P
 MTIm+c9kghBd5YTgQ6w03/MBMIYR/DCvBaMPezLwFWJWEyNDZLUOS42QLQCcpG9g4ZoxhmQRQZv
 8XqInE/dS3sWH0gy8LhiS9Wt+p2T10p0LdhexodnGWYZtHdYCQ2R28ggH4+FKg0SGshsaRs/AGt
 BXdEJAo6UFshGAKg8EayYbG3kjCWDd7n/lSKiLrxsD4cLAzkvtIphI+LW1XlfacAY1VQXdH4oEx
 CyTXmi3a4b6OpHZlYrQau1O59VPJaIIj4hnsZxfikUBExx9350fTXRbEu1dI6Sujb8YDpO36RUu
 gxBtr0wqB2ex34FXvrw==
X-Proofpoint-GUID: G8L4YpVVmqJ73nAOU3D96GhVQ8yOg_Oy
X-Authority-Analysis: v=2.4 cv=Z5zh3XRA c=1 sm=1 tr=0 ts=694ed441 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=SkoZtctDx9gcCqASqUMA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-26_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512260173

A612 GPU has a new IP called RGMU (Reduced Graphics Management Unit)
which replaces GMU. But it doesn't do clock or voltage scaling. So we
need the gpu core clock in the GPU node along with the power domain to
do clock and voltage scaling from the kernel. Update the bindings to
describe this GPU.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/gpu.yaml       | 33 ++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 5c12b5aacf8f3ff64ca2ef97fb0dd6c3a26a71bc..27ce88766dc5c074ee81b8d3e5d68c2c531ed2cc 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -45,11 +45,11 @@ properties:
           - const: amd,imageon
 
   clocks:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   clock-names:
-    minItems: 2
+    minItems: 1
     maxItems: 7
 
   reg:
@@ -388,6 +388,35 @@ allOf:
         - clocks
         - clock-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,adreno-612.0
+    then:
+      properties:
+        clocks:
+          items:
+            - description: GPU Core clock
+
+        clock-names:
+          items:
+            - const: core
+
+        reg:
+          minItems: 3
+          maxItems: 3
+
+        reg-names:
+          items:
+            - const: kgsl_3d0_reg_memory
+            - const: cx_mem
+            - const: cx_dbgc
+
+      required:
+        - clocks
+        - clock-names
+
   - if:
       properties:
         compatible:

-- 
2.51.0


