Return-Path: <linux-arm-msm+bounces-79371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 39053C190F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 09:33:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97A5358124C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 08:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7CA330B2B;
	Wed, 29 Oct 2025 08:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A0w/uUqQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RuMk21zh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A3A32C337
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761725857; cv=none; b=gJSdpkf6rvr3EMQKvMDqQkqYSBy0cq51ArBMBDmu5ZHFaf64gGl/SbLrM1ulfcX6joBiTxGSPqNB9z1UugsD7C7WyBN/hcAhoBjXfOhRPR+3e5u5PEdX4Iuh1/rPT3onjK1tVlMth8eyJb7RaYULlANPtOh9/hKozzk67Dpreak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761725857; c=relaxed/simple;
	bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gl9vBZ/bWamqtpCCJkq8Sdg+MBEyDdzgs1LwJgBsmks2fDozSHxVGCzYFHUjPhzNM2pfsdN9nlFs7Wbu9pJTqTkIdr/OcZJbPHWyXDFujhLz/OW39eLLmYsPhw9o0nHJNm/godsJK8sjFGplLGK6v8n4swmSozbjNQMS7MRVQbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A0w/uUqQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RuMk21zh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T4ut9u3692118
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=; b=A0w/uUqQs2/QXQyv
	8UdR3QBtDw+7ejy+baOmzqS75/aPPs7XmoVZAJjStdsYGQqRnaIi+wB5H+i1e3M2
	BbFfjRGZwRsH/tAV3GWrBjcnL0pptsFoyvXEeQybNs0rqN/sIDlHL1quznSm5m/G
	U5eYcCu5BJ7ilTtd6El3NMSufKIdh06u7EOXD2qWqDt4XyhcOLy+EcVcAxkuwJqE
	ieapnjD+A4k45T13hdYP6wMGKdKiSVvvzblcB3FcwxtuEsY3BrWgh9p13TG0LSK3
	yoMk7N47lFOGujqx1I7A9gPqmM/gxWtM1mNOAJBJpTDK6dph2kkPn0rdVrgS7EdC
	sQ6OIA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a2hre8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 08:17:34 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7c3e0dc2c6eso1263344a34.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Oct 2025 01:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761725853; x=1762330653; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=RuMk21zhH5638Ih0iJE39IvA2rhlBErVDhRwsgNy4NnSotnwd9QVYkcgwBbXSF6Ie9
         JPawuWq+QEaE4ZFFoyviHTOew+9nVsVGWGP8QDeuC7YnMtzQ5YJPG1ZpfuJeJKyXCzFR
         TzPMlWIoRtj2tCWFQiBord4dP7Bdzjjprjl+eg/toUiialrLKFJAhnVuuqnBziNZ3WNP
         StRGVCwgXSm5VHzpyxGx1AXyv70ndJ9NyNiS+A9YqerotZwsIO+nJ6c08LIFuuDaii6z
         vMqiawY8fRYrHNM/6C7CTztnuLAxKsDEcFZdXs3LxidOyWyKDCBjG7KPIOa6sZ6ek07o
         sukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761725853; x=1762330653;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15z0GkALFdQCnt2s+WGZIOpr1bmUM7lJKI9p/mPcc4k=;
        b=dwUPPlrr6PxV+DdpMKwD9zX3ri2rD6peXn5a9x/c9es2YNLXtfpGpkivO81FcCgIyy
         q7Q2YrYseVqPITdMHQSKWIl2gXF26s07vh1eeNxCfd7T32VCkAS0ihn3CeYXn9l0dYN4
         tf4qzbdH+5NmDBct5G4EJAsvccgYRQe4Yjs+ri9Em1AG44Bz+NJkqXO8JeKjxvvjZj8R
         136snL32BQLacYv5f9jnWqsz/xyg1uU8X+T0Av/PeTDrgsKQZWeGoCzY2bM5+bH2BH2u
         x8EPOYVjF4NhA0XgxOQyIBhhsBpGPTgjl1QvLpndQGUJKH7lF4jUzIdfS+rnx3F64fBe
         qekQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlZACSOmhaPd7L7sLapEuQTj2cym4tQCDCpfXNyZdKRoxickGzrIJpdrxWiPKGSJ+G0QiU/0kFVN9sn+w1@vger.kernel.org
X-Gm-Message-State: AOJu0YxKXDW0Bjpmyp2txRjjL97v+zSBgFfmMhG8vY+3DDnfnwrNN1T9
	EhsrvwP9oetr5d6KNrkf8De6FBFPLkK1ZfGK7PzgMfxeNel5piL9SvqJdXoCOF4MV3vCakTzNRO
	5MdSdvuMd524ecpDmsxRFfrd2H+KrL4XnQt0n0YeA/f2WYdHlGjf6Y5X72rvbQiW8LKxh
