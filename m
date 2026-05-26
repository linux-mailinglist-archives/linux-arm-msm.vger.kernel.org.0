Return-Path: <linux-arm-msm+bounces-109777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIOoMKZ9FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:01:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ABE5D4905
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 13:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD1DC3141F54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D84E3DFC6F;
	Tue, 26 May 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VZvBDMMc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VV/GxMgi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628D3DFC67
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792922; cv=none; b=VpP/xsRXDEa5bl9zpXbRwaHbCM6WNjBljFRY1A9zjV8D/AATdER7TusFWHAAdY4qv1heQX5EkYpYgj5VC0Av2Uvy5lzgyTFw7dlTaUfrcjgai+02v2DuJZIeKPCz2Extg1oY1Fclve5n+kKAv7nKdYu/u/f+f02bk70vIAoAPx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792922; c=relaxed/simple;
	bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IK1CaeCuYB67sQ6P83OOa2+8rhPxocL0oAvnP8np5nf1v+PdrD/WMEHVVeU3sdijTsOkYDg0b3k/MBd/2keisDyjp27Sl+xXpGbA9/Zjp78PDcG+LV6ImvbPFNLoA1Yi+SkBuDqYwIND6G9fUAS19C2mDKO5aXuntNk62YRrM/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VZvBDMMc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VV/GxMgi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5TNnm1802378
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=; b=VZvBDMMc4AlN8xWn
	A3y272eDSVznYXmeu8kVruVA/8TzLZAWQ+kmuzu3mJu+J9udLUU2l2oaqjX2cTDC
	q0J99DcuP1WwKY/5+goiLjRmtg8tg0H9tkCiV4K4coyRFunX4yawBSGpZOcI6bwT
	ajvTA7bhk/q4csUWuYjrvIWW6kkN/BKeWh64ZkMolKZjU87KFwFiMs7pVKsBX+zX
	EcS314JtCAdcTf9kRJXSsWpRbZzxGLUBgw49MhtpEMwhrAH/RpvJjrT60PMyjY6R
	HaGdH54SpTPeNyqglyYbbcDmNoNWHaIyhTaWbEOHo7lVDMbJdn1gp24UkG1dgC+s
	ZSpeYw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqmc7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:18 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ba3245a43dso116278295ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792918; x=1780397718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=VV/GxMgi9b9KwrTEltO0KqXZqU/hIkPE/pcU7yZvQUf8bIE03IuQvWdCAmfklw0Mn+
         WO6QDXb9ly2ag8TV0uPN68WZGqkv8ucexJXLhsKrBWV7MyD/iQM5IMikJaI0RL10LtTd
         w4Oz3ScCcgrP4IA3xVhqpOKbR4ZnC1nTp7nZ2dSGoQBao02bKea+qzVrLHB1hqKTSaN7
         H788iqIfo4YWsO180MujVoRcmcoOPr0bOzUU4dpHWBP6rb07jQpaQ9Vt3OwXeEfwWehZ
         vIjl7XsjjC33b+5BfdPUWUESByxvtHfU/qgq53aNvAHoXGMCyqvUACpzXSSddiINusct
         lljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792918; x=1780397718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lBvxffGLGjap0F10y6akuJqbuU0quUpXU7b/5dedjVA=;
        b=ZxTQ+YUzz4xYh08HIk6i2gqjkK9zQvji7rJr1LQwI5SQcjfRqLNBce5sDxcuO8Bi6i
         aeagbJyrGbwkCG3P5K2KHl35lk1DfbWwXHwWjhgL/IbyVN23XFnrlAhusACm0QDe95gS
         PBQaLkkcXj39k1s8Ctsqh0hXlUlGYgmxAwGofcDTnNahdrZWvTXJVuHZmAQ1E3UVuVI0
         ObgMW6bUTYHAZE4zOhz6Sp41wZ4tCwTYPMhEmaqKzdJo5++4pvxZO4vFYjdJpSRL4Cms
         tmQKjDAIwYXKvlmmxxz58gXnhXqPTqngXUWjZ5/bQvQYtvam0VN30TAOf4oP1RdyVP7u
         BdWw==
