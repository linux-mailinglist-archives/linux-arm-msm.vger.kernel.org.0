Return-Path: <linux-arm-msm+bounces-101136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP8nDdgizGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:39:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 41138370A39
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3CB27300A27F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A28538BF70;
	Tue, 31 Mar 2026 19:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rlq2GVUE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2758383C79
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985938; cv=none; b=FXRrkb9EWzMaU0dDgdQpwAvNERA3V8+HtbSdmyLYlHQj9R06npplT2ubU4VFVU8zGyQxCPDTj2m94JI2Qp0aq94FgP/rRJR/GuBavy/y7kcpWDwj4zRRD8uIy2L/+je7uckxJANd9rWfDgN054gGVRtQFG79fiUfc4zWm/bCfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985938; c=relaxed/simple;
	bh=Pxep8ShXgtazO+VGLSFz5P/8yM01PvWE/5lLNXhS+c4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kaBmqoYamYBSURHjjDifqI6eOC2EDdJLYEyVbhAn5EGRQ3I0lD92JUcP101Nf/44VKTOFmm8DjsnD1uDLvRNgATXGCyw3st0ZtSSmfLLiQRqYk7FO1KjJkbVa+4JDlhcOhsOj2Jkl56ngOQBCXjdjUSzrdzzqaxXcn6sk83T37E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rlq2GVUE; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8a1e1817db6so19777216d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985936; x=1775590736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GgqMDBgsls8VrRcKBAMepiA5qSxovZCXP/eA9qZEiNI=;
        b=Rlq2GVUEmV6miBuIPgLBlOtNxzyA3XN9NyApdVbUBKhiuWZiaAih5HZ2TF2wxiCqwV
         YLfp34RPAcQnNwN0umdsX/0ZazW+TVRT8s86PbYogH86oGYZW5LDssllZxjpbjkzYu4k
         8OgD9QZd2B70jnz7sob+34bdAyhaP3L/0hyjJvvhasWjiuN4yNyPlOHReK7xX0Hifotw
         pWCDnvg/CHMLCWKTqmiX4aPp0YAdT8RYLpJjLtItT2g2hkai0hMgysquNjEiDM+kPNE9
         UpEL+ecrYSkgM2i2kJUsLSnRUjuuI2gy+Ag6izrjWED7ZPNLuK9B3opmSbdznMu4tmYu
         57GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985936; x=1775590736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgqMDBgsls8VrRcKBAMepiA5qSxovZCXP/eA9qZEiNI=;
        b=SnWb3QJIqT0iyNP11FtQgY6T5EUfSI8TULVe3iCMftjQ6TqRISdKLiWI9NXCruXg+i
         Ad4D+3w2fkVXReRG0x9qOUhrqyhGcugUQGYxZ29RBkBYQ8ccpBJDwP/D85qq68vaMjRl
         TmxU+/55xwnz1bqu0xWxa/+FJeTkGpZRU0O61PwegnFdiVdjqq4QymZylFFLnoXu4CoQ
         bXmM6tUFHLUATCmxAkMm4Gpdayub4yBFeIG7lswcLNVDURw0V27tzCrlT5L75ybaSocw
         zDa0OM90FCRlLpvKTAzXhtCfWpHSKiBigGWX/WCE4x3qrJpyjBehiqgk+rh0GZDvPiG0
         HnQw==
X-Forwarded-Encrypted: i=1; AJvYcCW41oDC+2wSxTrBw1P2JNBF2kd+AU//vcyGP6FgTUY/ibADLJPHzjU8X52r8wT4ZKPzvEKuow6h0ACpB8S/@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3KLB9KOwNwpr1T2lul+iX/Y4AGTnPJl2BtioXcqZfo5U8yxb5
	o6yrsq/S9nL6bWFytA226pfCCcBAU+OmJdmND0NwQpXIG7xDnNx88yEbY615WQ==
X-Gm-Gg: ATEYQzzUunnp95BvhkYK0rnNuc80EYUkrz2O/gdTYaOMSXD5Iyzz0xAB8OCNf18tqeF
	PT6UrIVgyMkRx7MWXAowlVbwlbolS3qesu9MMS2/SZnk0rKHQsW8EVSWCjHwDnYtNevbgDzJWUA
	Rh53eIJmoOAwMg4cQJXkmSNN5HhiEh+8nhNpIFGo4XZYNtXxETv2ap4EKc54F/kIcm+TvCn2x8w
	bTlBhkE0ToEHoO4F2qLv9jXhezqvIOGyO++XyCQfOy+fefCCQwW1uQ5qWSYmdSncF45mg1kY/R2
	71SwoZqKDrqtv7gdFsk7trZgxL8ZjwNlq99ImrWq949dwv+BavByfy8r0bhy/9r/KFTS8I3DptQ
	TivTh/z0u/qHwAbAG8ztrghjqLr/HcDIOMTwHCHyovz90kIJlYnMuHJPVy+35Sp6/tTDTh+ZBhH
	5jGxZgUKkgCW5WlTJ1EXuaVvVU
X-Received: by 2002:a05:6214:4e16:b0:89e:a170:6b13 with SMTP id 6a1803df08f44-8a437b10430mr13147896d6.20.1774985935785;
        Tue, 31 Mar 2026 12:38:55 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf865ccesm95864616d6.39.2026.03.31.12.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:38:55 -0700 (PDT)
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
Subject: [PATCH v3 00/15] SDM660 sound card and internal MI2S support
Date: Tue, 31 Mar 2026 15:39:24 -0400
Message-ID: <20260331193939.40636-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101136-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 41138370A39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This adds support for the SDM660 (formerly "SDM660 internal") sound
card and support for WCD codecs over internal MI2S.

Like on MSM8916 and MSM8953, some SDM660 and SDM670 devices connect to a
digital and analog codec. The connection to the digital codec is through
special "internal" MI2S ports. The digital and analog codecs are used on
the Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece,
and also on the Google Pixel 3a for the headset.

This series does not include devicetree patches.

This series depends on "ASoC: qcom: q6dsp: few fixes and enhancements":
https://lore.kernel.org/r/20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com

Changes since v2:
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
2.53.0


