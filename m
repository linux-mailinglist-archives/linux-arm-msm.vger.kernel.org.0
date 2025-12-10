Return-Path: <linux-arm-msm+bounces-84872-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBA2CB1FE3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 06:37:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9D3ED301DC7F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:37:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D60C31281B;
	Wed, 10 Dec 2025 05:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I59ouaJD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e5PJnAeF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BF72F3C2A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765345028; cv=none; b=ipkgAedLsb+83he6oNbmieEhWw2lUzX21P/RSjbx7jCrthuc0worHmMi1iSBFrcQbe/3HpSQOYSMUTHFHGmUv4XYUHtXh+hmh7BXHvUJ0M2Hqk7f/tec6V7Zce9SycQN4+j8qD6clJ6/DeVKp9RWPFk2c26JWfc954ZZvfcke1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765345028; c=relaxed/simple;
	bh=RjdUMPco4WxmazB92Tg2JkY/2U2jRN0njfvwZ0vZKr0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIAOfk9is9mMt+S6gVHIAVClmeZeTR+wH5gspU8KGFw7gXU3osafL0T1E+nz+rWr9hQtw6BNZtK34XJkPlC5t10EcIJf80agBLg8CWqJUf0hINYGva33WRjaWsNfK5G+yZgGX6T+q7COCptGlWM+pUJH8/TtxNLX0YVDHBEqyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I59ouaJD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e5PJnAeF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LFvj1747617
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nJOe0wpFAZBL7+ZvlDeQpVPLfxt3lz8xcd58DiHPJDI=; b=I59ouaJDjWZ1aeUv
	IknuH0yLsw2peNE+8cLYSLA6Yt2dskn2LF5f4ZSlbb8rJmmbzpoKmfLxcB1cxMqu
	9YcG6FezHh8m9YSwZ4vIRYWd6Sis6EKLekB6iW/fDWBe60RukpqO+NXv5zg1ZhbI
	9CzvpTxQsyzRhfnpXd0GSz3GEhNKKnYc6l8NFZ1SE6sKkGVrGqioQX1M2XX9b/Fr
	NF28glHFWmBnnbym3O7i7tZk7qT4/W/OkfBI/SouG/rBDu8zQOXJMwWDDyrQqYdK
	Lk57KxUbm9mjX7/cyxzNkVv+tZlZp+lj80trVvRAlRRWVsLINMixcRfVdw+LK6BW
	WsVEaA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axvm69aam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 05:37:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29ea258c1d8so33201175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 21:37:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765345019; x=1765949819; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nJOe0wpFAZBL7+ZvlDeQpVPLfxt3lz8xcd58DiHPJDI=;
        b=e5PJnAeF2FlPi7cwvQHMCH5nGfBfld+oLpGdWMzJSvMeV/m9ivSNV7qDJ1KYC+Ktxn
         Hp9YJ/t5LQhkcMe83ymaeW7od7/dXnd84zev8Ez47x/OETabfFCLHYyHqA5k1JCUL40h
         l2MeEKmehmfNn+vO+n2iKGBEzBE5v+zQBNePor0YvnNtae/nVoTP3oHrqqH+C7o+Rjiu
         DP0efpPB77zQuF2nKMj1eZh2ok3Sc+MoQhcV2x4PYnkgt9n9ux2yAZ72IJsMnX15CslY
         04bBCA2jfDx9mYkLXWoDZyWj6U71kAK7cx8GXnA1BNXU+3o+pDO1HX70uzc0NnlAzpjJ
         Rcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765345019; x=1765949819;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nJOe0wpFAZBL7+ZvlDeQpVPLfxt3lz8xcd58DiHPJDI=;
        b=oX6D2i0xiwS5atVlXC4PhPc4NTpBJlPoG884avAADIRz4ZuwGtvqUKMa0c5sKkcO2o
         ooKFoarHix8b2Brquiuh4rcTUCpwPLF3E21BUTw1TJ1zKuh3tAhV6u/AEPgWtAC/yM0R
         /Ra0nAstHb5zYob7UqoYc1vAD3/59HjTbJrUTqowOV+lUkR060kM0VOMjWQbw/FUlrR3
         vyydI8qcDh12md3VlKyT68JwKQYdwku64k9CDdJF0DRnDwASdES4iNxTld03aeicBEvO
         InWtNtwpzlMTRai0aHQ1Ykq77DZEOsMish8acq+ROqXld7TJifbhWjvQesGVe1vR4JX9
         Qlng==
