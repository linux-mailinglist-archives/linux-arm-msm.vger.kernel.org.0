Return-Path: <linux-arm-msm+bounces-86688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB66CDF85A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 12:05:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 655213000B66
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Dec 2025 11:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DCC2777E0;
	Sat, 27 Dec 2025 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QqLo8btF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OiX+ZQJh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343F5225A35
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766833526; cv=none; b=QPBtRI0YKBtvMDBUE+N/zZ4KtF6xyisXgGCa/X+kondJNkJOf7rBPZ5/OJ6yLvkrVseI6R5/J2o6oTtP8GPcCotNsXfAh6haqT8GE5fI9aMKdgQdxNeZfvq2tWn2Oeo8u4pFH905Xm82ZnWHE6AGJYpZMJvaJJEj+iWrMVdBWno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766833526; c=relaxed/simple;
	bh=D+Za4rALfTUqTsiNInx0TahyFmiPEc3D4DRCUn9Cbis=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KyC/s6Cwla51RqcPS4BmNnasCKO6mv9hJ6p0JyQCsVVXFumJs1OR+joobR3sKvnQsC6/3RVNH1hdsBdMbFj7toqCSPs+jBWpzJ9ujtz7kX5L2RRcER41yzzEgakMyJQMRMhwSZFwkZYykhtJz5JdOEVBW6JNK3geKxLaiCSHgVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QqLo8btF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OiX+ZQJh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR3lleB2896964
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H
	1QPu4VJM=; b=QqLo8btFJES1VeobRb7iTMJ4TDKtiKcctcNAAG13OSOj28SJRn7
	gBcW0J1/V4mDE8iiD6CJamsZgQ463b/cfgFb1G4d/4Izju2FzojMMm+Q7HE5+zSh
	0gWJH44gHi4Kv0Bu6rpf4uc7vnuxtlmBVfQzwN/PRJgaFkAQOnA5n+E+zl7hmkhl
	4oilrkGoHTqUQi7TaHqjXwTroXN/P4x6jRjCstqZEnUG8TFyxSFwZxMw8upOePKc
	Z74H4raH+m6jOUPcGEq4Jm+iNqmpR7+9wj7SiObkf06e7Q0yHQxN6OVDw9Y5d93f
	PuHpXjEDsKliTHyYSQ/b4PzFEonQuU6sHpQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7p1rf69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 11:05:17 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee04f4c632so151373101cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 27 Dec 2025 03:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766833516; x=1767438316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
        b=OiX+ZQJh4GnLyQewOv/UcCU3dcNyUvxj60fTgV767qwdr1L6Gt4o0iebZaprPgHplX
         P+c9FgBmkTzseZggp/0U01NdzqWY2tmOQc+MIdT4QjdVSWz1ioDe6oh45PEfs7VhlX9N
         yfAP2EksxaDXYVnvRzPMPc2DkzGCe7PSln0ucUvlKhBEhjzG5oxRRuOtCgvRrIyG6Ncz
         b8YMeoFY4SIhzVE9YIcswL2Syq6eHtuqWgMjrKXnSJ5D01Vpc/34J9bIxepRB2f+HWfb
         IeZnOiBhBoLbVIb25chxluxohex6XM++Ti1d96q9pq+u/HKZMhOIpGik0P//0NFJbFSb
         iMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766833516; x=1767438316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shVIZvPiGtuHUHHlZ/YorSQjKPwWM/wy48H1QPu4VJM=;
        b=XMwcoxecOWg8UHRr2ridwZ6XJUzt16bnpMq6/PcK9FVv5wN54Lq1NcC7Gjgbq3e80E
         9aDmJAAvYqbwrUX3l/i4A9yKCA6X7Myr09evQa2fcyU/M+AFKnGaGIG7X5Q2yOEHmN/t
         YLZLFik7nr2WcWsT6B//xfQSJw9fmWowmQ86h+GfTRCRsi+KdwZSpgZJ/QquotleIwJM
         AOzEOM9hbBfQUrQ8zAozuBBR5ZSqRe6KkH++ZlutSkbFk0fDkHkF2e4Q9cDBvZdCRdFY
         tr/izNuHCPZLH73pY8EAQA2/rMChhsOJX8KNkTgyoclgX08crit2I7bybVtUUs45XLjj
         L0Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWc6UXwWl/rch6zoCPrGNNjDfL1eErfGUGlwcCFQ8Y42MwNTuxdCP2Orjek5nVF+2nGlxoqs94ujnZYCh0w@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi+x5yEekaVAe3XuyF8FyTJsCyBaGJPc9Jm+1YG00bnOYlNrZd
	LOQDH6YP+QOBEEv/6J2agdlkUiYfkVVOX5Y7upp8b7ZSOYoXT0oAjFwXcs6SOGTb8nBn1mI1nPy
	bqDPo15j2XEp+jeyF6svPE0Kt9oKPBDnsq5gxdSgnLCq49vmEZFCJTcPWqgrHUrNn9cJk
