Return-Path: <linux-arm-msm+bounces-113350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rSL9E9YWMWrabQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:26:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 315F368D847
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:26:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OvKu4SRk;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=erAlil+C;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113350-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113350-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E80A300BB81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 09:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F14E423A63;
	Tue, 16 Jun 2026 09:26:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C0B42314A
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781601999; cv=none; b=ommVgP2kDNdSudYm1ybErv6zisG6AxmlbMT/73LmYXrWyvkhEfvIucp+zYKtYMjUBXXRZB8oAf85gFuIPVaZN6tIzCCSlGuiCnfPPj5e0++8Pa16MSz3K1yXsBjxKG0ZawVbQIqxfSQ1CO33awMlBxxizwaMXP5SIaJOq91xcZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781601999; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AhA6gqkfHg0hLFS3AEMclloCFCpng7gQrq6aKMSiRGB/oVX33ZeV0CXfSycEGXPMeYSoGZPUj0v1W8b7VOhSRi8g78oS+QhS/rWAQO1+m5uX6hno0RJORb3O4eGGz64CUeKD39CNetHxyXAa1vHed6CjhL8darCj8imTCbniy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvKu4SRk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=erAlil+C; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G7TMeZ2528242
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=OvKu4SRkORk6Q0zJ
	mVya4uM1OkI1/h1sGUaE2/PUSGetmISR2oWmxo2KrNCrNVgM2/2vU63MqG4iKHK+
	zHnem3O85pk4nKAaUcis6Wz5C0VlC5cRSCEBRoFnz4sMIG7bcgl67JPKA/aoBpnB
	r3yweNlriKlWw+yADmVCxVIor4FeTl7R5ojLPKqa7F4rvE192FufoIs0W0nbUVhT
	IG+TDbshqDYWyAIJYba6W3iOakn2pRdcmpfC45U+Z3uz/LpSTjbrNw0AOowUEkaJ
	iSIxK2iQsgPov34+RlssUkfIA2eq6OqcGd26W/DK5R/ChBBvg5/GcGh627AwS60H
	2ikV/g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu253gg92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 09:26:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a48fb4d5so2236795ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 02:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781601996; x=1782206796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=erAlil+CRGh0mDkPYrngS183RHKogX3x/rPWpmXEbQLsp61Hb7+qxAJXEcLHnt8c2D
         iMYCGZvaZ/CCxaCTB8sfwhB/B1Sx5lQXBcalSH4EdycbhAcjBNHD7ipwHyx725twkyLz
         XNg7VCicZcx2bdpExReARTfrF0USfrtEJBBz8SlaG10WBxVhxXMWoC9rXKgtXBf6fv8l
         OERQ06fnXeipcTh1WfIIZ63thFnZlN1ktXnfYjHOa/+E1dQ9wd45BkxtbZXAYKZtW5Sd
         MA+9kmMqhRcTQNW7maZrtxKUD/u8pqf1LCIDmEn4B4ywX6SRMwcz78nZ4tlzTjME7cIG
         KrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781601996; x=1782206796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=o5LR+/5crgn+rwXUfpWweHItkGhPRXBpOy+4jDrjpHa4P27CRp6/RJK4V3h/RAXNPM
         1l7s+i2B8rbZBAdeftfELz148fLJfRAXq5yR5cNVmy9KJrb4le1kmqwguvkmoguN0k4Z
         8XeBmMJ++0uBBLml8GLL4z5v274KLMkRoAJztd9DqP2k2osTbAukz8d09ZtHKm9LkSuV
         y2K469dLdBMdiA0o9LasZLtHQc115X8zqV0QzGrAjqLCS72JRULmKAUyzQhIZV3UA1n0
         14gyFGsmBgp/y2mAhTbbdZXUj1ocObd0ONI/7BLE8USFUeY6Oc65ikIXbNYQZ5rwxske
         uW6w==
X-Gm-Message-State: AOJu0YwWW05ZduKsFTT5CotFBApWyBp4RB+TuXKsLPTEglF364NTYV5K
	poaTiwREdmrZAYxfXLf4zsSuPqDtcJHZt+ERg6ONG/33hU7B9fxaY6lsv0WSmnHdZNk6Iw4IIOr
	snfNN1iZailCYmlQxceOvt0PslZ4CZLzC36/M5OhJhMQVrsx3gPphY3V2zauM8WeF9jAd
