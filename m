Return-Path: <linux-arm-msm+bounces-79372-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD27C19168
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D037A1C87309
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F2E532861D;
	Wed, 29 Oct 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B736Mhe7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EohylcG6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453A131D377
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761726341; cv=none; b=QnTzKA+UAzwYYblNPRqJC/X3p/pymVmkIixjd1R7xPOB5d/3iWxJZ7q1EZzjNi3mvApGZLghBsRmNeN+lVwlwzwJbR2zRzPBpfSlcma0ljD/iBil6gI6fFzYmrjybC2Cbi/lVhCNxKSdLap6P8zH0AZ/P3A3B2rgI3povlaG12w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761726341; c=relaxed/simple;
	bh=oaGswpRr8TZuO8BqEDJi0dGYIU2tgB1owqLnPNSrMcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oNUxyPwx0zdNi6FSu39i8BteZs9ySwSkRSjRXXF1ZI+zn7UgtwhX7J6NITM39xZ0GT7BwIMGy/r6oDuEWqdqK4GM5TpkP8IcU8YrTDh2e37GfcCBZ16WWGMmSQJjhhio/TZmCZXIIcNgsveiwlLiQPfXPiB7Z8WtPZGVp33b3/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B736Mhe7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EohylcG6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4vKGt3643374
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/mjtL41D3+Je2IaYCzcV27
	gHgziKWyKCpwABs2uRZvE=; b=B736Mhe7hWTcwNbV2frTK75CrX8B1dEc8d3xtc
	mrqfuSWot/EXPp44rOO3z8qkueniKKHoACkI+MziYjgCobgOKhvzYx3Lit0lNJnD
	2822mY49OedG++AOgXu/RECpU24DC1CPFLsy9fKj3fbZlhv2suzaTbcDudDoTWS8
	RhG0818kKIjLpDXOQbdUXJUNs9BxhfrSTaMPCfyJSddGppQVQpWK5bmZb3JXhFoN
	gm0OBUfwCfTxwPRETJNsfG8v60oi8DVyRcisS8WlXYlWUgDcDwA3pPzXyNQwmy5B
	dFYAwC3WXKWJejTREOr21av6RepWcA1ArASuHjSpGYrN2I4A==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1hsw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:25:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-781253de15aso13600186b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761726336; x=1762331136; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/mjtL41D3+Je2IaYCzcV27gHgziKWyKCpwABs2uRZvE=;
        b=EohylcG6xP2e3YJHKM7iYYA9hxMG2Nxs4mKPbQgwJ0tMFjMP958QaK8iWmU+W7v3vy
         dCBRP0DMda0e2bkYm+LaoJs6e1/nWBsRf6nI0xV40Nyx3viQupvBLW+nVih+xlAe0O6z
         BIGCxOBAsfsCb2gQo1VuByW2IL3QKcMEatGgf/7f9vV13ouoKeW4R37AtzhxITYHVnBX
         soLu2Ijl+OqhyjZDQ/MnIWxXxAdct8IhSfWfoMxHol7GqF40TnzR12KTlYclDjxUNv75
         +tQx/5ryzt9oriXF9/HKeQlL/2gpLZF3ZlkxaWtABEMGsl2hoTp77gea1slnvl5zpMjT
         qj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761726336; x=1762331136;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/mjtL41D3+Je2IaYCzcV27gHgziKWyKCpwABs2uRZvE=;
        b=XmC20lbVtQzseF6TMQ+5ZACevzFV4mjWfnHZdK6GdAD/N7aDllpHDelCpWUhQq6Ed/
         KFlBZpk6cqqiS3yDuZSKHXHuJwnS8lgMopD6hrdHsGvVH3klYgh1ieBcLGE3QHXgSgN9
         xyNI4Inhg5hHUiien5KnyMSSQQyyiecQxl/m+jSvhslwJDFx4/VYV+0LR6a02+HkV5QC
         jr26StYyyNkMrtjvC8790tNKsDVNu2n3Jdfbpsv+Ez7upVwzxuoygnNK70e/YFd4JXVc
         XKPyDFl7+XA5vqzCwT6moW2q7i0ZBBcEriu71UoZj2D9JS7iAbIMJnPrDRmzUY736irh
         g9/g==
X-Forwarded-Encrypted: i=1; AJvYcCWMhkGmhmOUN04WXWTepzoIdRu96JcxcfAl008oAed49A4w89qkcUnncQggUtH31d6CUjo8haP5ZfOYAswx@vger.kernel.org
X-Gm-Message-State: AOJu0YwP9Y5iKWCPfBf1WAkVsg/txANuLWuUBGeCHGmp6xlnZbXxSKie
	9gawKiHE2iTeJ+1nwnLo6SDOjgf2V/v3rPvPxYl5sW+ZuyXnVp3CKHHuTT76S/wv97Kp3YM/0UR
	0UdFKdmiv+VCFNr0PkbBCBqkZeZPoQBzcJGW/tkCPuDBZt683/+VOPfZI85gB/bjG1EF7
