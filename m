Return-Path: <linux-arm-msm+bounces-115238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id C320FfDMQmqoCgoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:52:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF32A6DE7FD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 21:52:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oxS6m1ud;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DdolsNgE;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115238-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115238-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2E5D93004601
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 19:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 011E31A680C;
	Mon, 29 Jun 2026 19:52:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BB7285CB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762733; cv=none; b=LepAKDAn7llJYpUlSQCB0JDkZ3gvje1Om4wHYmiBeQyLSfXNFLTyX+Cp6aMM72dAx9Af3v8hh+VXQoBRTtM1FU/2OeQjC0C+cDwwE5ZeacH3oF0CZCJcDspNw0p9a8pBUZEP4SqyVU+sQ+jbOQ0lgwMaMRbBpiX6ztCvBN4iRV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762733; c=relaxed/simple;
	bh=jwWGuiw3QNOOc8+7UuS4DFRow4gvfUEqaIQPPEv+/JI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EJDIE2YAR+4VKLn5r5OXpSG5/NLFRMQKebOsoI9jqmwqTEarZLH81VvhjZ+1VCaPETrlH1wnakpGPYBF2Iu94CMGFeoJxnv5MnGQUuuvBbsZbfkldQSAT886m8d3W7W+gDHhRVvDbxMMgpaKxy9fhDxIm7ABBJH0MEbYB/XJoGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oxS6m1ud; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdolsNgE; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TGJxZL3454865
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jzAMeYuDqDsgLfXppsKUFN
	aGZ7zLI+C/WLqo7NaMSSo=; b=oxS6m1udt4eS5V+p09Gnzbo4O7JjTsXZfjNwgt
	IORRq29xPew9dzi7Xhc+INuYX2nk5Y7V0S/E+4YJu7Gz7KOTcecIJftFJlBqNbN8
	lZVW1DG2t+TkKxk+b4VkUCDJZN8xeJ1faI+ErMVSnKW0GFBuwtjeya3tFDO1d0vo
	xJmOJHh+VFpBeEPQkLqQLI74bVHUEMdTp/NF+1jQM93LInaZrlOJfKZIujlSJdwS
	LtdbUVK/4O63hbzhB9VUEj0ETthrEQEbMK4sZA0YcRvJt17kL0Y+SUXggcXBUsuZ
	T9RpVHKLWzJFTy7nzcWCg6gLDHK0Z+r8/xOLixci43GJd5Cg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4tu9em-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 19:52:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e606e8f3eso84955585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 12:52:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782762731; x=1783367531; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jzAMeYuDqDsgLfXppsKUFNaGZ7zLI+C/WLqo7NaMSSo=;
        b=DdolsNgE5aXMJ+F9Gn21XlEcoHsLIzNDbFkjXIlHDY9e9r4EPno100nT+CDsAVVgNY
         LKLlPee5XACfnA9BKcbv7vYSDX0WFDlx8QnMORDu9GmZdS2GRAzzVJoI+0BP1QEFwRd/
         xMmMPZTV0dTwPkxLzgzBgeoSorEFxlpl+LXlrst4ceqHgRj3NYyRLc448ldoCynG2tGN
         qdmT9skyg2etYTlV4g1jwWi9iwRlTqGpkArio7eI33X79BTONG/n156u+TvPPGnaCqN/
         XYiF+CCjRUsqpZAPVaxOUdmRTyZ6oaAQ/rPtBKtYzoZKnFhPP8i/Lc9eyrjrf292up0T
         +Feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782762731; x=1783367531;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzAMeYuDqDsgLfXppsKUFNaGZ7zLI+C/WLqo7NaMSSo=;
        b=VHUj+taygoCmdYduQPpaBiLn964JVrjgz6/depDYrJQFIRKY1UvuBRNPHMkkPNqgbD
         5aN43M+32Junx6ivr1kATJZncTeg5VqnQOy9/XMBiYtE7XjhGKzDORoTwFkuQHnZ7ej8
         kWEQLLmdoVyFdn1psA8+RgAraAcWAYaqMth4M9hTnYzrJMv9otu39M9sQ+fFuk0hh2gQ
         yMvARsiK9D6X5jdTu6rpa45V4E8AmTPSWCLz83QeluEC6IVASHPdgm1SiNn6OCfs/C++
         jDbBBdtzUeAhFgTeGW3WXItov5VX/CDN/75NnML3ClpT8TyUarpGU8cY7IJ6Uj9EQBZK
         11Tg==
X-Forwarded-Encrypted: i=1; AFNElJ/5lAsGkHxXMQo+xtciwfDMwjwgkxduAiPT+6pVrE/2ltD1PLAynKIF0caNmVesFcSEEDJpCBm04bnxKPq9@vger.kernel.org
X-Gm-Message-State: AOJu0YysXkLqdLSky+KItyO+QD9dCL4YZ2O2f23eReAsCg8TtbmkObtq
	RNl0o61P8DOtw5fuwScbQE2XnvEz4JTgEI4zWUsog1HtSzIFes0S0ePT+Vd1Modn5kUEwuFW9KU
	mHtqUc4OqSHnl9Ce57lUHYNimkGCrQC0D/JUh1i5yO1pgRW8H0o+pJF9N4iJlCekNpfl0
