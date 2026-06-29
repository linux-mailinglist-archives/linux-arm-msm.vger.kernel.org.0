Return-Path: <linux-arm-msm+bounces-114820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id raGNF+L2QWobxQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:38:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A106D5E2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:38:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JUUkqA1/";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N8IAeGpI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114820-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114820-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 003433013789
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D268337C924;
	Mon, 29 Jun 2026 04:38:53 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6A433689E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782707933; cv=none; b=l1IvfBtjcijG7GU0a73mKpWK527QGQD+jK8oKEwEuOxb8+KN7oE4Y3j0xXa555Lrs+o9z81VntCQbJShwQYYp9ZEHcbjd9xy805d/roIK5xUecMBib964ZL0g1XRVf9L9GkjMIqbLOgig4lOWrfhq64WPT3IasQDlshDi3fPBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782707933; c=relaxed/simple;
	bh=eqber2QnjpJ0qBf2/slRNi8fbnfRYGUkPKJcAmezZJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OZlDYJyxPqTCBYLcM9tJhwMjjtD6BSIkgAyUIEBnW7UL3m3JbrSSK7mN/yC/xVz/BPEGkDmTu5iM9khce6PHCvcE1bWMpzR134ti0IEr/qkCTVumoU6NHHirJmLotVdyz9Nxirv68v0ExWbeIXAmfoteUYhqoJX7xpgW07scng8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JUUkqA1/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N8IAeGpI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NHiR1771381
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+H7upl4ky4N/1wHh422Qj7
	n0iMjwso8LVlWtWJ/2DEs=; b=JUUkqA1/m0D3VUPCK8q8nnCIaMkHucNJ3AnBvp
	vxUg02RYo7LpeqvUZRwVS8gHEiJNvWWxECC2zRiTAa4x8/ujxIXHi7VdP+epWQ0V
	8VOpzw4hkphoRg94f7Ss8uu6SBIZ+ONMGsoss0rFMZuy+CowHyzT5cTkSMhr9BV6
	jPKXlSEsCdhfp7+J++qaNON5USZL6OSVWXf+6Uyh7oJjT2P9smMwC9IPWxkMuHB8
	ZhCWswSqfYs+wgcrxcJKpvjDV6PslrBF1Vq8N1pn0s7EFVCqdfR9O0MlJ7Eq4Gty
	zwn1lZSWR1E+S17+VEHcWu4y4kJFJJEW+F56OE7lzJng93uQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tumdnh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:38:50 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139c6673856so4549977c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782707930; x=1783312730; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=N8IAeGpIbbrGZSfyYcUHRz1mOI55/9yOZatFewHPyurz+y+G45bfnDeaPJPUzPtec5
         78cKWcqaWm6yDxk+u7bCOb3w19jZ513SSr/4GzJIxTYpmCww0wuHS0wTWnY02fr2oXUf
         mXbP5oHJ4CRoTwwLyA+E3Cxb3h3xXGdIFYWsCC7pz4FW9sC3qaQ5IKALwbSER64bnv+H
         JdGbyyQtZoHJd/5+U/GzN22iXo8cR4N0D42uzawlwd36KUGu+HmfQGePSKJ9NmngzSXH
         RdI7jV0i2XtoYZlQABYUHR8MsFAl763QeX5wJHLelDhPJTwIbiZ3AmKULwnm9lbzMc31
         KmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782707930; x=1783312730;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+H7upl4ky4N/1wHh422Qj7n0iMjwso8LVlWtWJ/2DEs=;
        b=YltqNLCdOzoEIuvqrl/hWRDiTdRw99HxtsxOC3PpsSIKLOlEmnOGo2JU/9000PhFhT
         hBssf8jhPzZ7EYB7IcD1PRwe3DTW30RIJkDkuvoGxFouisypzL0bpQ8EesUHMSu1mTLs
         YvMc/9iQvYzckx1CpifWKd/d1p2hTkr/VGKKD7aJCX0vfla6BtTdrS0DUiVlHL4iuPdg
         gebskO+Lkco9fflLtcfPmP+eh4WjDuUJqWWIPzaNLpH7RV2HqGBV7+7JOC7iSXekqlgD
         t4hJ7PjZNGxVpgsgJXyDFB+jaQn1izHuKrB4ioL2Fs0QwCWvP88ipAsBFIdRh1F15q01
         plSQ==
X-Gm-Message-State: AOJu0YzC+n32c8yhFmE3phzJcbfUxMEYDyixE0u2sPesWo+GMM8gHkxU
	zJSaV1aQnFiwRY2OsroUbFFGc0wzzy2uDZwxUu+ZGbozQ5o8xxXfDz3SO92z9bQjX936wWVWqJs
	vnmLs1fxFV9wB8KkaIgbvwxfwHPq5G+AqcfF+bnppYUiGUtFjWKcjs5C+5ee8ZgXoYGs3pKwRM0
	Zi
