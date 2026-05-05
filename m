Return-Path: <linux-arm-msm+bounces-106012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBJKDMVQ+mnyMQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106012-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:19:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A19744D3961
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC60E3080474
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7BF3CBE89;
	Tue,  5 May 2026 20:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="Lp+cmz2a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D312C2264A9
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 20:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011805; cv=none; b=YSu0f974Vv/BPS93RPYsTACjpQ1uPiV7TbSbXDMRF3bNx1qFLwAsvxTq+1o9fQSAEGswyRdtSyVDWKTpdFY38TeRK2ZhdHq8aS5P4F9iAQfcIEw+tVEoUGD+Fi+manYa3zidoR+VrroYl2KQzfNyjYXCo1848+iZMgFCZImLXOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011805; c=relaxed/simple;
	bh=qgli1bjVuf7GXloYvSqY8vuAmlkuWrDFwY+V+BYkcg8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kvn53yUORhvfPIMWV9b5doc/YF12GPnXmIaFvje/UU/dFDFr2s5YnltcFiWA83Ns3am8m3YH+ktGfgayOkVcN7WaAu6+R7wwfzbCs9apd0b87e8aTjquyIjoYiey29iJELJMVA0OKO8eFY3L95rAcnHoGXb6hIUIdb1pYe2U8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=Lp+cmz2a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso69274165e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011802; x=1778616602; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GZ9fQnRt00TekxovwoSAoZ+jmlPGuMt3XEpbArETLcw=;
        b=Lp+cmz2amZZ7MpehAJ6ijiZ3TqmRdI01cHr4gWnTapg4sujD+H8JKqMXJ09asNlySY
         IHdZzIabz2EGgYGS/Ju1cy0iG7YasDjYxJJ79PlKTJsSIcJOky0yTfALbFTsceNzW83F
         ORpnyJXNyZCAp6bOkEUK6Pdo1xDAtGQAHbCPeJWJvIkmFAtwzmDTgNxmMZW5upSslqRE
         2Kb+PXc7tEezMZZrH8pMsIBLHaJSBjNSIhkq/dVFEWxmyrCrtgMPSvgsGyGhaP3PwSCH
         6T7i3XPKMMgbqY/CLl9P3jiJnZbf5KFMxW7FLboo/lBisXVxhZPtysiTOX5GL6fLxLlC
         Twdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011802; x=1778616602;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZ9fQnRt00TekxovwoSAoZ+jmlPGuMt3XEpbArETLcw=;
        b=VZ4nUhfYzGBwuZRFQqU94fs5pUnkL3a0IhSwwbHMZsdyJzAKyQ8mOqhQMBJb65cGEL
         D2eT4+XZIkxkqRNuJCy1FTzpEtyBLFz9WJsgS1oj6t9o1biL6XGsSxJqsBKPXxWaIF49
         fJ0jDVqcX2Qd5yf1K0lGtoFMe6D5QGGt0H/FJw1D90exjL8BZUDBsDFdN+aWhECJFkJc
         PEmeXCduXgbEEQZ88oDD1uUHhLniwoFuLshByk6BtN+RJZr+ZnqaU7OlLKrp1KSfzXs8
         iznP/bv4hxklxWSLGtR4i4VxLIhK41N7ccy167IEfkjMttDikXRm1/ACY1OWKA4TshZB
         4icQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nM2qqaNWAEcLmEn67zmINTFDEUi1d6AtIPdj9cQHcDLue5tas9hNuP/C13wsIvd+qD+3DPeW+IFqio1OP@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAQwyTNghWrgYu7nWKWitVVugkqQtrnkl5kMu+wqVIZEZ8H8k
	4jnX26M+yIev6GvYIpbG9yPZDbBlHrGkUwVTpUmmUQllbgz9Z0R8q0pb3r7embipJa0=
