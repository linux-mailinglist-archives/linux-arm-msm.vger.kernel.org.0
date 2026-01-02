Return-Path: <linux-arm-msm+bounces-87239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32803CEE984
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 13:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FFA33000527
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 12:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05917314B76;
	Fri,  2 Jan 2026 12:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCrAMEE9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RG3QjPmx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C9D314B77
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 12:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767358187; cv=none; b=SI7/Bpce7hAifjM/UxkBiSWlLcP/qOlNK5fMk/iVkDssbx5RSL/OVNu7WMZ01CeODYydSOrfpu3w+cww7Q3l5Cf/V+w0bVCUPlP1stBcfU8D513gRgFfWbMqSwchV9zNqyHBVncn/fNSsLscBCWNmOxj7ofwqKtP6YIHVxzo8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767358187; c=relaxed/simple;
	bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SYtzilFUX2+nUj6wSwP+81lg0D/c4r0pXYA6zoNZjezasrXl5gxgSz4+yRaTE0ttdU2OZswdSRVKdNWmXzA9bfr9vdRxaQ5RWHSMTup1B6RtR1RHdke9P7k0agvOm0OSca7OVG8pwrVZTfnqC0zwKUlrrXkHPAOgul012R4Iav4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCrAMEE9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RG3QjPmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2RL1002055
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 12:49:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=imFOXG0sly0
	peMhXKSlV52oA/rftbzRYv5spTS32Zjk=; b=FCrAMEE9y+id5h8z0DN8Iv3OAug
	LLDwb3y27vUY1LWNYcWH419RuN2r7zqKpuzEtAErsnFf02A+ZmyazLwhnXaW4NnC
	VAMdG+SQG0MiQe6wb3bBKYlM0bLiOkDVNX4898z5ahnuspizgZpW1Kp7R66024XZ
	EkzwENB6GGwYlvnOjGe4/qtgUPJFNDI887RRJQ75JEyF8Y8DZAuZFGuTcIeeMtzK
	k/PHYlbnqsXMlSCfZ+n/eIYxlBvqDgb6hfrB/sM9vbPR2GunbwGDt1632bKwN90M
	B0r4aW6wzD1BmxYKXtyi0uDRFrq3qkpKzdjhNsI34K9YdAWVZC/VeHxwD5g==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb3ybk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 12:49:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a43d4cd2bso146461756d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 04:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767358182; x=1767962982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=RG3QjPmxOVfw00RTZxr9/HXrK8Ml1hBI8UIuqvxHfTHrPGyMUDp394BQlv1L9rhPdF
         Jfzti7q+s+xExy34ZF9UFJdNGdDaE9nG4e03UmQxjqKe24poVu3GowXem/6EO8aHXye1
         nRZvI+09mhnd3Gp9I1vpqG0Z7BjVxdAUR+Wsalf1wyKN8K8bzKsM/fNPJ5JfEFfGW8m5
         bharEDAPyeeRjH7COwjOi4QnhpGB6JCSQr6nZBzOwVmhSUn8PZMhvzN9frSlbjPQxj8Q
         gocDqB69SWchXRLVX4xTFBog05DxWrdl9CoRz+hdzNknXYlVTgctzObw6omRZs7Qop4D
         HycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767358182; x=1767962982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=imFOXG0sly0peMhXKSlV52oA/rftbzRYv5spTS32Zjk=;
        b=L9TSV2MV+cfmB2yRNzyBIIgJJv+jna8aky6BAOQEiX9Z9a6RNsAqRElTpWNzOz6RTC
         ZJj3AYL/FeGmBcvl+JI39jyUuBz04WFhIRnmGuDr0rcI2BYjaTzbXw5515Q7TAYl3ZaR
         GaEh+hpvwOKFM6UvuB+hZ5ZLENaat0FKL0qjaXhIeYygwGnCcOO8ZSyRw1EotG4aUYXH
         US+2OwXoLzzf4eSd7iSZGR2V3TSAguitHXcL2Eh/F2pOAQrxkoRaPL0ggbgdpE+KLjwl
         IokV1eBEJaYzBQKEhwmUW5l18wcwx/c4LrOcJBjJB1EKKYpYjPaVW1TUEVf4OIobalwS
         JH2g==
X-Forwarded-Encrypted: i=1; AJvYcCXGA+5khPaR28SJZAyx8q4XbolXzgrrIZsSlKyN1uSGBuCA3oTqXCObpHciUhul2K9Ta+2LvaqdBeGBCqVa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu8rzRMwJd7n4QWXs0yvS+fdOVEo4hgibKTNHkaXyMKA2UpcUF
	F+r3FZpwUOneZyA4REVa0miXp74VCWzi/Pb1SZyCg1tTU3WnxM+/Va9IjgunQfZvfomg9ylKjOl
	XID9Ix8noP0zGR27HfTYsV7+eRw7o/p0bZSAlvZAya9rcVh2rNAC6rppxhjl2NIFeIRm4
X-Gm-Gg: AY/fxX7owDtiUO/NONoAVq7J6GJ9Ug8quHcmakbrlgWiOxzyC8Pc64nPTZTlezUVgi5
	87OLqnCpme7FPpF6HvTWmbHuAXiJh64GUlezPBgWwSsXTen6SzdgLiQKlV3Y817b4DY8IDZqATS
	bFJZWypUG9iQTiJJvA2AvqftnCcEc7CPcf6lqtnpfi6Wsbeqe9G7SVUe0hOwjJAMFkhoKl0tJIP
	WtBGZEP1LWblhaYNYpam8iRavQL6UDRnrzeR+idw1am+EXqnvd29KDqdDwN+5BwBSEI2skBi2Sm
	OnEh8ZZ9VpuT4Ey3lamPjmK1Fc/M5pjA/3xc8tko2Oo9A6P7xSFF8zEKH+SQrnC6LJMZQisrnE9
	Ngjx1+2IL540xI34/YeEG5gZ0gQ==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284741cf.65.1767358181995;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHT1txQdBszLd7m8UMVD5gJdJoPAWm8VqLTOz4fR95P96AkN4L2pVtSv48GMc2uikngxpnUBg==
