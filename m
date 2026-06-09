Return-Path: <linux-arm-msm+bounces-112252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fyusExZBKGpqBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2850C662738
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="Sz/6mxB3";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112252-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112252-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8A1AB3089E93
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B3FE41C2FF;
	Tue,  9 Jun 2026 16:23:19 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C8A40683E
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:18 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022199; cv=none; b=IUg5LLes9HyRlgckx50OlYeLlgsVtnmIDrgyCTxxrIXmHhYvM0jLX0mR5Eh1LL6BZKKOBbUeGwei5h+zmdSCNnMkjMIQnl4DGjWd5jYeHEOBHeImmP8JQZBUDu66q8agfxCPwYyPnMHKz8hxczQYpIaj8MdaRuWtUMmbwWTAacw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022199; c=relaxed/simple;
	bh=6vUCGaF63VdoccYiTvUVMsMgGqYjEw34fYPFFOoTrN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NlrNqSC5Umf3ro2kx1l0qCST3byP+Vz/Wnt/NoJu/qjzXkeytytDTM1K0TZAkbuT6qR6KfNwdn6M6ws428NAz0ctmyPt/ODgWvzKYMGDiavLySj1gcnGS0Co6JYyz/rp17YK3Oe0LlShrznHqlckOTYF1iA5hsgnzoHcAmEYpLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sz/6mxB3; arc=none smtp.client-ip=209.85.219.45
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8ccd1f57b32so59745836d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022197; x=1781626997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=Sz/6mxB3/Aiwn+RWo8hr6rUsqZJ2+ZpqKinuccRffSvyPHIMkODGpCnUmjfj549Tcg
         qFF1pzATk95bQBL5qFUmspDeSvB2+PK9qnwvD974Ofb6q3JsXguSybP67nZLLPLEvrR9
         VCbSz+k5jb1ZCBzdFXWQUejsZB5F85R6d4QNtPPKjvIN8auTzmoXeBNUG8wj6vEqGgEw
         NWpU1hoRzedvFFQ55sjY6Q6cQtysVRbPTR3z/Qe8Dx8Dk/NpeTtIg7fKEQ6/KCOoOHOO
         yqodtPigILFSImSuMmTNxvuyUZLY1UyZ3UtyTN0AvgfGWvCWERATJ2+FESLm3MCqvLkx
         lgkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022197; x=1781626997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RrCuZ9cncdLFw2IWDk3WqZwfRxngglcAZOkJxY5zifM=;
        b=rESZTwFMOrkHWukI6TyXhl7wx+tGJV81OLDeHQAqGN6NjiUeOF2Fgnyf88fKPQrBlC
         bV7JEHKgiy1++WhDNegFou6H1Psjs/oo6sqVDwjrVLmDxkWO1fzEtGct1NFtgXXHU2X1
         bZykxHy1ZXvRmr2tn2BlaaA8VffUdRGfiL8jbr4ZG6YBHnWY6E3LNfLIc16bknx8kRL5
         1VkeV6WSq42t7PK4RqMmueJyFu4hac/TtQu0VCgcvsaO1BmL0UATe9+quzScnCzcW3rl
         H440y04lrdvw79zJc4+8OAIdmDRw3PdsawBstIer7TK/9rFTbsk71lyaENmR17kAIyRu
         uo/A==
X-Forwarded-Encrypted: i=1; AFNElJ87EfHk22yXLuMilksz9ZiAfghOS+CRPMDHh1Y9KrLDn37GZslAY3WGTes1UzUi57imo13bM6hUwMZxxNNs@vger.kernel.org
X-Gm-Message-State: AOJu0YxMs8TTb9j3XJrCw/3vc5k+4mO/+sd5c5q9uJtF5chwPbMjBUkx
	OjVnuivzVqaUFjLgJWXI4PehPp5HRCHAL3rG1FUBtMKn431w8oeGtxKs
X-Gm-Gg: Acq92OGgGS7/TFl5G1arQQcUFIJmYilDCNp7T6OwUTmUabAOVZKKIGcbWEn6EWcthqk
	zr07/qInCzcXvzC/O7u5AyYAyRgJfkWiN3GdNJYOKH2MgXXQl1NtJhh9//5XxNdwYwt7jnJOvfl
	ZuSuM82NjSKplsyI0DVb9590tHrWSMZmvo0jojH9CS3dTH2pWZP/X2UIIQZEYWb6/rFNlsgRs4V
	mek1/XNssBKX4AMxtsbFPAQzBj4v4s06KRIMGbIaqq0IJ/i8lLaHpwqdnhYyVigJFWphkKayFbP
	w8JDbGecXjJwCX8jkhuPFSPAcPpRCUDOXZge7vAv/HMiZ+cO6LQDYwE935Pzvp1mJmmcbBmDoka
	jKR8/P6nlOiZXiOaoTf1KPFPkr+HxN6W7HgGSV13VMBUZgE5ryylP0DO1z+eeEa6N9wPIf52lRw
	my2GlCT83zAcfLECYf6XbaB+puU2wD7lr/xUjv7A2e9yU0PgUr
X-Received: by 2002:a0c:fb0f:0:b0:8cc:f0b9:1f3b with SMTP id 6a1803df08f44-8cee5ff3b4emr249375006d6.20.1781022197371;
        Tue, 09 Jun 2026 09:23:17 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccda0904sm208055116d6.7.2026.06.09.09.23.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:16 -0700 (PDT)
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
	Adam Skladowski <a39.skl@gmail.com>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	Johan Hovold <johan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Tue,  9 Jun 2026 12:22:52 -0400
Message-ID: <20260609162255.31074-13-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260609162255.31074-1-mailingradian@gmail.com>
References: <20260609162255.31074-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112252-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:setotau@mainlining.org,m:a39.skl@gmail.com,m:vladimir.lypak@gmail.com,m:dmitry.baryshkov@oss.qualcomm.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:johan@kernel.org,m:kees@kernel.org,m:ckeepax@opensource.cirrus.com,m:kuninori.morimoto.gx@renesas.com,m:mailingradian@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:a39skl@gmail.com,m:vladimirlypak@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com,oss.qualcomm.com,kernel.org,opensource.cirrus.com,renesas.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2850C662738

Add the compatible for SDM660 and SDM670 devices, which can use the
support for WCD codecs connected to internal MI2S.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/sm8250.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 1952c599e004..76dc3a3f4a31 100644
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


