Return-Path: <linux-arm-msm+bounces-91057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJUXLC0yemlo4gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:58:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB2BA4DA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 16:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DF0030D887F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 15:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C996B2F745C;
	Wed, 28 Jan 2026 15:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="M1Z3iG+N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BC330CDA1
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 15:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769615486; cv=none; b=fqTykxJlu1g6NDePJ/RLE0kIrOV596vjozYKo0ctSebFyhpzcZt1fKEWno/9K2M92Skt2eWet3yw8YuB9dyMgr/HDcIykOluNqp2X91HXHvy6rSqrI4Y5RZ1XyDPdZKIXam5Lz1wtZSo9sjaWxCAGF9chWUqb2gh+QI6iRvy86s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769615486; c=relaxed/simple;
	bh=UL7oG9FT+R61+JPV9a6SqQpi6w6GPW9Vnjs6JNCt/og=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EY/TCO9A/VMjD1WpKoootFKYlHEGXrZ7PCTW37oyLU0+O7cOQGgObviUSaK/87bIqIhFWhFL0GucfWK95tFbT7JySQo05wXAUYulMkVV1FDuwL4+rX5G0TYkoAhIn13TjrU0anNZiB/LUgIqGGLEwzCTZdTIm44Gk1Rlm+RnfR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=M1Z3iG+N; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6581af9c94aso52942a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 07:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1769615483; x=1770220283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxosYBC+jkycfgMD0yZ2twi1arJ37bFp4Lz2LJNYscE=;
        b=M1Z3iG+Nh+1QJG9YjegV3mDd0y2f/eABfzlHa4JUUHLmNc8JEDchlSBY0/cP8BPl6P
         /qQyxh7zaszqn57GTbUaunqRuPbcNiCFDtT4P96XPmFesRMiL/gmsGOFmUP+ra/JwM5N
         iiepMFobOHMtFJcSpSB31uEKjE5aEr/rcyeJCe8Gr4nLAArM0HaTJQ7FHX1w5M5vziHP
         e42qKj4qVOt1p2KBmWiES5WeQsGyENQHzaNF8OqE7KG/wZQAEroovDHiT006YBvkIqQF
         Daa0kcTyZLiVqOT5a/ia5/gKr8H5dWGFl3Shqs3wgSw2KvKPs+W3cVR3QGxEG/0SFpo/
         5BYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769615483; x=1770220283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxosYBC+jkycfgMD0yZ2twi1arJ37bFp4Lz2LJNYscE=;
        b=k0FMcUp9Wfr6eR54fuw0QIVYdS9oMTLbvkFYBBvkyg+iyetyeprUNbX1bTd58SZlIG
         4/v5r4cEglXeAUoKUnWp+/kgFkZBL90jpo5Mj1tL3V1LZIz4CQivbh3HXpWqfPsAilbp
         IB18wJru+PcodUi8sxVv53wgey/WuyDgE5quKUdbCYrvqC9Cklr3NkY+1M1OcS8Mj+kF
         O+ALVnQP9fCzZ5A3vGhtfauTmHRJZ/HNzNhAHhzQEWP6264z0ICA2tlXp02d3yE1y143
         x9P3miF30TDoRYH/8sXaUTxe1EGP3AQ9c6Xd7zThFaBM+/jOOyVKoYWwMIPPSooEjucd
         JlTg==
X-Forwarded-Encrypted: i=1; AJvYcCXLjgjp+Vfvf+J8g5GY1ehOg6MQnV3s9Dx+xTtKPW6rrUoCFHCmOFefOkf62c7fvoTZDVSxd0qZS/zo5P0a@vger.kernel.org
X-Gm-Message-State: AOJu0YzSyT53CLSb2UE8W99mJL/1dYW/0+xpga2AnSUzPcU4U3/lNwx1
	Wa5OpPMXl5V+kiiusyAejz4Ap7bytxiBIkK9NumdCs/E3bs0ShunGTiRge9FEmvrFvg=
X-Gm-Gg: AZuq6aJtl2q5biXCt36bKlQqM10S5yly3xzA5ebEtZS+4SBq0TOPtNwZ6H3ihvTkrBY
	KB0ZkcQ50CiIu1xgpwVyXhqphg9uR6MEGVhr4TJKa0D4zLcCrJWDRCdz4UKHqGHsH/a2nob/IbG
	zyE1Sa7TveOqp/qnyfTL9U0uXBrqB4sienyE/bkBfEF1eRI4U90QDFm95k0zTZK313GUqWFcb3S
	dB8BEK7nBuNa1GlGBw18rQuzzfmn5LcM+fYpcfnl10p2NULMGuXX1c25gbC3Ba5J93RlGxISsyc
	DqgLr+LKqUrrnvpaqUpHiWjjuPU4Wc68YauaZhqRktUv+xHsHXKSUI8UrI0XtU8mLZe/whEiv7N
	A6hnKuI5p3abF8WMdhCGFDKGXyK8zI1V2QVnc/R4rxMYKRj22lT4OsQJ64wl5CJRqS9B5n0fRwi
	LE9Exgxq/zazO27eP2u6lLgbxyjIZ4KKJ8tAdq7Pacd3uERVhPiABYYRq76gD1IZEFtoIU
X-Received: by 2002:a17:906:2083:b0:b8d:c364:5e28 with SMTP id a640c23a62f3a-b8dc3646fc5mr124941966b.63.1769615483312;
        Wed, 28 Jan 2026 07:51:23 -0800 (PST)
Received: from [172.16.220.227] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b469eb9fsm1727223a12.28.2026.01.28.07.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 07:51:22 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Wed, 28 Jan 2026 16:51:13 +0100
Subject: [PATCH v2 1/3] dt-bindings: input: awinic,aw86927: Add Awinic
 AW86938
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-aw86938-driver-v2-1-b51ee086aaf5@fairphone.com>
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
In-Reply-To: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769615481; l=1012;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=UL7oG9FT+R61+JPV9a6SqQpi6w6GPW9Vnjs6JNCt/og=;
 b=aKHTzT/lhB2bB2KgRAkb3dRYwVVJH10iCeA7sSYkoE3JdKHSQdw8kEiu1ul6PCRgbkNBJqsXZ
 A2S2CW4LHrwAxFJgRisWsUq1kJQKHfvZogbAIpcZgIyfxI9T8OLfGx4
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91057-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 6BB2BA4DA4
X-Rspamd-Action: no action

Add bindings for the Awinic AW86938 haptic chip which can be found in
smartphones. These two chips require a similar devicetree configuration,
but have a register layout that's not 100% compatible.
Still, we can document them in the same file.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/awinic,aw86927.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
index b7252916bd727486c1a98913d4ec3ef12422e4bd..c3dee660422192720da3cf63851cea27db819742 100644
--- a/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
+++ b/Documentation/devicetree/bindings/input/awinic,aw86927.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: awinic,aw86927
+    enum:
+      - awinic,aw86927
+      - awinic,aw86938
 
   reg:
     maxItems: 1

-- 
2.43.0


