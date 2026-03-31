Return-Path: <linux-arm-msm+bounces-101148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHQmFhskzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101148-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 19883370C0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 57FC130F7690
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05843AA4E5;
	Tue, 31 Mar 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDFVF5HA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891F73A75A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985988; cv=none; b=rMdJVoJNcO+JxCWsJvgw6HhTVJRgvPyqbGWkCI9EfOAPDyVtzbB7rmKu1hdsYVwjjEm420sRkBsahju6bm+iabkHDPz6WLkE5ddGZ2DYVpHKLXkcDq3YqSosGDAqWPbZP2qG317KXjsaqdvyHJac8WzNcxwYWC0vlkm1ldnI/EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985988; c=relaxed/simple;
	bh=q14J6u6/DDiRdWQxGeiAZIu9w8r0CAe4FGRZ0vW5wS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNsvl8wvRDUmVo4K7R+BbvOWwdjsGeD+CD6kD4HqWZMFocRwJo2ImFN6+VncfON8I7HL3E4gc7P+9fRQajvP9rJ1BiVIxBFtdEfXnn+AjyHJWLdoEpTv/QJQIAai8y/QSHJnAi8e45yHJxyfw4l5ZsEIeZv3Kqbl+umkhs1X26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDFVF5HA; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cd80f56b27so564097785a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985986; x=1775590786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sv7lS1+YROEJimKMMLDI6QUWBEi7PxK/YXU7MB7NaxM=;
        b=YDFVF5HACiyH/mQod88wTw6EY2ORp4XUah2QabJ5KmqEUN6XwTw+70q0q2RyB4gWOP
         UDuJ7mYc20rQkaLlq0mJCv58l41CE/lUVY7MU0bq1pBaeVV54oXnTYgJdOWOePSOFqof
         pyG9h+6z7hONxgRQ3bkq9UeAUulA+VD0AdqjjaHW0Qmr02i1uThcX8YJ3oFC3IhrbLRR
         sBi2/xXhHlj3+5aL8d5334RIoRrdv8Yh6as0wHmSy/H3xZFiENNtd6EDzRBKL71rCOAP
         95/343Lk6Y3+/FR+HpCrvJ7/QEHPAAOm7vaKSNXEfxyv0hg4R3j7v9Ocuc1mn07Ke7Gg
         m08g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985986; x=1775590786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sv7lS1+YROEJimKMMLDI6QUWBEi7PxK/YXU7MB7NaxM=;
        b=RXikBrNki93d9m77JR3iy0M86RACtVIxAAhmOSbV1JGR+YuPM7oOfUoyl7e4nkkgGW
         N1MH8/qqMq2YVI0hV8/safU/VtsQpkm2I1uLgcPWYObB25TQRf1bEOjir13ocIvNqDsd
         QA5YmrhVuKwN/6mwnIUS9GNauuuqttnATIRpfTnlKR+KLat+NHq3Se772fpd1Wiqt+7h
         lKKoxgMd7tkKdcYYrYiMmEp+5YINn+RLKZSsLBpIXOiBOykWSCluuaI9sVZAEcYuRQyI
         zBOvTHRimw0BRg/ROT9ej3okmHma3uiXzixM4Y+As+eik4vcNuY5MWrXj0mEB2bHH77h
         ZKRQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1mR5AbWGQ1mRy+L30Y4QC2SUe3loybkog8EVbWDiOP+vrfv8RTrB5pHdt8Bw4G5W/y3hlqg89kaSaxwK+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo6khZztfp2dzlPWZWfskuP9P6N5HgMdw5TgH9nM7fvNh6TSBG
	QNYjriZpo9ZDO6kzM8gjJATsyOgIPHhpfCd4J3/+IyccSSVHWIu5rKHj
X-Gm-Gg: ATEYQzx3H2YO4Udg23KQ2eIG+kScaaZp7NKojIqpDaxFHDMSQOMpB6+neS06q2cu3zA
	8lvh4MDXb+zuFAWwWgtrcg9K01Jrvu+ejUKRFpOK8Wv4xRfgz/rQF60dfEnpkTuRsV91vn/W8V9
	KwDMGiG5MyFDyf9nqZ9RmASKmombV4qMQNJvxCIV/yV9GpdQcjP1zioWC3+KXE22oWGCBmyxLZp
	ToeJNr0aakdBIcK4cEf5e7GTSgrsVZUjZavJM/Uzji4Oe3WMOvT7kl3DNC6qKopDUAyil+UqJeG
	FhEG8omyxSGnSxSP1WY2rsA3Os4xIXKHSbnteVZzGxOz1d0Hzg2IyS+5CYzjhrgd50BPYVHollc
	WRFIyY56T/rMrz9Qnn29J6qy0+Ar4lAiX9r9RPOxJcF58IMu8nK3inRJepR/fxa3/YXu1gZOBhD
	IUOxfqchBy9PTd4wGetXN16iJu
X-Received: by 2002:a05:622a:5e10:b0:50b:56f7:c141 with SMTP id d75a77b69052e-50d3bcd37e8mr12298821cf.44.1774985986487;
        Tue, 31 Mar 2026 12:39:46 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bbf69fee9sm82693521cf.30.2026.03.31.12.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:46 -0700 (PDT)
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
Subject: [PATCH v3 12/15] ASoC: qcom: sm8250: add SDM660 compatible
Date: Tue, 31 Mar 2026 15:39:36 -0400
Message-ID: <20260331193939.40636-13-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-101148-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 19883370C0D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
2.53.0


