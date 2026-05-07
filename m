Return-Path: <linux-arm-msm+bounces-106305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OboIylS/GlOOAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F09CF4E51FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 07 May 2026 10:49:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D4D53084D22
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 May 2026 08:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA1C8373C00;
	Thu,  7 May 2026 08:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="aKYlTPHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A7C3644A2
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 May 2026 08:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778143021; cv=none; b=VATeYzdNqT6GBkgC40PeAkTzhrbuVKrtk3DVtPESgVcD4y5a3s2NMCQoy8VZNSgVgRW82Lk4wwS9zmb3JtzWlVouNeeXNW5hvcP2fYTGAOmUE9xiSNOkPQl91k1LeSMXpNx/5Eow19ISTWd9gEfG2FPrrZ8usKPGiPpK8+wSKaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778143021; c=relaxed/simple;
	bh=wYjkaztJPkkAcQ0jT9PCsm2QXXlGEWa08QwMutUw3RY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dhdIpO9ByzTx+dzgKjUDP0Beddw8CiV/QdfXbmI2HVlrtxjaziSoxGqrlgxZAALXlVaAlMkig4BOYFQrmkPm3+dCx+WV1NPKyQ28xWn0DOfzW5N2CBb/tcgSc5kA8QXnb4O+YppdnH7VNexTiNeKjOWxWzDmqpvtloQFZ2m4FTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=aKYlTPHb; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso4870915e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 May 2026 01:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778143013; x=1778747813; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rzmPPnLiUq2BrCsYjq94RBYPrJIGWFqYE7ZaauY/i/Q=;
        b=aKYlTPHb4pdAxph21NdmsPQOREuiJYqbeZDr3U4DB2PI6dirbztoR8am80Bhzjxd4i
         G/XfC8I8NYI387bJo9SshrbqPVUaMgW4YXi+65acGhQddwAq0kArnfVQEfcYiFDondg5
         wsqRAtaE6qpoVjGS7dg3zYs8cihzNPKqZT491h+drwJkYfCgsN+dtVk1iME78MUnT6m6
         SK9gqtUOUJU+phThrwONYz5P+MnJ/81jX6IBGIMpS3rP68gxI4PXeGcRB6ipnHmmMOrT
         WMV+Z/cpiHNRSizgRgSvxAP4HJy/GJed3LHHfGCcpqLYYm2H6Kab0sQuUES/kWjx0hMa
         6e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778143013; x=1778747813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzmPPnLiUq2BrCsYjq94RBYPrJIGWFqYE7ZaauY/i/Q=;
        b=ajcOIJq4DnkUOQ5+VbpbIwV4c7veKEWu+JhMi1lHztmxXlSBUoDrPhG9FQ6Wi4ZP6o
         6DRGYGBayWDycPeW1BSQKsFzKPfcTbXP/nvOyk020w6A6ncboPJH6fmVJsRQS+camTVh
         dca8gMu/2wMJg32hmoFqHjds4cJijGEQ9GmPLTrW/BWskQ8WXMC6cn+7P8fS8sMUvNGR
         DYtIT1ieaS+Q3X73D9NN7zMXTlrrfoozb6okakjnBIDkuy2LfTSrcAYkZiGeZBucFPGV
         WEc3MJmwmi480msCSeH8nn2r8thEyEFEqFDIve+i2XAcP0eNuZYpQ2yJReOAng0lLsVS
         vE0A==
X-Forwarded-Encrypted: i=1; AFNElJ9eTdaG/KFmMOOvNmpU+Aoa3xsDsjUAOzAjaXyyeNYflCkg1UPa305iPH1vLXg01Cn6QMPnxAqN9TSSGAqH@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk0JwQSGArv5QBPc7ylDVuwA0llUNiKqwvm5hdjpQfFTFkFd6G
	h8rNzUOnGi+zQdsNzexkZ6r4tm5cq4K3iFiToFZcGSN4PaNf4Ftrdq9E1dmzT5hXSrg=
