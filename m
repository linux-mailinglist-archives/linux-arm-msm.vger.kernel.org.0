Return-Path: <linux-arm-msm+bounces-83110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA90C81D30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 18:11:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 649744E75B4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 17:09:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2715A316900;
	Mon, 24 Nov 2025 17:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QR6hxSvW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JyUUpeh4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5434B315D3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764004150; cv=none; b=AXg4GPa+8NS3vIdJUxGZD8Q9tts/CX3/Su/DfgZJr1v4Ye4i2S4KqOMQSbIy7rohXAWvBXR43Q2ONrqaSDxoNTupr5oBCHnxUeb4ACrR4BLjh4sIJAAwf+XuJjux5jzFXAd/7ycRokYDJFBUDLQD7+qrECfJs0UTKdvt9+IMYws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764004150; c=relaxed/simple;
	bh=QX32wXiQBOvH9OWMl19ctjvpWIa8KlGJfTbKJn8Eirk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVVdncpewzs/vaxYZswHbTeEJQeqh+S17BOLCrkIfpkM9chp0yVwL3EsLqOtTtu10Yxbhj9SsQv+jYTz26PYv4aTPFVPxtcNtX7SX+BzxrVITSrz85WO9WmvkunlWR57mi5t+2/hTjXwBkQcQifzVHj1ZfSW5uwtvnXZjl3fNHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QR6hxSvW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JyUUpeh4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOFuZkV640767
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HOQpVkt8WtRN74ioDq9Usq0+8FTkAmbx98UBVmfqbbQ=; b=QR6hxSvW+jwHhzdS
	WAcuOW1Yqmnd6qRjOh8fj+bdUHg4VCscEjDQBlM8fRj0wON7UCxXtHP/ccJlwL2F
	1YbFeqC13lT3PTJjPDFjOcm2D3aHWShqXDd+zF1LVyHaHSbMKcUGF1fIMAB/6+D+
	SpnGsTNAgDm4PqfquYA4p1Oz1j7lEahGCCLAjBJE/1cXj4qwFSHMSnaEDz6cOkvP
	CGYFcJKDuhCZXJ91ZR8gHGygyyOe+k8IUHZclHn0IQ+bQaAWuSCW3xd/q+mdnMBW
	XksaN/rzq8bZbBmCvxsiJXsg5ZcIelrEPN5+4PggRrZJI2Dzj3O2LzDOOFidOHKS
	G+NFbw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amkknsj3c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 17:09:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-297e1cf9aedso114355095ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 09:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764004146; x=1764608946; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOQpVkt8WtRN74ioDq9Usq0+8FTkAmbx98UBVmfqbbQ=;
        b=JyUUpeh4i6t6ZcuT9FE+kNMf9R/ajbUUCZoYfL1qt77Q2dEBppuFGRNVUsHc64gx1v
         HmPpXpuEVf26O+CyWVc5LGCRfpRQqwhu4v8RN+t4XpFAu30mUZyP9E9dEbCBCBbo85u1
         0o/gNIL9xqSByMC/U1wnGP+dcW0H35xPxWv/rS9641u6wKwD1vEpeXZXTuoU9opmQKVF
         DSxVbET+1bIJhXWwlPvNrOyvxbhjvQBMU1GtwL7bKHAKNq0kn1OPzvVxtHEf3cMM5DrT
         oEpHeH6L/E9LdyqpIPNGnyKwN6y/mQPDPM5fHJWd9hBl8DDXoAhxty97kcjL6OvmmBWT
         4frg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764004146; x=1764608946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOQpVkt8WtRN74ioDq9Usq0+8FTkAmbx98UBVmfqbbQ=;
        b=KpOtO2h9miQuFF8dXr4jXM4d4zGNyVV4Av1beCYroNj5oNo4PiKi5jUrwB65HzmBft
         p/X64KfrtorRJU+sMvL0iq7+ALdxmPYqhWoWdFU1sO9GUShHTVjQeOuyvWQGWS9oSj1u
         S1QqIb24NK+sGZ8MMpA2o1oQu4sIcGz7eZFewJNzB/wp5980GsuVb7nMh4cM3Ut/EHz6
         4v73YA2Yt4Cc6pnMV422/WCvOmQP4zVXrMzP1y1Y/LMHMVQpNinXC5+YClFTMvW58Jri
         ohgGravh6Iwf7sC7x1RfdryXjagVzBoG8XLTjSM1lokq/fFZj6+xCByH4mf/YiT6bLKP
         sjIg==
