Return-Path: <linux-arm-msm+bounces-105936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPhMKIrL+Wn3EAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D3AC4CBD95
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 12:50:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 404B331B01DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 10:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B81C346E75;
	Tue,  5 May 2026 10:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1Lp6ZaL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YycvhTAj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BB6346A0C
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 10:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976968; cv=none; b=ofqOLoJtQPS28YlhwBxDN9N2r28M6X4sm8ndwAQ5pWKNMXqPTtINxThy6+h33KNpOGULJMAAnx/dXilz0PmM33FMDXWRmTMs49uLfSCIVQL+OYDBU4v0tsQ0M3gPKrefXFi6lWPMCmAyMts3VMEsfnuQG/w2LM7PyLkrExH2xx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976968; c=relaxed/simple;
	bh=wZ5A8zQB6U5/N1THwRKAAjtWR5MdzQpY5lQYVmdviZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sBTNl6tzoAAovqDtg2XjShrwRLOqgCGxXt9xJ5YvAnc456IZ+W3SpXzeMEpz+bWkWv9JYO9f2IBodTf52AO71EPE3N/H+NL5QplMujnWdvltlQrloHd8kLVPQTcBMH5SEUKIHxZfaGDfdX9RdmzqhXezXKYmwLIHcnUTZCx1YOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1Lp6ZaL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YycvhTAj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64595dh34028270
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 May 2026 10:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=hxw8bfDrEzTfX0H1jlVJ2qshNz2Mm0JDawp
	ycKlI9PY=; b=T1Lp6ZaLYxF2WDfiR/RYkYj+G9umbx40cpe0hYBiyVDhN7e2RLd
	twTq/uPD81Ti4xntUmfaIHPr4zg5s7EYt01A1yv9QIyTcuodqfZ2cxXPzSRxeLXm
	0s58iXLnhAl8l+zM2HZUnV/Vw13U2hI5mYoNYFkVc8LbclhgknpkwpAg50Qg1jE6
	rKn2/K0jwaycGaXQqKaEsXbUPbEceFUqRcmO6vrjGIHC+JyTZ+uBhiVcY8TnuoFw
	Ljq5j+BaGj6OrPdZ4JE6rTDpifB/YcxWsFwkuiACT8R7fFDYYl75CMV91zRqLj2y
	mykYQaN/lncyY/o0EPl5skdn0g5OHcI4VvQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dydm6rb6d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 10:29:26 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb3403e99so139947981cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 03:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976966; x=1778581766; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hxw8bfDrEzTfX0H1jlVJ2qshNz2Mm0JDawpycKlI9PY=;
        b=YycvhTAjLeafRBlnjUFNLl3Rl4zk5Eeb70KSMlvCAgQITMJ3bXcP05wBCTkZl2Lz+3
         IyvsGtTjnuyFsd+QTF8gL81rkuqh/qWw6f56kJ7tjrUnisB3pPMaQdBTL/m8ehfMQZnJ
         kQ66yNd/joWxHpbvCqLDwArjrFVX0ICw6u4Fod1zdWDRZEuXNm0Gq6bHASYhSjCUDPYZ
         hE4pqM6N+gPsjTdiCYRfpW2wUaoInNNPqder1CXzhPggEPqsmftx+77CqwM8N/aV9lh6
         etbifCkt1E3Eqdvu8OhwrV88J/5zw2y9rhIwiarlL+ASMsrB1Z2HUOEsS2xAIVdK1P5l
         iJNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976966; x=1778581766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hxw8bfDrEzTfX0H1jlVJ2qshNz2Mm0JDawpycKlI9PY=;
        b=Hq2fAiJ4nFG6K0KpMDHvTu3vMe24xwUHaFO9aZXlvwdTMakZV4e0KIv5GNdO8WLIN9
         J8nvjc9Ldfq0CiyIB67arkt8mLtAlZTuMzj6MVzAILTXGeNGfNMF4SyZ6v0WQuidZBQh
         XjgvanqMLea+8k9qgs3Oll+XOgemHzKKsCSzsROq3mwv7Ihp2MzUZRGokPJPSmKGIbda
         oSRVAvKX+wYa7E+X7YwTzqVznXXB8f5RbuIlS8VOvKmLYVwZ/GP8TFg3TROxaslxVKW+
         RvWvnN3HCQ9RMU2UHE4BHkDvtTUW01yUC0Q/DkgPq+1jqnd7X/bQO09VgcBPymd2DiqB
         jXww==
X-Forwarded-Encrypted: i=1; AFNElJ+Az3Gw2lsFV8qMx+UNYHZgXgfjxHOmJJ6U9JeUy6wy4zjja9PpsN0CJBkoWz6MGTm2ryEwK8S30Xyadav/@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1RMNtwjhBbpPk0npypbcb6cMhPOBFX1HHfRLETUj7rfOm35l
	zJrI16P1zuADWv5mxrlbd2iYAUQM/MWQVyCd7m0tQX3U8nIbkW29o8MKba3AK3Dc55VjSa1jCnD
	OpAFZ96EyF/EmzANG4tUbudCmCmxt8Y5nDSpFtJ4a7lqZoRLEjnCiyw9GtibALOBLc8M2
