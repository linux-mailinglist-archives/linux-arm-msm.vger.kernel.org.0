Return-Path: <linux-arm-msm+bounces-79666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB83C1FB93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:11:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F004E3B1882
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:10:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24C33557F5;
	Thu, 30 Oct 2025 11:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oetmv4SE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UOCl5t12"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE8235505D
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822585; cv=none; b=G4r0yxIpdjJ+FcIjy5GTLvkybVpG7SU0FWWiDDhLMpLpl5raB5uIksOaYcq0Wz4bwWfqsMtWELIEPKdUA7IEgSAiDsQkL2Rwy/elvP1fBCImZPC8fg2iEsOYWlgCbf8SxhcvU701QYwqI9UydntqMUGh9LlYx7E3YFRuH4b5Rfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822585; c=relaxed/simple;
	bh=sIVIbq8czOIkzw9bYkb2A3almPPM6iC51MfR+uV4wx8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D6VMP5sWNE+J9n0725hugaGKiFtNgK36b54kniJyDocjjWpq+d9O9hbMFZxpWr5swz9Cutxtl41BmBxbnxtBDgaCNs0QRo7/YgZLeuTuVXViMUAxvCC6v1u16u7D/kOvSFz2yCClC8GNIdGjLEJbV868h1T8w5buv8ws+b6gTlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oetmv4SE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UOCl5t12; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7pc6q1655709
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=; b=oetmv4SENmNFjea/
	cVo3s0bzVdgnWX44QDbImZe5+E5nDRW8Zx61uGrhxfGCSwWkBFViTgfyNsb8UE6m
	UbJZJ6MYiDlPxmmS/fD/gaIrWG73VgmbwiVKIChBKeN8DsGWmA1WQ/n5DZbTmkjx
	lU83dulX3GC4FwrDzGObqC1SNEMTS8Yw3Ueh3T3DLS1/yyAyVaSzVHvq84e31r/4
	CbMKpBQMHZyo6R5ez7/AtDBzgGMn5lO5CtHnbAQttweB6JaJAuduuqZQrlw4OZYy
	ca8zfGPxPJmzhx0zFPdXDl8+loLaUQiLVMTa0ffM+sjxyLInWwYJiDKq2ILT+HOu
	ndgmXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3tptt3g6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 11:09:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-290cd61855eso9262685ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761822583; x=1762427383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=;
        b=UOCl5t12tJhEzXPN//eBum8joYj4Ehkhb4txCb0CudmTig4ywl4h2AM/Rvpz2b9/Cw
         +3fPIlmqfZMli9gr9NotnrP4A2R7HijtakXCG1D7/FJtrdgDDvD8El9WaWw8jr202WJr
         iyOj6UrDhubSdpCHrSd5SOs7n2QuaO00zzlggd8b7VHzeARBA3MLo1W3kNz2ik54iAxo
         2xvRk7IuwxsNV5IB9PTjwZuhIqRKfpULcP1V6d0A3z/EYhiNYqee5kMOnnpnapBi/y1c
         xJz0B8O63n9WPb4WqdFxZWJEDtnH6eRcyKJmkgjYQij0+FoPOOparCPBH/guOJMsHcRz
         A/KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761822583; x=1762427383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7mirFkPygeIN8JZufnUR1dGGhkj3iIudgxgtbmCSigM=;
        b=UbAXAoFDVtzfqfrdEtyz1oG8YMihxJzp1Dc47DStUaBWwK2SwHSDIu+roARNwVD9wO
         rz+qYcUfbadY116LqWoyyPIykSxwu+zsTm853CdRHYraz0CaLThJ5PxK4+oFJWdolRe3
         1CVTTbcXMOclcZHpRCp48lkJ3DPHQYL1Iekp8ywIR9ag/Gy16dzSWkEY7TMT/+OWa43P
         TvSln2TcyGYhbZoeDFiulPMseVzUNae1eyUTXi4NB9+v6Sd+CM6e4YGMHaVZRCAgINuK
         HeEcZc/evA/3vSDJlNz+y8FwcN3QCizCGDgm6Swbs706RrOocvvbXmWxzSjxOVV2lbJE
         QhwA==
