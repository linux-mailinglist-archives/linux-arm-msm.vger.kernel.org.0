Return-Path: <linux-arm-msm+bounces-87417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFBCCF37DE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 05 Jan 2026 13:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1F2D03002D14
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jan 2026 12:21:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C648F339876;
	Mon,  5 Jan 2026 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XUgQwhwu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BoUZ14QA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5454E339B3C
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Jan 2026 12:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767615664; cv=none; b=CzzmSO1ptZUz68sKKJWCLA6bve4OQ+SN1C9Bx1fXVSHWBqRcBqDfjItvL+rXZOBaTBJOvjibtlFIJ3x42vUVWMup68wqwpNU915TQhG7vA4x3UkXqk9IqChN02JDkhPeOcYgnagHj4Yjh4gMQPKlts0vf0mz7Hm3BAoGwRIRvt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767615664; c=relaxed/simple;
	bh=MuT4CRsEmIA81NZOfV4ekBpuFw+FmQLT0UeuT8wUDac=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aw+6d8w0o52yihqLfhK2w66fSgKy+KgYpBrpMaNMjPznPsiuZXGuFMeaJJMnJRARSYQfT49EWlfEzh7Ts6HtLRfeeVeozmR/rqz9HQxh9ZwZJ+/Wpn7hKZF0AGxTFwFHwowB8gnK8pAavaNnQdKUGCgPLec2DgFvrXgGmdEl/yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XUgQwhwu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BoUZ14QA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6059t83j091186
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Jan 2026 12:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wTVsw7wbqCHNv60He09CbWGJnftOtSH/fVz
	14TUyKe4=; b=XUgQwhwu/pnUIdprFf/PIgud9UzfgS5uP31Dr1ggTn8o2Sb0vw7
	uNqD0Mifh8Drdect3YE5troSzStHekwr5wcQeHQ+daRvfKEBVC/xq0rfFclArE84
	Zwu2X9TXTLlkjiFXjMIoRRT0/wAAkhymZ7NXT34/cJXk2iNnAyWkk+nXop4288+D
	9a3dKUwGg79G6ukshvJa1kZjVJFApFiQYOLpxwD1daXXOhnhevZC2gkVgzKL5NmU
	0lcs0yxQVr4FJ8hTOWCPZ6gLeID7FPlUvWq4/HHu3pzEX00hEneTlcg7DvlQcX1a
	+E+J9UFI3mdWS7aWBuNd3Sh6xwxXDcJ/pmA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bg4v61fdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 12:21:02 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7b952a966d7so29695051b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Jan 2026 04:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767615661; x=1768220461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wTVsw7wbqCHNv60He09CbWGJnftOtSH/fVz14TUyKe4=;
        b=BoUZ14QAAFSWEsFBgY4Rs9g9w2IWDlKCwHNjy64cJqAWImwk3+azleyU9PZm3dgDni
         8jPOKtzvLXSU0Xe4gjIBdnHdeCiEIIz9Vz5YS4hCZlKfbQU3CxQ9bYfy6JkjDJ/2dkbN
         Dk9YgzE+hpDKCFfrYEemqJ2kInJjABEGY1OyhfOwtBJclA8+PZMxk3YcrSD40akUasVx
         V0UVYXjsC4/lelngriAE7juMYN2bsS9eYIgqTUIUOg/gcJl7H83mcCYqRB5HkUta/wEt
         hHjUOUamca6vHfIssjWRzycQSwBYBeYOMZVr8xd4A4zdG9xUqDu2cbaxB2u5Wr1e7IFE
         Za+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767615661; x=1768220461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wTVsw7wbqCHNv60He09CbWGJnftOtSH/fVz14TUyKe4=;
        b=g64cBnJxRkbiOjSj0JVRa4sSjETKBMmUBzsezasm58z4GfUBps05aJS/0MMNLLPYfr
         ufDGKcz5M4GJbQSR+159rLQ4lgQCO9MBmqd5ovr7oAoZOpiuGKcGybW1e40K+MUYlKws
         Qux3SqeAM6hft8B++R2LFvPDtsqWXgcEKCg0QndYggmBqz0k5PAt58DRipLBs3KUdfFu
         pK1OcFCgkzitYxR5VtayzpLaTr1YldSK38KM3cyhgQMMD0aYZPhbzEEzCngz4im3uJ13
         hewQXvWHmU4cDBLsfl0EElWRkpdg/Puay0GTR9MPUyj75EJVHmZbhoM0cmjU3mzzKT/l
         gZKw==
X-Gm-Message-State: AOJu0YxxPjxO9ye/QYF2f1SVQHkDVKB9OK4NqO8+ngPRACLBuU9T3fq7
	mqtNMg7F/9uYW/WprkQnDfjF7xcM0ZLtVHJgW3HjxjI7DIoDW8vJDIzgoeRtUtYeOaFlSFHHxrL
	v9cz7KXNRNKnagPz/j1d601kj+qRQUrxRF49XPgBayaCnT4XY6YwhoDZaails06KZ36r0jeMpS4
	Uh
