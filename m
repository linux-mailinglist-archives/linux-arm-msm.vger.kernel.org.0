Return-Path: <linux-arm-msm+bounces-104630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yEbSFKAL72kq4wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:09:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D845A46E1D7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 09:09:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 628B8305C484
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 07:02:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF61A391E7C;
	Mon, 27 Apr 2026 07:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jD2GpORG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dOvV4eHk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889F3390C95
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777273289; cv=none; b=ksmI8BNn7EPyb5QGlWRNcwEzkHcWMzcgsiztzf42p+7vWU8D8Ig/32DAvpo9lDbeeycyQ7fFvVS0b3n3O+ENzTghQ7N0qQig9lgrvClRk/j5/f5RWAl9JTMUCzqaPdqTcBtnnJU8YA0qyMbIM6HpZs9qJs3K+T8eeSQ7IUe7uMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777273289; c=relaxed/simple;
	bh=UtQ+L3x6k2m/I3RepM5IycHtlWJmPDFntTs8zLCTVLU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iHcVfins6oW8VjNhuO2mpDzQClp1FvzEwTIUv4BA40ObjzeTeiaKyx+dNz8d4V3/eO6kC8yOVM+VfRRRKOJv4jfkVw0dT9U4qU3NAX9/XzHDXi/SNSCXoP/Tt0oHJYxqE7xQpjGGM9Ww7kLSizMeN5loAT1/f4pArqRd8nCp5O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jD2GpORG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dOvV4eHk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QNUmrP2752011
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3VIDLSDslTAjB8QHSTC/y07YboCRBkKoF29
	IIlsT290=; b=jD2GpORGehnw4QS6C+U3PXJt4mGGsAsoftmo1llycyDO6bnHzc9
	po7pY05kZ6kJFU020rHZT+LddvxGSdI7FVr2DDjOxmLIqXljD631FjBlIrrxdmdG
	dwAMV0v48Fd88MG8aviigHQOMOAMAobe5F66LrrFyraV1Zqn3stSzkIYhYdp0fl4
	riUXzCdiOAgie8Q/W0dkS6IDTvTJ7kwLqVgycIt4T82ZPSwmiV5f3n+xP2q9aBvF
	35UmZjWim/iY4I00Rj5whEqV/LMDWBcgPhkcmQ+h5HZZ++zbopT5iBIrx5MhaQSZ
	dR6PGNEH2F9pQlafl+zOmCaUy25xHskjU2w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnqtcvpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 07:01:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56eecfd79e7so19698280e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777273287; x=1777878087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3VIDLSDslTAjB8QHSTC/y07YboCRBkKoF29IIlsT290=;
        b=dOvV4eHktPUoGTRwYoYqYR8D51hJRs6XkRDfKwgjqb7EOExh+f+HYsCvrtVjbkrPh3
         74eGL4CNCZxPELbeYj1+uk/ka9Lmf2us5eB1D8ObwOSuK+EUCqTD91PubiqnFjBOjD8S
         aZAwKHiM5i1CtSJOS9k9Acvg74ZAOTjX9OYC/PtIQbI9nA8tOdLts7PCHmVmVnirSMlG
         YWXs+AqImO3Ijw7agDAaBNm9zDIXB8Hqo7w7LZXPJxNLud+BOEJxKw2PKKONBL1gm7/s
         3fyPr/86WXposr0grn+lNqUYs4JyhYbiOmiP6czDk43tdHHKc+KbzpWPZGwSJ34ptyfz
         irrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777273287; x=1777878087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3VIDLSDslTAjB8QHSTC/y07YboCRBkKoF29IIlsT290=;
        b=m5Ml/hYwiRi8h9K5PmApb0B+EqCo3Q7WYk1AQAXuoEbChG3fQggxgitgoPgBeCcna8
         a0C5a8chiIgm2TMbB9YHpXfKkDdZ0V4lOf7bPsVduyviKZ7K4L4K3ZzxkHjht961ej0s
         JbUosiaQy8axCRQ3WIpXDjURY0ZkaacblKTg525eHUDTEqG9t0X/HlmByk/Khle4hCxB
         1PlUEL3pBbo7TXPLFQdmD6mhqqRv2Hoi0BM6iULByWJOJkHtjkiujrCoda9Zhx0C3a7P
         nwDbYxf96ORVHLozKTvMLpI3EZQU17fUc4vM0TkrnwH//GXYYbb6qQgR+c5Ms4DZsb/V
         nwkw==
