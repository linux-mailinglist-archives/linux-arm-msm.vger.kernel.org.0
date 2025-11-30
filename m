Return-Path: <linux-arm-msm+bounces-83889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ACFC94D30
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 10:40:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A1A43A3D8D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 30 Nov 2025 09:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCCC2475E3;
	Sun, 30 Nov 2025 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E6UDl8fw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSchJpG1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28431B81D3
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764495637; cv=none; b=ft64ta8186H0esIAqoSh88dH67QD7sVTtsg2JwNdtY3tcDdS2EbPcGwcVTlLvHpTbXmmib5ATbOZOaxufucP8U/A3drQQvHH9MH3GKPE3UYt6M9OrTRK3LWr7MXCbOxITpm9mAcdnHyW2paWI1gdPesXq/PioBmvENRgS399xgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764495637; c=relaxed/simple;
	bh=PbmTjy+ETQepOxbZfHgrVaFetVtuR3k+0ovTHg5VbUQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sRYe9wc2Ez4uYPGA/vlRmZ7pfGNlU5SxMnNC/hJ/lKHT7O/7Phjx9Efe4U91/9g4TUeWWp6/rVUkaq0rz1KT92pYK0tbUWHirp9u9KVBpXQruipZi+X+E/UquaEJpVFg6mm7n3Dq3guHH8re19wMYNkPJtOHv0iqnjKBJNTTZis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E6UDl8fw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSchJpG1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AU9Z1hb1433688
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dPxDGD+BesRQaPHcSzUf8v
	pWdyrPwpMCMepmPka6G/A=; b=E6UDl8fwa3EKrJ9ovSvl+hvl2N6q4szLTrfGEH
	+ySmoeIpDXUeq4tt7M4QchBmDCWnaUTtlmOnMNy1pBa8M4ZQHBJVyPsXDV7gvWkE
	MIibn2Vzj2KMUq7uJnHgvNNmm0fr18E9U/CFiHZU1EVc60WX6+jdszXfOJ0RZHFn
	oiCtuzeQcaWcx/OTpfnlIMZRv9rA8Bc0vK3FKSPW4jXUYpUAoiJvd0TBeKA+x4ra
	Bmu4lNQ7Z24RbBGVqscd/BDDCvKpEmQxwgPeNOENxmzRJM9+V+cVWLq6EfP+XHmf
	6vpc/c7Y7Ui4tgVMh8L4ijOGUHbqRnMrEvvi9mUzjk1EZCCA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aqs78t0bg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 09:40:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee1964b1b4so41552211cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Nov 2025 01:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764495634; x=1765100434; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dPxDGD+BesRQaPHcSzUf8vpWdyrPwpMCMepmPka6G/A=;
        b=aSchJpG1SVL9u04k9znZJ2z/Bp3KK9/w2Iq21uGL/3wFQ7NbB72+w1AKEPeCeJ9pV7
         /obzs6qQYRgo+BKsZuKBLDEilZu2n7Vjm/ZR9nrQBvWXKhrEkRHYaQSM745YPVSGXtje
         KwYO0hJumerpjIW1/8+hOe/J2z36Bg9tFw+fuoMp4tQPU2lWz1TC4zBeyvOnCdSB7gvD
         8maPamteapkfLgCetBcpHO5B2ndtmGc0T7YWOcnnQMMM1x+Igz6CiKSd8LGGQPXNCeHw
         95gQC9dyLUug0BQ8FsCPY/awQQjjSTSGIXoz3ydTiYe/49heWyjt6mtjCo5+NZBNDxm1
         VRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764495634; x=1765100434;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dPxDGD+BesRQaPHcSzUf8vpWdyrPwpMCMepmPka6G/A=;
        b=vu7uZCWP8/p34ISkLnZ7SipdQQjhXOJG/9jy7HUmod5P5PIxIDu8G75r+fB/bTaIx7
         i3CYd8TSK/HfoEbFZMn/ZrrdPmNOOjlGTnb2y6vAjfmrri81eTC2PTW+TcNQYyk39X8I
         pw2YDRbGQ/kwQd1zAw/f3KbI6saexhf9mGSqYZdVYnuOG01qZouas+jgbDlk469EwJqH
         DHABd7Oq3T7y6tV6x0U00/y8o7lVCv2zCCORVfV2RqhB8OmeJoStsBAFfg3b8joaSXc5
         yBhAYx2+3WAlWP16/471tPedluVFo4QkSWSoQrA9QxyIObWcJaeyG7gkPJcX2gjN2lar
         AM3Q==