X-Gm-Gg: ASbGncspelEYrmYaNwyMgAIoKbhtvPwSe7ZSsBQrCIKwsvezcyGlW69FPdg3kVrDDef
	LnKtWNvODfcJnwh6IwJcfpXXNkgFJ9Ap+gHSGT+DPIZDbwXNwF2FRXV+iGKbTMnjh13sp5FoLBu
	ey9erk9+ZW31OfCmXnte+RU5KTFEb0CHB0QpUDuRgZwo03eSKQDmHCbSN6oNuM6vtL1UMcneem5
	W6XfnFY/RMoCMqUyQ9nWZlf435Mr7SiqbP5Y/HTctndLhnBz9qkzXUppwz9zA5B8OGV1wbxVmOM
	yeqAHB7xCrL/aDOYBNzZcA4uu1VWo9TlukCJHWLHu9aXr5Z6vjRxVpBNGJFzH+7nPPwTxN8PK+r
	RbArmKnep42EHfcY1q+YMU1pOzzCbfrOiOS5xTJLHB85z62yLAw==
X-Received: by 2002:a17:902:db11:b0:283:f19a:bffe with SMTP id d9443c01a7336-294de814667mr26218985ad.7.1761725146988;
        Wed, 29 Oct 2025 01:05:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZLW9t7z/EPvn7h4K3SuJB+l5enpw/B+1K6KrQmn9L1REZrtp4lxhJR0N03EZlfiZVsemxHA==
X-Received: by 2002:a17:902:db11:b0:283:f19a:bffe with SMTP id d9443c01a7336-294de814667mr26218555ad.7.1761725146379;
        Wed, 29 Oct 2025 01:05:46 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498f0be0esm141754705ad.96.2025.10.29.01.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 01:05:46 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Wed, 29 Oct 2025 01:05:39 -0700
Subject: [PATCH v2 1/7] dt-bindings: remoteproc: qcom,sm8550-pas: Add
 Kaanapali ADSP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-knp-remoteproc-v2-1-6c81993b52ea@oss.qualcomm.com>
References: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
In-Reply-To: <20251029-knp-remoteproc-v2-0-6c81993b52ea@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761725143; l=1292;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=xT3Z0RX9zoOKMq7jFVYf2pwqfhxYhtw1nSQ1v0B4npw=;
 b=LReoG7MZh2ShoPt8h+j9v0Zt+JfqeTIJpg6UqCsJ2gKg2Y9phjn4ZiKv4IKo4CYTPBhudX5Z4
 1PcvQu3U/wHDQNzvy8mvwDNv77iqWxBzCQs8rTjTIDouo3IfnqR/jxV
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: _Xl63CdsFPnYO2KPLHzxtRXOls4AIPtz
X-Proofpoint-ORIG-GUID: _Xl63CdsFPnYO2KPLHzxtRXOls4AIPtz
X-Authority-Analysis: v=2.4 cv=PcvyRyhd c=1 sm=1 tr=0 ts=6901cd9e cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7zWBZCs1gTFKjwm3VpwA:9
 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDA2MCBTYWx0ZWRfXxm83grNF4QfO
 Q6aULyG+AF+YoTJuasmiMKFNLaAfSuDL+asZfXG2tfssxLxRPJK1pzgF4yV4R6IJ5qdVcXi8JGU
 jpf7Fw6Kzic0QSetJxBemH3BbqwbEMy1WmetfB3nxykKmcBYhBNE0UITTsOqB5c0IDo10C7+cJo
 plUrjHgkXrFGO5/IXEYSl4Z17FSooU02+zie1smEwPaAXUqqtZZiXDWUR/tYuT9UfV0gxgLZ2zo
 II6lokJbcGTb6VieN4uMFt4pANRls/O4fSKWr2+sq7VIAENks9aXsgd15MqeG8Wy1aziOc7P+D9
 wO2ucNepo6Oy0ib5qEOsiX874h6kH7K4AFWFI5jf31hcviN/K9A7vV+q8x0eDkh/sycf5xFwbrP
 PxAe2B+F1PbShzwn7zlhhCMFi0Y8NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290060

Document compatible for Qualcomm Kaanapali SoC ADSP PAS which looks fully
compatible with SM8750, which can fallback to SM8550 except for one more
interrupt ("shutdown-ack").

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index 2dd479cf4821..31dffd02125a 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -28,7 +28,9 @@ properties:
           - qcom,x1e80100-adsp-pas
           - qcom,x1e80100-cdsp-pas
       - items:
-          - const: qcom,sm8750-adsp-pas
+          - enum:
+              - qcom,kaanapali-adsp-pas
+              - qcom,sm8750-adsp-pas
           - const: qcom,sm8550-adsp-pas
       - items:
           - const: qcom,sm8750-cdsp-pas
@@ -95,6 +97,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:

-- 
2.25.1


