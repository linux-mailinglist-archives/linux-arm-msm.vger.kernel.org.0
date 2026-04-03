Return-Path: <linux-arm-msm+bounces-101675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sD5jEiPYz2mb1AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3013F395955
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 17:09:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 79A7730727A1
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 15:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ADE3C9EDB;
	Fri,  3 Apr 2026 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PHpF51M0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2A235FF6E
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228438; cv=none; b=tC1J2ldJQAnkS+P+QT2ZQfdQLHBCgiMOVUe45zv6Eg4NVvij8zyB/jCxjPF/fYfeV6aDm+AK1yf2xBY7NISEGlDkPA7DA906P4KmDhagYb8ZPEZdrOa5UkgnTFU6z3oh00XwlPtdPVCStUMolrVm4HlW+PXhsjMBDmIo4l7pBwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228438; c=relaxed/simple;
	bh=FhRIVcnNMzecnoa4rPDjvVpIXXCoMM3iqgJIuyFG5Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ppiP21BKTTtk14fxFiKRXewxBsEVhyfdU9EYSpYkOpMxyAbIdmF3f+zrtiQWcmQdplhq6INtDv6VwseL3fNsIdg2Rx2iFmME5TBSX8oKYUPPHg3pC7gBcKVZqxXxKUl7iHLauvNhUkrQajEhtEM6kyMoHLWUQh2fS7NmOgAZtZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PHpF51M0; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-66bb6eb28acso3690369a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 08:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775228436; x=1775833236; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h0/QY6ehQue8Ry1HwgL+iBOWAjcDTargnHsUC+wjaTU=;
        b=PHpF51M0kLHzN34mxvbVESWh5St6DaiaUp3Mv9hJEFArBH4qzc8FHPKXN4MRm6yl0J
         vu5cdFW6Q3F+rfFKvo6lBRb7XfV3BTltjOIYnX5z+hjYBuW/GA+6EBYRnzuGYmC5gJ8g
         qQfPLz8QPlMjwxtnJCh/SELWQSA8OoHfMoNa8zB6/5HVJltQ9ywg+9+/u4tPu+nahzeM
         dMHCkkHfPPmV/cSlgMghnbMvEtqzk9jZjdfcKnUuqpc7Lu0G8KhJ5nBT6HGGOmDv51IJ
         f+KpXW0/AVGd1dUS4N9AXpOe2NT54yurzxVLi0QCxlSisdWMw/9xpNaJsClEwm7C3dwa
         J28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228436; x=1775833236;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h0/QY6ehQue8Ry1HwgL+iBOWAjcDTargnHsUC+wjaTU=;
        b=hw7CqF/oAU2p8I2pPtxCdOownig0YdI5SRe9Ih+j7RqX18V10s4CjyUePk7vWADzXE
         kCUoFQ2kRQXDp0ysCbX0Hjtzb98Es5HCzRMai3KcJwMlOg1SFzitrMi4kAtsy/kkgntO
         uyYhyevm70rDC0j8/s84lK67iXOX/2V7ZUAX3zHm00v0dj83D+JBO9etwhT2onx+SF7U
         c2ca/67vsKzZ68B5OWcnYUgmPTi8aI1Bfxecyh0vYzvbJZmwwBbgcqYjyE5J91SpZ2VT
         9EQhW1T5oduO5hEBMv4/zyW5U4Emat9umvEwYwHr80SUGTKj4/5c+SIaDPkTrZBYuLaP
         DC1A==
X-Forwarded-Encrypted: i=1; AJvYcCWko+dqEUZwAN5UKcrTJ98hcK4ZuBirqRWEs4MTTfkVDKH8qRAjTK3PY5k+rSQfWJ/dUmBjnK8MV5YA2zmt@vger.kernel.org
X-Gm-Message-State: AOJu0YyH8rRasYLwEIn0kISomKt6A3xu7Sq8Hugkx06o2dKRKb+5zg59
	iHZfnWtU2IoO/HnP7ArtnheBGzJoc3HapGRPgvyrvkiZSObSBWpi+c/SBo6d/cSKkIM=
