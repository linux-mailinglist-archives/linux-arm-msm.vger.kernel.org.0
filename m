Return-Path: <linux-arm-msm+bounces-106683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qOBdKNTd/Wn0jwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:57:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E12A4F6A21
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 14:57:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B3B69306D81E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 12:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 820E63E1D08;
	Fri,  8 May 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mbwRNt+Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99823E122B
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 12:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778244811; cv=none; b=iDrMVgqrhFKYdnn3zjDQn0SrnRQ2tVfD6F5PF7Q2UQCt53r8O/N1p+phzHYw6OdGoaK4uGfQcApYiYpA92GW0JHVULzpnV5j8GpnZfMRjhvOtEELq0bVFv/ckH0IevkSJFTOYTfftghTFp/uDyeZ130MKJWlMjWzccvwGqHWJiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778244811; c=relaxed/simple;
	bh=mBgePVtH8KP/YKm5cr3Eyl6uZOeX81yQ6wflLgUtcGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z9yWmFHkiKdIwJOKfIGNzKdkc7VQivqeIxLl08EKSwfh32UVA3oI7JrXTuEk/9JRAj1JdnssNkHvFQ28s6rTuMnrJyfLm3xocwjyZkoEPHHXWzaFPm6cB9kOki7w49c0eY14qwTl9U5Z1tQh1vu5oQtVk16bOgFgspHvwaTXs7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mbwRNt+Y; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bc1f0f48351so317453866b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 05:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1778244808; x=1778849608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2tjmcAcW5PrkABseVYIXfoZIwvpSsM/t14LO/QfHcsY=;
        b=mbwRNt+YM2cROsdr40YPiyuI9t+Z2lPvmqRVQptuo7vVCVGxwP2gZpWK9kLw9KpwXn
         SRNeaPbVh88tP6MP7LnrVADSDW3RsQRCcERwk9xODzWi+sxuRQ96PsBNyJVfqsNhHAol
         wmqT67drVkF2XEBMLRijIQp3m05B3wsiRiMwAtfF2At84jLCwivZOekGBBlm7KERcv0v
         QL/3sA+7Vck6fget1FNpBasQa3K/bEOM5xZ0BlJA28QohZhOfZctQnNiu9HpbMiK3sec
         H56/XsGCeCHOpeGZT3uZyFokjNSwjGKTGbIrmmd/hEjYG3BCwJBB2/800a9hJbLKLtJG
         ssbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778244808; x=1778849608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2tjmcAcW5PrkABseVYIXfoZIwvpSsM/t14LO/QfHcsY=;
        b=S9TFrSDFeJlpOW+WfYm9/wLpHCHPA3BJNy4GW9/fE0r29u9GxVGYVbg8AL+lS4+VYq
         1VppD8rlc5W4DHYWBergbfSuqE3otUsTUUj+8WXfD9A6LM2OiN1x1rCtQ/x0LE0c8v3B
         UfEUHVkkrZplvsYpyVvpg/8BR2pvdv9ghEVq6TrVBZDKI7iRcYSNjrnkaP+alM5LVbIp
         /coJRELWH4WR61e/hoLAbqaLaqIwPm7NeUVbQ1/XixwdozKAENI1d5yLHkyyYiqykADQ
         DNRq1fRo3J2lO7ebqFCDXZbgE/zGMPHiVnSGoI4xCihG7+JFsSJXY3ta+R9CGWzKsLoM
         A+ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ/jU9PpkRaXEET7PmWueugwGRAZZdXq2fivjEc6MJcgBeQF2qMoDFTbqOcFQIJktLgzabDbCOBEId8oxS3V@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv9caHT3o0uOtOJvjs5YSGIhRVKB3pEk+FiYVeUnqIBxFbPj9S
	ynPIcfZnj5vaWnlzqszg4ga78JcYlKKOXeikLahjKCa5L7EFCZXBveRqOHo5Fwm9kLo=
X-Gm-Gg: AeBDieveAPDG4fmwYBV0pJEBaW+sBKE1/QuOFuUPpm0n9MBP5BprhijapYrukfBUtaO
	9SNutOH0ouU5dfoBoaqlHLsp5wRFwjAS1hUks7eHBGl4iZnf22TyM8t1D4GPxSIINM6waoXj/0+
	L2A6y8NaHCbD0Lq3A9EZLDKM/3EUb3GorHtCqaKZpeYWgtL60avGUQKtDtiShRAo4Ht9rjstU58
	TR4WY0bkfxcXnxqcDfRXA827RS5juR+t16shko/8YWvqXDIzgwbSEgj7MY5gmbRf/mv8uEzA2OY
	Aj1yd+R6JAgGO9hdwL8Jwz36KP2Ul1RVkBJlvI/QJhYP37bucpi8vv/8W/+Nbi/JSIU3E7cAQBI
	VPWY/FLRzQBjjc6VQ9CjcUmcOIGVdeVjTKVYTv9A7mt+/vZuefqtFTAPQXMKD4F/haN5IQm9rVy
	CfzjwQmbyZg/vNk72qhnl5b393eMaf1z7wzOT3lwXa4sd5IiFWJK0R0tOi2jLfa1afkI5AAhABn
	k6GSYeZtQ==
X-Received: by 2002:a17:907:1b0e:b0:bc5:113c:1b55 with SMTP id a640c23a62f3a-bc56af25895mr720284866b.8.1778244806334;
        Fri, 08 May 2026 05:53:26 -0700 (PDT)
Received: from [172.16.220.224] (144-178-202-139.static.ef-service.nl. [144.178.202.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bcb94415c94sm800266b.53.2026.05.08.05.53.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:53:26 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Fri, 08 May 2026 14:53:14 +0200
Subject: [PATCH RFC 2/4] dt-bindings: input: gpio-keys: Add vdd-supply
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-gpiokeys-vdd-supply-v1-2-0bb32e8e6428@fairphone.com>
References: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
In-Reply-To: <20260508-gpiokeys-vdd-supply-v1-0-0bb32e8e6428@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778244804; l=957;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=mBgePVtH8KP/YKm5cr3Eyl6uZOeX81yQ6wflLgUtcGM=;
 b=WddPCLUCCtWRzxnRp+iKtWZQgqxMpRDewJw5kUnR+eMEezJiWtPHBRZUNrMrmNDpdneL2eVIb
 j7idWog00kqBtVZd1Kg4LjLn4llJmw/T24cMRtVmL5m+JHAwt4miMGq
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=
X-Rspamd-Queue-Id: 4E12A4F6A21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106683-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,fairphone.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[griffin.kroah@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email,fairphone.com:mid,fairphone.com:dkim]
X-Rspamd-Action: no action

Allow the use of vdd-supply regulators for gpio-keys. For example, the
Fairphone Gen. 6 Hall effect sensor requires this functionality.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 Documentation/devicetree/bindings/input/gpio-keys.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/gpio-keys.yaml b/Documentation/devicetree/bindings/input/gpio-keys.yaml
index cc78c2152921308fe0cad3e29ca78a5fad08f066..9c5ec1e7d0fc7ea236c161c7bd5a041aafdd07a1 100644
--- a/Documentation/devicetree/bindings/input/gpio-keys.yaml
+++ b/Documentation/devicetree/bindings/input/gpio-keys.yaml
@@ -102,6 +102,10 @@ patternProperties:
           which can be disabled to suppress events from the button.
         type: boolean
 
+      vdd-supply:
+        description:
+          Regulator that provides a VDD power supply.
+
     required:
       - linux,code
 

-- 
2.43.0


