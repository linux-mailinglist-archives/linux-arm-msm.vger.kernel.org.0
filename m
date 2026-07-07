Return-Path: <linux-arm-msm+bounces-117227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 3XDQBODGTGpgpgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:29:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F7E719C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 11:29:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=A33hAdDo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=E89PIy9o;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117227-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117227-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDF2F30A7ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86C739E184;
	Tue,  7 Jul 2026 09:22:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EB2392C4C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 09:22:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783416146; cv=none; b=paowAWAkMUjPApM9c8S6/jWvx1+Y/FjI0T2wT5ojgs3rBNQcYy4ZrUygA0NE1bWGeb18bmDt/HZKcEj45lU28P8C6TBcWOhbzRS8XV306BMqJ+UrfQb1lMKsSJe5bMS2i+q9WkE0Apmkvg3Jg8tkjpAO6ODjHTyfFS23JA/QuYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783416146; c=relaxed/simple;
	bh=+zdxqnUzVVwVmPfgJdWophcivI4Bna3lX7GI6iIVmS0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YxvaHDBJ842hIe7RoF6YG6A6id/BEycApYKpUtE/8589Cq3Q4DdnARG12K70l47CYecIcZmzlAfm8yuz25CDQM9/Ekd3acBVHLrgidRo4pQzHsFodQGiODBnmwDoDGwP4ZDlI0YGfQseXsji+ZET6v4Lvx70wApBRGH22LzUZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A33hAdDo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E89PIy9o; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DkPn3138639
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 09:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=; b=A33hAdDowc5NJqpP
	5DMWGKTipMGFwnMnHmobAOrE1GdzQYaoJRsrJdAni7cxegsj+0X/Oa4z8Ur1WJXa
	u70KIwVjomQksDC/SW7BKeJOeqetz5QpuzqgImrD47X8pvIAlRPBJghDoHlwepOJ
	xzWBlYXMG2rA+QAySdQ3JPkxh+63Js5xBL22e3ldbERmDtgU4uasvBzJ8UYwuOST
	wP2urGPim269/uWYzAJPnjhWFNxGQvmm+6xFHmUbPeNYfB/DKQb5PeqnGcjOWfTn
	5bNo80HNJhMs8GmPRUHWjzrh9hrlrPqiJBpDhFcv0vhCfVEcbNtT7w0Jkdk9fap8
	owkBYw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8t1597n2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 09:22:24 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c88ad1558f4so6691860a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 02:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783416143; x=1784020943; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=;
        b=E89PIy9oYLBOyWXqBjqRkE4vhd51QKJm7EFNslGwbi33BJLywvBDFqzoy8zNztUUlx
         a/lxVSFUWtgOQiIT9Vdj576r6BN1ou1DQ+ONRhkeOQAPTkN3vdKYu3sLF2y7xq4ndjEW
         NiPctDC61xCv0xdvEZoZ+YuefhzPu1vIjHTvVQg4BBZVg30sXHIBzD2f6V0OT0BtxTpY
         n1NUqFtkspDcZ9C8bHUCO2jK8CfJD9eJKMdDxJD4EhDmgeEfACJ4OxF95E50IN8Rmj49
         BAjKZgP8zzwF54mNodNqExA8LiXtRIxkhcBl5JnPPzzJGErt10joGWL3Kp9zummGiMtb
         zV0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783416143; x=1784020943;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pVFw97AKqjj1Pt/3fT9fwfKH+vG8lSVfHp/ecz+xte4=;
        b=pjDue6LepWYmz+oMeUyGDjGGcy+ukMfidDNzQq1lcz5g1TWUO0grMp+wy/kySp0GWC
         sUsXzMcqtRPYoepPurpaYCGdgNTcRah+yyAkenQDqD9VOXxSIqpOmtbXIxi+wiTGedwk
         OJ9+rAb+LaRoZjfNy6GAixj9sfOkghxlbmGIGurZYLVOW1OARvlNnq8qTrofv8Rdz5JD
         r9shWIw1D1B2fQo/pMLeB/2Dd+ZYBFnblfsyK3vuy32Sqm1ds/8pnBaP8uV2jlfoke50
         V5BZwatrZfwH2Nddqv1vwHLEyJJ6RIIVLZCyH62yRAJ/aJaI+9BUY2Yco9EUaQ0fQqc3
         fbCg==
X-Gm-Message-State: AOJu0YwLkCT+QhprXW+JO4p8t4BBCqDEAjt2ButPVyT6myH92hCP/sKY
	XhfaeB44fOClMaseGzPqNRMFsxYT7vvY7rgZWquRNKC47cf+piwFYfEqUMQ1EFMPfuaI8y8xcUV
	fUa+wrh5eFyTLmLSCfJGDx1c7Ej/dRna4DH4qEFMTMK939/9IXfdQL5Ek3XwgiDLzN/ru3gv8Bz
	o0
