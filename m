Return-Path: <linux-arm-msm+bounces-77715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23CE5BE74ED
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:57:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C87FC189873E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D482C1589;
	Fri, 17 Oct 2025 08:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SDgeaNcx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47DEC29E0E5
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691385; cv=none; b=t52DhDotmpOfKX6uvPKQYRQj4FRBm2zTnX2BPW3+qsEY4s+fJuNVtazZ5W1aFtIH+r2rtGR7jhYviB5gNKb9U90H+F/Jbc0ZOe2r15OW4NM4E3kU+4nkZ+qrs7PyvrNDhcQvYPlW457yLYIQEORIx1kPm8w0Y+cOSZeh2CSDrFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691385; c=relaxed/simple;
	bh=ENO3YSOfTnciWFB7PA21ZeJ+n8gziqAO4GtBW3dwPPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B8oSrpr+ac5TGvoK7ECpq1Y7L2AqCuiAcqrlsOEI0uaqXZ5SVLj305DXYsb+AizoVND9+euRi9rnyn+HadWqY8lZwHJUMtkysYw8R2bPP8OJCjkKWxqW1uFP2tSy1AMv4RrJdBoyjCx45cuGQjbEL9CrsKD6UqUTg3I1r1XRT70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SDgeaNcx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H80kSR022163
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2qk5/cDXnMl
	tBmhvmLVh3pUHcYmEfXQKc8nHF57WqJ4=; b=SDgeaNcxQnseZaDUnIlewILulX1
	e3ImkJv5NOHHSQxWYsdl4vaZtvuXLh0CHik8QqjWWgDWTlWiqJvKjmMFqyQTj8uL
	hj6A7dWvEm1JPhuI9YIy9czvFKSHi4jwePTo5Qy1XywqaVD02RFAkMffN3VHz+W/
	fDlOEtq9TTlRFz3hMk5dvbhK3c24Mgkfoes2eG3bTZ4kw+MbfEuWZRCpwJ2r+eSf
	v4qjg32mGj7QyXrB4mANy0VCqt9MDOyeXjknhjwRPbG1VHYUYl4CfBBErUK+LXig
	nbcYb/qBA0vLEA75gz6OoWSWDYosJJ8S0tMsD2ZIUvBBkvPvQctauw4s2ZA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtghj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:23 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c0f8cbe6fso62995866d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691382; x=1761296182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qk5/cDXnMltBmhvmLVh3pUHcYmEfXQKc8nHF57WqJ4=;
        b=NaxP3MSFntQBilLhu3uxyxFV0NIsEXYsClJsL8RefGtg15v+KgUwZT+E7PVhyT5gzX
         bPAOLDuZ9KuiQwNKRmw2FVYlWdQEXXNb88Pzgx5r0bIX0JRd2h4K8XyV8crOPWpnWvYB
         8aa1YD0nIeDk1X3ScVkyBnagPjHX27/LwgaJwUXUO0UJQTq3CGdLh3lGI2PluwIGQeXm
         uyh2sTkuBEXOkkqep3RLPtXPG+BVHfOjE2mG5f1KaxkqrRzC2tcreSmwy9oLXdX4qfQs
         P5D3aPjI7IXF9F1jjbL/glvFJizU5u6cO+WQW8eGAxQ4bHA6QmjCLRkyptjRHKx49ciz
         Lvdw==
X-Forwarded-Encrypted: i=1; AJvYcCX3ehveROrUVWsr5BiAH/Q8f9MgqvnjuSWGIu8yCrVSu9zB51tbScfawInP6mDzavVHVPYjQAyGjLltX37g@vger.kernel.org
X-Gm-Message-State: AOJu0YwgmsUyOXw8jIu/3h06BN9r6VAg/ALtQVQTkeiMt3lddkHZfdG8
	Ofru7GvM/AC9NijqUM7Hpzn97RMr3e63pSBs6igJpwONi6gMdXBy4jRazTL+F1Lqrz8+dT0oEO6
	YkgjtkktXD2Um2EpuyXPfvOudCrvOpv2QMRfgzbZV4bk83V9yl0BHJLegYbCq+h/xY+Cf0ffsnV
	HJ
