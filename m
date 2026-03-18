Return-Path: <linux-arm-msm+bounces-98425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEi4N9SJumnSXgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:17:40 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6220F2BAAB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 12:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DF91C30B2C9A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 11:08:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB470396D17;
	Wed, 18 Mar 2026 11:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wad3rk0S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YkIiEhNf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694C33B96A
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773832134; cv=none; b=jCCGQTcNqB7Rk2krdzLiRJ70ftLu9pg4y0rqRNhPhfsUCZQLudhvfuiUfCwo7g1v7Pfbw8BnQ+iVZS2jtJuzbl8Jw5scSO/qxJiSPrPuPULmQCzyPNEivh1PYqc0pNPGv7ZgfPRC749xJnybEHLpU2VxhG0hkAz/sKWfQEWcCck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773832134; c=relaxed/simple;
	bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QYYHbSgqx7W0eqiREO8IhCEd9gsbTU2gojuqNKFWDVhJEJx9WteYfToqxJNt9ZwYZ8DykmbzoC4lrQUzDRUxXg+tmub36cT6zB66ckkjeqVv0LeLzZWYmYxTHbPtVhApFzzQZRDct88URBpaAYaEWh/6e/3Au3YXHwljK0uQJ9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wad3rk0S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YkIiEhNf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I9L1dF402719
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=; b=Wad3rk0SnmL5ZVJn
	dpXTzwHKSYsJaZLn3qZjfjHbPGxp694yAGTcCdvtSOO3L3GvIxMOOEEFEz+G1r7h
	Lelc8SqdvjSsNqWQBIslSm9dY/d+ZhblAbdtP44uPuN7ACVQ7mRF0NinkjzTCvvd
	ygz1PFa8oORAEIhJfVcrwrLJvovkW5wgzJ3m6wLJ/ssLAQ/Ylt0Q86Q3FdKC7U72
	IBv3kguccWtr20mp4lpRXB9SWydDYq3xQpWoRfujahACYWxi7ft57l4Uaf5OtMhi
	kXDvjRMMmmXxIAmNbTp6aZN1yA55ymWev2q1JhM+oZ4DiCgk2N4eqRfVkpQAEVHu
	pxVyMA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyc4duet8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 11:08:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5092efe29dcso48910061cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 04:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773832131; x=1774436931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=YkIiEhNf1eFw1FlCLqAypNOUeVF6dbFHScInZuirUTKXCEWLVolldY+uGTLZXmPbMm
         A3P2F24nrzrZk9ny6cp+hLY2Hli9S6iDKwCJ/oewpHrhDY+LPon0BJk5SyacXXzJNK5J
         NavAmW72w+BRsvSqsptQhhyBptsF9jli/Z6d5ZQWn1aJrz5HBAKzM7BglcG+s5mq6BQv
         1dfAgytAPR8wlKqzEZd23YuHPEdo2uYJkCs3CYMHGwV7eHyadWow88vf9y6tNvqovesS
         RPw4OOwOGjK6qc5Yl1NQq8Mko30jFq6GA/WwOALqCCbb0523sFa3FxhmaR/lTt1qGC/I
         Pd3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773832131; x=1774436931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wR9AMTR8ItIvFVs0Nnm3qG3RmglLx6erxP1oN+Z3AhM=;
        b=Iv2NVBE+lNRE6QE66DH+xYBkpfrKn0WKYFz4TRm9erlJtMrcdibl3cjscPNB2oby50
         MjK7SUCHdxxs2xIFi9sGAFf34QL77x8cqV9VCSaylp5LkmX1c4XsVRzyDcXJKPiH3ekD
         fcvcAZZpSxF1WlwAj28ADLeoPs1yB7TsrPE/uWiwP4rIwzfps3UV80pADgrXmJxoc+Q4
         aijVdw5WXldU1f6jm9kLOGBh/AQKzNQCaEtvM9pAx27bkxzQ4Uw4gT2JyG0c47zPXPZo
         ln6b+t1P27sGT6Rg+ZWYO+ArCOqB1wMvycnYNrIq7bNqq1pRDZRBqIztnabF6a2kuy3C
         bhsQ==
