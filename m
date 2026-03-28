Return-Path: <linux-arm-msm+bounces-100515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aH39K+4xx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100515-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:42:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B63434CF73
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78A5A302F733
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE3133557D;
	Sat, 28 Mar 2026 01:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="srJ0O2vt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA3258EFF
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662009; cv=none; b=jNWgkAsUcU48EytS7Dc7l3Ko8l8FYn2QmFWdbWqzxLTy67FdL4WVLESs19q1AiJiDvhb7uA3lASw1recjT8BNbpwvIZXJF1My51KVZefkwaVuuHBMqKF5p/iVek9pStbEd/1TlyjcLQ2Q8VALs4LzRpvJM6J60DoU8bR8ZLGH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662009; c=relaxed/simple;
	bh=bNBwjs8zbz1FQu8BUOGiW+xvrm4VsfpXadFXmCELexI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWj3mKHUypW3m014SB7+iVGwEOHYVlEdMIhUAaHe2g78xBpyjKTdDA4cHPIJoAPLpnHEkOwji8y53Se2vdvVD4mWq5tyBZ0xt9g3Y1yUC6AbWR7nbIEuR6Uq69IJ8+h9nFlL3Ncm7nQmdN7rQs3g/d3ZV/ksMIvgdRq4XQN5O5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=srJ0O2vt; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89cd8596724so29864646d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662007; x=1775266807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGtxO9+SfhLV/Gngm7A9OKK9zLf1CSmm7lKaEGRjrv0=;
        b=srJ0O2vtW7b2EKVyy/6FOjURvTmD7lA20LH763WvjfCjSev7wWdfZOnngUVgIlhY+q
         oHkZm0giale2Rgan0PCOjnS7+gF0tm5twhh1q6sOFDny7wTg7AyiLlXIj91lE6lTo3Oj
         JZQ/HGOQaeqHYLr+ya2w9OUVCYYGgwavH4TDEJKQBjyaOX8ro/xVEpXf+sCOjo/815EO
         T0xhsMUZEL2330PmcQOD0DMQDp7aXnhLGcGH7po+XlRyC8S3E+MAX00CrOpFFojMH0Nj
         1qVTUG36VA9PMqiSWIzdqBQVwAfxMogqILfZ/1ZUVf42HlGAK/0I5V9UyjAsp7YNNA3O
         tC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662007; x=1775266807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGtxO9+SfhLV/Gngm7A9OKK9zLf1CSmm7lKaEGRjrv0=;
        b=pVyjYrrYhTDnULFl5yp/eZny8KQg2VEuL+5gUCp2qUEAFz4S2RKym+PIAreAjQm3sK
         ei7cNt0TvdePNBlscUK23m9uAPZ2EMh8M3JqXAou7O2uxDj/6S/pN9GGXGGSAwPmmHow
         iA/z3eQjDLIGsS/ylECxYHbpVrWJvAX6fg/LIRGeBSdb6ZwQEf2xDkuB3fLYn7rTeGHT
         6doOF2sXrIBo9I4pVubBKp8vSvPv+Zrc6haceMNmPjUtkZhkmU0G74GHYQsSe9/TVOEi
         NbC46je08LBZ6US4ju+QNgyI3xBLrFrSmQaZpwXvtEPzQ9SFUwc/jYsIITldZK9Noiub
         3/5g==
X-Forwarded-Encrypted: i=1; AJvYcCULDQBVL9GEE0fgJhae4gHYs3IKghEelLpWdvrFyKBaOg2JKa/rTTE+tLaA1/wZGcN0h/Ir6vEuckCC/FUl@vger.kernel.org
X-Gm-Message-State: AOJu0YzTfGraiZYPnPBuJYN3Sbih+D/Iz0DPFB921NlQZn3PRHhpb1QA
	cptpJ1olF5IaEZ4R+uwMbh/rj0qsG7QXNE4BrhUIXCj3LnV4LnVqKxw/
X-Gm-Gg: ATEYQzy20aQT7dehVz+duZRXr6SabhFuGZK+EwQpipC70sc1MdQkEFn/dN5nOhGJynq
	s0jYusLfPGJt8+5teDTGFAQY6HcsFwIn8brKyVRIejnbnq8Z+PaPb8mcrOLF7ydagHfXdj0Jkx1
	lIclD5CLzZ5eG9ZM556PG9DZvbmF7JyVye3nW2mVu8/lgJr/HhklfyqIy6CdEubuioyFfn19yW6
	RTVtTSndhBIo8pVuc9Tkfs6f50GJEbbyeWhyGC1ByFZOjDh1uW9KkTU8lfRzx80d7DS2f/n4wGS
	pFONSqaTe5VQYJEBGGS9xtSvkLUnpNWUHyq4o/x2bD+XfbSckXbSTvtJbx0FgV1/Y+JT+SoKBoy
	530bOazMT8aeECPK64p6xtzSa+sBaAwObakNrwsKK4tLRWdlTH1Q2CYFSXCgmWvrMOUuraldsoB
	qwM8+a103AT3P1g6TWZ8rEnfBqfTutf0C8nDsp
X-Received: by 2002:a05:6214:498e:b0:899:fd8c:55c3 with SMTP id 6a1803df08f44-89ce8d978e0mr74569846d6.22.1774662006819;
        Fri, 27 Mar 2026 18:40:06 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecbda4d50sm6474596d6.15.2026.03.27.18.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:05 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/4] SDM670 Basic SoC thermal zones
Date: Fri, 27 Mar 2026 21:40:37 -0400
Message-ID: <20260328014041.83777-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100515-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B63434CF73
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the thermal sensor, for thermal-based CPU
throttling via LMh, and for thermal zones.

Changes since v3 (https://lore.kernel.org/r/20260310002037.1863-1-mailingradian@gmail.com):
- support LMh clusters starting at CPU 6 (dt-bindings tag dropped) (3/4)

Changes since v2 (https://lore.kernel.org/r/20260304014530.27775-1-mailingradian@gmail.com):
- remove cooling from memory thermal zone (3/3)

Changes since v1 (https://lore.kernel.org/r/20260210021607.12576-1-mailingradian@gmail.com):
- add review tag from Krzysztof (1/3)
- replace CPU thermal zones with lmh (2/3, 3/3)

Richard Acayan (4):
  dt-bindings: thermal: tsens: add SDM670 compatible
  dt-bindings: thermal: lmh: Add SDM670 compatible
  thermal/qcom/lmh: support SDM670 and its CPU clusters
  arm64: dts: qcom: sdm670: add thermal zones and thermal devices

 .../devicetree/bindings/thermal/qcom-lmh.yaml |   3 +
 .../bindings/thermal/qcom-tsens.yaml          |   1 +
 arch/arm64/boot/dts/qcom/sdm670.dtsi          | 400 ++++++++++++++++++
 drivers/thermal/qcom/lmh.c                    |  69 ++-
 4 files changed, 460 insertions(+), 13 deletions(-)

-- 
2.53.0


