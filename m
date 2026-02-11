Return-Path: <linux-arm-msm+bounces-92542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEnFH5nji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92542-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E3120A6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:04:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD27A3079FC9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C2402EDD7D;
	Wed, 11 Feb 2026 02:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJHO+cOq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330422EC0A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775359; cv=none; b=mCNHvaeKhIooMdl6i5zIkSHMvxXRQU6h//ineKSE3QjvditvkeSrc3SBVbrYQ/4yeWBxnmVADY8F6cv3IYp5bedQFYZWVRoHWfuyUo3go/oQ0K91ws5bMeBrdMY86MEYcnUQJmqAe5sWqtwaBaaHOd6vg+FR0nKJ/QdXhjweUWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775359; c=relaxed/simple;
	bh=7iBmMV3IeRy0dczSX2iF4AnGnzqaHOm6/o61iS3KdUE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q+3+wR71+BC0SqdWS9y6VsH5kTpX1M+DmULvZ34RD6m4mG5CePYJ210G8gK9bQsRgdNqW1sbWSH104hw2JuotVR4JY7IZD4Lw+UfQYmION6oKJ9jEIi/qnfTdxf6Mn8nGL9xntYA6/sOwdjJa3N8Dh44VYPjdH2ny8hupbBTOVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJHO+cOq; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5033387c80aso6097861cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775356; x=1771380156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3/DkbEFqHBXb0M+n8zjFECxKzYIFrSQHVAtTa88e6U=;
        b=RJHO+cOqU6ciJeMZF1f3ZWHVW2w+Ito1H5vvjIi5r9Co6ohbYaLewKbsm9Ko0DMAJy
         WSc+rna3ne9Rf9B9HGriwr3TaOeCWSmZz3YnVOanYClkiwdyMaqrkiaHadzAx5mbAe/I
         PTyMsoWnZPdpNnDAxVNjOVHDPOaWYXrw6T1bZ+Xek0iy5lcROOBGYqCphdMMiMWDF+1x
         B4a24cmGHhCRSTQhutPr75wZ7wEqc3Z2dQiJBOoSsGPpKUSItXi1xPnHkYW0r4Uettyw
         QCpxIjuoq9d6AhNrybFF5mCfF7FlhrD0lwucZc+v7cvBEEj5hwAE5KezA5iiGZcDGlAL
         krNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775356; x=1771380156;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z3/DkbEFqHBXb0M+n8zjFECxKzYIFrSQHVAtTa88e6U=;
        b=VZ/0pUslOyEN5lXvwaWVzhWqKfwa3WUHBCIEEEk3VPXxDbIIv7OTYwCJQ2G6k+AcFK
         kMvh24+6+yFDTgGRs/LW3ii5v1bQkPjc4c6t8rldy8VjBlC7SfWWnu2D8DJGjRfrgeyo
         7lj1uyRNNxkGwklV1eKtFedoy+y1ErgOyVkwSj3mgxCIupgYXTW43Q/3iEW/rDzc25Wl
         h1uK4awcxyejI2VzNOuj50FoQtYJ/B0l1XTBorbARwZl0IKQg1L/wqvdcRxkJ1mlRodH
         sngfxRR/GnTKovgXibEEeF0J+Eh+Ju5E8lhHjPprZNXyUQSkcSM+3ZVEoACIarDywQTj
         BBYA==
X-Forwarded-Encrypted: i=1; AJvYcCW+73ltrKqbZEOFH2UfKSp61UiEMInh9aLZyAZefTgOshO0Yt6TV1Fo1dfFsTSUnDOvplo9FDQm/fSj4tKm@vger.kernel.org
X-Gm-Message-State: AOJu0YwqkkFr7KpAHcGweNmfvizB9hTEtjYOu6XQLmJ/xDGYLRCPxWPY
	FQnZIarDKxBosCOml6Pw8ZBy1NAvaucqSaWJ0dgTYPXIACcmffm/Yr2a
