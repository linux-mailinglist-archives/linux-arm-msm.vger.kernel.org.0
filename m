Return-Path: <linux-arm-msm+bounces-109779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uMTcLbJ8FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:57:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9925D47D7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7E2AC304DAF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2279E3E0220;
	Tue, 26 May 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+XBancH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g6hSvQj5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5593DE432
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792930; cv=none; b=Opof6xOmNVmyEzN19utn5DGOx3U9L+vXlkibLefTHSlVaHQ0IgvqtPvmqIxvxsTNoboVvVBAyXqqiAehKkOME9pBJaUtibn4VKst7s7MDi7j+aoINub0CoGBl6gJmX0uWPYbs6ruJRhthFL+wYuQYCIJaeUpoO1P4YBVqwlQLb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792930; c=relaxed/simple;
	bh=Rfnjp15jM1e1uKJp2scHAPjiSn2ivye1imZmJASXQ2Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oLvdZzlkiTN6dLvS+6mYJ14uFwYBBKeXMQuA/KesL9nnk+0AbG3DFZOgLV5sGqQog1YeNFUrgP8Ne/MXnpoqzkILl0m7XK4pn0HhmDFkCJUtUTJjrP5xK75NQM0Wq7QIFDXPpEbOczIqoY3Bu/dfeGE7ejZ4KHBXw6s3jHfoEpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+XBancH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g6hSvQj5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xlX61604584
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=; b=V+XBancHc9+GxtIZ
	yJjHAAz2IAbiVBfV+vVpYf+eHukvAWEBUwaZkAbbXC/ZLiZUJG1R3chRFnNTXQ4d
	6tWmZLzkrnigJFLI6oix0UpFqzFL/hauX19j7s+yK1mqtQaPkotOv3wRQEG/3EOD
	SXNhxVyr8J/gmPbQE1hwxAhiwgQohpJapevBU6YIXqh8HoXpCPfu9f64L6M6LSLW
	a98e+c8/w8HKXpt2VlWuXZF+WVa0lm21OUYieSM16JMMbMvvhfUfnqGd8FckAh7h
	3VbY6mTNVnW2+FeR5k8INE3N+WtEVIHEEa72tjiyBY7f2GG33Ep7pbiHZFuGOo3f
	5ZtvCw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3s5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:27 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b4654f9bb6so113907095ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792927; x=1780397727; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=;
        b=g6hSvQj5EDi9xMTbZr4yPx26bZqD+Y9FhJiMrhrEkD+WkTuZtMi51ODMJDNAuqmgVP
         mJgP12AT8rMqkeR/VIfauaMEwdLB8SBakaTUG18oZPv+pe8UdyVY2GUZuvqPFohghhoa
         yE6hfr/fnDhI07U7AQ9R1FcIZxZ+GrbsFIqmLv3w8sTCZtOHuT3z+gpqE0aMMxALbLEu
         l1b1uJYCA+hxeajDkz63sdgxEWwK2EiXD2f99mDA5L+u51dr+AmxNzfU/lfnJAwEJuic
         r5r6aVGwzcClG7+mtw+6ZMlV/N4/8dH4S7ckgtTjOzYybLVAAaNqLIF/Jck0E5v8Ijo5
         iccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792927; x=1780397727;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7+oMIWKkj/VIw5HK5woBvwChV6hedzlHD42ZSbosrJg=;
        b=Ehu+82llsytvPchkU3Gq1wjSdhb9+iOv0Pq+OO48pRu5UcsaaCGQDJri8N3rbqjtrA
         f98qhEWkAPLexQR1fzwFI6Mzis2aVeCntcaO0mmLY6JcbaPCImcNZ1J6J/VFdu3OBeJ7
         TT7odg4JwK+jLKYPEsm5AMNxnh8Ig+jZCmH2qg+Rq1a8OFlXOFnYnmRzq1Bd/UijFna0
         t9cU47IKEpVzSGixLHHi+Po26zqZVNGQn7WUXy/tyazQl+SBYD/pjeWQS4xBKLCwvLZQ
         KOB2kWxpQxN+ChxACk48QCX5QjopM95CtqRjVK3jH8106CXlyASrYdG3pVkgagp6bsgZ
         3s0g==
X-Gm-Message-State: AOJu0YwnoC8nYUAb4ajvvjgOctX1abnyPoqVJkKYrJfZPD3bFYDJOiEu
	OiSP/gNWhPxyMnDEZA76sWm3jEJ3VgYklfNHiqU4UuIH/q3yMV1j2Yr6gDXRjuDfsz61G+UzP02
	mxKdks8XziXLBYML0MfJhPgB1gBc8JUQfrcP97ARj49G6f8lae1CzetYvl7kdd4/IU/S9