X-Gm-Gg: AY/fxX5FwXPl2rBAJEs81GLSW6pAsq3MRKfOgjEnQ2v/f5p7BZ97sjMDaVlvgs9kvLP
	/5mr83Wo2k3YkwURSsgRf0BQPi1E+GderVU0hm/FUk89S2yY1jQBDOs1S9vmeqsMYYGj5psMaO9
	r2gsCxC6VTxsnA/IGkkFlp1NY+2wu/iHlHX04eg78v3RKmgd1E357dU01llbSbhEu4CdpkVx95b
	nmioEK4sTqBGR3tDQlFLiVXM2FbLtM+Vd5URpP723fcP9qZhHkZ3JAYIbBmJkoxX+Qkw8r/rnZj
	nutU4KFMQf3di3cRnzLXCDNN+BATToeSL70IVb7BoFdJOfuz5gg6IlGZMXGNFV7fKtws0WNxNvv
	PtVK/gNxNp1uWdMyjH+iZkMZD
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id d75a77b69052e-4f4abd75343mr340171311cf.45.1766833516307;
        Sat, 27 Dec 2025 03:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF0TYgsGvrtMGtuU6/RL/Z/IVORpXU+8dilniFAv/6fmEz4NBxqef+dKiYVk4jnwyH692w09w==
X-Received: by 2002:a05:622a:5e16:b0:4f1:dc5b:44ab with SMTP id d75a77b69052e-4f4abd75343mr340170951cf.45.1766833515845;
        Sat, 27 Dec 2025 03:05:15 -0800 (PST)
Received: from quoll ([178.197.218.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830f3sm49080283f8f.22.2025.12.27.03.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 03:05:15 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and reg-names for Adreno 610.0 and alike
Date: Sat, 27 Dec 2025 12:05:05 +0100
Message-ID: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=D+Za4rALfTUqTsiNInx0TahyFmiPEc3D4DRCUn9Cbis=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpT71hjLcG0oDux9ARg4VrdAiDoAASVRNvFJ7xO
 KRTKDG4zVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaU+9YQAKCRDBN2bmhouD
 1+tQD/97pNqpk80f0BR+P+9aIcU0dXbS2l7pXSy1m5iLY36I9799J7z7O2+Dkc+ANvhNhvDHcrj
 9+taufqhVH616rKPRV8y+wKhoYqLEYNMy6UA7jcVpyPaSqHE7ge87zpGlqro7DjynV7BFOkfxKX
 kBrhz5M/Wb/gL01PgK4e9reY0Y8ag65gSDBdGSrDnsSVSrIPvnZYo60DiKWITN2fCq5J0rwXocE
 ZBQpU6+XdfC++IhaBOdBFgyRQHTDsI05mMOh/JJ1VwMxEgNKuqe2Ed618wTb7dDI5o62UbJ0nrK
 8Os4ZhH80z0OVPMEidaOFdQxfLOfpZgrMXRwJ6TrqLZh7ubbMmXeFfmdxmJIv8Y6+dSIcMuMw8x
 ktgtNLoVes5a6yWHwNK/uPgcl4j5DICQWxiHN4biqpKTE5ApjpZTXUihu+kkYVUD26XCeM9W7Mj
 G/uUw7ZgfDfBUt3SeBzHVHaDONICHrN2Jx7tjoKxdvASi7u7P470OvFyW9F9zzWWyz9v23928Qa
 5WVk64QQhwobL906S+iAgZXsMWk7xYEumnGjmAFqsWtSp1ehcUrJ+GqG06oQpVJdx0W4zxWsqsP
 37CQVs2eXzhuiAuOdROasUwpQymMLE+OOG2IbyPzdoWgqoQm+jNaj1qXblUKrwfk8tbiRNSlGCi 2gaaCOofZXFUwng==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C2oSp3NOJS19XcAu4GLn-95UnFPT73xc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwMiBTYWx0ZWRfX1Xj4Ex9Ifux2
 D6ucpVBYNce6jlvjB3f3W1HeYmokInA6NgV9J74cmPzz2We8X1cYomMoRGPmAMrZ9IE1xcrWozU
 TkXR1Xy7GACaohyOrU+V4aEiAtTI/mLSeNX/j2C5JrrtN0Bq+2AAcw8W2RzmX19pcK15eA80rPN
 xq4pMF7rIuEwQWgFXVewzFhyAntq/MrJWzvwTDiOAEgf/BSULeZ7mSf63kiLZnLQCaneEvEi9Na
 bnqPo0F5ZZTrBDvgPXyW2nm6/L3Ys3hNNc1hsgQSDh7RJLM4WISBTCoVzwnwooPzNV71pUjqoZH
 /oUgmBX8OMCgtj3+EdZ2i7a3Q7KsK/TXMWb6RzWUMYuqkdMZcJEHp8LmTGHAlncWkbi662YTkiF
 8CPzVulI0On8lwKVbqa7LtOVqYbhHd97iCj1wOuDBgRlp1q9roud1ilvDP88MvTBmQVzNaBhIgp
 DUltt/mWu13kjQ4PzFQ==
X-Proofpoint-GUID: C2oSp3NOJS19XcAu4GLn-95UnFPT73xc
X-Authority-Analysis: v=2.4 cv=PKMCOPqC c=1 sm=1 tr=0 ts=694fbd6d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hmARNUlj3OVxZ3RlbIsQyw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HA3oLdluH4EBEQOtP_YA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270102

DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only one
"reg" entry, not two, and the binding defines the second entry in
"reg-names" differently than top-level part, so just simplify it and
narrow to only one entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index 826aafdcc20b..1ae5faf2c867 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -378,11 +378,12 @@ allOf:
             - const: xo
               description: GPUCC clocksource clock
 
+        reg:
+          maxItems: 1
+
         reg-names:
-          minItems: 1
           items:
             - const: kgsl_3d0_reg_memory
-            - const: cx_dbgc
 
       required:
         - clocks
-- 
2.51.0


