Return-Path: <linux-arm-msm+bounces-102718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLuYA+pE2WnjnwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E4A3DB8A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 20:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F994301F4AF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 18:42:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 517593E4C7F;
	Fri, 10 Apr 2026 18:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ek2r+GWI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TlJDvuU/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088EE3E3C54
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775846542; cv=none; b=amRnntqkcibb/VSvQ5rzaSQpVozeZIlfB8qhh2jIkA/DsfWSiOKSJeEnAeWer/R8N+GogtGfHE6Cht1Vy+v2WtgD3Ce1Ut/jflEfszNGCST3yjV3dxKjwFkbQyAiO5wbws/rOmmeua2O4K15a4EYS15t7VldUXOazZ0efNIksbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775846542; c=relaxed/simple;
	bh=mw7vvM6+HKApmLxOCYfWgBXtsa0fw0TBlq99ZWtHJL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORvca2deR2JN5oLzQSJI4laD0v3vG01tdEKwLlHwEZmt8FbFYqpdPaVarzg4XhaXOFvDLsBmLSn8i9jWed1D+u5UJZgylNJIwrnlu8vTe72PTgX/haGteylnG/wDn55E4HePPCdQ9CHlUxjCPsuXlf9DnPuD9/B2B2kENpWwE3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ek2r+GWI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TlJDvuU/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AHOujO4148365
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DoXxJ8NEvA0
	XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=; b=ek2r+GWI9t0jgeW9bexQ158+fsR
	9Zf5k9UlctkM2hywVqZnEe1VoRPNHALGatf97uXpftovkRkg2wPEuSdgrdoWoNdC
	A7Jv+HQoZtgSEk/6OU2wzPFE67XaR0W0hTROIZcd67hqv/HwLggVQPCufKe8Tyiy
	hjHFXP1039DBKaj5bWYkxDfUO5NPAAVNif4/uq+2O5lfdt+SNp0otOdJgP+2TqKa
	QAIVFX3j5X+6Xys9K4RhgRhL41qGYAqz3e4qaKoyXf94ALNiDxQR0O8ELj6bDdiM
	1qeybu6chlfnqirymtsuAiCkjUCWiqM8qOQApEZZK3Yc5MFIIz5j3oN9FPA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgjhf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 18:42:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82f0e12d375so634205b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 11:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775846540; x=1776451340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DoXxJ8NEvA0XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=;
        b=TlJDvuU/xa7jqQ26ZnbQel18zlW/PUOcTHEDbOEZAkWdoU8ZIPLdpLTP3nBmyfi7hA
         v/2gs1mcOEc5YeeDuqyxHUcB7408TX5e3GB3jxgTvVTPdoVNYN49RGzcG26gf8hVO6rg
         F7OTp6UsEOr5E4jf8oDoKZ4WyY6DrQk2wEbTrjeT1CZGC7tw4XeDhbi5o8SDM3H3f0D0
         lNNuHjyOPjgYFKMDshjUqMLBgNSS1Aj9Y07bPyDUbtbGl/KKdaCazfss3tVmVlFG/aXa
         BAip3DGuPZ0pao4tOUwessU8IhoUyK/uLLnnhVtrj4TqTH4rqOqIjmzToPFrzX2AymWP
         lwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775846540; x=1776451340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DoXxJ8NEvA0XYqlc3PfgDIa2+1HCBJnmm1ZFq9D7Jgs=;
        b=b9u8fgxEvPJ/knHipYZT0dqSniaobpkK8kwEJVZEIrXzOhm8alghe196DaRW3iQzrd
         Ht5ydzAF33PUzD9mR5aO7G6uSaNgYzbaz78VliLXgj/PXh7ile4wBSHuEXANoi7ZaOOI
         htdu8b6qDsJ0d9fqxWYDeNJgF75L6OyIw4gLCRGxIDvULpR8EZ3elKy0/49C24qKTukG
         yiSSkzbFRg5t7cABgGu5wzTAxsf4qoc5e3Bf8x+sFfE1tXorY2fCwNtnJ7ePfp1CBhmF
         Wux+7FaSFFeCWUgTeCBJzzKgWjsIsT8XgTtBuUb/W+H5RosqN8k++ECrTpNbd+oS76+D
         +mGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgYJhU6RAOQcE1EavoIszQswnj0pSibzxRl8GobxSdLhLiVSbS8xwrkXM5pucUmvrvzmBZaetKnpyEorbm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy6GEyoyOxf3eynnc1bE53MhAASpIzuRPDRnOf5gJ7Ow4hU/ka
	xlfTlJNFQzmL9jcElagb9H/PE2uXh/aNQtzzLsOrqElKkJAZ9kOe6YJbfDzsG7CXF3ojvosa68L
	J9aLC8K8GK3UHnLKtAESFLUuJrRajLrbFsEKa5vfH9N92C3uQ0u8Bh0fWiz2bCJCiQSxX
