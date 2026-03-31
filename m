Return-Path: <linux-arm-msm+bounces-101137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIYVBkYjzGnHPgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:40:54 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 841BE370ACF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 21:40:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 742CA3009B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 31 Mar 2026 19:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390F53A4F59;
	Tue, 31 Mar 2026 19:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcJQZTI3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D845B375F8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 19:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985942; cv=none; b=N6eFxLS81E84NxcUxzRVqUvIHB4jitxQOptgz3126+pWqmczjrJyc0o/Vc+ohRHm001A7mXwRhYvFNa1ZpTvrwXzaNlgYN9kP2/24+jMX2ooCH300ukC4GwNCd3D8b6BxgsbtXTmyhnNyQqqJy0fcF7Jd1o/WbITqWEmdYmmq0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985942; c=relaxed/simple;
	bh=md7ZgyJKci1oL67mwHChonuZy799l2+wru4xchUlLE4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNlTlz8u/FlZF8lzJU/6KHRzARbUkhHH0TpyGDUihMcm692Oa2Od+ujPTwKqS3DjuhSY96zPagi0VS32Re4rdB5VjX+jhU4+yA2vTMvV1y2qNBATxBiIkCOwmLsma7fHlvvUMmnoidZp4hyxZbuLf+Ms1ZuyzxmSEMC3s8Bml68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcJQZTI3; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb5c9ba82bso1211968085a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 31 Mar 2026 12:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774985940; x=1775590740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=YcJQZTI3egIel3Boxoxkifz3IOHjSFkT/nmX2NTArEqDC8W1PteE8GOJjPqcgBSfJE
         sRsfniMWKCiFBLZHf8oJKMVKk8wtgL7VoUZuLqaZV/ARPxOUvcXyDi6bhM6OB9ZTVsDb
         abYjVzQxLjW+q3NkCQSa6gGNVOhDWJJHZ5BqhGZuQan1ANJfEABZkYRkoUBCD86oeiA5
         3ijE8nUr8ARUzste8GdykxYjtYA8Dph9R2KoH7ilOSmRp6g319AGARlwZi7UdZHbdP7j
         HEzVVYs0hFYODRgpKoUVeYx1FEws3NmbivT2HAAi0d7ta+lf9Pg/Ch6KN/AEWoYxS+cd
         +I3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774985940; x=1775590740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V8PeiigyZeO1TReQFmzOYp1g+SjtZC0Tv13VfVdNAnw=;
        b=r6pLDJK/am8NkmQXaJtdLM48xvR+FNBrcPHbBEeDQnitH7f/WbApz/JdISz96WdtLw
         aPJjyuk9XlziQLYpK+OCVEztvuiF+Qj9a1NezFpVf55wxR5q/BzFnk8zNGB9rvrwVoI/
         DRgDIuX7Bk2LJwMFKsiRs+lx7tC0WTMQ6NFhnwvnWm3wStohBKaYJk8D7MY6ZnceQlau
         W5DY3WurzsZ5HSsYCR5O8Q9LShbsotp5pzWBwTeeIFG4Dhln/lo2WOPjUBWwbJUvTL8L
         FMSULqQvqqW3pOK7ui2Xlnuc/RqknqD2kgt5QbaeD+Ikn/hDGsSBv+cL4gwBLx4SLxHo
         iGkw==
X-Forwarded-Encrypted: i=1; AJvYcCWVmazyeh9W404vQUSsCWwroiVdYzgMBQ2cAq5SAcnpoclfvHhrrwccfZc7LmVZAGlRvO2ORoe7+Z3ZTUIu@vger.kernel.org
X-Gm-Message-State: AOJu0YxKbK8E043zldguWRozPes5S9QudSwSi6GqfKu/8De4OUrS2a8+
	QxrcW/QUPaNwaK773hy1gLJWjj7GAZX2hYazIwQoIIxQsMRy4kowewIK
X-Gm-Gg: ATEYQzxlT6RflKQ47a5kwmveI/ze+cl2cmFSD8IP48h4cBuOPHKLBlUNx8o66IMgxOc
	BHBAUOWSEHhaBFfrMfRJOeJbAkAhbJ6p7h6pn9bBWBvfxjy7QhjGpauIeyIRQpZbaBROWo/jFgs
	YaXqbLaOgS5o+A8nnJIQyNujejh6C26aUcVgFU6JDs7pfQlonoU6OS16GTwwqzciSlqiiwNlwSa
	iMpFJMq6//tskxjUicl3qLJtNg2e5L3Oin1/448cFZQfYo14aAqY+SnJGv5/qLJtIXyinBJSqIa
	NVxeGqn//oIojF4rGSA40Vl9qPtO4GizLZja5P3ZOdAgEFy+jMj905afAp2PfjVydKwPsku88Vj
	+eZAYd0JkMUdUOEjGaxry/dSUAcZ8aBHECYvJj4oB4DGb9gOeO/r4A02EHT5fABNdZzFLlMlKHt
	JtizeC2jjHJLLIXqWmb0+PoKwl
X-Received: by 2002:a05:620a:bc8:b0:8cd:dfe9:60f8 with SMTP id af79cd13be357-8d1b5aeef3bmr142663785a.23.1774985939822;
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
Received: from localhost ([199.7.157.124])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d02806a36fsm936924485a.35.2026.03.31.12.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 12:38:59 -0700 (PDT)
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
Subject: [PATCH v3 01/15] ASoC: dt-bindings: qcom,sm8250: add compatible for sdm660
Date: Tue, 31 Mar 2026 15:39:25 -0400
Message-ID: <20260331193939.40636-2-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101137-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mainlining.org:email]
X-Rspamd-Queue-Id: 841BE370ACF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Nickolay Goppen <setotau@mainlining.org>

Add compatibles for sdm660 based soundcards.

Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
index 15f38622b98b..63c744524e01 100644
--- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
@@ -44,6 +44,7 @@ properties:
           - qcom,qrb5165-rb5-sndcard
           - qcom,sc7180-qdsp6-sndcard
           - qcom,sc8280xp-sndcard
+          - qcom,sdm660-sndcard
           - qcom,sdm845-sndcard
           - qcom,sm8250-sndcard
           - qcom,sm8450-sndcard
-- 
2.53.0


