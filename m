Return-Path: <linux-arm-msm+bounces-102182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aB4/Ndoe1Wnr0wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102182-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:12:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3903B0B5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 17:12:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6322A302C36F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 15:11:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6336074B;
	Tue,  7 Apr 2026 15:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pLYnKQY4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FE435DA67
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 15:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574687; cv=none; b=EVHsDN9hnt5cBQ2fBqeijQ6jwFIFaCDPmiw3jibA9NAUk/iXRkEQdI0V8moy9yyAA4i/r9hfr0W2heqbAXbXUOa+T7tQPJ5OHf+6n6DtBqMEgsk2t/AJENzR1v+B4VAypEyE5Sfjn+9iHEXQ8H9b8WNp8O39ujQe4N+igRJHIQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574687; c=relaxed/simple;
	bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ezwqatdRsv8G0CzPNb5+FCjpOb1JK3kWE3IVMmQEhQdo8tOwD+/1fglR4lv2T+FU7DGzCmxldD4wJVp7Y7YMeHDIXR3HqZqAX8FW0OU/y7V9LitPws6GP1bhleGuBhcPkH4ykpuYVpC9vuUKmTkIxNWlrGKqZj0dpHYpBX9qgXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pLYnKQY4; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66bb7e098b1so5449328a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 08:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775574683; x=1776179483; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=pLYnKQY4990byypb+jPCD3xWBqcofEyEeYsfxFDO+VURl7LNMqfoEP3PKVm5X7LRh9
         JVZZKccGi0XQpkOOv6BroI2kBRhatjUf8qk2wDIsg5w/6PCQ48OnnNAgr5YyjoC337vo
         mO8ETurkEpUKQUDNyplMSt9U6NL7s8cyfcjZOGubG2a7qCzuhGvKEIJk2C7q16gho9xX
         BZUEw6bNjuRTVZtWuybtIXACoILmnUEwwTBa4X4tinNC2htQEWsMmQPeUeZMHgqBCGGC
         /pRQlySh7XO/9nbiImz/PlYJQ6vXUrhAF7Dj/lcnk9C/fHlH4z06LiMgNeXaSrxZDU59
         c1aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775574683; x=1776179483;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8SJTbEuOYF9evENY//TwKuH5EWpBQYR81rCvHlGJIQ=;
        b=KSS+0H50SyMlvgh0PgQK3FTl+o01Rb5SjJtW+vq9SfbFDGEM8LO7L7VWOFZcwqjW7f
         hmdtSqvQy0F9shdYqeJlpOIw+9QBpMRbCCU9bR0BEnPB2iBMWxB7RfLn1t9uOR8CP88L
         grDsLCCCu/Qmjz76Fx1aCi73uSlZOdjONb+fdOIk/5WMiddTSu7BRTHbI27iiePNV4vt
         /bKV/2PKiKC//L7HBHpzXCbTFaezEdaDkxvzv5p0U/KiSR1jZ7T+rx8bDqaKa0MMmxIa
         thmi04XPgkrPTjg8D+DzVzfJjf04JP4FWjanSYE9AGb4RxJEcxkPb38gJAkmg5yVgiBr
         3c6w==
X-Forwarded-Encrypted: i=1; AJvYcCV5+zhkCPWUM0vut7JFv1RWVCoqNu4dAsCGKEUE2xrnSTmNfeSVO1BvogmEfDqZQYKzpJr8G+v+NeaXLD0h@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7tcjiIS3WpZCQwTDC/hatNoL53s9BZF2MvgjstUwp1xdUHAXD
	m/cPaC+gxofOk71cYzfnwb9kloOxloQZvrIZ8v5JCEjMMv0ufsLytHS/KoP2529Ir3Q=
X-Gm-Gg: AeBDiesQqoLCbmyj/GCJH48bvHmsqln3qZxIm+AB9hBcziHZGA0vloDH2RmPkSctAKo
	aMR7ptNuoUB23j5uf+53EHuePiKCRKXc+gAygIGYysa38wDngKVvoXZBlf6BNK77mIieNVvkNmD
	UH3gnea2inAi/jxFv3Is5Hd+sEc0oYcqcy67ygdheLHpiV9KorqhA3/OyXBoibiaVadjbk7YC4U
	3Ue8xMPw+en/kd+fFzn6ov102n/FQOp2ZbnwBWKRtAxGvTykfxFTgs3o2RCwwKCGzDAiviTupK1
	Y/Cc5ilGhiFkAKjAEaXHAeBOiAA/5mZRUjYJOFs9ebs8gYDQNtJdgshnaUtPX5v9BPPT1irCWTv
	Hxwn1yy9EguZIJreNjfNqJDXqo15jc9fxTFgvfbcuTKv0yAF78zthSiAgZwd2ZR77gdwsZE5Yxh
	4nDiZtL4p7dPoaVkcZ+pkf1LV0AjRXpLFOQCOhcYFr7u3yTV/Z7EmpSmee/S2pwGXPHvwU0tkJM
	XI0WQ==
X-Received: by 2002:a05:6402:430f:b0:66e:c7c2:fdbf with SMTP id 4fb4d7f45d1cf-66ec7c2fe80mr4857561a12.22.1775574683352;
        Tue, 07 Apr 2026 08:11:23 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e6f10834asm2753326a12.15.2026.04.07.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:11:22 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/2] Describe IMEM on Milos
Date: Tue, 07 Apr 2026 17:11:09 +0200
Message-Id: <20260407-milos-imem-v2-0-5084a490340c@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Oyw6CMBREf4XctTWlNBhZ+R+GRYsXuca22BaCI
 fy75bF0eZKZMzNDQE8YoMpm8DhSIGcTiFMGTafsExk9EoPgouSSF8zQ2wVGBg0rFC+kEPIqSwW
 p0Htsadpk93rnMOgXNnE1HAmPnyGtxD0GWgVkjTOGYpVZnCI7lgSsio5CdP673RvzrfHvyZgzz
 qSQErWWF55fbq0i33fO4jnJoV6W5QfcU+CF6wAAAA==
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775574682; l=726;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=lqy09Kbj3O0yY7bdWaeGADHmmTFPdpTQhu87yGhEEm4=;
 b=t8ws3HTAXyiAvzcnuJZO0pMo5EnFg9ixXGNLiV3mKbIx6VrCOeei/HrOt1so0kG4xP8sVq5th
 mJ4nKteG69fA4vCNYdvSfXyfeKsdgwFKv0bLmM07dUzEHmHv0oSUalh
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102182-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,msgid.link:url,fairphone.com:dkim,fairphone.com:email,fairphone.com:mid]
X-Rspamd-Queue-Id: 4D3903B0B5F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Use mmio-sram for describing IMEM
- Link to v1: https://patch.msgid.link/20260403-milos-imem-v1-0-4244ebb47017@fairphone.com

---
Luca Weiss (2):
      dt-bindings: sram: Document qcom,milos-imem
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/sram.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi              | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-imem-3a034224946a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


