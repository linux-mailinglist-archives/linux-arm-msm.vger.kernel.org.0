Return-Path: <linux-arm-msm+bounces-112246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xMFeHXNFKGqYBQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112246-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:55:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F77662A87
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:55:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ZfGDmFNQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112246-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112246-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E278633EA0B0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 202653B4E81;
	Tue,  9 Jun 2026 16:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257D3BD62F
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022191; cv=none; b=fPqyWmcP6kBJ72KrfE4MZ/HewNWhpqWIbmuwHAvkuQHCpbDHR0gL+YqOBbNI1R/+0/sZk/kk89pIQhaOkQoAXUJMiSMqPAjcc5bCE7f0KvaH3sSppMxUx7dda9+p7OBMBr/bqLMba+7S6kPBEe7wSIPO/ClGLPaTM38ouJBgoWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022191; c=relaxed/simple;
	bh=X1blx1IfE/S2XwILbwkaFERfov8+N6iDeA0KBsBTu58=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M305+6dEAytPgdFcdzGL7GaJEaP4FhXNEftfoV2hnwnvWg9inTWcpoUdKH5CM8AfKqOmNwpHdzXSK6O5JIz3kMB4ft+93TIYzMxnC3Qo++d7MAs8FzhXAJoAPulgeRpK1Gu/g3UkmFNB0tRIrwLw/CKINjHAreNeUFaiaTKWNAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZfGDmFNQ; arc=none smtp.client-ip=209.85.160.174
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5176b9c476aso43308801cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022187; x=1781626987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=ZfGDmFNQTlPMuQFOxLrT9CSXFf10VS74NMxZHwbTU6KIcL8NrS/Tsim4TEFa+CGmrA
         hEYCTiZPprtTR6mCqZVRgu7RIhLjeU7HAEmD0uW4Kc7uRceyWR6eUC+ienZUiX4ggYj/
         3Ba5C27Cig4WRqq1O7pBqldnKor4zveh4KHrDdvjc740s4foVOiKg3ffsnfazoqnvfKo
         c0Kc/AzZK+2A/x7rHyIwaVWZDyG1iC+qNndog3y/VHmJC66DE5h8QjNnhC3YeHm2jbbP
         VDkMORQ3zIs4VA6fpKqSnDssjP/MMbqVGN0P6jT9P/oWkR0efL2XjYqeq1tuQKxrZnuo
         u91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022187; x=1781626987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zeJyh4JLdoSrIjHhlptP34QNHBNQ4psdrJrN26Yex0k=;
        b=XU3g8n1Mq6TOcc+LO+0opyOgl/ynEkEwvt6lDMgpOOPAT5VbeaHY60+UdP+TWTO05n
         hoKjvkBq9gKTajlaHbLXoFc+Fwe7dPRPKIodxjQEXc73D+p2wlSPnX7bUxmWefHkB4ub
         0V87PFyLywlBPasnS4K8s2seQa8NtVPbzAkdCgnN714mti7S7Zpz4LHwkRimjJDJxuQO
         1yfLD/yDInOsx3Omkc6psZ8HNJybwLv7T6b8kTqGbodFOr5DDhxPYual+gUCJujvHuuU
         E0q8O66lGesU4qp/yGsaGbsIr7fYfA4h+8oAgABHheSWr6WamVWR5uWuKuqxB0ubD/qT
         BoFA==
X-Forwarded-Encrypted: i=1; AFNElJ8yy4U+yY85WunFkpreSqZ4Gb+NYCyUthat9x2iY56FjeOzPfazbjfmlBfYbTfOCfutkRA5t2+zWuMF7I1F@vger.kernel.org
X-Gm-Message-State: AOJu0Yykmbks0TwpPI+FomvgVcTVfAVMSyVf5lIhK39Iz5hgXTmZOzoz
	Ry9bbfWuqssWM1owVmc56JEL0seE3ocfeAx/Dxh9VXWh6ArPZ6COABPu
