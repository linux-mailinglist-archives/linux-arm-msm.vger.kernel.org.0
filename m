Return-Path: <linux-arm-msm+bounces-107401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AA/6CrW2BGplNQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107401-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:36:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA853821D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 19:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A590A312C8D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 17:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B94624A13A1;
	Wed, 13 May 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PU0sq5uN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025BA48BD37
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 17:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693099; cv=none; b=bb2dms3jBp9xpeeq1rz1Rg2PGnr4jp9E/JbXBq3mVD4zuik4aF3wGmBA2ax03B9oMU5W49WgY3JE9wMJPJpe/foynWiRN/oow0Twm9gUaISYr9jnxAg1JoP84/uCiN/WjC50jf4fFYXmg0ug1FJRXmwsgz3EHuJQo5snZxfd3+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693099; c=relaxed/simple;
	bh=rsVH+Kn/9qjmPcmYrMUWd1h1YJw3zCcnym1KZfCfslg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jPmJyW/Zm40C86PXJq/EaslInTFoGPd3QdrSdlC/0Lt3qTKulMZ8JE4WeNXhkNE0Nq4Px7lCy02ggxRXzED3wjzbo78Grtt2I4FOIcnNUF34t3LLr4diiYzq9zW9f1pXD/EuRW2faLom6GbxMmi6o5he1b0foz5KVeJrKQ5YA2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PU0sq5uN; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-8c64d635955so19910396d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693095; x=1779297895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pFCIqGgLigFKHTXskPbCr2tSj2xG+Q75yI9Jsp0dlrU=;
        b=PU0sq5uNVPUviAr4zx7q+7iQ1uQW5cqz7ylkjflz7gcntBR8vVn1dq9ZYCCQoDFj5g
         oFyZjJIuWsTqqRlT6VjX9DEGWnbN/zOB52nHBo/H+Wl5MUTLmeVCesWRevAREkZ4pEBp
         um5Ns1m/7yswsvi/8/WKA25cDWA5T2ABWuGIfjsnh0iwj8XEWMBov+/DJgMwMr4RxaSY
         oSk74ej8hmhCPyVQtzV901lmj/u6ISTOWSBb6EDTYHyVMQf7Hh3Qfp2n6TZuTavenxE+
         nuKg1zn81hAY+/dvkkKh7nqup4CxU079NTxywFugHf+B70TAWVQ5K8AWxtoLp1CcGGS6
         Kdpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693095; x=1779297895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFCIqGgLigFKHTXskPbCr2tSj2xG+Q75yI9Jsp0dlrU=;
        b=fJrrl3SI6nxle0VO0qNzJCWdLf7FP+x49mD4rTSngXoNH94Y+2fbcYDzHcEUhxpzAp
         sFBM0YugcqE1d4kiTtjCM0mTYV/aJN2O1Z72PXne8wZdy2nz65Qi/n+ZQ563U4A9/ili
         /pLF2zxajx/UZmUgL5O6QeVa917FB6OE73ehpxSt0kCCquS5RktMa4tsk2lCCP2K5qfO
         FUx9ki9jM62OYhsCUT54KRKBNtgEILTjC2znc+5BY9kSwfz3LJAzE50KAd9Db50DXq/q
         ozm9OYnmOKgQGaHusbTYinx+Acmh6UFIKcvxBGTQmwNGq31y+BfWk+Sx3cKEfIQOVQgf
         Hqfg==
X-Forwarded-Encrypted: i=1; AFNElJ9jBn9KWcocNB6B3L/VcfLNCW7gR+Aq6uGJl9RidWYaM43sK1oKCJ8xPd0vgG/a8ov2V16Qy3A/EiTjxO5e@vger.kernel.org
X-Gm-Message-State: AOJu0YyYZLdHUtoxQjEXmzLR0qNWEKz0PjCQ0UulYUyEnGkdWL8JF0iD
	+GpAVqMi19EVi1eEg0DBZHsMg+xkbgcxmxdPdeX2XvvfpBDLLuvM7GKr
