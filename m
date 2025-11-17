Return-Path: <linux-arm-msm+bounces-82016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C76C6258A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:53:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E99934EA092
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 04:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 101A030E84E;
	Mon, 17 Nov 2025 04:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kvxbd9HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BB1vSuZW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7617D30E0E9
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763355092; cv=none; b=hO+90sb6PM11LzTpOqksj/ADjPcLprCKBp946zUlzWNROeG8Duc6Lbr3mlHzVjaQexUs7T8+6svT9e6ZBHiZS9OcClM6BV0E4MhsW0tgd/Ioz47qR9kKaxvMQfDjuZZc0j39Dd9FN/CBZmpqS5imRmtGgCK/pkCPsn662CzyNGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763355092; c=relaxed/simple;
	bh=P6chIfJZBOcYQD4DaK/YEP6XdBDIdKbRZNwrEox3PKc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCZMAdasU4H3PkzG2a/eZReqOGE+xM+jC8udshutR4UohstIQ7QTXiz4M+5CybHR0lfGnwk98IpW70SxCUvf1IWUzRBZCaasBFHWp+sQ06OQ9fnAFou2QJCPLOrm+gTkcnYoR2/1QJM9LMeV0O/9Unl2XgzrN7FrcuBJuNlVF6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kvxbd9HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BB1vSuZW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AH4nxY43266155
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B+x7Xi4sjfQb9nG8iH8KEPbI7AxMPO2WBc8ToNxmPcU=; b=Kvxbd9HHk0EpU4Ky
	EWpqjwZXc6Zsgz12FtkYfqDuTPDRFlt6sDBHvTN65GbcVkIQu8gwDiQ+p/rdYC8h
	vbZy133mwoXnfMhWHLiFvOLO2BdzmdN5k9eixvNw2LmH8WoeHtV5cw3eGkkktQeD
	sf4+ZBn3GShAhwygHkjduAVyFmXCKbL25KCrFtQGU64muH5V2IYdmaOQYqybaHcS
	coBYWgI+S1qSoMpa7IBaNsaz7NxjNPtfjm3SMwdsA4SCjxOjDsE5rXxbAWJNQoKI
	mPSHTm0JOhEOIipAj0tYmXm4O51+B9eFnZBwaeQvKcfq1Dmh9pvRhPyC+YwCX9PQ
	giVTyw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aejh33cub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 04:51:30 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955555f73dso40689845ad.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 20:51:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763355089; x=1763959889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+x7Xi4sjfQb9nG8iH8KEPbI7AxMPO2WBc8ToNxmPcU=;
        b=BB1vSuZWJlX2otPeLNH4X4p8fViToG1sgMEEr6+ud3n5DZ+D7PwOQgMJSW8E6u5CDV
         UJZMs/hvg9TXHEFPuCyB6Ye6vousoyR4mExC9K8GBL1/xf3wmhcLlDXGeybNIb8cY2Fe
         QqvXDDDIcVJ3DCuKJfU07efUysp2gLFShyHLL9948KZrLEzCc76IhniMB0hIZuKDvetK
         csXsHHSalmkAx+l5vfq0AsqOe6tStLrA7QaZz670bu+07w7wqdn+VwEHxFHQbnnLQhvz
         FwPOYPp9/CwGZ9G/4PNV9EsVFLgNLeRTESPe6B8s+22ObALrxzecgKBFCd/YU/rt8EMU
         nd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763355089; x=1763959889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=B+x7Xi4sjfQb9nG8iH8KEPbI7AxMPO2WBc8ToNxmPcU=;
        b=eUL7u8hwy+9zIRrkVq8s1Q+dJay6t6ljYCXAcpMxu9DhCoVDFvBPQQeehtxd0VPfX7
         oaMfb+dqI6eLyLmf2a3VldH1tsLW3SUWWANHicROmZMBFwo8ZH/dZBt8KrUHUEGy81aL
         MOCbeVMParMDMCNBFwC6BED6nHr3KJmxpPHzDHYFp1ochP5d4igAsJuT3h6X1c7nJgZp
         iG8+qVRHEAhCKdnZO0BW0j42JKEvXBWkzmlopR3z0dD3PbYhPOByXwIv7THSolrtfGEw
         /05TwJfgswrADQuw2PBW6ANifyye4J7eVodgeFh5i5iBbRyNL/ppeqUOx2JzmcD7fAE4
         It+w==
X-Gm-Message-State: AOJu0YwfKh5C7x0mR2VlI3UUxRvVGDB1gcl7h/D8GHyQjiNzbJpvij8v
	gu6mOjOoziHiloGDPK/lIKVjBYaut/oGKG4HS3nPnGD5TWCeVNboFa2HdBPZ5l8F5yhhZUJ1Ffv
	kLOOHOYgyqdWmLZMGkiuNg2mPdxVEp816HQkZt34ZRlQnDLmJHNX/nmpTuYUslYOnQ3AP
