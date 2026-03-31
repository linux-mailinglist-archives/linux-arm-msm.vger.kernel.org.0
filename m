Return-Path: <linux-arm-msm+bounces-101144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cCEWAwckzGllQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79D1A370BD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:44:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 582F030E8908
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27778267386;
	Tue, 31 Mar 2026 19:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IumWai8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA343A0E84
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985972; cv=none; b=U8NWNnne5uKWAvG0fSw4SMi7fTFh1Cu3SVMye0NaUSESuwoVoUwSZrbmCL/Tw5VfXOIjC72FArNaJKCq90uESTMDvWKkK72bV4N4rXJPolFAIEKQChrlcJMduW5v8DorS9/oR2Ju+L5M1198MDU7p8JuWlXvSwEVvH0PSPHc/OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985972; c=relaxed/simple;
	bh=I6GOdWlyv80VkD62lfoN9e2XJ3JK8Cex75Bv2RJpnSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSaP1aAOy9CNNLEL8r6kGscOnDoXokwNlf7Elqy8rDRQ9xlbdPBF9wBO4ou53XkjS3A2gUF7MBH1HO79UcOIlTk3fNAmBL/ONmh1sb/Pjklk6uP4VVVit3BeIbLBqU2Pag0RJB8sXhSVJL7osCGlP1BT6DT/eoef+DDmKHluEOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IumWai8W; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-50baf2df711so37592541cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985970; x=1775590770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=IumWai8W4z9pd6QFwSQ4nJUYHui0di0qW3DNh6p7eEF3LxP9Yv6nPx7k+EHstL9YTP
         AeIqW5cvr2Lc/4iuF2ATJwNjrKlTL6z0oX4h8YMPCYPSe/4ERWo7gfHX46m4txyA+s3L
         cUWKZIyE/6XO1mO2n9tXeEincMzHbzfyD3//x4tmRyq8A7eg593gqJk8shZyxsSRJbyb
         twTXoQnYLrW3H5qDvV+RrbD7lcTWe2+9T2ghApebe8fr/+AY3G5muQe26AAJFIOgu8ge
         HzEBGtsFkwrPysBYs+QbNlR+dZCo6JKGhcoLWPnltQT8LLUE8m0DOwWQBGU99/cqZihX
         8DCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985970; x=1775590770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uHV0JqbiQZymbMCtdLcU7ussu4cx/THQpTwsM76Wq7Y=;
        b=SHwgRIs7aYRC5jyshx3Xr0tIr11GaNGX1c52PsjTQDuNJx/pEapvjfOjDdZxaZQeCD
         LIJKyYzpQgAXK8NkEPHr+bpbn4fUUxzfgK8M8W1pZ1Gzapk5EEeYVVzmick8AstboUXi
         iPhE4P9YD43yQ5rBM6qV8bmx8VdCxYyQ8xgGznEy61ADO8ZiDTp1TyLlCOg5UY2RAs9m
         IjQakuxdvm4S101omDcHauvN5+lBXVZEjCZAoRUo/XEjKl0GVX+12LoZoetM+QYtkV0z
         K6PkXmDEjmNFjHu04yFdPcUYs6EWmevHWYnF72xgln0dPDsgbQwohAxZbHCEi5nBygbH
         +XrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVh9SbHl4v6YtuhgszHJq9vKbkxHfdamgXORI7HvTmCPrQTZuk0M7tDf68DsRDJOc/cVeNDm3C7sisueGYB@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0xX7J6xTwAEKeX6Lmzk8/+YdUaUljwh/uhyGPbSuQnvA7BAP5
	9nyvhZCl6Jad0zHPIXY+nXQw88j1W9ne+6HMoCtdTnBmBwxdq6TgwTMb
