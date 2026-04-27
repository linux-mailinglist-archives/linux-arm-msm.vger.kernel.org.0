Return-Path: <linux-arm-msm+bounces-104770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDfhClGX72mLDAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:05:21 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17162476CFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 19:05:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E49D43006814
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 17:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 095E33D88FA;
	Mon, 27 Apr 2026 17:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z+1Jmvjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P+EZymF0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B251318EF0
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309514; cv=none; b=kwCGl+tYAGAdsK/vsn6UdNVTqWD3IMRWNLj7uV+B91CBNpGnIFElHsIpVoeJY9VqMd2h344kCbvaZxcJedIStw+qGmiU3I7YQvwJxqT4FfYJ2bMKiLsbSIJQyjsq1uVdV5louVDQcTCzsfmlgzVQ/QyP4OJwVczUy5MT00trqrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309514; c=relaxed/simple;
	bh=Zn+quWISx8wdQgasUcyf/jemL/P1NgshIDgkVf7rrUw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ph7g2MvIhEvmA1Y44eL5XytER4fwFvPLwT68dtIIKmxMfVa0rG0rV8pSjTV8g2WaCxvOPNhvTf46ZAMD4j1KfZwVPo5SCZIEzue2EsQ/cEL8oRVtRm33gMu30/4hJMMtt52JtTARcPIhKeC1C27RUrvDP6h5Nljzs6KUubGP1/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z+1Jmvjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P+EZymF0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RC5dos2006212
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1
	VbziWVaU=; b=Z+1JmvjwNgkQ30b/3P/sGwOmJ2/Fq+tzD4s1/Sczg+aDNq8IScs
	vDyI7t3znUUkWS1d+a67Jf39ofN4rf22U9JbH2vc/oO1mdPOJulbPn8qKxkXKj7U
	t0WWdPpuu4ItnKuVbOQzMXrZMOK3pZdSAx6c9+XdRV/gxD7nbUgRFa4IQOdecshL
	D40adoLjGadSgRi5L4mzuGLSJVfJSzefybi34lrPLa0MoO+q3UGcxcAZnCqj9lKs
	bdgtLAknzg6CnanGoi2OMS6vMXKXxdzcasy5lDRafYsWDr9HRQNnBz6sZ3fXqUFD
	mAIA0Z9jK87l8RBvtJ7skDBuqwmXpOrULNg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7gkh4bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 17:05:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35d9dceda3aso2905808a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 10:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777309511; x=1777914311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1VbziWVaU=;
        b=P+EZymF0pPnnh+vH96Ao+N1bMLYS8pDcy4B0HbY+PdmG4orDqR8wZbVbe82ntEqr13
         yqoQ9jal3KqS4r5WRzVEswr2sY4D3FWakJZYljzmf8z7y+ciySFywOd4JEZ/5+naWZue
         2yiCww25QQevkmqD5DU5TnobGxqAFHpMQcJReVbqflzsx934/m9AdsB5HEsgShoIdQJy
         499VU2bixXc0IjG/U1iZbQdizOFcaS4kKvedcjMl2z/+DS9TooxhqAFpVLd+YFCb/R67
         3WtCHUJ1Oiss0i4jipCCglF98Mn0xG0jP/7I6kimUMphCxYvANnVgfgLUIeD46RDGJWq
         qC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309511; x=1777914311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0STSTfIUJw33bLSHMvbgvTD8SvlnnlxK6m1VbziWVaU=;
        b=sS8noEurTrkmYAno87u/AOENhe2Zlun6+R9b/9UjBXbn4KtysiZsGTDOTk/ETRiZLH
         W+c3Dc60IBp2sMSjN3SeXs2ibhGVHpFirEIcWFMxmImSzQvq274w62EY+BONNKHdKVlV
         272pc6wWhrfzhz5KID3khXK+nAyLrX6BaQvVP2WG6G/J7Mh3hf6qCYoSgGTZg31YVPxq
         BhvsZgCLkasMI8x8s/umGABdDHxHNiwgoYhJXdqFPadubHMBzf+chMdLGeOsPrLIbIE9
         SwoyAIxt9QFdhep2v72J2epfnwCpAqUc2ii7irtO4Vq5FNkIBtdLlPhmSzWcqnDpW3s+
         vkZw==
X-Gm-Message-State: AOJu0YwQv/+rFWI0Qv2xZCXuio9mChi3l9CBv0D7syA5ke9xJ2H5UXO6
	Ep45/yDq44pR/M64BPm0Fwv0XH91nLwS4e5obYyOQ5ueJ6sZdu9sdJD2rI/yLDEJbHIvsgGgy7W
	dvNAnO6pwE08Dt++ZMNv49Jn6Rl3oUUh7p00+BIJhvaSJlCBaoZvWZvrOaQo+GZRqPRYH
X-Gm-Gg: AeBDietbBuCaYCzms3G34X9jhIfx9j6OKIu4S9aiHYsRqruW/zmTVTDcC/hUoAoCe8L
	8Kdu9czf5J9L08aUI+j5lJrGpL0xXKBW3YKBTyYxmSq9Oo8hKkipGz6KR4DYiGse7/tvNUtq1Qp
	qsquqlIdZFT8yWDJ1B1c2FueynXvbKvAuUEu+ux7Ni6Yrg3Kt4G1ANfLF43fYUX9bwtxF7oKoeO
	7/6PZ6JgCeKcrWkMrarUc5J7oNcQHY7dSGYj4+qROuolXri/cso+qfuF/lmnsz8TRty9+j5jDZ9
	Zkz8kggowDhVkhRA5GKViGkQNUfDzohve2TTzSRWijfI87Hq5v+5vKVV2XyrraxeQ6byhITSQAb
	KhaWczEnQgpAZfJPhT9MBiCc/ZQ/Z2LgTIblAxLd4G8TwLvd4fGJGDkwe78PUpHM=
