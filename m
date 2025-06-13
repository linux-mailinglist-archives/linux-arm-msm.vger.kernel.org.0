Return-Path: <linux-arm-msm+bounces-61261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94551AD949B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 20:40:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48FF31E4908
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 18:40:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DD122F774;
	Fri, 13 Jun 2025 18:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b="U2YbOscy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from caracal.birch.relay.mailchannels.net (caracal.birch.relay.mailchannels.net [23.83.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAAB20F09B;
	Fri, 13 Jun 2025 18:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749840050; cv=pass; b=TmA1B6KPd5KW5OrrB2W4boh682OyUpKkIVadIvdTE9Ld3h+79J3ajk6Xx6NP1VcOueGxIwLB1OaQ1SGrNpBR6QqP/548dOVn49IqbpBLDqvqtiDuPiSckhNFh72Y8PvFGBZsHC/Xg1BkeWomA7XWIg5SpS1Jb2j6L6XtZEPI2/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749840050; c=relaxed/simple;
	bh=ytylsNEaw7BOebZLWEcNq8otpQNwRAvusM0Tiwxfvgk=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=VDn4qivS4RWKxH2XrMxsbI4K1zuQx+9NoNja+LwxuO4pm1zc9L7a1tgb0N/A6eYDB8ENVP2T5Ci5gLmx4U1frtTOPi30owNfa8w/BZIhhRnRLLeh6DTNp+HO+z/0j7Axzz4WlZW3YSZj3uSoIV721pufmlSO7vXS6KIfFTng7ss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com; spf=pass smtp.mailfrom=smankusors.com; dkim=pass (2048-bit key) header.d=smankusors.com header.i=@smankusors.com header.b=U2YbOscy; arc=pass smtp.client-ip=23.83.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=smankusors.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 49C344473E;
	Fri, 13 Jun 2025 17:51:08 +0000 (UTC)
Received: from fr-int-smtpout9.hostinger.io (100-96-77-9.trex-nlb.outbound.svc.cluster.local [100.96.77.9])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2BA9642CD9;
	Fri, 13 Jun 2025 17:51:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1749837064; a=rsa-sha256;
	cv=none;
	b=UjML1ZOdb7ixNA767ni/qu8ztakofh70zW3XslOMsj9RjtCo0tpu38zruTujgTYx0OQedc
	0iG9ZvdCQ95Y73d6b7NnDhYm8Kj73kWkId+s6/40YAkRt7ERXD6AFMHYNIxOVnYW1ohAIL
	9VzkvQ3g3PeG8SvlXQCKyVUbyXOD0nT7OPdO+kAuzD4Yopbe8ZOZeslqrxLYsZrvQJylug
	Ltz3bz6elu/p0G0MBllq8lXD9sbTABRDPb21SU2aQvD6PKdRdXwNhMfah5ocDGGjBrea0N
	c3AXfhjirxNLT/3TW1uNFDRxfhIwYllcMW/xUrULSpEe7zJSGsDZT0RsnONtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1749837064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=jxHgqR517CZvKTP1m9cgQuCwxXu5oH1+UHhadRlTZR8=;
	b=oIQDhxQiz6dE+ql9a+Zo4USeDN4pTU4Pzx5sbXurrDBh4lpjrj0FDgVG9Q2spNB/DZS/j1
	xMHjNF7T8gYc7kL3h6dUMa9VGLV86xHWRw8SGatvgG/Sn4OHrdFeqMlWB2VEQHAYPiKjPB
	YWnIcMGpFS8/2SX23rBVBO/D2R2ZKxoaMrSV5A2zj5aXyE/sTvQSQrJ+uIu4JAJ3YfPGz0
	FRJXseSzkrPLcxMj9tUVMDrRrpBcZqvzqLUcRBgsACuoxWLW0oXyRrFJkQooXwPDkB6tYa
	fu3MWBQQdAy36NDtyehDWaIIbZqnzRi5WD6Xo7de7gGo+Wf1zBtLLoaPQ1A8Qw==
ARC-Authentication-Results: i=1;
	rspamd-5859dfb5d9-fwlfl;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@smankusors.com