X-Gm-Gg: Acq92OE/dQsHOZ6LoGh5zgm8pUUZ1MjSSZ9Ko3J8o4aDZqaNzCsb6wkY9+lBWY7AKwz
	szemb3IgzPn/AiaiaUcaNINo9DAZ1OHnXX0BtIMpx5oCrz22E25svwUF8xuQ+IAf2pyEff0g2/e
	jjZTgGHfndimHIcccEgeJcoIHOoCda5EN8+2/BKxm6nZZrlmVCTaSoG+fqHPwBXmW+4WCxF8Ff1
	xilM4dIyUhFnL8B3yy3qeYbrL4qNTnwuq8PaZPmnHvivpDBfebHiIB1ZiMUm1P72EAYPDyt7cTh
	JoIjcaLJdY2MrqRJ0/igsUrkIPumUBIgWhtsyi562lxxpUi3wNcI0dJrVuZ88UnOaemvQFP7IMY
	04E/oo+8/xahUJUQnEY8uGthixqSCcAswdC9IZcfr4xqBRsbPz9WBDl1p8VFN+LMHY6fx+Fc6nx
	Du78E6xApmdx39kV1bqnml7F5kjQ==
X-Received: by 2002:a05:6214:33c3:b0:8bc:81:c1db with SMTP id 6a1803df08f44-8c7e01a08dcmr57850306d6.43.1778693095211;
        Wed, 13 May 2026 10:24:55 -0700 (PDT)
Received: from localhost ([142.181.178.53])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908562955sm1884916d6.10.2026.05.13.10.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:24:54 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	Yifei Zhan <yifei@zhan.science>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 0/2] arm64: dts: qcom: pixel 3a xl support with tianma panel
Date: Wed, 13 May 2026 13:25:47 -0400
Message-ID: <20260513172549.1345-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 72CA853821D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,ravnborg.org,lists.freedesktop.org,zhan.science];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-107401-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

This expands Pixel 3a support to the Pixel 3a XL, starting with one of
the panel variants. The Pixel 3a XL has two variants with panels from
Samsung or from Tianma/Novatek.

This series depends on the IMX355 front camera devicetree patches
(https://lore.kernel.org/r/20260217002738.133534-1-mailingradian@gmail.com).

The most recent test on a Pixel 3a XL is in v3. v4 is still
compile-tested (with relevant schema) and tested on a Pixel 3a.

Changes since v3 (https://lore.kernel.org/r/20260310002606.16413-1-mailingradian@gmail.com):
- disclose AI involvement in review (Konrad's review tags retained) (1-2/2)

	Some changes appeared in v3 (under "Changes since v2") which
	were suggested by the "Claude Code Review Bot", an experimental
	AI reviewer deployed by a DRM maintainer:

	- preserve same touchscreen physical width in sargo (1/2)
	- move entry in Makefile to correct place (2/2)
	- correct top-of-file comment about which panel is supported (2/2)
	- explain license identifier change from GPL-2.0 to GPL-2.0-only (1/2)

	The AI involvement already occurred between v2 and v3. The full
	AI-generated output is accessible at:

	https://lore.gitlab.freedesktop.org/drm-ai-reviews/20260217000854.131242-1-mailingradian@gmail.com/T/#u

- rebase onto new front camera patches
- drop applied patches (previously 1-3/5)
- add review tags (1/2)

Changes since v2 (https://lore.kernel.org/r/20260217000854.131242-1-mailingradian@gmail.com):
- add support for regulator (Dmitry's review retained) (3/5)
- use common set page function (Dmitry's review retained) (3/5)
- squash new labels into common dtsi patch (review tags dropped) (4/5)
- specify framebuffer in terms of memory region (4/5)
- only specify height in XL/non-XL specific devicetrees (4/5, 5/5)
- remove status in display devices (4/5, 5/5)
- preserve same touchscreen physical width in sargo (4/5)
- move entry in Makefile to correct place (5/5)
- omit copyright year in new file (4/5)
- correct top-of-file comment about which panel is supported (5/5)
- explain license identifier change from GPL-2.0 to GPL-2.0-only (4/5)
- add review tags (1/5, 3/5, 5/5)

Changes since v1 (https://lore.kernel.org/r/20260210023300.15785-1-mailingradian@gmail.com):
- use multi functions in disable callback (3/6)
- add and reformat comments about XL differences (5/6)
- mention the sdc panel (6/6)
- explain google,bonito compatible (1/6)
- remove TODO item in code (3/6)
- add review and testing tags (2/6, 3/6, 5/6)

Richard Acayan (2):
  arm64: dts: qcom: sdm670-google: add common device tree include
  arm64: dts: qcom: add support for pixel 3a xl with the tianma panel

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sdm670-google-bonito-tianma.dts  |  32 +
 ...le-sargo.dts => sdm670-google-common.dtsi} |  22 +-
 .../boot/dts/qcom/sdm670-google-sargo.dts     | 714 +-----------------
 4 files changed, 53 insertions(+), 716 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm670-google-bonito-tianma.dts
 copy arch/arm64/boot/dts/qcom/{sdm670-google-sargo.dts => sdm670-google-common.dtsi} (97%)

-- 
2.54.0


