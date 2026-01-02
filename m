Return-Path: <linux-arm-msm+bounces-87238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF26CEE9BE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 14:00:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7D90305964B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA19314A82;
	Fri,  2 Jan 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AJG9yQhj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XgrvKNCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7439314A83
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358183; cv=none; b=upejbUqujUR2MRokBATuWCs8T9a0KV9Oxg8FtVe2JULc6vpZuk6MYxHiDRcjzhUySTUfxFkp0iMACoUIm8aVUYY+QiI8avnL3XvakpjEUgHPex1SjFMm6WdzZ2s0xCfiw/4Es/iVPLYSEVGWoQB4XmMJmZ5/HaA5VyG9qKCeORg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358183; c=relaxed/simple;
	bh=BjNmgXZu/C6PcYYUnwNmQGnZTuHxo8Kxs1Eqe1Uto0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPlV20e/r6hGGjMwqxpsy3o5LI61xIEChoJ1XrzGyKsQko5ScjLt6LmaXwJKDYvSImSd1ihP9UMFo0ZtUARK2YEPDHUhDNExqw2ihIaOO8G6OGKcrzNTTpj6R3JtqNmQ4GRGhCJsX1UsjafaU6vwTuEwqmq1igqM/Hms90xOq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AJG9yQhj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XgrvKNCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2Qf3961084
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3R
	dAn+tkPU=; b=AJG9yQhjsC/PHRKDb6NoOf5z3Cm2DncEnSMVOOy9TdXn6YrwX97
	QWeocg1su8C3LI84ZAmDZtjTszIqlFPK5WxQtWe/FNnqmTh6+kzs+FV7DzRC/Rb1
	ci+DqmQlv2euzX9rR6vJEu0bK+e4ch7SVPqdWlXAEp2jSyXXnbTW7DAUl2+oL/53
	SDANjtmMHI80ghCo6o2MAlSent0qVZcCxnKzRb0F3+IxRyNSlMUeDhr91r9l6lc9
	neQ0ZBQM/r1F9y0UPX9N+ElugQbSpI9qDxCNlOJkLr7oJ2zDKi6b7jTI9tNJX1Fw
	7SY4ZGrIDlc8LLtU/aix9G8SRptFvukvHiw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd77v3fdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:49:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaf9e48ecso338374791cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358180; x=1767962980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3RdAn+tkPU=;
        b=XgrvKNCc7OE1e4M2YL1rM+goZTNV/wTdpgCsCBx8ZhbyMtVVQXoWVovPGfVNE720K0
         rrJZpUYzDFYJmSeH6vYw9B3Jhlf3Cm5z41+0xTKlzZU8xW+Taw8UQ3nXFCVKqGxP+Ghz
         IkfGvp3NbKAdPVzXd/alvIhpN0hh+9MrlP+7boCdHxtMmL8T/wuPdASImumtPXUdvSK1
         d1xtVmtB1pOvzXSGKJwZWU33j776hhWdY1nFRvplWv1xPmKA79+RIn6yBuzsL+NFqOwp
         QmaScclxWSV03GHkF3nhc//I/iR44zmAFdP+Pt15UgJJwwClRkzsC/AQh21UktnM0hUe
         32LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358180; x=1767962980;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=okOB/hveVQZe3izW4PjCJpub4aYiYUHPl3RdAn+tkPU=;
        b=bAGvwjWd362mg0vDO81vMdT+PTkg0xGlUh//uEfLvb7Z2cI0boD+j++fS4tSTig9E2
         Phj0R1LVSqR69qwWV+M0ouX3M/bCmxT3wZSnhqpW5L0YxwC8cFXswaMTTHqXss8ilmtb
         BTtZbtvDbiP3PAeW09LdKysd76F2eb81biYb8iTVumftPmLHOAcOqdKVzAp8K7iwbzXg
         /55y6hao+vt6bDa2PqXsy5ejeUk6YL9lQt+1hgn2PkFBo7W0z/DroV9B9Rho3/xjnhRk
         cqkT4It9wKKdN/ft24EODDYnxeV9xM69oUi4aBKRwPms+vK6x9ChqbSgg5q4J+2tZgfe
         3IHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3PI/sm6zjKWW7MmV9+NnXpAmsDVeQthDdhP9SOy9qULYxHMECvCE3DGtUTzK5PsKjGPH36NHVDPpjJ1Dm@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTmfCxIE9amoNdUPcZw4SAG814L44RYv71x7FB+Dik6fwdzvA
	pG0R8PPg3EQtjH1u4kaMBfY2v1lG+tOXUYLzoJVLcM2M9NrAV0drPeynTJYxSljNCeQWxbi3X4U
	qIOk7LsSHChMXgFXaRPwjWoW+yoHgOKnCjydUM5oroKVVq/QOW3IG4HjTk/5wbtr9Iapl
