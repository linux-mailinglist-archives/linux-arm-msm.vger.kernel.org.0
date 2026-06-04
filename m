Return-Path: <linux-arm-msm+bounces-111268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o2SvM9TeIWr8PwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:23:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D841643440
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Jun 2026 22:23:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=k+YCQcHH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111268-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111268-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B347A305A844
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2026 20:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B3B93C1981;
	Thu,  4 Jun 2026 20:19:36 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A151C1E3DDE
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2026 20:19:34 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780604375; cv=none; b=MxV4Z1VtCFi0JrFN13C6mlapGclIrR4uPN0dKvI8FuP2E9ZL/az16qbYgmp6MsMw/btezlXoAhNKMyYDd7MDgOAd+bG+MclW5my3XNBFpEKlJVNJIpPuQJaqoHgdvQmd7nZWimWpwbjP04U2PdLr/6AxHSySK2b7E9VTijBFGg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780604375; c=relaxed/simple;
	bh=45KdNmv+Drab9Z/X5tJfZfZLATdmtXAQ0rISrsmLpag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WpGudpLRcD16ebbXpBCS1ugbBJBeRteC7B8czBsbJMXUu32RreibNt80pcE4k4RCE0NK0GtcEd2GUSjdBfD7Dh7XUfJMzPrnzoAKmf+AGzXRXB2O87zwNamiv4puA5lENyEArIxziAfln13pxBoJhP+ZVvIB/hyu+Ny8idQKyqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+YCQcHH; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-490c1915793so1555405e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 13:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780604373; x=1781209173; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HrQNCOwYef0/rUPI4L9x7Ym+o1MWvmOU9IU4X/FxWJo=;
        b=k+YCQcHHFm1T+/x4siejTgf2GshzdI/qc0/40ZzSYQt+sG0EjwTrnR1qGecYyMzHsw
         V4gZ2cEpw2afU31q/7HJoKX+WkUgnovhJBqfvQrY87OObPwKmLvrqNzHQADiYsluQz5G
         n8BKexrMhuhjZkeWiFK4vjZloaqRDzyj6rK3HUWECc4Ky1+LyCnjX60rpK7wjTJR8iuC
         7LXWSsOFv57VhX9KVoJ1GG51vHoOwyquYHbyPllD7TN/taAsQ3aFUrjeO1OEYdrLkSto
         9fQJ5SMHvgCo9sVNd6wnCg68Edj3sTe8oG5DPhfn7BjH8fwRC2Mhl5ZQlxs9jd50P9vc
         KrEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780604373; x=1781209173;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HrQNCOwYef0/rUPI4L9x7Ym+o1MWvmOU9IU4X/FxWJo=;
        b=hTKJbalMK+Brqjn8PHWYOFv3kLlHmHFbBdEVw2UkORpTf9H+L2BOr8iV37cUgMxQwm
         RR7X/Xd1+xnwi2IfljS8r0KOefMW+IKuAPSOKmEIKWXFzmhlueUXH51K3WzEHjkt2pQq
         kM0XrbHjAjz6Lu9usFDhBkrfNoVmcuUlhUAeBeamA/KkIFGFkRuBD+T4Hf7nJHRzyrsi
         Vn4cxfi7xPoCpY5sO/OS56yst8jyk6pDvHAHWtFeGxVQCUgpoCUI3wzKfXcG7VoKYWUD
         DtxyVzR70pYS0wY9CO32ryMOfrT8ePEqJ3mO6mzjYGlzruAXlXXbKeDz2gRoGCZPEjic
         Pbow==
X-Gm-Message-State: AOJu0YwH1ETLjYq4Mpg0FdOMgykDwJa2yqDEwdOD0oJRmDKw2k1nlAW3
	E0oMI9rxV5i7UfkKALv5FrFzaGPI5ueZFttCVmk90F2AwP/iYgdX2VjM
