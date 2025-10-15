Return-Path: <linux-arm-msm+bounces-77354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BF6BDDFB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 12:29:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A8919C20C2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 10:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93AB131D376;
	Wed, 15 Oct 2025 10:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYW9kyl0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52D331B83A
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760524069; cv=none; b=TH1Vu2SyrXI8W7rk6K8JDuG19uStt4XUmg2N3q3HRtNn4FrO2bm3HJxSAt7CfqM8lXB+AOsew/eJurdP3FaDEKuu8YVgC23WfiTgU4qUvwxx+92NC01olg798EGUQwo0aimtQIzUt1ycl+L+phAl1PuFr1jOx3QYsBtlP9M2gX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760524069; c=relaxed/simple;
	bh=3tneW7CCjtQAfCGKa5GYHwZz4i8Kyf2W6TJk9+8EAgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZIzR4eRTAkMPCUUJ5sT792qDxZrxiZQoahm6BfCb7F00lqNN/VsoClZUtIDwd1oxJILOopZSa0ByspSBDRoGOAhdQhAyZPMg1esXML1j4HbxxyXh8FQze+N6nFBatSUhnf7ZinTeVgPa0YtMWeHc0w8EwKLgbBppTRxilEoY4Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYW9kyl0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59F2sFQM002717
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9dxyC6quH7bBbPyhL7oDzWfDBfFn2EzZa2n9uwCgdDM=; b=FYW9kyl0y+wr87oy
	kIocqhJerV4jZsaJmK67lNwh1XnCZOAX8iICWNsRWcuAGEHIfpdnGj2cD2jC+//o
	FmcBhC00BVfIVYBw2ZQvaCxFO7mQDRPKpPWoHgCPMdZaFndUt9g8ngtEXNBB6RsS
	ekt4II9mAynBz/XqpJqaqPZMM0MHCiKkb47F6kmw3J7Ra+7IY7zJRBjGLh1X5/qc
	mnOkRo/1veIhiepLj8JO1z759tUj1brFZdhiyNTOSlbPPXA3sjCTuLxFvOSMeT9t
	1ahmQDS0Q8hyUTdPzV8bC8ox6pTTriEJrDQtxUhxf6uXnmj+dD7f9YoZwWLfeIKc
	EU2ntQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfd944a6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32eb2b284e4so16795025a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 03:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760524066; x=1761128866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dxyC6quH7bBbPyhL7oDzWfDBfFn2EzZa2n9uwCgdDM=;
        b=oCofIUgKiUf8nbApqopEhdDJMizuIwHPwU4YU73x9Hj/s9ab3ZRDM+xZWlbvNTalJ8
         NEnWaPTG+nt/LzQmrHJ1IjzByjZUfpW8H15yDGupV7+H1FXb7dcaHBZDigFU05gZQHoQ
         EP3eclP3MxygXRv9omkZgPZlYCfY2MUdjvvgg+jO7EX+VmB81iGF7R7sqs2idPsFTllF
         XZ6s95OcvGymePLSlWkVncnREW1+0eZGSzEumyAV7gWmpq9YWP445v5LYRnbn6HBF4Yb
         XTf6jNglIPIxtE6uxcLn24UnVrNWBS1H0PRqr4UJkhDe6PCrGi6GXfzknI8bOc6zwJSy
         xQ/Q==
X-Gm-Message-State: AOJu0YzGegaLKazVeO+8tNZ/bb2955JgKfnqzNf4qQif8V0FqusnXa69
	N26pKp/EnxS8k45NP+VDVMaHekj/Zv4B/xt86JvkVn914PDgI+f+jfC4cPXdxcxKilAm9rWnCbO
	kX7gcQtKcSDXPuNEfJon63mcos+FjF3SeNKOVBpabLJI7R3ff0viuEO3j3ONtedrzHXCt
