Return-Path: <linux-arm-msm+bounces-114212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Sp32N8l7Omor+AcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:27:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CADE6B712F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:27:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=btgLPKit;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Hucgv96z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114212-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114212-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7F61B304637F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:27:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7D5F3D6470;
	Tue, 23 Jun 2026 12:27:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F32A3D3CF0
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217659; cv=none; b=aczRnjqmaN5oAYj8u1z7Gt76DP+beaftIX5kSYJ6h2B/mDAdO8KgqOJJdFOBJzkGqbycHFMEdvoN2wr6z7yYwNRxF4/NzttTPcqFOyHV6aQ/rsvqvIlzXkDiVPkOwoN81aMgwd+U3Rs/X33ByaSNkYcJQJz9MpPBr97LRI67Otc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217659; c=relaxed/simple;
	bh=62IF0/+yEEor5OgJu6EfToG0q4zLv51Qp0CmQh5MbJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WWcaQXuhsD3ESj58VZHRa0v1NYFo4RQMT/uDPGMC/H5X3zH8reZYlCDBpg/R2XSfcMFX5j/CfuV94xXG9PbTweAK4/qjTuJMR7Qrztp3igPC92dT5jPXlHOBr2aVol4HST6YDIiYeptd7/PXvS39CYv9/kZ8FdyPbbkW+5Uxc4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btgLPKit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hucgv96z; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBYgKE113419
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YtegZdhnNhd
	tICZszyo7kUw3QGhY43vjCyw3FuJIKOM=; b=btgLPKittqdhSN/0F0c8REPO9Nc
	+nBwRXtsyMj2wTZsB0hlB7kon/Yf/6dd5x+lVHYBxtC3Js/VGssYRUjZ0s9oOHV/
	Hf8Cy0HlM4tS9WR+bG9nPDdtrdo1A1s2cU/qBIeHJPa3Vo7FiH8pX07ewsqlQ+GK
	SMB+6Tie7W71NWXtbQMZRfKlQ5lmuFUUc6sd4k/1XeVjfatQ71OsFjgQNJ8G5bgp
	RxMnZ4D5hoDv2Il1+1Uev63hk2QHbtvml71dMtF1KvREQjAXNw2RHQZIsbHsb41U
	CYqgfDr6YoE0vmL88heRJ67eF5M389mSJ+l5QTbBrEWxTuo70+OqxY6t32w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvsemx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 12:27:37 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c77c80d967so6465581137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 05:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217656; x=1782822456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtegZdhnNhdtICZszyo7kUw3QGhY43vjCyw3FuJIKOM=;
        b=Hucgv96zPeLV77GnK7ZtC2phABFPcjr1tc6kiM9cOwO8TgZ85X1PQ4pWp2IAS9B4LG
         V3bBREfkuZHHdfulIsbc2/qKey/7NcK+/PnR9CWf3u9/i+dZZytQtCfDIjsTJE3OG3qR
         7WsPeiUmsNV+E2/6F+6WhAzANtqdnlLCFB9N2yx6oOvS1QNpqozkVW2eUSKr3mVgx1GB
         YhtfDZ2vIMJHPBDEJF98ixob6IwW+9o1MzUAJe8CCHOArJBMAqKbMyZKSC1DSd0lMr3+
         4znNph01SzQOZ5dfxWEZtG7R3G0NydTSy8U7q5JLcq6hvGSOel4uwxDB3jiDXkZoPUTc
         x7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217656; x=1782822456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtegZdhnNhdtICZszyo7kUw3QGhY43vjCyw3FuJIKOM=;
        b=cenhj51kKAEhTPt+6d9C2El4iWoNH2bby9A6G/RPUb7zMTtbU19t01iDIyXzVGmwfy
         CapBte4FE0ZQ34Zkyjuz+GsSt0KdV/PmIvYMSxMnjRGUdQNmx1qgw7ZXKYEQnC7T/oDM
         DGvCM/PmgAKIhYH36g+syZSSB9bCsiddWkw9cUcXmzCil0ZaXFd5O/pmENHcSgO+P/VL
         aVi7Sxa7vx8vaxC5xsTPEaeAJibL7ZG57F03ymr3BOMOtF+HTWLvX36z05b46WtBR977
         dJquhd1hsRZo5+PslOnOLa0xucYZJf8ypd+PrT+SelY1lnSf/OzO0FdDrQoNUxL17NYE
         mDaw==
X-Forwarded-Encrypted: i=1; AFNElJ+BsX8y2M3KJJEsp+0lKVNpKXmPTB3t91hhRUiQIH51B1EUPVCx8ebkdy5faE+SQncgRH/mZbrmRp3Mkosx@vger.kernel.org
X-Gm-Message-State: AOJu0YyAF3xjyAHMy9l58Ypk1cfrGv8NTt1AymjYCK22lVmWAa1IDKON
	v3nszGoxsMjUafhSGPg6ABdZ3Ch7/hUL9wHe+/WXtMLmaGts0cJZ+2LsH35hdDcmPGWUt7S6ZRo
	Lc7xskuzZVpsalje6K8t9FkcCG9/xCo4k8c2GjHyv+feFBuTuwsVxJS6MF02bL5E1Hah8
