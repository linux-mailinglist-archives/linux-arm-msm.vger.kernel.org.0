Return-Path: <linux-arm-msm+bounces-112247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4ebVIORBKGqkBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D136627CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:40:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=XxyofvzP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112247-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112247-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 091D233EB2F4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB35C3EA94C;
	Tue,  9 Jun 2026 16:23:11 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DC33B5850
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022191; cv=none; b=Qj9t0p6qNpf6RRfdD55hDFxPymn8/hnWbYz6gtlznmtptauRp8S9QPcdWyVfDcjbz+43TIh39W4qmn4WC3Nxd8xqdHdu6V9iaOoaKpg4pxcsriDIB6cfKtLrvjFxyjV8dRpoOeuWNcG4Nrb1zT3ugyJmovNHPdOjoe9z+X08bHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022191; c=relaxed/simple;
	bh=FK/Xo1+7OGaOkUMRMndcsjKlE3LLFqQDd4IY6JS3dEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cqTfMDGeeWqObM2j3NwJJBwdhXunOEJ3gYaDheS1S289cvVjB7FmE+5IFcCfE8kib9Lfs36Sby9Li6g3NCZ1yb3/u3TQ8atzKMoD565w9Af5Cah6uRTutGKaEl1cjiWzBhrrm8W6JvvDU7/ueHU/L40AN6N3JoQRCL2RlorteR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XxyofvzP; arc=none smtp.client-ip=209.85.219.54
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-8ced8f44da0so64350226d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022189; x=1781626989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lIljIJwduZvXpP8z610S7tWjj352/Xqlv3KKQxCSOtM=;
        b=XxyofvzP8xqPWtzaX21MQdb+s44e5kZ0xFcX8PRCROtGJ9Y/FIL/FGiGaYlWI8gSdN
         rZaS5N24PHwNM0HwHeG7XOmLmGHtW+UawwSVK2G6rEiMBP26p14PrZJRCNYVqIGaGKdK
         MtomORml/Z7VQQC5yT/SqBZ/LspjitYQxUbPO+CqdGBiQ88wNVbxL9AlNES/TJNGKl4c
         buA3PRsJ6GpIjhSZ0vINaxSHQw5iMNRA55KUGD9JVCYLVIIKfw8y+SRpsgWT375VvqH3
         LhcVuhGEwvQMRB4yldK/mmJnWBEQ0af4atPZS5mAy4Ce6qx+ZKrqx9C24wfteMVQJNME
         +OKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022189; x=1781626989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lIljIJwduZvXpP8z610S7tWjj352/Xqlv3KKQxCSOtM=;
        b=E7tuXUkR33SwC3HHxBOBMYHgR3ttR0G44hTPhWcqoCcKQrGozsFMkwyvUQTKaPQQK/
         0MEwBIYT30+t4gPq3eA0UaJVEInS1xqSJtmM/e+vcWnul9kZe+9JJST76JFgquxN7G30
         OoSu1l9kH+xfx4lG4SeoZRlD0gPCF51GfSEolKjhOTjam10HalBASLjTzt0EF0+1eSPK
         uGJRF5LRsGAIkfJ7S32yVrBRnbcguLk6esqDcWR9t6mOHIlp2kwkm+awi51eo/aKEUuK
         pSFTVPotgsbbz5QbSGWfT73NwPLnLTyH2ThgEhXx8S3JHRx85h7Zm9qrFUTgENdFA1eb
         wYog==
X-Forwarded-Encrypted: i=1; AFNElJ/TKLMmyRqNeBsC4Bq3rbRr/9m1sgaIVFlu5Je+BLHlKKMkkvNN92PBuSDjqTGlKNgm3ND2wqKaeuc6yvEA@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJxBNa1Io5aYembcMHc2VJEuV77GsaGkpCfR6i1DkvhwMU/4A
	288IipkQEx2UKpzCdUJY5nFdYL8ypOtSd5urXODlPeQOkTrHPE8w0oNJ
X-Gm-Gg: Acq92OGZDcyd90ezlxDQMxhnEmLrmGNO3rYgcHI4RjGwcmMI/Mu98b+vf63coAh5toP
	G0lO2jBfwoWk8Lo+HjXPrrAUMWBOjxoOE+u8tPs285HVds7cqdcm19s80grDeic9VqOKfL61xd0
	8gyZVVUhmrDQd0SfLeBYIPivgNP3D+ZDFujE8hF3CC/C2U7MIrS6pGdXd0Zjh8/tCF2FZ0j8a6J
	Ef7wfJAYwA2Ul4oa32OYTFaH/fq5h+LCNMK8U1OM4zJwXIxMsKUAi+Zo01+S6jhm/skEupti2e8
	iZ+nkLbExS0Yf+y/UoPHeqZE9uHhJ1HA3ArzdMM2dmDAjIF1uQFoSR+51KNdoCpbdEIvY8YOE7s
	b2P5QhWIkV5RLEzuFTquy/qmOFnragLx+kl9BQIVOB1cc+YjzFCvQkmKBkm/Z2rOu81LtwjywY4
	Oa3RCt3ZAfDHhu6Gr0b1y4wremv71hjHGU+BYtTA==
X-Received: by 2002:ad4:4524:0:b0:8ce:b018:89f4 with SMTP id 6a1803df08f44-8cee6294424mr242129696d6.37.1781022189101;
        Tue, 09 Jun 2026 09:23:09 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd053032sm213808816d6.24.2026.06.09.09.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:08 -0700 (PDT)
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
Subject: [PATCH v5 07/15] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Tue,  9 Jun 2026 12:22:47 -0400
Message-ID: <20260609162255.31074-8-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-112247-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D7D136627CD

