Return-Path: <linux-arm-msm+bounces-95441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uPgbKeCOqGmzvgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95441-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3389F2074EE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:58:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 270BD305BBE0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2E3F3DFC79;
	Wed,  4 Mar 2026 19:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l1JnFAuH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81C2384233
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772654290; cv=none; b=VBRoS5dES609deh4Yn2lry3KRrfNdfYn3uQ60VF6eL4xFPQBXD95emKYtoYxf6HtK2ZfrSLG/vW3ohZA+KcgJ3HV74o3rTPDL3KJd3gSxgJ1fXJcQnkUgJ9Hk1pRE2+mmt+fyY7GO08Bay+dCb3oqmtWItFRFux2w3KeCFp1ZmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772654290; c=relaxed/simple;
	bh=xR/y7Hyddrcb+jajnVZbm9d2DBLyODaE0s37WmmwLnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W+O/EbFU2tKGWT0CAzoOwe1kWD1bfCb8eotDGjm7GpcoM2ggHLv9HaNc6lrJ5LmGyHUTyYreLLbt7b6gYrY+7tutvfvGK0M9+wK1tvokjdNCiFNH/ivkGifRrP3whTUy7gUZtV8hgKo01EOfm1S+asBeF+Fo1Qbxykmnptlnikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l1JnFAuH; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-506c02ec1b3so82649151cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772654289; x=1773259089; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=l1JnFAuHWS5v4w2NtUtAkqNRlhHdPVx6PwehyKMogcPBk5HtjnumWEvMLzIK5Wt59G
         kXURJqXX/Yt81r/stXC96rvPYdgCCTEzm21IA4AYd5CPaiClhPWfQYlJF+tZOn7c/ubr
         qBacl5/3WuqglD0QK4PZT/0jkFINLGkhU1URdUctWbyMYIgUjSgWGMwLC3hY6KK3KMs9
         nZoCUPqyKOXIcUFziuwg0niLazPrtIV093jWEn8Xhuxlni7L4a3d5BzXeXD30JXctmX+
         PaoncawvlS4oAygl+Q3IEtaUKMdmgG4/F9WQA/1k6R3+LYxRXduFiET7/qdH7hI5vNxd
         JebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772654289; x=1773259089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=FgKJcE6gQizrPic8ZkAjvGDpNGIcpkqtbEGPOwO8Jn2W9ub4XKtHNx6FFsRkKKh3rQ
         eq2qRFNyGU2iQr1YnSXXLBHIISEMTkWAYU0D4rxr/T1MVOBK/KLqRJDWf2kpr0dKG5NF
         4tw2aDL7dPKrxDGlDp+rYO9dTRIvJr/6zUNxy4G+gc3kG6yS0nmU6XGEY+gs6GnECRKr
         TyegsMgNflmXyLluU3AZLotRRkX0Fe4AHQjdqFvmNsyScvEoYztGr8UhNiwyxyF1Vw5Y
         2NZOfFFpYOrq6xbdo0Tp+hSKQ4EZGZbuXvCW4izqHPw2QDITYvUKlB4FLR+p45XVMT7x
         b51w==
X-Forwarded-Encrypted: i=1; AJvYcCWe/7gN+IjvjaLNlm4tVxSHacmXjoma6H+2xsmEXEAFxc9m7DikrNomRkdSqhKauowUNDterzIbPm707Alb@vger.kernel.org
X-Gm-Message-State: AOJu0YworFe33w2y+Yu1b51MEmTnd0dSGjumAo8OinDGk3ruchmTiFzw
	Gq6IMnhIF6xAD8XLk0aCr01FkfKjDy52zRTszoXVqQafsBtrkmkt54B/
X-Gm-Gg: ATEYQzwCq2j3qpfTAB04oNAToHJoyd3E4/j/AiJkcRNdsbpXcLL78CGNv21LEA8DBAG
	R1wAViZP2B+YsN6M94Y3ARD1eKrsqL3MT6wTfPkU6d0s98e6dsgqNSVvMtWRHcA39xNNl4WF+zs
	YcYrYijRc6br+Lc+33iHt6pJ71LuD8MMhoWwgKrdNs0lD6s+2xBGxqEb2PcWApxxLmePOl6kDF0
	UGDR7L13BGG6U8lIhM4pss04d6KDmtohwQSdHhYpDZE0pAnyEvYXKP+PbB/Owr7iWEC5y+VUeh8
	P21rpVuJduHooG9U1PMP0vIeM+n+CVOy6UhJPkavnsYfg6XUoQSlCE04rhRyKRlJu0iWB2YxVmK
	59aGPgyFts2ruytLAbx2buKfRDeCVNyEubNQcJiAp0sQHogoqNUr3lbRU3sDXx/Zk0q2x4KvpBJ
	dOjx2hTl8nRmawKOKFUZW/wuEqnA==
X-Received: by 2002:ac8:7fc6:0:b0:501:7d6c:2d4e with SMTP id d75a77b69052e-508ceb652d0mr84601891cf.42.1772654288623;
        Wed, 04 Mar 2026 11:58:08 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899e53a0d04sm107589146d6.1.2026.03.04.11.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:58:08 -0800 (PST)
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
Subject: [PATCH v2 02/11] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Wed,  4 Mar 2026 14:58:06 -0500
Message-ID: <20260304195815.52347-3-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: 3389F2074EE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95441-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The internal MI2S ports are found on devices with the internal sound
card for Snapdragon 660. Add support for them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  5 ++++-
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 08c618e7e428..751913894dd4 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -126,13 +126,16 @@ patternProperties:
             reg:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
-                # QUINARY_MI2S_RX - QUINARY_MI2S_TX
+                # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
+                # INT0_MI2S_RX - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
                       maximum: 23
                     - minimum: 127
                       maximum: 128
+                    - minimum: 137
+                      maximum: 150
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..6753f7bf004b 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,20 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define INT0_MI2S_RX		137
+#define INT0_MI2S_TX		138
+#define INT1_MI2S_RX		139
+#define INT1_MI2S_TX		140
+#define INT2_MI2S_RX		141
+#define INT2_MI2S_TX		142
+#define INT3_MI2S_RX		143
+#define INT3_MI2S_TX		144
+#define INT4_MI2S_RX		145
+#define INT4_MI2S_TX		146
+#define INT5_MI2S_RX		147
+#define INT5_MI2S_TX		148
+#define INT6_MI2S_RX		149
+#define INT6_MI2S_TX		150
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.53.0


