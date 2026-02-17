Return-Path: <linux-arm-msm+bounces-93025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMYgE42xk2kK7wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:08:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BC37C148332
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 01:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AB7EA30160CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 00:08:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA1AF1D63F0;
	Tue, 17 Feb 2026 00:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TWNJoeZf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74CF1A9FAF
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 00:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771286922; cv=none; b=bueJOPd/p5Vd0vY5JsAgJXNIV/NT+wSHHSfyFrkMzyKt/Y/UXsFdtj6Ror/yKnBo3lQXBneBdq1ZTkQjlRYE2ZpYCwpOr688hkPpgV7VwaBH6gTjkz0t4qsv4uD77bOaruiYZEnhR+4qqAUw3OwAjia7ILi4UdIso1KbZXUyYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771286922; c=relaxed/simple;
	bh=UCbTN8QOD/U37r+qzSPFZzyQ/vbpx7Nk40U3KtWZMyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=drPao4kKdwkUcJIs2EX+o9iTaXAm+PD4u2Uso6xOUOcgQSC00WsEH9gjsm9PDnohqXUu3Xc2Qjt9t7ArcGEMN8V9N6QG3fbJv6ZpZ8GCZ0DI4jwFwBtOTZL8y8uFF5yrjW6jENm2dAFIhgP404VF2YVEUa6U/BvsK+p56T7fw6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TWNJoeZf; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-8cb38e86cf2so398376685a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 16:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771286921; x=1771891721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyU+RQGolTTl+pL9xn1xmUSpDZLlt9dF+KwDZqgIB8M=;
        b=TWNJoeZf6IBkZlFFphgoKT+XBsLhB9ysLL6r8wkZju48nrJKsrTPIWaTUu9MY47V/M
         mTs4pe5CFrYjmP4Z5cNS0krHFm8bwZo9Ge99jfHur3F27RRMIvLdQHj/xlrZ9bohQF/c
         Q8fdLTczcUNr40W1X04LLWd7UcI3PKAczPCrHfDLawNCHgsK69f6kg8EF8nelWw2jNdf
         Ac2lusEdcJMuZV13TBc6WSa2iKUaJdy02KVhd7F69+2Q6NrM8VveW/TziGzSkXiMQ4cY
         8c1BFZxRO3w1H0f6WyfL1vo+FNiRqTUuzoeCHspUXGnqF8aKWdpo5bvDq28XTHYAjHBf
         wndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771286921; x=1771891721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OyU+RQGolTTl+pL9xn1xmUSpDZLlt9dF+KwDZqgIB8M=;
        b=ZvYmFM7QhyN8VDIQ7H7fV4OOd+x82vh1qfYMdvqSKX1+gnZuL64RSk044/i2q2TD8m
         ks6/E/1VME8Bj/iz1BARLYyuXwjbz3PFtxF+tt8hBOfAcU8exPUyHWSMWXXkJrhVYsKD
         GU9JHMuTeH7rFdpI5A4lTDftViwfpTVnAfP3oCXC/PquiE46170Sp4VppqC+MbPvzDWf
         jQCIg5prr8qRbiujKREAGwrze2MyEoUpmwwzklcezyOjv+Y87YfiNO8v02W0WmULa1/e
         1dyEc023E7CEsy6H04lcRE+lTK+djJ7e8v2ABjSFDGBQcnRjJhn9vixXa9u0MbSFEXvS
         d3/w==
X-Forwarded-Encrypted: i=1; AJvYcCV73aqzgnpXDEWcnjmvZ5c4oCVxNcJpt7AV4hGxfcMj5MiCh+f0g8x2/wPNphxr82B0th6KbFvVwSLMX2Vh@vger.kernel.org
X-Gm-Message-State: AOJu0YySQdEqwHbqFHwz/sWAtL6hRbKD6Ea7Dptl6YPPpuTqy8arMVRe
	ip4HtKqYcw7ezF1/iP2aducjWdX8xDutem15hKO7OSwQ6AqeKYnxvRUO
X-Gm-Gg: AZuq6aJHYtopUClu0AvfrEUGxV2ebdsxprQjLJRs15eOe7UEanrTfG4/aOHEmrGMKGZ
	xpMCHQhT474ryUVMCbRfPMUWrnx49XtuNwDYg7BQClnspvlF/i4Uae+lMbweHxNwggLWs8G358p
	i/vd6qigNsLy51teKtZqDFJODKnu3N5UC7b9C3bSFO9IuE9RIMLu+inuoliGN7ymy9yVsBQCmSg
	Ct6DAq9LW/sWNMV/Y1RiX2JiuXoct5SipCJUy6MZQ46R5VFWHPlGJ+793qH4jOXvgcofT9AYRnk
	FK21g3OrSQA/1BmKFBE/+Jhny2JaBuTpE8Nso4WTjsy6KU850WA9abWQazRo28pD0ZA/p7rbieg
	6qr1fF5XtBeLaEFcBI/tYU2qhPT//pucAU7Dn3menZj9PtR8LRFh70DHium7RLbOlzCXK78qT0W
	V8E54AJX2809Hi66jyV1taqSAOVHNfLBcpJoZff1N5
X-Received: by 2002:a05:620a:3710:b0:8c7:fdc:e853 with SMTP id af79cd13be357-8cb4225fbe0mr1517757685a.1.1771286920626;
        Mon, 16 Feb 2026 16:08:40 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b004eecsm1380960685a.0.2026.02.16.16.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 16:08:40 -0800 (PST)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: yifei@zhan.science,
	Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 1/6] dt-bindings: arm: qcom: document google,bonito-tianma board
Date: Mon, 16 Feb 2026 19:08:49 -0500
Message-ID: <20260217000854.131242-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260217000854.131242-1-mailingradian@gmail.com>
References: <20260217000854.131242-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-93025-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zhan.science,gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BC37C148332
X-Rspamd-Action: no action

The Pixel 3a XL is code-named by Google as "bonito". The
google,bonito-tianma compatible represents a variant of the Pixel 3a XL
board with a Tianma/Novatek NT37700F panel. Document the google,bonito
board compatible and the google,bonito-tianma variant in the bindings.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d84bd3bca201..59118faffb02 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -831,6 +831,12 @@ properties:
               - google,sargo
           - const: qcom,sdm670
 
+      - items:
+          - enum:
+              - google,bonito-tianma
+          - const: google,bonito
+          - const: qcom,sdm670
+
       - items:
           - enum:
               - qcom,sdx55-mtp
-- 
2.53.0


