Return-Path: <linux-arm-msm+bounces-61792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E62ADFF19
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 09:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A0DF1188A6F0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16D125B69F;
	Thu, 19 Jun 2025 07:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdNkR93b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C4B207669
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319319; cv=none; b=EwSVi0XRIA8Inid3O55PXweFgCcWVaH1s8G1xyKiclUwbhgRVCPHaC2Sju0DYYfAql1vm8BBdx74JUsGlPAiL/7Vy3sWIdXqESOVsCFNQiYtTYc8Dx98kQ9FqPi3Y8IhfoDQZmCq6mAlG1riL+FBJyEMb9RqQ575oFhvbTIsqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319319; c=relaxed/simple;
	bh=U2STGhzIXpultd/ZiNOod4EPJT/hThpae0fjp7R5nRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DjD9e6KdKsbzMlub3Q2ItQx9RSC2ulYeJtV/RC5xQXeV7QEpGjYUlOJ+bLFG9hE++a47gDjSns28fDUkjvZlBeuRBf5MphQuRjfmfnz0xjoa07uaU5BF9AwgBe6J90ocdK3yUnF+t06NwxjUgD9j2aIO8Ar8D52U93w9Wudiy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdNkR93b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2FBuU007541
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaK
	kF/g/qng=; b=HdNkR93b5bYukRDiPUxJ3ZmiXkykibBfhQdNkZbNCeHMH0IlfJd
	0nlgEfLTz6RIW8VTWJcAyQU48ahx/EHJi8vo5ptHbazBubLEC3gvFSRIIGloXm+g
	jWDhcu4KybyGT2d8ptyzB8esuoISJh/2mJsR8BeBIkrTRSaxFVWAFc46cfEJQYb+
	GOg69u3xGCDb8vTEOJ+ibnNhYbQDANB+qfpJthLJAwbXrXAknCXvD2uomO0GZlZO
	YIgPJTHARuLeC9y/zfdsIeUmGNOYaUDj676P+tc9RTvurpsUeFVcl2d5P6xMdCaW
	sjvj3cj88Iz7Vh93THHEU4D1mYxo8VrVWdA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krrvk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 07:48:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3d3f64739so126996985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Jun 2025 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319315; x=1750924115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaKkF/g/qng=;
        b=ZTB2taZ8BaHYbxD986fC2PGpZ+PH7LicqAGJLBoiP2Z4nX+2iuFuLcWcgcBS/nQPST
         43taz+t7L1zmcoUuDtyi64Z9Zd75q7puQZpsRNnY/2xQY8DrnL4ftGkY/oU0btsOuePZ
         yClevUit3tH54Os4IQtkow90+UdSUsDm0K1D7fl4vf6VW36+JNZOG3xhXoIfl085NAqS
         SH1AD7+V6Gn3gwiCBO0oMUOGvme+SrSVh1jUh9zf3ULWNZpjeJQBzAMVZAgCHM+7UjQX
         X7VYmLYM500H2/NhXY58RuZ5KrCVfvn75CcoDX8jhrSw5RNaHXPc6HQFxpnyq3OxzvYm
         DaRA==
X-Forwarded-Encrypted: i=1; AJvYcCXfQxvWt08/No82qK33XCd+UtSTMiI9/jJq9RAT6lzTy9i7Jv9UoNpyQR9ppSOq9oNIqQFn8uWUb1wAD205@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAsnQUXhHvhDya95U2GvS+oaO0M/8V7nVG3139VMk4fjv+Czn
	vE0UhSLq9TTI7R66IyHP3f6lxp0W+gvV0ibzFDqxd5+18JGbq66L/rNPXkf3e74I3unU+t/eNdS
	kLwunTKPGlE/3ewyTR1sYLDibrvI+0iKV4ExliM1IKx7BuPX6Ii8JSXZtWBdyhcSFCSuf
X-Gm-Gg: ASbGncuTFLPdBCH+xnWLqLnJuvSCoz0R/osw4xE2GMefnwJwuHRnimoqcdnkjg2PzbD
	Mahn9Ghx+eD7b6HFct7QJ11yKGfpVGhLmhCXwonxII4PGVA6s6/sVZC2ahaQ0/5Icdegl9L7syl
	0Z6YGppTAaZQGcexXGZ43BSOF85ke0gNqhnlRiD38XKcNw4aEHVM3wGpdeNSO+o2o3U3L99cIEX
	f4l1lw0vSI8Dn0W1SkbmWcLloZJF1bmq9w7NPP0iYHZyPkuwgoG/m2Omk9UlyGli+fsITAqwQ2G
	FIpaSxDmWldw5gttVYd5wVNvWu+wfhF8/tHw1jOe+lSVbFbQT1KXXBHwM0SsfcD10izBXHnDCHV
	h
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912747185a.27.1750319315592;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa/bitPn7p+wO5BNUxje2vR0gnJrH2y5gFcyJKjUCeyoovv+2bLDtbOLvQj1g7gFSI/tM28A==
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912744985a.27.1750319315088;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm19107586f8f.36.2025.06.19.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:48:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 19 Jun 2025 09:48:30 +0200
Message-Id: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: A1Xp15Rgq3YtNap-QUkNJEBDpZCkuC1m
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=6853c0d4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=8RyGSdXC0efAYOFA9KgA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NSBTYWx0ZWRfXyHjZuF78Oiay
 m7N/SeZn8Sr5ZpsZQLyRzu5RbCYGJvH5mhgbEF4ebCX7qEOBBBCRCIh4p9m3fjaBQX/D94v4N2W
 cYc6KdGnAaHvsWq7MXen1X5mrcj4+ZIO2c5eMkXsEqW5cUAvDauAaIlwpVdNVtOyAb0X4Crhzq3
 cOl+6X52Hhar5+TvY/5en9nDVaNu6LQgkFtijCXHckeG5Av1QHHLS054pxH9fOPEE2Uskj5Y1y+
 ZCQai0d34B8JsyOFGbpCSq5xf9eh5LKt6aIo17QnzXISe0BD62M564BLJDPl6tBvdMsyJhbN9r3
 9bgBsVyDa9lglie4A8no/dY9r+lMX8yYkPaGqlYyIuMR0zuM24e/4Syi9g7FxX8czp7cILswzV8
 uM/EASVmjtCrh7x7OTRPSiU9zqC3B1jLrOPThc3xeFSYeGxwM6vZX2kFWHNh0At1kdDp/VcS
X-Proofpoint-ORIG-GUID: A1Xp15Rgq3YtNap-QUkNJEBDpZCkuC1m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=759 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190065

Ensure the IRQ is disabled - and all pending handlers completed - before
dismantling the interrupt routing and clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---

 v2:
    disable the handler and block until complete.
    allow devres to release and free the allocated irq

 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..ed003adb0282 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.34.1


