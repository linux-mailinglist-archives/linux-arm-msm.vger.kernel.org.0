Return-Path: <linux-arm-msm+bounces-92544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBgWHEXji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:02:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0941C1209FE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:02:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF4393052462
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19EBC2EE262;
	Wed, 11 Feb 2026 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jXs2E65J"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5662ECE9D
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775363; cv=none; b=K0oT3PrEVRTTgUTiMjjsrQX/MJBCARXJKt4UJYJWpN3nCkwfaRfSoh+A8kZUbk1flPUgf74+c3wl+pRauO9dSanv5XQnTVBF12/Qx1uOGzl7mqllc0ELzfKPG39VTWeZc0fWC9ooI9O82jg+zM3Ycy9m9tbve0/+gAIobnr5azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775363; c=relaxed/simple;
	bh=xR/y7Hyddrcb+jajnVZbm9d2DBLyODaE0s37WmmwLnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NriPO476CRAGgURHE7m8efJ+e4C38vJxEmUFtQtCO/vMZ5KMbF2nFjg/GD1we+yFpFiPcV60Erl6Avk5O6MEIzV2CHNLvayLZNrUa2KDI6+lnccNJ4RTOVJQtq4ZjpGyXDn2Irw6XQW5o0ehS/I8UOAn/RjpehIzj8oS19hvhZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jXs2E65J; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-895341058b1so68431456d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775360; x=1771380160; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=jXs2E65JTt95H2dVaAB118a1ivL737Je8R4ITBBtFZ6gdxyAxUywwvP54hyf7dXWvN
         VPlQaffkbLUmp966vXOhoyLOZlSTfKaiXfeWTG7fQewYJXBGWdkfxe7JBcy85nlPr5ee
         oEbDyyPRNtYFnetH4uhr/VNO7G2Gmoa83JIxLDFJcjOd+RVV7NYWzeDsAnN8/nQaQaZ3
         EDi4OIuwS+S2duFt6XBOcHR7QbKM32gjdtBvrp+rcrGyELmpks88tl/35bH27sd4InGu
         vOpMv0WjW8+gPZWmL/F7voqQz6tXg1eEChbIYu0GoiYIOXSvu69uKjNv3FM9G8dVR1ay
         990w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775360; x=1771380160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3CwB7WHiwTdv+oP9pKXzEf1IEdmHOUqyv08rivHB76s=;
        b=rnRBXZQAwLf6DZ4KFcEvAFvc+G9V19C5nIxZtIJD7HLw9fzWVM+0r8N4HovCWoN3oW
         dQRMpwDVwEU53u5rfFEhEsJJkEdht/q6zY2/0ormRCzizTp09siXmE7/LN+Iuq60P8k9
         JOs0nid17hwJa9dh+pkW03idaVPEY94FjRih118Q9bCnFz8qf9I6Le3XzZN+U+Pvs0YH
         yVRmGABTxd1O56GzyWPjV1ilUsisfQvRJ8Q47urE7iiWXo8Rnr1wBogLdrvqHe28Qhf0
         I/7fenAUVoDSCZRvuyqTK6eeAQ3KdYWlEDpZdXD9yhXGhfX1n0bjGQ7b7aNLZXvLeMQ8
         mtQA==
X-Forwarded-Encrypted: i=1; AJvYcCXNDXhvfxMXIV4hMKR79UzdTbtc4YQQe+nqs1JXyeGi2DBT9K/8WcWJcR5ZCKCjX5Yig2mNtP3aXur5A8in@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6Q3nqh9mowh5YNroAwAbX638aIG+ql/eWiFaEJuV6Y53L70he
	Uo3g5WTCCYPYDfW2L71Ht6mc4RVCIzMLQrRN3jzZOXHiQD5qj+BrwlTJ
X-Gm-Gg: AZuq6aICCQ7At2JRwfJrs2lakPVZEOIGugAH3z44SGrY+BzTFteott4R88O678eH1SZ
	ISg/QviKEbCfTCi59bbTFPuEYM15cKx3xXFUdeidDia3e89o3dqNt/BGqKJG8I2s6K9TmkWC3GU
	SBxrufawFngoDaO6HRVujYA9cS5wsqoVxPTYkcIH6zSAoreLtUtePAqmQlLhLwQLIgqvLoEVr73
	tcRQ2R4YHAziRvBXo9O/nDbFkJsicRnYnkfOs8ztWNJJbLxPk4HpbHPXZa4GFG/nPa+XKUCyl3O
	Aa80fqJV2GHUTjDRWnQfWZtIkkvRH+ujNJd8bGRJPN4ZOqNktmJElkZm4zxati3hbzjhJI6yggt
	RiEBl5xJ0mInGNVg8ypdwFq6ifm1gPAQd5l+HIT8bCAyaB2F1iFCmodq15QCc4ueyiYtIddqm5W
	g4YfPgdd8aKiAohUNgiFHmjmgaZ4p9pCil5+ouUmnnt+wn4N5KxNONg4i38KDcSjaBiMe7GMMbQ
	5Z7GTG4aJ5QRrU=
X-Received: by 2002:ac8:5a91:0:b0:505:e5ba:14ac with SMTP id d75a77b69052e-506812528famr17195711cf.72.1770775359798;
        Tue, 10 Feb 2026 18:02:39 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7eb3sm10593385a.23.2026.02.10.18.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:39 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Johan Hovold <johan@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 02/10] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Tue, 10 Feb 2026 21:02:54 -0500
Message-ID: <20260211020302.2674-3-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260211020302.2674-1-mailingradian@gmail.com>
References: <20260211020302.2674-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92544-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linuxfoundation.org,quicinc.com,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[mainlining.org,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0941C1209FE
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