X-Gm-Message-State: AOJu0YzutjZZJCLfnX990tizv69OQM2yLFCaiVyFgcMiFvQ0UiwWUfyc
	4Kv86AIPyT0TxLWGZo/R8rFSqG1M7U4YWzrOy+9fd9/4EOY1ztRfQqxBSHBEwgFsL+VdVeqet7H
	KJ68uZUIbENgmNBoyHzFsNLnAFIMoF7D9BjTit0qh1qfiNBcaXwA5VGcTVjrRYgHVGc1oJCp6c0
	Uh
X-Gm-Gg: AY/fxX67zzf0VWfLVqW1Tj+Pak4wUuS/Rg2L/bhWNHoGgxVx5T3MfERWLUVdYxVz+hm
	gzIzxgctnKWnBl6PXwOnnX7IWqq+tgGmXfHDOnncgkE38EwQy1FmqIvk36aOzgQWGsTitMwikrj
	CQoeiKmGFx3MabuEyvn2ynCVhw/VFClES0V5LsU0/RC4IfFZaCwX1iYdDUjo9MqKTwfLOLfZd+G
	D6BIUDkhwt+Mw0lzRuOMGcRO3Mwf161CSrJzgfmIAEyrNQOergreLqYmqDaVvopAV5tFU/eO5vs
	ot2g1HEU0gQiZw8+/v3OavUearvhRiNPHUBqojNiCZY/HRFqdfaPK8n2QebCR1GgVPnxi/X03AG
	mVr47L466xqk6p41T5MTFs9Yv2OhfzCaGS7M=
X-Received: by 2002:a17:902:ebd2:b0:297:d6c0:90b3 with SMTP id d9443c01a7336-29ec233686amr12790985ad.23.1765345019493;
        Tue, 09 Dec 2025 21:36:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYP9CZrCB3N4lTvlfVYDtv+FZtJV9M9qYdQ+3OGUzttNO0QYAE6zHp4gcRMf0sPO5VU8dm/Q==
X-Received: by 2002:a17:902:ebd2:b0:297:d6c0:90b3 with SMTP id d9443c01a7336-29ec233686amr12790855ad.23.1765345019085;
        Tue, 09 Dec 2025 21:36:59 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae4a13d2sm169256555ad.9.2025.12.09.21.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 21:36:58 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Wed, 10 Dec 2025 11:06:34 +0530
Subject: [PATCH v2 1/2] dt-bindings: crypto: qcom,prng: document x1e80100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251210-trng_dt_binding_x1e80100-v2-1-f678c6a44083@oss.qualcomm.com>
References: <20251210-trng_dt_binding_x1e80100-v2-0-f678c6a44083@oss.qualcomm.com>
In-Reply-To: <20251210-trng_dt_binding_x1e80100-v2-0-f678c6a44083@oss.qualcomm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765345008; l=889;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=RjdUMPco4WxmazB92Tg2JkY/2U2jRN0njfvwZ0vZKr0=;
 b=RWtTtJwOCZ2HauEFg5tmEumny8gk8an+xtmxB5B69DRtEKmWv7QQso3pUnVrT37y0qqLgk1bA
 fbTxmqCZCJDDtEasnTDIKoihiFqaNkRJc8i3bRjYMlBZ964ZfwBzKIQ
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-GUID: bpB7rt1opITbcjmsgTYgexTp_qF6WJ1H
X-Proofpoint-ORIG-GUID: bpB7rt1opITbcjmsgTYgexTp_qF6WJ1H
X-Authority-Analysis: v=2.4 cv=Ztbg6t7G c=1 sm=1 tr=0 ts=693906fc cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-yDIlTExAMyGpBI_tPkA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA0NiBTYWx0ZWRfX3i5OCjIv7qUi
 Kf2JdSJUdwLKm5zEDMDwnejMH4W+gnxeeb9b+bPPeaqwUhZJLJG/srcSGpAhV2Dboy2bLax1AB0
 crlNUWKD4Knqj3nxCLT3ilcA2DFhOw0O/2KRuafdWWLPjnu1fKA++CxnL+e5Ul6Pk208aYCD4+q
 rsYNhD50pd/3Y9OVavR3k+UZKHxQE7a3n6B3UWu/379im31ViTqAADHBkbYcnqGobE+NZKSvlmD
 5rovjlqFAOHnJsP3j/HPZ9Jv7iOFIbgSXB+KtZeFEfhmiQo71Cbn65QaEzpwqpbpri7LGkfR8XI
 XKmAby+G74PLKHxISYTYfm7971JgmlNmHH8X99rxFcP+xUZJEhu3JKJA1NlSJZlfezwckA6VxTt
 wTKkrcth5lEFHQDDDrjJL160IMJP5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100046

Document x1e80100 compatible for the True Random Number Generator.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
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


