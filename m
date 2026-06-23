Return-Path: <linux-arm-msm+bounces-114229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LO3HGFeeOmpMBwgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114229-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FBC6B8118
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 16:55:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JGFJy7d0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jCPi+UTp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114229-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114229-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 449FD310C16B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 14:52:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 223F33D1CC1;
	Tue, 23 Jun 2026 14:52:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C453D47B2
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782226369; cv=none; b=FfM+HOYjH+EkWC4hSxqandplfaB5fialbZrC3FJKjhHX03shLkwvwC0bWXa6P2WNEAgwmBvaDjR5kZqcBSK6hu0pUr0qRHrViCqCv5W3V0So3MAV0exNmPuB/1jDluMq6yRrkzZ3CikTWBEMd62badYvujQhKRTA7M0pRCIqiYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782226369; c=relaxed/simple;
	bh=bDO0HLRhbLse9LwBMTvNU5f2Q19FfSoTjUtUdoZQL14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o5VZDlKXYQl8zTtOMGZS2s7uUi1khl2PZygq8Dn2io2XuC5vdKRDE0T+g9/SywZszzAYq3X2e90ZUInR/45ldttM3+A/XxEmtcvdHOvqUZRC5IjvzE99Wm4nZ/muVa51uZT3HpHqE7WWsKk4l5ZlgspEPdGZoG5Vn3qFn9GDe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGFJy7d0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCPi+UTp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NDFrHx271190
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=B+QYpwe3HHx
	XgG64fNTU3zw9bNLgGI8Ei/eZTnIfCUA=; b=JGFJy7d0wt7QVGST9EsFT6BeXcG
	ggvzuZl25BBq7IWFiFXbmHLMb03ibiXpBD1I0B0GXTdEsTn/PcGCKro2cCU1pBpz
	6vtXdMZ7TDK/9j6vlfLRLrmkM4AWJb59KIU6Yacq7vqVpJ51EaXs6OL+CMU8+QCm
	LjysqOcrbyLp4IftAvzld8VaqoTnd4TBiW2vhD5t0BvFqccLRYYCRuLWu3/3Y3bA
	GDQymQvWAAn2bv3rdDVjAyTcpxmh9J5L5sYDrPfSGa7HnHSah4StvzfPm/WD4U+Q
	i/0ZOOmz5Z7ZxCmnx55X41pK4/66CSJHjQRe8Zryp5WStBnP1zbw/6ju6SQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eytvh0f8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 14:52:46 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6cfc719d238so3569101137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Jun 2026 07:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782226366; x=1782831166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B+QYpwe3HHxXgG64fNTU3zw9bNLgGI8Ei/eZTnIfCUA=;
        b=jCPi+UTp3mf/8w9pCfTK8t+BU8vYpGGsa4vNadStdW5ay7o63Dy+R24qLEYfCxUsnq
         BA07ALLZePdl3ZGRPdOMSs+/O4x9CQ9NuWD5AvAfJbZHhMlBfhQrkbUWCipJwjaNDcWN
         6MlOt7iZ+7y6MC98TIlbOKk/Qse/bh979T+6r09gYJ4FEDsEQHgAmGoFrkaIeme9iBrM
         3M8CYwYImRuwNQbLZ5m7nOIaBDgsA1w5+b1HLjRolTbMp5jy7eZk8sctzW6zhmEVAzeP
         ewzVDHQ+V0oJarg6mhdUVVRvdxHxrJXT/BcqeBjwI/TxcHq31Ep6Bzvo124YdVz0HqHq
         Kb6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782226366; x=1782831166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B+QYpwe3HHxXgG64fNTU3zw9bNLgGI8Ei/eZTnIfCUA=;
        b=BsbPbBZNA2LQDRXGQYBE/XkCZyn1JxaBw/q4suOHCJfC5D1QE8RP2Sg61RlUJbww8t
         eErGY1ftcXb8pHwpXWWyXBEsI6CQYQhJhI5rDI7XIqWMaHRcmvzCoOjds2nSDKrr+utC
         kBO/2jz6yvMRe2HLHwRTd+vYkLmuFVNal2yT9cIl4vHILu51hqypaydJcB+/fuhcb8qm
         ruG7P5Dwdca0xoehbvyDt+mdWf/Q6yTtjUI9S5cqEztBnqFb3SRBkErLi87aCJ8j7U0x
         pk0GUN0rZMxlIlVbzDo4Uy6ap/9RxSrh48trpIt4n85ewWKtUTgIC1+3EACnXXbf985T
         STJQ==
