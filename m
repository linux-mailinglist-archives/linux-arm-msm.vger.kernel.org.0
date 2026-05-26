Return-Path: <linux-arm-msm+bounces-109780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QPGVC898FWpEVwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:58:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CE45D47FB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 12:58:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 26A183054EB4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 10:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950A13DE45B;
	Tue, 26 May 2026 10:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bPnPf0rG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6Z2kjPM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C37A3DFC6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779792934; cv=none; b=LN9eYJjO9RAR08xkBhgmEtN5Eh5kDWwmCutCPaZxs/KmcokIqcfO9gdWlR13Bc2bun2HFnWhdbLuMLiUjWCRnUZc1TClHqovdfZItfJTXpmT7wx8E2Wc7x5tK4cS4L0SJiY25gn4cojjFIQ4NX8O3QsezUxHaRhpevd8J2j+XPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779792934; c=relaxed/simple;
	bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qcz0Fy4R2YCCQfOtMk3OI0ITfZPmI+XaJ5YquKgDf8qhSSpTua03iYF/g3qSgCk93DmhD9SOizdLC14eK6YGzAC06JiDsSuewRKxwmTKdnNItqNf//Ut+ZSmoC3e/M5cYMYSXe00AcfKeuYVSnQiT4erKXk/GQ27GfWKYirKcQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bPnPf0rG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6Z2kjPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q5xlGZ1604575
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=; b=bPnPf0rGhspbwW5h
	o9qeX3i0Rg0PB19aQmDANBSIdOGt6PvWknTl7nGFwuzYGG1loUE8Br6XM2aHJ78U
	6IaF+PeQVcPSTposAj3Loi2h60Yhx3So4K0GQZ+ZrUGSEbbX046L2lR99vBYkklW
	RThFYBAh+BpT4F8SOjdUDbiGk23uvM0bctj3en1LcSiNCu5gsq3qjKyt0xGWS9XN
	lfoCW2fL7k5cZYMRl2NRpNsKANVkogksll2+Oc1I9+VIk6LUbw/VP045NW6EB5em
	h6vjVMSht6e+dzowqHoWXyr/VJvSKqZwy8lMaOWQ3mYegWna2dyQ1mOGXdYxajmW
	2hNiIQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3s5ab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 10:55:32 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso105614395ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 03:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779792931; x=1780397731; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=X6Z2kjPMUgqaNucyuCTQOcGLg3B3+vzl4/TzS+n1ZCX4N9lE3GLrrVGIqk5mB0J0KF
         jgvqO21JfRzoz9WIHwZI5hFeBX2NZaIG4fO4/pIzP2TgEOLYBAPlKHvZdyIiXXcK2JvW
         lf9NIWSWnTk51vb+adlcde0M32/9Vx9Zzew+4Y8g0pMABYEqslDALcseVHf+0lfo+SVB
         CREbisK09Zx3c4wUZH9hDEKFQcAKbQbQ4cKXtJgDKsP5WjUMN59TcGqU8zj1L9i5Wktn
         NCYlzzpVghiHUY3Q1PRtesS2G3idoOwZzbCGRVLJRT6mheO5Y7ygx6/esxSkbln3c4xa
         45Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779792931; x=1780397731;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rUr+qjvZHcFisrq6G6teTMwSeaERn+YfgHumNM1mZ18=;
        b=Hv0RkmO4fg/pU0S1D/DoBiz8OebFYUVwNa/ht4cno3oAxGLAckazbbA8vJBj9KjMiq
         l07kDVMlSIud0WqhXu/z8QfFuRJQkvqpMt21bElLEDDkDKCuPiJRaaheVZJdagUtQBKz
         WJoLfqkHHIHZGgg+Hkpz31cp+TPT5ji+5g6gbRSdGc0kvAujdTki5Ajqff3/bw+9+bAX
         k2wNZC6GSUt02C2OabGGXquHyzC6blpNZ6ZuK/5fxwpnF2bmICydi49aTa0VR5/hr21t
         tvKDce6KfWki+73bRHnUtaYMMY5Lfu7vUln21Xy3CYCG87hRJlp52Sv8OfQTaSrQQeAS
         uzuQ==
