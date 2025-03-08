Return-Path: <linux-arm-msm+bounces-50664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2941A57735
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 02:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC47516D7D1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 01:31:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C878218AFC;
	Sat,  8 Mar 2025 01:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="b7HQvvF4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423FC610D;
	Sat,  8 Mar 2025 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741397508; cv=none; b=sKpaQfmaA/z/QsDIcSVPPMs4cxEoVGo4P2O8Td4ZcslPdgZxkero+rABlU8XoL8H9r7arET8IZCecZXwk7Vwp02Lb2yUU4zFJwHhYXgpuqG7rlGt6b7s/6nwa/Cdx4nzSw7P8FW42ZTlOLScFh8uYQVZ0HswICmlEmkl4JRicIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741397508; c=relaxed/simple;
	bh=VJJS1ptN8YKIPZbU01I9ApvG9+Qon7SaRJDNMu6lYpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s2+mdQYUrRjeB4uyicCqhpPpHE6Vz50RHEWOFMO4f2JRDX4fGIuLyaeZEj5jA0iKXJ5DAMDweHJn8j3L7Cnvgqibkgb1zPoMEeIghJXIZlp2FMPluQkIosstPzfzNqIp0Xi7ESjBpxjLA2Ra/8mIeW/Gl89VMEwO1ysnEsEcqg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=b7HQvvF4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 2AEA225D3A;
	Sat,  8 Mar 2025 02:31:43 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtyHDnm2r2nc; Sat,  8 Mar 2025 02:31:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741397498; bh=VJJS1ptN8YKIPZbU01I9ApvG9+Qon7SaRJDNMu6lYpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b7HQvvF4dIldo0MxT1y7IKixbHgTMHaB8RGl2tDF5c9E71919Fi4fi5thSQ8gktsW
	 PldghejzQ2BuNX9YU2hEkPI+Pg+L1YvYRe7Gky/mwd4R+6tMaiMBk0H2wWlyHdweYZ
	 SrIyg68i4+lXK+Sf18NySbvbn1Bb/n/E0BphAQdLBstO05fBtioBfiLt1uJ/aXA8pU
	 uWRp8bypuq7glSlaKkX6VDF0lr+2nOjRta2w+XZAXKwsM8fiY1xDEx79g4rOKb6sJU
	 tpX4RtEmu0Tpu/rrbHjL6LXCuXqAtxxFdFGPt3rwjVpKvKxtluBSrCXieb50py7vqA
	 gc6j/7DvFAxjg==
From: Gabriel Gonzales <semfault@disroot.org>
To: 
Cc: Gabriel Gonzales <semfault@disroot.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 0/2] Add Xiaomi Redmi Note 8 support
Date: Sat,  8 Mar 2025 09:30:10 +0800
Message-ID: <20250308013019.10321-1-semfault@disroot.org>
In-Reply-To: <20250304043742.9252-1-semfault@disroot.org>
References: <20250304043742.9252-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset introduces support for the Redmi Note 8 (codenamed ginkgo). This series is a follow-up to v1 (message-id in in-reply-to header) which was sent without a cover letter.

Changes in v2:
- Add missing cover letter
- Fix up commit message for schema

Gabriel Gonzales (2):
  dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8
  arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo.dts    | 294 ++++++++++++++++++
 3 files changed, 296 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts

-- 
2.48.1


