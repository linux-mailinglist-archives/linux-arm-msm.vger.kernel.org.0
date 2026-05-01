Return-Path: <linux-arm-msm+bounces-105492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCISHlHH9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105492-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:29 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D11B44AD8E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56AA73016CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715563B8D4F;
	Fri,  1 May 2026 15:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyKT0gx1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2175D23D7DC
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649486; cv=none; b=jCxQRdOxunI0PtSWo6jDQSoGFuvmNWMA1I7LGoyMs/iLi1qHrvjYWos8OeJ/Kgj7D6tlEU9YCGceUakdpk3bfIeNZQ5SgjxmQTXfbT1fmYWCsrRBHNnfU4HW4GaaixCnnj360zSHzMWoy4ivqnTCqPvCxVrpOFHPgtA7V4CY9Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649486; c=relaxed/simple;
	bh=K/us0Zy5FZddFhfgjPkUdq/ry2hSBwBm1eiS3uRxCv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L5spjT+s+BF9oE55BCLgnSLWhm8mSX4UanYpkW/Dq2zmQCAjcQ+Y6FT8inFZXzVNcDAcE9U3HlFACFo3gYQRUaXHgu4wzIfzJx27QLZnSJOPdD9GUCpS2locsK5J/gwl8tLMCBEtEQ2evWIgqyklbargiI0kq7qRHVLjB7d4Chw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyKT0gx1; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50e5b55062fso13443961cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649484; x=1778254284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdpR8sjNdl6yN2sQRJHAcYExtu7/DPFnK06CpUvyYec=;
        b=hyKT0gx1degft0jdhyydPRQyO1eRxR8O1u83ndilwU60nfRiRwIfgpDGF4o2HfCO+I
         Ypr3CG2TuA2r8qfDpGH0iw7M+tBRNcGAf7Nz7YMxQ8gV3ZTbKIZr3v5HzYEO9hdKyjaI
         Dnr4LfOrB5P7vn6z8rL1dAR66QUZoIK/8jBMdATeSniwAD7Q20VAE7lqvvAydFWDIp9B
         sB8yGXKwnyzyddq5HZrNJPL0dTq9rEAwRMUBdjQQIAX0aSH8DDXHeDFklqW6K4413jss
         p0nw65KfP4AroBXunh5BLU4t4ZVlCmPWEdotLdxtqiJf4eSJYSP7GX2tSzQKisPELALL
         vcQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649484; x=1778254284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BdpR8sjNdl6yN2sQRJHAcYExtu7/DPFnK06CpUvyYec=;
        b=mP1yxchXfvnrHttRCLNgnoCCux7z023aIrbjeZIBCxIDKbScRqbw/VmlKfjylP6IaW
         hbzVS0fSNvU6+Q737Afs4vmyu5bTlMboxpkhKzFZ7Kw6wNEX3x7jZhgIeYiH0QDn5VFs
         0N/xvlS0fw+CLtGkJ0ixhi/GCi/DwzNwfkDYDpUyQ+70pFdoT9NcFSyxBM7QEhLqZoKv
         Q2Ypna5khRzggZIGLujVmmcCwvp9O0C/GP0+kTkRhaVWpuwc8b6wkqX8mjOOHGZjekL6
         z8uR2X27A4bCZcdm99RZQS17sSBnxacewEZF06iyrQ5Lp9t4sfFH+6Q0gH4L0If3JBCB
         Ilkg==
X-Forwarded-Encrypted: i=1; AFNElJ9iQfrCDQhV/bwAGwCHsNM8TI8ew+z73USVVpPI51LNkHwavmpyONXRY55B9PreBrGyQF/rXX2WvuPMYoQG@vger.kernel.org
X-Gm-Message-State: AOJu0YzbD2yoZttHLFoCU0t6E3qPMXADgZ6zGRvo8sS1PjN5x5YVjLFU
	TEUdlxBr+ftFpNsRWfBaeEEv+Q8uQXwKQGCRyZn8mFoswssnVS/6rHLp
X-Gm-Gg: AeBDieu3Wd6dUhbgi7jNrpCaJGjylnjDnsGIjvnNh84ESJ/hfI8q9UdFZaJuy8RZbTU
	o9EG9VenK4PMfERE9BgnkgqHECYtlLl9HLKQ1TmqSaRyQNd3ciyaXX+YJkDLXaEhJzJgDLlTa3j
	2O8P+05Wuaojc1fj1aOu3XeAKuMXDu1lvdAfnjfanz7Z25AR3LuzkeMRI8Ov8RL2lofv2kb4itz
	99d48iPs44WnlkraQW5CWhCz6JGgFt2P5F0/+Ky4ps3FerIxoV6pYWwrqyY4avJtAtauvhdlXKT
	OjTTfOTEg+sGbZ2Diw+Ynv6kwxEzROnENCOqrKKMlavWt6q8dCUKz/62RYqDHpdTCk4JdptS+N4
	lCEOrX521IViD7TZpurqpWkyN53kcg0K6w7qZLwp9on55I1Q0L07+uf4lcOaCjL3BuPfstKJg0Z
	OlgnT3zfut85Jg3+9mr59jc9oiq24i9cWRUTQY
X-Received: by 2002:a05:622a:114e:b0:510:142d:cbef with SMTP id d75a77b69052e-5103e9413acmr45768861cf.43.1777649484030;
        Fri, 01 May 2026 08:31:24 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51040b5e8b4sm19037771cf.23.2026.05.01.08.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:23 -0700 (PDT)
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
Subject: [PATCH v4 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Fri,  1 May 2026 11:31:17 -0400
Message-ID: <20260501153128.8152-5-mailingradian@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260501153128.8152-1-mailingradian@gmail.com>
References: <20260501153128.8152-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: D11B44AD8E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105492-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.987];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

The PM8916 analog codec is also found on PM660L, typically connected to
the SDM660 internal sound card via the digital codec. Provide a space
for specific compatibles and add the compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..074a20cda89f 100644
--- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
@@ -14,10 +14,16 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,pm8916-wcd-analog-codec
-      - qcom,pm8950-wcd-analog-codec
-      - qcom,pm8953-wcd-analog-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,pm660l-wcd-analog-codec
+          - const: qcom,pm8916-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


