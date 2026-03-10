Return-Path: <linux-arm-msm+bounces-96423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gLzZAsByr2lPZgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:16 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 593122437F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 02:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C925305513C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 01:24:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423E7238C1F;
	Tue, 10 Mar 2026 01:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQjjj4sW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437992848AA
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 01:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773105850; cv=none; b=IVNW925PJA6uKjc+g1aMHNFj6VDwUmDyxrtB1JGgzlTCDG2QaeRF3z35GPjLEaA2nTR/vLmSqSu8RVmJ/hktc46qzr7IXmvtzFScOpLg4wAGkqpMBmWiOED7yosFVj/b4m7LexfRQHg2z1i6U4049LW6wK58yO17/e7HfA+F34g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773105850; c=relaxed/simple;
	bh=LiQ8EflkNH/uZA+ems0QOL+ZbRGh6LZN4zZMLOj1rXc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CEPq7BXEAXILNi/HnQ7FYSOfITJlUfKbzuNHmTKifPRWUQfyldJno1/j7f2H5XcxiV9oV4t3AHnNzUTxEPvpjwOpHRKK6x6ZJgae455O6cJc42pArLRIAMesAuCRiShkskTYW+gcypKFAaSJdCByu9cSFKIwoRsfKHyxY3SAjT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQjjj4sW; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50917417efbso13214091cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 18:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773105846; x=1773710646; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7CeMWLpnBLUWUr8MpkL2IM0mC+LILizg1OzjRtJe76M=;
        b=jQjjj4sWjru06czyKnUE3iPes3HzZgXEDEQ30cZancv4ilEdVBI3v6jCs05RBLz3mG
         iGuMEMGNMDHe+GJ2t3k1WEhZxY9jizavMUFOsfvRdN/nMICVNdg2TnOUExpIiYZueqNa
         4E81sHQVOfDAb+o/447EEZZ4DERZJME9Y7IkTOORQAPKtMNkq9H/D4Zz8pm+dEGv7Csz
         caAjURm4FOsr63oHq0DhXVT2hG4Z1xWi4LmcQxTDS5UoekZtrEQljy5DGYPOIV/81LHm
         QqErcRi/scKh225pJ2sa7+uwlr6J4neKajpR9dbrpJ2JgrjUSmR4J+xTxLzuL/2lon60
         axQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773105846; x=1773710646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CeMWLpnBLUWUr8MpkL2IM0mC+LILizg1OzjRtJe76M=;
        b=v8sz65mhLGfOBIuioxr9oTlo1s3uK7ntVQeH2zCGpso7NentGVIUJg58/OyFLVtFMq
         DWXLFYPA5TSXYHuYtaoVffPbfj3DyUHk1MJia5zR4Zctm0QKrZp4yBrCaL8k5rgYBWKY
         9J8xe8SduHIF+S/kmTUlW9ALLgaDeCVW6koLp2CfekU+KcybUcL/NYKBgxKyddGp1t57
         rh2ikvMXqSP5yp1+LdJ9bE5qnTyvL42zAfwT8NF/SWTsMsO7MMnPZtUKOBEai2UTcBfi
         a4I0TimY4qWGFI0CsjIJE6P0BGoKD1thYeMiDzAYujRQX2dm9ZJCWIK6DCHJhvTvRk3O
         A7Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVIIRIVi9IivmGjdEmX/Nx2c9QN5+hsR8+yUP/mQROvs8Rr6t2AphEcB7D0wPzs7E4lqqFpZKzxV4CpJLYw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0+d/XWklvib4NWKsKuY9Tbakfxz11ONC4sBoEaOkoaxK7VBa
	iME6S+r3U3OG0ENk/z/p212P7l4zgSffDV1ckQn4JuwbHx5mQYl/H9Oe
X-Gm-Gg: ATEYQzyGyKgNGplDTXRtgrColt6Dw40ny54D4WQ8v8zTtVeQAMUIP/Kpsl7DekGVJIs
	V7pvrCJYDncjCGf/vIHEX4wZwzjOe8ryaYqOYBtZ9ZThDPuMfhnZKuOULzX60DSCDRm3U08IO3v
	vbW2N+GnXdsS9PnB6Z8jJIOUMOEFBb44kyOzDDn63mx/8mHNtGCS3DJxIZte5K0msnbiQ9t0LBC
	jXTG8qlPLUO8poxCYXjZAEgthYDOW1D93GEr4uv4vaJJCQqQLdZGwbkXQETxItBCUc1m16uKlli
	8Xz4Athh9CW05Fz61QWmdMzyQwdhrQ+aoRsu0UhiPfOrJvMqjybX4yiWkVVgEpr+l0x/agy1uDQ
	A5/UsaJN45UVbRnK3se6uT4k9O3rMPMTKcEP+RZr67J7gO7CulnxW4NOeCHLcJDVVIlIgoR24gU
	IsXp/ALQBGA4ql8Lb4vHadX/znPPL6XauhE0aQaQcZd45XOxij2A0uMbu+0IvrcpfnUDKoJ7hAH
	eoF89MFp83AiI4=
X-Received: by 2002:a05:622a:1350:b0:509:aa1:71eb with SMTP id d75a77b69052e-50925ff7427mr20643721cf.13.1773105846247;
        Mon, 09 Mar 2026 18:24:06 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50923ed69bbsm15741051cf.28.2026.03.09.18.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 18:24:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 0/5] SDM670 LPASS LPI pin controller support
Date: Mon,  9 Mar 2026 21:24:41 -0400
Message-ID: <20260310012446.32226-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 593122437F1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96423-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

This adds support for the LPASS LPI pin controller on SDM670, which
controls some audio pins (e.g. TDM or PDM busses). The ADSP patches are
not sent yet.

This series depends on LMh because the LPI devicetree node is next to
the LMh devicetree node (NOPUSH: link to LMh).

Changes since v1 (https://lore.kernel.org/r/20260210021109.11906-1-mailingradian@gmail.com):
- add LPASS in dt-bindings patch subject (2/5)
- change pin names (2/5, 3/5, 4/5)
- add reviewed-by from Krzysztof (2/5)
- specify gpio-reserved-ranges (1/5, 5/5)

Richard Acayan (5):
  dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
  dt-bindings: pinctrl: qcom: Add SDM670 LPASS LPI pinctrl
  pinctrl: qcom: add sdm670 lpi tlmm
  arm64: dts: qcom: sdm670: add lpi pinctrl
  arm64: dts: qcom: sdm670-google: add reserved lpi gpios

 .../pinctrl/qcom,lpass-lpi-common.yaml        |   6 +
 .../qcom,sdm670-lpass-lpi-pinctrl.yaml        |  81 +++++++++
 .../boot/dts/qcom/sdm670-google-common.dtsi   |   4 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          |  73 ++++++++
 drivers/pinctrl/qcom/Kconfig                  |  10 ++
 drivers/pinctrl/qcom/Makefile                 |   1 +
 .../pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   | 166 ++++++++++++++++++
 7 files changed, 341 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,sdm670-lpass-lpi-pinctrl.yaml
 create mode 100644 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c

-- 
2.53.0


