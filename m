Return-Path: <linux-arm-msm+bounces-112244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7UGbGo5IKGpVBgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C14B662C4C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 19:08:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=WLn16ltH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112244-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112244-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EB77131BE149
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC3F93B52FF;
	Tue,  9 Jun 2026 16:23:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD823B4417
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022187; cv=none; b=BYgxlugpU81ZwkdPIwvew81+agwUBrVnCvvMBK6scevEWv1DDE3no5OgwrG53nWphoRwwcn3qdldYxVCEYzT7nWuc0mx4AZFaZBvRHMREYlvrC2aTTjzgyWltbulp7KMKx+Q3GzO2xof7urBFX/wlbVCxNuJioyznVd76GaHBeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022187; c=relaxed/simple;
	bh=vpshP2r8MUWGtBgRCle6mYC029Z7mMLtZvh+81mD8lo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RjLw0Drddg/2KGT9xevgLzz4jmWya8zeI7L7FiHK+E4lSgHHPM2SMiWGloARXq90hEnr6uR9v6QGH/78jAjOalQlcaZ3tGHgy7ENOrF3UVCra6y+i7AROuMi7poR8PKR2/ierYtmWtMWUjnBoAKdBIbn9C+MbwVxV/BDHlGEUcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WLn16ltH; arc=none smtp.client-ip=209.85.219.48
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8ccea53f35cso59129926d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022184; x=1781626984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ex1JumNzOOfFIPKyf4s2vKOD2Tzr8WIN6i8cBTe4660=;
        b=WLn16ltHVRrarM3AGRfFduKTZnaNlVJTxLB7gBuRCIzlOZnal+lm7S8xo3bcNXvEHm
         ZCVjxliG0Wbe9AzpcOESHcuVu+ib4Eu6UOpZLCTfv/R10POok/j1knhppxP3jk1ZHxIs
         TyZLo+JOKMb05olz60brpdXQMznqXCtfScYoeHf3fKU98ChcQth8ogMJLihaqiPpGJUn
         lxRaSojd2RAUOKh7OBHfkeq0kS57MxI0JHCXuFbGmEB0xDWqWLc5B47vhmDIMAiFzmU0
         EkBCbMcPwVasJpd+1hutTYxGVX9clcPyG90V8/ShOjbd/fz63QRhe/cmCMRvJtdO2y1s
         qq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022184; x=1781626984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ex1JumNzOOfFIPKyf4s2vKOD2Tzr8WIN6i8cBTe4660=;
        b=RwqI7Lp/AD7EC4jSkx5nBpiD+i1hamaHV5eUvO1omkCBTnmorPunN6pCm4dhscw5u+
         Bm/AMofMk25SqON1aDJOLBorIMzMJ7vsojuRNmSo04aMKkVtlHtiN86jAuGlJxO+WAnI
         CQtP6DznyEDrw+VbOydRLbycTreJQkovWVviXBEPBaLT3+zVT+Sg2wuXKg6lW/kHtNjd
         p56irtCx22f3+kilT0DdRPT7qKQf/Bf0RQFtYkbcUTaYUpmgobt14pCaMHp8CSIe61pg
         VmtH4wJ5OdeTTlN0hjeJ4Y72uxctztZk0YhJiykKdntGmgaFV6UuI1X5jcSK4rn9oPDi
         ylxA==
X-Forwarded-Encrypted: i=1; AFNElJ/+PPbvTiaROO0WUjfRwRXhFEtTUpM92NXFyCwnHssLNiGHsMgAlbj4uufmFLbe3iLtKg0WNcouLQ8KfnH0@vger.kernel.org
X-Gm-Message-State: AOJu0YyboPn5soek+BQi65CTcMC3cfhTi0XJ15g1RQ/aE6bdrBV2XcG2
	WNqd4o0HnnpHelqbJxHDJqhVcW7sc5JruaNk0/MDotbW5OTHaQUgXh0L
X-Gm-Gg: Acq92OH8YodjCPxluHQQ9rmecHbD8icJPaSm1UdxSXDql/03J6pFZjLKzBnw2EYmivW
	y6REcOHnnZAwtz/m552+De0pl/CFRJ4h8QqFDRzeCb1MA6vuA2d3PBbuq3W5ZqiAORZZe5Xl55v
	FLIQXAKlWeCCfM4wujZbKmcS7646W4ABoz/Re6atP7bP9RRqlPVfzi0rtwyKPUlVk8jXCP5GNwI
	UG1JVkN31DDBB7jDz9V+2Qn7A7sDWDnhc11tdLGe96JMbg3b/B6yApcNDmTo9HyT4aywVRaP+Br
	UtRiT7DqiAz/2bgdWHPddmv2GsQUjKA7PDNjNceqOWXCi6+y4fMqadBHUJ+PtAxdgD1bLo6crIe
	gBVQiijB6vH8kJmhrYQFbMouYDbdlMy9QzhWw4a94jDbCdS2RRxM2msLcORc3u3kr+xjIU9aaQV
	fHkL6zvOUZ9/EyAiEJz4EGugQIN251ihWufCEHAo0PGW1CIK9y
X-Received: by 2002:a0c:e747:0:b0:8ce:b2e9:a4c1 with SMTP id 6a1803df08f44-8cee5fe6a67mr258782646d6.14.1781022184219;
        Tue, 09 Jun 2026 09:23:04 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd0708cfsm206620416d6.38.2026.06.09.09.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:03 -0700 (PDT)
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
Subject: [PATCH v5 04/15] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L compatible
Date: Tue,  9 Jun 2026 12:22:44 -0400
Message-ID: <20260609162255.31074-5-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112244-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7C14B662C4C

The PM8953 (cajon 2.0) revision of the PM8916 analog codec is also found
on PM660L, typically connected to the SDM660 internal sound card via the
digital codec. Provide a space for specific compatibles and add the
compatible for PM660L.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../sound/qcom,pm8916-wcd-analog-codec.yaml        | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
index 15389645a3e8..be47dbdb2e92 100644
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
+          - const: qcom,pm8953-wcd-analog-codec
+
+      - enum:
+          - qcom,pm8916-wcd-analog-codec
+          - qcom,pm8950-wcd-analog-codec
+          - qcom,pm8953-wcd-analog-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


