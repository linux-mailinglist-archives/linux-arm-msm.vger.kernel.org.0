Return-Path: <linux-arm-msm+bounces-87243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E826CEE9A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:59:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D9B43012953
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:57:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F76315D30;
	Fri,  2 Jan 2026 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmpnDve3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ko/OERJi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561DD30DD37
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358196; cv=none; b=hKJt1/voFpLbffL5BV68SZepLTmlk7Ss8T97wmebV/W21Gpet29qVXpR53xMg4pu+9xhmRhvYkdrIxgXifN4Z7fQ0pKXeLLXTU6jnZNX+SPH3LN5rbxS99iu88bVcvUS2YKVaO5RAZIzFSVCSLMzN3/I4KGX88a+36vo+Oi3iZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358196; c=relaxed/simple;
	bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QFZKyH2D3KjLtfxfoTciBFbBCMreXeu7+H7VJhDlCd51BVl9pROOIkdakn7v8RUDqP/R+HufNBysI28q4qnLnNtCL1lwgAlzTdOnyP/ckg040E7NmDOlBpEWoiKXL2t90/yKDsVWjgIn6MDzAeTPglEIBYABT0hCX0pIwLRVRf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmpnDve3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ko/OERJi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029WE70207477
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CyANrbDJtTc
	MsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=; b=DmpnDve3awo0W3rdfyzH5C22aqa
	TORbWNdcJzQNWZg56Zjt6rO8lbBHlW8IkQx2duah75UjtnKbB/KB8/fmnCTFti+T
	cPMneOyIkO5q8R/0dSjzMq4cr990VmIEsKcQUb78yCe3lCoVKMfNiOPa1JGDW7as
	pskqdbw04ACjQaLDlXHIKjIbq/1diRDzkHPJ9fg9p1wLPzW15PIJhQ+3/d/z99PM
	/rM6Mj0v9zmn20aI17yAEBFiXrWnIlACaeVSN96YnnsSgW4dZjYrU/kzlf6M/HsS
	VMOU7stcLEjKi1wGZO9BjX8n/NddUJSVEYkb0L1CZb7RPpZ+ZUnpWaJEWuA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bcx74cgjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:49:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4fb2f0cb59bso67844681cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:49:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358190; x=1767962990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=Ko/OERJijGskKUYAMbjtGtqVMp0xWMM2UXLydKZDtfrB6CayI8pkdq/Tim6gl5abOL
         kAkEYpbZlQRS7rzFo70g/V2F+4kcnBTCLIXqhJklizd5+ndnjxnFaf98PUcCX2E0yAa1
         3f1k3lxxHcN8LItdR188tnIinla4Oe4LO5PV0zJWnXzrG/40mcazA6v8CZVeFEH21+Ve
         9HlyXbSzV8cDUsRizTxPxGWSlUywBly9o9qdgozBjgXkMgjRWCVyTCBbQQH8famAKPhu
         WJKRwKJilNMyVoGsyC/N0Z6R4caHn+AmjYSiP0Vu1FNy4Vfd5ORthyXY3EBa+Sm2yqfX
         is1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358190; x=1767962990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CyANrbDJtTcMsvrvrXtr1X2z0JYHYEEC2zyeTG24RQQ=;
        b=LMQGmVhhlMWLFH6hLblgGGsHqTiL2OalJYpZ0CQo/g+ykQzyNKKCAAehmK6Su1o5zk
         M9rYYKjUUH/QVuVj/fuCcE1I+r+laSzhtenwofhCOTpoqI8mlHZ+nU9XX5uwOOVMzToe
         Z/tGmhVpRerMShkjwmVoxzVCcw/tJJGOPKQLcgUd0UCDr0sle/XxF36NFxm2eonhBugZ
         X8sAU6UNIAWQrKC00GvhQ9UC56xX+ubY/3po6aDJQQKnxVkE9GsQ+37Uf1xZn4tymFrc
         kZchWDpASsbt5GP3b3ZJeOpyBlj4tyc0KkxAhBravvtRHmQw0bSAM+6G6rcMLkcd82aB
         CoHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGAuTyU8C3Ce7/Y5vxFMOAo5riQqNFWdfUYNHhdtCQ2ilaBewHT/Mt54yFsjk7EpDVQi6/EO6uuV1hoOPf@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjo7O6zyItPRXIULZZFOSMdUcKHdLyTw9PDxRt+ZwxrttCPsI6
	eo+9cTHVQUF6HEA7csnuYvwBZqllSc8eq/OgsUJWUHPFWwfOKgGvuu7x1FgkkT3UsVCF0aPO2IG
	yRJufB3la212B1u8cTjgH1PThgzXFpi8rVe1uTwku4O31nvw5r11UIwPLIBp4PMRJHagp
X-Gm-Gg: AY/fxX412wbhBS00bsx4MIx07U/q6RpPyO3epLbDYHAOQKDGi5iKIvtpNZ3MN5MhiGq
	u73AY7Zec1bCCHOZVNkN/BDxQJ5014RHUd3IZFTTxOoOHT6pjOQvhb6yO/iQlnDdCw0gE/mszmB
	9M4zZYio0g9/4Q1YLAgrn8RIdfPG8NNDh1rcqzskDb2Rv0LjE5xpxsIM2OVfwthvUEBf6f3R0hm
	T6mzP66SnBNFgARwbidG7cNMCBakoefSwSBPF6fanSGhdF/h3wJXE6i2ifdESocwEgkGeP7wYoy
	zgrARrJvR1lTFnd6Qeic0UBtiSfRUGkY2zYCahzokwi9PEAAqw1Sppic8cpfcrASMu8MQsfbTmi
	+gZrnG1LcpuJv//T619luDsrXmg==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793751cf.33.1767358189633;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEE/q2Fdco9ouztC8TyOboLodLR4WhdA5l56Xei6ZNTD5e80NDvaw2UNX8OTeAHWG46RcFDg==
