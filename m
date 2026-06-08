Return-Path: <linux-arm-msm+bounces-111860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMCVEBaxJmrzbAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:09:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A64DB655FBD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 14:09:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=VdQdCYjo;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111860-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111860-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C0A8F302FA04
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 12:06:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38CB1377023;
	Mon,  8 Jun 2026 12:06:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA5B371876
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 12:06:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920376; cv=none; b=sliVercKMneuhxdl4dzKepWT9/WfV7XzquLsfN8gwD+qiBP+o36q6d3jZyv7AvViPXP5jUMSw5gAQbVEyFVH+nB0JkT5v/r3dj/NJBhqcu3x+D/231DJiZwOyaVSXL2lT0mGElXjMzRwWncS6QzwcZfkoftn85Mz0ErSTPUmvtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920376; c=relaxed/simple;
	bh=pfmSN65yllH6tLhlIzzWMqdu+L4C+S5GJPNQV+rUZ3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FrjsXn3t57ADc+BA2OIQWjStDUIVLiGvnUMi3jxC92toodauycIaPgCASPLEIUWhU4yfSkJUFfuEWunFXB/DhEPBkKqcT5MHHOA8KkCIVZiIFsRMkB4jNsBSBzlGuK5EJ6fPwDXJR2pY9im/S4yPswnCV8/1nhyXQLdGpT27zbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VdQdCYjo; arc=none smtp.client-ip=209.85.128.42
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b4e1ade7so45664195e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780920372; x=1781525172; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xMJeUc7+7+u2n+HnGIXbVVy++zpMhMvTi9S984NETBo=;
        b=VdQdCYjoFmGIeY9oZsUFO0jgzqjwdY3zjGarY7QnIhfPGthzu6f4wO1xRlswmh8ex9
         v8/jOpx5skxvG9hKCuntjMXEruXJkzbZyrH9DYpkLiRGvnKOBBW3uhmveBwg5HlH3VcN
         awBvHmjCUjE1/C79LnLwv+wd3t16TuqGQ0aGeicsIv5QZ+vF9sQNEp19i2eHSTfYZx5u
         XBuZbxjp5EKnKmoAjxc7Tq8xXIhCoYMIS3USdlJjFPnhYbCR7NUbRnQSp5C5g45EHEVS
         sSafUCQfUHK9TTiaI8yzaNg6PbPYvjR5Y0Ws6QPiYWzmh6/DKnOxeG8FMgG4KFQP68Zd
         d+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780920372; x=1781525172;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMJeUc7+7+u2n+HnGIXbVVy++zpMhMvTi9S984NETBo=;
        b=QJdG2UcpBEZORPihTbuUWwEOuSsVlZRxjFDDifwHv2V/5cKw7Oamzrbe6Sh93lJ8Ph
         b5ruIMcFLXwpPbbwABlCnSLzydbZR2QhF8Z9gF9C1saI9EhXjZBGCk2WoMjscUwGxrgL
         6jce2GCko7YXD6s/xOmK+KwJFbsUr3F8IyDG4lKVYoe8LYkvgv01msi65kloVzsQbAW4
         U3GPSUXhwqPUOQgYxrFYnl2397jusmrRubGaXWaTVmFi0JOs8culuycpm3KJV20wXhuJ
         sUA5uS00QMBcyoXbc+KaMOmaFoyvRlPUOjw0ARKenRKANfhKRKCSeDO3cMkfp0fEDYS9
         Kszw==
X-Forwarded-Encrypted: i=1; AFNElJ+ePiEorg/6La9DhdQLDNitgq0TTjWLeChVUCgW4E7YrTtwgQf/M7YFN2Ygyre6fIsdMGbmRzSS8V3DkfJ1@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDpu86r7iWd1o3Dm7Z4XWD3nzV3LCGY9Jh13RPR5oTE3qJKU3
	+Qq1sV/pCxjvRRgq4pd2zr6eeUsWDQin0YxvaQGFHF0eLPKpSE3ZUhUkzVcVH0cOmTDqIxjitOo
	mpeYN3iI=
X-Gm-Gg: Acq92OEYfsxGIfhyNAxQdCIyJGjKKQP6I4iG3t977/RZ1OJAvJU7yRJeHF944FQefCM
	SzT52nnEMTyReVr3GLGQjk/CvyAEO/dytHfcDzCuB3cEJCw3UYtgNBPmT2yhE8nu8F2NB0Ut22B
	1CKI/ri9eZkHCOUoH0jW/yIZRsI8hg5cP5jHXZCcfil9S8Q20LNIro0HMZLsfBbOa9myV0i5hPn
	VJ6hcRIENu88rBRWM4/Fpu8r+e5TgdNntCAaBzvKDSSS4oyZlBOz914GkmXo5BjmGWgfCAJgWyG
	Z54KI0XszRkKV8iI2/kQSUG+J/pTgS5x/4CvN+KcpMlZkPc1OaMgWXyH8h7IzuVAfjvmyHun4ug
	FKlLvXYgWI5ldwnjexBbjFuwFix0KxpZlQ/VdfF7TFmpOQaQ7pyDHr6Fion4OwIz9bg6t+R5bAV
	aqLG2AV8Y2jTQLoc96TmGy9dANbzUVAwv7LO2di1f4MQbj1OU=
X-Received: by 2002:a05:600c:620f:b0:490:5074:651e with SMTP id 5b1f17b1804b1-490c2612cb7mr222035555e9.25.1780920371969;
        Mon, 08 Jun 2026 05:06:11 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:7dca:9001:34e4:f362])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2d30eeasm250331745e9.1.2026.06.08.05.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:06:11 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] regulator: qcom_smd-regulator: Add PM8019
Date: Mon, 08 Jun 2026 14:05:42 +0200
Message-Id: <20260608-rpm-smd-regulator-pm8019-v1-0-c671388b9ea5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABawJmoC/yXMQQ6CMBBA0auQWTvJtBisXsWwKGXEGgvNDBgTw
 t0tuHyL/1dQlsgKt2oF4U/UOI0F5lRBePpxYIx9MViyDTXkUHJCTT0KD8vbz5NgTo7MFYOtuaO
 Lq8/eQMmz8CN+j/W9/VuX7sVh3n+wbT/xFlfhfAAAAA==
X-Change-ID: 20260608-rpm-smd-regulator-pm8019-c23eb07834a1
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111860-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:agross@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stephan.gerhold@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:from_mime,linaro.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A64DB655FBD

Add the definitions and dt-bindings for the regulators in PM8019 to allow
controlling them through the RPM firmware. PM8019 is typically used
together with the MDM9607 SoC.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      regulator: dt-bindings: qcom,smd-rpm-regulator: Add PM8019
      regulator: qcom_smd-regulator: Add PM8019

 .../bindings/regulator/qcom,smd-rpm-regulator.yaml |  4 ++++
 drivers/regulator/qcom_smd-regulator.c             | 23 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
---
base-commit: 382f7d3b4c9740ac06199207796ed9b71582c7c5
change-id: 20260608-rpm-smd-regulator-pm8019-c23eb07834a1

Best regards,
--  
Stephan Gerhold <stephan.gerhold@linaro.org>


