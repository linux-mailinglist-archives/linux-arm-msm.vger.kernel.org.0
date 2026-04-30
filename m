Return-Path: <linux-arm-msm+bounces-105405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJjfJ+CV82nQ5AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105405-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:48:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 060534A6936
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 19:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C37B3035AB7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 17:47:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E5747A0CB;
	Thu, 30 Apr 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="QSiH3k9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852B447887B
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777571267; cv=none; b=la3VMH11Fm0HVZSnNUGCoX8F4/lyaemVJOsf/Wo37poUulq/p5fw5c/umykByTchip/EvcZsJ1jMEK1yAXSqm9vPangCrUEY+TeDPIkBoXa0XXnp4zfz5W18XXviGftQCEtAwQOmjoHh6w/6QiC2FQWhso+6VQ5dTFdS6pfNJSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777571267; c=relaxed/simple;
	bh=yiaD1q3Eo/UrebdhQBErSSmmy2q8AzQyw5B4P/F0IGw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RmjnaJDyyYo1P0ytAi8FS5tLg8mHUgDBNc3pzEe5taffm1nyR+CA8iQ1bIUwiz8U2dBvnpcPeErmpacoN0o/a20TtRdiJtX6CZAI+ZZntXSfgVTFaPOTUYJ6tpdX9B82AKaVU7gnaU48PkbqG+wzOCst+hoPqE0F4YfouS/iakc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=QSiH3k9q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so15604305e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 10:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1777571264; x=1778176064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F3/NzWJWCkR/MPt1qoN4RNWPWVChQ9AWvCEeS02wAAU=;
        b=QSiH3k9qR2JbS39ua2PmFuKK78JfMQui2vKp3Dgl3540GaT2VMIRf2bKG10AfliWLX
         U07UwOdOpxfRvgKpI4mMjFFsnDT3mNxVRaucDZDZghX9Jy+IdB1zIR4CamICAzr6RPbi
         5PmWKNVXQ+rHzLv7O3fA+Eg9fX2M1S63NKJtdlIcKi6tYAm2onaHf9Ct+CYFBpofPyd6
         hE0foCejIGM8RS2sKN277bOgluBACtMtJ7rcNZDaOpPqdTgU4YgaVox0mi2kOlxq39Dq
         h4bZswP1bSeXGxYUbJ1tVjFk1znyugRaCUxj7ZmyCDqpaaXxkf2BUOuQS20fJfHv6dc2
         6W0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571264; x=1778176064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=F3/NzWJWCkR/MPt1qoN4RNWPWVChQ9AWvCEeS02wAAU=;
        b=C4iERhZPWidljp49DBbsFNaHS1PBwQvF8aHl6CS1ZYDLz/kaTU/oxII+pPQkDvK24L
         PERBpSHYh0rASIR/etowB0wlOuLz9zQyNG4xRZl28ZP4ksFliXDY6y1w86SOlgRH8xbW
         sllWok3L8l38K/aQ6v5LNHodk6XvO7wpqkfghLNNXQrS1JuFbw8QYrdhPeeu+88rwZXZ
         dhqsqNfnhRAfQzGa60Bl6ZbAYPwkkBaD1No4CD0HP2M5EaMXvtPMzighlvLaRHPnPNbI
         kEGAkMpK1iHfj0yrAoKZ5bTVgc/P5EUrCfIvg6IbVt/WzLQqIIqkrzU0d1QX+68xx9PV
         TlBw==
X-Forwarded-Encrypted: i=1; AFNElJ/ZMijtorPf6AU89UoLv8RJoCzMat5VtDZMbAKshPJW+wB2K6tuleAyj6qreb95D29il6jwaoPLAIMAmG+3@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2be0KWvAa46+vh4+TVO+LoylJrBw8xTvBNjO+dD9s+2G8TZMB
	ikJPKtI3rtzZBVLS5bcA4M0N0+dgWMhH13e+Ivp/7nEucrLwV/pWn5XN4hxNNzBKLxs=
X-Gm-Gg: AeBDiesrzV/W0Y9mSXw3mDYoBspV3tHy/GygacMljAhzPOOSDgqRy5rwR1FS/qcFag6
	pq79CrMyybuR71qV8vXc+Aw+hPK3bFNOubck6oLecKkovfl0KgTgu9RVKZfv8aaGmgEHAHGb6wR
	FXhTzhX3A4/sIoGXisK89UYg002x1W6CxmrVwNdRiY0eer2SkuWeNvRaylC8fKHHtZjRJ6RtOxu
	sMKoZGo6ubFFKaqjbwp5sVFbCvF2V9p8tTDFyMORjHCPcqTz8yMHAeAnpPNGC3GiBEBliH6xawo
	+ZIWGCVzQuOdY5y8hHiqzygLxXqlhWcpHdZNty0eRMbmBHKb7rRHuQZidJKju7OVLLgd4T/7VzP
	7q3NrWSDea2K7Bx9XpWDCxS0CMWap2f9qykr0+R5S1t3aEhWGqeInihTVQ8w0kUPdq+MGjMJMf9
	OS+g7bIxACRoF4H/Cp+FfPrH2bURyu8UeZg0TLgXApocO/cq3mC/LYu7x3NxQE8yoheCztaxPaC
	CFhKgQjz+NXXNN+H9sByW7y8qtz3PesMqeaggF4T+OhRA==
X-Received: by 2002:a05:600c:83c5:b0:48a:5574:3a5b with SMTP id 5b1f17b1804b1-48a8448629emr69017555e9.27.1777571264100;
        Thu, 30 Apr 2026 10:47:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fd90:2598:5764:5f01])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c1d0228sm174449435e9.2.2026.04.30.10.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:47:43 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Thu, 30 Apr 2026 18:47:02 +0100
Subject: [PATCH RFC 2/3] dt-bindings: qcom: Document IMDT QCS8550 SBC and
 SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-imdt-qcs8550-sbc-rfc-v1-2-4d2b6675eaa3@imd-tec.com>
References: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
In-Reply-To: <20260430-imdt-qcs8550-sbc-rfc-v1-0-4d2b6675eaa3@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 060534A6936
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105405-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.
The IMDT QCS8550 SoM consists of a QCS8550, UFS and PMICs.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cc29b06621a9..5dcd794369e4 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1080,6 +1080,13 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - imdt,qcs8550-sbc
+          - const: imdt,qcs8550-som
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,sm8650-hdk

-- 
2.43.0


