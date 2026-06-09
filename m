Return-Path: <linux-arm-msm+bounces-112245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PNZ7Nv9AKGpmBAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BEAA866272B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 18:36:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=OLV0tbHq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2DC423088496
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 16:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD2A3BCD3F;
	Tue,  9 Jun 2026 16:23:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33653BBA03
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 16:23:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781022188; cv=none; b=ThcMhUmjzWq9A770rSGM6vgMnY6W6SE/s8KVpH3b/DNpuTunKo/Ouh4Li073YLlmc2VX4r8g1DS2dQHIG8O2SKnTwV2b6Q7AUEVrcPomkAVMx3sPzasxhwMUdFfbpK1bY9lvtS1m2oDQ6CkKiJqAUZa9OFTHIyQKDeEJRtOBY6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781022188; c=relaxed/simple;
	bh=sZptyh2YnTUW11YXeW5s0iLAeCrXBy0PXfU8miqgtMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UNIryFVDxwT35lAXAQjvEdnsNx1OtWfiiScn5tzZRfhljPBzdqDwXQE7vQhFFvsGFkzZqsG+CXK+dxKvEDwtbd/D2z0e62DSnbayNt2sg9Tu4eBWlEl5sZfYelV2UF4BdHr93JTNh1HSsn5MTA79I6ewOfy5KOTOYddUnT78Nkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OLV0tbHq; arc=none smtp.client-ip=209.85.219.51
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8ccf01ba514so48091466d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781022186; x=1781626986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=OLV0tbHqOOriT9GSQDxjldj2Ij2cpTrhRqAXUx+t46RxZ9JTkNB03Qk4ie4xkG8Lho
         /F7TGp6TiYdvkVIozAWQ7w1N2/dVSmZsUxwD5QO57wY1Yf/1YokW7Xt/IuW/sP5rzJ40
         P5vDqz3/mmsCt7MfcHIf0cngpwoMRovU7URVobXjaUmJ0pQiNDbLMDXxnZoQpToLqokg
         CCKpmzkgvVA1g5tgteZs1YUWyG+dyAg9/lSdlKJ1dSSmzrbuv1+klXuqY2kxQSpY//oQ
         lgF/wEPvoq++YFyXMpTmtZ6OnkJ+vdoOxU9chF4DFYCmkzi3vyyEaoZNa4scFeTQuD1a
         vnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781022186; x=1781626986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qa2oscqijK70AQfxauHDlQKqXVQZbGo2+KnF0J46Iv0=;
        b=Lp86MBwDqVFYElM4PB1n/qI1w54HjPWyQPMbxuQfK/5Y+Ooj3lOYDq9mf81l72d5s5
         y8SwnZVfEv2o9EENOcEfatdzXayrleu6Xz95hIvd52+jU77g89F9rVAn4rVh/IQDhzhl
         OmGPcrDODVTV7/JrNgGp+u4giDo60+wRuSrjX3BELvxMju+QrHoziZeiWYe4OUmJI2ny
         E1gm6QuC/3Ujd5c4ADVWYqEtuXg13EqVhB4UCqTd3LkE181L8kwa0nULsG2GaeSPc2IZ
         1JQHRmV6zoiA/l1b5SLcyGfeXl3bBPoRFxNdiNjI7BphuuVSsWGH4jY0Usxo8o/ngniB
         apwg==
X-Forwarded-Encrypted: i=1; AFNElJ/trS8aNTf8c1EEAIL9VZyBudrg+Mm/XSm7brZSVvvUX8eLo4yTfRkZvxj+8rd2860iGmNG30l/KdfXxCxU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7WVcHTcBciPlVtCwmJ2ya3Vn7awVviZ1H+NNz5WV83dd4xKz
	RKscG5OJfwPGjeHeB1q6/xmb7CWth6VeVqZc/u/cwW1rNkuE1eLo6NoK64XAZg==
X-Gm-Gg: Acq92OEKxMYMZtgbGxvxxf43iveJN++jhXE3WQDm9MVOm4JfnNzuuB8wg1pvVfDCjIY
	m4qa+82DN7WyQTvrXdw3pOGqjFiiFohb8fbYcR5TaNZYBWG7REgS15m1gAGiZ5rS2aUyoj8sKeb
	JGnACZQgtMfTmShiwxGXS3fPsfFvnUJ3RzlSynoiijl07sttsBPB04BsJeCK93R6UycL0iQyHW8
	kXKHwDhAyfbhmVISdbzZDh9lXzklypC7LtiTCTYyLgO9PTCo4eE7ju2AAhH6DGBekXt8viTJpvQ
	8QrkUW9jcznK77N6E8Fcju5J/uas6eGD/65Ck4m8PdMjEMdq1eAmpMlPETmT1M0MM9AkMj/C788
	ON7W/BP5sQ2Qo5hCNWy9/smjEv29xJpv0+OZkpH8sLJ8WF+yybsviqnV/diR3W1HoF246SE8Mfz
	LPQhTyulExvZz0rqDd4FRDFnXLHxYCOTyFTKtcgA==
X-Received: by 2002:a05:6214:809b:b0:8cc:ec7:72c9 with SMTP id 6a1803df08f44-8cee5fddd91mr292765756d6.19.1781022185918;
        Tue, 09 Jun 2026 09:23:05 -0700 (PDT)
Received: from localhost ([142.181.163.192])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd275dd2sm202873796d6.47.2026.06.09.09.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:23:05 -0700 (PDT)
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
Subject: [PATCH v5 05/15] ASoC: dt-bindings: msm8916-digital-codec: Add SDM660 compatible
Date: Tue,  9 Jun 2026 12:22:45 -0400
Message-ID: <20260609162255.31074-6-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112245-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BEAA866272B

The MSM8916 digital codec is also found on SDM660, typically connected to
the SDM660 internal sound card. Provide a space
for specific compatibles and add the compatible for SDM660.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/sound/qcom,msm8916-wcd-digital-codec.yaml    | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
index a899c4e7c1c9..33bc23b6176a 100644
--- a/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,msm8916-wcd-digital-codec.yaml
@@ -14,7 +14,13 @@ description:
 
 properties:
   compatible:
-    const: qcom,msm8916-wcd-digital-codec
+    oneOf:
+      - items:
+          - enum:
+              - qcom,sdm660-wcd-digital-codec
+          - const: qcom,msm8916-wcd-digital-codec
+
+      - const: qcom,msm8916-wcd-digital-codec
 
   reg:
     maxItems: 1
-- 
2.54.0