X-Gm-Gg: ATEYQzyjSxaayCqxPQ9U3oBCp96NMr+P2D0Wlt7D1gLHO7+dsiHRrvsopbb1FS2Wo9C
	lo2GXh+PP5Wqk8jtefx4jt20d7kamS9ZyNZEwYEH6iaBAdGV8Z5linmOsVX9GVqko6BvS9//O2V
	qIt4SavRenFoyNKWcOS+ONlfr8viveCogMbtaVCFb0eFddNKAxJ/BNDLn50GpS/eqb0EsNQCqhk
	PMUOKxxUm0Fy+4zKJbKmeIP8XzDzlqppBkthZbXX2AXtpWtETzDl0B8znex4Rk9mfNZnDar7L/V
	Wlz9e5nxXtSK4pnSjhYrhlJqyhAxeGZ09mp/ULgP1aKaRjdoh8qRpYbida80Ktc2tGJge8p0cuF
	7Fbw51FXd/JmsP3OX7cgfJiZp/rHIGQ+eEwUguYkq8Pt+RSe4HJMzj6JKx22cQZsIQeN26nboYS
	gZ8L6gkLbDWoyGGfQmNEj5yRcK
X-Received: by 2002:ac8:7d43:0:b0:50b:2f1f:ffd3 with SMTP id d75a77b69052e-50d3bd192fcmr11885061cf.59.1774985969720;
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2dd8b81sm96873221cf.16.2026.03.31.12.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:29 -0700 (PDT)
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
Subject: [PATCH v3 08/15] ASoC: qdsp6: q6afe-dai: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:32 -0400
Message-ID: <20260331193939.40636-9-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101144-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 79D1A370BD7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the internal MI2S ports found on the SDM660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe-dai.c | 46 ++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index a0d21034a626..34ec3bd3ea8c 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -412,6 +412,7 @@ static int q6afe_dai_prepare(struct snd_pcm_substream *substream,
 	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 	case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+	case INT0_MI2S_RX ... INT6_MI2S_TX:
 		rc = q6afe_i2s_port_prepare(dai_data->port[dai->id],
 			       &dai_data->port_config[dai->id].i2s_cfg);
 		if (rc < 0) {
@@ -665,6 +666,21 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 
 	/* USB playback AFE port receives data for playback, hence use the RX port */
 	{"USB Playback", NULL, "USB_RX"},
+
+	{"INT0 MI2S Playback", NULL, "INT0_MI2S_RX"},
+	{"INT0_MI2S_TX", NULL, "INT0 MI2S Capture"},
+	{"INT1 MI2S Playback", NULL, "INT1_MI2S_RX"},
+	{"INT1_MI2S_TX", NULL, "INT1 MI2S Capture"},
+	{"INT2 MI2S Playback", NULL, "INT2_MI2S_RX"},
+	{"INT2_MI2S_TX", NULL, "INT2 MI2S Capture"},
+	{"INT3 MI2S Playback", NULL, "INT3_MI2S_RX"},
+	{"INT3_MI2S_TX", NULL, "INT3 MI2S Capture"},
+	{"INT4 MI2S Playback", NULL, "INT4_MI2S_RX"},
+	{"INT4_MI2S_TX", NULL, "INT4 MI2S Capture"},
+	{"INT5 MI2S Playback", NULL, "INT5_MI2S_RX"},
+	{"INT5_MI2S_TX", NULL, "INT5 MI2S Capture"},
+	{"INT6 MI2S Playback", NULL, "INT6_MI2S_RX"},
+	{"INT6_MI2S_TX", NULL, "INT6 MI2S Capture"},
 };
 
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
@@ -1011,6 +1027,35 @@ static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 		0, SND_SOC_NOPM, 0, 0),
 
 	SND_SOC_DAPM_AIF_IN("USB_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
+
+	SND_SOC_DAPM_AIF_IN("INT0_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT0_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT1_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT1_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT2_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT2_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT3_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT3_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT4_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT4_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT5_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT5_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("INT6_MI2S_RX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("INT6_MI2S_TX", "NULL",
+		0, SND_SOC_NOPM, 0, 0),
 };
 
 static const struct snd_soc_component_driver q6afe_dai_component = {
@@ -1045,6 +1090,7 @@ static void of_q6afe_parse_dai_data(struct device *dev,
 		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
 		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
 		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
+		case INT0_MI2S_RX ... INT6_MI2S_TX:
 			priv = &data->priv[id];
 			ret = of_property_read_variable_u32_array(node,
 							"qcom,sd-lines",
-- 
2.53.0