X-Gm-Gg: AfdE7cn4YrHHCw+1r+k6n6EWi6r/isPxtmfGgULZdhnIzmVGdzAU9Ftz1va+2Igqd4L
	0tTnUS72FSUjfR9SM70IUDaw5OAg1cBSzLGk8Xosf008NuPm9nyYSpUgzILIOqeLMHk/fmiR7pj
	u4fRA8m7S0rSjVJftZZqKYFe458zXpU4RhtcvOFbfgyBNWRMnk/DqGH09Qb+LIp6llokBJUL2qq
	+dSFIy5Z/Ol3LvfwRBkej7RolGpUrLln1ULZv8gGKiYXPHdqObpIXWzrb3NOU81joD/hy3X1oZY
	D+uRfXq323FueM9BqLNTCRaNbIzg0zFfO+jPzfWS1hc1hEpA47JhwUzg1Rg7sqd97dn6na4U0W/
	yWEC9N2N5xAwz4GC3mdo3sDOqmvWyWXf6q80ownI=
X-Received: by 2002:a05:6a20:487:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c08ee13572mr5474920637.26.1783416143051;
        Tue, 07 Jul 2026 02:22:23 -0700 (PDT)
X-Received: by 2002:a05:6a20:487:b0:3b4:6a23:6ba with SMTP id adf61e73a8af0-3c08ee13572mr5474885637.26.1783416142596;
        Tue, 07 Jul 2026 02:22:22 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afdb7534sm658864a12.12.2026.07.07.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:22:22 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 14:51:37 +0530
Subject: [PATCH v4 5/7] pinctrl: qcom: Acknowledge IRQs for PDC interrupt
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-hamoa_pdc_v3-v4-5-dfd1f4a3ae89@oss.qualcomm.com>
References: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
In-Reply-To: <20260707-hamoa_pdc_v3-v4-0-dfd1f4a3ae89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783416112; l=1888;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=Xo9LwQyN6492e6baEolgxF50nz7oZmFdMw6rVOnungI=;
 b=e8SKCz7P48edlfgjlYrzGJwaAHSaI4qxc9lZX+OEUCmJiWwK/wuakCuUYZMsAq1BStrHrMCB4
 bME6pspuSRQA793dBZii9SapHsFT3R+bAhvwXE4AVrJNK0Pr75F/zpP
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: p2xqt5xwFu9v57uQm__-xqtyqNIKZfpU
X-Authority-Analysis: v=2.4 cv=HstG3UTS c=1 sm=1 tr=0 ts=6a4cc550 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6yEXv96CkH8QcgWKpTkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: p2xqt5xwFu9v57uQm__-xqtyqNIKZfpU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX9P6U/ngy30A/
 e7qkLDSImMakr56Au37VzKA4RfxNKiey2R1xrsyXK1OyRkPZIT/6F/+fNPj+pXQtkVo51Zw60fY
 vqdu8HO+2bQHHVLLcY2sGS/i+43MoGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA5MCBTYWx0ZWRfX78uJLmg4ZlJC
 tIYuhcGXn+mySLdO++c8VZme1L2F1Y+HDXP1H6l/xq736qcHFuvJ/Svp0jJfwcbkXye8wJBvkh0
 Yw1twD9GL1jxuHsyM/i4J2Gy+ShwOZFfAKUThLFvgabiCTDbnu71pXc9VSdqKjLhiRBerogLrEo
 h+NPIBhzl7eA7N2lgL8uuV2B8mS+dW3ip/fEp4QZhN0AfSwDPMlKMkCIDyDN5rtKs2NN9Elkh6K
 2qzKUuKpXR7YiyTnlozQEtD0vz0fFgQbdLrphx1QhcwP9TF2kVKAR6cPEWFcGo/La4dcrhIJjAI
 iLQ1q1OucGFuceVvUYrj4K5KW1vvLA5GFz1S0z+wPJMsSXgR8nXDYc61Lq8RvCYBesMRXiCYSNe
 3jFLcnBmZPZFz7r9vs0cQKT90SEJQmLQZfApm4SEM/9Cn6ZdxWFCfwdcLc73kuRXX7v2Pkm5RDt
 F9aE2lOA6l9lv5xg8AQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117227-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:email,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 76F7E719C5E

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
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index fe94ce5f9b81..9c720f49465b 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -994,6 +994,16 @@ static void msm_gpio_irq_ack(struct irq_data *d)
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
 
@@ -1064,7 +1074,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
-		irq_set_handler_locked(d, handle_fasteoi_irq);
+		if (type & IRQ_TYPE_LEVEL_MASK)
+			irq_set_handler_locked(d, handle_fasteoi_irq);
+		else
+			irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		return 0;
 	}
 

-- 
2.43.0