X-Gm-Message-State: AOJu0YznMavJ3QTPMi21UVeRIUPFyUDQxdjYm4R0Rfz+oTRrxrTPmDIv
	WpH9AudZ4VfSbdeCkWZvJNbbclrlWFzgOSPR4cz6mGzV8ZlYITDrSNl1qz5gajl30/Xesy4Sb4c
	ex2o51ieeeRW3J/opnAiVegt6KFRkU6ZKjBZsYP5+Uc2i9MNNM4z8jhzQTgQg9mok5U1nSq3ivn
	vH
X-Gm-Gg: ATEYQzywOkTbX0g9bHwT/sq6dRfq48AzeuCreIKFZMzmcf/LRYvKuOp939TIeicDdXU
	TDqEQ2Ti0CcSxU0gHYqz4yTNKHWEl7eAtj760na8oz2U5HDtl7ouIR8V47ube5aI3xWsCqkCe/j
	GAkyopEucQ06QQqzrdLoO9gpznwKs5IySze4fLx0VenMP8zuUOzPYU+HW1tNZmNDKhDfz+gFEEc
	7LnpeDrqTOhXTgFcT5jdN/Up4hBrfar4fZRY4H0NID4p7CiyBj202CGHvMNRaDMi5bOu+IaqBMt
	ExN/ZyHkY0PC3VEr1WrHC41GAwwz3zNyT5mpxh4pxxMo8wecmxCa/zmhTFkz7QeQFhKCNDRBufW
	bEKGS0eYBW+kl3D95fPiIOH1iEonQuOEnx4pmw7LY/2xt
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484771cf.26.1773832131449;
        Wed, 18 Mar 2026 04:08:51 -0700 (PDT)
X-Received: by 2002:a05:622a:18a0:b0:4ec:f2e1:483 with SMTP id d75a77b69052e-50b14869854mr32484201cf.26.1773832130763;
        Wed, 18 Mar 2026 04:08:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51805291sm7523646f8f.0.2026.03.18.04.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 04:08:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 12:08:40 +0100
Subject: [PATCH 1/5] clk: qcom: kaanapali: Cleanup redundant header
 includes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-clk-qcom-headers-v1-1-d5c6a3b11b67@oss.qualcomm.com>
References: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
In-Reply-To: <20260318-clk-qcom-headers-v1-0-d5c6a3b11b67@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3783;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7hyg1XXvT5j3mOuyK22QBL9DKoIwlwiMnknBQSnTpeA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuoe6gR9bvfg1adntW7DiNK52kg38RdUAFpdOQ
 IXra6l1f4aJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabqHugAKCRDBN2bmhouD
 1/6uD/9ZAAGcvO3kTn/UshqbTfg0k/YLc5NItNNgKuTLe+1MFzJrxMI29Vl/+25cC1UD9daLQsG
 bt+zzp6Ue02o+vJ13Bh8etpYPLBWuF3MTXGOl9D9LdYI7kW/3sLuVJ0IZg5WulI9GKBfDKtXmNz
 AAWcfeLObmuasvBK+u0bA1iWGa3e2U6py9KryG3qFGIpjpIo1HpjzkYwUk4LZ8Z5RwN7q1UcBh4
 B/xGEWUahLpFQVqWCPXTchouENIMc2uYixnyvN9++yNr7lPSBlFrIgsGVvncXT7roblpUify15I
 R1vnHJum7RG4vqgKy0KsZlpx6KVaUPcVxpL/tL8C91sMnUaMzKKn0KLgvzaPeZ80Xfp5VgTN5Hz
 7OhsDRu4iYy4GahSTuWbPPSZ12TLrgXhbn+wmpQlBRt8SdrM7+7sFu5g53BZjJyv2FfbjnwG1pj
 7MpmZtu/ly1UrNpY3JTwX7v+OoykNJ0CYYpJ48ca4fYIpQYOR2L78w2nw/sjgxX7iG2Xu7QlqFc
 bWIbLpYabbwxV9Tb6eUkQrMNjt8s61TJ1ikMAGHxiA9bic7F4vqi9D45sawgcO3wEn2RXv2ZXyw
 BjdhkjPzxmoBudkh1PokAEqY2tgGgxKXV15W1EWgacDaTBwR5Dp7yY6YIpvK0yCI192m2WRoZ0K
 pmph9cv0QhJg2lw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA5NCBTYWx0ZWRfXyS03yGAf12O4
 w9MZHytRinM00eDngyEiFYwZ7lHhAXqscmUuzQG3hDvrJomgMs3rGG6KYyyx1wpQ/hQVbIMy1YJ
 YNHU06cfin36/u4jle5k/0VxHf/P+Pab7t2oWl0QdFKYyIBGCjR98SSONO4M/KnFy6E4wyiZfz/
 UF8NcDqnF07fZEMs8KeppcpMke2fhWzehl06/bPEHVGWcdh4VfyY0syEMoZ6/VzNbCVhaEiXRdV
 2xHsqsQ5MmIHnPBaJryEuKJ1bfps1pPYymU2KDGMU3X0VuXWWvK85sV+zj6+fS3jPeD6lY0DOPR
 8ktUAXaIYnjXTgU4ICPuJH8lKqhSEAuxzKu0g3jfSpfbC/Gdbxr6fT0rWfwhtnmUTKD25+YYnLq
 KdUhpUlqzjfDEltl+27OrYjFz/LeZHqqlICApBbhfjewofs9yzTY5BhnvC8b28M1ZNrhuEImNrD
 KRz7+nVClgy6reYj0aA==
