Return-Path: <linux-arm-msm+bounces-79374-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D350CC19171
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C96D585A64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44698328B7A;
	Wed, 29 Oct 2025 08:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPKoLdqb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qo5CILlv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0F328622
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726343; cv=none; b=LfHCJcMi0mUP8UVtlFIQrayhfR8vspQiBEvpIJCyipSpkEbl6gR0Rt9ua370XzBTAoy3iOiy2eunkzKO5dRU/RlJ91lxHJ8QfUqERR7A7cYuHsIoDkXEb5mgnv/wO2hyBTewV9HuZUyDCckX6yr6PF7y3OLZHmyUVlqT+1dSPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726343; c=relaxed/simple;
	bh=W4lOSMg903GYA1zxTDxFQF9gnP+6sHQAZV34jmuGdKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/TlhZs/tGrLjh3hrg4iVn4sHd2k785JcEr9o/YD+he1UvOr/abcR/Gd44Uyol96Yv/2AU8GJvmLay8f6a4VC7rvp/JIWFFzplO1JZN+Zi0J8Ga8FRinn64jANf7/e1xDZFuaiXPR6rVNYarFCvoZBeyLuG+IN/ZZQsMqdOlM4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPKoLdqb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qo5CILlv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vDLP3764691
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JK7SZJX+MikCqFjK/k66SySTPy7ACr2CTGcmwo3Ayjc=; b=lPKoLdqbDV+aWPRQ
	SgIfMylcGd99Cm+LcN6qZzqnGPiogq3AJ0UX+WebPKXB+jVr3bPbILf1lMDGn3Qs
	BafXexIsoFsLKd98SnrfAN23o+YKcXt2ug10jginxZHkiLaR+bymdt3wlzHGxC7k
	DPOF9ht7Qq7I9o5CcBEq/Ateuzg+s7G3Z2KsAWIaPdAAkqobstOdFxj4p4+Ff8mW
	g5sb9veM/xeKlei3iS0i29ydkLguAmuRPuJaoIaCQyF64+vxVA35hXoYnEoCvGhg
	gxj2Z+6rtrjOcBRdw74augF2ph9FJjiyqdtAeUeUI5bi+Txne4m2jRAkaPSgKmzh
	L83y6g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a11sf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:40 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7a28961ab86so3796507b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761726339; x=1762331139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JK7SZJX+MikCqFjK/k66SySTPy7ACr2CTGcmwo3Ayjc=;
        b=Qo5CILlvRlXMGzZKcKbCaigZbMwGepdAw0MWkcuNOUapjkzg+iR4hbApR5AP2fpID/
         vuxhqjjJGSOrOCHxHP2exU3VUcZz6aSEShj9gTDMSx5iz3S7rOyit33Klir5gi9Xw41v
         4oG+dveGasQoWvT9PtlmjTsYp+pnl53Fm0LZc6UzQk0Ia28k+NXtP+OG+DaGTIgJTQs0
         qFhvKKvNrMFPFV5utPJTyv/uk0iuZFlSQdqAFWMCj3RHesrMY+AkByv93mxjHdWCj2Xi
         fQBlqe6ra6ZBBX9JSMesK3TqyUX8Zs7w7aKx5MItIO7KHQUd9w9w6TMKijHU2YU8VBZ4
         oy9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726339; x=1762331139;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JK7SZJX+MikCqFjK/k66SySTPy7ACr2CTGcmwo3Ayjc=;
        b=QyptaRK0EmgaSMiV5qGx+YMb1ZKu06MQNAjn5gLuDXQdRRtX2tWgdxJeNIAerBv6rE
         03JlgRq8PRYWXIIWwU+3Vfj+qanoZUsWuODW85bB2qT3Y/xvXr+Yuv1GVNnNRdAT5r/q
         LPn2vH/KddH7bGp+AICLUPZ3NIY9B79Qb7z1fB1T0wU7CclbAMD74cr3feEI1UGgdSNh
         DXP9JhB+nbNAFfgAjar5+KlLoEORkhicK6T2wI1LkrMBqWAR8nUwVV+l45pNT6r8+fGP
         Ssco6PSaaNBHf3jI7RKi3ksiiz7CdTlTFO+uaGxUlDFfIIIQTpAQ7lY1oEZuKcpoZz8a
         T37Q==
