Return-Path: <linux-arm-msm+bounces-61983-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A00AE319A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 21:04:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A7481635A9
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 19:04:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 391E418DB2A;
	Sun, 22 Jun 2025 19:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="QjWNTScA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEA319A;
	Sun, 22 Jun 2025 19:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619077; cv=pass; b=eGRuSEBeYlLqjX+ovTSp3Mch7LCYfwFjl/lhGyFi6bL9qAlGV0UtbKY2xP00+Bb2RpJ7h7R97CkSFZJcsN38YNLqax2mRf3Xy9qG6+B6qlc8dZajqDxlxysKMXcG/yABlt0O/Ku76m5SH5R/4m+wC5UIcCpbL7cLZpco9vGgzKU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619077; c=relaxed/simple;
	bh=bKcIu4YmFvKnN7tEOiXGIjqjmyQYPGhJ4shpLTJX2d4=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=q3So938cIZyzAzcB0RglBSfc5XZ6/1mou5jepi79U/Jzr3e2yHRr55QJ7kQuz83h6YF2LIbwZHxyBjBQTPYPcFXYRqwREvGcgmEXPLQWrCWPzUaA/5TBHg7BP2J+E5qw5ktOUgsK6/WYV/rsUOloMk80vYulGgnVXYpGgRnbiM8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=QjWNTScA; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id D45BE8A52EE;
	Sun, 22 Jun 2025 18:26:55 +0000 (UTC)
Received: from fr-int-smtpout7.hostinger.io (100-108-113-245.trex-nlb.outbound.svc.cluster.local [100.108.113.245])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 943338A4683;
	Sun, 22 Jun 2025 18:26:51 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750616813; a=rsa-sha256;
	cv=none;
	b=nyWMhpQ0DI3j/beyGc2JzLVAXqwVuiHWm6ZYXfopny/wFGf+TNFwtaiZnfj7CD4g0r8dBP
	ew/a6Py9Lcdyb2TMJCwZ/isA4QXzJTvgDJkaE7wh/+fHvzn97jZqP5sEc3kWThCcfHB+zf
	spVhOHnOLB8Nyg4u6XEefqK17hOw1aYdJTgh59xdTpB5nTBDl1nEuE2qrkLrNOGY1rnMLL
	SJBOiv/2xBw51qMNoezTPL4LecHE736ZEzk3boibMZMfn9F3/l68TBK5qQmEGNhFR0VEmv
	L3kUoM6TFJCLs0DTRG8CSz8c7w5jh6oZNtsCRoeXSw/U/qEeT+JT5wEOhnR8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750616813;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=t2GFeEqAL58m2f02+3xj/U2MJQmHIsbUnxB2cKRe7HM=;
	b=DP7/qmzzxJk4RaG4zVZd8k5aVbj22IgE93HCLEPyNakEO7zN+NplhPLkv3ziOxaiBYNu3W
	rkZhx8O4HZ64KTqjdNkEnYMSV5RKHrCeM5yWbxbrcM7PGav+tmuCGFld3DKAsT3INTiIfk
	1x6lE6GGg9Yghnvj86xoeEjmf1CttJVWkbzYT9qCPyAF9R23dBOL5MNXDLhHP0CsdnVP0h
	94DKEwoAqB/nqYnYkHMdtdlmk79qAm9s0QAE6vkZViQKaaCbo80whyeKifJYMjUDLiPawo
	kw23GKOUvd8VNHdZpdfNgrPJbvCgM3euwqK3eBZzH1Uzn8tGNWU3oKx/8BXYxg==
ARC-Authentication-Results: i=1;
	rspamd-6597f9cdc7-npqlj;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Scare-Glossy: 0c7b7ccd4fa228b3_1750616815774_3533473480
