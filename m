Return-Path: <linux-arm-msm+bounces-95439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGyEB8GOqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95439-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:57:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59962074C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:57:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A40930217FC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BCF43D3CEA;
	Wed,  4 Mar 2026 19:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OF4V1Ie2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2869B3D6CCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654268; cv=none; b=u6jiMUBhdi+KlZudY+OkdcI/cXSHANIhlG6Xu/Seq7eJkOlwpTIAzVZkY1B+xp8tVmBoYuVrMYx6iGVsZkP2kUzdOvf2Cpp4N7m13PjIAJiK5KIXlOu8mJb0vkz8G8L8T5hCkXi0Rakg9+9DNWVcd+ChP/vPd6pHiDl1L+3n3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654268; c=relaxed/simple;
	bh=BgdtRCrG+UT4Wjl3MNPFweAAAvfm5+xVSgZzPOCJs5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mS0yRE3THUzkQXOTrXE58sWQf3mMSdWeaT0bY7tEPEYwenufLcjgD8PCTW2ul/eBM6/9ASvUO6CxGr5sWhF/HnAtyn+JwAyLUh80Mzmb4I1EK77xpnCq05iVsC3AivL7ijU9uDdC4Ie7MpMrp/uBpgsef/Nb9o+r++RxtURadhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OF4V1Ie2; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-89a15b9a556so19835706d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654265; x=1773259065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kZuBqMqdE2cR1Kb9L+99KXcjTlaXgNSs2txRlLKnKaA=;
        b=OF4V1Ie2vaqPUvtWXOIagQfe3oQZchFCCIEXpik9fK0YwPOeg3Ao1cmYKy29tUZyXY
         J3gOR4oHo0KJkWOkgRZ/Fl30twFijBZL8d4cVAPKZGZYkVY5dc+/S1VMoKaQqhS0rMPA
         s/kR/Y9kAaYLSs5+S4rMJwZrwSzvjdSfZNUUQy5ml9HIkiCL84mGr7sMUlHjtu+1jUwJ
         llxZzfAKu5wn+M2pFdyYz2qGYWPrPZ0usOpbVGk6p290G3sefmms858+0SSRIQ+3O4hg
         WlQSEaB1GL/0uSX2gCVVvYyJFvnxIwuF1vNvMlmMTGqta6ZjN19kCe22YxAphT3uHTG6
         lH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654265; x=1773259065;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZuBqMqdE2cR1Kb9L+99KXcjTlaXgNSs2txRlLKnKaA=;
        b=IAusPfp41Y6x4FASME4rIAaz+5VSwjcjAvZfTSzMlmkhmN+Zn7lvgB2KX/X6ECfGo+
         oaDD/KthTRlhYpQFM4DLfemDnozHbHCrkUb44T/ysJEqpGltLLlvD58a57S/YiW0S/B9
         HhxlvZUocyXEbs+dzsM7IMONvufuPklSVceVaucEiKLZSlnsGLuCuW2ovHgr4BAmFQ4y
         0Qh6ND0fBWqc39I9dG3LE/87p/DqLWZ1wHQp1AGOq1rekPTtG1QvV9VirM2hsCDhBkd4
         VlkEhj+7Ba0ulDi2AE3KLG7TdDzKY7tc4LW+ZTVLJjbsAlFnbf3vEeEF2EmjPhuBSy2K
         RQTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQyDR3t198/wsH4czVJisVTaUF4jgy4vp26ccSbzvM5hR87fu74WVTAgUsUIzcnvwu+F1k437TQNRj75an@vger.kernel.org
X-Gm-Message-State: AOJu0YyoFsQMBZB91k1Udcgac6xKHzIsQy6I0dd4gadD5F3VSFxW6kCN
	2a1g2pB0EvSI8sm6EcDJ5/mqJfJ5WkSTvZozvd/ohvGNcLM3W6h5SVXE
X-Gm-Gg: ATEYQzzi4KhcMzBLrnger6diQKQzb/0RwfG5iFLeD3NhWFkVISe+2BHvN8dTIstms+V
	ngRldDCdP5CSJYPzZly1JQHP8UwgX86nwiwozS/B6PMxuyhAKP6rT+RcwnuO84ohqXEQfeRjKQJ
	wP8B7vj5xEtWFG5CAl7MgeIyHXQAaM9sLS9WJtwREm3/fCsgFCWb+tXMjL03zm5wtBurfTl9pn3
	eT7CCLb0vIfYVp6JvxPzn8AhW+2b9tWKc4WR3TrnAj0JarV1TrFnDnbRvmDiKZT6yiaSmcryUIE
	bLGjKECJjuDXJF2Pz6gAwqCUu+yGl7zwItCSNr9mzXpMe19FqvnZOJvhZ/OM9egvbgsFt6xDqLU
	WMOlo3AClFMII/VBq10fFYPtn+DSqprV3lTfSf7Ik3ZDw3urAOcwVFWFhqwX/d80iPQEur8ErGO
	dzSwE8+AAHRfPuBKC5JSOb6OS1mESrjk5SShXa
X-Received: by 2002:a05:6214:21c2:b0:899:f8c4:5c with SMTP id 6a1803df08f44-89a199acacfmr47559586d6.22.1772654265116;
        Wed, 04 Mar 2026 11:57:45 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899fc21676fsm76028846d6.22.2026.03.04.11.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:57:44 -0800 (PST)
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
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 00/11] SDM660 sound card and internal MI2S support
Date: Wed,  4 Mar 2026 14:58:04 -0500
Message-ID: <20260304195815.52347-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: B59962074C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95439-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[mainlining.org,quicinc.com,linuxfoundation.org,kernel.org,opensource.cirrus.com,renesas.com,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Action: no action

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

Changes since v1 (https://lore.kernel.org/r/20260211020302.2674-1-mailingradian@gmail.com):
- rename sound card to drop "internal" (1/11, 10/11)
- use common headphone jack code (9/11, 10/11)
- remove no-op code in sound card driver (10/11)
- remove inaccurate comment about clock consumer/producer (10/11)
- add review tags (3/11, 4/11)

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660

Richard Acayan (10):
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qdsp6: common: support headphone jacks connected to internal
    mi2s
  ASoC: qcom: add sdm660 sound card support
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |   8 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 ++
 sound/soc/codecs/msm8916-wcd-analog.c         |  63 +++++-
 sound/soc/qcom/Kconfig                        |  12 ++
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/common.c                       |   1 +
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 ++++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 +++++
 sound/soc/qcom/qdsp6/q6afe.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 ++++++++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++++-
 sound/soc/qcom/sdm660.c                       | 192 +++++++++++++++++
 15 files changed, 681 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/qcom/sdm660.c

-- 
2.53.0