X-Received: by 2002:a05:622a:480e:b0:4f1:bdba:8cfc with SMTP id d75a77b69052e-4f4abd942dfmr645284561cf.65.1767358181601;
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
Received: from quoll ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82f6asm86385833f8f.27.2026.01.02.04.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 04:49:41 -0800 (PST)
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
Subject: [PATCH 2/7] mtd: rawnand: denali: Simplify with scoped for each OF child loop
Date: Fri,  2 Jan 2026 13:49:29 +0100
Message-ID: <20260102124927.64703-9-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124927.64703-8-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1147; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sBSnKcyMGQZIqcjce3lbMUghOycYQyfzC3HJXcyHbGY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpV77YCiAV7tcHXkpkf4bqBHwky6Qoz/np3HIyx
 MfEw1pn1cGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVe+2AAKCRDBN2bmhouD
 1wLHD/wKh5j1mcOQ0K6bfHRhqc1Y7UiVom1LjviO8AE6GDqHLuoea4sq82dEPvdB+iw7SIEIXbQ
 /xFNf+KfiDchxyuxQ+T4lGaZ8x6WAAx0X4vteAWTqG4l01FoqMBj8pVs8qBvXtJfczUuSKKWGty
 lHel4Tazw/t21yRSf+Y82KLxdE7EkZ1dZ9b09IJGrmxFmKcEVFlmzgW/Ld1sl9E+XavBpplsQNq
 LctU5OBW4R4qvqD4kJrYscewoMoQJTlPu7InLOkeqyCRUCpl1Fym987mlu28GZBYQuRSajHDOXT
 f9HPbuEodD8mLWu+8iOURU8OZ98wCj00bgs9p9AEVpoe8tnYnWUVggb/u4Ip7XbvZ0vnGg21b8Z
 G56JQoVCjK/KyduNGUkZVvJFEzQ4v+P8o6tMqlRKP/5sloqZwug29GVuBXi18Ul9gKVDV0EbgdG
 hcSii0FvyI6jaIIl7NF5ellj+qXUqQN8FKeIMSBZ+60IAfUzpoXB0fNsg774Lvkz+GBI6M+tKvn
 jWAL8vTI9b0K4sQD2rMh7u5l57MqBjUcDkjePNbPtJAHosyqtON/Jtq/BOmd/ZGkQZc9G2L8V6T
 n5/m44JVJ43AkOX905OuLvpKD/yO8gd+PLKiSENBUMdvNiyqTKLIkQURI2ozDwZ6l8uaIy/61OK 7HM+k/p6elpt54w==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qlmAWIkhTpdd3PkmUvclsqCWQSYI3q2Q
X-Proofpoint-ORIG-GUID: qlmAWIkhTpdd3PkmUvclsqCWQSYI3q2Q
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=6957bee6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=nYNvWqTqVqtrO4BW6YQA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDExMyBTYWx0ZWRfX2yhNCJUO7nZ5
 GA7qyBsXYCC/SAymul6ScVVQpJyf8Ge09WPfm/TBgeXHpbUI1LQ8UhZItcFrJIE2NccKNkBwL/U
 iLPBop/q0bQBbID32M9aNtXrkxZLno+n0f/igrqR+GJbPg6tbOq6Yzba/ifzXmP4FQ3NnaHYh6J
 GUut9E8N4nikOlz+c0WGX7P043yl7m9gMlh+O0445hII7S3Lrt38wbMMsEJWURvMBkP6voOwC46
 4567zxupBgNtsPdaiHacbsdD45nea/ZAtlbSLhNbvqPV2XhM1VsRm/UorBUIAMZIpa23eVwsBgL
 I85bqOrj4epNSuroxqtr1oys/SU8MCc9QIap0BgJkq1M/JnSYPrvB1Yy0/iqeXSvd3+YgYRTLmg
 hDOGZPkPlK1xiHuroQfoL8VXaNBrakAXWw47puE4iHrT9BYNeHfXVV5ijH01Kyf1oMfeh1RQvmx
 c3bJGS7WH40FjkQaqmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020113

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/mtd/nand/raw/denali_dt.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/denali_dt.c b/drivers/mtd/nand/raw/denali_dt.c
index e0dd59bba4bd..8c822eae72e7 100644
--- a/drivers/mtd/nand/raw/denali_dt.c
+++ b/drivers/mtd/nand/raw/denali_dt.c
@@ -115,7 +115,6 @@ static int denali_dt_probe(struct platform_device *pdev)
 	struct denali_dt *dt;
 	const struct denali_dt_data *data;
 	struct denali_controller *denali;
-	struct device_node *np;
 	int ret;
 
 	dt = devm_kzalloc(dev, sizeof(*dt), GFP_KERNEL);
@@ -192,12 +191,10 @@ static int denali_dt_probe(struct platform_device *pdev)
 	if (ret)
 		goto out_assert_rst;
 
-	for_each_child_of_node(dev->of_node, np) {
+	for_each_child_of_node_scoped(dev->of_node, np) {
 		ret = denali_dt_chip_init(denali, np);
-		if (ret) {
-			of_node_put(np);
+		if (ret)
 			goto out_remove_denali;
-		}
 	}
 
 	platform_set_drvdata(pdev, dt);
-- 
2.51.0


