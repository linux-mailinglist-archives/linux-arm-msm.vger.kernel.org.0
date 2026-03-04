Return-Path: <linux-arm-msm+bounces-95437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULu4JyaHqGn2vQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:25:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBC62070B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 20:25:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0338F308ED68
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 19:24:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEEA3DBD57;
	Wed,  4 Mar 2026 19:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCYms1KM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F533DBD6F
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 19:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772652267; cv=none; b=nLutGwIjcFG56zNWflQn7P7UPRlAdMQTW2hTG3QCC22chKSVoRnhxpKqX7xC8VzRkZGJ2o7qLfD15AtscSlG0usk6kxR5osN7do9Rrf71qSGc6EjLO4oF69NmoT7THNUOo5UfWd8p28HUufZ5SlNtBZxU4wT6QUNuQVtjCHhz/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772652267; c=relaxed/simple;
	bh=6ei+Huwh4PKhOxKolosUs5btGNjYQcybQcHfUM+2gg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OKtGVjzLza8/pr/4PGE9MZ70gQCXGBIPsjBL5a7JxchrCCMpjSi/iaRm/Ojgm5e2z5nzUuk0+SJ1OGWtvjwwQaPPs2pTWKSlc0O7xyjffNsLRrIL1flH/t3dtNoYq1pPXBkEIST9JWxfP1iybBAeGeI1BloAyVPAZ4nmaMhUSyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCYms1KM; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-679f6f0855bso4325771eaf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 11:24:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772652265; x=1773257065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fphkXrW0oEd5iFF9aoqhAXkr62Eqyv7ZOBulCkksYyw=;
        b=aCYms1KMm6GLVKucopsbzahvzXyQLOFUYtjFkjkmIkDtURSIhd09IgKwul3pyz2XQd
         poZSXR7G8Y3CavAaICLtFPr3KLmttlCMwJt2MDg9pqVagTQ25IyidxM0JoHDoNWc2T6d
         gPZX7HmtVWlCUdyTbiJWv63pnaQ6+Ol4bZ7eBewWHnBJTRXD47KS9n0ShHjAsYoYkgfX
         y6lqV8jJoDWpaAuh+m5Ilj6BvrRK0s7IUKTQ/t1MNcr/vVBFNKh9MF2lEAwwPsDcCKvA
         uypiIC6+0ST9LvYDhNDAjNBeFvS/vBwRdddI5nAVUz7Ok+P4qRTIM4btWxBP7WbuZofa
         dWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652265; x=1773257065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fphkXrW0oEd5iFF9aoqhAXkr62Eqyv7ZOBulCkksYyw=;
        b=pMXA2uBBB8XixBztjP4mxOmDV1NEO443NSS9/M7y3jG0EnL81bPePjB8Z77MiSl5BL
         Buj7a4AwdMoAxnKJ9WgDpAgEVb5V7z9RsMARobZBGabH1wvl1cIGxuWNlMyBZtgkzrLM
         bLfq35QjBick6c5wOx/ONo/i9mVRGHwfCuXz7lSfOHEdviLOI7sAAeDnwm4k3JoeGAVG
         /uBPVFBH6Jy0HOLRFFNsF4pxS9w5c8WTQLRnQ1DM7VNglL7tKR2N8NgRZ+eQUEwWH8D2
         SUnPAdyJB75Euz2lZLuDuQBPscn0kkLtDYN6xtvyPSIZ+ZMtmZfxfCpu8Qgh1ViKaP0G
         5CTA==
X-Forwarded-Encrypted: i=1; AJvYcCWU4KxeKNEu16yW/+DqOAaTKxJiObxa17c8CwmZC2mu0S1cVzes6tijXBEs23Ezfx/q6QKT0LQHWyE3GOAT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4LHvsXOB2aLWmjSdomleNvUV/ElST4SMKUJBWZagBLmGI/grW
	9tGop5eP/B32mJXgrLRrZUO7naZEukWSPdIxAQbmdJrzCWrE6qHcLl5X
X-Gm-Gg: ATEYQzzvS7Y5n9PpoO62Bu7FGOOUJguQjVzpcmP2ZsWSIaeNl576/oiu4lAAgmjT9yB
	dU/hANevqWB0aSNVrxlD9KHfrx2Z+VnbJ0Xzw1RZRDa/eqxHhIoPHtTqLzx0qcuV63R+HXeWTIA
	l5RmwXCo18FQYWAKVoC52t6B7/MFv+4thKi6+bp1p7mdV11YQmkQKZtAFlGgkCvvebaUvgwcXL5
	YWraGgrxcSkMVkA0pA7QqRGFHcGWbGbtBBkbEjmi+P/Gvr8weoOur+k2zLHArH029GRmHMZufGK
	tRY6O4IgeKUW3niiNEdyvokXBknUSipKS3aYEJe+eY3EHW0r8YdqN4IAfv7yL2GiewsXOh1zSsM
	8nJj8VDw78Aj7UpYeIdvlqi1MvUpNMdfwxLb/+aW7U4LDNmGGgo0AMsCeORkyI5OoM9VXgBs+Sv
	Ma57B7/K5LSkCiEsCeetCQKljBkIbseMUL33i0eTV5/DM+glND4BDpboJIZU52EV2LX1BRGtwVY
	6HeLGEPsbl6JSQoF1Xq8p+YWgS4Y/kLa9+bmkea5g==
X-Received: by 2002:a05:6820:208d:b0:676:d076:e4ce with SMTP id 006d021491bc7-67b1e903320mr1702204eaf.68.1772652265335;
        Wed, 04 Mar 2026 11:24:25 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:5b2b:e942:c11b:ed62])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2d85297sm13294165eaf.11.2026.03.04.11.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:24:24 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>
Subject: [PATCH 3/3] dt-bindings: remoteproc: qcom,wcnss-pil: add WCN3610 compatible
Date: Wed,  4 Mar 2026 13:24:09 -0600
Message-ID: <20260304192409.927562-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260304192409.927562-1-kerigancreighton@gmail.com>
References: <20260304192409.927562-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4BBC62070B7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,lists.infradead.org,kernel.org,linaro.org,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-95437-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kerigancreighton@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Document the qcom,wcn3610 compatible string for use with
the qcom_wcnss_iris remoteproc driver.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
---
 Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
index 117fb4d0c4..018cdf5177 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,wcnss-pil.yaml
@@ -109,6 +109,7 @@ properties:
     properties:
       compatible:
         enum:
+          - qcom,wcn3610
           - qcom,wcn3620
           - qcom,wcn3660
           - qcom,wcn3660b
-- 
2.53.0


