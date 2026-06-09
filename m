Return-Path: <linux-arm-msm+bounces-112242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9rLqCFhFKGqQBQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112242-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:54:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D571662A75
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:54:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Br91IK60;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112242-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112242-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA48433D5365
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5370B3B47E2;
	Tue,  9 Jun 2026 16:23:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7DC3B4417
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022183; cv=none; b=tpZutn2u2wdP8CuDehpDx0+OS6xVeh2p93/j/BiDsvXPIQz3mLxwJ1Y5kklRQlh4lD7kdWSxu7vQnzWhHDAlvYLfxTE14KN2WiaKsCEmjO7Qe/YAzIIv3rCpnwpoQVvRU5nbo2aUxURSCeFO3UUxeLZ4GhOftR/1YiZsDFzrDBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022183; c=relaxed/simple;
	bh=AeGIWM01cEy8wx/Ywn2gwtkQshceFsOvLf1UYfjPakY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtwUtm2lWKVt4mHM1JAdy58bHLZ2wN4rmsJiijcSswcWyaPVY6BGbAEZ+GNPajIEU48OwAPmGLbgBnn42Cb+2YOOxVsihiKvahxWazG1XzFwvi92tWQIB95TqWdrth2aY4xEsyX/ZKSf77+WkjdkS1K+xeNq5Rjv3uEPFtXMHBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br91IK60; arc=none smtp.client-ip=209.85.219.49
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8cebfb15413so60022546d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022181; x=1781626981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxrmblCHxPYTYWGagnmJNDYlhKvZUH0GTSCNjpfZ6R0=;
        b=Br91IK608+GqEQoaoKY35QhRcHF9oKwR/zI1nPuvC4xN+6EMzmfveNQT/Y1sien6FT
         4SO94tO6sn4W3BC/RMWktikd93LQEUYu8ydXnAxb/xcpQDXCaHNKaHu0B1ZzYoOFraap
         MyMfxJMy/P0y1TGi4DQqqtR7FdskSoPFktwZszwPUrwBHn3K0USy3707q8J21Lve08hg
         54q5xH380Tt6QfxV4eLyJY0ssXJFnNoOf/nlDixsQjCo99+/BUODGdtBjW78y/80ROui
         y8mb8cPeTYox3eI6RR9X8b7WSnXds4+1qcWEJNz4P9YNxLe82lrggDA7+EKDsraJtsSK
         r1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022181; x=1781626981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PxrmblCHxPYTYWGagnmJNDYlhKvZUH0GTSCNjpfZ6R0=;
        b=PdHWMy1efRyKnM6r0uKdOPVayjTnQLK2RUD4/avXZ+kry+vI3hUD3ODkAk8vw6Dmlo
         JFJYCOG0FSU7wSLjapFdCRCYQCTYhYV1fYfDtfQwk9wJ70mbL5nsSGZDhd6xHmP+0/1t
         GMV7KpulViWb5TA+ImvToGIDptz0qt9vb4BXx0qZIGqWHYe/ugCorLj3gjmvBbPKbovU
         uz4/LYi/89gALZMW2qs5e+E1uT+XhOuGUuBTCeZ2BHW6vC0G2DdfrEjOSQLMGJl/IpSN
         AFkHVjoCtFJi7FQ8fZXoDkC6EKEmFboaEjRYKne4BGElNleRWIqENbfq9xEtfpAfPmtC
         IejQ==
X-Forwarded-Encrypted: i=1; AFNElJ91e6UQmJCazh0ve+Nx/WzV2TChN3TNQu+YX1XvE/z8eaqd+dGxnDjMExbcjWMHJ2d+fgD0eua0jWyjfMCo@vger.kernel.org
X-Gm-Message-State: AOJu0YwE8oQS0+5lADTisxPeFqmZuhenw1Vmumd0dHw2bAEGdVM9IQHR
	2MBvpn2wV+kcoxUmX+l4UEvd7rQROz9uJbid+rfqoMJ7LbRTQdlRD4Vm
X-Gm-Gg: Acq92OG23+LE51J9kl0BOTC85395R+3nidWT2UgQ4w+4WLlPnVH1eNzM6giPF0D2n9I
	p8NarcK0QNyXK8fk+G8XnLjWebWT4znOU3iqvhXYiPSkfRdu8neS4dXODCLublv2przjrrMj5U9
	+zTy0kTH6kT+SAPjkcTjk/HddGsQisBYizIhJIneu4sOOiLuRzi5kogN0KWDSyCi+2CwwWdGNox
	umvIoKnfQxul/TqjpRzXt5M/JPipY4q8QCfaXo5qBWYOdc6bx9pzzF9P9zqjAkoXrMRJhiHhQk4
	+nkHWWZsgoXvZSFnT8/o9fCobFFEIq7KbORxDkTtxGc//0nYJLw4I/97XuQC4DcYMcqs9Cx6saG
	pcJRe7UCZZI6gRGjJ8KRxbthpSxLkD13YS46jR2BVYXS592VbYTKYiZOcQMcfMqPUpYU1A52347
	DVV6ymy0vY0TDUrL/DhZnF1Mx0okrtYicXS5UuqZ7B737mqpHQ
X-Received: by 2002:a0c:f146:0:20b0:8cc:f074:95e with SMTP id 6a1803df08f44-8cee61337camr273970516d6.30.1781022180931;
        Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ceccdc91cesm205664046d6.19.2026.06.09.09.22.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:00 -0700 (PDT)
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
Subject: [PATCH v5 02/15] ASoC: dt-bindings: qcom: q6dsp: add support for lpi mi2s ports 5-6
Date: Tue,  9 Jun 2026 12:22:42 -0400
Message-ID: <20260609162255.31074-3-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-112242-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 9D571662A75

There are 7 internal MI2S ports per direction found on devices with the
internal sound card for Snapdragon 660. This is similar to the LPI MI2S
ports, and the LPI MI2S bindings can be reused for internal MI2S. Extend
the bindings for LPI MI2S ports to accommodate the internal MI2S ports.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml     | 4 ++--
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h            | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
index 2b27d6c8f58f..3b03e2acd67e 100644
--- a/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,q6dsp-lpass-ports.yaml
@@ -127,7 +127,7 @@ patternProperties:
               contains:
                 # MI2S DAI ID range PRIMARY_MI2S_RX - QUATERNARY_MI2S_TX and
                 # QUINARY_MI2S_RX - QUINARY_MI2S_TX and
-                # LPI_MI2S_RX_0 - SENARY_MI2S_TX
+                # LPI_MI2S_RX_0 - LPI_MI2S_TX_6
                 items:
                   oneOf:
                     - minimum: 16
@@ -135,7 +135,7 @@ patternProperties:
                     - minimum: 127
                       maximum: 128
                     - minimum: 137
-                      maximum: 148
+                      maximum: 152
         then:
           required:
             - qcom,sd-lines
diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..f0a6899b6523 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -152,6 +152,10 @@
 #define LPI_MI2S_TX_4		146
 #define SENARY_MI2S_RX		147
 #define SENARY_MI2S_TX		148
+#define LPI_MI2S_RX_5		149
+#define LPI_MI2S_TX_5		150
+#define LPI_MI2S_RX_6		151
+#define LPI_MI2S_TX_6		152
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.54.0


