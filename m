Return-Path: <linux-arm-msm+bounces-112370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y+N1JUorKWqhRwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E0162667B9E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:15:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=LLvXReHY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112370-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112370-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E5879304457A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 275D03AFCFE;
	Wed, 10 Jun 2026 08:57:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F29381B1A
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081872; cv=none; b=P979nlyp5tu1TFvZjrHokD/+9s4PMf4ijWqmfv7vVHwsJxQe3Tl6avT4hvTuwiGZOvaRH6HAleyzXrDO9tnzGqLALY91O5hJOeDngT2f4GTSOv/iLGUMkBkBaU8jCnmzmcOn3WAwVQ1FfEppl9RSkqB6yosq3hYv4kzyjQNLuh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081872; c=relaxed/simple;
	bh=xnjqgJXyoGJWYozez/m84uJbEX14HWPu6Q8EGhsKd1Q=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=trPYszNRindJXq0jwGjoOBwSL/CgxGi5ljA/0OejYSoNFCwmMsf/2Nqmw7sHs8rNjAt7RaAIqd826ubs6UAc62X2OGJISqAATe3WobyR1kmdVQcAhCs/u+1ssLMr8UrzotDeDpDi6nhVPEXeDClqWHbUOgrbYDpRY7WeLePHvXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=LLvXReHY; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490ac10e337so54703935e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081869; x=1781686669; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RGxADFJpFtsaw/tpNTJBftbgVulNnvat2Rp1ypoxt4Q=;
        b=LLvXReHYs8reLeturs8OrpJU7beEUCGVI7dgyLy7c3QFOMKEbISVtMf1rsp21ylF5w
         TkGztNtrsSNu0CJVoYv2i24JjpFFNB8QdbmsyBT1IjF4ZQAIuPGb6d0ucMTjewiWaOG7
         e0umDm8kFHh0tTzhvUVMVt/1xH9atrJyW1PfWOGIeiOQwTGHRTQpro3kWxo9xQUXZ4la
         IVX9cc3AlMGBOm+s9pwjqkA375kf9NaaIX9VjbIUdakwnxnpXxNK+jhpaxOT6Bpsk70N
         SYFgFRIklPhuWhiLX99DinGDM4PTJwTe++Nrreo4BKGVqBNiuX18Ame127wiioY899K8
         XUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081869; x=1781686669;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RGxADFJpFtsaw/tpNTJBftbgVulNnvat2Rp1ypoxt4Q=;
        b=pZJo3otdzHUlSaMGzmQ+NQ/BrCOcYPFR9x0lHV4T3UDtYus99fkQieTriNO232gQ4/
         6QY544/kugu/m3VEDdZfBLwAijd9THbAQG3HILS0jzgM+1Aguar0BGh4hFiFPtdpBqXs
         VMzVeRylO33WVEU5IghgDHLfZTSIdR7Qq0tmeHz+pUDTFt0J2GzZQBK/SktirF1zQb3Q
         1zSEdilUjk0CwAaHPPfcAN91paxSkRgW0wfLpqIEw9TX9KJsDQV8gSZo+eLoBtSP1Sgf
         vcfVgwA62Xp28khETjdj6EyIefPRZOzbmwkD8EcTsXlnEP1TQFXTc5jDmGozm/2XMaqy
         maMQ==
X-Forwarded-Encrypted: i=1; AFNElJ+o5gGNx0ayttJ6q15we87txBt8ST6MnKwqOSnFVJJuhbNhEUme1jGUcuZdelc8/2bkFn9eI2B7rmgnHsEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+QGBPmvx+Qh0iVbgwojT0CtKMk8FnVfwto3CGOic0MHZmvUaj
	VOFKk6qx7xEd++TSHD4BMA3KjwyDBOcirE80e0rIygqT9FPntpT3hHItiPjwSKfxn5E=
X-Gm-Gg: Acq92OG9wRK/G1QtYeiKhg6D8Dqd0BeEu1xtkblV+AF6j6x/VHndiqS1PsAxZ2I9kUT
	gLBwdnXkWKZj+6xMk3uiBfF3Nyu9be5RkKFEWhuoJCDmxN8PWiGfYomdr7cVSTQxlzHql3z8FES
	Rh3IwfKnQgSgaY4j3Lw/CVGU3uqCqXAiCAviAcbr02wKfYzntmQSR1606Bt2qdXnZ6ezgoXR67y
	rUbOVlaT81KuEUFWX9QehkN8Ave/RZSOfhHFqvpd3aUPZEDr3Uhj19FbqiJLy3I70YPF+SgtIDc
	lfsztkfJjrCyssoJCfGJxmQP7EDBvCuYVvIYg9Mj8/6ewbINemy3Kbpd6LZw+nti1IwAB+8ZGHf
	1zTYqGu8uqbVCUMZdiE5Dd/zxCfacnsgB7pzmogqi80OViUeCNJy78tVZ3XdBxF8gnWPmfjvKEP
	cbbMKTZFrHNdx92dghcEV41qzcwWQdxpTvZQdsYnFr1NCpb4EmurCBJwcXgxQ53G3cjdicCI/2g
	tywXS2K1w85RxsS3ZQuvOeGy476iEwglQ==
X-Received: by 2002:a05:600d:644a:20b0:490:c6c2:bdc2 with SMTP id 5b1f17b1804b1-490c6c2bdf6mr198982075e9.4.1781081868535;
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:48 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH v4 0/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Wed, 10 Jun 2026 09:57:44 +0100
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAgnKWoC/4XOTQ6CMBAF4KuYrh1T+ktceQ/jou0U6QLQljQaw
 t0tbDQa4vJNZr55E0k+Bp/IcTeR6HNIYehLEPsdca3prx4ClkwYZYoKTiF0OMLdpVpKCsk6iI0
 D4bWzjXUGsSbl9BZ9Ex4re76U3IY0DvG5fsnVMv0D5gooCGRWKS29MfxU1mD07uCGjixkZm9GU
 rnBsMJYoZVGiihY9cvwT0ZvMHxpo5Ej55pZ/tVmnucXR9sFbUgBAAA=
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112370-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:william.bright@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:dkim,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E0162667B9E

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
Changes in v4:
- No code changes.
- Collected Rob's Acked-by tags on patches 1 and 2.
- Resubmitting due to inactivity on v3.
- Link to v3: https://patch.msgid.link/20260507-imdt-qcs8550-sbc-rfc-v3-0-47d3d3372b33@imd-tec.com

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
base-commit: 8a4062d204752e0d66a1e7e1a2f8834571a8d40f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>