X-Gm-Gg: AY/fxX6I4d2qwtRUb3Lj45DTqdS1ckWZpuN9OM8dlVPikmQAHe1ODIdcgr9YNSUcJ4h
	RXPuB0qHCPjS6QZUIWfENr5YmS8eGBvxPY2q1b4uf7a/T9Z0TcCL3EKxn/AtuL0nxRdWYe3qDDh
	G+axKrrhrr3sssOMo4tlMy5tRZc+KIA+ut5p4ajKcgUwLgosPc6+wrplqTlVmjQs/cAR4gLjwft
	b4MlmB0EpzAhD737Vc7j/7EFNaZqVMw10phgF9GE82VG4/yAgnwKkmNkieRWaZk1Q6RFU09dZ3m
	S51zuuROjXQj1uA1tijhB//apViSUTWQmVhhCEB5k4KWKzNICELeDrrAtQWY02zJwaUE8VfqneK
	6q3iM98iS17+UFF3ylMbcZy+nXQ==
X-Received: by 2002:a05:622a:5792:b0:4f1:e9da:e876 with SMTP id d75a77b69052e-4f4abda20cdmr638557851cf.62.1767358179976;
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHGnew5aLjuTwNBQsOXtMCif4sPki5iXh6oBE1YmYfrd+hANBnZi7dXqQvDf6yRpTSJ8xkG8Q==
X-Received: by 2002:a05:622a:5792:b0:4f1:e9da:e876 with SMTP id d75a77b69052e-4f4abda20cdmr638557411cf.62.1767358179587;
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Brian Norris <computersforpeace@gmail.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Harvey Hunt <harveyhuntnexus@gmail.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Pratyush Yadav <pratyush@kernel.org>,
        Michael Walle <mwalle@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/7] mtd: rawnand: brcm: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:28 +0100
Message-ID: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1705; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BjNmgXZu/C6PcYYUnwNmQGnZTuHxo8Kxs1Eqe1Uto0I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77X+7DI5HXNxZXRmn2jvMv9n63YDl3ZK3ouq
 wgjSw+TjDiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+1wAKCRDBN2bmhouD
 12opD/9vfr5e/WPbyZgf7jpsaVgEPN/Ieku/SY9O3Xa94Lk3pf06FhnrlEZ7VDYxkmoefUhg1hy
 ecljEaUhRbaBBEEtB96LwDKV+rlZ+vcgTM6plHEYVId5wAys41mjKlZLbHJBk8bPpiEmyc8C84M
 Iqpipqrm0hSwYP8/QkUO+0Wbt25VCDTAAO4fJGmkuxLxmpvoUkDYITSO21cPIk+YISRVy8cUJua
 win1kMWtIwEk+oOQJ2cKDKD41b66aUAGJzoQJ6z7oPD6TEIP+PTbIAboRzsDThBs6t9pfxQBOZs
 fPhhSk1RUl9RcaGhkdjMRmM7oUM07dVj4jSPyLi87tflLVjExa1xCP1yKbWg3Q7J1lr1zW1TCe+
 agXwZNy6hgyF1ulo2im5x91yFUd0DmKhx9/1oJRM5keavuOPxteoi70VeRuBQyhs2korMFbqOiy
 t70sErPbm9gFGCzbvX79p2YX/39YYy3UUhTyFlvWPKs1gCnDphkNvJzOhmSvHJv2njd8/KxwUd6
 3q4qpkE0RZm8xsvUOjjviBF/0xCXdoWSSsW9/9sLxqw1x1yEsplpHS1m7aaReVQ1xf/kiI6Xmaq
 IKYWuMwPdRmqksqptBbTmRKmRQA8wyRKseV1YHlGBkfC0aS1geL4hjotZnBCJssKW2wjnCHOHMo GUJM/xl5jHABtXA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: GMwN-m6gM2_q3C5zIoT-z3UEz4-CLJRv