X-Gm-Gg: AeBDiesdmUpVbHwydcoaBYZuL0bw+RKMs+JSDtQZeq92MohelahVaoc/akB4wHJjLhM
	2Tk2l4oY2ARB9qPoyMNymdfMaUo15nCJi7GZzBhVNkQbSIdopCB4Sq0HrgmCpHvehY3ZrOPjy61
	OhMJLAfXmflxh+j2NRHd0gz0anGPUKvoxusSI7PyU50Dipa0P3RhQqdIyYz2+QNJqeSBLAl5bcv
	RENs/gvOmOtIRJSEg1xH/JtuXCLN33k3qRoAllm9FDj4K1j6Ab5rsH9D8rwMNU0hgmpopVM0ht8
	+rVOGebFHTW+tkFNZcouUqVeIb3r4nfebKzrWly+uFgfyovHNZg2NiH6ESlj7Wf5+QVnIXpZtQh
	q8lYYCdDULsE7sxOelNlkCwtN5mqxYJMxcRyyhuNVX8CHfyk=
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr35261531cf.17.1777976963899;
        Tue, 05 May 2026 03:29:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1aa8:b0:50d:5a11:1b5 with SMTP id d75a77b69052e-513069d6e28mr35248371cf.17.1777976940265;
        Tue, 05 May 2026 03:29:00 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm608468835e9.1.2026.05.05.03.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:59 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] interconnect: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:55 +0200
Message-ID: <20260505102854.186925-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=wZ5A8zQB6U5/N1THwRKAAjtWR5MdzQpY5lQYVmdviZ4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cZmq/WRK1Q/FQYm2k73nIqYNW9+AaH7iw2V+
 vRSKTwogPKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGZgAKCRDBN2bmhouD
 1/OlEACO8pIqcWM0hqvY72i4Pm1dT5g9R+9nyZwsy5KlfWbrjlMQSIRZxHnBKMxn/rbBLI3FUtq
 34SCskRjGTYFnp6xCC3pL0Hm2z89CarweROXM2DfX/1WCWQMDKi2K/Kt4szGUalb6KfUJIQvEoP
 fI5puWeIb05yJ5t13uzYJ05DUYSuhkn9gFYtRrc+yt5ccsgAVwJIE5/FKb9OGrwu+0n/K+PSE4n
 QciaKDgYN++AtJo4tDf4EPDAmgKnEMrvwXrd8O8lF6J+dxWKZvisVN+b/gGujf1qsF2Hs7PE88S
 zQVQdOAdjQQh5ZLY6b5b5j4zGNMpP/vjHOxfreddocMkxp88hGPUPenQbuyxJJEkunPQ1WTgWMB
 VfEumU9aEGiV2LoI+gmoDUeNSzcW3mEs2PyuGa/vHUWdAsg0FI6fk7n/LB9louqCmt9TWNh+Ocs
 /edqgN1FP5bJxxQ2e2/gaS7zw2LJAIpng0UJRsfdPsEulX0zY5n81gSXrZg0UG75FKtMFzHG0WR
 xNKw6Y07s4p2u8ji6Cg0wk8lLWpt4Sr18gMkEX/ctcl7SCOgVPWvwOVe8NFawaN8VHwQBUI6XIG
 s0rPXUv0nvaCBS8FDw3Kdairqd/TvHg+d/JymHn3RksszVN3qNAoCGVUm707injGLr1/Y9dHeQ5 fPb+yN+lcXd1Nuw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfXyWEKJB/wE+cb
 qLiHy7DeTSt5V66X/YCstxvMQRx/B6cCudiXHE/OaSC5BqW6RO/z9+y43qDSQlq84rKHUz4YA06
 R9LhlUEIL1c/sO6ARqNgPyCZOXUO82WKICYiidKgUEaBzpmk8BcUjbLRKM54ULDkcBNJt1msLWK
 3OzlWHtOjdxTBqc+O/GnJhT8UDGBleMnkegZnB6VN3V7/O3qlAWEGD56iP6KnmokZjxIiKFQy5x
 m4dGEuZQrr85x3UPtVK8gubQ7uzmvOYUrPekiATVLu222EeYP+2atlYjRgxKnDLR3FdqL6pVr9M
 fWz2S1enp3P5Ui3A0o2tT1JpzlrDeon7q+ueZBXvY+NKQrLb4zrZjgWal+qPBHW7Z5552u/tr6t
 aAETlxcutCJkG60/wQbJoA9zJgk/FNtX834uvuu6BTSKZmXyhDYK+8mCRVJjQU3Hu+s763c99vu
 gLOclLMAlGug1y4mZsA==
X-Authority-Analysis: v=2.4 cv=K4AS2SWI c=1 sm=1 tr=0 ts=69f9c686 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=BzP98TPolLMEYMmIy-QA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sr_pj1TfEsfHNviK27K1t3kF7M7RbCoZ
X-Proofpoint-ORIG-GUID: sr_pj1TfEsfHNviK27K1t3kF7M7RbCoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-Rspamd-Queue-Id: 1D3AC4CBD95
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105936-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/interconnect/qcom/msm8953.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/qcom/msm8953.c b/drivers/interconnect/qcom/msm8953.c
index be2b1a606612..94a9773d2970 100644
--- a/drivers/interconnect/qcom/msm8953.c
+++ b/drivers/interconnect/qcom/msm8953.c
@@ -1307,6 +1307,7 @@ static const struct of_device_id msm8953_noc_of_match[] = {
 	{ .compatible = "qcom,msm8953-snoc-mm", .data = &msm8953_snoc_mm },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, msm8953_noc_of_match);
 
 static struct platform_driver msm8953_noc_driver = {
 	.probe = qnoc_probe,
@@ -1318,6 +1319,5 @@ static struct platform_driver msm8953_noc_driver = {
 };
 
 module_platform_driver(msm8953_noc_driver);
-MODULE_DEVICE_TABLE(of, msm8953_noc_of_match);
 MODULE_DESCRIPTION("Qualcomm MSM8953 NoC driver");
 MODULE_LICENSE("GPL");
-- 
2.51.0