X-Gm-Gg: AfdE7cmDitn9H/iHptYiuVfYUa9kxQy5cHUkRzAOXkvvLXrehXFZW4Cj2fcyk93uRyf
	5ESE8k9UIEafejxaq3jSr4jI47fi/lgSlr6M7xfpEa2HwHlHDy2L9Xp5qcSMAZ/WP9sUqkTrXZu
	IErFknyZWTzUAAEpKVJh0DVjN3d1iq+dHQP/vrx8chAPTNhQCuOYha5z+jUtjn9KksoOyzhWllt
	Mh9g4lANu2m3U0476OPVZwjZZ25NKplM8j3PiUJMvcVw9D6nK+kV0SXDD5yfIkMZjC5uzffy+mm
	44dNBEj64WRwGfe2p1Dyvins+1Bx2bk1aMsnFgMonkgrRQZahkDcL7dOwKtMo55q/JMzf57bfTU
	zWiBlKyw4U+7reA0X0F8G9wSLfEJa7ZwfQR4EMfyB+sdJKy6GSGEAoaaGaul7lrXFBGRcXtWByh
	L98JAt6uenNpWVkxzH/2sPVefbofgMZzb+a3wqjy7jsDjwtfAU/nkuHppsGbLF8xy/X9MevoiIp
	FMZLe+X/9RuSzFO1Qus
X-Received: by 2002:a05:620a:1a09:b0:92e:5856:bdcd with SMTP id af79cd13be357-92e6287e359mr155314685a.53.1782762730644;
        Mon, 29 Jun 2026 12:52:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1a09:b0:92e:5856:bdcd with SMTP id af79cd13be357-92e6287e359mr155307785a.53.1782762729850;
        Mon, 29 Jun 2026 12:52:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (82-64-236-198.subs.proxad.net. [82.64.236.198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8d99565sm6360005e9.0.2026.06.29.12.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 12:52:09 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH 0/3] leds: pca963x: Add multicolor support and enable Monza
 RGB LEDs
Date: Mon, 29 Jun 2026 21:52:06 +0200
Message-Id: <20260629-monza-leds-v1-0-0cf7c0a7dc14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAObMQmoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDMyNL3dz8vKpE3ZzUlGLdZCNLo1Qzi2TLRBNLJaCGgqLUtMwKsGHRsbW
 1AFdMQEdcAAAA
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfXxMXln7hKEo2v
 lNBZtv/JRgsgtm7wAO9uHW7sIH+yIf2+TxPNwr/Lzllhvie1Ca2WC10JlWFPk9MJamsVT2uhmx3
 G28apq/p/OAIIaf4bgn62JwVFkPjSabhxK2zHZVF9KEO/dMWkAYAow4r5mEd3fo7rAsu3+6wEIb
 KoZhms28W8B7Ud7/9VI80UEhacaUfj2MWpEZ/DcD9BLrajkiou/TzBMR1k0RKBIHoW0bRLKtIvl
 3WDiHffzWwNHhXRBckHGSOAiQP2WXXjzxvZAebZ7NnR2KNDAzkbN3cl4242JFDlbNJ5G0BsA/IH
 vzip0qKVPtEvwBdanNpcvxVKasyXYN4vFHOFGKjJTwJ7wn3MVuxHmof9hr4xssLyvxjPeNwFfMs
 BsYi9eCSm+1JZ6/PgdSw81SCGiDY6HO6CNLSY4uWYat4G0AeTudRsxUf7epGffwKQtpb02jqXgf
 HKuMGq5xZQC2+tSXy+A==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42cceb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=MDeckJw97qnk8wCBExTehA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_-IZY4xtMCx_iijEg8sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDE2NiBTYWx0ZWRfXzGs4Phnda9mE
 rXJn60MKuaWs8e7W5WoWuvs3dySZuHqcZmOAdR9az80/DvclK717DYOXwgMSKt04oAxLIr5bOfH
 fqUJJ+IqOzELyu5JYDTRjCvvBDkcdmo=
X-Proofpoint-ORIG-GUID: JWrLZHeIWWChPDa5ol2mpxoqUFbyYWK7
X-Proofpoint-GUID: JWrLZHeIWWChPDa5ol2mpxoqUFbyYWK7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290166
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115238-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:laurent.pinchart@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:loic.poulain@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF32A6DE7FD

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
Loic Poulain (3):
      dt-bindings: leds: nxp,pca963x: add multicolor LED support
      leds: pca963x: add multicolor LED class support
      arm64: dts: monaco-arduino-monza: microcontroller LEDs

 .../devicetree/bindings/leds/nxp,pca963x.yaml      |  83 +++++++++++++-
 arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts  | 110 ++++++++++++++++++
 drivers/leds/Kconfig                               |   1 +
 drivers/leds/leds-pca963x.c                        | 126 ++++++++++++++++++---
 4 files changed, 301 insertions(+), 19 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-monza-leds-c292e68c9a49

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>


