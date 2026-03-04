Return-Path: <linux-arm-msm+bounces-95440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EG0YAcyOqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95440-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8672D2074D8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5F8D6300F1BD
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AD683D3CEA;
	Wed,  4 Mar 2026 19:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W9qkHqNj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156443D6CCB
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654280; cv=none; b=BNtGATVSW2xYgAFJkWxkny6+kgm1GWo8o3ZrMDRQWEqMssOYYx1k0inYoSiR0QRWo7qAND8T/FqQZOdm9pXuRBwkjuDWtS4jogmQlXEP6jrj/pJTcLepyMDpQz4vQfSNUQXImVjOb4IndAfuIuWihGMD/2UDt59OQs5QmJwNRSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654280; c=relaxed/simple;
	bh=zwt+8cIg7fX5j5y0FoEWq599AjOfiWLzzstgXb/2Yt8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=as5Aq9OgMZCYp7l3K0wE4kw6ZHPGT2DmTMqbc+AIY0OCnJDvj4ZcPXhboe48Rh4MpT4CwGDHf/rwxsUu8a8Qcf7fbvNurO5tI5zOyo3T2KC1JILSivdgUt5ucKSt8gs2+knk/GO5aKS5Q2H2Vu7RK84o1/OyQO4xEV/2hy2wgoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W9qkHqNj; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb4081e82aso951368685a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654277; x=1773259077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1b9FLFJOtAoLLddwDw5EYyl3BLOK61boxgEGp9nBc1w=;
        b=W9qkHqNj0cNzMyrm+/g3a0nMPz8hdt+RWJ9bJQhBn6DwdY4fUM/LPUqQP2Jud8bDgQ
         YsguplmH5sOQaQHnYqjwIWkZWEI+tYneAm5U7OlIZz2D5is+yrEHeqJgg3KSsLURvZN6
         nQexByPsXG2j1JwTCJED6nNLeIJCdgFJ0JoLad8qdoaTyxqwEkNpl/FzonR92hWBTaWq
         BobVNrM0ncP4Hl1dgloAR9/Is69FP3seG1JmGrFLLGyDQ/p46sWNKO4s2psbmktk3/at
         JXxA14cqgNh8bKW1RqNjCaiafdWO8rIkrUKImN1bVqsUGVf4KfEQgmcadLIYKCLwLROC
         jR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654277; x=1773259077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1b9FLFJOtAoLLddwDw5EYyl3BLOK61boxgEGp9nBc1w=;
        b=EXbDN9J4IXu13x1QLZGBBR/IWRC4vEBk/lC+pxYqDzse3HwmacNZJnxC8sP9+487bY
         68MD1tnLvAe/OeaOG/i/FifTrG7O0GBFWIZPnxbqOa5FnGX6hiYpjTRnTqNxi+rKUwjn
         nzGEmB+LtqYrrsn6oft+VtIe7JP5GX4Ir3bxckKZB4D0NGI8annkutyUBgMA0C68YlZt
         OPfGCtxqzyKR+Z9TsGzbDOtDO16cr69YpW06PvzdeS31P5mkSQFJhaHmid0xEA05dtCL
         ZO5TVh9FkijuonMMAwWCJR7fwZUWrZMyi3tU1zC7fr46QKm+u610P/OH14TV59V+KcAT
         z+dA==
X-Forwarded-Encrypted: i=1; AJvYcCXKteo1+aepBmmtYnvee+cGxbzap7/7nKCwst5bnd06DFA4YE7CJeDuhjzNlDH02j9AzbbzQqsLMpHqpP2t@vger.kernel.org
X-Gm-Message-State: AOJu0YwfJoLF8kXN5F0dwVd5DfzrCedM0LqbWVw1wDE3rJeJUTxzZlTF
	DZ95LXnbrug/RfyJq47upC2rJ4vq2iqX7JmcVWBAd7xfGCIDjrFJ8bwJ
X-Gm-Gg: ATEYQzwbWpT4am0flGXeUVuNt23DqNm6fGrQ15IJ48cNLjzSOF2zmdQ6noQvFnYD55i
	+fWkjbB+RSPUzccpYY7/j2hfqEGEbRo2f0k9CSQsXwucF7XV4keoCh4se2AT9iOBflJqvHL+yMO
	PrVCX+RrAUQCe8JL6TuyKTl7ogldg6NDIvY5VwDsPiT8tJ3cMKMg9qvHDZMvXh3azCFygOrexIu
	eBeyEjhNB1DZAop2i3OuZninrkHxkvSL5jTSNnrB+J7h/59NCRmQDYrGwj1B37Qs3U0NChrsLmn
	acFjGPnBwGrMfitKAEAwMC6bUDoxZaFchyPLjvmqHyxSeWfvrLmQd7SR5q0tt6whj3L01E8QVB9
	ryQXLtYszf7sxy/8eaCfQ06c9dqR/OKToL05cZIso7iNP7dTPosq4lG0Zi/DQXJkhYk8OKxSaN/
	m1Rd2df3vKisVAtKjuLXKJ+8bMhw==
X-Received: by 2002:a05:620a:199c:b0:8ca:fdc1:cc9c with SMTP id af79cd13be357-8cd5afcb9c4mr406353085a.76.1772654276950;
        Wed, 04 Mar 2026 11:57:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a0485ca0asm65014246d6.11.2026.03.04.11.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:57:56 -0800 (PST)
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
Subject: [PATCH v2 01/11] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Wed,  4 Mar 2026 14:58:05 -0500
Message-ID: <20260304195815.52347-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304195815.52347-1-mailingradian@gmail.com>
References: <20260304195815.52347-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8672D2074D8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95440-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mainlining.org:email]
X-Rspamd-Action: no action

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.53.0