X-Gm-Gg: AeBDieuKoZ8IeWIHVI9yVxMs+W/jYR9NeB8nE0VI6DDWZRA+YJ7wLkEV8i5YCQ4Ns0/
	7P8iC3DK43npoPKQqCnCwkLrgp+SksCzQbKCc/4k2QSM/U+vF7v0R08oWFZfh+t6SR7fEknDP2H
	d9AV9laXnRBwGP6v0Or3GTYx8o+VIY7aAMcKTbNYOjXMiQzT6Chal9Y6uIkiK8plbNM/PGzSsP8
	VcY8vbxzv9Yu8Cm/5awa8ndywsh8DeAU2vgXQOOlPkQsMsVP8w3lEbjeyrR4PjdCbuF3th+oFdp
	2ZmyUr5eUUryQcPlKRrW5DG2WvNAHWfUCwwvNG5EyX/L6RflxuKpomhzzNlDvfsc8lKR/Qw0bJH
	oPQlVi+nXZuIS5gtyikcdY8nRSK+WjThfyMhSXOfcastvdvk2oQhhZzItek8sm66KF+W9ZlmTFg
	4VJuuD7IslUTkjYEpYiVWyysiehbJpKvZ0vai9c4RwU21Zfmqh+hmjdbgR0DAP2IIJSOuOhH3x7
	eRHt5tJbq6/nuGaTLbpB75kB81TQSIHfHc=
X-Received: by 2002:a05:600c:4f51:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48e51f3054cmr12700415e9.18.1778011802176;
        Tue, 05 May 2026 13:10:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:01 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v2 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Tue, 05 May 2026 21:09:50 +0100
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI5O+mkC/4WNQQ6CMBBFr0Jm7ZhSWiCuvIdh0U4HmQUgLSEaw
 t2tXMDl+/n//R0SR+EEt2KHyJskmacM+lIADW56MkrIDFrpWplKoYxhxYVSa63C5AljT2i4Id9
 7ciG0kKevyL28T+2jyzxIWuf4OV+28pf+EW4lKjRB+7puLDtX3XMNV6YrzSN0x3F8ARCW9p26A
 AAA
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: A19744D3961
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	TAGGED_FROM(0.00)[bounces-106012-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[100.90.174.1:server fail,2a00:23c6:2736:8e01:fc8c:f883:9efa:3625:server fail,2600:3c0a:e001:db::12fc:5321:server fail,209.85.128.44:server fail];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url]

This patch series adds DT support for the IMD Technologies Ltd
(IMDT) QCS8550 SBC and corresponding SoM.
The SBC DTS supports the following hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board
  PCIe switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- SBC regulators (carrier-board fixed and GPIO regulators)
- M.2 Key-E (PCIE0)
The SoM DTSI supports the following hardware:
- PM8550 PMICs (similar to the SM8550-HDK)
- QCS8550 and UFS

The IMDT QCS8550 SBC hardware is capable of the following but
support is not included in this patch series:
- USB3 flip detection
- 8 MIPI CSI2 cameras are supported using 8 IAS connectors
- MIPI DSI Displays via a DSI/I2C connector
- Microphone input
- Speaker output
- Fan control
- RS232
- M.2 Key-B (also on PCIE1, selected by toggling the on-board PCIe
  switch away from the LAN7430 upstream port)
- Wi-Fi and Bluetooth via SDHC4 using an NXP-IW416 (SDHC4 patch [1]
  is awaiting review)

The DTS files were written using the SM8550-HDK as an initial
starting point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing
the device trees against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM DTSI
Patch 4 adds the SBC DTS

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v2:
- Patch 1 relocated to be above qcs8550-aim300-aiot instead of below
- Split the SoM and SBC DT changes into two patches, with patch
  3 adding the SoM DTSI and patch 4 adding the SBC DTS.
- Dropped the SDHC4 node in patch 4 to focus on the core
  SoM and SBC device trees. 
  This allows the primary hardware support to progress through 
  review while waiting for feedback for [1].
- Link to v1: https://patch.msgid.link/20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
William Bright (4):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: qcom: Document IMDT QCS8550 SBC and SoM
      arm64: dts: qcom: Add IMDT QCS8550 SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 827 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 ++++++++
 5 files changed, 1156 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>