X-Gm-Message-State: AOJu0Yw2E69GlUt/C+hbwl7KTWof8tszlY5q3t2NO8A/0Am5z0X3mOMt
	FtUMRF/xtIYyzPWJmtPXRAYPZoKZlJ96vcz4Dp2asRHDsOb1DQfyDq7+OSw6mV2jVh/hL39r0b1
	mlrJmICRJwRNPnaaz81p/SIfYM1nwx66qcWRNouH+Oe9farbU/IINbY3e7SH3blY3FnFo
X-Gm-Gg: Acq92OFr4dm26m8g/HZy/vHITTyybS7S2EW36boHxYJ0/TgNQY/sXRnyyoUA8vNSJyM
	CziURjXzlD7/xhNOg5N7VHBcbIAgAYzhyxABzaK2eTfo/dk0R2aB12AjMbOq9QoHc6GS6zh7zbp
	SZu+gk0bvQruOKULPE9zlZ/eiRcCkvXiK0WRhnq/axamq2ZH2kUIE9SJlQ6/0/zrOC7dnAHnAC4
	YeELdgntGH3TIYKkkKNVd8DoiFwKsuF8O0cLRJ+Q9CXBpLJwUUG2gIWBroDJ0WjlY+nMhPO1SAO
	QHqU3jnUceXgWVbkhQH5UL1tw/dJXng7X6Ha4LRtBtXLPAbWeBiwVGbeFyz5qXegJcmPs+k0hxw
	sP7AtutyXOQFnkWzdjHioXKlxTOEAEVrm2Ha5SF7j5r6GID9f3Q==
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688935ad.8.1779792917666;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
X-Received: by 2002:a17:902:ccca:b0:2bd:a413:6b07 with SMTP id d9443c01a7336-2beb031ad32mr196688695ad.8.1779792917218;
        Tue, 26 May 2026 03:55:17 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:16 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:40 +0530
Subject: [PATCH v2 4/8] irqchip/qcom-pdc: Differentiate between direct SPI
 and GPIO as SPI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-4-f6857af1ce91@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=4359;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=6EQ6AEy/sFGbv0oRWgjY13Wwv75cbd1+f0Br4cSZjD0=;
 b=qXa0KsONgyIBH+VtaOzo+t9vZZzWxuMoVowWIB7JnogTd/zYJDqXfoiY6ZF0pLN5AsxMh/AVd
 mNRaoCvPDtlDhmCNmH1E9AQf9jV89ji3oSmMCJzr8MXdW3Lxd5rLy5d
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a157c16 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Fdd6IbX9gU1Ld8MhPvkA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aO5psHPHeoEqGCT8RoUJVYVypwhoL2d9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfXxiS/u97cAbEl
 kIhxk1E7djHMA8lzkFFydCloD08ydNsHYQPQiKkO1+qMYLMW5MKLtNYCRZD0cRVv/FTUgStK5fP
 2bQd7RFEnq6HOeigGP8A+AFsrhdDy+ywpXy3lkmQht0adAQRWFUloBoqAQ8Z18keIrN/QG82Cg5
 wwjSpiLmonC1AfCEj3X15hgMVwnVlZrJtOMKo4lrYnrlNBb+EmP97JIjhQNwM49dY96MTUeOFhy
 1m9+oaHz5QbPqYhgHM4hWHNSgL0HmvweUdpG/C47wVTTkG8Em/3XFE7ar8v7ceFW92wfjtbgwKq
 yf2P5JK1ZPMyXi4JlmeViBWGx7xTVvNZJ7z45sHvg9axVnMvW/BpkTlf2BWAp6hS/kA2r8uDinf
 3hMQc136MB/843BjQRs/7x4RSpc1daDzwXzF+0bPC12x0Fv/riGoEFkaWqa7Gn3ckaJHnFD6Vdg
 zxZ1OI8EWtI+DLXKaDA==
X-Proofpoint-GUID: aO5psHPHeoEqGCT8RoUJVYVypwhoL2d9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109777-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 64ABE5D4905
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Before commit 4dc70713dc24 ("irqchip/qcom-pdc: Kill non-wakeup irqdomain")
there are separate domains for direct SPIs and GPIO used as SPIs. Separate
domains can be useful in case irqchip want to differentiate both of them.
Since commit unified both the domains there is no way to differentiate.