X-Gm-Gg: ASbGncst5jW3nCJNpth0PgaMVPY3nrWlnm1MgnEv0e0fV51a2y8J94owfT6+qlkFWP0
	y6kVqMbdkk876rv/3DK6HUX6lRyYx0VpTALeo116w8taTHWjv5GlI9aRGS5wpqkUkdTTQBVaKLu
	NUZO2rrrQRW2APHrJM3UyBpgw9Siko/aNUhyDbV0T1QXPHl22S2YUp1Zlmhk7RID5RARCjfRgDq
	IpNfAZejl81EnaT+Zj3TglH5LTNpa1ykyZI+URWaEjaZ2q6d5VU06iC2IOpqgQjgjDy6i4f7sQZ
	++yNQ1ZzB38jK5X44yMVUnVW/DbPxjJBqAM0kGv2mj7eR7fAoZCyiBV9yvq+LFmUq3Fj/vqW0Xw
	4J5SyF8PFdyXBgvbj0hwX8JKxKuAISaoIgzhbmJgDLdw0+1qIgw==
X-Received: by 2002:a05:6a00:18a3:b0:7a2:7a93:f8c9 with SMTP id d2e1a72fcca58-7a4e50fe6e0mr2420598b3a.27.1761726336204;
        Wed, 29 Oct 2025 01:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdwu9I2TQE4JgtPGfiqtZCT47MqLwqdVwhg+Uadc9SFPOftHSOYAWImtgiupnpmZjF5bK2kQ==
X-Received: by 2002:a05:6a00:18a3:b0:7a2:7a93:f8c9 with SMTP id d2e1a72fcca58-7a4e50fe6e0mr2420568b3a.27.1761726335699;
        Wed, 29 Oct 2025 01:25:35 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm14158850b3a.35.2025.10.29.01.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:25:35 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add Crypto support for Kaanapali SoC
Date: Wed, 29 Oct 2025 01:25:28 -0700
Message-Id: <20251029-knp-crypto-v2-0-b109a22da4f7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHjPAWkC/02NQQ6CMBREr0L+2pL2FyR15T0Mi7Z8pFFbbJFIC
 He3sHIzyUtm3qyQKDpKcClWiDS75ILPgKcC7KD9nZjrMgNyrAVHxR5+ZDYu4xQYoURpulqdSUI
 ejJF69z1ktzaz0YmYidrbYVfkOe61waUpxOW4nMVePuxcYfVvnwXjrFK6F41GKUxzDSmV749+2
 vB6lTmg3bbtB5Tn69fCAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761726334; l=960;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=oaGswpRr8TZuO8BqEDJi0dGYIU2tgB1owqLnPNSrMcc=;
 b=X3lmcORf+EZ90MJ8+JpDraYpCGMhWn2vOWakg3T9ruTOHHwYTI9h+cC7lKL6ArP2wufZlUgS9
 NrlAeG49+3zBJ7l2D6B8XObJDwZx21qSnGF7mRKEE31R4hppXJnbTmJ
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901cf81 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=q5Rk1KLrLtMTd6biEZcA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: YKt0sA3Mv0js8H3KvEj65iyum2O88wnX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MSBTYWx0ZWRfX4PGEcIQMmSON
 qrgApA9hWLrcAhKPTszca4dkwdUlSEKUXsH0q4wSaCLHSuRmhGCXsI5rzQRUpgT0kO4xszVkCCs
 m7zxksIn0pa+mwvq3DEf0FZRwhegtZ70XlqksO9WXCcPJHgFSelg2ylDFMczv74yFUrDvImZ+6X
 rq4Z2QR6LTA2IompjKmkouPUR4xQAqBp+18wK/kqKQnuR+BSiZyVZPNupRLEya3Ev9DflScMMbT
 BuAERtLxMCgA7PeN2sCFf7vMCYklKZ6gxGsfFw31pQo53pvAty4j/3A1JlQPijlne8A17bRQVDb
 kfBmdxGbJpD5gzc5N5ctVbLQs7ayYQC5PQhLkh2s86KrPkuCZxA75+jqxElzy/A6zTnNamq33zU
 qxf+1n3rgKSoI7rnYa174vHqzhurjA==
X-Proofpoint-GUID: YKt0sA3Mv0js8H3KvEj65iyum2O88wnX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290061

Add Crypto support for Qualcomm Kaanapali Platform including True Random
Number Generator and Qualcomm crypto engine.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Changes in v2:
- Fix title and commit message in patch3
- Link to v1: https://lore.kernel.org/r/20250924-knp-crypto-v1-0-49af17a231b7@oss.qualcomm.com

---
Gaurav Kashyap (3):
      dt-bindings: crypto: qcom,prng: Document kaanapali RNG
      dt-bindings: crypto: qcom-qce: Document the kaanapli crypto engine
      crypto: qce: fix version check

 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml  | 1 +
 drivers/crypto/qce/core.c                               | 3 +--
 3 files changed, 3 insertions(+), 2 deletions(-)
---
base-commit: aaa9c3550b60d6259d6ea8b1175ade8d1242444e
change-id: 20251029-knp-crypto-e2323bd596e3

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>


