Return-Path: <linux-arm-msm+bounces-87986-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5B7AD0115C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 06:30:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6A1E03096D8C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 05:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5FB2D97B7;
	Thu,  8 Jan 2026 05:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KBwYCeJX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IOcaN5IK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9F28980F
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Jan 2026 05:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849920; cv=none; b=EOFN3dUonHDOjNAEEgio+E5ztjHd0bv0IzviLufGfJklKEnkTemIi60GAF7OQnysaPCNx/MRrKJ7xBpcBSyZRvNX1XF8xTpr7y85g72xbEw1xUV5+9JzPbLQMJf7tsZ0VjDXtuyHAQpV5XW3t2uGgKf2JGupgTguVbr0OnHbwfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849920; c=relaxed/simple;
	bh=7C/fuM99sOD5dTqJ/5H4LpMXwX3TLFHJS3TICuRG+gg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d6l2PC5iZ3se031sJVODN4f0FTrE9MFqW7S+HFdKtSPzFc8ZX6fnUmvMocTYPBRKxu95oeG0oRFEGpHRhE/+sS2fIXUQ/+r1uyBgWAms3SrQBJ7lxA3zrylSsS1JyZCXUbKANYP7RurRD8ELdv9glnhiZFlaBJYlTLXpZCu/fEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KBwYCeJX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IOcaN5IK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6081xPin126653
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Jan 2026 05:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=++7hsKoXJsW
	92ivW/TnQTYqSqCDWM44USC0F3hg6uVo=; b=KBwYCeJXWlx9Z90ACkYV7HTF7SR
	gbv4XeBVxaAxjv+qHuUVQ2t7J2Vbng1ZIEAO5BbDQTKzPnr9ro27guNqBuh1uKAg
	sqQjGmux3Jn0xqKWJUNj0zAhPw+NpmdlQTBvyDrNofJzqw1GlbObWAuMe89pCQyf
	Jt+3oq7cJSC18yRDnlbOni3pLSdjnartwLN6inqn2831YJTuuPD7pVvporv3XWCX
	GODTJPTL3Hj3H9PjJHEDCBRgZZ9xEIYG0yl/ZhvqJ/6HqLWEywjrqrG0U4UF3dmc
	GEFdvgiXEl6+f27R16/f27ArourKT/anspkn8zIjf0216KYcbZ6t3GpGM2g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj3d68hq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 05:25:17 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7fc82eff4adso1505284b3a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 21:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767849917; x=1768454717; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=++7hsKoXJsW92ivW/TnQTYqSqCDWM44USC0F3hg6uVo=;
        b=IOcaN5IKITJngD8D8EKSYgcT5EXvfzH8lb9Jn6bJ0/yrb6NmpTMFY70KPukarHN/f1
         5iv6GpYIr882jCCQbRN2RkbGCpCRGAbF0U++sx51sM0BOWZv7H8rxil0n9MCY2UiFril
         qJHa/CmkicYhARJ4NEpfycJyzr/ZZ7E7MaB8MpMT/r+o9vgch0ITZ+f5MFCapUDjWs43
         r1LjMBReSqQWn+xlk1b3Yb9MUAACTI4Y7J7N6uiHJk/+23Q46xrBC+SuYXSEQWuROl3L
         3V5GNT2Hy7KizdikNvvxFePJ7KIL/vH83ymLxzBabsnNJd/Wd/VbvHntxY7fsgbHHZxp
         SGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767849917; x=1768454717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=++7hsKoXJsW92ivW/TnQTYqSqCDWM44USC0F3hg6uVo=;
        b=LiJWdqpXfHCJXkGbslaYZpFlCvi2t2sOlhR0oq0d8q462mORb4twPtKGeF9OrJpfUo
         /W0JRmJJUU1zT1BzN6JbL9N1QvrCqoch6UduveyXMLskrZxXJzaN6k1SXFNXZPy66FcQ
         sqmTpdjHMMFJ3lXvMRmX1sWEkadqjgD1oLokNAAVDv1tUSTFPaovF0OBltHx5U5iC32o
         LQ7ajo6umJ4ENGoYr1blXSFLZhh/i1kKC7FI2rhbYxQI5NDAvNR2bZlEcZGKczzLf61o
         paFV/+BIo/5x3wAXc8AWdQHeFSIORnLddTaWmX9dt1S+UANelpnwlKuCyCCZxZeWvz9O
         opTg==
