Return-Path: <linux-arm-msm+bounces-79811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C7C2395D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 08:42:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9E0C3AFBED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 31 Oct 2025 07:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A70A32B98C;
	Fri, 31 Oct 2025 07:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A6ShDk+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGyR6KDw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899AE329E74
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761896525; cv=none; b=PKcxDu35B2fxrQ6+2bNpFEnbdB4W7HjApZoDuQbgfge8MiZlsyp6zUwZwCpTW0aGjLssP5EUAVbg1KnE78SP/b/f/sz0NaxjLmBrMoKL4va3wkFJnbX2Y8XvJZaR19aZaY2IiIlYV9MVHMxbExBNEXAy8MF+whZe4AtXnj7DqiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761896525; c=relaxed/simple;
	bh=hyAgBs5i+/xaHJSSHUlbtDcsBlLHZyIavHx3uB+5ohg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f7oIOk396Lmmal3edsKpc/SFsbwqtDc7RldsZdw5rXZZguK0+w5qTsd7o+Oqn+3rR6HzqnjWGsZVHFoZDyUhuta2MGLbBz8yiCec4qSy5uSdvDCwsv41YeNRsqPZje9c2Il+e5/s6M9CBvfqOupG1/sXXam4sBRti9DMbrJWlr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A6ShDk+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGyR6KDw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V1mcdS1571285
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3MuWcoclZXbFGKG7snEdvIBSt3O3tlaIvOtpAIsaag=; b=A6ShDk+01ijGE/sU
	ZQSWA6CN9qW/4HnNjHkmCrTUtnPEHvleJE31WBilHxnTJ9yL+9YXpArJKw6WyC0c
	BiqTkVohotL1YrRgrjImX13W+/47QtivjB6dc8sDDCuhimAAyCh1nKxicUk426kF
	Toa7Bz0ITpxyJaBszDfDQfiAdShcpdjtCJQMlT9AlNyvBOzmBKFUk084bZaxRmuc
	3qzrHhtOsZw0UPVM8rJ+twRM+Y8JzxtDnIaTc0yeLHS36PXQPaZan8kkTwSi+SsH
	ETqawmxX0+CC+W7NKHkRDW8yuCmADaObGGb2KOTp2hjzxiIZANmbWaHe3Y311kGT
	tFhm3g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ksc0rtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 07:42:02 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-272b7bdf41fso25068455ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Oct 2025 00:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761896521; x=1762501321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3MuWcoclZXbFGKG7snEdvIBSt3O3tlaIvOtpAIsaag=;
        b=bGyR6KDwPZp9tZmLSKMPemfAZWNqEQTsA4bk58oSRk0vdFmPuOLaGeuUp9+3A/F16N
         nFzv8/CyXgd2Vi6NIBYj0ycx8N9EM4Pqom4YP8VBFvJDuMr5sVCFuHwdSChJHXQ7AQc+
         ELKg+adVOAIHNlBacSa+fWbEKw1iz7oQgKqpoJwcXYVeNwuyLXn5xrDBivhnwjGNTmok
         rc76O36S3+PTnZMhrFs9lunpY270s39J6DD9pL7Gu1LkLE0XJdIjykNmyC5cNKECFR1R
         WfXPOfozq1GCUsx+8a/Js01VD7Nr1qmluEIFl5QrM7u1xEJhde5x8hwU7r+ZX9bXvXyI
         Ckyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761896521; x=1762501321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3MuWcoclZXbFGKG7snEdvIBSt3O3tlaIvOtpAIsaag=;
        b=NXig+oSx2P+G2EvngetkbNeeMpKngXAWEZsxtQDwQq7PwNNWoMB37zNRHJdKAEUdoP
         ccpQ3E/e0CF+l1Sdhh3v5stvpU/X5wR8463ScbRk2jwrJOcb/n14YOQXZIjLXt7PMO2C
         DmUQD7uZeM7cgJa5YKKGTnEPjssQfFfIdqmimF3IiFRMLEZdQ0DI+dT3bJWhJW0fHY+v
         b3cRu27oX6107NXpTkKtJmcMu9eXIiKRWNLR7vLqr+jZhRrbBxZiDwnxO+8c54dmiyqT
         UtlxPsZTZ/2g2uigUpLLEL4dD76eilEL5WdnBWF4LDpZ9tRZqpfsz0q38lP1pCmRtsfD
         AakQ==
X-Forwarded-Encrypted: i=1; AJvYcCVePezc84C2/JjME6/1T5oe2EYAdf0GkrjnB90psxPd5QLah2VbMbIdwQ3NW/FGokDsVFs9q2KZz+0ClP6s@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCTtrin+Wd57TVumqOHPEeVQKqYqoi+ySsvlH4BH4wQKZgA8j
	7xT58DQ71mjeDOAVL7gKalkNWrdNGOCdCwIyD6RjNUOxrFQfv42/cPU7u/76ncH2zNEweBtanrD
	619SSo36+OIQDgPV/uXulfml95ZlHR0gJc4AXcYxRMm15QRoG4rc1T/x+FtM73+pe4wf5
