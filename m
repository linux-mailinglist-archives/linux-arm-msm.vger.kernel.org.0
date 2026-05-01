Return-Path: <linux-arm-msm+bounces-105488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KEDOCivH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:30:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E4B4AD8A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:30:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C58A33005313
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:30:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84AA2DE6E6;
	Fri,  1 May 2026 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BMFIGLkM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A1D282F22
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649444; cv=none; b=Ds/SH0qVehTR1ipzH1xe8t3HrWRHDktFnf1kYmw57Pj3sHTsd9mjrGg1ym/G34s90oYo04lTtFQpxNqK+wzf12nkIXSqQ7xZfcfr8GP2RNnjVPdMrUDft5bhK0CgQs69nMRh75n/mnfLF9wudMmAAiA1jNg9iUWlhJ9droUavzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649444; c=relaxed/simple;
	bh=zeXjslT8//fV8OtPFz2zHel5UpFaJNBynQ6tRRznBbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xxl7vah3XKIgfMt9hG03FuB5SbefNVAkIxe/Ah6jnbxtWDW2aR3BJYU+LGFbkkDgPCS7RB9CYDu8DipZWmTSK50EPX3NQ9j2WayTEU2iVnHoCjznpzh594DyaGRkVG+P3ZKfLBVjdAAjldXMEQ9gGUcCVyk1BBLnqvdtVfiVv44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BMFIGLkM; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-899a9f445cbso19387076d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649442; x=1778254242; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2ni3dKGcG7zejOacMGL96Vo7FoEUpzVIFEMhHf6gxlI=;
        b=BMFIGLkMdjh9vNV84bxFMYD7d9bQnrBnmlolzrO73mK1rA9LTSmRKSYIKeKgzxMaaw
         Hlxn5n2aJaxupx+DnyqD1JlRn3i2TgSG0XEKNYIWSE+utWaDJLIAE89+QVos63At+jWq
         QSBU34ew3H1jOrP3Qp1F+RmpQ0kARwXiGjfsZtDCinC9iQvKf3V3YmmkpO6N0qt+/y0T
         obL660gmqm6cpO0LpLCURlILMAvTy9moSia7/rmD0nCYK6k4xIDamRiiet7NZ6eVa7zU
         4fFhTYAlQ7OEki7IZMaPXanxf4trM7Rd5PbP0BLBk455jFuDwu7n2MV+7PnSdXTbsYpL
         /olg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649442; x=1778254242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ni3dKGcG7zejOacMGL96Vo7FoEUpzVIFEMhHf6gxlI=;
        b=Gdtoo3r5gsYoj8aAgW2janOyqf+Kq3kmeiJPdO2e86PNX2Oj+N9C7Q+oB/h2VhHIUl
         GdAI3IuF0Co1T64vBi1GgTeNPHd+jMITXh/PR697nW4NNfnSiYlvv5PKClN3L7E6y9ji
         FE0eEBZVzRM9X5X/USLMlI3hpO4BZbXk94PSjOcMPYP9Nv473hncsHIsm3ZtuvGfg34O
         XFLU8wUgvsgC9qn9ous1BZ+KnLjOFxs3pYEYqXdVnIsyvTUNzxDrkv2Dk9PujOkwYxSu
         Ck5PDcm/xZcxyWchjOVG49SczQEljaGqhvbCz0pNTTYRe5LDi72Qv1MDmmj8xDDqzQxh
         0IPg==
X-Forwarded-Encrypted: i=1; AFNElJ+QptYcwWW8DX2b7H4eC1KHQlk0s2wvWW0Tb3a7duCGxRpTsnbAheI48zCtPySk2Pk313O9kaC0ohxUuvtj@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6iS2uehtLfrPtbDUD9M7KSgw4eh9cl86zDAtHmFeEiPqJso3Q
	gvj5FlRmmnJgEsrsONAfac0sDaBGoonWgIEucJqMW4MgBQ6xza5EnfZj
X-Gm-Gg: AeBDiev+Q5mg1Ynr0bIV89HzGQdz6gFwxXnS6cC423zZTXvKp0sqLM89dveIM7gOvbi
	+l5htfLjwiwcE+umc66fUl96LeecP+WwP+LjWrLV/rSPyp0xOar+Gj3y5jdALMqXFNFjiKQj4F9
	Yr75S9RHhWo4A7giGw/bJAqYIUF+zufYgl4MmhzUflWBcd7e3oDwJaflKJLrf0U8UKEhw+Hhl/S
	eGVVT4fMv76XTciRigS0Nuh1dtf++CC0NUC59GJ3EmDUVjgQ04tmW5o4QP7D8fbHWtIhsAWancw
	Tgulw72EdOQKR+oyPQ+lkZiEc+vmfaZ93rDao0QVA+qisXVxuLnuU/5OBV1+F0OvPP+XG8OsLWA
	ME6wbzF6EAhuwdwL4l4EPch/lwie/Lg13zzJAAEv5h18UXuH3sL33ivrF3LdsWtlwAD9ap7O0Bc
	xacO0ZK2ln9aVS28UdNshxq0P4HNjU4rTaVRXw0TWECczdFQgv7bHP6wFF+4rjVHs1114w/o9Rf
	hmoV9CcnGUhV8WI3oG6Ip6Bkefwp92VOgHe
X-Received: by 2002:a05:6214:242e:b0:89c:ac72:2f6e with SMTP id 6a1803df08f44-8b3feef9e73mr118399146d6.43.1777649435886;
        Fri, 01 May 2026 08:30:35 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538b1d833sm29683646d6.10.2026.05.01.08.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:30:35 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 00/15] SDM660 sound card and internal MI2S support
Date: Fri,  1 May 2026 11:31:13 -0400
Message-ID: <20260501153128.8152-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 21E4B4AD8A8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105488-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,oss.qualcomm.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.994];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

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
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to internal
    mi2s
  ASoC: qcom: sm8250: add support for INT0_MI2S_RX and INT3_MI2S_TX
  ASoC: qcom: sm8250: add SDM660 compatible
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

Vladimir Lypak (1):
  ASoC: msm8916-wcd-analog: add pm8953 codec

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |  11 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   4 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 ++
 sound/soc/codecs/msm8916-wcd-analog.c         | 144 ++++++++++++-
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/common.h                       |   2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 ++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++++-
 sound/soc/qcom/sm8250.c                       |  17 ++
 13 files changed, 570 insertions(+), 12 deletions(-)

-- 
2.54.0


