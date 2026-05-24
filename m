Return-Path: <linux-arm-msm+bounces-109522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id pBHxBj9XE2qA+wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109522-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:53:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3A85C3F5B
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 21:53:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C9BE3028B60
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 May 2026 19:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E08C314B95;
	Sun, 24 May 2026 19:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LogcTLjl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCrai2zR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EBD315785
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779652176; cv=none; b=cLdp4kyojPWHJyMjQYVC27Ps5bQD9+7HSAItoPWZGIHBk0x8HLP98TAzEfOUJj0sa1kKCeqsUZdPGRQcCpN504gQwUbNbGBR98Rekb4z863CftcaHxTa3Jrii3uOCRGr2fetieUUn/ZuN7dQgDv7QLkSy8kJjeZtx8evx+xF4oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779652176; c=relaxed/simple;
	bh=mjrd/5WRTtizVxAileTEcsI3Pcwm5BCTvACtsLVlxwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d727FVdU97h7A61bN2lOYE52wwMxhvLdcJ+EHr0JzBeKQ4V1icH3oHKA8Y+COY3O7xazYyEE3IWDfa4o3hXSPiS09JU0miQ3o5fVkNjqmTkyO9fVWzT2Ybha38XAVt941OvP0eg0SnpH8/espQtrfAtXSwOVtCy1IR1M2rwre6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LogcTLjl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCrai2zR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64O58j5k012691
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=; b=LogcTLjlntl1XNsc
	yeqnh5YMUmrxODxq2K4HIRtiksiDZITDHIaGV2J4t9Y5hap7R8JTPgzE3/3zh847
	okoZWGj2T9vhrc4E1t7DDHPjAV9Xw2dJ1xIRthgqd4vV3bRQby6E938tsdcBswku
	ir4Gxrq29FQpejJkxccMOevias7ggrockSi12sM/dZPoLXzxoglSNDJFuIlE6Tgw
	bGW6ISeYds2l74VCrjo6qMGtao0qos+n1jWCpYGoxreIQXi6N7s8wLMooTXSCqiC
	uxLeeVi71KUXy9+d2WZyTQGScNJEkF3eQFU0nDDaDf39lrJRuM6SwdVdRjRwsEdx
	1bIK5A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb4m7kure-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 19:49:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3684cb22502so8139588a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 24 May 2026 12:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779652172; x=1780256972; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=XCrai2zRaSx7adJ2I4QNQkfKAXwE71GguAkz9Df19yG9l1i/Gs6HYX6mg5nproqaxU
         72WHgDwn+PUdKdmjETF3YvwEAO+vu9cifWUBYk4OPUXn+uqjQlAwoglMLcq7OSvvA5Ta
         M6CwTpmplkSOxnhtLXRwAmXaxA339WIDg9H+4OsWR0fN2lFy6MZQpjboybQsZJtQTPPE
         0lnqQglccMCWvvPjv9gkJueJMQ6F9fPJEqynM6QG6CFfaPNdCEzSFrg408HPyLLh2Acv
         5KHmg9Ef8UWdi/xnnHqhHsht8I9fsQitgeS9EBfMvqOjpqV7cautkmSIe+gs4q4AKpXd
         zhJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779652172; x=1780256972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kf8GN87yWQbNdh+TSO3Lk6k7qhp0/6Kg3q6wFbgg+3o=;
        b=IOJ3oZDp7wS4r2fBGUqrM9PFdrHhbyxBhjrZVG61vNxGX8z69tdlqqvgFh0Si5oN/P
         RAYmFQElMwGdUbR59OBxZ8NL1Sa+qOfBuT8/AAJdZgPlz3FAE2EiGqKOu7JiossmwzjR
         sD+DqgNrRvRvbcB1kvntaS2zNCuCjRWfr5dOG1BbOORpQRaGGZ9akEvxlSzxgB46xSA2
         evAtEl2J607ZVAndd6JNnZ730KuwRt2n8lXiZ/VQG8jrG1AGXkwqCwtaF2gb5YRQiX44
         zHbE3DM8UpS+VclTdZtdBa1mgtxHTty+j51XIrpSYcYApYhOXDrRHABQAlT6POpCiSDU
         lACQ==
X-Gm-Message-State: AOJu0Yy4lXvZfrIvV5SBZfPuuYmvCjCjUzvCXWLJ+rW4ZYcEkfhCIO9q
	/y8K2lf11gZvs7rmYXaBSBHRWya+YSZsfJksP9WpLohamrFKXMw5H1ZSOhpoJzwOXB+bEti3PpX
	20mSboJf6ZMZjFK+SuPybZzTP8YobiqrsUSO4EWqxGa/g5EZr/jdTy04Jz6wAJEfVSpYXSz+ke4
	B9
