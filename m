Return-Path: <linux-arm-msm+bounces-82030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF0DC62622
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 06:20:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DAE884EC4E7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 05:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 879A5315D3E;
	Mon, 17 Nov 2025 05:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b="SuvLuWQY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223D314D38
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Nov 2025 05:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763356640; cv=none; b=L4ziQ1+T2AvvE8G7jDz/3qdoxkr5X5xbHnb8KRGOH6L8xsLBy8/pYXDmWQAg3T48aDMxJYO24n82wUg4hP2WmRvrYHulRuxFE+bmGgsEhmeX4DQv8iruvQH8Twzd2hw6jPjoehyVnuv+5kQY8IBhU4zNcbOgb3Vas7e829Hv8qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763356640; c=relaxed/simple;
	bh=zwAbN1jSkzgifiPWeOIX+imLDGlZUonQ0rUamTiQsUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rj2Eq38wOoZ0CZPxFGrwPyT8tthHm09gL5ozkB4JJXB97A2zSlSrBPCtS4Mc5xBSbeWikzvrkGg3djidDVsCMmyJfmJI0K+m4MGTTk0bWF6qdxxSgzKqRpJXVbv7deDonk1ikYmT+AawPIEmF0iAcvadtP67Oo4sMjd8gpQD7B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca; spf=pass smtp.mailfrom=marek.ca; dkim=pass (2048-bit key) header.d=marek.ca header.i=@marek.ca header.b=SuvLuWQY; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marek.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marek.ca
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8a479c772cfso257149785a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 16 Nov 2025 21:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek.ca; s=google; t=1763356637; x=1763961437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jp62wB1yVqkDM80xkGTiiFM5Q8Ole5hpi2t3ZT1mQ/c=;
        b=SuvLuWQYS0xfKOLywtnR4IlIk+1PgeWGKDUw2atOxVod9Pdavi7XqhXCg1BMtHwEfX
         XjcA1zYYHQNIA54pFo34/eCA6yGdct4PnROMw/fU0WN3V0kKRuZs+j/Du+Y5ZT8qzuUs
         zyJmB4M4WtB1JoeGIgN5luWQY96SbeGSU2RW+0JD3zbiqguJZiClAZpF71IhLrRI80oP
         2l/ME0nNdxRgwz+oLaCsTgnWkKSn31gVpA8qc4IioBEWuUGUSGsgfo7H2puahUB7OOeX
         YhV0MyEZHD0CJZ0TAw1oI1j42egpNoIF/x8ajDzUhZ2AKML3KPvfdWbotuf6qknaE7zx
         wgpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763356637; x=1763961437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jp62wB1yVqkDM80xkGTiiFM5Q8Ole5hpi2t3ZT1mQ/c=;
        b=SQRd2oEUSgWEm/B11vafcYhaJZKo+biOuSR1uDRYhi6QqVj8UNxRrv4flELPslehHV
         Cq1y0j4JMLrygJaev+SsR2MLQilE4Xd2yLmQebWOhJmuSNXC74sdNIuLXBqOILigBmkA
         hVMinOcdu2zmEtmsxp2AIiRgYzyq19u8M9d2ewlOMjYzfvoJmODyyMvXqqJvMXusYVjC
         z0PSJD+SUG4PzplFX1Myi52QvHTIYiKhJ2Vcs62eHZig/9tbpS7Rm7ivnV04/Tl8x/9V
         6M3lIMUehgWf/u4JVlX/cbWKNJO/+gs1bkbcteZQ1bICHe0jmFq7W90glGXpOIqtJ3F2
         nyCw==
X-Gm-Message-State: AOJu0YyyUQR+sBUrRffPSFm4KGg7xFFk2PgX1YyrY530WQy0LPnx+Tsc
	iBC++NPmyU/6PPZ395NJLSNtx79VpkTM22DCqUG18+spilOarHiITsvDfYO1ncSWdLlb3KWj5qv
	4cUm7
X-Gm-Gg: ASbGncvdfwNsQCweIiCDpXJ/tpJAaYYffU9Yp1c6VZRivuaVyPaIMpk3+5+53ZAvs9m
	55f36FOiaaYZgGbRb6+lTgtyqM5qnpp/AiQptR6iDhjfQx+CXBqmnEk9iwrWgcn3tyEIVXGtIt4
	ycGLPqnxIxvJnMVx0TIlhUUdKk5SAWp1SHLfZn0DOYfQB9iIbdtVbSko+aKW4K1zT7KR/oUip0O
	/K3fT+B5rZsz53o43alQFlUTEHZpWDPGKxBMqhiD6G+FDARn9gCgFAubPGYK450CYrZLxtwlYHU
	H2yo3gRVd2WOOFRuatYmXKmnXVLaSZuLFKnC9+ngEBfCRzdYwJj6O7wofvZ55bu0Ut65/iv5tB9
	4ZnBrHH67dBSzma0EhC9GzVeRDzv3d+ADp+8klCN+RIcONcnDT3gdRk55TBvdtXQoayu7Z97aWL
	5J6J52JbPVr8vjG9+DyfAgyFlBGJqTPQukpVx4ra2iX0Ixwz/60ihDVoU=
X-Google-Smtp-Source: AGHT+IGd9XDGIBuUfYxjhlUxGNpf/d+bDsyCFqlvjLd/umf0a3yk0RZS4q9Vc/ICsjo22DsWIDO9OQ==
X-Received: by 2002:a05:620a:28d2:b0:8b2:e565:50b0 with SMTP id af79cd13be357-8b2e565546emr512257485a.1.1763356637399;
        Sun, 16 Nov 2025 21:17:17 -0800 (PST)
Received: from localhost.localdomain (modemcable125.110-19-135.mc.videotron.ca. [135.19.110.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2aef2f936sm906417185a.29.2025.11.16.21.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 21:17:16 -0800 (PST)
From: Jonathan Marek <jonathan@marek.ca>
To: linux-arm-msm@vger.kernel.org
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org (open list:QCOM AUDIO (ASoC) DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/9] ASoC: codecs: lpass-wsa-macro: add volume controls for mix path
Date: Mon, 17 Nov 2025 00:15:17 -0500
Message-ID: <20251117051523.16462-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117051523.16462-1-jonathan@marek.ca>
References: <20251117051523.16462-1-jonathan@marek.ca>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This allows changing the mix gain registers from the default value.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 27c8c060cab19..2a814a5d2d1f0 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2248,6 +2248,10 @@ static const struct snd_kcontrol_new wsa_macro_snd_controls[] = {
 			  -84, 40, digital_gain),
 	SOC_SINGLE_S8_TLV("WSA_RX1 Digital Volume", CDC_WSA_RX1_RX_VOL_CTL,
 			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("WSA_RX0_MIX Digital Volume", CDC_WSA_RX0_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
+	SOC_SINGLE_S8_TLV("WSA_RX1_MIX Digital Volume", CDC_WSA_RX1_RX_VOL_MIX_CTL,
+			  -84, 40, digital_gain),
 
 	SOC_SINGLE("WSA_RX0 Digital Mute", CDC_WSA_RX0_RX_PATH_CTL, 4, 1, 0),
 	SOC_SINGLE("WSA_RX1 Digital Mute", CDC_WSA_RX1_RX_PATH_CTL, 4, 1, 0),
-- 
2.51.0