X-Forwarded-Encrypted: i=1; AJvYcCU1I8Q9RGveshs3XfRtNBZWM4TZcOT57dkcJ2o8T+ynb+ZxvcxM7MYDhC+aFP1GWP/h5aLos7UHNb8lGG/q@vger.kernel.org
X-Gm-Message-State: AOJu0YyxHofxCOaAm0KgvWBXYt9CyPvae0lmNBa58zVTGIvrje7bgVEf
	/tQ02gtpdOJWOV8xbIzlI8XMkovKGCnq9Zziz4StftE1iOnYQkcvjt7eCiZXLcHrv+/6k2y0dXm
	CcWFgJuL1ssu0crUH/oBtvGwnbPRrzG92wzvirkY/EYuGv0vRnOCkTFLVpGmzgxCfTp1D
X-Gm-Gg: ASbGnctX1ni/1fQ3lSq+03ZoilrzMPR7sDCcWgHTddlYgGe+pUWSNMWJ4pNbOxgKyf1
	XUkzN/J/ZocUaDCBTEdFumDq4t2O8u/Vgwdore9zpryjkD6bK6BVpL83ZHNKzswMu6kJTaaE2en
	sPTjfQaSDSN0DPXqaCzN7hwMXBTVVjsJB3g+bj0Pp8gXDyTYeJSUZvuHLLOq5AgbZfP+OMMI3va
	tkIgcDdzW2sPUbUOoXPjE10jeQPJpsbZX63HI7DsLIHZkagXJdrNLd/L0wdJIloYOtl/IJ6Tdru
	Xj8iSzNARtcTTJqHsUrj2NwJhBTaYYQzWc5KXfyHgQ6SLst05uPMhrJ9QbkrC/ZLcW1zB9dT6bK
	eG+gVzSGK8IynWu1ko/+przE=
X-Received: by 2002:a17:903:22ce:b0:290:a3b9:d4c6 with SMTP id d9443c01a7336-294deebbd15mr97770415ad.36.1761822582501;
        Thu, 30 Oct 2025 04:09:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGG99iD9Ufkeeex/L2YaDr5szoHa3EyDBbap0FH1uhJqjPSY1iaP8jBt/oVhhNU8p2p9da5Jw==
X-Received: by 2002:a17:903:22ce:b0:290:a3b9:d4c6 with SMTP id d9443c01a7336-294deebbd15mr97769875ad.36.1761822581969;
        Thu, 30 Oct 2025 04:09:41 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-340509727fesm2262839a91.4.2025.10.30.04.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 04:09:41 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 16:39:04 +0530
Subject: [PATCH v2 1/6] dt-bindings: clock: qcom-rpmhcc: Add RPMHCC for
 Kaanapali
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-gcc_kaanapali-v2-v2-1-a774a587af6f@oss.qualcomm.com>
References: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
In-Reply-To: <20251030-gcc_kaanapali-v2-v2-0-a774a587af6f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, jingyi.wang@oss.qualcomm.com
Cc: aiqun.yu@oss.qualcomm.com, Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA5MCBTYWx0ZWRfX/S5Jktt7EO5N
 4CinJE923AoE2vc0ZB2zullV0GNWJuDGsv89iEku65+ODtp13k5f/V2dXUNnkAGJgR20ws+iMvN
 NG0AetH4wzo8nukBUEV6L1c3LiKxwuKGJ6bIklZJc+r6er8APX+4FhPFjpOUIWo1ZAhi8mFjGej
 T3ismAo5ejq5AJ+dx1bvs8LyjAHEPjdT2UDKWkn2cWkCS1wzxN2b7c5iUphDhoQMtGxrzvi5gaT
 S5ouoc8TgkDmQVCbjN9aevVZ8VvhvnWvDVE6tF+v4EEslKytSREGsLY7FcYQ15XDoDlCnoUxjUy
 vtf4cLOvZVbUy+y22uRegMGA0R4FBjybFE6ZWaXbm2Okf3Qk24RqA7zV4MeDxUDycDZ1UvPZAGk
 3lV07Pm4j+gHFQLMWFObT5WS6o5WQw==
X-Proofpoint-GUID: 0TpH-30DsMd8fUcP6gospzuS-nWV4jEb
X-Authority-Analysis: v=2.4 cv=MuRfKmae c=1 sm=1 tr=0 ts=69034777 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=1qsiTTBwNum--65e5p0A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 0TpH-30DsMd8fUcP6gospzuS-nWV4jEb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300090

Update the documentation for RPMH clock controller for Kaanapali SoC.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index 78fa0572668578c17474e84250fed18b48b93b68..3f5f1336262ee60bb29c2fcea4a9212ccf7920f4 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,glymur-rpmh-clk
+      - qcom,kaanapali-rpmh-clk
       - qcom,milos-rpmh-clk
       - qcom,qcs615-rpmh-clk
       - qcom,qdu1000-rpmh-clk

-- 
2.34.1