X-Received: by 2002:a05:622a:cc:b0:4ee:9b1:e2c with SMTP id d75a77b69052e-4f4abd35e3emr688793431cf.33.1767358189222;
        Fri, 02 Jan 2026 04:49:49 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:48 -0800 (PST)
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
Subject: [PATCH 6/7] mtd: rawnand: vf610: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:33 +0100
Message-ID: <20260102124927.64703-13-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1186; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=F7Kk+7HLc+g1YYGm+o1eCX8RgtT9tyzfifARk7ozNSQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77cLysMrmgaG5ns/nrL5d4zYXzAy0uQLWg8q
 0r5eyNewxqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+3AAKCRDBN2bmhouD
 13FXD/9fEjxdaWR32ImdhxvYI31+PdVTzd9S/Q5khkafnHnb8EKMGaE7OsNzBLBHJG4AOWrgBCl
 CWgzHBZiLc47tW++MIdBquoQjyPW20dk7ZIO9pM5KN+iQRXFYUBEq/qc0GihzXg3wN+1EE3EelX
 Tk6gedm9V8pTx9Q53pJBoPGI/ZbKapdK6+ocpHrzoI+zwOr3krbdJLxBQcLvCuxZC9Tvdh6oEh4
 qF5BjyN1d/0LoOeCEnVvHmgRBoZOtbZGGc9H2D3vg8Uc+Q9l2TRzsGtRHPhKbUq5y4SdiL5enw1
 eb++MnKmb/DXKIMKZqNA6Q0rXksdUe3xalqwXUO4kB+hUYuvpdlFx2Z3jrx7yfy3K749BMLFECk
 0zvPnXff7zmkT3aTFHHM+45A4GDHHNcov93/1/c6uFJTsMfAm1yatvEpcE/7jhXCLwMPiMsCjT1
 YP/3hzKfctE4HyqHOTpo8Pn4XhXUWfKajWtWayuYTUAiKVZp45XJhOv1cfP0Tcd5oou5ME6xQ0+
 JULIMJZAXU1KgkWUUGK0kSZO2HZetOzthobPuj2rpTfZUDlVzgHzp1sp3hEKtqtb7WvTKHmMZW8
 rSRlT3WRjDyQ3eTMH0wJt80Vf0yxE8Fh6Qom/7VAx9fyRLMgIQaRTm0FbxrTOO6buxu6X2ev02U kJETjK/2HOFFt8A==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0j1eRrT8nVZ6mE7Bvxe5AC_-J4p2cUbI
X-Proofpoint-GUID: 0j1eRrT8nVZ6mE7Bvxe5AC_-J4p2cUbI
X-Authority-Analysis: v=2.4 cv=HNvO14tv c=1 sm=1 tr=0 ts=6957beee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kVq6N5mEIK0mURhpU1kA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX0+l1AltlpXyJ
 itPdgKKmjzx3uiVOmFiOCDcHylbPN5Pow4TOo4V45i0QYibX1phpiSk8bEv3pkoY5DPZ0iQS8k4
 DSfKQ+SCR74Kf/cYf2Uq5/JVwylFqdGsWSxdVSLwEOowm62BJj7cXmd2qU5GU7HYoZ0ayars/uD
 ST1H0DH01wsb7+iLg+zYQ8YCp185LUmAWOKVUP7eZAtWk00X1u8X2nlTuSnO7aO2ECf9jDx0UMN
 R3HwUxtJ1b4u0O+CZaiMV5RhHsGj+sXpONQ2Ul4cnFdtFJEnM/8OSW28bns2KZ5Q7JDgbhD2/ed
 RBzevrpLXbwERIJ4ogysL31VaL+5n1of9NSem2U5WaugSS0DYy3vIyE4Hp/NpuQoQOAIJm08yWE
 J9PsmDuQJ/OwUKwIazH37sV8sdo4pBSNw7S2zK01zytTev/4yWHHrWEORG806gwaxOWmvj9SExj
 yUYWUNItvjxS+Ma5EiA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/vf610_nfc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/vf610_nfc.c b/drivers/mtd/nand/raw/vf610_nfc.c
index 1955dc50b40a..9940681810cf 100644
--- a/drivers/mtd/nand/raw/vf610_nfc.c
+++ b/drivers/mtd/nand/raw/vf610_nfc.c
@@ -810,7 +810,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	struct vf610_nfc *nfc;
 	struct mtd_info *mtd;
 	struct nand_chip *chip;
-	struct device_node *child;
 	int err;
 	int irq;
 
@@ -844,13 +843,12 @@ static int vf610_nfc_probe(struct platform_device *pdev)
 	if (!nfc->variant)
 		return -ENODEV;
 
-	for_each_available_child_of_node(nfc->dev->of_node, child) {
+	for_each_available_child_of_node_scoped(nfc->dev->of_node, child) {
 		if (of_device_is_compatible(child, "fsl,vf610-nfc-nandcs")) {
 
 			if (nand_get_flash_node(chip)) {
 				dev_err(nfc->dev,
 					"Only one NAND chip supported!\n");
-				of_node_put(child);
 				return -EINVAL;
 			}
 
-- 
2.51.0


