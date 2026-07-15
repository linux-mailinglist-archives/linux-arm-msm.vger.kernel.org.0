Return-Path: <linux-arm-msm+bounces-119274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fNaDEzWQV2qOXAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:50:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB3B75EFC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:50:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LPkjc+ub;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="E/4JaNka";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119274-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119274-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D93EB3045483
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:44:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4677B3016E7;
	Wed, 15 Jul 2026 13:44:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F9E2FE060
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784123074; cv=none; b=HKc52lkYMZ3Bhejn7bXM8MQSbO0o394peJFnhZQH9o5RUEyTCKMbisigD1SMppyo38ln6NePLarQxvNY+qSssOTi+DgViBicuEKhZNoncpfoAPbl7UVofL1T6RhUtAUnjFv/Fr9wamq1xp3sEkqIAKGdD0Mv2nyuUDEdudVtZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784123074; c=relaxed/simple;
	bh=4T/4q/GKcuXdMHDGzev5LfJPjRNiNnzaYIn4FFK8R8Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aOi0vDY/ObFfNlCvB0Li4UHPnSD6BSn+Kc3MkTsXdo4eKJ9ARu6p9Jy0AKwcZpjHtSaR11IoC31VxlrGLaZ4LCjMRw1kCBtr8TqyyM9ElmjnRNf+/1yHS3gnQJG8pv7CwoNft+/5UmQvPtfSp6oqB4Nc8ls8d0Ne9WoGwlelMR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LPkjc+ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/4JaNka; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBdOZx3697810
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HjdSK/FcnmoQgdARK7EzP+
	X8SwoN63IAkBGR1xi3pEU=; b=LPkjc+ubl6Wpz42InI2PEn+HIn41VcHl77/od6
	DfC6iZG0tvCP3IgXIu/ezH6VEr/afVwfF16p31ny1fCWxtECsnqlZNwQ1cyenTjB
	g4WSsY93vRimid7XiPqMRHwEdSiTM/dcH1MrlvEdt+wfXoBKoAv0Kucc2Y8E/gyE
	95V3nylq46E8U3C0KF3TOOnxFveu53++TJy7vMOJiRTCsoqy4BZuTnrSrOsP+wcH
	s0o34/Vg9ca7ur1Wk3mmbU3/cqgZsUwOQn6zivHS1Evlrbfg0huS0hUDwcKTh0cs
	hC8FepNEFJkV7YoHETGeIYGSU8pYeHy4aMaqDqfcobNpc11A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe03vjjgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:44:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21c01cf3so41755001cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784123071; x=1784727871; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=E/4JaNkaoiCNWVuuwSRRLKY5dE5AB/DK/3OcW9OiPhgnwFxiEQ86N+3PcaPXdRP6DI
         6PXR8VNRQIVsQgOA849prHu1eEMjpKjTcEHuKdAII+i6l8/f/Y8zDbSC9ROwb4MPM1TU
         F4/Z/4ryfdhSPnhtf6Y7hB6JbPBetMwdtrMUrYFvRsSeYotuFeUmpzqYCjBj+VuPhzNr
         +V/28ix8ZivanXIxsS8Ktq3NFebxxODU9udgcndZeKNlgRyG6Znhk001wfBks5ji9tUI
         dXATwRfRvWtqAaJwWZd2uV59vM8wkBqTfzIYvubFUlYe2kZglWLzHnXpMYv309enivVb
         4eHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784123071; x=1784727871;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjdSK/FcnmoQgdARK7EzP+X8SwoN63IAkBGR1xi3pEU=;
        b=k4ChqCNGWxud9n9zIZw2uXsCPEkb9j0iXsZvchdBttsYfJ+DSX2SzVqF15HUi7rloI
         c2M2z5ISvtjBjyGGUZ4aYV3GQ8LnfsnZMt2xtEsfYJ0Et+RuQaITqwuxNnygp/PERp7B
         VIguBI5iNANK6J0zv8qtp2mCiEep7jmwDQb4L8ESYBUp++BdXl1FXt2A0c+Nz0vd2v3L
         l7X1XOaKiWh8GBesIh9kL+MbAygbJeq1qTiNbhnKhH/4rfAUEHxPg+V8UVtjbacsADsW
         0gDtOz1o7HtlHWyTqEnDbiJz2zgg1dDHfm9HKwH6rHnCZrp4RjytclPtMi76ORVLdvND
         CXvA==