X-Gm-Gg: AeBDietI8qVbHDFZMCGlBf3ZLY4bGqww5Zt4vHoTwVHaXsxWU25MwiZG1laz14+iyaX
	892p0L+WoaWimE8SAgHKJzW9tMCDIpS6KJFy4h0sf3ALFR3adVfuSfVTOISmRTMg/UK8+LTFTEM
	vXC+6h1lSfnAiD0ld6QgmYR3A6W56OvtLyWcXIPK+dqeKKGKae7Chh9EjQq7BslNj2FsDwXcuXw
	8FaxXrVXSmqvE4KHhO7//+2MUTXoHVj4rQTxNSJlHZhrHnLzeePhSLZJOJzbfn5//SmSiFE+D0v
	IneNAqsbw7OWi0CS38cd4+lAZzx1rbjVHGbrDadaH83rgvqUcoz6ulVfjlmX9dHYBOEbBd3ZKBN
	BWNOIx9tUaaa+KQL8vN57vIkg0yptdFCCadZYjhpGnJri+8cKtkEiQ+3sKoeCaxROZuZtsV1h64
	RzUFaMQVWJkuaTnwssBKIAxhczPDI5ZnBpStk17vAaeiGMJ5DHCV42/a2bkQj/lx+aqCRsMaCJY
	UDBOqAYgaf5eXsPFxd3g14ZzVzoSCV+/cg=
X-Received: by 2002:a05:600c:a30b:b0:489:1c1f:35f9 with SMTP id 5b1f17b1804b1-48e51e1773bmr83934275e9.9.1778143013299;
        Thu, 07 May 2026 01:36:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:cfa9:e812:def6:e9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5313a158sm35602705e9.24.2026.05.07.01.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 01:36:52 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v3 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Thu, 07 May 2026 09:36:39 +0100
Message-Id: <20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABdP/GkC/4XNvQ6CMBDA8VchnT1TSj+Ik+9hHNq7Ih0AbUmjI
 by7hcU4GMf/5e53C0s+Bp/YqVpY9DmkMI0lmkPFsLfjzUOg0kxwoblsOISBZnhgapXikBxC7BC
 kN+g6h5aoZeX0Hn0Xnjt7uZbuQ5qn+Nq/5Hqb/gFzDRwkCae1Ud7a5lzWYPZ4xGlgG5nFh1Fc/
 WBEYZw02hAnkqL+ZtZ1fQNbE1kLAQEAAA==
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: F09CF4E51FA
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106305-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,msgid.link:url,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:dkim]
X-Rspamd-Action: no action

This patch series adds DT support for the IMD Technologies Ltd (IMDT)
QCS8550 SBC and corresponding SoM. The SBC DTS supports the following
hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board PCIe
  switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- Regulators
- M.2 Key-E (PCIE0) The SoM DTSI supports the following hardware:
- PM8550 PMICs (similar to the SM8550-HDK)
- QCS8550 and UFS

The IMDT QCS8550 SBC hardware is capable of the following but support is
not included in this patch series:
- USB3 flip detection
- 8 MIPI CSI2 cameras are supported using 8 IAS connectors
- MIPI DSI Displays via a DSI/I2C connector
- Microphone input
- Speaker output
- Fan control
- RS232
- M.2 Key-B (also on PCIE1, selected by toggling the on-board PCIe
  switch away from the LAN7430 upstream port)
- Wi-Fi and Bluetooth via SDHC4/UART14 using an NXP-IW416 (SDHC4 patch
  [1] is awaiting review)

The DTS files were written using the SM8550-HDK as an initial starting
point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing the device trees
against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM DTSI
Patch 4 adds the SBC DTS

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
Changes in v3:
- Dropped backlight node since it's unused. 
- Dropped regulators which are dead (no usage or not gpio controllable
  whilst also not strictly required by a DT node). 
- Dropped SBC modem remoteproc entry since the modem is fused off on the
  qcs8550.
- Reformatted commit bodies and DTS comments.
- Replaced open-drain properties with bias-disable due to open-drain not
  being supported by the tlmm.
- Dropped tlmm entries which are unused.
- Dropped disabling of LPASS codecs as it was unnecessary.
- Dropped bluetooth usage on uart14 and removed references to uart14
  since it became unused.
- Patch 2 renamed to "dt-bindings: arm: qcom: Add IMDT QCS8550 SBC/SoM"
- Patch 2 commit body shortened as it had information already found
  within the patch 3 body.
- Link to v2: https://patch.msgid.link/20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com

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
      dt-bindings: arm: qcom: Document IMDT QCS8550 SBC/SoM
      arm64: dts: qcom: Add IMDT QCS8550 SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 392 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 +++++++++++++++++
 5 files changed, 721 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>