X-Gm-Message-State: AOJu0Yxao9FLMmNF63XdJN2yZfEkcIg8+D4ui8clZfb+r3IkjVHK+dDx
	jX1/FMDUz0AyJ0BV4nlzwyI72+LOIarlBkg01AnkoTnBClszGI31A6MwPKlccFE0VVi4Lz0t5od
	l3RNqdZHXWKV8vDchSLzZ6e7AXAhWpH0z2CXbmYegIg+PkbICzcnBKdbQrJVZRJNnoJ3K
X-Gm-Gg: ASbGnctM6EhF87uB+bXhotbvwcw9YDkRC/LZZJJlG6E2Iu2IoIzr20/C24De04jSs0E
	kUpXL9DYXXHmt/Lb1c7XWxHwtjESk8qtUhathDLcop2PC7BekoojhYUIRTOSQqjOvSiscSHj+30
	VprF23duza8yyIY7o+973KJedLSkGZiQro5zUxLj37JfecDlgVC+msQLRpnn5CHcC/GNk/c/k3x
	7jxG9V8Ol7DBAN7MjdNeTw3DQTs7Fwlwp8ZIXOhVFdNbfYfLll0W2gP+QOfmzNUhR8wNL4wv2DA
	tETiyXjgfq/nkUuhDUe83YWd7JJAfTXx75kCbDABqb4U5EJw0if45L4YcnYmL1kJXbXYUDtOY4l
	hWRBRBKOu/xJt9k9e52Ye3siKzwDE+dMRwg==
X-Received: by 2002:a05:622a:354:b0:4ee:2721:9eb6 with SMTP id d75a77b69052e-4ee588ab360mr441278201cf.64.1764495634145;
        Sun, 30 Nov 2025 01:40:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuJwMPkp72CYPeNtS1F/EgCjvp6yvYoF6lUnrRtM3qogSRI8wvYs932iY8WuRwXXhhC/3ogw==
X-Received: by 2002:a05:622a:354:b0:4ee:2721:9eb6 with SMTP id d75a77b69052e-4ee588ab360mr441278071cf.64.1764495633688;
        Sun, 30 Nov 2025 01:40:33 -0800 (PST)
Received: from [127.0.1.1] ([178.197.195.159])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a4b762sm906138566b.67.2025.11.30.01.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 01:40:33 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 0/4] ASoC / soc/qcom: Constify APR/GPR callback response
 data
Date: Sun, 30 Nov 2025 10:40:22 +0100
Message-Id: <20251130-asoc-apr-const-v1-0-d0833f3ed423@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAYRLGkC/x3MPQqAMAxA4atIZgNtwd+riEOJqWZppRERine3O
 H7DewWUs7DC3BTIfItKihW2bYAOH3dG2arBGddZ6yb0mgj9mZFS1AvDREM/BkObd1CjM3OQ5x8
 u6/t+DYnDzmAAAAA=