X-Gm-Message-State: AOJu0Yw1RJ2/pMv+bV32odh++y6WQpQBK4rDLXJxH+PKqIVluKgWGXPT
	tXi7usGLUddNGObOB57T+N2Unu7kXjrZwMSswp5HTPsLkSmg+57iKetfiwnErglAEepgREliEKR
	wDRk8V5a6wfrZFZP3BUWrGYj35JhXgvpTYwY0/I+6M2JHrmwA37NnbZ6dSRlPc3r9g+zs
X-Gm-Gg: Acq92OEGxh8kPKsLNgxBnK3NlhMlaMJiCaycOMywXqip5F2eXsiEVzpI78TsjKuIgfo
	v2HaQr4xgNg5OgtSOqbg3F7aY38REG/UEWGZ26FPvxd3g/yTTPMMQTN2AVlOh9x4CqLIjV69UKj
	y5FBGuqbKkZG46SFZBO5DRWd2XT1F46aq0S1+KQQ5DCe0ehMH6CFcWXoyEZ53oDi3+Qb7vHudxM
	DFGSFtNtYJdL1i/wC0BqrfY714Q3RBIAgZ6jwSa9AKd7SGfi833Tm+PoYLxdZTi9xJ9Wr2W2B5r
	iYV8ldaTIu4Rxk7oq67T84OGQPwlcavkSpudL7kln9G6eZIa0PXn6hYRh+IIrKKmLSlj6d/0+cy
	XhdA57v6S3eMPZeDbC/9hOos4v107w5vW2pXQlucmBWIWXI/gz/4u0r/DF+dt
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199593985ad.38.1779792931033;
        Tue, 26 May 2026 03:55:31 -0700 (PDT)
X-Received: by 2002:a17:903:1ac5:b0:2b2:4fe3:7b89 with SMTP id d9443c01a7336-2beb070c102mr199593775ad.38.1779792930557;
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f3dsm120890025ad.1.2026.05.26.03.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 03:55:30 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 26 May 2026 16:24:43 +0530
Subject: [PATCH v2 7/8] Revert "pinctrl: qcom: x1e80100: Bypass PDC wakeup
 parent for now"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-hamoa_pdc-v2-7-f6857af1ce91@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779792895; l=1077;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=zb4Ff0vj0Rip79kK/H2K8PJcwVDoHRmqjopw2ShHmHQ=;
 b=J51ReIPmh2xekMGenUCwxLHQPEGCIhE/PrGpb8IamhqtLDYXmm1faChJov1QrXC50F6DXUad6
 FquiZjYXOFeCV2wXYieJUsa/2XWgDEwvc2U/MQyFZyvBDgU4j+4oRXm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA5NSBTYWx0ZWRfX7B9dsZpFftP1
 IBK4kp9fUcsB7Jpj3xpBrU9lsaxqXI+5w8pH7m9urc1N4q8tiK7nCtqZUStLz9AqzVrsIfRNFgZ
 q8BWNqMRHDI72pUXNDF4b56S8sIhhRsWte0otc2bb8wBPeSm3FjaofQR9EdLOoZqBDc/z4arVSp
 e/afFb9feZOKkeWE02mxk36PFbKvyaAZzuEnz2mmJ8tHrGBB36QKdoXNGFIEbObulwcfJPWXBRF
 tf7nQ0AdLFzs5WZlKsT9FzU+H1ZzwHwP7xiS/SW1PnfQHLXczvd1OFgiU1t5n6JzTiGvdyfiPM6
 tMWeiOQDYe2WDiZYh0uZDfSgqE+eQ7BZnmWsf5KWy9XV4wdgtH/QMqPwdGeRBeLh2E+8eu7fVyc
 tL4C1RDmbVfCL1U7GGlxPw2aCg8wzj38f3Bl/KvkYlIXB/9c6uTVWE2tpiiU0YzCJdnJuPB9pi9
 z53EijpRCiR3HnAHpSg==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a157c24 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TyWXDXqlpdzf1xDbr6AA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: WRZgtlTQmaqZVZs5gUZ05XC-3CibxshR
X-Proofpoint-GUID: WRZgtlTQmaqZVZs5gUZ05XC-3CibxshR
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109780-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A2CE45D47FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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


