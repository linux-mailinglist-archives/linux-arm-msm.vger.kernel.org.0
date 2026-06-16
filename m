Return-Path: <linux-arm-msm+bounces-113349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CM4iHjYYMWowbgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:32:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F868D937
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=QTujyo9i;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=e8oP3FSI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113349-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113349-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9BCEC31F36B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782B8421EE4;
	Tue, 16 Jun 2026 09:26:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AAB407574
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601994; cv=none; b=T0+IBIK0y1PGHS8yxitwowcCI4BqvD5+HUfD0QJNN9SoPbQP48JejiuJ0h5jTybrWt63M1hO3/vBdPpXX0JsR3ioujCplN+2PZX0ODYERK0bwxXRc9V9DqHnHR6bnkUYI1MsJmO3e8iVWvQKjWpCAqXfQhk20FJvHDGdFKe1jvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601994; c=relaxed/simple;
	bh=ARzK78XV7pgnHYUwNdfMFA6tpS+n/D70KgAVd1wtPFE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SILgRyQMRdNQ16pNJFtvWG9NPuIFo7vb5y+k3LAL3i1RmXaz45BMZiaxh8421o+NcNMC8FKp6z4FJqBEZPPnrjWPsQhu4vTVUblOr+OpkCSJZWkb2l+SSgd215bdKQE/yG5hcrXv9hFCeL97FwJiZu50rwwTp1CaqfoWh+BmOhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTujyo9i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e8oP3FSI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7TLeZ2528226
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JqhRN1J0z9p9IAWvgV8KVLlQFNMoX2rbuphB40ifMZA=; b=QTujyo9iBqo3TK4M
	bWv9nfYn0BGo7CDpWJAKrOQWDsu/TCpJc/3S+/GCm2NBOCNbGZSIGRYUPrhvJwv5
	7L/1oO634LY1di04VLWSt1+ektc56cuXpKRVz1Dq9vAb6orhd+h+8HmQTLbMTzSl
	HEdgXJ9cZ4Z5YbDug3pOrf2+Icm481UuLi7p9DeR3nPD1/3LpZ7RSiWPFemlD7xw
	JKpJmyE8iZiXAo2/XkgLMv/Y1EIDdpijAWf+JZUhPtufpwLoLTLsgoNudDfECHI9
	kT+HbZKDvcaBjUHpIyVD520yAXcJf81LLyU7o2S3G8pNnKm44UYtQ+Y+zhjwI9Nd
	IylF5w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253gg8p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c354050c34so40325835ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601992; x=1782206792; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqhRN1J0z9p9IAWvgV8KVLlQFNMoX2rbuphB40ifMZA=;
        b=e8oP3FSIYdrWfkLdbAnFsvr3X2cBdNwJTdF+rpCJqpOns1nGpz8Rzf5aJxoLqWQx0x
         3G3WumxcW/VHjUCPwvaknKKNJSZXvIHooG4DsGcXSVLNYzCIep3eahefNo+MTfJVbrJp
         XVOdKBnK7lMxzS5H2/P+joYA1KgFGoC84gw7bPk0R1mu6AEmfNYl9fDkEloFHyi2iLSf
         nzY6+naBqr24r4ErED1bWHCjknX19eIldk65NgnIAV/GeyoIWz+xGyUoP8sLNvy2miXw
         pXFzOxWR05UBShi5UFPv1i//3gpQDxPVpSmswfn3Ut21kt0C6Rb6E+t/AtuI8iGfRssP
         zYAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601992; x=1782206792;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JqhRN1J0z9p9IAWvgV8KVLlQFNMoX2rbuphB40ifMZA=;
        b=MG50ERuArxuw9DpFkprOSm35Mo1rByZVr1vdpbdA8l4Z7ejEHVdZqOv4Bteviedgao
         qu9p/YjO/FPAhHc0q3Nf0B9wm135I1+E53Qq/tgfWgCsSazvvawkkSyUxxCWHp1R/fgg
         +6hF3i1Vvy/DlspR/pWVYU9rynuN/eNP1XuLxEmxDhbbWpu2CFtdjgsAa5jJXs+tmFMA
         hEqi4/hq+fvPcv7uX/rBHFay0sQiZjgIfFE6XPTbxukeHViWfZYQ0lN0UCmr46rACJRV
         iDp88/3XqaweBGLZ7IPZLK5jqk7u7pI7xBwPOqIdKTorB8m1FdMUnhA6lXL/fkdE2vJH
         Q5yw==
X-Gm-Message-State: AOJu0YywRdSwDIrVDl+1/G70mBsqiaOmlw78bqV4aNcYIa64MLySfgdN
	nWF/ZK1Khi4BmQIUqIEQiknXJ5ggT751bSRxHMRq4rW6gqwNMOF8uQCQMyGgDaj8uR1Q5YoNDVS
	Elt74S5GZtP1gQDy7934zdkIr4Ls5VI51ucBOJhpPKJH3+F0TdGVFxLWKZunAYqRSNI6P