X-Gm-Gg: Acq92OGB0ALSKkIXnnySHBw28xNfViOuX6+Svv3EjklnqJoC+FEOFwIsLh3DBjp6kGt
	U9ZxFpkfTB862iYjUqCX23cpfrNc6kRT96Uh4Wk6wdaq+m/N8JPNvoUJzpi1BoGsRL8GgnIN5gU
	uG1GHoTxQhurezHRNh5hEztyj+yPvIao7cj0KTWGz4dKGbmEgqTQswwsoc7PzXPCKDKndtb3LAx
	Fb9jVZAZ0/wH3LS4IeSgbvpwf0GNDHIvBy8UX17VSgHBjKQFGaQPVO4B2Sh4yrFOm/+o5EtlewT
	guQ7l44sh6CUJfbNh3igPmIcnGcvFXH1Fw7CY3nAuLQ33bSeNpcD1KD2ioPcDg49G2I5SE+dOTe
	2TAjQnxU0vIN5y4dsKQ5srnx/xaBPFgHMTOL7RbuK1K1nyT+D2w==
X-Received: by 2002:a17:903:2b05:b0:2b2:a267:784a with SMTP id d9443c01a7336-2beb07ba97dmr192075755ad.24.1779792926606;
        Tue, 26 May 2026 03:55:26 -0700 (PDT)
X-Received: by 2002:a17:903:2b05:b0:2b2:a267:784a with SMTP id d9443c01a7336-2beb07ba97dmr192075435ad.24.1779792926121;
        Tue, 26 May 2026 03:55:26 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:25 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:42 +0530
Subject: [PATCH v2 6/8] pinctrl: qcom: Acknowledge IRQs for PDC interrupt
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-6-f6857af1ce91@oss.qualcomm.com>
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
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1850;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=ikT2v+yobAWYvn85aNUmFek9xDj3YBzqbjOx1qAX3Wo=;
 b=cgJNtPp2OIa+nkiWfB+1pWygWNxOXX7E0TD85O4YI0GWCM8ESdJtJQZRIQkgTB+vO61dv9knk
 eSEEqVlcsgxD1/IB61FkiskENrFD6FQlTTxkWnvPONNAzvp1Y9qhu/w
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfXzKka0y8GxCod
 u0KNx2/pB0imFVqCQy1E39NhiHgOnaKnzpnMTxQiaRq7Q6Dc6aXwQKEXX0Ni9HIqFy81j6Xn6mk
 f/5+JFLMAKnpnoj6x5Y+Xf9weFn8g3c+LeTKELEOvPJ82BrjUR51L2xRdzbe6TmtFiUQam25rg/
 VbIQ+7/WIrqvrE3aHpfBx1GjDWo4RWfAGCn45MWotX2z6A1lASGa9pbG6/YPYwzYqmNTN0cTHf7
 FdXia365Ln6kKqKDXe9wiZQ8dNNFVMg5lRWE4Ro1F2eMZYWHkC79J+ctNYAplcr/VfR7q9B7ZOx
 i9FZsDIK3YVjpawxqVGJoLeojTjFZaZ5zvXUv9KK1L5EMyNe5vsTD2Bukoei8tV8uZz31Kdc62N
 KvNSwQ9JVtdUB3OUvWjri9cksAMVCfcphcMqwviK7FzdfPs5+WOheR6XRBAdUN6WHKHGzDOhkCv
 TuRcZLfTXpXfwbS3PBA==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a157c1f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6yEXv96CkH8QcgWKpTkA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: J9A_5enPjA1e09strDew5VgxsEBcItTn
X-Proofpoint-GUID: J9A_5enPjA1e09strDew5VgxsEBcItTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-109779-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2E9925D47D7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
index 45b3a2763eb8..c2938494c6bb 100644
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
+		if (d->parent_data->chip)
+			irq_chip_ack_parent(d);
 		return;
 	}
 
@@ -1069,7 +1079,10 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 
 	if (test_bit(d->hwirq, pctrl->skip_wake_irqs)) {
 		clear_bit(d->hwirq, pctrl->dual_edge_irqs);
-		irq_set_handler_locked(d, handle_fasteoi_irq);
+		if (irqd_is_level_type(d))
+			irq_set_handler_locked(d, handle_fasteoi_irq);
+		else
+			irq_set_handler_locked(d, handle_fasteoi_ack_irq);
 		return 0;
 	}
 

-- 
2.43.0