X-Gm-Gg: AfdE7ckMuBZRXh3S/yNFGEzgDf7YmVrPEG7IOlPNq6KmzDthnEa+rV/GJVZIlji2/lw
	LIAppMPmp6xF4+Ky4Esc3MUD+jzkomSzejOXEZJzacdj8iVxjTCXSqD7A2MRgVNWkVXOITj9Zqr
	B8DfqIwe4BL77jWlL+2cz57tx1Yxrhw/PF57Wg74jJq2Sx1+FToqqTaqw2Hdjojj74VG0oY1NMn
	E3evGPn3Man+vX5U5WDhkDHXdcbnbxoT5p2OcbVJFYDK6qKSaKbwa5ESzdKqixzDee0PAlNg2g2
	8nPRlHTbRQUEEbOHObQdX2VyadKW3m8L1Y0KrRROtEiQl+N7/I0rNx35su4pGnPRvkqNlTJjVRO
	kmVZZw30Aj6GrFZd2ECzOwXd4QDAZ5Ufk1qNdmhpGO5v0xm65LoOwgg6xSfwtD5Jb640RtvdE7D
	e2PoJbDl7Um4JgU4LEDHLIdg==
X-Received: by 2002:a05:6102:162c:b0:64e:32c3:1458 with SMTP id ada2fe7eead31-72a1fbf5e81mr10959529137.22.1782217656512;
        Tue, 23 Jun 2026 05:27:36 -0700 (PDT)
X-Received: by 2002:a05:6102:162c:b0:64e:32c3:1458 with SMTP id ada2fe7eead31-72a1fbf5e81mr10959515137.22.1782217656071;
        Tue, 23 Jun 2026 05:27:36 -0700 (PDT)
Received: from t14s (2001-1c00-0c32-7800-07d4-cca3-ec08-7ac7.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:7d4:cca3:ec08:7ac7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5eaa64c8sm514378266b.26.2026.06.23.05.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 05:27:35 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: qcom: Drop unused irq_data argument from msm_gpio_update_dual_edge_pos()
Date: Tue, 23 Jun 2026 14:27:32 +0200
Message-ID: <20260623122732.6439-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
References: <20260623122732.6439-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a7bb9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=_5fg6DJcp6PznYzq948A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXxH7KmCzSSJ+u
 yQq/A+Y4PP9Vxmm8o+09tz7Hpto8HAMlbBHu3HXvhCL492lcZoY4RGqJSjICQDG09QuBmbCIriU
 HfQzjx7lLVnER7mFFl0J1PWKt7ZVhno=
X-Proofpoint-ORIG-GUID: LBRyMMEveE6rM0GVbouTTcSI9sSnlisP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXwJh3R6176iL/
 DG/fXQSRFzsWxnFnphdk0TB3NoxA6C+SriJzzIsJV2pJMEsDBzfYyBE1l5BcNkVT+kLwNZIuv1Z
 SOnIxyfR8wj9LEsCyOEutAsJJwrkAjj+8JMjNI6DBQVPZZIn28AmsirrpUqlvqB0WwterRHOA6N
 fJin3KLSRnJLea1QDJGQMtfVixPwnYT7nQz/RgZpjipVIUkLmtsFw2lSGeNYsHhpgIyy1PQ1q8t
 JcU3E0vsvPL8Vd2vHynsHVxBg04HjkLHz8bNTCrCKKDDEY+V4Vlr5fFv8y/BKJyeTalDymCdDkw
 iHtXT519aE1+z2f8QijXQT95K6kVfF2a2EkX2EQ0+2M+XDtEDBOJFVNzPd1/XlPg3A1U/e7nkK5
 YlnL+LWMFOJR1uPhQ1k0VTFgxXSlF7lc50LIpxcQvyOls9/YjEAUjHsPSPCp072YkVZjAkhlg/R
 SEI9HXsDof6f1ygjRkw==
X-Proofpoint-GUID: LBRyMMEveE6rM0GVbouTTcSI9sSnlisP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114212-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:johannes.goede@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3CADE6B712F

The "struct irq_data *d" argument to msm_gpio_update_dual_edge_pos() is
unused, drop it.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 419342ab45e1..f780bab51d9c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -810,8 +810,7 @@ static const struct gpio_chip msm_gpio_template = {
  * Algorithm comes from Google's msmgpio driver.
  */
 static void msm_gpio_update_dual_edge_pos(struct msm_pinctrl *pctrl,
-					  const struct msm_pingroup *g,
-					  struct irq_data *d)
+					  const struct msm_pingroup *g)
 {
 	int loop_limit = 100;
 	unsigned val, val2, intstat;
@@ -1015,7 +1014,7 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-		msm_gpio_update_dual_edge_pos(pctrl, g, d);
+		msm_gpio_update_dual_edge_pos(pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
@@ -1190,7 +1189,7 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		msm_ack_intr_status(pctrl, g);
 
 	if (test_bit(d->hwirq, pctrl->dual_edge_irqs))
-		msm_gpio_update_dual_edge_pos(pctrl, g, d);
+		msm_gpio_update_dual_edge_pos(pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 
-- 
2.54.0


