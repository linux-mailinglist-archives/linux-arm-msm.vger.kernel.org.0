Return-Path: <linux-arm-msm+bounces-105403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nf+uC8SV82nD5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:47:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F164A68EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:47:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E0FF5301174B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7A9478868;
	Thu, 30 Apr 2026 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="UXIboP3c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E925B2727FD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571265; cv=none; b=KPVVD49OjNTR1x33aOJsmsV1Ss3wI3bs+GWew0WLyFQm9qyl863MoSgdnCptfVx+YOp8zvJO2qk9gdUvYiCwcsm03/Wpx6MF9JYgQZ+pIVK7QexAAH/EMNt4uaud+xquodPr+CJNTiidmFUSVGO5kOXuKxIw9sSWCrA8bK7vaHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571265; c=relaxed/simple;
	bh=HpS3tu/4Ze7sR9gDX4heP6NH6jx5x3n6hiVs7K4rwHw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EBakCITUr1NR9GcrRsbSorWQ1op2SxIUkotRW3vxxzovTI93QuoTnlb7sULuhrB5Pe6kPmLQAlg4+PE53Ist/JOtcNzQCCv7zItZ6gBfBn0DMV1ljBzA6Ktt8Ov/+/YtcWPEd82kx7FXT8nblTtGR8Q1+saoaT1VvhCkPaLOIGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=UXIboP3c; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so10488765e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777571262; x=1778176062; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0vazd2QkVpnLaBHZCRGcJYbqmcBsD9o0dHNYR3gel8s=;
        b=UXIboP3cIqN10+XWLGMSuhNXi218QAf9gcYmFxW9rooynGYKq5Xk6voBPwQ6VaSKjD
         VkADUmGHs9xJ66FD9JR+dioShjo4moKld5UF4aRy3LclPhA0YS7ZmzU4Ymc1MYRpSd63
         fqWVqJo7wWVCggwIJHCfNN9z+GYYJ94nbudpbcKeEl3tF9p3THYRWxSyWWVcJie2uA+2
         0yIQ6LYYUK7kGe56pNFTEZaYrMW6O2IaKMd8KiQ69GYSK/tkVAxqzZKGjLcNO2aV6C7x
         pWmquL5e/kCx1HxWSWrvyr21EhGtsXkcv6shYBOjzm3pC+tkb9T/oDrAvKgucqT/PdYy
         k3Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571262; x=1778176062;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vazd2QkVpnLaBHZCRGcJYbqmcBsD9o0dHNYR3gel8s=;
        b=Nye/JWvEMXYOs9GdWCU3yI0ZYEh0uDKG4v9uwgO88HU4I6olvQxgn/OsxRsZ2BssUk
         zeDUdlrva51Evc34vl1NNzODJpw3kaQvTM9Vvrc13F6TQZzWU9mol+/d7FqdnrZc6zgr
         lZLFywcQ+bBvOn8naeuz5rtQu2pO58EPsFBgFYG9RsDtNxMDyCBb/f/JnU5A+sBv9PQK
         +UD3DJiVwAaAWm2TWgSOacuH/ttE4MWFcToqEC98zjutdBN/nioWOaIzhQ4vLA59EVXq
         nyqW55ZDlZuBmsrP122jKmHjN7PYMp8LvkW7dI28KU0chcBQ15JhM3iE6Pg1InM0RC/z
         4/sw==
X-Forwarded-Encrypted: i=1; AFNElJ9Nr68C6/f2yqJt2biukkTkAD3YHRNN0bXgSGHoBW+jc3XRDb20GcBuGU+slhSeOQcHlj+t87xmR9j1wmX4@vger.kernel.org
X-Gm-Message-State: AOJu0YyInya+kHLBfwEL7b+WldmreSR5RtS6ipsFA7COng3LlQ6FTmoj
	TDyqeZZozLmjoe8bMeO3PJh3ZWfvSVfTcJysVljvdoG5NEqJEDFmZw6/czTPQ3moeDNXO3URZ/s
	vAVaY3wM=