X-Forwarded-Encrypted: i=1; AFNElJ8OYH9O8GMH/fnSgV3eYV5tD1RCrRQDX8+ekeysHWq5nCrxFyeU6qrewE7GS8NTPWqQ1EUkxWi8i56rDqOC@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFNS4iLiipongkfK5rER3MkMN0c2SzESyxt2SkYY5rFT3rzM/
	f/QokficXhRbiVDRzy1NjWIpIbFDgXY4uSqgpbxEuBdslaBuAnmbKOnR7XY/g6pNmlV6+5DxiYI
	25G/gTq2w5uRRSxnE8/bJo39ZIxS0ZMesCN6uoon/fPwkMSpRRsDKWHdZx754Ev42czxn
X-Gm-Gg: AeBDietAiVoagCDkKjVq6F7TiuEDllgX3ZEGzrGYQlFj/L+hsAOU+0iil6cMHPByb/Q
	vXBJLEr3+pfWOSbMSFPB1ovjWEPTMaEVcO3jnIfh+TDGve4TIRnbxH9JJFWqa3ltey+lzCqa8J4
	9AEGEEqByWP1B4Y/StuQ4Mu2HuBbB4Pk5cuI+dwXPFV0Y0/vXHpUg3bROpUtCZYEELoCMvyUuFL
	zli22Yr2qb0WHcdf18cmmBcYbl9cp1VfXJRkpOmuL+mfoa4Cl6xR6g7xtZnm06rklJCCgk+Cdy4
	XphzxjvJp8VE3ZW5AZ3FIVGGM+7oOxJAuicNLmK22y+nGSpo0smA+B0MY7dhMz8lfVvtLwsvMb0
	czT60nRhqVseEhLgpUyvOA2XsW8DVJlJqm+Ee0MjrjMKKEMR3vqW5Qk/146T7J/C/FLrFesEYPr
	rs9a99iOv/rw==
X-Received: by 2002:a05:6122:8198:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-56fa586085bmr15452839e0c.4.1777273286880;
        Mon, 27 Apr 2026 00:01:26 -0700 (PDT)
X-Received: by 2002:a05:6122:8198:b0:56a:ef51:4cae with SMTP id 71dfb90a1353d-56fa586085bmr15452826e0c.4.1777273286538;
        Mon, 27 Apr 2026 00:01:26 -0700 (PDT)