X-Gm-Message-State: AOJu0YwUQEU9gda6tWCHNdhk0kCvE/tNwygiR8EgbVWtzbsR/bDJzjrS
	t13/1WNjhrI3syzNJcbSqn0GfOgDyEv3ZzDWKLApzWSH51PzivZgjf2cnib9ZqupMptiRRf3D8v
	PE/6cLXLKj4wFdjqweyOnxbtFrhbWXKT0sCaaBDV1YXjlFSiX7gwdYoH6hKJ9Ktuvvlqj
X-Gm-Gg: AY/fxX7xxf5hVcQyonInyUcNni51pvgmkJ9gSSTjrIiCuIGorWzCvFF4T8SbK10iN9H
	EQ/HnVcPdtxDj489s6g2PJvW+riEnMFKc1FF5VwM4PljR+aTj7SH4Hy0Gkw+wGNXN+Y4dqz5v3o
	/TROTJ/K7RWv8J8q4K2Z2bxWCRhBxsnfJ4vtYORHBKYxVJFOwj9hBpgJIFKHXasrJQNQDW5mwqU
	zTIelZe161Q7UiwtMHlgwWOwbd+6/ZtS3/s1OiZ1ksEw3VAL2+qS0Aruq2O+ODmBwqBOnvgMR4V
	blo/7kFJdv3DZxS62pMJ5oHPl2Hnn/QnKQ9ulbXW+NezyFCRVF2OJZOCKT71Vd2Hrw8jH3FH2iR
	eKVkNezinCxPYu33fPVSVNX55sKk+iGuD8bEbMhmKs07kl4M=
X-Received: by 2002:a05:6a00:1c9e:b0:7ff:8316:22f8 with SMTP id d2e1a72fcca58-81b77eea660mr4857353b3a.21.1767849916482;
        Wed, 07 Jan 2026 21:25:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFIWySSU4rM/WwZXOa7D43aSEqm/pO1hNAnchsuorkXjxYBUuM60iUD4BoztRWzF833sFg1pA==
X-Received: by 2002:a05:6a00:1c9e:b0:7ff:8316:22f8 with SMTP id d2e1a72fcca58-81b77eea660mr4857328b3a.21.1767849916005;
        Wed, 07 Jan 2026 21:25:16 -0800 (PST)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb0de2d2sm6415534b3a.27.2026.01.07.21.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 21:25:15 -0800 (PST)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v3 2/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31 eUSB2 PHY for Kaanapali
Date: Thu,  8 Jan 2026 10:54:59 +0530
Message-Id: <20260108052459.1819970-3-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
References: <20260108052459.1819970-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jJOl9mLP_eGU1ixuJVGNLLJstae8c6bh
X-Authority-Analysis: v=2.4 cv=APfYzRIR c=1 sm=1 tr=0 ts=695f3fbd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JlprKJ-Wy1uuo2cOBb8A:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMyBTYWx0ZWRfX2ezOmjzGUOn+
 QGDa63/ZO+G/jsEkPjdsh5lrK3NjjwB2dCuWTxuK9HoZ5se2jPG2gGYqSxdTqabYW7RrhAUbE59
 alBYSvQfTaKjZrqh+Z72WCT5ZZPesFo5aPMjvws8chd7yNYQup+mHMGyYLK+1Az5wgnXC3/Y9fs
 iP0UOwI9KFrLsbMOmPXqxNLmueWgDNTGsXroExPD/wTCo2TbnVhZH9TnONNO+S99qu4HfYFtWMF
 d0Jw3/t3qkqphw9Tk9GW7MYjWufLru94RsPuykGa1PwfL3dmP4qageYsJCLucjWlzv+A+aRlM5A
 /C2xKXUZvFSFxX9amu183ZbAoyugbZ4eBCNHcAxmniVuX3P0J6SJeCuRT/+b+RoQSUMD+LkEGxm
 v9HVuRA7+vZtI3+nZkUiOfHk+pz3bFv8uIfxu7K527jGWmBwUXgBjyy3AVAyIt1SiKPjftw1rcM
 5T92QSyL/g2RtGJpwOw==
X-Proofpoint-ORIG-GUID: jJOl9mLP_eGU1ixuJVGNLLJstae8c6bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080033

From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>

Document M31 eUSB2 PHY for Kaanapali which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on the
Kaanapali with that on the SM8750.

Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
Co-developed-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index 409803874c97..cd6b84213a7c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-m31-eusb2-phy
+              - qcom,kaanapali-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
 
-- 
2.34.1