X-Gm-Gg: Acq92OHv8Re5/PW1aFTIgoDk0AzZcceL42UhD9Cja+5KkRR2/cfb7ezUhvAhjtyChQA
	CdPFxaoB43oudzKz2UjpeM23WrevTuXMyknid0mPZjsoFEqaHQMQFJjgt2Vs0j8eTP2JhNbsyIV
	nGuBjhcfqshSc8wL91nA8DVphgH6IJcIatcOKecS8NLWwoeOed8vzhYwJHWvuDiwWTDzanFkzJi
	nIkJuzd79mjlUFMT21u/4qcdrmk9hrJISKxlweuiOAojlJrAZ+bJC6q1Uw+hKbHxbW+a4bvYCC5
	lMCHzttSwfAyRq7NBj1qVebgtHLmTsivYrb/z3pm2NTs3NSqNAwl9N+dxxxv2FsSHO+3F74WYBN
	gtJ1mDrHSbDjct0Jz264rGN/BIUUDSaVxG3Wh9qcIOLnX0N3zbzp0RCKqYTELGH84M4eRNxHNJO
	N5OAxQv0ZxuPR9nTvoZZ0YYMW3sJXNxyBqKMoFeA==
X-Received: by 2002:a05:622a:98e:b0:509:23ee:b9a5 with SMTP id d75a77b69052e-51795a090a8mr287909751cf.5.1781022187522;
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c54177sm209351671cf.12.2026.06.09.09.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:07 -0700 (PDT)
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
Subject: [PATCH v5 06/15] ASoC: qdsp6: q6dsp-lpass-ports: add support for lpi mi2s ports 5-6
Date: Tue,  9 Jun 2026 12:22:46 -0400
Message-ID: <20260609162255.31074-7-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112246-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E5F77662A87

Add the extra LPI MI2S ports used for internal MI2S on SDM660.

Link: https://android.googlesource.com/kernel/msm-extra/+/530cffa4cc977a348753831b163eb9d3302b954a/asoc/msm-dai-q6-v2.c#4597
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/common.h                  | 2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c | 5 +++++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..48b114eb46a5 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -7,7 +7,7 @@
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
-#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+#define LPASS_MAX_PORT			(LPI_MI2S_TX_6 + 1)
 
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index e5cd82f77b55..c3d8116ad503 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -553,11 +553,15 @@ static struct snd_soc_dai_driver q6dsp_audio_fe_dais[] = {
 	Q6AFE_MI2S_RX_DAI("LPI RX2", LPI_MI2S_RX_2),
 	Q6AFE_MI2S_RX_DAI("LPI RX3", LPI_MI2S_RX_3),
 	Q6AFE_MI2S_RX_DAI("LPI RX4", LPI_MI2S_RX_4),
+	Q6AFE_MI2S_RX_DAI("LPI RX5", LPI_MI2S_RX_5),
+	Q6AFE_MI2S_RX_DAI("LPI RX6", LPI_MI2S_RX_6),
 	Q6AFE_MI2S_TX_DAI("LPI TX0", LPI_MI2S_TX_0),
 	Q6AFE_MI2S_TX_DAI("LPI TX1", LPI_MI2S_TX_1),
 	Q6AFE_MI2S_TX_DAI("LPI TX2", LPI_MI2S_TX_2),
 	Q6AFE_MI2S_TX_DAI("LPI TX3", LPI_MI2S_TX_3),
 	Q6AFE_MI2S_TX_DAI("LPI TX4", LPI_MI2S_TX_4),
+	Q6AFE_MI2S_TX_DAI("LPI TX5", LPI_MI2S_TX_5),
+	Q6AFE_MI2S_TX_DAI("LPI TX6", LPI_MI2S_TX_6),
 	Q6AFE_TDM_PB_DAI("Primary", 0, PRIMARY_TDM_RX_0),
 	Q6AFE_TDM_PB_DAI("Primary", 1, PRIMARY_TDM_RX_1),
 	Q6AFE_TDM_PB_DAI("Primary", 2, PRIMARY_TDM_RX_2),
@@ -712,6 +716,7 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
 		case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
+		case LPI_MI2S_RX_5 ... LPI_MI2S_TX_6:
 			q6dsp_audio_fe_dais[i].ops = cfg->q6i2s_ops;
 			break;
 		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
-- 
2.54.0


