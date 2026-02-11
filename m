Return-Path: <linux-arm-msm+bounces-92545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ANgdCkbji2kVcgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:02:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFD8120A05
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 03:02:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D065E3053BFC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Feb 2026 02:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B40E1E1E16;
	Wed, 11 Feb 2026 02:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VwCCH51t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602892F0C6A
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Feb 2026 02:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775364; cv=none; b=UsGccAvT9Lw/1/vY9J0XOh8UbfbWweUqdgC0fh2Z6lxYwXtcJG2o8vIWA4U/UvqJwDXSPMCVxFhKEDNnXqSuIi1J+qptPHWX3qc4QkVGc0hAVIvMSX94g1RV2DhQWILPcYtfpKuvh6Ma7H+3aueQlj4mBzmrcRLwV/OLv7n4Xwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775364; c=relaxed/simple;
	bh=UemTT/Ea45TkyWQXQtnhTSn5rytRaDiczph1i8Pdn9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VKhN0wS2j/cRUrRer5hmPzaMZeHZ25rhddKtgG/d+4bzw5M+SCikiT/hljhk57lCItLeY3qOZztQFwT/2QGe6tcK0KZSBnlPpjE9csm3svhJg4kuGE9DbsBmH5K5uiFj58i82/ZN7SHyXvV1zXHSc/TWqJaMY80Y4UjbqU8nGrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VwCCH51t; arc=none smtp.client-ip=209.85.222.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f194.google.com with SMTP id af79cd13be357-8c6b16bd040so614982485a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 18:02:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770775362; x=1771380162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8SQooQVS6z7NQlPoa6keMGq9s98T9K22xL0ks0nYRhw=;
        b=VwCCH51tLnkPu27Zj+fbW0XVjAhDCkbwCQI4REHpj/9mKy9TMpdycoUhilmr7FuO0y
         XhuR5nzdGOetk56/rP6PdC8eswpuK7whm8Z1ZapOb6H7rTppSumQ6oPsUsRkt5oDeipm
         mdQ4WZa+hVFP7i/HimB/4c0LkSRn5QTI+qXUscpYsnx/IV+9bHPvIPwAIg0moyhRdob1
         lvStSbBuBb1w4qrP7TywduFFzBWiNcLGcLY0qquJQLB3oel2a32UlgEF5TYfvCk6B7nz
         ck1MsPvqQz7AgJK/p3L39/BEfIDctYiawDAlRwToE21JZPcfBjEtu+fGgo/hFBqGZRmr
         Ukmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770775362; x=1771380162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8SQooQVS6z7NQlPoa6keMGq9s98T9K22xL0ks0nYRhw=;
        b=pnjg+5qrm1ziHZdag9mU8PUGtKW7c3KEDCr9mj/vSy55rLzx6lGH2MJkiP1INZM/jK
         GRmIuwiPewhLs7e/uCEOj3YemxATI5kJIUUbed5PZud3c+ch4KvgwPSAbdg7aYeFdSZ1
         FG/bEVuWpgQsMgq9hOHcL6Ee6FpGmssQs+6sH82nK6sBdvYTexlnzras4U2GG9X/Rjyr
         ttBR/rQ1l5LveAkOXNVXvKCDq4nWFlPsEf6PfdIX3nlmeWaV8DgqIvliBr3cgE0ynpFN
         SZKP5mZv6q+GeTN4Se5tOAckh65UtvtVX0qoLJCPevYWAwd6KI1rDvAaE+F5p+xGP5+C
         Adeg==
X-Forwarded-Encrypted: i=1; AJvYcCVDgsi37fl0qPSytSMmPc8K6sw1q10lVm8ZFZ59XJM1Lx8BYoCJAtWq7f6PTq7G8BcLdvRpKcxYBTTQf/kI@vger.kernel.org
X-Gm-Message-State: AOJu0YxZJ/8RL5Gb5zbdtrPd3d7xaQzfslz5uUJHRBWtONplKpQkHouM
	NIDHAd9n1OGMCeb5OLD3+cLz/m0oXfQSStNR6xsvujopTaF9jOtNNF5D
X-Gm-Gg: AZuq6aKtzXTQl++4cdqJwTuGvRkUTyCs9Ke0B+HKU5a2VVTK7K/DX1M8iWpl+RV2rcA
	Bn/PrsqNwIxPBY7Qgx43aGgHEpva5StAt4i9v8XgWS64P/ge8LCMtKWSsFvzmnHFoXDYNTDjLzU
	fXoob+0MA15wjn+3ye7sG1VDoMywtWjmenWowmgzA1ixhZ0jBiez810g8thL5MoCnuv2AdtpL5n
	QNOdeQ77MrtXR8fCWAV7+RGomzW79c29tFZbvAf/GXyChV/ZIJUBvhiaWbF97C83zrNQC6N2p4d
	g+yuMwQaeWA0TPvzDthtCsHaAb8LjkHbI/z+M0MC28T964pPYpHIrZfdB2e9T+E11WDEDvwfyBb
	/IVV+ckNQRyTUaWlc1TW6XwLpnuwB28fHRt/2i7El7YU1FAUpKcHfeXxW5q9VurBiiHhwELbdQt
	hWNzV9PxmgI/twmbETFO4sthKGeJ1nmf9x/6hxUA9QDjKBPc+CNfOcnI+Gr6vyr1SBuXSDccONZ
	fAmr5e10kq/Osw=
X-Received: by 2002:a05:620a:40c9:b0:8a4:107a:6772 with SMTP id af79cd13be357-8cb1f72a954mr610497285a.76.1770775362468;
        Tue, 10 Feb 2026 18:02:42 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b0bc054sm12410585a.7.2026.02.10.18.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 18:02:42 -0800 (PST)
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
Subject: [PATCH 03/10] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue, 10 Feb 2026 21:02:55 -0500
Message-ID: <20260211020302.2674-4-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92545-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: DCFD8120A05
X-Rspamd-Action: no action

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 94e7a1860977..c7424d755cd8 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,pm8916-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - const: qcom,pm8916-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.53.0