X-Gm-Gg: AeBDietQb8hZrTgmfo/IeCsEOdHGVOTkDDAx2yYwDrNgfTyVYOnrMZ8UvZ1vDuLMpCM
	w8xXh/tET6rIF0Wtsm6x8INEvVSSIE2/OlJCmgnCarA13iab5lkAb1vonuef0pEyZlbDh6xQCk7
	hggUMSZSy6qg1tglbHiCWbGjrSkgv4dbnQsHvHXr92h4R8y1G3B3UqMUu1LLJA8IYurbd1fYMT2
	YDY10OCyDoiR9c94CsGQ2Ou2XSSHsEVjaosg6Ev1NFWxxMqHG5ZN1iV/OJdSakIGW4o/fbCPAUz
	+pjI2ZiCJK1OOwcN58sLYVaqOAeG198B4URU+7D7M1WfkCRKJ4GI9RsknaL53P8wFh/lV/i4I9H
	7/g/l1yKWEsVfOC+yKp03zTnx2jb5XV+O8JJhmZAtmAjQ4zlb
X-Received: by 2002:a05:6a00:ab85:b0:827:3ff6:fb72 with SMTP id d2e1a72fcca58-82f0c35e51dmr5159256b3a.51.1775846539393;
        Fri, 10 Apr 2026 11:42:19 -0700 (PDT)
X-Received: by 2002:a05:6a00:ab85:b0:827:3ff6:fb72 with SMTP id d2e1a72fcca58-82f0c35e51dmr5159207b3a.51.1775846538859;
        Fri, 10 Apr 2026 11:42:18 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c32e744sm4036922b3a.13.2026.04.10.11.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 11:42:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 04/35] irqchip/qcom-pdc: Replace pdc_version global with a function pointer
Date: Sat, 11 Apr 2026 00:10:41 +0530
Message-ID: <20260410184124.1068210-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: buyi3f3WRGM88eARfMrEaltxpGC813Li
X-Proofpoint-GUID: buyi3f3WRGM88eARfMrEaltxpGC813Li
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d9448c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VJwwGsi7nLGkcN4Jv9sA:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE3NSBTYWx0ZWRfX7g60yzyjMcjx
 PmOKUCASodCMXh9Vzll1yWjEZBxLXVEsUFSbo8WAbp6T85sxKGoqE4mi46YZrBK6o0j0dWIzrGr
 xy/gUnnj/sOOCjBfoaj054lV/IxdbwKxsIp+Jopp6lFFZ639ByH8SItbIAB6JgUaO5BT9rgkbUx
 lUHk36Zcme49x0j7CTjYSOqtcEfzxqRKFi9t7f20V7VfMA5h/Swxh5xLJELlnnMGEnWT04VcgeL
 qRDwPzCrlNYrBUAaxxcJcOfmLMMn8zQBq6xTWzt5v8tEMz+7kvSEDochf00EFifA12ZS0f4GKVP
 WozNNp/N3Doy/1KryH1QbkM2cOUKsA9HUukNLKr5/679T6Hn1TyBVybDKevRIPTmVhVvEzOiUVb
 9nlBxzl7ghBEUrJJytVmZhjX023KcIwa7l+DcGQ/4ER2lMAV+FltzYQ9vPt0wB7c+3/QBRIDhwW
 2yJ2zJ6fqjvHM4gpvCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100175
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-102718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 62E4A3DB8A7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Now that the two enable paths are separate functions, replace the
pdc_version global with a __pdc_enable_intr function pointer. The
pointer is assigned once at probe time based on the version register,
moving the version comparison out of the interrupt enable/disable hot
path entirely.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 21e2b4b884ee..734576cdce0c 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -51,7 +51,7 @@ static void __iomem *pdc_base;
 static void __iomem *pdc_prev_base;
 static struct pdc_pin_region *pdc_region;
 static int pdc_region_cnt;
-static unsigned int pdc_version;
+static void (*__pdc_enable_intr)(int pin_out, bool on);
 static bool pdc_x1e_quirk;
 
 static void pdc_base_reg_write(void __iomem *base, int reg, u32 i, u32 val)
@@ -123,14 +123,6 @@ static void pdc_enable_intr_cfg(int pin_out, bool on)
 	pdc_reg_write(IRQ_i_CFG, pin_out, enable);
 }
 
-static void __pdc_enable_intr(int pin_out, bool on)
-{
-	if (pdc_version < PDC_VERSION_3_2)
-		pdc_enable_intr_bank(pin_out, on);
-	else
-		pdc_enable_intr_cfg(pin_out, on);
-}
-
 static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	unsigned long flags;
@@ -400,7 +392,8 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		goto fail;
 	}
 
-	pdc_version = pdc_reg_read(PDC_VERSION_REG, 0);
+	__pdc_enable_intr = (pdc_reg_read(PDC_VERSION_REG, 0) < PDC_VERSION_3_2) ?
+			pdc_enable_intr_bank : pdc_enable_intr_cfg;
 
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
-- 
2.53.0