X-Gm-Gg: ASbGncsHE7YVFK/yOhDi9K9m4rNkchiYWE5lSYtTfmPeJF0liaOldkagDycU0ooBS1Q
	OvtUOYjQs6utuJ05yMsgawi/xBe3HOSH9SLfDfTDLVn6QNbwugFe9hZHnsx5pwqj7S+lN3oUicV
	oXInjwc6VkJiLqqFqXn18bmc+JgpUGjbOrXuFVloAeruPsC6GzXu944NnmKi0xw6mjQ6JN6LPkc
	4sk8cDxsN8JALApnpzyRFbO4HrWmgyYCqgqeJg7fVuk0oPYxluhVSUL2BDbFVMvqjMz5M8w0hGq
	4+L9S45wV1+aYfxfRN4cNK94N5rMH66m1ch8xithD+QrMmAzadSd9JYL5bAZw+7pqgXfwRjj2CH
	Ntyo0pE1+CYK+naDZPA6sCrZJI4lnEwC/FGZEc2RF7nST9QBqQuThLQVUl8hcz1YpElJJBsCSIn
	P7CFxAy7brw65rriFCK7xtil+L1LbQ4ny/N/aA+NjqVXZC
X-Received: by 2002:a17:902:ef0b:b0:298:1288:e873 with SMTP id d9443c01a7336-2986a76b819mr135658335ad.56.1763355089225;
        Sun, 16 Nov 2025 20:51:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFV2s6cllWy1tIRJMaD8BG+c3d+rnVla+hDI4Lo3cWNUxb5oJAt0Uai5Uhx9TfcT9zJnYH5Dw==
X-Received: by 2002:a17:902:ef0b:b0:298:1288:e873 with SMTP id d9443c01a7336-2986a76b819mr135658115ad.56.1763355088789;
        Sun, 16 Nov 2025 20:51:28 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2346dasm124187105ad.7.2025.11.16.20.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 20:51:28 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 17 Nov 2025 10:21:21 +0530
Subject: [PATCH 02/10] soc: qcom: gsbi: Use __cleanup() for device_node
 pointers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-cleanup_node_put-v1-2-5f107071d171@oss.qualcomm.com>
References: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
In-Reply-To: <20251117-cleanup_node_put-v1-0-5f107071d171@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763355082; l=1129;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=P6chIfJZBOcYQD4DaK/YEP6XdBDIdKbRZNwrEox3PKc=;
 b=f5Lwz8jctKfujJle8RQ1jpVUuxKeG5/ldFEK8tpVjoeOFKHqWAf1bjyErgHFWPLp8l9Judupo
 eT9/52yoJa5ApE4ck9kJ6NF6dzp1zoxm51XpKdQV5g/gHOP7M6j939g
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: WQx3vbphI-xGYflJGl8ahphfsVGWcMjp
X-Authority-Analysis: v=2.4 cv=EtnfbCcA c=1 sm=1 tr=0 ts=691aa9d2 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=oHaw5SsapPdv_VskyekA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WQx3vbphI-xGYflJGl8ahphfsVGWcMjp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE3MDAzOCBTYWx0ZWRfX4nK8lsZbxaGI
 Ouyd/Ihthmq6PNzzb3UzTjkTeCswPvOzqrqzPHfwxLIkpj72XiO9yXGie+uDqCaUr0Zuvprtl4A
 1R2YNtp/unGa1LRiun+3J1wHUWaQwNR3KcSUgNi4RyTy4zJ3ZPbLBA0PZ0rcgSa75JLEq3WJidq
 516L/m5kGf29KTv1rGwqOYqXl6I/VPPdnG2Zx0AgEBLBNob2lObvhvk8Xy0foLfYfo1mtJOFa4S
 J6MOJL6bmzsYTMFDFI4LXBtaQ8eKtBDZN/bG7ejbkz/huxlEO+3FlPogqfvW+rDxrsA9FMG+NIJ
 zlyFVkDie2P4z2Vor6aPC+i4WniVTT1MOHfHxIMPfRu9ett6qwHhzOoPDCtRox5DHTRmhte5oUC
 C7ATR4ndhV5sFYab9Cf6jJUdIl8tig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_02,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511170038

Apply the __cleanup() attribute to device_node pointers to simplify
resource management and remove explicit of_node_put() calls.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_gsbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/qcom_gsbi.c b/drivers/soc/qcom/qcom_gsbi.c
index a25d1de592f060bbf6e084bd412e3a1ef47558f4..4a195c39e223c1f4cda1becf4542d4c8a79ad688 100644
--- a/drivers/soc/qcom/qcom_gsbi.c
+++ b/drivers/soc/qcom/qcom_gsbi.c
@@ -124,8 +124,8 @@ static const struct of_device_id tcsr_dt_match[] __maybe_unused = {
 
 static int gsbi_probe(struct platform_device *pdev)
 {
+	struct device_node *tcsr_node __free(device_node) = NULL;
 	struct device_node *node = pdev->dev.of_node;
-	struct device_node *tcsr_node;
 	const struct of_device_id *match;
 	void __iomem *base;
 	struct gsbi_info *gsbi;
@@ -154,7 +154,6 @@ static int gsbi_probe(struct platform_device *pdev)
 			else
 				dev_warn(&pdev->dev, "no matching TCSR\n");
 
-			of_node_put(tcsr_node);
 		}
 	}
 

-- 
2.34.1