X-Gm-Gg: AZuq6aKAwp4VT4lEQ0U/tynq9iDe1YcfymeACm7+3ygGq+IiL+M78tzKiSAne+5wHoF
	f779KwxOy0cWrqm+c4aLCUMDGyA235WP6l9jQ9Hk14dUgoxK5C0AnpLOe1vv52/7SZOXu+TI3oZ
	p8CJaLj+FnYeOiRBnpWtxfpdKn1mboUYNYRiYlNyDA21nRTFWjXopGuPirnD4otZ7pZlgVILdrC
	pQFE94lMO4gRjjy9u6N+mELpWPuamR517Din+qDPGcJbWNqAuffYfs/IJYLf8Q5o4EgfEzQE/4S
	RfTGXCW8LAYLOpCQRnUeEYJLLikCc3nmrH0qjmfBrl5RTG29uvOUXMkOv3yqTJKGWQc0CEyTdeh
	7rCb+sAU5QQSRwYXi/7Ovh4bjE2fbbCD0/bfFkFaSDwba6dspcE7pEcVPgMS5U7xDgr7GwJQ5Yl
	9juJH8ejj4BIFQ2+hGCYyka/YnbA==
X-Received: by 2002:ac8:57d6:0:b0:4ed:ba4c:bda8 with SMTP id d75a77b69052e-50672e01149mr50112371cf.18.1770775356032;
        Tue, 10 Feb 2026 18:02:36 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506849f8af5sm1685621cf.14.2026.02.10.18.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:35 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 00/10] SDM660 internal sound card support
Date: Tue, 10 Feb 2026 21:02:52 -0500
Message-ID: <20260211020302.2674-1-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92542-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 204E3120A6C
X-Rspamd-Action: no action

This adds support for the SDM660 internal sound card. It is used on the
Xiaomi Redmi Note 7 for headset (playback + capture) and earpiece. It is
also used on the Google Pixel 3a for the headset.

Like MSM8916 and MSM8953, the SDM660 internal sound card connects to a
digital and analog codec. Its connection to the digital codec is through
special "internal" MI2S ports.

This series does not include devicetree patches.

Nickolay Goppen (1):
  ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660-internal

Richard Acayan (9):
  ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
  ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
  ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
  ASoC: qdsp6: q6dsp-lpass-ports: add internal mi2s support
  ASoC: qdsp6: q6afe: add internal mi2s support
  ASoC: qdsp6: q6afe-dai: add internal mi2s support
  ASoC: qdsp6: q6routing: add internal mi2s support
  ASoC: qcom: add sdm660 internal sound card support
  ASoC: msm8916-wcd-analog: add quirk for cajon 2.0

 .../sound/qcom,msm8916-wcd-digital-codec.yaml |   8 +-
 .../sound/qcom,pm8916-wcd-analog-codec.yaml   |   8 +-
 .../sound/qcom,q6dsp-lpass-ports.yaml         |   5 +-
 .../bindings/sound/qcom,sm8250.yaml           |   1 +
 .../sound/qcom,q6dsp-lpass-ports.h            |  14 +
 sound/soc/codecs/msm8916-wcd-analog.c         |  63 +++-
 sound/soc/qcom/Kconfig                        |  12 +
 sound/soc/qcom/Makefile                       |   2 +
 sound/soc/qcom/qdsp6/q6afe-dai.c              |  46 +++
 sound/soc/qcom/qdsp6/q6afe.c                  |  56 ++++
 sound/soc/qcom/qdsp6/q6afe.h                  |   2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c      | 200 +++++++++++++
 sound/soc/qcom/qdsp6/q6routing.c              |  78 ++++-
 sound/soc/qcom/sdm660-internal.c              | 271 ++++++++++++++++++
 14 files changed, 759 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/qcom/sdm660-internal.c

-- 
2.53.0


