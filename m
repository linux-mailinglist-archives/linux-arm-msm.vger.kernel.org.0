Return-Path: <linux-arm-msm+bounces-105491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yAmjIU3H9GmMEgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7E4AD8D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 17:31:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 83D9A3018D55
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 15:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD9203CF678;
	Fri,  1 May 2026 15:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XjbwUwtR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C0301472
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 15:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777649480; cv=none; b=ha6OeKzM691vz5yhgYF4/z6KL3p8YLnLjGWN8nhk6SGqdSikChIFviC8KC/IT3gvE2EMSt4bU6Lg1nk1F5mUBNOnNdvgNyNyA75i27ETxikfbJk82Fr0XnUQFx2fuiLiVQ3DbyfbcKeERaRXhiHT/pD+Zn3jHUuTRUyTGl85TLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777649480; c=relaxed/simple;
	bh=nX2DQcNOQ7oifqcJcA+EmU1Zu+DWtc8KYmMM1NgKSzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BiKog4TCA1pNvlMpxqTK//N+or7mbYYKlCQC7b+ovpYEOygG8rXtmKe+0ybuyVn/6V7GDjBsC/18hAmP8ijQkzm+6ghIjZcQ/RpMeMPGbabIVGtlJIPbn8ec5oGBiaMDBmFVUqx+TFBSZTlkT33YFiAdOuWIQyRDbtAXcJN2RPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XjbwUwtR; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-8f83efb5729so228786685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 08:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777649478; x=1778254278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch7rE1VNln7POTB3wB90DrTGP4Xd3D2qhejjp+e/HWA=;
        b=XjbwUwtRofmq7hG+qrM7BxgTzamnYrmTCyYS0qruK3pbV7wbuhar8oAJqKWqs3Bv2f
         SVqE5TrUmL4lTvBijPCZsOjpAJ/V6R6lkk/mLeln3QIKhfDwWL/+i59Te9AT6J3tRCCt
         3I9LWYUETy8icoGFF+8lYbA0XQ8VNtaSoxPu6pCrNErYrSNu2bJ2phwBLO5YUW7s3E2i
         FsOlpd5IIXKiVoki4CqsYaRXJibsV9N9j6y5ty02+9ed0mcEEhdVBfk6+AQc/AOxUOe6
         M+xnx3oCf8N8+cygPq0bGGjsmJ1BmvxoS7nOZJO0s6SbJ/Q7tlyb5qrBFUp+60srYO4I
         45wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777649478; x=1778254278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ch7rE1VNln7POTB3wB90DrTGP4Xd3D2qhejjp+e/HWA=;
        b=CPsJSaNBW6w6KtYHulfmLjj5Par3+R8iU/dpYUEws8CGi4WKvrZnOq8yPMR7tn2ngO
         FClWhtLfigbzW4eZqadKSQySam6+Cer+Zt0TXhSTuWbj9WYAzuzMgs1XJEaD+FSrZSNH
         8fUEg/h92zgYziNnQsv9cQEIqEOKF4bGIoiifNicbI6WR66G+lHi4ZEkM8C2r0uC1AeC
         WMh37l95hRXg8EmDUoItsf8YLuQNuyhEFi7XuSCw8g9BYycDb6fLdXge3nIL5qjL4ojh
         6xzI/zaaGSsi0PFHK97ERF13+o515023u0HduBlBn+TKJpXssH00gc4aU6/EQHqMs9vr
         Ce6Q==
X-Forwarded-Encrypted: i=1; AFNElJ9ft5/avRHPHnM/8wb3+PvfrGL5EMW2pX2kzF3EOQS26psFaEQcpiqzzT48dc8P1c+fD9zKvcPTSucuw4Sr@vger.kernel.org
X-Gm-Message-State: AOJu0YxWrBdKIVBLGwparpUpe9H4a5PgclEmCDFB6/k9unpq/JyRns0R
	bSFfH+vY4hfvhULkdXJMYqMZbEWOsdpW7RPr9IV/zsnKUo7KFi/tleC0
X-Gm-Gg: AeBDiesbAx9yieC0jdq63k5jWlHZXGRQp87+TqaXFZbXq4VkCIPTdMPpYj5FFlYslcp
	/Em4KzLP2X9jdvEnvqbMhHZF+buu35QcnWRRZpLTtlkP7SjWAoGJurrvrFeC2ppyydVqDamvvtC
	Hc0Ha4iDi89KppLTMCU7ypvMPWiKVFQPpd55EAtpkcC9nCo3r9Skx5GBvSKCyznGxLg3bihf0Fc
	eMjfWozzE5IvbSgQRwJInOAcdItrm+vJ0437hPFezYAh+lQ6ym8wFIx/mP/iE9GSqp0lsJESexk
	WEi1A7BNAHU/QiuqNuyxpSjUhV61hOEmXTV2tiYbFE40Xa2yvWxc+wrJQsELr7NnC5mtJHfILVR
	1WAlx2dVxYhCdTej8HZRlasjeG7NA3N2EjMFTg2FoYm/a8cu97zuzworf/ULcnW/TE7TDij9MXV
	+5Z0urvy94p15s2x7ibW0VJkUKSmn4XLRL38e/
X-Received: by 2002:a05:620a:4510:b0:8ed:c0bf:2c44 with SMTP id af79cd13be357-8fbf43ff3afmr503046485a.56.1777649471865;
        Fri, 01 May 2026 08:31:11 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253259sm186122285a.24.2026.05.01.08.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 08:31:11 -0700 (PDT)
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
Subject: [PATCH v4 03/15] ASoC: dt-bindings: pm8916-wcd-analog-codec: Document pm8950/pm8953
Date: Fri,  1 May 2026 11:31:16 -0400
Message-ID: <20260501153128.8152-4-mailingradian@gmail.com>
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
X-Rspamd-Queue-Id: DAA7E4AD8D6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-105491-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: Adam Skladowski <a39.skl@gmail.com>

Document pm8950 and pm8953 analog audio codecs.

Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
[richard: add back empty line]
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
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


