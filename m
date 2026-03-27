Return-Path: <linux-arm-msm+bounces-100453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGTjI9LmxmnrPwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:21:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4B534ADD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 21:21:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B6F4A308B734
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDEB398911;
	Fri, 27 Mar 2026 20:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="sSptJLDs";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="OVJUCQ0b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9539B393DE2;
	Fri, 27 Mar 2026 20:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642323; cv=none; b=pn3NktgZa0gR4DhMMN/cOz2ID19GrOs6AfunumjJiJCY3OfwtwDg1kaPn6Nh5TOWxBEMdKxFKinM2o6vIxiit4WViD/WpUW2mVG2RGgQh7AhYD7Ekz0Ikle83d8/XRB12+K5CxfLcq13z33kOog03+Fn5IxKWn5ufm0G1N8AfFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642323; c=relaxed/simple;
	bh=wp85Izuvgs1/BBpNSpDNM8HQ3t2NnPm3AnGl4AKRDXI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aUZeqXWl1aBavMiO97lwNfh7w0pLi83cK43AyXRJInPr0J6o+xvz3ARABYTH8hy6t3uhzznziWXBilKUvpUKk6VtNKC5wibUQBQD0LgVr80LTHQF00WJpo/CCGOFeexl0xGkFghjcKRKS0j13m7YLpmpxn/sH908hkGUBiCJksA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=sSptJLDs; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=OVJUCQ0b; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1774642307; bh=4h88egP+wMClL/kBIddRbIy
	9tren44YmNHTekhaFBm4=; b=sSptJLDsW51cArja/uh7/OxtiLyBaM3kqaJ98LIm6xiGdkv3nS
	BbzVyWBPh6q5E4UgMtLBPMU5s79VqnkfBb9basevPnvKmCaz22nFAnLWInlIcfX1/mgL+xkxbsI
	VIGI7eQBG6mbv5Vcxv3IRHuptSKbD1XjE05hnCLTJld4gCuF03wC/Gz8iwLL1+xriWFQnfIO2RH
	3JBEmNu9L1Qw5ZAXDoWwuc1rBJN8V4wyzrH0j5pf+H+Q4rKu+v55676AVwXAfVImiUngdp61mTV
	+9Jz83r1rPovEdfS8ZDsVIaiHiUObx1Nz9zijx8noTrlX89XYfg8H/ii/oyg8BmJ2cA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1774642307; bh=4h88egP+wMClL/kBIddRbIy
	9tren44YmNHTekhaFBm4=; b=OVJUCQ0bw33Rx7lncuCQ09eKdD7EGl1z1mjJk7xZEWCNYVCnBU
	BcJEkOkt18YZOpYlCJLomQZihM5mpRPx0FBA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/7] MSM8953/SDM632 rpmpd/mss fixes
Date: Fri, 27 Mar 2026 21:11:42 +0100
Message-Id: <20260327-sdm632-rpmpd-v1-0-6098dc997d66@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0NL3eKUXDNjI92igtyCFN1kg1Tj1CRTE4s0UwsloJaCotS0zAqwcdG
 xtbUAZLisIF4AAAA=
X-Change-ID: 20260319-sdm632-rpmpd-c0e3eb548f58
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Stephan Gerhold <stephan@gerhold.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774642307; l=1659;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=wp85Izuvgs1/BBpNSpDNM8HQ3t2NnPm3AnGl4AKRDXI=;
 b=iXfKb+Fuw9GT7dLNVUFNY64r0T24USPXZFdxR7up9Lz7xRh1RhGAxXbQBuXJ0j6pgICD+ellm
 +8RIC4Wv0N1C8eiv/JJ/4ku2vJocrAekH4HrZSZYUdXzidNGY0ak3C1
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Spamd-Result: default: False [0.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MIXED_CHARSET(1.25)[subject];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100453-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EC4B534ADD6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SDM632 pm domains are different from MSM8953 because MSM8953
is defining pm8953_s1 as regulator but SDM632 is defining it
as pm domain.

This patch series correcting the pm domains defined in rpmpd
driver and splitting the MSS resources for the both SoC to match
the reality.

These changes was discussed in a previous threads:
https://lore.kernel.org/all/2b057aa5-4416-4fd4-aeab-6bc23acbb53d@oss.qualcomm.com/

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (7):
      dt-bindings: power: qcom-rpmpd: Split MSM8953 and SDM632
      pmdomain: qcom: rpmpd: Split SDM632 pm domains from MSM8953
      remoteproc: qcom_q6v5_mss: Use mss as regulator for MSM8953
      arm64: dts: qcom: msm8953: fix modem pm domains
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add SDM632
      remoteproc: qcom_q6v5_mss: Add SDM632 MSS
      arm64: dts: qcom: sdm632: Correct power domains

 .../devicetree/bindings/power/qcom,rpmpd.yaml      |  1 +
 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  9 ++--
 arch/arm64/boot/dts/qcom/msm8953.dtsi              |  5 +-
 arch/arm64/boot/dts/qcom/sdm632.dtsi               | 31 ++++++++++++
 drivers/pmdomain/qcom/rpmpd.c                      | 39 ++++++++-------
 drivers/remoteproc/qcom_q6v5_mss.c                 | 56 ++++++++++++++++++++--
 include/dt-bindings/power/qcom-rpmpd.h             | 20 +++++---
 7 files changed, 127 insertions(+), 34 deletions(-)
---
base-commit: 8e42d2514a7e8eb8d740d0ba82339dd6c0b6463f
change-id: 20260319-sdm632-rpmpd-c0e3eb548f58

Best regards,
--  
Barnabás Czémán <barnabas.czeman@mainlining.org>


