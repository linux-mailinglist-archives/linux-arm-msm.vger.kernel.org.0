Return-Path: <linux-arm-msm+bounces-109984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIfrOd6/FmrOqgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109984-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:56:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B395E23E7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:56:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63C68305EAAA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DCB03D0914;
	Wed, 27 May 2026 09:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnMwfJyi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MY+oSgbY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA52A3E63A2
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779875685; cv=none; b=Z/IWdA++5M+DOOBpdWuQFs0mCuxpAgv6/4QxjwuDuVXPpG0anbjH19YC6iHhMSkTmHBWWsQ2sIEfZnOy8Ms6N4hAA3zhK3Wh+SHgFVQ8cM1tAA6CR1JArjTnHJA4Plxe9TgO6i1m5Yw5cDVyuN+M+IFbCErkMWqTc6HiyjMaDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779875685; c=relaxed/simple;
	bh=MR5+An37NAd15ML4waOaMY4k6XsZAofvxnc3GU1VTNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qr5zcHElDuHAgu8NE3aSt4mTOyg081iP31VGmbro6NAWTSYSVKGkSwjKvB+LVBeieGMyaCfTh3YToFrKCDClkP/oehm0HKtiTH63tPtwPH4Yop8k9SOGwOYbe2SXvuXTnaJ98sMbnt0WYIrg+G9iu0s0um8qWAKb19ku+tDJmrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CnMwfJyi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MY+oSgbY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mW8r1167789
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DGSuk3sdODr
	y297GMVF67FBYcsj9yvQAHtFTmxGI/58=; b=CnMwfJyintEcikEBZ5uC853mvo7
	4emj9GXoKDQl07jjKdmipJIiDmDGeLX6Wx+kaLcXa/2ithobn3AzafEZ9PcPSypo
	8ef3bt6huCCEur0qoI0Zc1XH96BsBu7rUoZO7RYXKFWP4wtbgOz2pPm/41T93l3C
	wj4ocAoLyXNVcYa9StbvFZ8x7OybxlTfsedm5nTi0Dj+lrXrNVqj89DXGZwtic7w
	UHBFGBP+sAni+uxM5NsiP7gG1IMQU9nTNXdpmGYRdLm2RmRpK6++y3vikt/W5+uW
	7mYsxvkbQT5BBK+aSMPOj1ZfDQw/UG8LYDvRVJ7oSrMo0Frk1eU0V7M94Kw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edfqk34nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 09:54:43 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c828cee4fcdso5520653a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 02:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779875682; x=1780480482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DGSuk3sdODry297GMVF67FBYcsj9yvQAHtFTmxGI/58=;
        b=MY+oSgbYQv/TIie/dkv/UrKlmciKsrNxMXxShK3/4Q7m+Chwp6p0b/JLLMmOcVIlEx
         cj6II6jRbX2CP+p9xM20L1erWeQlhA0ObnVPZujuqjyRT7COOD6vHDTrPJVHvqCyXSaZ
         X7Dz/oQyrZZ63RvrrwXt8ALMnWIfPTkRiGu6w+IFlgks4Rjcfn66krgkfQ3xckl9ZjX1
         dsWdz/LLfjd2E4yK/LrtseVt0gZNweiIVnYD2aAHvp4rDOpr4nE43lWJnsrXYwo+i4fL
         3DGWKKn9x4p9Xz6Dq9VDN8jjUc57fhjBzWzSiMYDsGQutvArmgpkGh6QohU6Ow9ioiTn
         L7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779875682; x=1780480482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DGSuk3sdODry297GMVF67FBYcsj9yvQAHtFTmxGI/58=;
        b=KLUktxpeyvWNbb9VmwOpYKvwPn4Vg75bmZq4vWLtsxLiS/qb/v1juvyoO6ggAO40Hi
         7KLdj2bnMhu73Nbj9IDyGRDfkRovXbEyA9E/t8ua9UOx6Lreb+fvg7G7T2mCy0XvXqjE
         HcYZQPymE55an190WHvjMJ5Y7wWaAuN94W+x6I0S6zCAAmhp0Zt6bA+lQ3aYNQ2om1M2
         YzjRYKl3tELelk25uUVc7tIv4k2Hf1YYZUcYlTyOjteZYWtOCBHvPLrTiegJpaH8OA6c
         6YQshL0p0IX0quL1w6DlDsd12i1SrsSGLDtNOfGMYpF9+xf6iJheUHAWM27ouIZkl4j7
         3/ag==
X-Gm-Message-State: AOJu0Yw4OGVk4GXtEGgewyWdB+jPD/0FUlvkVwKCSnsxgUK7WXinDWE1
	YVO6YhTpDESyZ1verzmOw/3OvDFoW3PhLyFHbwSyxNq0dJSHrhS1tjL41pWYCbvzoijnk1SNvM1
	oomUtsqK5zk9fh3/rTrzfOBeAQq29pR9ZoOM0DwlpEB4j7Vu9kQKNg8fJcwJCIC1e1Cqf