The bindings for LPI MI2S ports, originally exclusive to q6apm, can be
used for internal MI2S ports on q6afe. Add the port mappings for
internal MI2S, found on the Snapdragon 660 internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 40237267fda0..1d68a80e8e0c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -132,6 +132,20 @@
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
 #define AFE_PORT_ID_SENARY_MI2S_RX          0x1018
 #define AFE_PORT_ID_SENARY_MI2S_TX          0x1019
+#define AFE_PORT_ID_INT0_MI2S_RX	    0x102e
+#define AFE_PORT_ID_INT0_MI2S_TX	    0x102f
+#define AFE_PORT_ID_INT1_MI2S_RX	    0x1030
+#define AFE_PORT_ID_INT1_MI2S_TX	    0x1031
+#define AFE_PORT_ID_INT2_MI2S_RX	    0x1032
+#define AFE_PORT_ID_INT2_MI2S_TX	    0x1033
+#define AFE_PORT_ID_INT3_MI2S_RX	    0x1034
+#define AFE_PORT_ID_INT3_MI2S_TX	    0x1035
+#define AFE_PORT_ID_INT4_MI2S_RX	    0x1036
+#define AFE_PORT_ID_INT4_MI2S_TX	    0x1037
+#define AFE_PORT_ID_INT5_MI2S_RX	    0x1038
+#define AFE_PORT_ID_INT5_MI2S_TX	    0x1039
+#define AFE_PORT_ID_INT6_MI2S_RX	    0x103a
+#define AFE_PORT_ID_INT6_MI2S_TX	    0x103b
 
 /* Start of the range of port IDs for TDM devices. */
 #define AFE_PORT_ID_TDM_PORT_RANGE_START	0x9000
@@ -931,6 +945,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
 				RX_CODEC_DMA_RX_7, 1, 1},
 	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
+	[LPI_MI2S_RX_0] = { AFE_PORT_ID_INT0_MI2S_RX,
+				LPI_MI2S_RX_0, 1, 1},
+	[LPI_MI2S_TX_0] = { AFE_PORT_ID_INT0_MI2S_TX,
+				LPI_MI2S_TX_0, 0, 1},
+	[LPI_MI2S_RX_1] = { AFE_PORT_ID_INT1_MI2S_RX,
+				LPI_MI2S_RX_1, 1, 1},
+	[LPI_MI2S_TX_1] = { AFE_PORT_ID_INT1_MI2S_TX,
+				LPI_MI2S_TX_1, 0, 1},
+	[LPI_MI2S_RX_2] = { AFE_PORT_ID_INT2_MI2S_RX,
+				LPI_MI2S_RX_2, 1, 1},
+	[LPI_MI2S_TX_2] = { AFE_PORT_ID_INT2_MI2S_TX,
+				LPI_MI2S_TX_2, 0, 1},
+	[LPI_MI2S_RX_3] = { AFE_PORT_ID_INT3_MI2S_RX,
+				LPI_MI2S_RX_3, 1, 1},
+	[LPI_MI2S_TX_3] = { AFE_PORT_ID_INT3_MI2S_TX,
+				LPI_MI2S_TX_3, 0, 1},
+	[LPI_MI2S_RX_4] = { AFE_PORT_ID_INT4_MI2S_RX,
+				LPI_MI2S_RX_4, 1, 1},
+	[LPI_MI2S_TX_4] = { AFE_PORT_ID_INT4_MI2S_TX,
+				LPI_MI2S_TX_4, 0, 1},
+	[LPI_MI2S_RX_5] = { AFE_PORT_ID_INT5_MI2S_RX,
+				LPI_MI2S_RX_5, 1, 1},
+	[LPI_MI2S_TX_5] = { AFE_PORT_ID_INT5_MI2S_TX,
+				LPI_MI2S_TX_5, 0, 1},
+	[LPI_MI2S_RX_6] = { AFE_PORT_ID_INT6_MI2S_RX,
+				LPI_MI2S_RX_6, 1, 1},
+	[LPI_MI2S_TX_6] = { AFE_PORT_ID_INT6_MI2S_TX,
+				LPI_MI2S_TX_6, 0, 1},
 };
 
 static void q6afe_port_free(struct kref *ref)
@@ -1785,6 +1827,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
 	case AFE_PORT_ID_SENARY_MI2S_RX:
 	case AFE_PORT_ID_SENARY_MI2S_TX:
+	case AFE_PORT_ID_INT0_MI2S_RX:
+	case AFE_PORT_ID_INT0_MI2S_TX:
+	case AFE_PORT_ID_INT1_MI2S_RX:
+	case AFE_PORT_ID_INT1_MI2S_TX:
+	case AFE_PORT_ID_INT2_MI2S_RX:
+	case AFE_PORT_ID_INT2_MI2S_TX:
+	case AFE_PORT_ID_INT3_MI2S_RX:
+	case AFE_PORT_ID_INT3_MI2S_TX:
+	case AFE_PORT_ID_INT4_MI2S_RX:
+	case AFE_PORT_ID_INT4_MI2S_TX:
+	case AFE_PORT_ID_INT5_MI2S_RX:
+	case AFE_PORT_ID_INT5_MI2S_TX:
+	case AFE_PORT_ID_INT6_MI2S_RX:
+	case AFE_PORT_ID_INT6_MI2S_TX:
 		cfg_type = AFE_PARAM_ID_I2S_CONFIG;
 		break;
 	case AFE_PORT_ID_PRIMARY_TDM_RX ... AFE_PORT_ID_QUINARY_TDM_TX_7:
-- 
2.54.0