Received: from quoll (5-226-109-134.static.ip.netia.com.pl. [5.226.109.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a6114f2cfsm90334855e9.35.2026.04.27.00.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 00:01:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] irqchip/qcom: Unify user-visible "Qualcomm" name
Date: Mon, 27 Apr 2026 09:01:22 +0200
Message-ID: <20260427070121.18422-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=UtQ+L3x6k2m/I3RepM5IycHtlWJmPDFntTs8zLCTVLU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp7wnBZmkjK28E39SsgClVSuGlswvp/zckbrLmE
 4q+hgxXeBKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCae8JwQAKCRDBN2bmhouD
 153zD/9nRlOA5BcLg5Y9NA3Zi5i9cWr6SpTJ0FEbeNCjtWq9neqTtXpcEHrYgVISXH+BMlIVRhx
 YdmQrH9NZbJiqnpNDnxDBDFgNM5RSWwJ+xb54URQmJSOf8x+UzoFs6xh4CYqL3S1oAWf+swWrvU
 xrLu86cAzRmKGYMfPu2mMFIdw9pVNltA6NVtaRznxNelC/sVUFQ5mwdwEbL9lYYNRciuEy8WTUN
 K/7nucIaifv7a2WQx2GSuZpVPQKFeE/zBJlNq0XM4dyn+zomVuFBJj+LZId+14GqqJfmc8/wEOR
 YF8W9rBTzAhA3TUsffgjrcraudbOqCEuBs48hVecqVWYNGWFSa9cOQccof/RwYmkR4D5EA2o3kY
 bOjF1A/xR/DTi2v5UnakxKdh2lQyQUmO51og/4dO91NzBi4rY9hklQsiv4Nt6YuERzlV54nVyoI
 tZHJ3ckNjnxBs2WSqe52MMaMi6zfWSKoRnEOUOoNcOZpp4BPZKuMag7kJ4+8Bfku2TV72mLnl5D
 EBo5sA03O/gJDQ6PmG8ddlLUMnd5jKKfH46KyT2r8FYd8qGhIZxeoHOOjEV8QsmvjUgpicPGf3n
 0LTr3PDlBOgbjinxvfLYLaQRsyZl/5dZlH6wxXU2FXkRx60mXR6puKmbbQ1Ika3m1jXLp5wn8RJ dvJRCHKxLpnsjIQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J42aKgnS c=1 sm=1 tr=0 ts=69ef09c7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=nnYKl1aPHK5ktf5uHVwi7Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=b6DI-oXz9g59OMEvRJgA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: I_yB1ToO85B5X49MaHI6cUCD2JfUZe5E
X-Proofpoint-GUID: I_yB1ToO85B5X49MaHI6cUCD2JfUZe5E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA3MyBTYWx0ZWRfX/6TRw1ENmTIZ
 +/p11ktzZ7spiE2ihvWpM4C2nq1bctDQby1mw6Kw2ylefZnJmNxLMec2JxtlllpVFVwVg9eQfDd
 Gwvdqn+DE+/mVS4Sy1TNH1M/CoZ/hmwXozzgL7L0bvuv6BpxWAQi6nyEYpKjK9bhtxP0CXgwrGy
 h1soak7Mfkk1WFYwoE+9BSiq53QpMtvSJok4gWDbpho9YIy5Rj9hBHyTCKoiUW/f1xL8CVBsaLI
 rdv4MUltoiuJavv7tnOkreLMtRwsWbVNF1JyO9eTvwJR5bJLS5Rcq5DBbqoT4RLfYGA1U+VbGCJ
 miBDQ/gaJmYJzh3l8XGb/lyIr4SItOyH7kXyVVa5EEpE/LrqBXx7VWsIZjmjcg2V7/jC9V/dkwk
 2YNgFFbhyDWjy7VAxnyXSpHQkJYTsaPPeRqntTNAgp5g5zlRNaF8bIjG6PbmMMR0guJYhrJHCeg
 yct76KKCnNkLlV5N6CA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270073
X-Rspamd-Queue-Id: D845A46E1D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104630-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/irqchip/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 753e8fc3b916..b2e81b415827 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -470,7 +470,7 @@ config STM32_EXTI
 	select GENERIC_IRQ_CHIP
 
 config QCOM_IRQ_COMBINER
-	bool "QCOM IRQ combiner support"
+	bool "Qualcomm IRQ combiner support"
 	depends on ARCH_QCOM && ACPI
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -503,7 +503,7 @@ config GOLDFISH_PIC
          for Goldfish based virtual platforms.
 
 config QCOM_PDC
-	tristate "QCOM PDC"
+	tristate "Qualcomm PDC"
 	depends on ARCH_QCOM
 	select IRQ_DOMAIN_HIERARCHY
 	help
@@ -511,7 +511,7 @@ config QCOM_PDC
 	  IRQs for Qualcomm Technologies Inc (QTI) mobile chips.
 
 config QCOM_MPM
-	tristate "QCOM MPM"
+	tristate "Qualcomm MPM"
 	depends on ARCH_QCOM
 	depends on MAILBOX
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.51.0