X-Sender-Id: hostingeremail|x-authuser|linux@smankusors.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|linux@smankusors.com
X-MailChannels-Auth-Id: hostingeremail
X-Daffy-Cold: 306173e8455c9aee_1749837066505_3073936017
X-MC-Loop-Signature: 1749837066504:1924555187
X-MC-Ingress-Time: 1749837066500
Received: from fr-int-smtpout9.hostinger.io (fr-int-smtpout9.hostinger.io
 [89.116.146.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.96.77.9 (trex/7.0.3);
	Fri, 13 Jun 2025 17:51:06 +0000
Received: from [172.17.0.2] (unknown [36.79.97.133])
	(Authenticated sender: linux@smankusors.com)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4bJn432cT1zH9gL4;
	Fri, 13 Jun 2025 17:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smankusors.com;
	s=hostingermail-a; t=1749837055;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jxHgqR517CZvKTP1m9cgQuCwxXu5oH1+UHhadRlTZR8=;
	b=U2YbOscyLMgGrZP6Zm0CtDcQ2NT9G5oZhmIP9bvuOahDNxVvvhBCWFn0JTNEdViqZsIB97
	jsx+PKyn3zi0uU0H7rc7fj4R4BytFt8mlednesHK7vrcwQrV0DqolGUkLaIIgHAv8u5Wwn
	mnRhSHgg26p+Qxotaw5/FIxj5TW2amCh0NR6eNpzW3aksz84h+JBynPe38JpZcufh8CAcO
	50UBHm1O5AgFxVMLQsbFRO9tZnGPkyzp+NaLLFp60CC+PNXUW1giPc3dysW57PFhAZaYQ0
	LikmvV+MMplq9CNMLH2NgEGZBX3RT9F6apz/AwWufmHSosE3q+BTgXaICnSRng==
From: Antony Kurniawan Soemardi <linux@smankusors.com>
Subject: [PATCH 3/5] ARM: dts: qcom: msm8960: disable gsbi1 and gsbi5 nodes
 in msm8960 dtsi
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250614-msm8960-sdcard-v1-3-ccce629428b6@smankusors.com>
References: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
In-Reply-To: <20250614-msm8960-sdcard-v1-0-ccce629428b6@smankusors.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Max Shevchenko <wctrl@proton.me>, Rudraksha Gupta <guptarud@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749837006; l=1481;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=ytylsNEaw7BOebZLWEcNq8otpQNwRAvusM0Tiwxfvgk=;
 b=zfsHrldamADV1lbxzbx1l0ugp/YH8W3JIjELL54neC2GhzDKktfhbdEZqxOSUJHRJzSzj5lm7
 F6k4idQUqw8DHfGVsT3U/r2iKtTC12BAAIQls9xp5kYoaIweMznNub4
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
Date: Fri, 13 Jun 2025 17:50:27 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Vv1xAP2n c=1 sm=1 tr=0 ts=684c64ff a=/sUT9SOQbq9tkq2xjVjq6Q==:117 a=/sUT9SOQbq9tkq2xjVjq6Q==:17 a=IkcTkHD0fZMA:10 a=wxLWbCv9AAAA:8 a=DTDndxlCylVmyPESURwA:9 a=QEXdDO2ut3YA:10 a=QJY96suAAestDpCc5Gi9:22
X-CM-Envelope: MS4xfKjy+0cxVUYN+Yx3caG+1LpYjVS3jaMAjB//DQKsmP29fmT3R/k9r4Usk2mf3yNAnvf1EtgNZcEo2IIl8tsJpxwUMn+F9FqnHTbJ3Y0gaUOKq+6qOdVW gHGoDJ5lE8gw+ClBfFLSyuwM5xxm9M2vw2cMfgMv6AQsHtiG81Xcb9mES96KedLp+s8FohrXwFKq57+VPIYH35rhfITAP9j2zMu82RZ8QDLEqjLnLgxTwlMD lkuLquLRJYs0mq5lr+a1jj0FRhiigYSZzrQc7dYtjZlL1ahbaDCf5fl7hZL/SDHc1pcOqAvOVseqmpMqhTTJrU4V4qxdY9V1+nU9qYPYkuJCWndxwCtyTTGB JQ6a1/JhE9fCOsGeM3eLsdf43O+bctdNIQr2L5RWthZEu5fHqsbpYxRMHUPoUsQg1LfxxY+ekgprLAuMdDgoJPsgOvrpGLA8yhgbGfI1FQlMYNsmjk94M83t BtpvfT0ckEomFcV8arEOPhmxBPPRVEWf/PkMV1PfGjEwwoMFPwfThKig8kM=
X-AuthUser: linux@smankusors.com

Not all devices use gsbi1 and gsbi5, so these nodes should be disabled
in the SoC dtsi, following the existing pattern used for gsbi3. The
upstream samsung-expressatt and msm8960-cdp devices already have status
"okay" for these nodes, so this change should not break existing
functionality.

This eliminates the following error messages when gsbi nodes are not
configured in the board's device tree:
[    1.109723] gsbi 16000000.gsbi: missing mode configuration
[    1.109797] gsbi 16000000.gsbi: probe with driver gsbi failed with error -22

(Note: Xperia SP doesn't use gsbi5)

Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 66071ad498e49c4f54ba105fa94640575fe08da6..84d4d1bffa9f73b5e395e4290b8dc856e0966e9b 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -321,6 +321,7 @@ gsbi5: gsbi@16400000 {
 			ranges;
 
 			syscon-tcsr = <&tcsr>;
+			status = "disabled";
 
 			gsbi5_serial: serial@16440000 {
 				compatible = "qcom,msm-uartdm-v1.3", "qcom,msm-uartdm";
@@ -440,6 +441,7 @@ gsbi1: gsbi@16000000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
+			status = "disabled";
 
 			gsbi1_spi: spi@16080000 {
 				compatible = "qcom,spi-qup-v1.1.1";

-- 
2.34.1


