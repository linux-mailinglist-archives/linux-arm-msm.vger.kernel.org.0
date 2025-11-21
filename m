Return-Path: <linux-arm-msm+bounces-82808-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA92C78A28
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 12:03:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 37A5E2DF9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 11:02:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255D2347FED;
	Fri, 21 Nov 2025 11:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPyEXWeF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7S7EC4+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DFA347BC1
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763722896; cv=none; b=Fncow1uwH1SYgxLXWLCZNckRM/SXXdjzhfY8fu2wrwZ9Dpc7cq6Awy5ha3RZ3DoSk91kQM/sB0/0Efd5Yl9kYh1ODsvBLM7VEj9DXAYzYSBYE4E7O8wzLWd0ivxHLRqM92Q7qgo1+FmJe/+lyRasABMuDtkGU06Kf5V3lrdpfgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763722896; c=relaxed/simple;
	bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W7XaeNueca3XjP2UsQ032XfxqysAmpDZqxtOmAf8LOWpwpOPHxn09g66dBqpOjs5sq5blOd11e+yrXZMefBgNs+2IO5cpeJmMStoXQylcLfLl7WChpyrVvamP3RidlTly9Dyw4RFsMIl+9nNnkYw48/3t7sfSqaLoDbfLdE7z2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPyEXWeF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7S7EC4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL8rWA93675867
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=; b=UPyEXWeFnox++Jps
	4cfEqE/nV4MKjvb9BL17/4ELkBp05A49z4fXHO6ELK9ksdBkD7oLWttxgonY1QVT
	DIkBEp/SFXJllulVcYRyAcFHiulxVVDyUmgUnKr/o5m5hXbOqB9AqRHFNYojqxvM
	OMmhWYRtXbZK6TbnzwbjQNADDvsz7DL3SXCFqygFtSJFKrgk7SPfXjh/StX3GMKt
	ql7MIm2qNx4fROaSp3+L36b6SchOndqhS9VRcLiRYeF9EWIXxPpRu2iDfgRohey2
	CRJCPLSc40gO6c4S2D5YWa1rWbvyr2zEJ+mrspLZHi/8AFRauP960K1VEX5C8qxk
	sMZbpg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj8gm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 11:01:33 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3416dc5752aso5612326a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 03:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763722892; x=1764327692; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=g7S7EC4+IZfVvgnVU0b7MQ1dFY8So1yeAqbkRpxHp6x9Fp5PGdjWJmVrPifZ9BtuSI
         DHXmdTYAP4ssdinDGV2Id4ric3hW6MoazoiK2jIYVT6x5xemrKGQI7CfvQ+vmz+5IrMd
         NjHSnTmM/x7CISzm1kyGVhdNzIqRcsCaCrsFXpeGd5sllgegJiS53UzGwRisGx5wEX3S
         gwj0PvtqxiEbA/e+Xxh/2g/IFDoC7c/gZld9azrp8ptFsqwl5JUt3wPjznKyU3WkL+Q1
         cPKNOWYDAAvNU+7OI1Arl+xaDDuz5M+t+in5RzyeTJOgnWPvTP8oyvkIAeQkIKK7vAY6
         QdOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763722892; x=1764327692;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AR4qgOv39nCgYv9wQSzT0BQbLvoJwKdb29TlFdA6Xsk=;
        b=OsC9FL3YC3B+bR3kiLe3phNks1Vnen1MCnZCqI75pS9CuSeE9JDAE/yOsI9P3nqW9e
         SppyV4353vU9mnGeQKC5TtKnMXg4VWx7hD7+RpkZZSeEDLtabe4yPYA7Kgj22Lij0+xa
         8D8RU/5aW64Ey6JobpbWHYmvrxZqGguTGsXsu9QcaZCcuI36bSAWrLhS3tz7bA3kmY4F
         VTbkgp/Yi1E703bQ8TJB0vM/VTKWktoWS4i1emhAplnKcd4Wu2mjKTx3WTCLbDxtMKLK
         IlY7YP3YobDdOYhcy0zy+pFiENabVtIknfHljTt02WNGmFnFikV+OVmzZ4hoXGASGAg6
         wEWA==
X-Gm-Message-State: AOJu0YxYnLR77o56i7JPKel2DPKrWha89pkicnXE9y9cVJyWYhIHqjAb
	ncsBsrW8g/fs2KgGA+iyy/5TX+EIkB2GwuO5otnXNJjBoi/7OMeCTZpBv3CUJQwXerGIeIFiysy
	7kuT4OhJnrVAYF2JJ3dtgiXdTHKhRzDnAlu7+VTi9DoXXGWLIXArj2sxViOshVgh+eXcO