X-Forwarded-Encrypted: i=1; AFNElJ9MSi+ST0GeT5zMJnFTmxw7JRbWDN0HCFYL/oxefyyf6zn/7/Y9P8qDd/Iwqcrx3ei5dmvjWzxymGg/H0cv@vger.kernel.org
X-Gm-Message-State: AOJu0Yye80PhEA4STYoij9UNgAfvk7atQSLFo/P7QAM3/dUS9k3XZBvK
	KwcCPDrfdhuadNcDu0k0iPDvSMjLe7b8G/YAyQN58CzWSkKZr0jykxshm7cQo+UMtIpWUqOIQyS
	sNF8OP3TuZu1h9JU6pIi800nldjUBZM6nahgDU2MKcRllWZ+N4f/sySnbINdqsKMkX/LK
X-Gm-Gg: AfdE7cnQP94VelqhSnueyEwk56Q5KV6w6KdbA2UKtqbaOjUF+UxmjO1RqV6e4QnZHLR
	oZqfv06jhASx0i/r2UZSvRgwjX1cmmNVj6QoWpa2eWW1yBv0E70uYOCu9bFBUrDNhcK9Hp63EBV
	YiwS0+iQT3mwW1P+2Bidfy1AJc+fyFF80xYl66LOkNy7LvpkIB3Dkb3e84JFnkg7jwf1y+vLtZ2
	eR0m5oyph8I5wSg7HZdJLRoqOFUt24pR7b0wZhhDSrkn1SVbQRzCGtZYLh3yZYGIcNQarS2DU1h
	livGZ/Mxkx1xuNjI5RPc9ahK3f6hDsCjtmnAVexplqtdN0rY8afrzMnATK2li5RFH0lCKq4C4NR
	Uu12MMX+Ssw8kCYrvyvqJDwYmCzmkJ3d4177rinjVHFybJn6bwjCsu5SNA20CMrKp/ydOW6mHmn
	egl/W2lsL8gjk2vGx3iEiBhYapYA==
X-Received: by 2002:a05:6102:6444:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-72ff4c6710emr1681262137.13.1782226365488;
        Tue, 23 Jun 2026 07:52:45 -0700 (PDT)
X-Received: by 2002:a05:6102:6444:b0:631:4cd8:b6aa with SMTP id ada2fe7eead31-72ff4c6710emr1681234137.13.1782226364969;
        Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c60aca46csm534042666b.36.2026.06.23.07.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 07:52:44 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: [RFC 09/12] pinctrl: qcom: Add support for WoA ACPI tables virtual TLMM pin numbers
Date: Tue, 23 Jun 2026 16:52:22 +0200
Message-ID: <20260623145225.143218-10-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX0ipuyh5OcqVM
 EZpBGtKj4BOYLsNXmFB4C5sVNL2SZHdZpWxAzWXqEtAYQBQzdZsEYFjRgo44Ux7x3+2TeOP/97e
 f05b1Ecl8fERJGoCXDp3LEyw2fNzKdZ6iCM45VG4urHgVkSIB0OrL2sWeSnnEq24XUB8jLtbARP
 S2x4PbmX2B+3NBMVU1JAyBHCKMGg8XvyoHFTtA7ltbvnSI49dTynZtt9FvfUxirBRwcpez8lYRy
 2/8kyq5emJntbbO+p7ZOWSCymHsGqNBQ4z21bx1n6RfJkrnibuygNLp9Db3jOERd1dIKT0joAbC
 7hR8HGht+bH9OXgeNc6bixsnmiokulvt019JKLAp/Tv1UJXt9J4J6+DGIGZrBg8/8WYOUdXGatZ
 SpQqni82tKOGXlbrBUNTLM1EB82FGgSKJlSRC+JjRwXf1AF1vv6ggK/E6GdigCqu8c5ZM66QJwo
 0OG6DTJy6V1iYGsA5NQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyMiBTYWx0ZWRfX1/vG+d00i69m
 9VN/sMBKmW7/StLD4lIbkOHTMYpyIZxBvc3SxoKoLQy2ORPOJJA3WC0c/5oojzmXWIDXiJ5PjHt
 l1QX9UAmtNkR/IxHsr6+LQKS1rUEfQw=
