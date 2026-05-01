Return-Path: <linux-arm-msm+bounces-105498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEV8JI3H9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB74AD940
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D03A23014741
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:32:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83AD13D0903;
	Fri,  1 May 2026 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dG/8zoHT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2602C3CFF6D
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649547; cv=none; b=JfcwxIVjs7cK9tykxczLoBUvejFMIJnoInPmnvbj9nmL+FGhl6ndmttXogfW/FFfRz+mflexCzEZlaEpYZsU9dHSPSpD0JXsOClMJtytVnSpVCHs7V+pU82KdfPZaG66w+igseuIk3ZvadajtAvgemDEPls70lED9SfEosQ5EzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649547; c=relaxed/simple;
	bh=WkQUxS/816U5853s3MLnvYSUgDbpQorPDyga4dqZbF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzCE5krGTLG2I1RUvwYi5LaFW+yFMJnhV/d5IYIfNIx4OS8C5AEn0l6PMGNUQ8g4+KOb7UBldgozFAApuOeRxbkbRuQO0nInOWub9xQoPcZN/qwaoh+sYMvoFa8KbRKjwwKpSP35Cc4wkvD7+4MJ9KBC54kQAcZQB5DFRMUzXVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dG/8zoHT; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b5232009a6so9192236d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649545; x=1778254345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=dG/8zoHTjG7GwlEoUscDOij+2eVVCWjM4TTI+fjb3IRVxkLGWAFikaJ7MWt6lPJ6R+
         QbQ9ywnfU69+01gZQDpPqasFx5mxN0zWQNrtgdqFNhcJEtgfUg3YaOxs6JxV6X4w7uOo
         ASCUl5/LfGbtP2W4ytbIuR0LP2dxoN3cHCCGfc/UERuVKK1Z11i1vODqS/thOTlG+FMt
         VUmo5TMihaEW3DMw1TYo16x/sBXSXRWjlSISmQNOGEdBH9TG5axvjHCQHajupToICy6W
         ldWIwJOcASqKA/VtS4lr1eMOhAbW/0TZY7jzH/25Pr6J/aNau4m0aUAS/CZ/Y2nNbWIz
         WICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649545; x=1778254345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y8JJrRMxYy4HOqBZzGEAGcIIyvVzUrj6XAtjrL3wzn4=;
        b=hUL+RF9ME3CQRH/1nN5IF0AlvCQ3jCqq2CgLmQHXkdwaB9Lf/+tM/Htk9wILMOTxVE
         ngeGm8oSE8fixKeLoaAv0pjMLq2JQ8929VmgImlmGnOKp7m1XIGZxsEVT824i5V+kFsc
         XnvtT89369kNmPEAxk3q+1GFhkUqWfCoVtfTa2CrNzVSrNHJnlIHVa+FVeU2pt9l2Gxg
         aWMGaj8Bn8IrAzIck6aNYzhYnBhxyVrl2zLnK22Qm3aNBKx/Gouol991M4nAoZM3+FGC
         qsKGWfZwILLsLj8WudaFNDXYKwuRRG3f2iE0Aj1bxfZ1m80iym3+mZ+p/WdinMzdihfG
         yrZA==
X-Forwarded-Encrypted: i=1; AFNElJ/AEyQyP37V7sGCR+QzYTUtx2/OtDRUSPoaP7nfNVqxBlWg4H49mBnHS2+XM59M2gjiPcZLCs66zsN0fWki@vger.kernel.org
X-Gm-Message-State: AOJu0YwMN/XlKmdcMpWu0einBlsNzAPkTFZPw2Hv+0myjNW0E2JXHYob
	fl3kUCcgNsKsGeupFhZnpEksDUrmA2oWjEZYJtXdS2X8XsIGIYkXiF44
X-Gm-Gg: AeBDieszdoqg3NM3GXy7QJnwzcmRYzfXv2H2zP/Hi2KSuwL91U+Bkt3+npnufd0wGk9
	DcG+WCWOApkeN6Hhr3ygtoS3AfylRnvGlV8sDH08PMDhLScwxCQ5OTAcOzOgSDB65wKgqongQRm
	UMk8Jd0kn+DwaFjuUkUeU0dwgi2N7AYT5129RM+WxoQo1e9JVRCswyyT0+TYXTHtc5qIFaxW+Ef
	tS5gkoNFr0D1Yz3vlB4/2Pe84lVhgRx+KxYY9+5+cn8P5VJuTAjaOmvpAXyffCPMIRTl/B0eMkD
	zUSk9G8cQDZrnzBeoI5cFW0BMZDuIAcd8peXol5xU/RWupl/umrWVvdFr7irtx3w/6kJAgdPUbx
	GDrjbHUmzcUgZJSOn64KZMYoGc6dpAi8XABJVrWWvq1LdEkoHEv18MTdoKTjXIrd/q1YghruLI8
	gPnS3X8rJDTuwY87QjSo4zg6sQfSIa1qCIaZha/74F9ZTLTJG0Ruum1hVO3pUQbTErTNsUlfGkS
	zDXeLfTOLnJ0xsGllRNRGdzkA==
X-Received: by 2002:ad4:5aeb:0:b0:8ac:a154:e156 with SMTP id 6a1803df08f44-8b3fe7e7316mr114395476d6.29.1777649545206;
        Fri, 01 May 2026 08:32:25 -0700 (PDT)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b53c1dc606sm26653506d6.31.2026.05.01.08.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:32:24 -0700 (PDT)
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
Subject: [PATCH v4 10/15] ASoC: qdsp6: common: support headphone jacks connected to internal mi2s
Date: Fri,  1 May 2026 11:31:23 -0400
Message-ID: <20260501153128.8152-11-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: 0EDB74AD940
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105498-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

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
2.54.0