X-Gm-Gg: ASbGncs+KYi45D9BxqFnQBX3/IndE0KtzMeCLIQvfQfvYAGpj6xC7ziIqgROzhygJZO
	Qc5qb9JyTLiJRENm26xEdzdQEsY9/4EJQMOnXcihNmA6BqhpCtN655EaChcsbOE7HiW7tpWkZTe
	HxyO0ivA2IbMwwrZPZk9I0RVCRPbPaqpNWYIrNCgmBPSaoHQEFVpYGD6QBASCWCQdYSVA9YYSMz
	ytpuAnHRMPQflYe5KWYFRSOg01EIZEv4wFfD1jZAYHk4gsE5n3TZ7AvgxGWgx4+RNcrxk0qGKjf
	RxA3Hx5PWY0jYNfBkzMT6bfPZz+OWwS9UTgDEiK1IjOPrQREE1WEOuXjlrDODP7qrMTFbUMo17T
	ZWmANYOPEtu4=
X-Received: by 2002:a17:90b:3846:b0:32e:87fa:d95f with SMTP id 98e67ed59e1d1-33b513eaae0mr36214184a91.32.1760524066104;
        Wed, 15 Oct 2025 03:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUhHoVQNkBercqqXziBPfBvpTbsZkUxtH4olEMNnox5DvBDvQQHCUBkTsQoPgKGFlfHG9geA==
X-Received: by 2002:a17:90b:3846:b0:32e:87fa:d95f with SMTP id 98e67ed59e1d1-33b513eaae0mr36214155a91.32.1760524065647;
        Wed, 15 Oct 2025 03:27:45 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b9787a1a7sm1993574a91.18.2025.10.15.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 03:27:45 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 03:27:31 -0700
Subject: [PATCH v2 1/6] dt-bindings: PCI: qcom,pcie-sm8550: Add Kaanapali
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-kaanapali-pcie-upstream-v2-1-84fa7ea638a1@oss.qualcomm.com>
References: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
In-Reply-To: <20251015-kaanapali-pcie-upstream-v2-0-84fa7ea638a1@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760524063; l=972;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=3tneW7CCjtQAfCGKa5GYHwZz4i8Kyf2W6TJk9+8EAgg=;
 b=aPf+lQ9EHnOrf2d+reFP6xbwTFJL5+/B3kQQU9tsIPny721ATpGCGkg9dCBIGmRWehAog+JCN
 PkzFs6MpkGdBaM5nLsNtUzBMDWruJtyAkiElG29db3Sv4fCgBn8/aCX
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-ORIG-GUID: 5vQ3W6qeoYmSpvwNgOxGZjvdeStUWpg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX5qkynq4jgUqo
 ZnGDC2nJFdfPpQqnm8ELdu1Or9fuJJWUZ5ZH+7iC+a30D0UDU5CfD1meKFMM8fKY4CI5LL6WUg2
 IdgWLCpc94PEygiWYVlgpGkXtqgEpPCdRsyaM5lZX4cVHjvz4OuQ5Ep1l+zWxANOgd2Pb7OG46W
 CfsvNWviTzMJ2wJfnZ23dMXppFgdF4rggWMlHwAIssHD75j3Ong3tn6PiCXqnoMmhGPzVlWP5nX
 O9aKr+206hdS3nAHOM6fTb7/drEQxkvgCE7QR8qkm/iGkaBcz7+uujgzt4IwBMGYuQnH5WAFJcs
 XJN7B4djMDXHfjB2uqVAbLDpK1bzFp+gDy7aunTPKTnTgWGWQLhH8GCsCtkd2kthGyBERvytchs
 YeTvspaCDrUrxFQVMjAuy/a6mNGkjQ==
X-Proofpoint-GUID: 5vQ3W6qeoYmSpvwNgOxGZjvdeStUWpg9
X-Authority-Analysis: v=2.4 cv=PdTyRyhd c=1 sm=1 tr=0 ts=68ef7723 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=g2cXXHbr5MSVwvSK27YA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

On the Qualcomm Kaanapali platform the PCIe host is compatible with the
DWC controller present on the SM8550 platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
index 38b561e23c1fda677ce2d4257e1084a384648835..8f02a2fa6d6e2ac3115cb10ccb4d22ae26a49f49 100644
--- a/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,pcie-sm8550.yaml
@@ -20,6 +20,7 @@ properties:
       - const: qcom,pcie-sm8550
       - items:
           - enum:
+              - qcom,kaanapali-pcie
               - qcom,sar2130p-pcie
               - qcom,pcie-sm8650
               - qcom,pcie-sm8750

-- 
2.34.1


