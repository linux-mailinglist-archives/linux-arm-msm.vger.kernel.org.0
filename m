Return-Path: <linux-arm-msm+bounces-95445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEHZBC6PqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:59:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54E207578
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8706E3072674
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:59:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329A03DFC77;
	Wed,  4 Mar 2026 19:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dT9pEEwM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E009D3DFC65
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654339; cv=none; b=fmQ9VB8FySWHla0T0ULqXgPNuIqL581/f53gB8xQQtXZc4b9Y4Jj2SgbDACygeeqDdjjyWHb3BCUVfPckBcELpg4ARXBXOsoIG3u7feyJFKLdfe4mNzF5kNI6UiRZt6OkS3VeyxQhAYWNKoQfQaXdiIHYNGpzZjAQWHO/CPBmos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654339; c=relaxed/simple;
	bh=n6yhyAmeS3XajiqHKaymn5KEifMbZ3zphx1S/Ru4RYU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WoT2s6z2ELY6kLznnwOJ5Bq0ux3f/0D7A8om7he0++yll4NUxW5Ll3cV/UmllYoPdeLH/PH/VgIC4GAwEPAnDfGOszKwarAbbNCGNzGCHiBO2wZjeM2e8rXWmWHWwe7v46xE9hxcBU1SuGH5XAtXU2OaB4BitDg+3nDHsCnIn8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dT9pEEwM; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-506a7bbe9d0so52622531cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654337; x=1773259137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOC11T7iPv7jkYCTEvT6B1pPSxAqE6JCdF/Au33dEgs=;
        b=dT9pEEwM1slkRZzGjbjgudDgXpFTOTlYjub5R6Nkno5XLW8IkHo3WKPQiPM8ZQibPT
         qVTdzQSPu6VJHnznMKJOc4yCKKSk7tMOSO+kmhKrRO6wqZnT1+Raz/Fq5x5ljHaCnSEs
         hhlsF9ST9ATUIiQd4anmzGm0+VOY5Sw/1MxKHEFfcSv53QTM8Cwu9Nv6aang8myzH8C4
         Dc1Y1+7Jz+R3r2iT0Z/RL5A2dP2Ev3fBK0ILitlEPTyuCNZy7AVp9H2IXDmgCwfHkBly
         cAnVnOrUy0FSYUgP5US0pAurmcyGca5YEOlL5ellVfbPnVoMBE33XKaTS+3x6DkyyyO/
         HZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654337; x=1773259137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOC11T7iPv7jkYCTEvT6B1pPSxAqE6JCdF/Au33dEgs=;
        b=kFVWwRprEkUvj2tHfrplzl/s3uy8xPJBL9zMcavSnT8aC9qVoA1lozDjmLCEu1xzfz
         72nFLUS0kj1cNU/8tDRZAsubEhPbRImAzUXcrgIcywcxxtjfmEu2vt6ZXcYHbnJSkKN9
         RZD/qezY5jwXLsvDKaVOkp7DjYQYUux6MoR0AB6fWzYhh8J0mnce9guT777s4rFXDKmu
         NxZK2+BHoKANgSXu/8qqBxZIuRzujMu6dZPY0IVddhlKhnmj09aDQv66x6fXRFnvgqxA
         MoZ9HlBk/GDDnsSq9kAv2Is5vXA/wbkMWyh/0d1o4K3gdDkOUUw6aVcCNNMuu9IHhqH2
         QLVg==
X-Forwarded-Encrypted: i=1; AJvYcCXqchURw2fxLwKTj0t8IzxdElIImVkoM/Q4ZGoY2PJrxMzVWbLtU33w7M8+14vbh+JwueeYNHupD9KLX+2O@vger.kernel.org
X-Gm-Message-State: AOJu0YwfqHnOJJAF1CfgjmPcymJxKjBSkmYv1vfV/J+nBqVqWQWD6de6
	l6oDV8pa6fBf/5pOwtjvcK4Xk9KuEBxHbILYulNuFP3fEtzhJSdkdxmC
X-Gm-Gg: ATEYQzw5n85S/FxUS5vLiG2px2vDzPFoYfs3JzWwAZ9OVP1UAFZgqulFnf2iiMb3P4S
	GTeTY5J+9gsym1r8eXDvcevamwHmWAnr7Dehj9DvCjMAVR8pjAB8gvQzce8sC+e167GLIC+ZOPf
	/Zpu38rQ6WxtA6dZLasISZ25+G9ikqb++isMqS3aL2JsomP563k+9X47yrQQPLPpgynmQ4L33Zl
	4Y7EjQxjNkgfhTk1XzgKdyjmAGl0qfrMzKUSqGrqA842WrWOWPyLoVfELgPpfbVl8BthRoMZecO
	monRxI5sWsIBjtpv/3Jowt1+G/kSae81MhKvAdO7nGfdK3VbiOsICjOE6naBli7Sf+ZYa/CUcgh
	wWjjEiLLo6/UpOOcpiGg9NMAWxtTKZtUbGvioPngc/KlhiaeeN7cJvYsyPuf8DasWRyvlAl1Krt
	nTc4O7Z7Y+ESi9kL8UlBQAyHipRAzSuSyIq34g
