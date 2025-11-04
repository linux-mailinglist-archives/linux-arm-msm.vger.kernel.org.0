Return-Path: <linux-arm-msm+bounces-80371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0CC332F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 23:20:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97D0418C56EB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 22:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A3602C3262;
	Tue,  4 Nov 2025 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="Czh85FXx";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="xkaSlfGa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB41A8F84;
	Tue,  4 Nov 2025 22:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762294642; cv=none; b=FukOHWSpQrFCnrYNHUk8rLVm+P5pKgM18TB1ywGt2wCZHNH7EEz2eMXoH858mY8g5rEBOOWt3mk+ebhCAp9LkRZ+jAONmRiTacAjzLKGdObp4e3wejS0lRLTaoMIJtIc4D5horOLD07eORIMgBL1oXY7ex+x9FXwaiosGoS1DIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762294642; c=relaxed/simple;
	bh=hVegu+giAMcZRbj4Mjow0bPIll40JMYgpv3VyUkS4AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XCUWvs+bBGOv7rnrWAyFcnD9moXH6T90Dl+4Kcy8LsDuyMM+0CNAw5O0eVm180bRfTPCOpbWzafRhssp/fAKQWSNoHfBQnyTsjAyIpjbFjpf7Ght8OPgzxfCq+U5dmMjfCbWn9RmzQwkNNG3o0y9eXPJnnerWeROvski7Ku7uBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=Czh85FXx; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=xkaSlfGa; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294636; bh=KxKI+V1ZKxSsAem2SDZqxjD
	62s9DoQ484JTmoOeI844=; b=Czh85FXxOub6e5UQcbyTVtyTLVMYrGqPgJhiRiCsthTmGjDaZY
	X2EpFkcYyBrNthNqKuBKc/muOUvgyBzA2oZ9MgeyjUEx7I72LzPrq0yIGvBCSMgU49KN0QVvRDP
	33j0q7oB0lam9WJZw7i2eJycPJr97hNweJDDTHJrARW87N7XlvuMMXudEZH6OeoFyoR/P3/NYU7
	yj6h2LqOQjbQTsMqNKtNTcvwtclDqLAPWPfe5/Zt/FqH68kvbOit14D2Zdd34fApdCwB0LDQe1P
	WTu6Uuqa2YURlm28QqAG9vunMAgkfVTZDEWeR/j1jcw4tPBJCltPcRU9LaIARR/x5BA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Date:Subject:To:From; t=1762294636; bh=KxKI+V1ZKxSsAem2SDZqxjD
	62s9DoQ484JTmoOeI844=; b=xkaSlfGamD54QhsNCk14+lxrTW0fWe+y8fZO+Ex3O2HcQERVNn
	DwNvwPomqzXKeyN+IzbYsi7q9m+DH8q3fMAg==;
From: Piyush Raj Chouhan <pc1598@mainlining.org>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	tony.luck@intel.com,
	gpiccoli@igalia.com,
	david@ixit.cz,
	Piyush Raj Chouhan <pc1598@mainlining.org>
Subject: [PATCH v2 0/3] Add Xiaomi Redmi K20 Pro (Raphael)
Date: Wed,  5 Nov 2025 03:46:54 +0530
Message-ID: <20251104221657.51580-1-pc1598@mainlining.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This is v2 of the patch that makes several cleanups and minor fixes to
the SM8150 Xiaomi Raphael device tree.

Changes in this version:
 - Updated qcom,vmid to use QCOM_SCM_VMID_MSS_MSA instead of hardcoded 15
 - Added include: <dt-bindings/firmware/qcom,scm.h>
 - Set ECC size to 8 in ramoops region
 - Updated firmware paths to use "Xiaomi" instead of "xiaomi"
 - Adjusted configuration for panel pinctrl
 - Removed redundant LDO8 regulator entry
 - Cleaned up PM8150L LPG LED definitions with proper labels
 - General styling and ordering fixups

Link to v1: https://lore.kernel.org/all/20251022054026.22816-2-pc1598@mainlining.org/

Piyush Raj Chouhan (3):
  dt-bindings: arm: qcom: Add Xiaomi Redmi K20 Pro (Raphael)
  arm64: dts: qcom: sm8150: Move usb-role-switch property to common dtsi
  arm64: dts: qcom: sm8150: Add support for Xiaomi Redmi K20 Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       |   1 -
 .../boot/dts/qcom/sm8150-xiaomi-raphael.dts   | 962 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm8150.dtsi          |   2 +
 5 files changed, 966 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-xiaomi-raphael.dts

-- 
2.51.2


