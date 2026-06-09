Return-Path: <linux-arm-msm+bounces-112240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id iFlKFXxIKGpRBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112240-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C89662C3C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=iqZAsn5V;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112240-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112240-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 435BE31DB4E5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D447A3B19B1;
	Tue,  9 Jun 2026 16:22:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CEB36A341
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:22:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022179; cv=none; b=roMXO9ScoZ7Rmk59IUmNRCZER6vwuUtZAo9dNJcS8aNFNDMD2yad/L8tML7H07Jv/dKxF6PvZ2nTwUXj/fCiZkI/veQ7KoXR1WMR6AgWHzN/zsvo1CAFhO8viUTf63RVN6kjhxfUIxKTdmR8TLs14xfBTgsffJcg/KUTj83R40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022179; c=relaxed/simple;
	bh=U3gede9JtGGD2FQ6a1L00yb4hwp21BcFfokptR3zW7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3xqSiTDiMHTXM1ma04xalFouDVUDN2UTBQBKzSpTFpPhxAlDdiA/LYmCbb747M2QadDphi3SNO1bfF0nDmu03tna21zxtVGCMIsxV1TZnz4AL1eOua9zkX9qkOSrZEZmB+mxyrSnfoBN5LJ3s/nbleB/V/K1QE/GV+/Za8YTLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iqZAsn5V; arc=none smtp.client-ip=209.85.160.169
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5174a3d9598so49808321cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022177; x=1781626977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0fBe9vAakig1BPSXTzZIVSMqUxMEqjGjFooZM5iLX84=;
        b=iqZAsn5V8djwuPuWU5Aty1TvBBgs6tOD+ELBtkVWcmLuJRxdoKrjOe8rz4Xry5xeWl
         ry5nd+yPeFtby/g/c4Wug8AqHut9yeJgEYeDEzI1M+hED6KYkeYNSSkoZBzs4BP495zn
         XmYLOgIJKZjeUoIvVAXAO/GioNw0fu8co8VaUSSHnAAovl4OwOR44+2ldAGYOUWTTQZf
         /dA2w2wga+knCgJfYK6jmd7PLOzZ37+Jo69gWwr7o0ib3ByN+Qf6dELZevZJ5Fl4P6Q/
         7yU7AqvNsLuU5M20VX388YGbXYJUAf/8ho0zZcNuZM1uxEW4EIXPuPTVh8vMJSxIkLn3
         bdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022177; x=1781626977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fBe9vAakig1BPSXTzZIVSMqUxMEqjGjFooZM5iLX84=;
        b=KSgXImBd0DasWIeG87LP8rRf0geiNF4loulHXHAwJZYPgbCMPJupUBNJ9/UZCIPz4C
         xHPYjcAtoPB+zyMTPxlJIGmHey2HQxhbokBP5z9sin8sKhWOC5pxSyIOsvK8lApxtdW4
         H6SWMBE8hSaogxUmX1TBhemMm4JiN0RedfhSEItRHQOvaKb1LKbb7i19LkGEUIb9fU0c
         jS/S410ZeSgUFnxyQQThibo1tUZ8uApv3WvlJm3rvz5cmSNNoqnJpmEpqdBDUoCvBi4x
         tN9DeHUQDr8h2hd+9fgO7pzOVykXxdeEY+RBRCZEy7x+3f/5fNr+JLI7G9YMbF2+9SK4
         FNnA==
X-Forwarded-Encrypted: i=1; AFNElJ9Y8CAmIAOGQ9UyBnwU1xYdqlwhV/JubTw+c7NA8s/fWHxpJ1bXJI+374nkBij1Wh4sgMichwEoilCsHOiB@vger.kernel.org
X-Gm-Message-State: AOJu0YwMwCqWUVWn+oWpubq48UlAURnlX2NIeBv7882tKFbTOlZY6fuI
	bKykLpzpmq3TJkfM3QOSvP3F6l7jJu+unR6vUuhuO4Ti/X0+g4Gd+AFr
