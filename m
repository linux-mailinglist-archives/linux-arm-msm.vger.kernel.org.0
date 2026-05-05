Return-Path: <linux-arm-msm+bounces-106014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDJRLcZO+mndMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:10:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC204D37A0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:10:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A1411300B3E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 279763DC4A3;
	Tue,  5 May 2026 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="T1G44FKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F103D8116
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 20:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011807; cv=none; b=rQ5P0DvnOiwNgZLvSbk2A9x9gtxeAJ58AWXc4kGdoC0Z/gWLn4GJ+YGvxtKUSNAN+zxscCtyzP29LfGTuVwTkgkLOJt097/lxmGbwiwMxtdWxAECoTn2bLLZyYtlSCTYLPYnKWrusWyNhR4NNH6DlCV5KCIrCKY4DDKuECyJnv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011807; c=relaxed/simple;
	bh=TRGEKvJ6Iqdx7ZQx5DnaJWhu5fsdHhi59qNdlDoEd18=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FiHaf2L3RLLlsA6Swh3lxoXD8XMoBgq2j9gTYxQACsIp5q0V7s0cprgEV8fP1eS41N7QhmkEeZuMkAKpteCZQBsjJNnwwWhlV0BGOCi8hMCzD2lRUj4FndU7bDQ2sQhBBcD3HWqEmBR++u/2C6QUtZ7Cbh1XPIKUg79331iGMn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=T1G44FKD; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso41016555e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011805; x=1778616605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IuhOGeMWVCVXpPXG4XXMNEC+xjr0XhuplPJVkm91/Rk=;
        b=T1G44FKD3KMZVvQqANPMuEUAC7HZW4NLIUJosrfjSas6kH43a0ag4oTnFLh004l0jv
         2pJw2WNTm16sAk/Yag0nn9zLAzxag58kVENHsQfDIijSTtAgrqTQOV6qteFzQCM5ozLm
         grRQHyZY8msWJ4IfdbiWoqcKXMBXn299VeHhmL4nQ2cEsQaAtWNPq2k0hcdGPmq5W4kO
         B1nNj/vDH2nXvURQ2l2S8pdgkTnOEXOYYygCRP32VJv4Utx39+sTehtM6YE2pqJ6X1Ae
         4YyoWTP8F8lQPI3S6640xxwwWbaiJN60aiWwdEi1LDK+UuvvLytdUWUp62/HyZ5ro1fB
         9fJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011805; x=1778616605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IuhOGeMWVCVXpPXG4XXMNEC+xjr0XhuplPJVkm91/Rk=;
        b=Fs3fq4Y7rw12ANN/ck7zbIxfbPKwV7ksM9cnqQ7PDOOXU6eDUWpwrD6JqDV+4KJJGr
         QEtm6oJm2XnaGzmt0sVgjtNlxL3kWqP+5XmcomCK7zjWidaMkXvNgR1osL3bPPo3CGQD
         Y/X8ZET4tlkXJdIlXm+S3v7qvpB/S2ac71N30F4MEk98cJoZXaZRUn/5NH3ZGRjt21wB
         0qNb8ryJH7IAmWF4GJnkGCUiuUiohp2QCoJhW4qf/6pkFdF6IiWo2oMtrdWnps4UJeC9
         wGtY1QICCK+J9KB9fWi/YA5H3RzDc4vrtIVJ/+uBJpF9I6jl9eGSvha26W++afYJjBbt
         5q3w==
X-Forwarded-Encrypted: i=1; AFNElJ+lEpWJvENiPYJZqr6Ms9vxRwvjPxWqMs7spnNJZ18W3MH2susK65Qd2h3pN3xk/IOVbpLQnEQg6Bljg1vU@vger.kernel.org
X-Gm-Message-State: AOJu0YyfPdHYA5HkRI8EX/OMUyFzmNSMGcAkVH665lHynUhI6nmZ804F
	6iDss30j6M6tdHVqILYFQTzYuhAJVHUoMMovDIqZjLmvGgDJihDOmbF6rK4Bw58i2RnECQCR4v2
	knN0AQPs=
X-Gm-Gg: AeBDievmEqhhaQRuv/Ce0TbNJTD1KefPlmaKeyW5qQhm31CH1q0uv6F2XUByaV/slbB
	53oBxkXwDfRbmSOMCuoWvve08fKXbX/LBFVq+cEHKq/6kzkt2XGQMLsE7dQ3sasMPfAV2OG6VU6
	MeseCEwDjPGBuv/XlktYyJVaNVeZFfMMc7gkJeHX3ElG6VUKK/7aUu3C8PAtrP9rGgg8DPOXj0P
	l/D3RSwyzxpbvapzvwUTkJtRN2ktQNGgfl+jKfJD03B9ErL82O/IAuG6z10q4A2bw5P/pKL30Ny
	EkiRiqOZ8BV/1hbrLBhD03kc78kZ1dtSnhoCfnv+g2EBzo7X1EVEG2qwYNqDfWftqIStbB3WNPf
	qiRDzeV7KVdOmLTj3wQMPRenUynd6/iMPS51bi5ClrqqoZD9kgH7TMtjgjeMgz4NeMQSd1Ts7nS
	ANqrAGteBw613oDpAoQZjG65cE6KG5Bk5UggPtrRr6c1g8Ku//HvaWt7cwl5WDkmTBgMpu2vPkG
	i3VOzKcxe2iE2/WISC7eyx+7IjU1xYPNXVlDLqBSDe2Pw==
X-Received: by 2002:a05:600c:15d1:b0:48d:112c:f582 with SMTP id 5b1f17b1804b1-48e51e1e415mr7733565e9.11.1778011804953;
        Tue, 05 May 2026 13:10:04 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:04 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:52 +0100
Subject: [PATCH v2 2/4] dt-bindings: qcom: Document IMDT QCS8550 SBC and
 SoM
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-2-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 1FC204D37A0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	TAGGED_FROM(0.00)[bounces-106014-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid]

Document the IMDT QCS8550 SBC which consists of an IMDT QCS8550 SoM
soldered onto an IMDT QCS8550 carrier board.
The IMDT QCS8550 SoM consists of a QCS8550, UFS and PMICs.

Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index cc29b06621a9..97735d31f1cf 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1073,6 +1073,13 @@ properties:
               - sony,pdx234
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
               - qcom,qcs8550-aim300-aiot

-- 
2.43.0