X-Gm-Message-State: AOJu0YxNqB/mzWARmoL5n0fCO7sNwhNy+amS9G6IBLm9aqom0UyXPFls
	Gw25bPzlilhjEXPuKRt29NgMsS9We5I3XKTCY3Vsn3T/NTJbcee3h7Kl0y1ztBPKKU+qJ+FkYUx
	QLcAgqDvBhpaOuOdPNjv6CG6ScrKXzEJibEYpXVIuHh/1EKaUJLaBa7JiJIMSujIo35BL
X-Gm-Gg: ASbGncvtm3WczGM63M/pEX2e1Hvnx0I1JLZE0nSN0uMdBVq1JCefqSWB5/aLomWNhai
	5lz6ilqdNOfPvAFlSXI3vw4pmgD0M2QcsZCUgp3pVSKrOBUd7qaL5WL/0On6JHVZPaIxj34QYrM
	MPDS0fQQUlxSb3LmSA1BBm713psCsUOTgvCmrrmAnS1XlGf+T93yNKLcAh5u3mt42IvvP+m+IG5
	K226SUuHvrFvpnWGQ7sP9X0VL6TSpCZOZnt28fU4zbFlAG7p19+dQa1Mi1VIBLaMVCpddmcT0tv
	K6Q6XCtEek99hU2/pvX28f8krLoWAG1UWXlIQh2hdCFlC5IcQAyMdrVziMiLACJ1coBUqma8K6b
	ktVz4PuCVR3mQtJU8O3WVxA5ltAvXeRds33I=
X-Received: by 2002:a17:903:98d:b0:297:fec4:1557 with SMTP id d9443c01a7336-29b6bfaf6c0mr125472925ad.60.1764004146161;
        Mon, 24 Nov 2025 09:09:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHc/EA3g/IjWjDN0phXFJZwIGcxYe1MqBC58LDcjbK8AFsinGj24Yv0mfGyN1sPJGfOS6muTA==
X-Received: by 2002:a17:903:98d:b0:297:fec4:1557 with SMTP id d9443c01a7336-29b6bfaf6c0mr125472545ad.60.1764004145674;
        Mon, 24 Nov 2025 09:09:05 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b107effsm143949275ad.14.2025.11.24.09.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 09:09:05 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 22:38:49 +0530
Subject: [PATCH 1/2] dt-bindings: crypto: qcom,prng: document x1e80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251124-trng_dt_binding_x1e80100-v1-1-b4eafa0f1077@oss.qualcomm.com>
References: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
In-Reply-To: <20251124-trng_dt_binding_x1e80100-v1-0-b4eafa0f1077@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764004137; l=759;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=QX32wXiQBOvH9OWMl19ctjvpWIa8KlGJfTbKJn8Eirk=;
 b=cT17lzs/2OLz5ZZS+XHDVpeZTvOtTBL1bkrrPNuR8RXXwoRs6SVzBbLJW9Y8DNPXbi6G8vLcg
 sDuK/+4563tDjCJ00oTgPFZJ6917bR65LgbarP+MdrizFv3C3rvm8Eu
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-ORIG-GUID: MdAGXr2WjJWNNjSQxi8yMAbAHl5vcUXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE1MCBTYWx0ZWRfX+RRIlVPX45qA
 yK8h+i5NBtnR3yM1n5BjyX+GfWsxGZuXrm8iYgBY4ptFPumQXVsWAP2BdH7NVQnPeUdL4Id8MHn
 F/OKAEf9m3neM0wQXx4BhrgBGKgyaICdYkdMnuK5qhtjlo+7OBrXJ4epxaGXRaTr0iRADhbThFU
 j8H0+8IA5BSvuK3gaT0vMQyTszdGXbtn0OpKd85O6ouPaGhhlAzX4K5gEveITUn3HztN7zwX2QY
 d1n+IyjEr4LozvXCAplg8P5h0+mVAgkK2cOuOWhK15FesjHJxjFiUS7ZbVRI0IqVPT7oIyMs/mS
 Fvg3AEhjGocnTkm93ArMJ/8PtDVJdDFFR0ABH34K8hU8PlO5CqtXbM4T7n86/kADMk6Y5qLMLGA
 whnyS/l4RvqKKCRhBfOp5u4F0Wb0/g==
X-Proofpoint-GUID: MdAGXr2WjJWNNjSQxi8yMAbAHl5vcUXE
X-Authority-Analysis: v=2.4 cv=B8S0EetM c=1 sm=1 tr=0 ts=69249133 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=zo-ueGDDGFMG-7NQtl0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240150

Document x1e80100 compatible for the True Random Number Generator.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom,prng.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
index ed7e16bd11d3..aa3c097a6acd 100644
--- a/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom,prng.yaml
@@ -29,6 +29,7 @@ properties:
               - qcom,sm8550-trng
               - qcom,sm8650-trng
               - qcom,sm8750-trng
+              - qcom,x1e80100-trng
           - const: qcom,trng
 
   reg:

-- 
2.25.1


