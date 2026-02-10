Return-Path: <linux-arm-msm+bounces-92397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id stXVIoqmimkVMwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:31:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A05116C02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 04:31:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D7A7E3009096
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 03:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B3641A8F;
	Tue, 10 Feb 2026 03:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKDPs135"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD47BCA6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 03:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770694279; cv=none; b=kc1iQ+lmtwiI98j54XBglm1dVfV9cIWYpJbJsPKntb4kn4IN5ZWaztjYB+XAW0bjYGcH4INSy3GFdlyz1lBQf4olS59PhpUTO5JJ9FIBsLDr1od9VtdTE4PCZjHpV8vFsWQSbjG+tvvBXXFM2q/bVnHoPWYpE28O8crqDVLW5OE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770694279; c=relaxed/simple;
	bh=grerL1X8PEltlDn9bZfsY+C9u7ePqpUQ4WeAgoThNzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QrS0rcnQG7HfzAnR+3BYoixcyHRoyMci4i5v1CrKKMxS1Lg0oG7KtLziwIH6QATAIyoR5CGD9pmcu3cyt5aUrUHTpOBPcuQmkEVGhS1K8BU9xr0EIZ/atvTGQPJtJOMe509RrX3+tJ6AsSSzbUnEnhmpmK5ZF8NeF7x47t9k1WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKDPs135; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-460f3f9fdb1so3707127b6e.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 19:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770694277; x=1771299077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=MKDPs135IJEA3D+MquLjbK1/1C2ZuegSJTzNzgfzjsT8oCIqwXzBe1fhohcFt/wxRQ
         QnlxRxHYdx8XlY0VFq2LL/Xnacp1NoCSZ8w4RkP7+wt9FJxKGKEmO8m9gN3yI2toAOYz
         aVtT6ULejbFgZMV5gWqz5oVtXk8EDa7/VmqIZCTz3krVAwR0RqJwclhS7Y16i2cadEHn
         lRE6gket8G/ezqV0h1KgO8M9btnUUyAcePadID6Ko5hnLt/3jrqRJC6pcKDrb4hdzhcz
         4KMUOJg78JBNvaGwlhvcBlCLvqmnNI6+HvRdZhwTDlhO31fE2Zfe/6671M9RsZt5xH/Y
         ZifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770694277; x=1771299077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oHuCRRLW/wv5+lOhXnCHIBJ8PNubsec4dQmyfsYfdCc=;
        b=nzg4j7aqAUQGYjskhUl9uDnBUwCd+8Gwz8w3TiF9/yADK+vXClgLGJM/cUCZ9utK+5
         HBxJnXB6/bkz4GLy/SLFhnJsZC/z5VtIG89mMmXG0rCNTx/iBg871QhFLzqIPZeD1D1x
         tobr+J7PMd4zBL5HAG6Z7+MfhLOgdqm7Ef/DNfhbDk0OkqqBDHF78ktvQ+AVzYPBob09
         9EfTK9WvVTaXwv1U4QiDfeRuIlhp9xjNsz5cyfZ+2vYZJ3jTsDgPW70/2jNiRUKEJae6
         hAk7Yg6oeFSex05Q+LFdelOyOpWvnIbEc/8rtVdDeLyibKofRCemPPdW9DEl2UjQHX48
         Xb6A==
X-Forwarded-Encrypted: i=1; AJvYcCX9sxpE6oWAxcq74vqfrTf4aKLhp7jphwDM+OsGq0Op0NHu5pfmZnKPvgxwOeCfFhhzdjEiPdJE81n/zFiu@vger.kernel.org
X-Gm-Message-State: AOJu0Yzor1Sg7RYJ8l+AC+7wz10tQLxuofnyoyzy34LCfAczCUD4KDKB
	TaOkHBgRgq5SYQsQF/kU1yJ2YvahqtIkk07mR9mySbNz65A/TsgXdGph+d4a7A==
X-Gm-Gg: AZuq6aL7Ca0UmK7q0xN2svU9PEKo3dbZSO0BfpWyNLX+1S5cxOPkzUkhsgdGgWfmUJR
	qrLgrfy0tAZVF2hEaSGlhxw+EKXywSeDqR07F96aGA4RxkEz858B5JLVAa0FL++TlClPTTVsAzX
	/qj12cFkKzgrTClE8B21W0a6+9+vvMSXpjlQvD6XqlGEy3HGCn3T9bXyuHG5SgdtIQDyYXVAbQI
	A1lrJZiFYwD5A+W7jN3jh9VuSgPkZbt3gQeBVoM4tSbaOBXU3xfMypaWv1FX94PVHapvr1WcbgD
	6DEohnq3kZOs6l2ywtUOkht1C5pVtB88PpC3PnYJLVXr2zg3/k5IEU8lbRhvlTvViFlVjl7FhfK
	pIEpeempzj88EQExYurvvwJXNh4bdsgxc9ntMHsoQAVWlF+s7WDUV+izaUBse6YvNCl9l5ocoqI
	8TgCF0CCtE2CP0EA9QXZjk3j+XB1/CJzJZXuBofNkX9DE5IrlJ43vWT7qIJkMgCkds7FphXasHL
	bGDt+blt9YlsTU=
X-Received: by 2002:a05:6214:c62:b0:894:6540:9112 with SMTP id 6a1803df08f44-8970d9da94emr11081586d6.33.1770688893108;
        Mon, 09 Feb 2026 18:01:33 -0800 (PST)
Received: from localhost (bras-base-toroon21-grc-75-184-144-58-243.dsl.bell.ca. [184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8caf9ee8593sm926749385a.36.2026.02.09.18.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 18:01:32 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
	David Heidelberg <david@ixit.cz>,
	phone-devel@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v8 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes property
Date: Mon,  9 Feb 2026 21:02:00 -0500
Message-ID: <20260210020207.10246-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260210020207.10246-1-mailingradian@gmail.com>
References: <20260210020207.10246-1-mailingradian@gmail.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-92397-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: E5A05116C02
X-Rspamd-Action: no action

The clock-lanes property has no effect on the hardware configuration, as
of 336136e197e2 ("media: dt-bindings: media: camss: Remove clock-lane
property"). Remove the clock-lanes property.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Link: https://lore.kernel.org/r/bbf0dcd9-d0f2-49a6-a2f2-6ec9376f2f59@linaro.org
Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/media/qcom,sdm670-camss.yaml           | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 35c40fe22376..78b9e03da06b 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -116,15 +116,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -139,15 +135,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -162,15 +154,11 @@ properties:
             unevaluatedProperties: false
 
             properties:
-              clock-lanes:
-                maxItems: 1
-
               data-lanes:
                 minItems: 1
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
@@ -308,7 +296,6 @@ examples:
                     reg = <0>;
 
                     csiphy_ep0: endpoint {
-                        clock-lanes = <7>;
                         data-lanes = <0 1 2 3>;
                         remote-endpoint = <&front_sensor_ep>;
                     };
-- 
2.53.0


