Return-Path: <linux-arm-msm+bounces-101146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GZCKxAkzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB55370BFE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D87E30F004C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B3E3A0E84;
	Tue, 31 Mar 2026 19:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLlZmuDm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2685938BF70
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985980; cv=none; b=F2FJrM8CO+0FL1K/D75bjjIXaQbgx51xXuFlTFzJqkPDhhidaUKquuZ0NrVEELQIVfJZY4NZTdHkkL/W+mRnAJvYyVUr/Q6E+hLAkXsGzHobkdRrU2XhxcyQxB6BZHpRlexK0ZR9U8dCzrVLe4x+HYVgiMmf+kkqA81G8I3Jxhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985980; c=relaxed/simple;
	bh=BXCnnROK5Jr7XSfuacF1JCL6R1HVhObmmDQUVuRBs40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdOHA9dSrc9mrYH3BJGwiXaXhr/Y++7LYuEAr8uGZBTIpOoEbUXHcMVcTBqRBDkhk+CTgdQdgvYjYxLdtoDKqCd+xLqC+ZSmCmRpMWGX4IEgi/VYnDkuv0f2HzRLF8G3GmrcoN8QQ9dK7omyl0tpp0Zy2Ke7SFv8w4cyQYrGfeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iLlZmuDm; arc=none smtp.client-ip=209.85.222.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8d00cf835b7so788643985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985978; x=1775590778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=iLlZmuDmZuYHLup5n1GYlUrLgsG30yGWK1dmRvP9LHymIEkH5TrKxqjw0MMaaF+bSt
         KvzmyNyiCX3ezrH0WDV0IcffG1JMIXli3QGZ9jes3jQ5QqxWa0UzsqxyT14iZ8pNRtic
         Y/OnmJ6wrKdaovJ9sC4e0itZfHR1JioQsclm473l4nyEPN1d4O7EMBI704pOVhXNC1Hi
         YLWThWz+rPeG3Csvv0b+3T3Ay5Oyq631dgOjuuHOhXtzzD/WaersolRfQSWpC5xVyvHd
         ByiKOmkEskOJ4+g5aUjQd4N5LprhKptx2MgwExqMkob/dGTQcA1yXPfAj5f9v9xhknQe
         b5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985978; x=1775590778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NsXOvrBEVeyjNtjVFKrqAY0t05Kf7cmvMHwIAAt+bJU=;
        b=gFik9FGh0M2iNmOiaeonOPgig3tT6ovTsM99Hv9s/AIAIqByOQLK5MQhi0K1k0vuri
         0S5n4xX/FovxRqRyfhD9dbHtKXmrp6uVVISJnpnVgc7LFIwarbSLExoK7E+LhHRgQsJO
         ZI0ZqvLrAwqNhE4MqOqNvQg7KQW26fHMvOs5OftNLV4JCHcjRyJzUUD8MY9F7Q32FZE2
         yB/o5HCySb9aFd+2Vgpc1ppu82UjrSgmH3C4D2jJOGV1/uZscEYHKB4eQAe1jYv7MhXu
         n98LNXhyofoBoB0hvwWIomZyk+0QDskAy70IpVCoyvtphS7b/pu7LXPEKHL2wCJOZk0T
         1aPw==
X-Forwarded-Encrypted: i=1; AJvYcCXxZw+Ub1ivDV4ufqgYCPYnZudfa+D+mh4qo1drrggdAHhNmmQa4ycmW73KUmnyU7eYOexjMwdJIjV86/QX@vger.kernel.org
X-Gm-Message-State: AOJu0YxyRW9Tnv+Ohf8c9GR8m8ZuWQtReqD3IakjlqcflhaTvkIq26Uo
	3f9VDBBNkkAErifJIpcknCnpvx/lh5lDAogBr1FnEvyZRTpE63LXtYHV
X-Gm-Gg: ATEYQzy5b5gEB8vfEW1mIgscasA+PR4d8UiT7AWGLTaMVE3fGGcMTMzE4l15hlHJhVz
	BSk7uVtVyitY9bQ4E7+ebx5y+b0mRI2KghO+bYvB2ifiJpET71P1M3W87UeAqbSXp+Upyk6aa68
	43aAaZUTI5WVJ8L2R2ZF3uZgkM+33WNj5CtnAAqzs3BXYDZzzL55DxczIIcGNqMaSn39UwNaFRR
	jrE9xWi+6K6KX8JIONWV4brBd8UBRwZ9W2dBOZyWe4rHGXd8p3PYbfyA7YeBKsklU78LkL9gVyS
	VwUD/OGFB0OUu1XQ8UuZOVcBMve/uFVs4m6SLjBtyZLRWmMpVxL6aOD6T9NUug1u2kcvoTCpx4A
	/feM2ZFFVm/e+ly8bjibzxv7SU+Hgj0zxZO6v4UURTTOG9A0frMfZvlSzEm/aKCvrZQ3ss6P8IS
	7z1JgB8eMgS12xYeU/8zMIv7aD
X-Received: by 2002:a05:620a:4503:b0:8cf:c75d:2a0b with SMTP id af79cd13be357-8d1b5ab70cemr159538285a.6.1774985978137;
        Tue, 31 Mar 2026 12:39:38 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806d7e5sm1155303985a.36.2026.03.31.12.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:37 -0700 (PDT)
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
Subject: [PATCH v3 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Tue, 31 Mar 2026 15:39:34 -0400
Message-ID: <20260331193939.40636-11-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331193939.40636-1-mailingradian@gmail.com>
References: <20260331193939.40636-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101146-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6DB55370BFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Internal MI2S ports are connected to a WCD codec which may support
headphones. Register the headphone jack on codecs connected to the
playback port, INT_MI2S_RX.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..7e2a8745594d 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -232,6 +232,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	switch (cpu_dai->id) {
+	case INT0_MI2S_RX:
 	case TX_CODEC_DMA_TX_0:
 	case TX_CODEC_DMA_TX_1:
 	case TX_CODEC_DMA_TX_2:
-- 
2.53.0


