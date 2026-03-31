Return-Path: <linux-arm-msm+bounces-101138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UGyNH3EjzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101138-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:41:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 00112370AE4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:41:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 376533014103
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AD153A75A2;
	Tue, 31 Mar 2026 19:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sfUatkp2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2481D3A0E84
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985946; cv=none; b=jIvPWflrPZ2/UbubphtJZvhfA4EW9xr91oIoNrWDN7Ud0FjX0Y3H+iRB9HNQp4+rA0oEbxfMTGsYSIHkfWaCb2PQOzvLSTpwK++7E5UCBvITN24Y1ZBADh+vNPsezyDQMJNCasV0xBkXRByMhk8h5fBXIp8vKV3Go3ay0K6C5Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985946; c=relaxed/simple;
	bh=huc+C2J5/ogSFYxxpwIAQP0C2iLi2Nk80fvhtK14SKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H9qnomF3yKcJtfe0x6kdMrYeOHCtKccnTJtBF04T2EMhSswnuoaB2Y6ypbRDLsLa78TFMc9VduJkU+DGkFZmP3+OxNquQ5iZIsgC9FqCG1donP8WsrXjqG+/IrqNSz1wAFdX2o3eMUfQg1b059qkym12OgQloHU0bIVa85t7jBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sfUatkp2; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8cfc497a604so775035285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985944; x=1775590744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2DMgcX8uhy5oeABb4B4dx47WI1aVkZ3HwLZ7cgpkUvM=;
        b=sfUatkp26WZhvIh99lLoXUC69K699gUeFo9Z7qSL1fOR8br1o8cmb1z8T3LEWs7Ue2
         GOgl7v0Ca3/+ZLzXlidhx3xF6W515XLlDUM4Se8J/tHcVhYVf1CMS2eyGgKHfIalHSNN
         QxOGvd54tIGgJkoKeIpQn4F0/gvcaqOWNl/5+1UZ2P8ruXnRXbb/nbkdMoN+rrsJQaHf
         lu0k9SwRkq4+1mO5aQCxJjMNzk3j6ts4Sseuz1KK3lawoUH3mwp+udCxlW7+Q66+cAJI
         50yLhS219yDkp7vQqwtL9gYG7N6Tcxo96YUZSA7ujvI2jiJruJWOWcwizwfsSASEweuc
         16fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985944; x=1775590744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2DMgcX8uhy5oeABb4B4dx47WI1aVkZ3HwLZ7cgpkUvM=;
        b=YXYpTgVEqVeAHAEp8yV2Sz7u+pxiRDIHBIIuEvZSM6tCRc9roe8BZ+0UUM7Wdm1YlT
         R4zTzrZROLymsB9tZn5TB0LKZugeSlkGcaQk1K/Mpn6XtPZze5XLG9RPPltPLRKNPQmO
         8TNzG5MLSD3mKLk6vribwHVZbjW3da9GJy2NcBmGVEQoN3tS99bASBcnbegSXuryw6wg
         wfgGEtIBD6mrHxL+1hVB0+Nd/NPLL4h/XLZ/Wkd2Kjq5b4VNpEMS8bKxf14EtXzDuBZa
         K4WUHjoG0tD5e0n6IXKM3wTQaZmLr1rg9MZJ9vPgnUCxrx/7bKo0X11Nc+GXlV3FXaxV
         YMog==
X-Forwarded-Encrypted: i=1; AJvYcCUgkyh0BJ2cBUBhBjQ6iaxnN9spALFtJBq9MK2FqQN3WRCp9z6K59IdiqHaAalX9tMT0d0OXRuW4ygUsdqO@vger.kernel.org
X-Gm-Message-State: AOJu0YwQWoHc7JOewCOMCHUksxmK7qCqHTRR3jNpbd01ge/Ge6Qs5Muf
	Go+NIJSsvCd8CcgyRb3Z+exvjUmUhwT3LPcaQMZ7amxyw5mcVDkk+NX3
X-Gm-Gg: ATEYQzzJFGn/nK9ob3ANdrEQ5f7QVvxnYI3z271L9m23wr4PuvkKWNcBCVPKPfvKaFG
	h7mfoS/q3mVtz5+QsMnz72ivxDnvLWel8kh5KKqlI8PP/PBYAPU7b/77F4c+4NQw/TQOpw6aQnP
	fsd3PneeOy+zw8pwL9n8COLMxGsBpps7KjSxqcrJPFfjGFlQ+Z1Rldg2w/LJbmn2ajvAnu9okD+
	+PkxuNAnxnlDTy7r4UX5+S6MPQ5FWZ0Zqi0MhaYvOvQDPd3ncq62n7xg087dqxybSc2c3g29081
	s15IHHdxyJ4AWaCK3arldqerybMngw9uWyTYf2EF4SVIfWjL7pxNM7GAfbiTb43TVECmzy6Y+os
	oYtoDSI3n3V5cKvHsprIfM3N5ZpQK62Sk1mgxurM3Q+dzwZIWBeJ6w2X80QtQeGQmPf5UlTHdB1
	yLWKj/Odzy8spo3uyRrSN9+KBl
X-Received: by 2002:a05:620a:46a5:b0:8cf:d3f2:9f4f with SMTP id af79cd13be357-8d1b5c369fcmr151944585a.55.1774985943871;
        Tue, 31 Mar 2026 12:39:03 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ed02364e2sm98172316d6.45.2026.03.31.12.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:39:03 -0700 (PDT)
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
Subject: [PATCH v3 02/15] ASoC: dt-bindings: qcom: q6dsp: add internal mi2s support
Date: Tue, 31 Mar 2026 15:39:26 -0400
Message-ID: <20260331193939.40636-3-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101138-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 00112370AE4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The internal MI2S ports are found on devices with the internal sound
card for Snapdragon 660. Add support for them.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,q6dsp-lpass-ports.yaml     |  4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 14 ++++++++++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..d8271f1d9a34 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - INT6_MI2S_TX
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 162
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..059f2ea1bd23 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,20 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define INT0_MI2S_RX		149
+#define INT0_MI2S_TX		150
+#define INT1_MI2S_RX		151
+#define INT1_MI2S_TX		152
+#define INT2_MI2S_RX		153
+#define INT2_MI2S_TX		154
+#define INT3_MI2S_RX		155
+#define INT3_MI2S_TX		156
+#define INT4_MI2S_RX		157
+#define INT4_MI2S_TX		158
+#define INT5_MI2S_RX		159
+#define INT5_MI2S_TX		160
+#define INT6_MI2S_RX		161
+#define INT6_MI2S_TX		162
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.53.0


