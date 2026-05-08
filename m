Return-Path: <linux-arm-msm+bounces-106682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGZlKNHc/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:53:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A967B4F6951
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 93B933018351
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143F83E1231;
	Fri,  8 May 2026 12:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="suMoSycb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A833DCDB0
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244809; cv=none; b=M1wMl5EZFCJMmqOtPjCQ5HlyS2XGRbpT/IpE87K1oRrfYLUVoVSj3o02uQ3awUTPaRpudEc8GpJDh6fL3vOyP2cuUusPnx+aCCN8Ychc2sZ/UVPA5TwmI7d6l8eMbqE5Sp9TEwMopr1gteiJOrgsoBLCiVeNSnV4dxdVrD4m6TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244809; c=relaxed/simple;
	bh=UyNlqKMM6jxuugzSOHKtl7TjL/HTQpOU8FeQj+AFrv0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YjOAOXCszchDxcHgr24vZWT886PcQcntBOCIpQfWINcsGyHvrym8ZU2rsYoVHDytUxGRqt1v2uSsuG/9nZXbJlJnqK2UG+DAh0dU5dwS+hkPBslEhohJOFlIN2/cJ74Nf2uVJ9OH4bpOl94l4khmD0oAN4BORWzWthwR4CpQrMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=suMoSycb; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ba699316b42so329102066b.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244805; x=1778849605; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JHwS4Uc0l7hheA9OAcjg4DeynZW3gYZgbq5AyYeqW7k=;
        b=suMoSycbVVLo4wrV480BSj+9/LTIilQRcqZYOdJfGJJ7oTQIbrvJ+NSmgSEX/j219H
         1W+UrS2FM+Z86zf6ECO9InnIKmS4eHMAhSCYUfhFztsWAwS03agZjO9oeArJfwgflrCI
         33V2mnBbeSHOEnAVL0U8PyO0l7OKylwoNSrBowUS0SYYFYJkIR0YyItzZkQvz9Z/o3pt
         480DMRvrf87gavzYRIo4z2k5p7WzOFzlhQwjA7acmo6JNAY9MxsswaRVtg6GUHcQPxD+
         xPEFNYWlFFiEvi2nI4e0m7De/LiRPwVd+9yRFUo2EXdb/613Fs+T+Zq//rM+c6p/lqEL
         MQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244805; x=1778849605;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHwS4Uc0l7hheA9OAcjg4DeynZW3gYZgbq5AyYeqW7k=;
        b=YjhiI7LCJ6GP6p4IEWZlOt1W+mYFU8bLCgRi6G5NlTUca9Ua7Bnmk8GiVQ40b4EtU2
         dMK7G2n3s4cfbAAuANEBrp2KSa/l1WU7xyfMYZTqAfuM3mMxfLFQ/TsYVz3QnHlYE9ac
         wZinRf0yiB7BGkuqG8sgLwm9e4AFneNnKxVcy/hYTmv8HfCoWUujeRnZjURg4uA0X+fX
         t6kF9Yzf/DGqTkdwkCI/H2nj9CmbZpAgJxBe0L6aUUxZLchGF9ckEiylNm/FMIGceiMG
         8R+nkvTQUSHUEDc0J4pJdIDPsZVd3yHxo7WZ1vKKX+nCHk1/3u/csqxcqq8eyzfzlH3n
         FR3w==
X-Forwarded-Encrypted: i=1; AFNElJ/VegxeZTEJve3zKQYd3KS9vPUMTmN8pY3W5sLxKbJ0XYfgTWv8cpShMzDQX8Zn0OsqidqXL6BaIsg8FZry@vger.kernel.org
X-Gm-Message-State: AOJu0YxTv440TK4qDALhJs3RG7iaftgSVoPbIhqvvLSO58jY07Qe7NWN
	p4uoacuajP/NzY//rEhTO3BELYu2VHoGBndIZ7nzNfE1WqeXI5e5qFIcEEr9lClER5E=