In preparation to add the second level interrupt controller support where
GPIO interrupts get lateched at PDC (but not direct SPIs) there is a need
to differentiate between SPIs and GPIOs as SPIs. Reverting above commit do
not seem a good option either which leads to waste of resources.

PDC HW have the IRQ_PARAM register telling number of direct SPIs and number
of GPIOs as SPIs. Further PDC allocates direct SPIs at the beginning and
all GPIOs as SPIs are allocated at the end. This information can be used in
driver to differentiate them.

Add the support to read this register and keep this information in
struct pdc_desc. Later change utilizes same.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/irqchip/qcom-pdc.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index db76737646e1..86379dddc5be 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -61,6 +61,11 @@
  * |                   |    [4] GPIO_STATUS|    [4] GPIO_MASK      |
  * |   [31:3] Unused   |    [3] GPIO_MASK  |    [3] IRQ_ENABLE     |
  * |    [0:2] Type     |  [0:2] Type       |  [0:2] Type           |
+ * |---------------------------------------------------------------|
+ * |   IRQ_PARAM       | IRQ_PARAM         | IRQ_PARAM             |
+ * |                   |                                           |
+ * |   [15:8] NUM_GPIO | [15:8] NUM_GPIO   | [15:8] NUM_GPIO       |
+ * |    [7:0] NUM_SPI  |  [7:0] NUM_SPI    |  [7:0] NUM_SPI        |
  * +---------------------------------------------------------------+
  */
 
@@ -69,10 +74,12 @@
  *
  * @irq_en_reg:     IRQ_ENABLE_BANK register location
  * @irq_cfg_reg:    IRQ_CFG register location
+ * @irq_param_reg:  IRQ_PARAM register location
  */
 struct pdc_regs {
 	u32 irq_en_reg;
 	u32 irq_cfg_reg;
+	u32 irq_param_reg;
 };
 
 /**
@@ -92,6 +99,8 @@ struct pdc_cfg {
  * @base:           PDC base register for DRV2 / HLOS
  * @prev_base:      PDC DRV1 base, applicable only for x1e RTL bug.
  * @version:        PDC version
+ * @num_spis:       Total number of direct SPI interrupts
+ * @num_gpios:      Total number of GPIOs forwarded as SPI interrupts
  * @region:         PDC interrupt continuous range
  * @region_cnt:     Total PDC ranges
  * @x1e_quirk:      x1e H/W Bug handling
@@ -104,6 +113,8 @@ struct pdc_desc {
 	void __iomem *base;
 	void __iomem *prev_base;
 	u32 version;
+	u32 num_spis;
+	u32 num_gpios;
 
 	struct pdc_pin_region *region;
 	int region_cnt;
@@ -120,6 +131,7 @@ struct pdc_desc {
 
 static const struct pdc_regs pdc_v3_2 = {
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_2 = {
@@ -130,6 +142,7 @@ static const struct pdc_cfg pdc_cfg_v3_2 = {
 static const struct pdc_regs pdc_v3_0 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v3_0 = {
@@ -139,6 +152,7 @@ static const struct pdc_cfg pdc_cfg_v3_0 = {
 static const struct pdc_regs pdc_v2_7 = {
 	.irq_en_reg = 0x10,
 	.irq_cfg_reg = 0x110,
+	.irq_param_reg = 0x100c,
 };
 
 static const struct pdc_cfg pdc_cfg_v2_7 = {
@@ -457,6 +471,7 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 	struct device_node *node = pdev->dev.of_node;
 	resource_size_t res_size;
 	struct resource res;
+	u32 irq_param;
 	int ret;
 
 	/* compat with old sm8150 DT which had very small region for PDC */
@@ -515,6 +530,10 @@ static int qcom_pdc_probe(struct platform_device *pdev, struct device_node *pare
 		pdc->x1e_quirk = true;
 	}
 
+	irq_param = pdc_reg_read(pdc->regs->irq_param_reg, 0);
+	pdc->num_spis = FIELD_GET(GENMASK(7, 0), irq_param);
+	pdc->num_gpios = FIELD_GET(GENMASK(15, 8), irq_param);
+
 	parent_domain = irq_find_host(parent);
 	if (!parent_domain) {
 		pr_err("%pOF: unable to find PDC's parent domain\n", node);

-- 
2.43.0