X-Gm-Gg: Acq92OHY+GA+RBfGPkz+hmoGfmdZZ3rzUWQSl4Ahj98NO8Vm2o+02TId6IJ0TWYdv55
	F+u6XMHoGVm5sJ5XFT+AUJYwOPHF84ll1OuXgO4LGj23ng9LDnZNiVd+T0XVFjGMIXO7896+8I/
	zkOn3iCMu9x25v++zroOVYEJ/qMQZ2Ij1JZEm7tlvKNNQNERYrFxtbnS9bcIwTPW7L9wFmm9zEw
	w/dlKHe8ugOQKAWSfjNixENWSDQrIcjJEiweiFTnqfwtTY6YMo5YPfVubMIpKbjZMe1M70thyHQ
	+Dif12ltPtsV2IKYJLk/dpRLDLrmCHRl3KzSBe/79oQsa0tr6dslM6N9xbGAWePgzfZ10ElNU8G
	Jr8CgGBfuuYRYOt8i4nOpRgldVgJPAbM7rxBpf1E3lFIHJN45JNNPpn5hrAuetaRbbkR2pOzpc4
	OR50ecFi3rdbIfKFMSsC+Da4HDWn6hJM8jXDC1rQ==
X-Received: by 2002:a05:600c:3153:b0:490:b8c0:d46a with SMTP id 5b1f17b1804b1-490c2604790mr1881625e9.22.1780604372996;
        Thu, 04 Jun 2026 13:19:32 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:43ff:9a39:ef13:72e0:8f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344558sm18999748f8f.18.2026.06.04.13.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 13:19:32 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Subject: [PATCH v3 0/2] ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle:
 add initial device tree
Date: Thu, 04 Jun 2026 23:19:26 +0300
Message-Id: <20260604-yukon-eagle-v3-0-9e3b57d306a8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WN0Q6CIABFf8XxHA0QEHvqP1oPqKCUSgNlOee/B
 7ZWPZ7tnnNX4JUzyoNTtgKngvHGjhHyQwbqTo6tgqaJDAgiHDHC4TLf7QiVbHsFOROaaIElpg2
 IxsMpbZ577XJ9s5+rm6qnlEiLzvjJumW/CzjtPuXirxwwRLAUGJcNp7LA1bkdpOmPtR1AKgfyd
 TnK/10SXS14RSliItfs19227QVMkaBT9AAAAA==
X-Change-ID: 20260526-yukon-eagle-658f2f81a14d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111268-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:xerikasxx@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.sr.ht,gmail.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xerikasxx@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4D841643440

Sony Xperia M2 is a smartphone released in 2014 based on the Qualcomm
Snapdragon 400 (MSM8926) platform.

Add initial device tree for Sony Xperia M2 with support for:
- Framebuffer
- GPIO buttons (Volume Down and Camera)
- Regulators
- Internal storage
- SD card
- Accelerometer
- Magnetometer
- Ambient Light/Proximity sensor
- NFC
- pm8226_resin (Volume Up)
- Vibrator
- USB/Charger

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
Changes in v3:
- Changed incorrect "chassis" to "chassis-type" in the device tree.
- Mentioned added vibrator in the commit message.
- Link to v2: https://patch.msgid.link/20260603-yukon-eagle-v2-0-f86b440583f5@gmail.com

Changes in v2:
- Dropped `regulator-always-on` for l3, l6 and l8.
- Mentioned added GPIO buttons and reset input in the commit message.
- Link to v1: https://patch.msgid.link/20260527-yukon-eagle-v1-0-98119d64a71b@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Erikas Bitovtas (2):
      dt-bindings: arm: qcom: Add Sony Xperia M2
      ARM: dts: qcom: msm8926-sony-xperia-yukon-eagle: add initial device tree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm/boot/dts/qcom/Makefile                    |   1 +
 .../dts/qcom/msm8926-sony-xperia-yukon-eagle.dts   | 403 +++++++++++++++++++++
 3 files changed, 405 insertions(+)
---
base-commit: b7bee4ca5688e30ca50fbc87b1b8f7eed7006c17
change-id: 20260526-yukon-eagle-658f2f81a14d

Best regards,
--  
Erikas Bitovtas <xerikasxx@gmail.com>