X-Received: by 2002:a17:90b:224c:b0:362:bc8a:9c1a with SMTP id 98e67ed59e1d1-362bc8a9d80mr16809750a91.8.1777309511294;
        Mon, 27 Apr 2026 10:05:11 -0700 (PDT)
X-Received: by 2002:a17:90b:224c:b0:362:bc8a:9c1a with SMTP id 98e67ed59e1d1-362bc8a9d80mr16809697a91.8.1777309510623;
        Mon, 27 Apr 2026 10:05:10 -0700 (PDT)
Received: from hu-uchheda-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36490025d98sm99313a91.4.2026.04.27.10.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:05:10 -0700 (PDT)
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, umang.chheda@oss.qualcomm.com
Subject: [PATCH v4 0/4] arm64: dts: qcom: Introduce support for monaco-ac-evk
Date: Mon, 27 Apr 2026 22:35:01 +0530
Message-Id: <20260427170505.1494703-1-umang.chheda@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oE5NFzR1yf0Fff21HjP27jRVLoVFKH8b
X-Proofpoint-ORIG-GUID: oE5NFzR1yf0Fff21HjP27jRVLoVFKH8b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE4MSBTYWx0ZWRfXwi2/P2mqnU+a
 flYfMZXx5p6EwJPXlN5NhrumO04qh/jQXFohrwEGxia2Pfqm0gVebEqFkKEOb+usoqezkFdOZY7
 M51sgrSMBENlOi8jzwc810HpplfAd5wo2faOdr7dVfgfuXb9dP7Hnqli2NISrL5JBCqz3iLmoYR
 bFnAtIC+Gh9zH39CMVENK5J/W4eLDkJSxqNmjiLNFEZgOQSfTp0oKhBlBfC2sb1BRnHbe8BfR7i
 HhWqQrOqKkDoaIvBKYer2TrPpZx6dGohxIF80GSnEp4wlgSSN1S5esH6VLmlBrEDqpLDkjLnOpk
 kHzAwtaGCMpxgwep5KSjD8qhFt+EXlhM2OCT4zxnJHt+fDplJHvWCda3g7TojUPyA9qnQovjdv3
 uykyN5Lu7Oe/Fi0nxpEUExbU2jiPUJGBrlAWXo4nRYHKXPBYmv5J6zYQUJ9psdKAp+nckuCkWtk
 39mSY4cOa3WSZU6tchg==
X-Authority-Analysis: v=2.4 cv=bJsm5v+Z c=1 sm=1 tr=0 ts=69ef9748 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=Li8ycNgQwKCU7nWBN7QA:9
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270181
X-Rspamd-Queue-Id: 17162476CFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-104770-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,msgid.link:url];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]

Add support for Qualcomm's monaco-ac Evaluation Kit (EVK) without
safety monitoring feature of Safety Island(SAIL) subsystem.
This board is based on Qualcomm's QCS8300-AC variant SoC.

Monaco-ac EVK board is a single board computer (SBC) that supports various
industrial applications, including factory automation, industrial
robots, drones, edge AI boxes, machine vision, autonomous mobile
robots (AMRs), and industrial gateways.

Compared to Monaco EVK (monaco-aa):
  - monaco-ac delivers 20 TOPS of NPU performance vs 40 TOPS on
    monaco-aa variant.
  - The power delivery network is simplified from a 4-PMIC arrangement
    (2x PM8654AU + Maxim MAX20018 + TI TPS6594) to 2 PMICs(2x PM8654AU)

Since the two boards share the vast majority of their device tree, this
series first refactors monaco-evk.dts to extract the common hardware
description into monaco-evk-common.dtsi, then introduces monaco-ac-evk.dts.

Also, monaco-ac-evk board supports monaco-evk-ifp-mezzanine attach, Add
support for combined dtb "monaco-ac-evk-ifp-mezzanine" as well, which
overlays monaco-evk-ifp-mezzanine on top of monaco-ac-evk DT.

Signed-off-by: Umang Chheda <umang.chheda@oss.qualcomm.com>
---
Changes in v4:

- Add support for combined DTB "monaco-ac-evk-ifp-mezzanine" which
  overlays monaco-evk-ifp-mezzanine DTBO on top of monaco-ac-evk DT.
- Link to v3: https://lore.kernel.org/lkml/20260413114819.3894307-1-umang.chheda@oss.qualcomm.com/

Changes in v2:
- Drop keyword "sku" from the compatible string of board bindings
  - Krzysztof.
- Wrap commit text of dt-bindings change based on upstream guidelines
  - Krzysztof.
- Link to v1: https://patch.msgid.link/20260328-monaco-evk-ac-sku-v1-0-79d166fa5571@oss.qualcomm.com

Umang Chheda (4):
  arm64: dts: qcom: monaco-evk: Extract common EVK hardware into shared
    dtsi
  dt-bindings: arm: qcom: Add monaco-ac-evk support
  arm64: dts: qcom: monaco: Add monaco-ac EVK board
  arm64: dts: qcom: monaco-ac-evk: Add IFP mezzanine overlay

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   4 +
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts    |  31 +
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 900 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/monaco-evk.dts       | 894 +----------------
 5 files changed, 937 insertions(+), 893 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
 create mode 100644 arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi

--
2.34.1