X-Gm-Gg: ASbGncsj2Tcb0EOsPV9VODtuFvGJJZoCFTDCSJFWr8CbG5pVpIWmKgEV0UK34MY4T+5
	Jv/x+GXzz8DCph7Hn8Yt+MvLMGMTLzuCgvE3moVT5qtmEVm0Obdknh8VZxLGe/P+NCaT/tZfsqZ
	G0Cy7/JROOIGlJuU/JUm43sm85ocFUgnCl6aqtzeFeW8zQFu6HClrmdOysLU5QlYvpaOE1ndST2
	A1BZFqsu3PwlNIketUY2wAUQ0QvJkc1rRUReX7t2XtSX/44z5W5ctHe8sZeafSsRDxhA0yTMGk3
	+QKPQ3Xk7JfBR8tLYGSvRLK1MIAaBkT4L5g0wKpDiDDycxYv0irrxns2Irmtpw5eKkxLsycmJRA
	msECfP+ELkGsz
X-Received: by 2002:a05:622a:310:b0:4e8:9c58:3282 with SMTP id d75a77b69052e-4e89d28b3cfmr45995031cf.29.1760691382171;
        Fri, 17 Oct 2025 01:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXmaWELNHeA4YfO9bK7KKaN2PbiUIZEHrtDSzzKi76qlVj6r6Tyv+8YGZWV56bOI27CdHbfA==
X-Received: by 2002:a05:622a:310:b0:4e8:9c58:3282 with SMTP id d75a77b69052e-4e89d28b3cfmr45994871cf.29.1760691381758;
        Fri, 17 Oct 2025 01:56:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:21 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 01/12] ASoC: qdsp6: q6asm: do not sleep while atomic
Date: Fri, 17 Oct 2025 09:52:56 +0100
Message-ID: <20251017085307.4325-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tPULqClLVVYalQnUeYoMuG3SxnpDhnm6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfXxwQl/hAWkKtR
 I3O+dUrySoqtwV3HunFIs92RXbw4F8D+CQclCqtcS/xIFQ5aReA9gx+pcuznduK+qidcntbHnG0
 GJ2NS2IuIe1OCoYB1RX7hNV3L10V8il02KQYXXoq1rtsbUu0oZOvPCCSIKwZWF+/NKjfNssvuhs
 duYHHva14E+Z/2QBqD92gbUt570YpZ++5PH4LyqhkIIAtpScZLyEKeVt+qD7NdbjZG3OQzhoPyW
 4dPDmdXNmHQjSUWpuIUzcdX93IU21HMYWlA0fP/TasfaQ4gM7clrPNlppFjbOxNZnaLwShL+jqW
 +213sVdiSZfrRSqrS2XZFclRb6LrsPiVsoBSKbeFwwB2BrEkQxiJqNr1gf7/vRnsfzPXMrJExBM
 MFqFphEgoT/LUBmL1q3PmcdFGs8WpQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68f204b7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cAUPnWn_dBUFebge008A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: tPULqClLVVYalQnUeYoMuG3SxnpDhnm6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

For some reason we ended up kfree between spinlock lock and unlock,
which can sleep.

move the kfree out of spinlock section.

Fixes: a2a5d30218fd ("ASoC: qdsp6: q6asm: Add support to memory map and unmap")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 06a802f9dba5..67e9ca18883c 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -377,9 +377,9 @@ static void q6asm_audio_client_free_buf(struct audio_client *ac,
 
 	spin_lock_irqsave(&ac->lock, flags);
 	port->num_periods = 0;
+	spin_unlock_irqrestore(&ac->lock, flags);
 	kfree(port->buf);
 	port->buf = NULL;
-	spin_unlock_irqrestore(&ac->lock, flags);
 }
 
 /**
-- 
2.51.0