X-Proofpoint-GUID: RRIMuKURTjm6aAxZh-ZpQdnzbVB3HVUv
X-Authority-Analysis: v=2.4 cv=AJDhMgPs c=1 sm=1 tr=0 ts=6a3a9dbe cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=LGgswLhdDZYStu4mGukA:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: RRIMuKURTjm6aAxZh-ZpQdnzbVB3HVUv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230122
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
	TAGGED_FROM(0.00)[bounces-114229-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:johannes.goede@oss.qualcomm.com,m:srini@kernel.org,m:krzk+dt@kernel.org,m:lumag@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-acpi@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A7FBC6B8118

The ACPI tabled on Windows on ARM laptops use TLMM pin numbers outside of
the actual TLMM pin number range. These are a rather convoluted way to let
the Windows Qualcomm GPIO driver now to use the PDC for some pins because
these are wakeup sources.

This adds support for translating the magic Windows virtual GPIOs for these
back to a regular TLMM GPIO so that ACPI described devices using these
virtual GPIOs can work with Linux.

For now this code only tries to do this mapping when booting in DT-ACPI
hybrid mode which is only used on some WoA devices so this should not
impact any other use-cases.

The new functions use woa_acpi in their name to make clear that these
are for dealing with the ACPI tables found on WoA devices, rather then
ACPI tables found on other devices, like ARM system ready devices which
also use ACPI.

Note that simply mapping these virtual GPIOs back to TLMM pin numbers can
safely be done on Linux, because Linux always uses the PDC for GPIO IRQs
where possible.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/Makefile           |   4 +-
 drivers/pinctrl/qcom/pinctrl-msm-acpi.c | 196 ++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.c      |  47 +++++-
 drivers/pinctrl/qcom/pinctrl-msm.h      |  35 +++++
 4 files changed, 278 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pinctrl/qcom/pinctrl-msm-acpi.c

diff --git a/drivers/pinctrl/qcom/Makefile b/drivers/pinctrl/qcom/Makefile
index 84bda3ada874..9029d99190d2 100644
--- a/drivers/pinctrl/qcom/Makefile
+++ b/drivers/pinctrl/qcom/Makefile
@@ -1,6 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # Qualcomm pin control drivers
-obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm.o
+obj-$(CONFIG_PINCTRL_MSM)	+= pinctrl-msm-core.o
+pinctrl-msm-core-y		:= pinctrl-msm.o
+pinctrl-msm-core-$(CONFIG_ACPI)	+= pinctrl-msm-acpi.o
 obj-$(CONFIG_PINCTRL_APQ8064)	+= pinctrl-apq8064.o
 obj-$(CONFIG_PINCTRL_APQ8084)	+= pinctrl-apq8084.o
 obj-$(CONFIG_PINCTRL_ELIZA)	+= pinctrl-eliza.o
diff --git a/drivers/pinctrl/qcom/pinctrl-msm-acpi.c b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
new file mode 100644
index 000000000000..df180fd04749
--- /dev/null
+++ b/drivers/pinctrl/qcom/pinctrl-msm-acpi.c
@@ -0,0 +1,196 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ACPI GPIO lookup handling for WoA (Windows on ARM) laptop ACPI tables.
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/gpio/driver.h>
+#include <linux/list.h>
+#include <linux/math.h>
+#include "pinctrl-msm.h"
+
+#define MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK	64
+#define MSM_GPIO_WOA_ACPI_IRQ_OFFSET		32
+#define MSM_GPIO_WOA_ACPI_INVALID_GPIO		~0U
+#define MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES	16
+
+#define PDC_RANGE_PIN_BASE			0
+#define PDC_RANGE_GIC_BASE			1
+#define PDC_RANGE_COUNT				2
+#define PDC_RANGE_ELEMENTS			3
+
+/**
+ * struct msm_gpio_woa_acpi_parse_data - Data for parsing WoA ACPI GPIO ctl resources
+ * @chip:		gpiochip handle
+ * @data:		Data for mapping virtual WoA ACPI PDC IRQ GPIOs
+ * @soc_data:		Reference to soc_data of platform specific data
+ * @pdc_range:		PDC GIC to PDC map ranges
+ * @pdc_range_count:	PDC GIC to PDC map range-count
+ */
+struct msm_gpio_woa_acpi_parse_data {
+	struct gpio_chip *chip;
+	struct msm_gpio_woa_acpi_data *data;
+	const struct msm_pinctrl_soc_data *soc_data;
+	u32 pdc_range[MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES][PDC_RANGE_ELEMENTS];
+	unsigned int pdc_range_count;
+};
+
+/*
+ * Mapping does not need translating the acpi_resource in to a regular resoure
+ * and adding it to the resource list. Always return 1 to disable this.
+ */
+static int msm_gpio_woa_acpi_resource(struct acpi_resource *ares, void *_parse)
+{
+	struct msm_gpio_woa_acpi_parse_data *parse = _parse;
+	const struct msm_pinctrl_soc_data *soc_data = parse->soc_data;
+	struct msm_gpio_woa_acpi_data *data = parse->data;
+	struct gpio_chip *chip = parse->chip;
+	u32 gic_irq, pdc_pin;
+
+	if (ares->type != ACPI_RESOURCE_TYPE_EXTENDED_IRQ ||
+	    ares->data.extended_irq.interrupt_count != 1)
+		return 1;
+
+	if (data->nmap == MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS) {
+		dev_err(chip->parent, "ACPI resources contain more than %d IRQs\n",
+			MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS);
+		return 1;
+	}
+
+	/*
+	 * Windows ACPI tables divide GPIOs into banks of 64 pins with one IRQ
+	 * per bank. The resources start with listing the real TLMM IRQ for
+	 * as many banks as are necessary to cover the real GPIOs. The Windows
+	 * virtual GPIO indexes skip these banks, mark them as unavailable.
+	 */
+	if (data->nmap < DIV_ROUND_UP(chip->ngpio, MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK)) {
+		data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
+		return 1;
+	}
+
+	/*
+	 * Use the "pdc-ranges" property on the PDC to translate the GIC IRQ
+	 * from the acpi_resource to a PDC pin.
+	 */
+	gic_irq = ares->data.extended_irq.interrupts[0] - MSM_GPIO_WOA_ACPI_IRQ_OFFSET;
+	pdc_pin = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
+	for (unsigned int i = 0; i < parse->pdc_range_count; i++) {
+		u32 gic_base = parse->pdc_range[i][PDC_RANGE_GIC_BASE];
+		u32 count = parse->pdc_range[i][PDC_RANGE_COUNT];
+		if (gic_irq >= gic_base && gic_irq < (gic_base + count)) {
+			pdc_pin = parse->pdc_range[i][PDC_RANGE_PIN_BASE] +
+				  gic_irq - gic_base;
+			break;
+		}
+	}
+	if (pdc_pin == MSM_GPIO_WOA_ACPI_INVALID_GPIO)
+		goto no_map;
+
+	/* Use wakeirq-map to map PDC pin to TLMM pin */
+	for (unsigned int i = 0; i < soc_data->nwakeirq_map; i++) {
+		if (soc_data->wakeirq_map[i].wakeirq == pdc_pin) {
+			data->map[data->nmap++] = soc_data->wakeirq_map[i].gpio;
+			return 1;
+		}
+	}
+
+no_map:
+	dev_warn(chip->parent, "Cannot map GIC IRQ %u to TLMM pin\n", gic_irq);
+	data->map[data->nmap++] = MSM_GPIO_WOA_ACPI_INVALID_GPIO;
+	return 1;
+}
+
+int msm_gpio_woa_acpi_init(struct gpio_chip *chip, struct msm_gpio_woa_acpi_data *data,
+			   const struct msm_pinctrl_soc_data *soc_data)
+{
+	struct msm_gpio_woa_acpi_parse_data parse;
+	struct fwnode_handle *fwnode;
+	struct device_node *pdc_np;
+	LIST_HEAD(resources);
+	unsigned int ngpio;
+	int ret;
+
+	/* WoA ACPI tables are only used in DT-ACPI hybrid mode */
+	fwnode = chip->parent->fwnode;
+	if (!is_of_node(fwnode) || !is_acpi_device_node(fwnode->secondary))
+		return 0;
+
+	parse.chip = chip;
+	parse.data = data;
+	parse.soc_data = soc_data;
+
+	/* Get PDC ranges, the PDC is the TLMM's wakeup-parent. */
+	pdc_np = of_parse_phandle(chip->parent->of_node, "wakeup-parent", 0);
+	if (!pdc_np)
+		return 0;
+
+	ret = of_property_count_elems_of_size(pdc_np, "qcom,pdc-ranges", sizeof(u32));
+	if (ret <= 0 || ret % PDC_RANGE_ELEMENTS ||
+	    ret > (MSM_GPIO_WOA_ACPI_MAX_PDC_RANGES * PDC_RANGE_ELEMENTS))
+		goto err_pdc_ranges;
+
+	parse.pdc_range_count = ret / PDC_RANGE_ELEMENTS;
+	ret = of_property_read_u32_array(pdc_np, "qcom,pdc-ranges",
+					 &parse.pdc_range[0][0], ret);
+	if (ret)
+		goto err_pdc_ranges;
+
+	ret = acpi_dev_get_resources(to_acpi_device_node(fwnode->secondary), &resources,
+				     msm_gpio_woa_acpi_resource, &parse);
+	if (ret < 0)
+		return ret;
+
+	acpi_dev_free_resource_list(&resources);
+
+	ngpio = data->nmap * MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK + 1;
+	chip->ngpio = max(chip->ngpio, ngpio);
+
+	for (unsigned int i = 0; i < data->nmap; i++) {
+		if (data->map[i] != MSM_GPIO_WOA_ACPI_INVALID_GPIO) {
+			/* TODO lower log level to dev_dbg() */
+			dev_info(chip->parent, "mapped GPIO 0x%03x to TLMM pin %u\n",
+				 i * MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK, data->map[i]);
+		}
+	}
+
+	return 0;
+
+err_pdc_ranges:
+	dev_err(chip->parent, "Error invalid pdc-ranges\n");
+	return 0; /* Continue without mapping */
+}
+
+void msm_gpio_woa_acpi_valid_mask(struct gpio_chip *chip,
+				  struct msm_gpio_woa_acpi_data *data,
+				  unsigned long *valid_mask,
+				  unsigned int soc_ngpio)
+{
+	/* First mark all virtual ACPI PDC GPIOs (if any) as invalid */
+	bitmap_clear(valid_mask, soc_ngpio, chip->ngpio - soc_ngpio);
+
+	/*
+	 * WoA ACPI tables list 1 Interrupt resource per PDC pin and use
+	 * a 1 interrupt per bank model. So each PDC pin gets its own bank,
+	 * with only pin 0 of that bank used for that PDC pin.
+	 */
+	for (unsigned int i = 0; i < data->nmap; i++) {
+		if (data->map[i] != MSM_GPIO_WOA_ACPI_INVALID_GPIO)
+			set_bit(i * MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK, valid_mask);
+	}
+}
+
+unsigned int msm_gpio_woa_acpi_map(struct msm_gpio_woa_acpi_data *data, unsigned int offset)
+{
+	unsigned int bank = offset / MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK;
+
+	/* msm_gpio_woa_acpi_valid_mask() should ensure this never happens */
+	if (WARN_ON(offset % MSM_GPIO_WOA_ACPI_GPIOS_PER_BANK || bank >= data->nmap ||
+	    data->map[bank] == MSM_GPIO_WOA_ACPI_INVALID_GPIO))
+		return 0;
+
+	return data->map[bank];
+}
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f780bab51d9c..60ba0da95634 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -45,6 +45,7 @@
  * @pctrl:          pinctrl handle.
  * @chip:           gpiochip handle.
  * @desc:           pin controller descriptor
+ * @woa_acpi:       data for mapping virtual WoA ACPI PDC IRQ GPIOs
  * @irq:            parent irq for the TLMM irq_chip.
  * @intr_target_use_scm: route irq to application cpu using scm calls
  * @lock:           Spinlock to protect register resources as well
@@ -64,6 +65,7 @@ struct msm_pinctrl {
 	struct pinctrl_dev *pctrl;
 	struct gpio_chip chip;
 	struct pinctrl_desc desc;
+	struct msm_gpio_woa_acpi_data woa_acpi;
 
 	int irq;
 
@@ -553,6 +555,16 @@ static const struct pinconf_ops msm_pinconf_ops = {
 	.pin_config_group_set	= msm_config_group_set,
 };
 
+static unsigned int msm_gpio_map(struct gpio_chip *chip, unsigned int offset)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
+
+	if (offset < pctrl->soc->ngpios)
+		return offset;
+
+	return msm_gpio_woa_acpi_map(&pctrl->woa_acpi, offset);
+}
+
 static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	const struct msm_pingroup *g;
@@ -560,6 +572,8 @@ static int msm_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 	unsigned long flags;
 	u32 val;
 
+	offset = msm_gpio_map(chip, offset);
+
 	g = &pctrl->soc->groups[offset];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -580,6 +594,8 @@ static int msm_gpio_direction_output(struct gpio_chip *chip, unsigned offset, in
 	unsigned long flags;
 	u32 val;
 
+	offset = msm_gpio_map(chip, offset);
+
 	g = &pctrl->soc->groups[offset];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -606,6 +622,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	const struct msm_pingroup *g;
 	u32 val;
 
+	offset = msm_gpio_map(chip, offset);
+
 	g = &pctrl->soc->groups[offset];
 
 	val = msm_readl_ctl(pctrl, g);
@@ -620,6 +638,8 @@ static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
 	u32 val;
 
+	offset = msm_gpio_map(chip, offset);
+
 	g = &pctrl->soc->groups[offset];
 
 	val = msm_readl_io(pctrl, g);
@@ -633,6 +653,8 @@ static int msm_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	unsigned long flags;
 	u32 val;
 
+	offset = msm_gpio_map(chip, offset);
+
 	g = &pctrl->soc->groups[offset];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -717,10 +739,11 @@ static void msm_gpio_dbg_show_one(struct seq_file *s,
 
 static void msm_gpio_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 {
+	struct msm_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned gpio = chip->base;
 	unsigned i;
 
-	for (i = 0; i < chip->ngpio; i++, gpio++)
+	for (i = 0; i < pctrl->soc->ngpios; i++, gpio++)
 		msm_gpio_dbg_show_one(s, NULL, chip, i, gpio);
 }
 
@@ -738,6 +761,10 @@ static int msm_gpio_init_valid_mask(struct gpio_chip *gc,
 	const int *reserved = pctrl->soc->reserved_gpios;
 	u16 *tmp;
 
+	/* WOA ACPI handles virtual PDC GPIO range, only handle real GPIOs here */
+	ngpios = pctrl->soc->ngpios;
+	msm_gpio_woa_acpi_valid_mask(gc, &pctrl->woa_acpi, valid_mask, ngpios);
+
 	/* Remove driver-provided reserved GPIOs from valid_mask */
 	if (reserved) {
 		for (i = 0; reserved[i] >= 0; i++) {
@@ -1046,6 +1073,10 @@ static void msm_gpio_irq_init_valid_mask(struct gpio_chip *gc,
 	const struct msm_pingroup *g;
 	int i;
 
+	/* WOA ACPI handles virtual PDC GPIO range, only handle real GPIOs here */
+	ngpios = pctrl->soc->ngpios;
+	msm_gpio_woa_acpi_valid_mask(gc, &pctrl->woa_acpi, valid_mask, ngpios);
+
 	for (i = 0; i < ngpios; i++) {
 		g = &pctrl->soc->groups[i];
 
@@ -1387,6 +1418,9 @@ static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 	if (pctrl->soc->reserved_gpios)
 		return true;
 
+	if (pctrl->chip.ngpio != pctrl->soc->ngpios)
+		return true;
+
 	return device_property_count_u16(pctrl->dev, "gpios") > 0;
 }
 
@@ -1428,8 +1462,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->label = dev_name(pctrl->dev);
 	chip->parent = pctrl->dev;
 	chip->owner = THIS_MODULE;
-	if (msm_gpio_needs_valid_mask(pctrl))
-		chip->init_valid_mask = msm_gpio_init_valid_mask;
 
 	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
 	if (np) {
@@ -1450,6 +1482,13 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		}
 	}
 
+	ret = msm_gpio_woa_acpi_init(chip, &pctrl->woa_acpi, pctrl->soc);
+	if (ret)
+		return ret;
+
+	if (msm_gpio_needs_valid_mask(pctrl))
+		chip->init_valid_mask = msm_gpio_init_valid_mask;
+
 	girq = &chip->irq;
 	gpio_irq_chip_set_chip(girq, &msm_gpio_irq_chip);
 	girq->parent_handler = msm_gpio_irq_handler;
@@ -1463,6 +1502,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	girq->handler = handle_bad_irq;
 	girq->parents[0] = pctrl->irq;
 	girq->init_valid_mask = msm_gpio_irq_init_valid_mask;
+	if (pctrl->chip.ngpio != pctrl->soc->ngpios)
+		girq->child_offset_to_irq = msm_gpio_map;
 
 	ret = devm_gpiochip_add_data(pctrl->dev, &pctrl->chip, pctrl);
 	if (ret) {
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 4fbff61de6bb..3a8a55a6d8c1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -10,6 +10,7 @@
 
 #include <linux/pinctrl/pinctrl.h>
 
+struct gpio_chip;
 struct platform_device;
 
 struct pinctrl_pin_desc;
@@ -181,9 +182,43 @@ struct msm_pinctrl_soc_data {
 	unsigned int egpio_func;
 };
 
+#define MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS	32
+
+/**
+ * struct msm_gpio_woa_acpi_data - Data for mapping virtual WoA ACPI PDC IRQ GPIOs
+ * @map:	Map to translate virtual ACPI GPIO offsets to TLMM pin offsets
+ * @nmap:	Number of valid entried in @map
+ */
+struct msm_gpio_woa_acpi_data {
+	unsigned int map[MSM_GPIO_WOA_ACPI_MAX_VIRT_GPIOS];
+	unsigned int nmap;
+};
+
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
 
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data);
 
+#ifdef CONFIG_ACPI
+int msm_gpio_woa_acpi_init(struct gpio_chip *chip, struct msm_gpio_woa_acpi_data *data,
+			   const struct msm_pinctrl_soc_data *soc_data);
+void msm_gpio_woa_acpi_valid_mask(struct gpio_chip *chip,
+				  struct msm_gpio_woa_acpi_data *data,
+				  unsigned long *valid_mask,
+				  unsigned int soc_ngpio);
+unsigned int msm_gpio_woa_acpi_map(struct msm_gpio_woa_acpi_data *data, unsigned int offset);
+#else
+static inline int
+msm_gpio_woa_acpi_init(struct gpio_chip *chip, struct msm_gpio_woa_acpi_data *data,
+		       const struct msm_pinctrl_soc_data *soc_data)
+{ return 0; }
+static inline void msm_gpio_woa_acpi_valid_mask(struct gpio_chip *chip,
+						struct msm_gpio_woa_acpi_data *data,
+						unsigned long *valid_mask,
+						unsigned int soc_ngpio) { }
+static inline unsigned int
+msm_gpio_woa_acpi_map(struct msm_gpio_woa_acpi_data *data, unsigned int offset)
+{ return 0; }
 #endif
+
+#endif /* ifndef __PINCTRL_MSM_H__ */
-- 
2.54.0