X-Gm-Gg: ASbGncvzhbFDaULvTfXAGu8CPnq2iSPoqg3ayLMC7H7l6RLGNpahz9Q1gU2POaOjYvD
	s+K7ZW7gWWdgA9JtRwJuRnDB5ZLN5C/YHvWr+BZ6gWhVRVtWfasmzx7/bVBPLeRHQ0geifKXUlg
	RvGBOe/bF2NSIZSCXPqjm58ujWk/0u9K5gZG/nknVAEM+BRkFNjhw0rPOa2z8xdKDHuoJnoofbR
	kmG7sKLDTeOCKFdylgIpdygKe4BKSzSH9VtV5VYjDXYXLxKtioaxcIeTrarqfn1BtsmuLdXg0xv
	NKLGZ/t7NfNBDZBOxY+vs0k544l/HmK4BXL+ZEfz68MZ63B5p84G+gr0k8xMsZ73v18rFY2Cvfw
	WuKrY/BUOcOF+8XrDElPSdkBtQbmKFHIY+lZZS9O6j5n6Ouj69Q==
X-Received: by 2002:a17:903:2348:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2951a36bff4mr34667645ad.12.1761896521401;
        Fri, 31 Oct 2025 00:42:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBgmjyvuQbEx4Q9ICC0LuNnHIpOw9uoqbn+Ks7CXvMLqb7c2GuNZPwjAkuYwHFmBBxdvCtfQ==
X-Received: by 2002:a17:903:2348:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2951a36bff4mr34667485ad.12.1761896520886;
        Fri, 31 Oct 2025 00:42:00 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2952696f0c8sm13276735ad.71.2025.10.31.00.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 00:42:00 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 00:41:44 -0700
Subject: [PATCH v3 1/3] dt-bindings: mailbox: qcom: Add IPCC support for
 Kaanapali and Glymur Platforms
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-knp-ipcc-v3-1-62ffb4168dff@oss.qualcomm.com>
References: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
In-Reply-To: <20251031-knp-ipcc-v3-0-62ffb4168dff@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761896518; l=1025;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=hyAgBs5i+/xaHJSSHUlbtDcsBlLHZyIavHx3uB+5ohg=;
 b=WBmu+bx+9S7CuuLrrRq/TiVzMmZne+hsZuPkfXSrnUFhXUsJs/YZIG/LuTnH1T7dzZ6SQrpJo
 k53f7rM014yBcSViFW9x8CSKZGJNlJzS0DcBgO9hRbcW9cbq9WsaNk+
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA2OSBTYWx0ZWRfXycpCWiNqN89D
 D08jGronh4SLXV/p2XLP+mm1Wr8n7Mci03di/DNVIfQEdayL6eyhpXhDT0Hf9RgOK7xnSeGitao
 fuLu/WgzdCTQ+wQPwZ6MhUW9hjtN90wZhs4yRZjhtOxQCF2m+sbd5hY7oYnGqyZU/E4wlVcjKZ+
 pD1b/JjjOhuDJJ7hAzwvsesGXOSd6bLmvGe9VoisqH2XBbbHLLqkvxhW61NLtNnJvfkbvHDcs/q
 aQ8D2j+BMyW1NuVaBJHMdZGP1b9xi/U4wGvdX+r6ViNp3A0bj3FxdyZlLXTnp98RlUNVUYcV6/L
 w4YYKQUoxsKExxGmg8I+AECc74xZGKqd48It426EOc1IGZ5r2NDuWv4RlTWg9sPdQCnOJ+tw+4y
 IzcK2Mk+FBwBoZdYNqy0brRjC1GV/A==
X-Authority-Analysis: v=2.4 cv=Q8PfIo2a c=1 sm=1 tr=0 ts=6904684a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=5oGIy7HwbUt9dYcD9-4A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: uSmb9ON8-05SJtOk55vl5iK3u0Yi9SXG
X-Proofpoint-GUID: uSmb9ON8-05SJtOk55vl5iK3u0Yi9SXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510310069

Document the Inter-Processor Communication Controller on the Qualcomm
Kaanapali and Glymur Platforms, which will be used to route interrupts
across various subsystems found on the SoC.

Co-developed-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index e5c423130db6..7c4d6170491d 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -24,6 +24,8 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,glymur-ipcc
+          - qcom,kaanapali-ipcc
           - qcom,milos-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc

-- 
2.25.1