X-Change-ID: 20251129-asoc-apr-const-f9c768f0cda2
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PbmTjy+ETQepOxbZfHgrVaFetVtuR3k+0ovTHg5VbUQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpLBEId8nNAg33wktfeG6L0uV96U3trZ3/xCwA8
 vfNZE3Zc5yJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaSwRCAAKCRDBN2bmhouD
 10wbD/wMd/LNbQO0hOuq2pAg7amktn5bunE7bhFrqR4WkJOpLVoH6QmPCRazckZcTaJci6Nnero
 0txDq68/8OzgJ0YJdgtStBFAG+bY8RGs/4kdYYaXT7cJB0O5+GE0v7m9ODEcQwIjrs9QaUhGdNF
 IZAjKrfKX234vEzqQVUsTLm8VdB74ruv8A/GwetN6V6zXVsAXfzGXa3IQg2hLI46E3FirLFVN3O
 A+uxKic2eSnkwhsLelOCSo7mjZ8N0qwY0H2xwYGTRvYcHvQwqxiVrcQveTwaf1+2XRLbPfHjvp4
 opJRm72Lzz7sRZIeBs7E0RmHsTcz/KjBBDWn6aGpG60uhGCrinYdC5vXquHM+toXX1MA7b7EsgD
 8k1CNd4pluWnkbE3cC+le2UC31YoIV0MSWtxmAQEICrFjk0Unj6nWvF9A1JfteUknUA+ZRzI0Ql
 5G15QCypL2ig5ig2yOz+p4EF+JYpf9s6kDNn8X1c1NWfojJr4cuwegibQPoKX3T0dTOCSltSjHr
 jkgkjan71oCflG3zAtjvs+aWijzciv4S8vRPxiVySPksQIo+dafmSowygkzzAstia4K5/HWkZyk
 11xzYdvBFAsNd/gGLnBrkJXUF4xGHp4faZNyRQVHMhhDLxyfCcorl3m+A4VeJf0vV/sDiRLYp2H
 VByBftqNkdYBUQg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: GYuGqZkj2xUz2qbJPGBTCs5o0M1P2PFQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTMwMDA4MSBTYWx0ZWRfXwCw55IfacwLp
 DO2MonGPr87Ygm80IcHu4O3s054t17LYiIe2CN/EyDiLstW6rknVUB93a3ZOx1tiDiIV3Els5A0
 HjcrS3I/AavqQqD+hDAC9qzKRZbT86O5sQDEGGjqaX7rgHZW6fnr8e5aBvSC/uftFRcpwM+rCFq
 9Wp0lTXP/g79umn/2REv8SYVFkS1d3T4XSD13ylMReYv54FMQPLj0IqUUaLYV7w3kBt4bMPrSkn
 +xmcFlzCqDwzYQ6dUgKSyui+PWvjDtY5597FNWLC9xLpks9DHgwLB2K5+P8Dw+p1hEH1k5EZbNf
 gmdOCe/lHzlkJ26NDv9eciqYVCqGZltLITfqfrq4fSyICCtP3nhcIW5xNvPzPZ3Dm403NNcRE2H
 +qBJzAqYb2a2Fw/YTq1dxBS3Y2gFEg==
X-Authority-Analysis: v=2.4 cv=FdQ6BZ+6 c=1 sm=1 tr=0 ts=692c1112 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FPK7cjBCgYbqzSTDLBmM0Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=0ZkgZBROGDsPMO62E2AA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: GYuGqZkj2xUz2qbJPGBTCs5o0M1P2PFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511300081

Patch #1 and #3 touches also Qualcomm SoC file, so this could go either
via Qualcomm SoC tree (with Mark's Ack) or via ASoC tree (with Bjorn's
Ack).

I propose to take it via ASoC tree (Bjorn's Ack), because I am
constifying things there already, so less possible conflicts.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (4):
      ASoC: qcom: Constify APR callback response data
      soc: qcom: apr: Use typedef for GPR callback member
      ASoC: qcom: Constify GPR callback response data
      ASoC: qcom: Constify APR/GPR result structs

 include/linux/soc/qcom/apr.h  |  6 +++---
 sound/soc/qcom/qdsp6/q6adm.c  |  6 +++---
 sound/soc/qcom/qdsp6/q6afe.c  |  6 +++---
 sound/soc/qcom/qdsp6/q6apm.c  | 10 +++++-----
 sound/soc/qcom/qdsp6/q6asm.c  | 10 +++++-----
 sound/soc/qcom/qdsp6/q6core.c |  6 +++---
 sound/soc/qcom/qdsp6/q6prm.c  |  6 +++---
 7 files changed, 25 insertions(+), 25 deletions(-)
---
base-commit: 8db0437c888596202bf1b996d6a152de3f83c4e5
change-id: 20251129-asoc-apr-const-f9c768f0cda2

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>