X-Proofpoint-ORIG-GUID: GMwN-m6gM2_q3C5zIoT-z3UEz4-CLJRv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX7FZBpFAxab0t
 8o9lvp7uv/Ih1dF/njb+p+v85TOqJowGOHFe0bci02mK3tvNsGE9Z6AKcvaNbi+zfDn7oQD74I1
 SYPujz8sCWqsYD9yj6mgHg7ZS6XKoj5/C6G9b3STNUlALSaA4jvm5YRddROhgFrouCxlp1Xi4PR
 bXZzFzOMvi+jzhrwY6v1HAOrXR2L81FKw2l7DAml0XOnYchOFBvbWaGrrVkmfwDjsxQTD8g89qw
 i13e/z2TNkxLb7t7gD9/H/qZXMniiWERZpMFTkcg24T2bJVvsbWqYxs6//lm++naAWPLCiEYLqg
 p+MZ1mpJhDBhPKWjsX3t+lVBhnXFrS/e3GcLlVA3oX47O9rE6hEfoZqj9FHQcXN0uKoL8ypRkQn
 XP8ATizENrfRYg6JOl/DC2Hth1kAiT4ZvkUpOl41vqqIpkuOpVc/TeFHDfej9/qHa2A9FhyRE+p
 m6gnxcxFz3rvkVWS2Vw==
X-Authority-Analysis: v=2.4 cv=ev7SD4pX c=1 sm=1 tr=0 ts=6957bee4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=2d2tOE_QhKb7NN0EP5kA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/brcmnand/brcmnand.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
index 835653bdd5ab..0427d76f45d0 100644
--- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
@@ -3298,7 +3298,7 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 {
 	struct brcmnand_platform_data *pd = dev_get_platdata(&pdev->dev);
 	struct device *dev = &pdev->dev;
-	struct device_node *dn = dev->of_node, *child;
+	struct device_node *dn = dev->of_node;
 	struct brcmnand_controller *ctrl;
 	struct brcmnand_host *host;
 	struct resource *res;
@@ -3486,12 +3486,11 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 		}
 	}
 
-	for_each_available_child_of_node(dn, child) {
+	for_each_available_child_of_node_scoped(dn, child) {
 		if (of_device_is_compatible(child, "brcm,nandcs")) {
 
 			host = devm_kzalloc(dev, sizeof(*host), GFP_KERNEL);
 			if (!host) {
-				of_node_put(child);
 				ret = -ENOMEM;
 				goto err;
 			}
@@ -3509,10 +3508,9 @@ int brcmnand_probe(struct platform_device *pdev, struct brcmnand_soc *soc)
 
 			ret = brcmnand_init_cs(host, NULL);
 			if (ret) {
-				if (ret == -EPROBE_DEFER) {
-					of_node_put(child);
+				if (ret == -EPROBE_DEFER)
 					goto err;
-				}
+
 				devm_kfree(dev, host);
 				continue; /* Try all chip-selects */
 			}
-- 
2.51.0


