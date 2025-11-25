Return-Path: <linux-arm-msm+bounces-83329-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C71C875C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 23:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 629A434FAF3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Nov 2025 22:40:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94CF62F3C3E;
	Tue, 25 Nov 2025 22:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="hQJVlndk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D736A33B6DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 22:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110418; cv=none; b=T1Q3nJlki1EtOUgL/snOxkXYTJ/vp5Db39alcr8jA3ZQoh835ttpo76MTHcVFJLT9kyFa+WtHawdkU0mVAxb0AItOv3iuEZdXObjkaw2Im/v3I2Hgf0VJzNC6ZHe2+KQPyc6yzIBfoyfxXaNAVgzA+uVYlKHvcebOzSLdYo9CEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110418; c=relaxed/simple;
	bh=63hI60cW0A2kXUjAxKqebVF+B70fJ4xOl5gP6bv2ogU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WwqNNdQ2FxbzDRQund+Z7KhapE+mbiO/MK5I31XXyym1nKyHXswiYAsNwV/3ybuS9PG4GzstJ8E9srGbXhAl0FrThdX4Tzsaijp2K2T9nBPw0CNrtfGOaqUq7WbxnPEOKa22ZSwVm5IxnAF+mFOhH21C4nrw5Qpz0rFOcHlfmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=hQJVlndk; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8804f1bd6a7so56548526d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Nov 2025 14:40:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1764110415; x=1764715215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RKqdsxjaxYQ9qBTCleKAutYC9wp/Vlt9j1a+uEF3bcs=;
        b=hQJVlndkH5SZW1G2NUBg79pUI4pOlLNN/futiEdhxV7LYMUBbF+YW7H+UbQBaQw+ed
         QulUJE6rnckXmls1Ako04d+sUyFTeA3N5J7mpCS2iQdaMobseyzwJ6ljW4JQHQaiTAFQ
         BZfZL5tM/Rw/jQzCYrPsHl+UGlJ86D5rZAs1T3Sc9Z0Kv+cIItBNkt73Aj56vIuM1eyB
         Mu5ud2z8MVJBqVli3TnhlW8mRleKKktF0csV/2F9LMbGhPvTkJdiMJOU2pgrpT3Aqu0H
         W5QJdzgwRoREdMla8YOwcXcTQZ3AfYWrAIpyEJdJ6vNCOc351xY6sEGiJ6Q78jVr09K/
         pdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110415; x=1764715215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RKqdsxjaxYQ9qBTCleKAutYC9wp/Vlt9j1a+uEF3bcs=;
        b=ZLHgyRMN3tHhnVbXPtgC4kdJQE3YnpNhacLg7Jt1ELXqyOzRbAvwzCpJVy/J+PRQPO
         gktlKk4GobjsMrUvDf9uIkbmaNexJP3qSv04UTEfTXcaTYXWIUeU4SD9vf1bx7TmmtFs
         3wp+s+aL0PxhYTDwx7l1CoPffPOnPHw3P2yKIrPnbaNR8NV6caqOiH1DxoR2YHiBQZM1
         Xpe4ocLiLguKEPAMXstkRCJ7tY0308lkQF6UgY1Datu3bGvImnP2PkDBBG8XykgZ/mOa
         z5BgAPFpMlpYpPRE3PI6f4p8SXaVwpEIzHQ8sRRdkUUlSdrdVMla6xi3hHQUzIGxUfSx
         qFOA==
X-Gm-Message-State: AOJu0Yxvl+A0FjgO4NuvHyXicLlE2Y4KvFSec149KnSDJZSXEPc4UK2F
	FNGQe+X2AdMjzUcJ1lP2pdQwJNe7SkAIcvs+RTE3JSjBXew3WMhSPAUND3n8KqUNcJA57QECuFD
	00L6w
X-Gm-Gg: ASbGncte2SrjBWvhrbD2SUQw/LnyYeNnHbPeyPpTvkW8DZgzYCtljpXvYgd+AR5uIIw
	sKYqQFwdP5EAHF0/yVS3VxEXSycVTLYkYWFlX1Mcuiega3WlDWFsMtSxeuhUipxOnSM+Xoi0Ki6
	7NvMkNLxiAh6EXyBkW6v/Jh7rFaQfaLiSxx+jSZOFqP8fseUjyfiVcsQkElHzcy64YMNWJB+Q1a
	5GqPp0b/737L5lO4OBsFB1fGUtYa3YhkOZ6VsBzcWUTQerA8pfZ90/4tQblseuopE27Ad6zOe6F
	hJPhQ8DGcbhpXUG+uT94svDOxYzCCBdGupX/bVFigFEh34mEFSrSkUJWOT2KsFmmDp8mNA8qrVL
	K7rfXM7vih+v32qurear7wtCZaoFWL3QwY26s5XMq4YXCFOehf+GWTd6YmhIl79ooky2TTyCc5k
	l8zLD+fJoxF9X3pVs5XwxZxmaSnJDwPwlqWmFH6du9sTuGJAHYstYmu6nL7GpPpOiPOA==
X-Google-Smtp-Source: AGHT+IGwzQF1RVlze5saO5q1MJ5UpXwaodrleAw96nys+mPTP5G8nzPLfH3PEWmAqJ10Ag6iVp1tAA==
X-Received: by 2002:ad4:5ba9:0:b0:87c:651:da29 with SMTP id 6a1803df08f44-8863b0030ddmr67313546d6.35.1764110415392;
        Tue, 25 Nov 2025 14:40:15 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e54e9e2sm132836336d6.31.2025.11.25.14.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 14:40:15 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v3 0/2] ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
Date: Tue, 25 Nov 2025 17:35:31 -0500
Message-ID: <20251125223848.1798-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2: added RX6/RX7/RX8
v3: added second relevant patch (to be able to use all the ports at the same time)

Jonathan Marek (2):
  ASoC: codecs: lpass-wsa-macro: add RX4/RX5/RX6/RX7/RX8
  ASoC: codecs: lpass-wsa-macro: use ports as the DAIs for playback

 sound/soc/codecs/lpass-wsa-macro.c | 547 ++++++++++++++---------------
 1 file changed, 257 insertions(+), 290 deletions(-)

-- 
2.51.0