X-Gm-Gg: AeBDieuVQU5VpP/TSrsB6rOkgYzxZ2RrI6P5+gSkVzBRkuMzcg9/hK2aaUwCc7Mqa4f
	LqqqUxmMVfl2g3ezGl+jUKPy30XQ4LI5wTvPp2mcZnDEYRZhpHGAi5fnfKLh20qcToA6IEuyCGt
	VHczhmnfRQSoQDK73DPrPA8u/x7xJ5r/FNlV2YBtay3o5Gme68QbmiHiYwb74RZhXWKASY3pgW2
	ER/U3nvuRDcFQLs1ceAiDj0i1lrSNSGYC0BkYPXxz/J4lZbVgVhlPyujKkXnjNHJPXU+x06vVUF
	rh2n70/N/b2LLaiPi0quTMvbubNFiimwMsEt1/ijxDWFUlK5MnhfPWRqTCCZ72/RYwobsXwoGRx
	SIVo1l6m8DccTM8+14j5YGiK7C5NANOVorUhwIbBiFKkIAK5gHjjhVV/8bzKbssyebX0xnVb4vA
	H4uFIqQW7sBvWb7rpDk0/e6eDst3u1r5A4rbtrmWqE3xlE0JiVleWLWDSEcs/6AATpNggoucH1Q
	Nq553GBkKJhvEuMllrI3cRopeGVUELcZ72C/ZJaga5XXg==
X-Received: by 2002:a05:600c:5254:b0:489:149a:f9e6 with SMTP id 5b1f17b1804b1-48a844640bdmr67159235e9.28.1777571262495;
        Thu, 30 Apr 2026 10:47:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fd90:2598:5764:5f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm174449435e9.2.2026.04.30.10.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:47:42 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Subject: [PATCH RFC 0/3] arm64: dts: qcom: Add IMDT QCS8550 SBC
Date: Thu, 30 Apr 2026 18:47:00 +0100
Message-Id: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJSV82kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE2MD3czclBLdwuRiC1NTA93ipGTdorRkXZNU8+SktKTkxJQUCyWg1oK
 i1LTMCrCx0UpBbs5KsbW1AAv0UzdrAAAA
X-Change-ID: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 54F164A68EB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105403-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid]

This patch series adds DT support for the IMD Technologies Ltd
(IMDT) QCS8550 SBC and corresponding SoM.
The patch series is RFC due to the open SDHC4 patch [1].
The SBC DTS supports the following hardware on the SBC:
- Gigabit Ethernet (using a Microchip LAN7430 behind the on-board
  PCIe switch on PCIE1)
- USB3 as gadget mode only (No DP alt-mode and flip detection support)
- SD card (SDHC2)
- Wi-Fi and Bluetooth (SDHC4) using an NXP-IW416
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

The DTS files were written using the SM8550-HDK as an initial
starting point with patches ported from downstream [2].

Claude Opus 4.7 was used for formatting and reviewing
the device trees against other QCS/SM8550 boards.

Patch 1 adds the IMDT vendor prefix
Patch 2 adds DT bindings for the SoM and SBC
Patch 3 adds the SoM and SBC DTS files

[1] https://lore.kernel.org/all/20260427-sm8550-sdhc4-support-v2-1-a4241f43ecd5@imd-tec.com
[2] https://github.com/imd-tec/meta-imdt-qcom/tree/kirkstone/patches/msm-kernel-devicetree/files

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
William Bright (3):
      dt-bindings: vendor-prefixes: Add IMDT
      dt-bindings: qcom: Document IMDT QCS8550 SBC and SoM
      arm64: dts: qcom: Add IMDT QCS8550 SBC

 Documentation/devicetree/bindings/arm/qcom.yaml    |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts      | 845 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8550-imdt-som.dtsi     | 319 ++++++++
 5 files changed, 1174 insertions(+)
---
base-commit: 95b3f1f1b54d79bada9cf47420034cfe23df978f
change-id: 20260430-imdt-qcs8550-sbc-rfc-4e7cbfbcadd8

Best regards,
--  
William Bright <william.bright@imd-tec.com>