X-Gm-Gg: Acq92OEwY1iS8viU1KYlaiNTnH0/e3uS+OXnUFm7EHbvTLtcgi3aDljmXDmvfdhwUGX
	au/PPOwWbBbXIIsMa7UFkQAPjeFizVStpZUBlL8JUJZl94JvTkyn2o/aJe83C00+pFchuYOuPzW
	+HJ/wX8ZPWJ5YemtE75ja04qKEZtNY7eZFJ+nB0ZMS4THYR6PLkhYEcHtLmEsDRJyW+rXGMPuPt
	fbDvu3gNZmDAF5YL/vLu6BCVC6herWG3Rcw6d4M6qdjNzeEd6p/+5KdlBMgBA/tNnj4aV+9AyEO
	8EQsagwCPfpNTcf8QsWDsRMJUThxxN1xmGih8/wMfXRdZHv9028A7AA22dWfZw68RMwgcyJzkxY
	p3K+SwmCQhxz7bNFyqFWtAg5wzPI1wt4xRgLNCBBrjGU3FYX9
X-Received: by 2002:a05:6a00:368d:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-8415f32e062mr21497453b3a.24.1779875682397;
        Wed, 27 May 2026 02:54:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:368d:b0:835:3949:3c1f with SMTP id d2e1a72fcca58-8415f32e062mr21497420b3a.24.1779875681753;
        Wed, 27 May 2026 02:54:41 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d70f17cbsm1809325b3a.45.2026.05.27.02.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 02:54:41 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2 4/4] irqchip/qcom-pdc: Use FIELD_GET() to extract bank index and bit position
Date: Wed, 27 May 2026 15:24:26 +0530
Message-ID: <20260527095426.2324504-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
References: <20260527095426.2324504-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fqPsol4f c=1 sm=1 tr=0 ts=6a16bf63 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=gWzRgU6ezm2PVdN6AcUA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: B3TG-hOgwJa2ia5HT4jWahC7_tcVeJiM
X-Proofpoint-GUID: B3TG-hOgwJa2ia5HT4jWahC7_tcVeJiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA5NSBTYWx0ZWRfX9OVUIXpwWGii
 3dfHFjFVFXcdiO96XxKuBM+7EWN/NGwWjV59brrutUshyn7ffZgF+HLx1gU+DuBF1YZKxjTxoX8
 kGL67eEysKBG6L9qEL1hq9sGlDp39jRgQ7t95TforJPEZS6r2DViF9f+a7XSRhk7CFldHYlkvhn
 5zyzWU6+a5UyL06jIUY0UUMb5YQgmPIZM9RoHNFQXWRJpL8fwJGzjd9jewdlmigb4YdCLDRnjDv
 DDjI2qymhJATl9V3x4Toma4z/moUFf1ljY4TAIRXGQqtqoYfJkX1NfffhtsPoNASyqVnNJ/M3rM
 g9Q8H+WNz/xNKTUq6Qc9gyQ9MyX72ArNl/yBkCp5yhts5YPG70Ob9UeAiazReuh3tghJpOIIwrk
 9BvCGBscuXwmbS0c8vKvX6hmuVKvrFJMsKRt6Nleb6/nzMmMv+KD44TlvcO6AB6TyPFWq0hsHYR
 YT04ggNgYF8WedVvfBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270095
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
	TAGGED_FROM(0.00)[bounces-109984-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47B395E23E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The IRQ_ENABLE_BANK register is a bank of 32-bit words where each bit
represents one PDC pin. The bank index and bit position within the bank
are encoded in the flat pin number as bits [31:5] and [4:0] respectively.

Replace the open-coded division and modulo with FIELD_GET() and GENMASK()
to make the bit extraction self-documenting and consistent with the
FIELD_PREP() style already used in the PDC_VERSION() macro.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 9ad2c22342e1..17ca26d66fea 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -27,6 +27,8 @@
 /* Valid only on HW version < 3.2 */
 #define IRQ_ENABLE_BANK		0x10
 #define IRQ_ENABLE_BANK_MAX	(IRQ_ENABLE_BANK + BITS_TO_BYTES(PDC_MAX_GPIO_IRQS))
+#define IRQ_ENABLE_BANK_INDEX_MASK	GENMASK(31, 5)
+#define IRQ_ENABLE_BANK_BIT_MASK	GENMASK(4, 0)
 #define IRQ_i_CFG		0x110
 
 /* Valid only on HW version >= 3.2 */
@@ -110,8 +112,8 @@ static void pdc_enable_intr_bank(int pin_out, bool on)
 	unsigned long enable;
 	u32 index, mask;
 
-	index = pin_out / 32;
-	mask = pin_out % 32;
+	index = FIELD_GET(IRQ_ENABLE_BANK_INDEX_MASK, pin_out);
+	mask = FIELD_GET(IRQ_ENABLE_BANK_BIT_MASK, pin_out);
 
 	enable = pdc_reg_read(IRQ_ENABLE_BANK, index);
 	__assign_bit(mask, &enable, on);
-- 
2.53.0