X-Proofpoint-GUID: 39WQzdX33xPB5wupn16qIo9Xc5mFaOS7
X-Authority-Analysis: v=2.4 cv=DfQaa/tW c=1 sm=1 tr=0 ts=69ba87c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=BlA2PGTryg89HV8owXYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 39WQzdX33xPB5wupn16qIo9Xc5mFaOS7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180094
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,baylibre.com,gmail.com,foss.st.com];
	TAGGED_FROM(0.00)[bounces-98425-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6220F2BAAB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Remove unused header includes - drivers do not use any OF or runtime PM
API.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/qcom/cambistmclkcc-kaanapali.c | 2 --
 drivers/clk/qcom/camcc-kaanapali.c         | 2 --
 drivers/clk/qcom/dispcc-kaanapali.c        | 2 --
 drivers/clk/qcom/gcc-kaanapali.c           | 1 -
 drivers/clk/qcom/gpucc-kaanapali.c         | 1 -
 drivers/clk/qcom/gxclkctl-kaanapali.c      | 1 -
 drivers/clk/qcom/tcsrcc-kaanapali.c        | 1 -
 7 files changed, 10 deletions(-)

diff --git a/drivers/clk/qcom/cambistmclkcc-kaanapali.c b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
index 066c1087b0b6..6ad912403b8b 100644
--- a/drivers/clk/qcom/cambistmclkcc-kaanapali.c
+++ b/drivers/clk/qcom/cambistmclkcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-cambistmclkcc.h>
diff --git a/drivers/clk/qcom/camcc-kaanapali.c b/drivers/clk/qcom/camcc-kaanapali.c
index 82967993fcff..c848ca99e9df 100644
--- a/drivers/clk/qcom/camcc-kaanapali.c
+++ b/drivers/clk/qcom/camcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-camcc.h>
diff --git a/drivers/clk/qcom/dispcc-kaanapali.c b/drivers/clk/qcom/dispcc-kaanapali.c
index c1578cd07041..5ec4d2ab6b67 100644
--- a/drivers/clk/qcom/dispcc-kaanapali.c
+++ b/drivers/clk/qcom/dispcc-kaanapali.c
@@ -6,9 +6,7 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,kaanapali-dispcc.h>
diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index b9743284927d..210ec7afbb67 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gpucc-kaanapali.c b/drivers/clk/qcom/gpucc-kaanapali.c
index 52be48c15c67..d93d06067fbf 100644
--- a/drivers/clk/qcom/gpucc-kaanapali.c
+++ b/drivers/clk/qcom/gpucc-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/gxclkctl-kaanapali.c b/drivers/clk/qcom/gxclkctl-kaanapali.c
index 3ee512f34967..795ce40e028b 100644
--- a/drivers/clk/qcom/gxclkctl-kaanapali.c
+++ b/drivers/clk/qcom/gxclkctl-kaanapali.c
@@ -6,7 +6,6 @@
 #include <linux/clk-provider.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/clk/qcom/tcsrcc-kaanapali.c b/drivers/clk/qcom/tcsrcc-kaanapali.c
index 4da77367c9e0..db46d639edb8 100644
--- a/drivers/clk/qcom/tcsrcc-kaanapali.c
+++ b/drivers/clk/qcom/tcsrcc-kaanapali.c
@@ -5,7 +5,6 @@
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 

-- 
2.51.0


