Return-Path: <linux-arm-msm+bounces-99493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HS+NCXywWkgYAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99493-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:08:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4412E300F36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:08:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 352603063B73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 02:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47503371CE1;
	Tue, 24 Mar 2026 02:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TyYkjnku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586134DB6B
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 02:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774317675; cv=none; b=OXoqkFLLtHhAoOwnIHnDzuWcB8EdDnUWEKiJ58svq8ySu3mf31teXtoNK11bsqRbpcqlj9/Hr1S5cc6eGVUEqGcL9ZOoXkARdlO3bm9N+e9fqtkX8vTUL+Uou1nz/GSAwgvP+Th4H5KBt2CbsuddlrxKqBNHnKIzIrAC80YIYB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774317675; c=relaxed/simple;
	bh=xFFZh3do61VXvhto8TMwJeAY2BV56D21KYqosBzULpg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WELXh9YK5pfIGJ6F4/xenit8NS0KanOg+9jveghIYL2Ae/h4VJNMzrastkKxxwvzl66kR0fwF0p3I2FKKob8hbVMYRievtN4Qk/X/rdtgl6MacYJW36WWT6xXShMi86Z2Wsj0utMO4DPJ+Bw/ObzL0+aAMQEjULKBFWrqr/wr5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TyYkjnku; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-50917e02472so40586171cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 19:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774317673; x=1774922473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ty0hATXyl9HZHQUJuw2vSXKHAn6gPHhqKGm7bgTuFLw=;
        b=TyYkjnku7qv6q1ENylFnS9YJWc28ZGo6213ScifRy8wEMpXp3VDJmsqnk+XSrhyV0A
         ZfHlKYJFQaUm/zbgPM2x1O9Xo9HP4bDG6xlH/3ONQLYq4aC8qEYDd6yivA19pm8r1HNj
         qwF2iL9O8UyKw6SdiJKDddotFLyXRAy9DJDDQiW4yKyEtBx6ZcTLfjmTBI5bLIvacd3m
         ncatawGw1OelbN1Vrj3SRQzrbONs8Apc2pQWaQwmDeIKCVlkzrb78UgGI5q7u3n62Qk+
         2o0ZqdvBqDkr04R649sB6BClueU3JPlKwyxL2lF/yNC+Y1DlvuSGkL8k5CvJ+kw/ZEiT
         36YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774317673; x=1774922473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ty0hATXyl9HZHQUJuw2vSXKHAn6gPHhqKGm7bgTuFLw=;
        b=UaqmNEGXbapg69WgRuxX/E2+EN0OLFvEhBQ/CUISqInbrIQxAJ78yd6nmCH3F9fxAa
         ikBW9/sjhBuYsD39Nxdc7cXvwacbL9OZaMBXuzO9t+3ntAz1ihYFhXEWQXyMVL7pUFjd
         yf117y8tN6AbNoPIQZFwLMYQBs1SYlFoLf5G5pgCH7fA7uRupyfMjoXwGbmU7nINetLK
         dB1LQkzdODnMZp/jH8IKOVU2bTjyZyl4b1lzjbNcTC20XIgDmW31uidbXTQP4fNdmSpU
         GzYbhpKHKtB0HB007ZFoGbFxUFoDXR5/pBanQDwAhKSN7z2EdtEF+4/jruzPYLLSK5h6
         c2CA==
X-Forwarded-Encrypted: i=1; AJvYcCWwtFyn+tXTvsmVNxVaVso4HpRBqUa4Z8mfkfu+CMwPpoy2JuMI32AjEv1PZCTV3DRZI+kVOw2MV2ine9Mn@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0+6AluUSJXqssi89ch/e4J3Z03nLH6uvCJ2sUzte37CR1Dlj+
	bhcRnxiWsqyQXPv/tUlczjNESoRP/1b5pNps9YmHg/cxD/6V3xJAx7ad
X-Gm-Gg: ATEYQzzwoTkHWmUCApuK8ghTjHqGFfjRkkvOh+dzLimk3q/vM9KucJ4CCfnAAGSARpv
	1Y+3gZ7foEGjo1GZNx2IeLmxLlrUMFpawAAbikDI6pHY3DKp1NrUD+IQ8JIEDhY051/NJxuMXnM
	JuPX7W0JibLsZDt52sKrDuIi03nIxys40vf/Fzur26SKolaackJhXZ+skUxatDyvLsbCG/ynStk
	9qO7rDej7YJTH91jACFjU/Ry50IzLD2sd5R9qLsLD0VR2eZy6LWB94wP5xOtqgOQ7bfODqe0oae
	Ha/jSwQaRYTywUYw36y9G5JuvVZJ8z4SQvoK5yHht6ZdzmMY4v6d19nsATnyjQ9OnXa5UdU0+d3
	8ErUjb/OLDLvrk29HKvbJ1NQvUDp+cdDwyk2jEIgVqYhZ/8D6HIFsTCwVL17cBUK/gbO+1e2FYb
	b5S8/cesYGE0epitgNMnhkbjdrWg==
X-Received: by 2002:a05:622a:1486:b0:509:456e:a179 with SMTP id d75a77b69052e-50b3757374fmr219881111cf.64.1774317672550;
        Mon, 23 Mar 2026 19:01:12 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b6d19789bsm15864691cf.29.2026.03.23.19.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 19:01:11 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Bryan O'Donoghue" <bod@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
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
Subject: [PATCH v11 1/7] dt-bindings: media: qcom,sdm670-camss: Remove clock-lanes requirement
Date: Mon, 23 Mar 2026 22:01:26 -0400
Message-ID: <20260324020132.8683-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260324020132.8683-1-mailingradian@gmail.com>
References: <20260324020132.8683-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,intel.com,linux.intel.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[collabora.com,ixit.cz,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-99493-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.2:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4412E300F36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The clock-lanes property has no effect on the hardware configuration, as
of commit 336136e197e2 ("media: dt-bindings: media: camss: Remove
clock-lane property"). Since boards with new camss support can omit the
property, remove it from the required lists.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
index 46cc7fff1599..084b65740d53 100644
--- a/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sdm670-camss.yaml
@@ -124,7 +124,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@1:
@@ -147,7 +146,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
       port@2:
@@ -170,7 +168,6 @@ properties:
                 maxItems: 4
 
             required:
-              - clock-lanes
               - data-lanes
 
 required:
-- 
2.53.0