X-Forwarded-Encrypted: i=1; AHgh+RrlW8ontPRGA3wnPlzwnjLf6h4IbYCoGPT4y9OTUJH55jBlTNStG4V2XUKbWD8cZepoO8909TRw8YAM3PEK@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2nlH3sWW1X2vsgnBOyx2ych9iDA4t0UJ/71vNzyD+B9yIGwPy
	9/SXEIqAmNOSk3HXFCUbp9kQjIORxis/+YJC4kjvCWN197mUo3FSMbfiMUtkUvzguF8FVY5w7L8
	ug1yOEsEdgKXREri/Df+C2Um8K9+qXwBlilwUlghNf7dslqEjJk3Qp8zRSdeu6yjC4K0LMVGCY3
	1W
X-Gm-Gg: AfdE7ck5/IuYsz9imS53L2kD/N5pzqaL4Y+ipr49tLOIwfNGBG07mr3Y19NerlR+Tgh
	maEYhH4xsBB0hsBL0DB33eNoxYiDX5DzCKE7fuoDzMar9iMg2A/1ZxtlFc4CvOW8rPAra3IF06o
	ELcGlo7gNlHdmvyrCBEG1kDa16tNga9HEnUYrYXnA3yDXVsiMy+dq+XIHeQHKlbp48p5krqnAkt
	Le7CLLqA9NKmMgntCeMn+tt+Jxoj2eJvottO5X+YaDu9jFMOPaDWJd6WVvz0BXh+DQYcMC1Ga7H
	dC7uNIKl8cLR0Lu1e+adlegHsQishefj/vdtXM+JyvXKfookOQj1sgj3NECjENiYVu6n8xGsawX
	CwWA2euUhE+SvEExaTbI8IS5VeV5OT851iKNwZTfmMDqQJsj8IgGf2OzozJ7NaC00I2QGoLDUzP
	mlYDrKjGyIssgMr16z6+ERb786RONJkEA8xzKiE+N8eW+XULj4mqDBDQp9Fp8eZA==
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175540201cf.66.1784123070843;
        Wed, 15 Jul 2026 06:44:30 -0700 (PDT)
X-Received: by 2002:a05:622a:190d:b0:51c:196:98d3 with SMTP id d75a77b69052e-51cbf2f9fdamr175539821cf.66.1784123070337;
        Wed, 15 Jul 2026 06:44:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd28a17d3sm3041215a12.12.2026.07.15.06.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 06:44:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v6 0/4] leds: pca963x: Add multicolor support and enable
 Monza RGB LEDs
Date: Wed, 15 Jul 2026 15:44:26 +0200
Message-Id: <20260715-monza-leds-v6-0-d1724bb7fe3d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALqOV2oC/3XPTW7CMBAF4Ksgr2tkjx3/dNV7IBbOxCmWSEzjE
 tGi3J0JGxKJbEZ6I71PM3dW4pBiYZ+7OxvimErKPQXzsWN4Cv135KmhzECAEQY873L/H/g5NoU
 jeIjGoQ/aMypchtim2xM7HCmfUvnNw9/THuW8fcuMkgsusLUogm1Q6q9cyv7nGs6Yu25Pg83aC
 C/BCrkSgASUdRS1tnSU2RDUUjArQZGgbAz0jXPKqA1BLwW3EjQJwQZssQKNot4QqoUgxUqoZsF
 5Cw04BNe+EaZpegBvv515swEAAA==
X-Change-ID: 20260629-monza-leds-c292e68c9a49
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Ife3n2qa c=1 sm=1 tr=0 ts=6a578ebf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=vowN3T5aPRO3JaQcBOgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 6coijr3d2mvB1DypLhkqs465lho2C0pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXxMkncvacAP7i
 lREV5FCQw9IvjPBPvDa0Dqd/uT+klg+MmrgButqW5ixb9lyofKS+3R8bHu1CXow5NtAkX9EzMBl
 6FLwTsaLI897FHYWc+1fKaCyjtF3X5863TrT6Gb6SWIJG55PXIm1n1OzObWjL5t5AK2tYmGG8+H
 cm2SBeODE6SWSON4l4nSGB8vU1Oy311LPnwBje0uGabfFZTHtFj89hFsYVW5Ekb/J/KDNawRnHH
 cA0RnYhWH8w1tU8PE+n2kXp2JPFlVwtO7LvSN3rrCHFvw+RaUKjEPOhkVGY2243K/68yK0nEC/i
 zb9FBrZry28OhQnez+zuxWaYIyKQF9IreDRgIpMxX5y/5mgs6u6Uw7EW/CS7hLAPVysD8XeFe5N
 MRfWr0YmgZxfWizRJGzSsgHT1dfyG2PQPNhk70s+NtdT+8Y/EKfCLXB5uYp8X4AgeTcSMqzNhMM
 sRcQapdgnMEO2XyzaNw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX8lAD/07F4Kqa
 YLMc2Wx+MiIv7q1apji8G0vqgi/D1m6wImzobZViryToPM/Z6zbbYvZ+SG5fHqZGRgyvCE5c0Ek
 DbQ44z5u/8RYg734qLhFVfPa3H/fKBI=