X-Received: by 2002:a05:622a:14d1:b0:506:20bf:44a2 with SMTP id d75a77b69052e-508db28348emr43324501cf.16.1772654336843;
        Wed, 04 Mar 2026 11:58:56 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744963095sm180564781cf.3.2026.03.04.11.58.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:56 -0800 (PST)
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
Subject: [PATCH v2 06/11] ASoC: qdsp6: q6afe: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:10 -0500
Message-ID: <20260304195815.52347-7-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: 6C54E207578
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95445-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Add the port mappings for internal MI2S, found on the Snapdragon 660
internal sound card.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 sound/soc/qcom/qdsp6/q6afe.c | 56 ++++++++++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6afe.h |  2 +-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
index 43d877322bae..4112503515a9 100644
--- a/sound/soc/qcom/qdsp6/q6afe.c
+++ b/sound/soc/qcom/qdsp6/q6afe.c
@@ -130,6 +130,20 @@
 #define AFE_PORT_ID_QUATERNARY_MI2S_TX      0x1007
 #define AFE_PORT_ID_QUINARY_MI2S_RX	    0x1016
 #define AFE_PORT_ID_QUINARY_MI2S_TX	    0x1017
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
@@ -925,6 +939,34 @@ static struct afe_port_map port_maps[AFE_PORT_MAX] = {
 	[RX_CODEC_DMA_RX_7] = { AFE_PORT_ID_RX_CODEC_DMA_RX_7,
 				RX_CODEC_DMA_RX_7, 1, 1},
 	[USB_RX] = { AFE_PORT_ID_USB_RX, USB_RX, 1, 1},
+	[INT0_MI2S_RX] = { AFE_PORT_ID_INT0_MI2S_RX,
+				INT0_MI2S_RX, 1, 1},
+	[INT0_MI2S_TX] = { AFE_PORT_ID_INT0_MI2S_TX,
+				INT0_MI2S_RX, 0, 1},
+	[INT1_MI2S_RX] = { AFE_PORT_ID_INT1_MI2S_RX,
+				INT1_MI2S_RX, 1, 1},
+	[INT1_MI2S_TX] = { AFE_PORT_ID_INT1_MI2S_TX,
+				INT1_MI2S_RX, 0, 1},
+	[INT2_MI2S_RX] = { AFE_PORT_ID_INT2_MI2S_RX,
+				INT2_MI2S_RX, 1, 1},
+	[INT2_MI2S_TX] = { AFE_PORT_ID_INT2_MI2S_TX,
+				INT2_MI2S_RX, 0, 1},
+	[INT3_MI2S_RX] = { AFE_PORT_ID_INT3_MI2S_RX,
+				INT3_MI2S_RX, 1, 1},
+	[INT3_MI2S_TX] = { AFE_PORT_ID_INT3_MI2S_TX,
+				INT3_MI2S_RX, 0, 1},
+	[INT4_MI2S_RX] = { AFE_PORT_ID_INT4_MI2S_RX,
+				INT4_MI2S_RX, 1, 1},
+	[INT4_MI2S_TX] = { AFE_PORT_ID_INT4_MI2S_TX,
+				INT4_MI2S_RX, 0, 1},
+	[INT5_MI2S_RX] = { AFE_PORT_ID_INT5_MI2S_RX,
+				INT5_MI2S_RX, 1, 1},
+	[INT5_MI2S_TX] = { AFE_PORT_ID_INT5_MI2S_TX,
+				INT5_MI2S_RX, 0, 1},
+	[INT6_MI2S_RX] = { AFE_PORT_ID_INT6_MI2S_RX,
+				INT6_MI2S_RX, 1, 1},
+	[INT6_MI2S_TX] = { AFE_PORT_ID_INT6_MI2S_TX,
+				INT6_MI2S_RX, 0, 1},
 };
 
 static void q6afe_port_free(struct kref *ref)
@@ -1777,6 +1819,20 @@ struct q6afe_port *q6afe_port_get_from_id(struct device *dev, int id)
 	case AFE_PORT_ID_QUATERNARY_MI2S_TX:
 	case AFE_PORT_ID_QUINARY_MI2S_RX:
 	case AFE_PORT_ID_QUINARY_MI2S_TX:
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
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..d61fda8e8985 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -3,7 +3,7 @@
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		151
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
-- 
2.53.0


