Return-Path: <linux-arm-msm+bounces-100516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6BySIvExx2mNUAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100516-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:42:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B734CF7A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 02:42:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A5D730330B7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2026 01:40:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D15B73358AD;
	Sat, 28 Mar 2026 01:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mtPRrAJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93079258EFF
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2026 01:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662020; cv=none; b=gNDuQWlfC3R1BUn2VB0gRlD4k+oPObGu0yB7bMj4lP6jcfuTwsl1biPok1efiuJIB5MwFsNflJuJYqweYvn+Z6DNidlJxCWg5USDWLXkryS6gKkxt8rXLsGv4SCIeURzqcyV2Jnrsb1mUYOUNiAJxaU1b5Wib27CStZqKsU5mBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662020; c=relaxed/simple;
	bh=zT7VHqFCzDwH7dsnqHKBT6R20zasdavK49rOXk8BcyE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDbvRjmnj2SsvNOj8ZuD/TmUxA/wFccaI5mwqxw1dxAdPBFMgdJSNQgIdkkRKp3945uC8CCvCWLBfrjkrObtoRO4bbdIBBg8i5hf9ngLrdEDo0xZ5iZYcEigwLbfnFWjkFoPDXRW8uQDwopM9zpUDc4rOU0qKlZUHSEbeP28fYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mtPRrAJ+; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-89a05955720so32216396d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662019; x=1775266819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=mtPRrAJ+pqsF5FnO70VI9mouu3eW5yop9f+1bevUFzIDsg+h51skGW+X8tPfo+jWaX
         ECUdPDFjOOMGQ2IBwojcr566WbTbMSG6+SCFiOv6yqklCZynCVgz4bDfOad22N7tm+ys
         rMBQ0byNcByd+PDouRg1HQICtxYkmQ8lAcWWlKMJ6LJt65VFCJE+tS5C3JRXZBJs9Ca8
         mg/B3kIx93gsqHctQP+d7yULNGYOCYdXDbm/BQu5NXF8IfEWiCrwoY7/xFlS6owELTlF
         C55Rs5uCgbGHwI6VCMaAeRJTBj0AtrNP2ObJnEefkr3mYc+8HD/pI+BIl+fBqtSFTQxe
         moEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662019; x=1775266819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yqMq09LrRUJ7Y1qu+vRwg7gsZM0+ELiCGik6jbn1EcI=;
        b=hT2dlwphBTjpX4UGBZYlMcpV8nutEs6bFRTEx0gxOrx1gbjvV7VEFIVfRt5OHx8mm+
         mkfO0oPn/EnswuLJ7guCh05fl8B0Ilb1+m4g/kMUJfyvZ3Wph5qSeyYKvORHiYA1z7aW
         Xi95yzFp8EQVwGpOKip3kjFS/n5pI0rVJtj3OOZ05qV05u0tLpM/Mjs4uhJsz91Boeya
         TOdUv8emvyFD6cVWfVkJGV4fPPiH416ZuuiisiwrvP8qisz6WfEnJ3xG2p7jqdIl20Qe
         oIem6vN408Un1humODNxMVH6YWMErXdywPxVjFeS2V9jWvwHwkj7hSeV7Qc/tWM5/6qp
         VbiA==
X-Forwarded-Encrypted: i=1; AJvYcCXxR4hGCjuxaWei5+AvuzpmdUYOtdS9VGUyTs4xg5IIcksL5Z6DrXBMAKFXy6TiqX+6yUzhw0gCS/PivDku@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Y84owhQqkuYObFbd+O5yIwXDOs+Ujp3VQhUx8f75KNkbYeL9
	J73IyD4jdjvsrEuSKCK+cWt4JdjgKDySOMeeUVCQk6HSb1PpnHnh7eam
X-Gm-Gg: ATEYQzzDCjKixvs6edL3zKTbtJYOuW1558BTZvVqbsmBJ0lsaoB/nGtoELEDmFRQoDr
	YzFrlyKXJm7FlKGW9Y/2dJwh5lv4XIw2/kwSMVv/Dx7meSZxj8E3JDXobTMFMoLeMG6L1v9ml1t
	ZpplhNfyaTUSWQuX3b6pIy86ZGpHOnaF4NTP4LXQK4Erjt/mifkofiJrXjQxcSh0BcLpO7TXAIG
	btPs0ZnYvImw5k6LPouVgKkslEHBLUJ2FbIanSGSZRBZ2ThWym9hUa3Z6nNW4kpFmQ1fu7JkzQL
	5KJeDUFSKUmyyHATFyddeI+W2odgMvBy5Ecwy2T0Q85SGhBouVjvgsHkw0okuFoKV4WoZav9RZC
	h3vPtBYycwzKXFeMZR0CLmUqCYgtbrLgl8+k7WmW2NtfT6ecNc4Q5j+sWr+pFoM72MhJLKjl+m2
	OjPA/kM1xN9S9CVpDwX0+5oWwQK2LVxO0FHvQO
X-Received: by 2002:a05:6214:3485:b0:89a:7d9:34ae with SMTP id 6a1803df08f44-89ce8e4623fmr59571016d6.38.1774662018687;
        Fri, 27 Mar 2026 18:40:18 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf95f3c1sm6393206d6.40.2026.03.27.18.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:18 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 1/4] dt-bindings: thermal: tsens: add SDM670 compatible
Date: Fri, 27 Mar 2026 21:40:38 -0400
Message-ID: <20260328014041.83777-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100516-lists,linux-arm-msm=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[kernel.org,intel.com,arm.com,gmail.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mailingradian@gmail.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 0D4B734CF7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the compatible for the thermal sensors on the SDM670.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 3c5256b0cd9f..6c84f22ae322 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -71,6 +71,7 @@ properties:
               - qcom,sc8180x-tsens
               - qcom,sc8280xp-tsens
               - qcom,sdm630-tsens
+              - qcom,sdm670-tsens
               - qcom,sdm845-tsens
               - qcom,sm6115-tsens
               - qcom,sm6350-tsens
-- 
2.53.0


