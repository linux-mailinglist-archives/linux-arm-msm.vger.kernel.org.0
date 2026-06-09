Return-Path: <linux-arm-msm+bounces-112243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qU/8Gy9AKGogBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112243-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:32:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 479CE66268C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:32:47 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=sAfGp4yP;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112243-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112243-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AB6C830735F3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FC7340413;
	Tue,  9 Jun 2026 16:23:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C23B71DC
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022184; cv=none; b=L2UJs3R7XDy6OR/TdnA6Sgc2KziYJbsw9hZqNqI6XfMBawAiTNNEMi0Os83p8DkjWIQhUDuBDxzOhl3z1b7ZneNdrfGCNpmNT7V6Zog7rCbVMAhKUJdwb6LcXpI/O2rbQBzYbuVfOsIQ8Z6UZ11EYEOpnxEIAGFv3TlQXsyHUfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022184; c=relaxed/simple;
	bh=yfzYmQxfGvQ/mzyfJdHs/Ur+od2hVjzLHZHfwLDtpIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCBqrX4LUEbgEVFYvqLkYJ+2oQP6zxyK5d49O0dCw6g2qxVVixXBp0WVOmslfhNXxUaaFDA6qyea4MDnSX3uRT57Uj3KWVhCwaeRBgk5DCqZnUsW/XWxM1UYD8sAw9ZKMxcPVKqpdKUQCkG2dU+RECgWO67q3PxpugPyfJI0DNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sAfGp4yP; arc=none smtp.client-ip=209.85.160.179
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51778077b28so64495941cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022182; x=1781626982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=sAfGp4yPKxZy/AqwS1z2frQia7/HoLtyzvZdu7Vm0MnqusuOgHYJD05IQxIxaboExw
         SQz3kscMOUKUwnnRzFWn09hsiBWtykHxjMkMYw4GSYMSmhY4Xjq5eLFZ4yM07L7Lt3T1
         b0QI3JJuJ5sPkx+QGJC58qvcBAmtHGsN81TaE2avFu5Apo9xiIcwteapWU08GJLEKl0Q
         xHiaFTueCjwkuf0iOwfBJ/QUltXdgbAq0xbo5nj2k3DbJP4dHECccVnENQJdxT7b2aIj
         /KEd9+t8XuBM4/I6tcgiE3Coo//A31J7esmvl2M2zjfGcZT5VCT2+NGwnyY+F9b1SI3n
         V1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022182; x=1781626982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mt6Txj/k93MadrmWiBiYhqcVr/6D1VDJs82CyM1GX/U=;
        b=hqE9w6qS+60bV4aWKEvwPXx3L2JbLbuQiz+8cYOrLvBOZgc0BKf4mSMj5TTX0nUlri
         1e8+OwWu8I6Q81wdBBhHV+H22nKvnrTmU6K0g6E+PaAcrGrvtmrFgNluc3NPc1rogT20
         5zmITlKPF5ztN20EzrQ3QHSWb9kRptFGpTwXi/ncZPLal/c3MW1ZUxjaaBCQnvxQcNa0
         PyNqJQyD6Kf0HmxsJIw/7CnQsGqD5hbV7F7U30Wz4PksHvXKWcfqmnYaMAlhtDqqlr9l
         CjEfIvVU39+edoI7e/FgYWTAa5+38a83cZutzFMfg92BA20RffjrsjufrrfvZItMgAOL
         Baaw==
X-Forwarded-Encrypted: i=1; AFNElJ8ntJXy+GuZSymMOZE42oCoT2wspmrRJxvxuZZmGp7TGnxNeIZduWA2PGyHHGyfCM2RvljUEFkvUTHM97Mt@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi/PC8zm0g56EJI+ULexbLr0clZEUmM0A4vrYx9XPhIMprenj7
	iLhjpSEH/1gpe6bYBHPoJpEL9cL7y+k62uFcHVrfsftAWn4Gri4UEHCF
X-Gm-Gg: Acq92OH8KXwy3ehASfrHjw10SRC2cEeevTtVgITnNyCEHromdm01Y4mfXSKoPGeJLGy
	Ty4N1d+u35j8E29GzF6xHqxLveXNydkTKpJkq/z6j5xpCCXII90XebZ7Qgnfi4Hlq4L3lCetGxY
	QOnVA6DK1P3I2Cki+7WMIMjnSpOshZj+kwZMhQuaKoKE71rRc4OI5o7Utavq8BlzBUTf0SL5vmx
	xgMmUYxx8xg2mzJXfS4IAUNaLh+i3QFDBD8yOSo5Ds7dMeTtWo82+GxIBwFAdpjKxy/Jr/pnFgW
	hO037QgqRSB/HTyoHFrjf2IqBDSjl0hK+Nv6Jet3PcfOhzX3OcMPCPbKbuWkn5KOkTA0s9dXDIb
	5U7D3/Ki3VqbyMpfTw7eyMslHdtHcxtwhmXyO3HjByurAH8wbEKMWe9UZXG/SE3hnvRnSpFXNQ9
	lw0hM5SwZAIUHVhQpGVWQmfm2E5ATe13HGi4aSr1qmO9Xx7xqC
X-Received: by 2002:a05:622a:4818:b0:516:e01f:523a with SMTP id d75a77b69052e-51795bf3cf3mr311258251cf.43.1781022182509;
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c4648asm210177711cf.10.2026.06.09.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:02 -0700 (PDT)
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
Subject: [PATCH v5 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Tue,  9 Jun 2026 12:22:43 -0400
Message-ID: <20260609162255.31074-4-mailingradian@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-112243-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 479CE66268C

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..15389645a3e8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,10 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    enum:
+      - qcom,pm8916-wcd-analog-codec
+      - qcom,pm8950-wcd-analog-codec
+      - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