X-Gm-Gg: AY/fxX4EQAVpXCtgaRT7ykWtFqh+SRPJuAZzY1yd7MhtguI/pPq1VT6Y8bjQ5FpnRyf
	WW68hoF0QMOysKIP9DZrnoNt7PjAy1h9/arn2lCWISYgZrsWRPm7mZpq3FC1XSqFSxMVexAD6HS
	7wuiOesgsFDbqN3vokmMaUUZqyV5Ft4cbGy8G6Z3teBGIRUXt5QYEX6pYguA8r/xnOgvqxSZ2OO
	dA6DfacM2bP6D3SgRSBjJAoRrcENCycv0OZvV8L6aS89ukB2Bg7evVpFZ+B2PiZ1a2EhdBhMLGD
	j6J9oFVTVqmJWMz17YNRsJaa6s4zGnLoUfF7irjhErCj0jkA0Zh3dzVLhHdpIHlJr8Axbf+p6DM
	SevrvNA7vi/iYx255qt6bBan4Ciua+FUgFMI8NnIGKr6kP4Pnd1SU1Su0ZxmJ5CUg/v2uejbowN
	041jmp9uCQw6y8QRsASX21gWYvwNfiZA==
X-Received: by 2002:a05:6a00:44ca:b0:7e8:43f5:bd11 with SMTP id d2e1a72fcca58-7ff66f5a163mr47350381b3a.38.1767615661207;
        Mon, 05 Jan 2026 04:21:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE75xXArXQKWATo530AnuxkpsHLAzPHcYW3r4WS40TD73Hwfi/DJhBpBOSGa3tn0kgOKzljlg==
X-Received: by 2002:a05:6a00:44ca:b0:7e8:43f5:bd11 with SMTP id d2e1a72fcca58-7ff66f5a163mr47350361b3a.38.1767615660730;
        Mon, 05 Jan 2026 04:21:00 -0800 (PST)
Received: from hu-pankpati-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b423b9asm48879095b3a.28.2026.01.05.04.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 04:21:00 -0800 (PST)
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, conor@kernel.org,
        jonathan.cameron@huawei.com, robh@kernel.org, krzk+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org
Subject: [PATCH] dt-bindings: cache: qcom,llcc: Remove duplicate llcc7_base for Glymur
Date: Mon,  5 Jan 2026 17:50:45 +0530
Message-Id: <20260105122045.963277-1-pankaj.patil@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767615645; l=796; i=pankaj.patil@oss.qualcomm.com; s=20251121; h=from:subject; bh=MuT4CRsEmIA81NZOfV4ekBpuFw+FmQLT0UeuT8wUDac=; b=5K3Xb/hL6NS3bArpwXIN9/9XoXYErpxQxxso/KqzwsMbTxyAIh4dOYSIJM/ZXt5aorT7q0MDB dZPDu3PZ6NZAYc85IjCejStE+72KV4L92EQcovqf6A/UJ37+E0pcsf8
X-Developer-Key: i=pankaj.patil@oss.qualcomm.com; a=ed25519; pk=pWpEq/tlX6TaKH1UQolvxjRD+Vdib/sEkb8bH8AL6gc=
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDEwOCBTYWx0ZWRfX8t8I8YBabWB9
 GflM34TUBmxfHMxYnUgJNZ5Wf5vkRBkugh44WBBUk4ai764AnCL8UP1Jny6/lsixWhN52O2Wnfm
 A9k75faTVFhI520N1JBWLZDkoQoHg6cUIdqhuAbbRcb3Hd6/0UWjJwo62RHuu0Iq9i5qc1HwWsA
 3ZvPldAyKppwT2hAzjZsMnbrAQ6m5ff7P9U0NXmSUENPSLWXSca2mQLi/G8MODctAFrliWE6NeB
 qYj/t1OzWoPMH+VRIacX/m2XWtyimiOsu2a0rs8DvWmZKrAHFxWs6OtgPoSB5alMynM9hcPVnKU
 GyGFhzmqR/XHdXD5yOXNa37ft73l1DGvCT3kCrUvxtfPsGljg3WsKaToTfkmeHXs1LOI9rKieNd
 NO/BcjuqTiwx0GSTRvOQ8myucTKZ7xa2fP+VX9RnOFKjuwH3IkvB4GYnFsoufls++k5tCsIWP/k
 Hp97gWEn2RrYC38gU2g==
X-Proofpoint-ORIG-GUID: hl8jUsOLiV3m5cAC97MJYuz9BFk786C_
X-Authority-Analysis: v=2.4 cv=c4ymgB9l c=1 sm=1 tr=0 ts=695bacae cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WoQAPnRm7QJrOHM5iSUA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: hl8jUsOLiV3m5cAC97MJYuz9BFk786C_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050108

Drop redundant llcc7_base entry from Glymur LLCC reg-items

Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/cache/qcom,llcc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
index 4e99c405aea3..6671e461e34a 100644
--- a/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
+++ b/Documentation/devicetree/bindings/cache/qcom,llcc.yaml
@@ -119,7 +119,6 @@ allOf:
             - const: llcc5_base
             - const: llcc6_base
             - const: llcc7_base
-            - const: llcc7_base
             - const: llcc8_base
             - const: llcc9_base
             - const: llcc10_base
-- 
2.34.1