X-Gm-Gg: Acq92OF4XrGyAVMSEUuUynYnApQRyNBbbjTTHsp2Yq44EdZTddPRoW5gakVspH2lPQg
	FPXmZtGghk5VLt8Le4KNcQRvQy5QGmQxSnpl5eEWbu4lvuatbZnooAqN1+eVuiSnBnK8WBXb2sM
	laKDtlOZEKWfDULR8B41nF0MTudXFuZXYzLVN93NTN2Ke4P1jymksvAXueY9Uuv2NZmFXpnmuDf
	qhbhlTflq84AqpjxxCE4HObsa3G0C91eSX7K7MUZ2EiKr7/dt/xymds0jIf6BL8XFSm3fAWtbH/
	h5jHkldHAKPSbCUDNUHPpyO9q4byrjb6FW48Bboei/ITYIkY+qGZpGZ24JefdI1tEWvjB8cRAeW
	vVqx/sKdM5C4FrdyLkAV6q8vW+nyOmHZluNSX
X-Received: by 2002:a17:90b:3bc6:b0:368:7327:6326 with SMTP id 98e67ed59e1d1-36a6741ecbamr12524821a91.1.1779652172276;
        Sun, 24 May 2026 12:49:32 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc6:b0:368:7327:6326 with SMTP id 98e67ed59e1d1-36a6741ecbamr12524797a91.1.1779652171688;
        Sun, 24 May 2026 12:49:31 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a6c21d4a2sm4725849a91.1.2026.05.24.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 12:49:31 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 25 May 2026 01:19:05 +0530
Subject: [PATCH 01/16] dt-bindings: dma: qcom,gpi: Document GPI DMA engine
 for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-shikra-dt-m1-v1-1-f51a9838dbaa@oss.qualcomm.com>
References: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
In-Reply-To: <20260525-shikra-dt-m1-v1-0-f51a9838dbaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Xueyao An <xueyao.an@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779652157; l=857;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=JRwNa7gj/V38SNuXulP2MlFnweDp961hhJdbueICCwE=;
 b=SJMty0KWOEX6DjZ0a71oPFOwID0hjCec2SeHsUbInB/1OE7qDGKizj3oNha3YZZH6bSMaZrvj
 cv5jqYpiPCUA39iEcakFA60bKj9Q/JudQ/Ojlo5t0q16s0LLJdA+U+k
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-GUID: ce02C-NgmwFuhZKR_3-Tl3nFyem_cwiT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI0MDE5OCBTYWx0ZWRfX+yDFYdfCQTmG
 ES9pRc/x36WAWOW6s7TA4aRhHwlA+opENd0bWFGHXL9vbuxmqDqlNTajK4PzKPtRLig/hpi07rH
 BggP33HBdtAcMPlcq5Ls91hSrxLNeuLQtfdEfKQDXDMlnDNenA6jCUtIbzg0gSwaCRHxV+cEhzI
 y2BnIUtwLhg376FCu71JSrYwNKTgP0uaNt9dTDiSvKnHNbKqEDSp3hdfFOnB3oBNXInk/2fXLCb
 Oq9xFX+QxV0PqJgFBGhBVfg7UZSuXT2tMk0U9fAk4oEhDnNkBJdicBBGu2x/do+e5CoyNai2PCL
 vCoKmzKrMGV16AtNj+kZzq5h4InNy3/tlzV3gL1/omodd83tvMeREOZUmCR5atBAYXjXFSdOvrq
 8GN+M51YYiuAUyjZb0Q8ypeLFW6NOCnxQ0yUw84sa1vMu9Y6DYOUuRvX68PHbdqjnptT8fE3b4A
 A+SJrJ91NtiCbv3OwyA==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a13564d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jyTGefxJr8I4-3Pae4IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: ce02C-NgmwFuhZKR_3-Tl3nFyem_cwiT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-24_06,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605240198
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	TAGGED_FROM(0.00)[bounces-109522-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5A3A85C3F5B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Xueyao An <xueyao.an@oss.qualcomm.com>

Document the GPI DMA engine on Shikra platform.

Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/dma/qcom,gpi.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
index 8f9a552fe30e..54dca623223d 100644
--- a/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
+++ b/Documentation/devicetree/bindings/dma/qcom,gpi.yaml
@@ -37,6 +37,7 @@ properties:
               - qcom,sc7280-gpi-dma
               - qcom,sc8280xp-gpi-dma
               - qcom,sdx75-gpi-dma
+              - qcom,shikra-gpi-dma
               - qcom,sm6115-gpi-dma
               - qcom,sm6375-gpi-dma
               - qcom,sm8350-gpi-dma

-- 
2.34.1