X-Gm-Gg: Acq92OGv6oHoQXkxkRdeJ6YOTbYKQj+v706dhFxMl09rnNKZCClHpND58xVjl2XwIC/
	x4i+gif+P84Ri9jvhU8RSSpIoAscKWnhE0v2YwfDk0EnBwc+s+KqF4wYvpphvMOP7ry92zQlXux
	L+334SMuLf2QU5JRJFibVxDkwGU2ctxUkAOwxHfoKLxLvY4ABs5Ay9BBYwoZw74lONlC5ie+HzL
	CzCSa+ng6lZfve/fnNbet7H/kohMzS2z342BpdbykL2DmDPJEs7PXFmohiDIMWVPxqzSk6mpuGm
	3mBqB6Gn6qwconlpKFUoBgQaPglnahzd16fLbDwlFF9yXw4//50V3a00a3H1QK8cPeuXtWHYLqF
	BTf1NYonvi2YBmBBglPB9bc/qAtQgjP3F/2ScgPf6bIGCvSu81A==
X-Received: by 2002:a17:903:4b50:b0:2c6:a3ee:f0b with SMTP id d9443c01a7336-2c6a3ee0fd4mr8610805ad.26.1781601996425;
        Tue, 16 Jun 2026 02:26:36 -0700 (PDT)
X-Received: by 2002:a17:903:4b50:b0:2c6:a3ee:f0b with SMTP id d9443c01a7336-2c6a3ee0fd4mr8610375ad.26.1781601995920;
        Tue, 16 Jun 2026 02:26:35 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e586bsm130042025ad.12.2026.06.16.02.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 02:26:35 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 14:55:57 +0530
Subject: [PATCH v3 7/8] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-hamoa_pdc_v3-v3-7-4d8e1504ea75@oss.qualcomm.com>
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
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781601959; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=6RxGKFE4QbfqPyXmwyxC/j+cCoRy9Ch6DClcKVz7GbBiAJ5rjKCKgoYeU08rrPn7jK+tpEwpx
 PQ4/ixYQPiEAtJ6BlCzJP3YPWmDtCSak6lv2Wj+5F1A53bFosEpWdw+
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-GUID: 0eLHyvGrCv6R5PW3OTZo4fYK2VaPwOVT
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfX1MMT5HnxEb6X
 dC/qCGzfzPmMcIsf2zMiztx0SkUrWC69TleJTbXts7RGYkCj0ZgSFgLxTUtJvcAeTAjGq+NcStf
 2KLDm+Qy9d+brys1HLc7KYn6AGYV0jo=
X-Authority-Analysis: v=2.4 cv=WNdPmHsR c=1 sm=1 tr=0 ts=6a3116cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NCBTYWx0ZWRfXwqY70cWOESfT
 CdmfTYZrIXknmAYv2smuzOy32giJWb/3XD1hXjO1I53YZdfcfOMjKD+qn/dYNS3ckwW19BtFj30
 H+jIEltNnLu4Yfg9WEvyIdKshKmFAxSC9VOcD3wV9rb5X9iGDw9+UAahZcOmt9KmVK84fhUCkvv
 5pfSr/sbBSlzKXbgMguVlSOC4MH6XB6STCBj7dd4st+8wDWhBr0wg3hVsih9rLYvHTPt3nx14Q5
 JWYwuoU23ddMeyx1rs8hHjhTUjRGbZizGQO5lXLf1dJNdfLJSb1S8nd+S8SBZv2wGqzIkyQaVQp
 FWhNpRc5EFYqGCKfTMn3Um6NfiHFNZW7qx93BrdX+hOgMYtjaxcePEEfnzX/0FspqGY0rV/VkCn
 oB2cGlMHYCFNGNunKftzFTidePbWzn9Kcenk29mnr1hysy6QSWS1ppT53mBKoglhzjTHaN9wLij
 4TKBw1EwdhkYA/xdfGA==
X-Proofpoint-ORIG-GUID: 0eLHyvGrCv6R5PW3OTZo4fYK2VaPwOVT
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113350-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:maulik.shah@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 315F368D847

This reverts commit 602cb14e310a ("pinctrl: qcom: x1e80100: Bypass PDC
wakeup parent for now").

PDC interrupts no more break GPIOs PDC irqchip is updated to work for
pass through or secondary mode. Update nwakeirq_map to reflect the GPIO
to PDC irq map size.

Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-x1e80100.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-x1e80100.c b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
index 8d2b8246170b..e4c0abcd95b9 100644
--- a/drivers/pinctrl/qcom/pinctrl-x1e80100.c
+++ b/drivers/pinctrl/qcom/pinctrl-x1e80100.c
@@ -1836,9 +1836,7 @@ static const struct msm_pinctrl_soc_data x1e80100_pinctrl = {
 	.ngroups = ARRAY_SIZE(x1e80100_groups),
 	.ngpios = 239,
 	.wakeirq_map = x1e80100_pdc_map,
-	/* TODO: Enabling PDC currently breaks GPIO interrupts */
-	.nwakeirq_map = 0,
-	/* .nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map), */
+	.nwakeirq_map = ARRAY_SIZE(x1e80100_pdc_map),
 	.egpio_func = 9,
 };
 

-- 
2.43.0