X-MC-Loop-Signature: 1750616815774:3947712857
X-MC-Ingress-Time: 1750616815774
Received: from fr-int-smtpout7.hostinger.io (fr-int-smtpout7.hostinger.io
 [89.116.146.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.108.113.245 (trex/7.0.3);
	Sun, 22 Jun 2025 18:26:55 +0000
Received: from [172.17.0.2] (unknown [36.79.123.39])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bQKRq3F3wzKLLGv;
	Sun, 22 Jun 2025 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1750616809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t2GFeEqAL58m2f02+3xj/U2MJQmHIsbUnxB2cKRe7HM=;
	b=QjWNTScASiUYMENJ1b402rf/xnzF13ssi+tXlV0dKgZ3SNzfibI2hEk8q1eLE5x5mthetI
	/L8fS8h7p19XLmdVsn6R2v1u/g9/wpihQQpUHp5PfzWZr4y9+uH/KUnnarCciU6VdxJaGr
	4su8twYsggwuOw6AKSPtCZ5JI6Xcs9aAyLRfetcayv4aZTXieVCysVhhDrjr1V3ocpRhK+
	rRPC1I5CcIlzZyMAfwPVQFBHoCFCFgY+KyhaXoCV/aqrP687ncpZ+xUX+e6B5cfydrVN7Z
	Srq5EbY0DJJ6wUBAlWKl/tDv4UmVNT8/6IbHpBOB6wCbxMpGgXyl5YGSrw2mnA==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH v2 4/5] dt-bindings: arm: qcom: add Sony Xperia SP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-msm8960-sdcard-v2-4-340a5e8f7df0@smankusors.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750616795; l=1221;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=bKcIu4YmFvKnN7tEOiXGIjqjmyQYPGhJ4shpLTJX2d4=;
 b=xvNmIM2GYI2GF2ZQkDVjAXE2rM2uhPGwdqvnY03K/QghECbts+o7+KAgTnaF2UcmqBJwXm4s4
 0kIhReoGUB2CIMZRXh7knEFFKwtp1Grp93Chgq63Th1U7cXPF9F0/dc
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Sun, 22 Jun 2025 18:26:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=68584ae9 a=vFgqIyFt8cetXi1S0ACNwg==:117 a=vFgqIyFt8cetXi1S0ACNwg==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=bYGVSWbl8t4XKdEgDhAA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfJxIfTay/nKcFcvrBvYfiT8b3u36onuCWFGoq8WJO0/X8OHNDkCSEykctn+1MOK2KD+K2OKfwb5lngihcYGKR5JpegIylBIIbpioJHl2fSENlgXQYRVo 9XM88AgeDAQDHdDiIvCguHzVTHpQ14Fik5aNSlPyrnbjEclpSIhX7dpHjFI/7x1z7lR42q+oyUXDS6aDMF/FHa+YuVS/WGVa8m9sJhvwLbsnILrgr9kmYzIj hvxwncx6vwVGyonx/KWLFjDVo27CcHN8OU6Tfrp9Xf0yw4A9PxyGYQaDlRc6I0woAU/D+VQfn+tVXgN/1/T2inRgic8a+7aNfwxU8i13yfwH4+cMCvSOtSgx iWOMJispdG6RQtL8iQUIWsO5NVLv049b5Cuk01QNIr5Te3onYeWg1zh++Cmx2vxkEjsuUvfgdc3dY13bLxLOE/sgd/Z0/010Atasxk8wJOtdIdeWZyeuliLT qozCc8b266LPxjWfrRnMU+7gWD7qOvnjfN854xw5IIc1/SXb6sjmDbC8cYI=
X-AuthUser: linux@smankusors.com

Document the Sony Xperia SP (huashan), which uses the MSM8960T SoC.

The MSM8960T is a variant of the MSM8960 featuring an upgraded GPU
(Adreno 320 instead of Adreno 225) and a slightly overclocked CPU
(1.7GHz instead of 1.5GHz).

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 56f78f0f3803fedcb6422efd6adec3bbc81c2e03..6a957901a664b26c586e45876447b83f849fb5ba 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -44,6 +44,7 @@ description: |
         msm8953
         msm8956
         msm8960
+        msm8960t
         msm8974
         msm8974pro
         msm8976
@@ -203,6 +204,12 @@ properties:
               - samsung,expressatt
           - const: qcom,msm8960
 
+      - items:
+          - enum:
+              - sony,huashan
+          - const: qcom,msm8960t
+          - const: qcom,msm8960
+
       - items:
           - enum:
               - lge,hammerhead

-- 
2.34.1