X-Gm-Gg: Acq92OE8A73PdVcfg8c+wnqNkoz42C0iRxDnxXB/cEoJZSGi7t9fOypLvmMzC8Odr6d
	YmCwfeY42rPzIGtNP38gNd46sj7ywA7fthIkmRXOXi3sL3YLI+rhyPLhGddGb0Fo9XecMcEfYXy
	WqLOdJhWDYnRBxkUJuVTnMcX3qO3Xk6/Q45YVUkiehenlRyKc641XHRyju/VNEgV+G5F0DIi3Nz
	jqhVo+J3h0MXlJmOSm/wGmmftdBRIXsufuypFS+TfhxEX2ERSHHVwmAR9MwxazXO7ses0jhzjnO
	X34OxAyNaN1/AMiFkDbV7HQq8RucruvLY7UtYtuYXWEYMkgOOxr1gQkRzjAbLTEab0vOp2Ybmoa
	dARWGEqbgMT9dE/EFJEJjDG2QeylVQTsVG0utXM16nPJtQ4cjsj9wtfL7jsorEELaoiD75DL5Fs
	++emdQgdnPjwcnzN0hcPKU1KcDhzVs6WNyDAOZlA==
X-Received: by 2002:ac8:5504:0:b0:517:9b2f:a68c with SMTP id d75a77b69052e-5179b2fa8d0mr218453701cf.30.1781022177321;
        Tue, 09 Jun 2026 09:22:57 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c08234sm191310381cf.6.2026.06.09.09.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:22:56 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 00/15] SDM660 sound card and internal MI2S support
Date: Tue,  9 Jun 2026 12:22:40 -0400
Message-ID: <20260609162255.31074-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112240-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 45C89662C3C

This adds support for the SDM660 (formerly "SDM660 internal") sound card
and support for WCD codecs over internal MI2S (represented in APIs as
LPI MI2S).

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v4 (https://lore.kernel.org/r/20260501153128.8152-1-mailingradian@gmail.com):
- name internal MI2S ports as LPI for public API (2/15, 6/15, 7/15, 8/15, 9/15, 10/15, 11/15, 12/15)
- fix capture stream macro (11/15)
- fix is_rx in q6afe port map (7/15)
- use NULL pointer in place of "NULL" string (8/15)
- change fallback compatible for WCD analog codec to pm8953 (4/15)
- add ack tags (1/15, 3/15)

Changes since v3 (https://lore.kernel.org/r/20260331193939.40636-1-mailingradian@gmail.com):
- rebase onto v7.1-rc1

Changes since v2 (https://lore.kernel.org/r/20260304195815.52347-1-mailingradian@gmail.com):
- add missing sign-off (1/15)
- use definition of last dt-bindings dai cell for LPASS_MAX_PORT (6/15)
- move sdm660 support to existing sm8250 driver (11-12/15)
- import WCD codec patches for MSM8953 (3/15, 13-14/15)
	Changes from original (https://lore.kernel.org/r/20240731-msm8953-msm8976-asoc-v3-0-163f23c3a28d@gmail.com):
	- add back empty line in WCD dt-bindings patch (3/15)
	- add Dmitry's review tags (13-14/15)
	- rebase onto q6dsp fixes
- rebase onto q6dsp fixes

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Adam Skladowski (2):
  ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
  ASoC: msm8916-wcd-analog: add pm8950 codec

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (11):
  ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add lpi mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to lpi mi2s
  ASoC: qcom: sm8250: add support for LPI_MI2S_RX_0 and LPI_MI2S_TX_3
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |   4 +
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 +++++++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  48 ++++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      |   5 +
 sound/soc/qcom/qdsp6/q6routing.c              |  78 +++++++++-
 sound/soc/qcom/sm8250.c                       |  17 +++
 13 files changed, 367 insertions(+), 12 deletions(-)

-- 
2.54.0