X-Forwarded-Encrypted: i=1; AJvYcCUu0BDquS8GijagaN5H54/rEelN1/kw8n7td/H50wH9YWSKgnOCnwwTRoT4b2A8HuxObkbWiELbVzJF5f6d@vger.kernel.org
X-Gm-Message-State: AOJu0YzastloJXigLIAqHgrcj0NuzdTeTU39f5PSdDRIhRdnFAreqpuV
	P1qR96fJQmeI0R1G4yS+8122k7WDYFUKFTMBNLoGhpgSH/AfRy6txet+P/WYpOnJQUVDEjcOx0l
	MCtUztPGRQS/qhPtEvX/MFN8QLUseIxESweaUT4CX4tZIrUBgeqTpiKpbCA2B4joHVLpS
X-Gm-Gg: ASbGncs1uX+JxfK8E8/3XOJx6kg+7//PQWtV3AR4kiZPuK4XQThvR9IVqwriZnJUFiJ
	7WG3fxEb4GvguaLKirlTgEgzfhfvY163CbcDeNGj+gPDHCYSYJsXGtH/UHDJpvk1oHnjbSjfmvx
	N/HGOh0+orsQNEnEVlEB38MQQRvaBXyzuXqOMSisPkJKqtrcxmZpFY/zOVGP3/p20EtXPn9bSo+
	FO/GEXeIWSFaPg0WBM5ANDIrj0kB/7lHjj3to7R2WPFG3ayO1d5c9j5fnn/0u0Jjx+E5kapSd1k
	250DO9GmLO2m/t/N54wBV6m4JS5Tm60tdezU/rBm5syc3pgNJ6wnI/6nk+dPT/akjzxBCSv57QD
	weN19+P73G2inlRWD+8DQXxZORRg2hQvBf3dh2pfpFk6SVg1u1g==
X-Received: by 2002:aa7:9064:0:b0:7a2:8111:780a with SMTP id d2e1a72fcca58-7a4e2df8cbbmr2363262b3a.2.1761726339214;
        Wed, 29 Oct 2025 01:25:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECihEvvzOVIGmNK8hPCjT06tnNOOFSohNpSB5zChwhoVvZea0PYfRvBk669noNoCuIzhObKQ==
X-Received: by 2002:aa7:9064:0:b0:7a2:8111:780a with SMTP id d2e1a72fcca58-7a4e2df8cbbmr2363231b3a.2.1761726338692;
        Wed, 29 Oct 2025 01:25:38 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm14158850b3a.35.2025.10.29.01.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:25:38 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:25:30 -0700
Subject: [PATCH v2 2/3] dt-bindings: crypto: qcom-qce: Document the
 kaanapli crypto engine
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-crypto-v2-2-b109a22da4f7@oss.qualcomm.com>
References: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
In-Reply-To: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761726334; l=869;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=j9YVsWbXcS2a6HwO/+foiEbEjltuK+bIiq6tBsLubm8=;
 b=2HSGd1hA7of3GezzUr/8YAJJWPY3Tf/fyJngsluCXpx7q1JgTexKLVDv6j/j3oOcPS23To/8F
 7ezLZWgDuA3AEj6HljjgqMpGjAmGPojU8GXzoEHOs4v5JgTNmztkqEn
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: 7i4y5pwFLpaR-7w73-8PUZorgB0QH5Sn
X-Proofpoint-ORIG-GUID: 7i4y5pwFLpaR-7w73-8PUZorgB0QH5Sn
X-Authority-Analysis: v=2.4 cv=A5dh/qWG c=1 sm=1 tr=0 ts=6901cf84 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=UTvf6Pk5Os8-KCCN1KUA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MSBTYWx0ZWRfX6FTr8lpsS5cn
 ASgSzrM2mUOKGwzeKDb04eNConFc/wWt6N2d0U9EVIIAKWzn6E5jUR6aMlc6KNB82dF62MI/uJ9
 j9fLxH10C8pSaY4X7JSVQ4OKEka7Tc46mXZ+WxYa7ax7o+stmt0Wi77gPE+zjwQm6nY/7gfC1US
 Tb0quHW3+xYmbaYSLllWCDep0pl20y+bN3rt0w79W5qB5SywMqc5SOX+2dKoYjQUdjGcIOfoIc5
 dkxgnYUc80oeE0G4gSAie8dZaf7zTqdtQs1ekgDpZDQEpRZjvL+woXxRvTvVpr7+RzXznlmGXOi
 SHR7GQgyVHt3Zn+BD68iheqzwV9o4CUqk7FAq6LQYiUKFiOmJNJxrilHsr7XrUNPCf6A/Rbzj1n
 yGDKKfIYU8l4TxGxRPtfws25n5w3+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290061

From: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>

Document the crypto engine on the kaanapali platform.

Signed-off-by: Gaurav Kashyap <gaurav.kashyap@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index e009cb712fb8..79d5be2548bc 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -45,6 +45,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,kaanapali-qce
               - qcom,qcs615-qce
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce

-- 
2.25.1