X-Gm-Gg: AeBDievTxgkf9ez3lALVA9shEqvolGu/5bEM+/WRLAJh0Ah89nTt0eHhmzrqTHgeNN3
	sCMq7F2hCYtpfVJClf76206PbJeuVwShBNiNACdmRzPaE+J7/SRXFAdRKdkJAZNf5NXzDUCQ3gW
	otz1/dj0gsm/YQBlsbhYTA80oFspbZQfTSWAqAHvGF0dNkWYiA6n6YNeScR1qff4hjDPB1GBSJ9
	BX/pTWStgbgu3gV4n67mw5ZocyIYgtRNvVNZahHlwdf9Kyn50Vd6xC3oPngQDTTSfBoCgqXlVwR
	UPzPOUcP74LDw40A8V6HFaNqhO5pnlmXri4pwQSS5BHb8qOffh+FsQzJkGczxYbM5kiF3R5Px9y
	Ni1Qxl/hLipJG8RZRAtLS2KFLd8l3IdhsjwSjdWiauWwE/pJ7x+04RRAifJ3GOHth5rVxCbwmHt
	5sSLNlGvCXsFzIVbImk51+I6mtQf8L9DdOa4A4rTdepAWwwvdVtSVvw9dkP0LC3JN4ITwFL6Cim
	UZuijAbDIOJeqRZyIr0
X-Received: by 2002:a17:906:7305:b0:ba6:1412:9326 with SMTP id a640c23a62f3a-bc56cc26af1mr735858866b.19.1778244805154;
        Fri, 08 May 2026 05:53:25 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:24 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH RFC 0/4] Add regulator support to gpio-keys
Date: Fri, 08 May 2026 14:53:12 +0200
Message-Id: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALjc/WkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDE0MD3fSCzPzs1Mpi3bKUFN3i0oKCnEpdC1PTFLPkRAtTY5MkJaDOgqL
 UtMwKsKnRSkFuzkqxtbUAxXz4fWoAAAA=
X-Change-ID: 20260410-gpiokeys-vdd-supply-855d6ca8534b
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=1461;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=UyNlqKMM6jxuugzSOHKtl7TjL/HTQpOU8FeQj+AFrv0=;
 b=SdqqAfe52S+/BdIS2Vl3iYr7jgDFH1N/kdT8Q0NQfw/xPPH/GfFgs7FjCMwrvjtA4jJ6DYNzf
 OY6YbQAkQBKCwCIAPk66yencQjLUKS7qlqIa4Ji3PU541vsxmaP2VeW
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Queue-Id: A967B4F6951
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106682-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This patchset adds regulator support to gpio-keys to ensure that the
regulator powering the Hall Effect sensor IC ("flip cover sensor") is on
when the input device is used.

Marked as RFC because we may want to represent a Hall Effect sensor with
a separate compatible + driver, and not use gpio-keys.

There was also a comment around the usage of of_regulator_get() in the
follow thread:
https://lore.kernel.org/all/DI5HOWHCCKKD.1SQFAA3L4QFDI@fairphone.com/

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Griffin Kroah-Hartman (4):
      regulator: add devm_fwnode family of functions
      dt-bindings: input: gpio-keys: Add vdd-supply
      Input: gpio-keys - add regulator to gpio_keys
      arm64: dts: qcom: milos-fairphone-fp6: add supply for Hall Effect sensor

 .../devicetree/bindings/input/gpio-keys.yaml       |  4 ++
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts   |  4 +-
 drivers/input/keyboard/gpio_keys.c                 | 41 ++++++++++++++
 drivers/regulator/devres.c                         | 66 ++++++++++++++++++++++
 include/linux/gpio_keys.h                          |  2 +
 include/linux/regulator/consumer.h                 | 30 ++++++++++
 6 files changed, 144 insertions(+), 3 deletions(-)
---
base-commit: 17c7841d09ee7d33557fd075562d9289b6018c90
change-id: 20260410-gpiokeys-vdd-supply-855d6ca8534b

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>