X-Gm-Gg: Acq92OFu/l4k1YuKJIV4ZsO9n+WNMuHB6lAGkpPlTvrYboYQUKXqKWZRWJYkUo105bv
	amnrDmEp80+G7a0Cak1NFm7iCQ33mnhypgb7tzUdMCiA+Eh5hRg5+O+0m3jOzHOdN5XAMz10wh3
	KVrSqFnuJOGuTp5W/CJWp5M2Ykfr1qSn8uM3jGGSNIGyfoxrFrqwIccfF4nOsEvj9FA3N2Sd5FJ
	zGAMGYWgAhwijdvbI4kbBTay2pkouRksSUfETceEzoT8Os+p3J0Sz+DI9rx2FbzlpS/+hngZNcT
	FWC8gp0k+vWA3Po2fLbpyFN8lI3QqRPWpwTZZUFpVBc45kqC3i59yJQYBiL9mVyxl8oOvx6IleI
	dTjxz055ca7abjf5sBvuPwgXymsRs+X1tyuJqMp0VhBcUQGI5iA==
X-Received: by 2002:a17:902:f64c:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2c69f6aa2d3mr12250645ad.28.1781601991940;
        Tue, 16 Jun 2026 02:26:31 -0700 (PDT)
X-Received: by 2002:a17:902:f64c:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2c69f6aa2d3mr12250395ad.28.1781601991495;
        Tue, 16 Jun 2026 02:26:31 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:31 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:56 +0530
Subject: [PATCH v3 6/8] pinctrl: qcom: Acknowledge IRQs for PDC interrupt
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-6-4d8e1504ea75@oss.qualcomm.com>
References: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
In-Reply-To: <20260616-hamoa_pdc_v3-v3-0-4d8e1504ea75@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=2152;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=rlNGhxOUOCf6RDLTjt5AdnPikv6lGHJprT66fx/QjWY=;
 b=G8vQUHtoHSqOIjwgxhQl4HkSVkzqkiok+npoms/T8sVq6AkKWfXlHCVh5bl5zX8SO5eAZIVy3
 fjE+eE8CEmkBslw+Fg1DBDHzWaIyYFQUwOFlZ8DCkCx9XpyhYYSj4UI
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: Z0AHiNQZAYovxBqrNnG3xB2My-HykGCI
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX/gLLi0NKO7LQ
 Y6d7x4vnqKWftuthAmsMCfoRZBFu8gWiYhpZxUm0ZVcETVGtqjz6CL/Blw7J6hITMH9uAIiGxSF
 JkYOWJieIDKGbXQUsTQe3QO2DnOljOw=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a3116c8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Wi3Sz-FJ3VVDFv8wizQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX1Qeve67wsHbX
 2vPyHhcCghXllX0oeNTLser/FDLS1dtLitX2xEVuzpTwCkBx3oUz3gGFKVncr5iC8zCwc5TX07b
 CxpXYcnIYIWrjFtKKUDtczppNLrKfixVl8IOeEbB/hA2W2a7AIb8H4nk23L9A5nwE1ISn9ZSRxO
 welJ27nZazO55ecnCmqTXbkqDj9kKmVJPpT04mQlbQBTGr4T4O5R/x8VTy9HzcarfxR4XMNkkSk
 eIwd/D+n6udaDu4ULe9bETUcB00XXioZjUglDSrhGQNYHV3wUlAVqiYgjmTdGb/agtac1fxoBYg
 YPfV2p0fVdOOfLgkkOhqo0V4iLUGYtbJQjTh9gwXt7U/WpK5Zq6XvuBpLDT/La1x/IlHYXZ6TvD
 /enfC3miEtsXtDxuLjU2CTe5SEl651kZT9U9WxC1cFm9tzm4wRQwgnJUwJ+mE/eokc9DxAjIL6V
 fib0IHxg7bZ2FTGpeow==
X-Proofpoint-ORIG-GUID: Z0AHiNQZAYovxBqrNnG3xB2My-HykGCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160094
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113349-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C19F868D937

From: Stephan Gerhold <stephan.gerhold@linaro.org>

PDC needs to acknowledge incoming GPIO interrupts to clear the latched
interrupt status in secondary mode of PDC. For level-triggered IRQs this
happens automatically in irq_eoi() but for edge-triggered IRQs this needs
to happen as early as possible in the IRQ handler.

Implement this by using handle_fasteoi_ack_irq() as IRQ handler in this
situation and forward the irq_ack() callback to the parent IRQ chip.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 11db6564c44d..17665e1a9dbc 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -995,6 +995,16 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
 			msm_gpio_update_dual_edge_parent(d);
+
+		/*
+		 * During early initialization of the IRQ hierarchy,
+		 * irq_ack() is called by __irq_set_handler() before
+		 * the parent IRQ chip has been set up. This is why
+		 * we additionally need to check for d->parent_data->chip.
+		 */
+
+		if (d->parent_data->chip && d->parent_data->chip->irq_ack)
+			irq_chip_ack_parent(d);
 		return;
 	}
 
@@ -1067,7 +1077,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
-		irq_set_handler_locked(d, handle_fasteoi_irq);
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			irq_set_handler_locked(d, handle_fasteoi_irq);
+		else
+			irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		return 0;
 	}
 
@@ -1395,6 +1408,7 @@ static const struct irq_chip msm_gpio_irq_chip = {
 	.flags			= (IRQCHIP_MASK_ON_SUSPEND |
 				   IRQCHIP_SET_TYPE_MASKED |
 				   IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND |
+				   IRQCHIP_EOI_THREADED |
 				   IRQCHIP_IMMUTABLE),
 };
 

-- 
2.43.0