X-Proofpoint-GUID: 6coijr3d2mvB1DypLhkqs465lho2C0pe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[172.234.253.10:from];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:conor.dooley@microchip.com,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,209.85.160.198:received,205.220.180.131:received,2a01:e0a:830:450:751c:d61c:c91:60dd:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FB3B75EFC9
X-Rspamd-Action: no action

Some devices use PCA963x controllers to drive RGB LEDs, where
multiple PWM channels correspond to a single logical LED. Add
support for grouping such channels into a multicolor LED device,
using the LED multicolor class framework.

The DT bindings are extended to describe these groupings via a
multi-led@N node with sub-nodes representing individual color
channels. This follows conventions used by other multicolor LED
drivers, while maintaining full backward compatibility with
existing single-color LED definitions.

The PCA963x driver is updated accordingly to detect these grouped
definitions and register multicolor LEDs.

Finally, the Monaco Arduino Monza device tree is updated to expose
the onboard MCU-controlled LEDs (compatible with PCA9635). The MCU
manages four RGB LEDs mapped to channels 0–11, which are described
using the new multicolor bindings.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v6:
- pca963x: keep chip sleep/wake state consistent with tracked per-channel
  state on I2C failure mid-loop in pca963x_led_mc_set() (sashiko).
- dts: drop deprecated 'label' from the multi-led@ nodes and use
  function = LED_FUNCTION_INDICATOR with function-enumerator <1..4> for
  predictable per-LED naming (sashiko).
- Link to v5: https://lore.kernel.org/r/20260710-monza-leds-v5-0-a8972d28c28f@oss.qualcomm.com

Changes in v5:
- pca963x: fix multicolor power-state tracking (leds_on now updated per
  sub-channel, avoiding wrong sleep/wake state).
- pca963x: dedup the single/multicolor registration paths into a common
  pca963x_register_led(), with mc parsing split into
  pca963x_parse_mc_subleds() (Lee).
- pca963x: use dev_err_probe() on the probe error paths (Lee).
- pca963x: pca963x_led_mc_set() cleanups: drop the extra loop variable,
  use 'for (int i ...)', etc. (Lee).
- Link to v4: https://lore.kernel.org/r/20260708-monza-leds-v4-0-a7acfc524c0b@oss.qualcomm.com

Changes in v4:
- Narrow the led node-name regex to allow only hardware-supported addresses.
- Remove useless 'minimum: 0' prop, and add 'maximum: 15' in the default block.
- Link to v3: https://lore.kernel.org/r/20260706-monza-leds-v3-0-37ea8c988363@oss.qualcomm.com

Changes in v3:
- Add color to required multi-color leds (sashiko/Conor)
- Bounded registers value for nested led subnodes (sashiko/Conor)
- Add fix for PCA6535 reg limit (extend it to spec)
- Link to v2: https://lore.kernel.org/r/20260701-monza-leds-v2-0-c1be0b472926@oss.qualcomm.com

Changes in v2:
- bindings: Reworded commit message to explain the motivation (Krzysztof)
- bindings: Kept the "^led@..." pattern and modeled multicolor groups
  via a dedicated "^multi-led@..." subtree.
- dts: Renamed node from "leds-controller@22" to "led-controller@22"
  and dropped the unused label. (Konrad).
- dts: Moved "reg" to directly follow "compatible" (Konrad).
- dts: Fixed unit addresses to lowercase hex (sashiko).
- Fixed checkpatch issues
- Link to v1: https://lore.kernel.org/r/20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com

---
Loic Poulain (4):
      dt-bindings: leds: nxp,pca963x: fix reg maximum for pca9635
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 108 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 162 ++++++++++++++++-----
 4 files changed, 341 insertions(+), 40 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


