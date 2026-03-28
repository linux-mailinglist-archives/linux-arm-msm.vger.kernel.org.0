Return-Path: <linux-arm-msm+bounces-100521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id nuezJ4k4x2nSUQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:10:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3011834CFEF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 03:10:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AEA9302AA63
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:10:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4896A3559C9;
	Sat, 28 Mar 2026 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qZuGNvUx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B6C33CE80
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 02:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774663815; cv=none; b=kfDaSzQOKv0ulHimxaYO8n3WGTX2ZYD1KjzFWsbEenUC2jG9v7hh8iVOTZZChQFZJuUHN2LX2SE8rjPKrTxpRyPTErbXesjJoMZRLVQYdz7nsvcNabkupOwjYe2bRLUWH4PXYGFlPD8hXaC1UNYfoCoFXn1ar3FLJLM1KyfHNYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774663815; c=relaxed/simple;
	bh=zJPyjta3QLSXoZw42QVF4jNijJKutu70WwFNGkQPwFc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=At+NbhDgmqeYsrXie9x+sa+69kiwEAR9Dw8w7U6/e+xNo0Px6ioNDLJEDJ+C6jt8XSP9VTLBs2BDZExxEUq0f6gYOv/ADITf3IbxgFMmEowtK/dqosb5B6LKhYkY8p6Uhb2wTrGLR5g6BMuku2GBJef4SOHFqU9+zQYbfUDtpYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qZuGNvUx; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8d00cf835b7so360319485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774663813; x=1775268613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=qZuGNvUxLe0dfIUkn8XveRLN2K669SijhplCkrADD8HezrkwnYlTcx26Viu6IMOoDC
         pDVaJTorK1u808kjLogXVTLIOAzlpvI5sxjPvXydPEMGjnCzLe2qOM5klziQO/1q37y5
         XuOfePRtCksUhrlI/0k45KU/xPzG4+nQ10HZsGnpgyP9mvcSfGVsPhgitin6w8TcNdx1
         Db0QZcSR33OEJl2cRzJHITYFIJRrtzoNOucHbrYmp7Y74+rFTlv4MDU80CNv8jM7vIfq
         TaidA90fj0Db675ZhpXarFQQEVX92KY1i1W4QNS28zVzyq66lEhhMxDhn9jd7kwGoXPE
         4Yew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774663813; x=1775268613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y79BlWEWTg9b8lgzADfvCeuR3QiTHOYZHrj4HPIVc/8=;
        b=oAZYKsF0tjE6Y5R3amguVwVkHqSxby+yzD4jWs9F2hvKbXVhCKZvTnsMifHYaOPzN3
         Ho+jbk5uIRZh6mAKe5rJjDPl8PpDo/Za80C6mTaqu7mdgSN8Slblo77tAPupFjDGIi2c
         6zIWjmA+gaBDcQ2NxFq1ayiiBc5WmYxgarbX7pg0T+SJ4tUBaMp8XyM/lfLEKaeQQLXW
         3+F+OsdG555aiAlf0Qbu+WYrh5PTHTTEgTJiy2hzV7GTGtWnf2S/TI9HmErUUAloIZdM
         qQZfckK6r8ri23+sOih3EoutzOg2k9Vy5vebQw/iQ1i+Or+i48iZ+Js99zqg0zKMCsEA
         iHJA==
X-Forwarded-Encrypted: i=1; AJvYcCVKwfvNq111gdO7d56oZl+nTUtWq0O5QTbe5YT0eMe0YJJUGNbDfWrSipsN1++fW0yF1wEAmEr4YGxbw+Dz@vger.kernel.org
X-Gm-Message-State: AOJu0YxoKatNR1GTmCbsE29ea/eUjb9qF0LnGTeqKnL27paqGaxk4nHC
	+Hlm/aFhVB5uanIK8e8OBUdXgC4SWXhOHxwRRF+Ya31rtGYSXZkVPmen
X-Gm-Gg: ATEYQzwosyjoYulANzCsg/MxVbRGNE7oWFbJjyWOgq9ldrneM8RRz69JOaRqSqNcybh
	hJBZETp5waQW3W+jj/Gr0qqu5jinMy41t7Fzg3BIK5pq/TlgUrx7qobuDFnvMwNipIKcYTC/mow
	K5MRfvl3owynyTK2ExmHR87/M01Wcx+sU0nxXfylHZcy+Ax4OC/ysxudTgCev4LbwwK8BaeEuNy
	TlMQQ6tuW+cXkRinUo0VgWkMGl2ZnXT/hwNrm+4xvMk7Qbz+Vdx9/6sdclb2oqOpuM+oyHSIHsi
	cXq8OjVigx1vq73MgE6RcEWBKT65DP0mETYxdnIdM1fi5uK+bpe5eh0spX9S7bpUQT0j9p9jAj1
	iYI8UgzTSbbxxz34+kl1GRzXhdq47FESYM7P1hVdizRukyLBP26lsxvo8WaAgJu4bFwQ5Xc+Q1s
	XIGwevxyRkkQ+ZJQanHJepILkd/A==
X-Received: by 2002:a05:620a:1a0b:b0:8cf:de1c:edeb with SMTP id af79cd13be357-8d01c58f42bmr597133385a.9.1774663813037;
        Fri, 27 Mar 2026 19:10:13 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d027ed7ed0sm72120185a.2.2026.03.27.19.10.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 19:10:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v3 1/5] dt-bindings: qcom: lpass-lpi-common: add reserved GPIOs property
Date: Fri, 27 Mar 2026 22:10:32 -0400
Message-ID: <20260328021036.85945-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328021036.85945-1-mailingradian@gmail.com>
References: <20260328021036.85945-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100521-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3011834CFEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There can be reserved GPIOs on the LPASS LPI pin controller to possibly
control sensors. Add the property for reserved GPIOs so they can be
avoided appropriately.

Adapted from the same entry in qcom,tlmm-common.yaml.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../bindings/pinctrl/qcom,lpass-lpi-common.yaml           | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
index 619341dd637c..30f93b8159fd 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,lpass-lpi-common.yaml
@@ -27,6 +27,14 @@ properties:
   gpio-ranges:
     maxItems: 1
 
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 30
+    description:
+      Pins can be reserved for trusted applications or for LPASS, thereby
+      inaccessible from the OS. This property can be used to mark the pins
+      which resources should not be accessed by the OS.
+
 required:
   - gpio-controller
   - "#gpio-cells"
-- 
2.53.0