X-Gm-Gg: ASbGnctYN+I+5pQycjKwHHKnyJAh3id439uNDrsPFR4KQhjmt94Y7N//OmQrEYus13k
	CxJLvlUIOsDW/PPpCM9mli7Q+BwRecGL+xFuytJTwfTUmNbsmq4imM61s/il0XbRd9CSXkGh2Z5
	oTwtAuaLvS6qzc4bFtKiyOEn7LSp7FmWF/xKc3sUHMX227CfXDiBP1qzvshlgX/bxr5xuOC2rOG
	71tJdNwHmaIDjFrFSdJUesCd2FgGDpg2PDN+VrVFEZOZjRMM9aJzfnMp8dhZx+JOQvRIsLNhAl4
	0uxwCLhVNJddVPJ0CZKq8ZKPmZ+U8iyGIYjBUIVVDS/8BZENAL+4vDDohieZfVedQrKj9ieLK2X
	wmyU/zaKJHvI9z3k4Uw24Y4PtwUYFx+/aM7xp
X-Received: by 2002:a17:90b:1c01:b0:343:8242:fbaf with SMTP id 98e67ed59e1d1-34733e78facmr2353052a91.10.1763722891807;
        Fri, 21 Nov 2025 03:01:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGruYPbxJ0wdUplhScy6yWFlNJDGF+FcjwecZPTTqfMzUPmK0CRo4jwMemUW9ciMslbAW5Aqw==
X-Received: by 2002:a17:90b:1c01:b0:343:8242:fbaf with SMTP id 98e67ed59e1d1-34733e78facmr2352978a91.10.1763722891133;
        Fri, 21 Nov 2025 03:01:31 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34727d5208csm5191165a91.15.2025.11.21.03.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 03:01:30 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 16:31:04 +0530
Subject: [PATCH v8 02/14] firmware: qcom_scm: Remove redundant piece of
 code
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-kvm_rproc_v8-v8-2-8e8e9fb0eca0@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
In-Reply-To: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
X-Mailer: b4 0.14-dev-f7c49
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763722879; l=906;
 i=mukesh.ojha@oss.qualcomm.com; s=20250708; h=from:subject:message-id;
 bh=4OHWHDjFq2jAK9+Bld2fkj3MwlJ5JU6OOThT1NP9j4s=;
 b=dSHngmywAeCxkVUyGHNZ52W/H47oY9IZYWvOLGsaNXZVJ12FK4UbAJpJe+SIIuVo7yvE6xIhU
 LVHtc8fpvb8ByZ/ZaloRyGt2ND1MZX0KyqyNBk//tLCaQ/9Mrefx7zF
X-Developer-Key: i=mukesh.ojha@oss.qualcomm.com; a=ed25519;
 pk=eX8dr/7d4HJz/HEXZIpe3c+Ukopa/wZmxH+5YV3gdNc=
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=6920468d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pWxEDRe995Kf1ot4LjYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA4NCBTYWx0ZWRfX2DDuML78Wkb5
 VnqDdRjUvxYHKHBf45S90UjNv/p+awMg876X0BF/eB6ODoV8odnP2yssgNRf7OKUTpxddY2CpkJ
 uIDfFAizQeLahTH+/CYGC6toNost6n15rePuYHb4sthj50zTgqSJZHdPeop6EolCNodf3YnaMYh
 D4eYaTvdBv+TYw3PYWGcZgXF8IUKgijHLHIFCwvWy+P5Ph/gr9FSicfUcorIDoTkOGE10Pi2gKr
 PX93eIOnkBknwCpkkcyw2B2ZzET/9HHlELT+b5T233N6bBh66ZQSu6UZw4yZiKzWmyCDAzIeE9h
 d10MCM/6Md6DyXLdotnl8A1EYiB1kzvEIFlPc6q+CZdocEoZDC68RyuO2Yw6/EI576LkpD7D20R
 ufiF709rFYIMxu8A5VrQwFnsNXqymQ==
X-Proofpoint-GUID: GVBsu0q4HNMcUudThr6qUxqWROCWkpgm
X-Proofpoint-ORIG-GUID: GVBsu0q4HNMcUudThr6qUxqWROCWkpgm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_03,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210084

The qcom_scm_pas_metadata_release() function already frees the allocated
memory and sets ctx->ptr to NULL. Resetting ctx->phys and ctx->size to
zero is unnecessary because the context is expected to be discarded
after release.

Lets removes redundant assignments.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index e777b7cb9b12..26969bcd763c 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -650,8 +650,6 @@ void qcom_scm_pas_metadata_release(struct qcom_scm_pas_metadata *ctx)
 	dma_free_coherent(__scm->dev, ctx->size, ctx->ptr, ctx->phys);
 
 	ctx->ptr = NULL;
-	ctx->phys = 0;
-	ctx->size = 0;
 }
 EXPORT_SYMBOL_GPL(qcom_scm_pas_metadata_release);
 

-- 
2.50.1


