Return-Path: <linux-arm-msm+bounces-118508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h225AgaSUmp0RAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:57:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F58742A74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 20:57:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LjBjh0vN;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118508-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118508-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC739300F53C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 18:57:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B50230E827;
	Sat, 11 Jul 2026 18:57:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6271266581
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 18:57:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796227; cv=none; b=Uq9Lngv/Lcqm3ZCtb2INUc/7u2GwIkk3n6GcomtTUkLTYrQoUgc/0QJ/kRnd1qDByxJ1QJJoPF8KJn7INlhGUNTjDFV/V0Kb2A2hVN9bnqWj9lT7kbPtXtcFOrT64ArdX8bsuf55/2M0agN6AYVgWQajxlHDU7CB4JzBf+T5YSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796227; c=relaxed/simple;
	bh=QjEEwtsO6GtUb5wxi3/uSRmeBBqn1mmEfY0J7eQAVsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BowhAiYTCrXdR0F28xJWrJ0QWS3hU5y6WDD2aKe4uw5NZlDZA9VpV9IiuliitRgKccnQOw4Pha+kbl7N3xKc8BB4dmfZOywevDyIxfkXbfsp0W/G+26vvYsW+bblLfWqZn2ytI/HpZFt+kpfGROOQR3hrSjc7YJ1FEudxnesSPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjBjh0vN; arc=none smtp.client-ip=209.85.221.54
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47ddf7b09aaso1240617f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 11:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783796224; x=1784401024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wKAi8gITG7GEkjFdEuXvc1WgB/hnQthAXmnHmDeYZs=;
        b=LjBjh0vN2tlu49T/6w/h1i2yDrvIK/PvJuSdv0sO9qo5MDzyPH/cr/vB2RkMNx5ayt
         DHGICuQ7qSjz5IxM/GMqD+GlwhyTPE/+paP4G4cXxrNXyIqa9f8h/hI+XtNkauqOllS/
         wLWLlGSRQbx32EzH89oS5fKf2poLBaLxNKG2a8aPq1OzbA3M4n6+gmfqdrAQtGtvUWUv
         Bx3RseGLtfX/MQ9J7amfdhCHNvOFzhFYks1UuW5UubIrS+FPu98NLPDkc3cKDqZWNQ1m
         eCF5NG8VFDli3oENh0grhLuCpQUS+YurwpG+fJOOBZ8cOeBpvrmVG6IHqDjICVmLMS37
         36Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783796224; x=1784401024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wKAi8gITG7GEkjFdEuXvc1WgB/hnQthAXmnHmDeYZs=;
        b=HZRqG9FMDuHb1j0jRz6hMno66aTrt+4jiuc1oQobXoU2qf58Y4d03KUBeRzPTR1IPa
         RqLGJIaoH9OeXbTrESb7ZY8Gvvlj2t4EMLAQbVsjRugBurspqBPoFSUV9U/LFuiV0h+r
         9MdxSyoqt1Hb/yunOdWkW4QcKOAq1joj8UgdbWKKkz7reOcrM/gg7k6p27/BZstdUs1k
         kDiVKYPjbhrWVpsO3SO8k/u7mwSpS2qbbg9a2WmLStmO2UoeoA1V+nf86/lJwj4FjzuV
         RENRxdL9I3iobbIZ/oOEl6i6Z8FWkd2qxvT9FjifR+SSKPV2EsNu9lQDhKsPWYomtbld
         P90Q==
X-Forwarded-Encrypted: i=1; AHgh+RqjDcUSE32gK1jqR0HPsTtJJPR/x862bPTS07uqVHYFah1HrtVFmLZ8YsMSZ3eoJaJBK3R6NyO2UaItl6S8@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3CEqrkau8vxmQlXa2X7EHNOdRJtffYk3zMJKsjqosKth4qPfD
	BB6Kn3EV6Em2szm4wMoNHH1RIHnZaP51BZxfvMruhnHUWB+wmKH80e5P
X-Gm-Gg: AfdE7cnAdQm6mUADkEz9xlirJ24O9H9JLk01h7d5hWy7HdAfEtDwicy96FIUUFA5zFe
	MtbgIU7HDKbGnIZrSQhZ1EBLvTh26ruBP763WKbqECpwe5J/r4W9AxqTjIIgu9bQ6LvhzbrjCC0
	cZKwRJ5FKk6l9u1DQ5FicJzSw+lwhdziUxm+HnyYJ5ruPVx3V49ARbX/DamQ/a+446WSuydeykU
	5vhU4fYI6Nn8dLWhY09df78bAiEK9Ie+OwGbLWm59zTAb067s9oKov79s30lrJ7L4mLhbrXVbZK
	xpaLDsrngj5sODI3Nts970YwNbycMc5Hz2ln00V+oaBgTzp6qX9cvPZ7+nMzkCu8QgvT2BLAPYO
	qknPF4X+lvWJS4j6ZhXK8+dmxhxvuzY1/NkZBegwLnVzUHIvzGg7ukVO9SOCAcqO0S8uVvaru9D
	GWrzpQje10Me1A0sfUuOvPYDTHbpaVt4ygooK+kW2n
X-Received: by 2002:a05:6000:1867:b0:475:f0f0:9ef0 with SMTP id ffacd0b85a97d-47f2dd0c40amr3701536f8f.53.1783796224006;
        Sat, 11 Jul 2026 11:57:04 -0700 (PDT)
Received: from localhost.localdomain ([151.27.210.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039afacsm66905647f8f.19.2026.07.11.11.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 11:57:03 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 0/2] arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE
Date: Sat, 11 Jul 2026 20:49:32 +0200
Message-ID: <20260711184934.55701-1-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118508-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:oleksiionchul@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleksiionchul@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44F58742A74

Add initial device tree support for the Xiaomi 11 Lite 5G NE,
codenamed lisa, which is based on the Qualcomm SM7325 SoC.

The first patch documents the board compatible and the second adds the
board DTS with support for regulators, storage, USB, GPU, remote
processors, wireless connectivity, touchscreen, flash LED, thermal
sensors and hardware buttons.

Oleksii Onchul (2):
  dt-bindings: arm: qcom: Add Xiaomi 11 Lite 5G NE
  arm64: dts: qcom: Add Xiaomi 11 Lite 5G NE

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    1 +
 .../boot/dts/qcom/sm7325-xiaomi-lisa.dts      | 1138 +++++++++++++++++
 3 files changed, 1140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm7325-xiaomi-lisa.dts

-- 
2.55.0