X-Gm-Gg: AfdE7clc6PrR93+IJF8ONianb3sXMZfuiZmxqmj62R8Sf9VLfcv5PYeZve4fgenSjTN
	l0tHuO55JFwrhKshiF8vZ8tW7AXygCqICaZ0oylwwQShHxOelVge3UvdkbdIvdsDp6RDCr2IgYE
	keT++kYXB/FFlrngrJ2X6t3Esti4fU2ulQ9b/vZDLTGT25qcN2uJ/GIm1ZjmRpsg2O/hJHhzMLo
	u5MtVtOnSp37/i0LApJTiYq3pqmeptMq5upLbyGqOm4YTTC7FG9TACwuiKT8Q5xz3Mb1eEuYB2B
	NQaCCOgzo4u7oEGgGh4MviAvMspxcSnmAyeeLjf7+hG4ch9l4+jnhhYWoEV1MQE56Rlu6unuo15
	bpMR84dsuVvWS4ZXDwtm+n6FQNSrTav/XkPU9jUeAXEPbgbnpELO+WC2h+tWDftnUUmwpGydeID
	LyBSTongkFlFIbdiFxW4gBdSImJQqEox12W968pH9O
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099951c88.21.1782707930079;
        Sun, 28 Jun 2026 21:38:50 -0700 (PDT)
X-Received: by 2002:a05:7022:ea21:b0:139:8172:76b2 with SMTP id a92af1059eb24-139dbaa7203mr12099931c88.21.1782707929553;
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139fcf63021sm7791247c88.0.2026.06.28.21.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:38:49 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH 0/2] Add APSS clock driver support for IPQ5210
Date: Mon, 29 Jun 2026 10:08:41 +0530
Message-Id: <20260629-apss-clk-v1-0-8c92fe118ce4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANH2QWoC/02NQQ6CMBBFr9LM2klKgYq9imFRy6CNUrBTCQnh7
 jbgwuV7+Xl/BaboicGIFSLNnv0YMhQnAe5hw53Qd5lBSaWlVjXaiRnd64nUlRdXSeoq3UCeT5F
 6v+ypa3twpPcnF9Mh4WaZ0I3D4JMRgZaEv2oJ/3dG7LouakxMgbGRiqg/W+V6beYC2m37AoLso
 +O4AAAA
X-Change-ID: 20260625-apss-clk-ed39c40ed468
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: KpNSlQ9RtSWRG4ugMhodOodIJ51BQxvf
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41f6da cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=jsnA85DQvCWt_8XIyIcA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: KpNSlQ9RtSWRG4ugMhodOodIJ51BQxvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX9Cm1j9NPmE+W
 oY8p3Yne+dLs/mHKC25pXfxYffRKaOIc2WVZn4VyRnEpK8f1YthkLLZ4K7R+8Yt6G6Bo7C58vFZ
 +glBRsuN/3iwjF57mSM2BehxiL/CCiwIgJz97gtV4NHsIWTxunJHgru6vEd2dEWUvC0hq1kPJ0H
 jAfPt8W5/AH4jmM0q9qW6MDNSHQvYEle7ONAHlLOglaERg/BCrH2A6k5sct4IQLJJEgfh8+rg/Z
 Qw+aN9nUL6VZOBerzdww/gYjzi02HFDi5taMZEO45p0kWwjVQQimcGQ2E/jeVgFVYYqvKbnWw+B
 cIFF+azapQrJJkLZ7uekK26CEEbvDCrgGiUPi4FYhc2fiFNQztW8Kr/uXEO0aGJ6vHrQP0ZnK9Z
 wxyKJyHLOh5zITk9e0b+ukgb8p/xKqvlrqZ+jDzMrqX4yrQaFfR5QHnnsH3bgmVG09gCGy7xBXZ
 upiT8Yf8NFXesAiHeIg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzNyBTYWx0ZWRfX3+BcQIQl+XYI
 nx/7csyDm8KN8lxtKfaOniv+o61358A6AoUHqAdRugY5mlph+lPhOQpJ+VnY0grEzWzn9+l6p1S
 2miGyqLsFwoQPedeerfv2vwkD7XhviE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290037
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114820-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 03A106D5E2E

IPQ5210 uses the HUAYRA pll for the APSS clock. This series adds support
for the APSS clock to change the CPU frequency to one of the supported
frequencies.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
Varadarajan Narayanan (2):
      dt-bindings: clock: qcom,a53pll: Add IPQ5210 compatible
      clk: qcom: apss-ipq-pll: Add IPQ5210 support

 .../devicetree/bindings/clock/qcom,a53pll.yaml        |  1 +
 drivers/clk/qcom/apss-ipq-pll.c                       | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 533704f3c28c3f5f9e2542aa3a6a326c32e6f5c0
change-id: 20260625-apss-clk-ed39c40ed468
prerequisite-change-id: 20260515-tsens-802eef7a2cf6:v1
prerequisite-patch-id: 55c7e7f58ff80ecfed956707a9a893bbf59ef74b

Best regards,
-- 
Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>


