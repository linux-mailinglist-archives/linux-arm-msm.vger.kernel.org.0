Return-Path: <linux-arm-msm+bounces-105500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eFvRI6XH9GmPEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105500-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D2C4AD975
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A9056301CA46
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CBAC3CFF71;
	Fri,  1 May 2026 15:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qVFS7W5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B289B3CFF5D
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649570; cv=none; b=mFldmT5Yc/Xb66lj+Pi9b67TDfxq+KE89ye/ZwWfHr4PJ2NTsO3BjNL3jImN9s06IKnlbS7IUL4Nx+D4DFqPvjNyOnNU5RBhucVlAAFehxuEvY+lqY3/eGHVxrmXd6vgXM+kX5ZVbiw0MIzTb97jJLKX7M72i0QQpIL9DX6iBMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649570; c=relaxed/simple;
	bh=TalITnoTVgN8hqSEly4krP0OENxfJ38rWqsEvppux40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whm0HaYVvOOQgiwlXluAA8PCeWl91GA+RHC1RKEUNGGifiOPefxddY2LTX4I2Rh7JvYmYmAxBtbJ2A0EMo4NhHRVZM1MRG+IbRWo/NKcK8I2TLrCmj7wdne88KH3Uh6vW01iQxYu/W4VQsn3svWCv+4n/w6PZlRhB1/41UyN5MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qVFS7W5Z; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8d560ede296so227941185a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649569; x=1778254369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=qVFS7W5Z0k/2wzxDPfDGo+paXlOv+BT5UgU07oavsmgzhEjw93fM4xnuyPQRm8hslU
         /eu4EVFkU1zosXlC6SyckfvYDCy2QcxEJJvCX6mdxtH3e/O0ZlnsrV89y01ogx6BFvb6
         a9EhzYUxsPsPLOlVT8ooT6ewvDRxUqRUCx3fCKk1VVy7aN5y+L0O4mEj5bcjG+1u4UAt
         F1xr/d7ohLO+3hwqB/JgIUze+oVua9nbGy2rbJCGoSxFIjY9emKtKkz3PS5KKIIBNYGA
         /IvWGbLBEhcy9kO6xYS+W6D4h7QJAyhGhOtrNmK05Fqn8McgXFfJpOWsbH+bF7TPVvR6
         QtdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649569; x=1778254369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/EEuToxfj2xtrYU96bpcfJV42FkeZzgzuAg8mxxCUfw=;
        b=NnPhc5V8ubTFy/AvjRI87esLMKrzrdyJU4qs3igaTzxESmYzLdFZXtYYUWlEY3DoxI
         nh0XJXn8TCE06/eRF7822z7EDicEZwsJpucmgEIrklLEqyGlqR0Fh0uQrCIrkX4cZrW3
         84XN8zD/eZgYauT/E/uE7XTxyFvYpZkrBycmyyIIaKP6sFhcpeulAtFO2E3MQfs8eZfH
         b4wnrgb5njsJWSUnQ5DtrjksXiYxiQaT1sPDNhPu6ohRM9cz4xEmzudpSXlYzk3hkkSR
         sOhUnj9Jsd6HgVOqopK0gS/Sjt1YoKKRZOHs7hC5ybDEiLaOO6GCdj/qPmOB7YR3g6NV
         Fi6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9nzq6th8XASK+6O3zAZ3Z8wtpgmWbl+e7KSTJCgBMlVWMAlI5qFKbUbL+b71gcAqVwGJTWippoMQLToEiy@vger.kernel.org
X-Gm-Message-State: AOJu0YyGe01tZ90x0l9DeCrTT9Ni5xMd7GSAj0UNfuOtU7Pig00GMRJb
	xh9iyvuznKleITSQf+U3n4SDxoUzGgXI8nnTstG3BqSYU8hTXT/QxhTj
X-Gm-Gg: AeBDietqCw8wSektiOTFETsP0HXY22E8o08NzEV4iyg+UBxAUNFztZ9+483o7XEXSqh
	Gq/b53USucWDovdarSAIJ7jQtbb9Nsn3v65zfFt1qnw8zItC8CDeDEcNcCZV0So8FrnGvtUDbQQ
	8+iJmGwVUokGLQdVQmYcT/CR9QEDdpgJP2OsFi+MYOxKQ3bk7k3Jl0OAvz5OcYhWWVTe9yOfP5M
	9hVpfBsT/r7S/z5mYT/O3Rms5IrsuRqPu/LIJKQ4ZTvEpJTllO15o3z9Nsm9MBhwJaC5qdgKfVG
	YDYuA7PlHICRRtYZuKH1m2kI+S7mJXhQ/ferVQaZmW1tXgGSHxtUM6m+E9neiMpa5hTwADl68hS
	GJxfgsVHRYxshqW/pAqHUoJgoqLLd/FophgTGYqayrAAx/AFGcvXUd5M0zkqaq47VsCeMwHcTsP
	C1aEDqI/4zhbey6ntYTI8GL70GBAkSo8wDiZszv486Jd+QeBg=
X-Received: by 2002:a05:620a:4551:b0:8cd:8a55:510d with SMTP id af79cd13be357-8fab1c4ef7bmr1029971885a.48.1777649568576;
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c34a0d4sm186890585a.25.2026.05.01.08.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:48 -0700 (PDT)
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
Subject: [PATCH v4 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Fri,  1 May 2026 11:31:25 -0400
Message-ID: <20260501153128.8152-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 39D2C4AD975
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105500-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.991];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index b8f1c91725df..84898bfff7d8 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -210,6 +210,7 @@ static const struct of_device_id snd_sm8250_dt_match[] = {
 	{ .compatible = "qcom,qrb2210-sndcard", .data = "qcm2290" },
 	{ .compatible = "qcom,qrb4210-rb2-sndcard", .data = "sm4250" },
 	{ .compatible = "qcom,qrb5165-rb5-sndcard", .data = "sm8250" },
+	{ .compatible = "qcom,sdm660-sndcard", .data = "sdm660" },
 	{ .compatible = "qcom,sm8250-sndcard", .data = "sm8250" },
 	{}
 };
-- 
2.54.0