X-Gm-Gg: AeBDiesQiJzACRST9RkR54h5K7W6sEQh4Lnhya5wq9FO0PFvHYu4TxgoSaoCJiZ7PMZ
	2tDEx77BrLONkt8KNTnaSoGEh8lX2Xryb4VzDS8ftZ7lEZLPXeR1MJNY8lSC/tDHDuRdoZXybbr
	QdZocgPIrm9hq6Fsuoyig7EwCctLeOMU6XFii3THkQ8hKeCg7HnvZjkCnZZWHFnRo9v8qxkv7SM
	qu8D9KqaYx0aLPfPj8kSbVzPxmY8Me77ETVoJ0LPT1tngwKt1UUDYMMNeU4X5i6WZDz0JoQGzRF
	vNCNih0CBPkoLjAr7A1zKviKSEZZpw5/WMpOArZRqBzRrZgbkaLduXuHmGm8q+QsQdwzBaS2rmn
	Maq8+SrNMjAcMLWt0D82NAJuvCKtgL6SNL1AWiGnBnBvLgF87AOl/HwJx7l6WQLQuoQvYnqrgF0
	uc6GG06+Vm4XoDMU1oE5YeDiu4p2hsgopSGapzeQKCF1CVOmNM9ikI48KKby1ZEpcUSaJkoq6/3
	0KSdrGmv8Fl2lhPmrTUXTHxgHR7RYOMWP0Y0A==
X-Received: by 2002:a05:6402:5106:b0:662:ac7e:aac9 with SMTP id 4fb4d7f45d1cf-66e3f71d3c4mr1491095a12.20.1775228435709;
        Fri, 03 Apr 2026 08:00:35 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e02f389absm1724648a12.13.2026.04.03.08.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:00:35 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/2] Describe IMEM on Milos
Date: Fri, 03 Apr 2026 17:00:22 +0200
Message-Id: <20260403-milos-imem-v1-0-4244ebb47017@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NQQrCMBBFrxJm7UBMQsFeRbpI46gjJtFMKoXSu
 xttlw/ef38BocIk0KsFCn1YOKcGx4OCcPfpRsiXxmC06bTTFiM/syBHimi9ts4Yd3KdhzZ4Fbr
 y/I+dh41lGh8U6q+wG4XeU3upmwajF8KQY+Taq0Rzxf3JwLCuXxo0Qq2fAAAA
X-Change-ID: 20260403-milos-imem-3a034224946a
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775228434; l=594;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=FhRIVcnNMzecnoa4rPDjvVpIXXCoMM3iqgJIuyFG5Z4=;
 b=v0PIV7ASjl5AGLPJMb0wR7ZvLdSq7YzlZaP6WosPRsq/8BDQLdIwBfqHtSgd2wZ2sKyuaZDsR
 O0IL2KwwsCuCoyPwl4SvSCSGi370fvObb4oLiUB+FWU8uxhFK9Si2hy
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[fairphone.com,quarantine];
	R_DKIM_ALLOW(-0.20)[fairphone.com:s=fair];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[fairphone.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101675-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.weiss@fairphone.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:dkim,fairphone.com:email,fairphone.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3013F395955
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a compatible and describe the IMEM for the Milos SoC.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (2):
      dt-bindings: sram: qcom,imem: Add the Milos compatible
      arm64: dts: qcom: milos: Add IMEM node

 Documentation/devicetree/bindings/sram/qcom,imem.yaml |  1 +
 arch/arm64/boot/dts/qcom/milos.dtsi                   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 83acad05dee54a5cff0c98dd7962e55d4c6b145a
change-id: 20260403-milos-imem-3a034224946a

Best regards,
--  
Luca Weiss <luca.weiss@fairphone.com>


