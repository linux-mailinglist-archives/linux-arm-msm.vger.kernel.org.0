Return-Path: <linux-arm-msm+bounces-95663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMINKxWWqWkWAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:41:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 26690213A6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:41:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4DA81302E7D0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 082E73A7F6B;
	Thu,  5 Mar 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGHqu7oC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE513A785D;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721622; cv=none; b=P5wD1bUz4SvYzLAM5Zq2JgEAgYNcOmr/qXmgYFch5ehgNtkWCv5JUVX82ZTFz88SSgCd8T6HxQ42FrWYHSsUbiQfyDJCSB5Wvkl52RCyTftNAqkH8qDDXjUkfIkK+/dSOoc8WeZ4VqT5A76JB1zbX1g4VezRGKnZX7uupnmr+Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721622; c=relaxed/simple;
	bh=T44TqUGQHAS6MoU9t8A/e6FFFdz/hXwGMdo23WQE5fA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H7vWJDfoM9bwRImCXB99R/06IzUZD/Y+OUnb6MU0TUwB4zJUUb3AxDD9CfSaKkwsxsWSXR3yHIEhklaCo2J722rmLFDky3iJXuhdg6j/UylRKucO2dPj+SGecvb8zKscAl9vsGGdJppRg8wYAFHunHh06g5zCa7qIcdUyPpw9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGHqu7oC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64FC9C116C6;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721622;
	bh=T44TqUGQHAS6MoU9t8A/e6FFFdz/hXwGMdo23WQE5fA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FGHqu7oC9DNBIpCyyZ2M7OuZlUWMBJ9rlEW0I3yptIeZY1R3Zhwl5RGJa34GUqG3h
	 QcYF20OOUOyeBlSGxhhpGl1rll7dVEHWpEP8HhIAkXXq6B5kXXMTnJKVI5v0Fk/2zH
	 NbfUzTuJzumxPt9+1ANLOMxDPhMYQ4SsbAPUNvy8O+9t3E504rjvkS9f6upXHECnQx
	 +fJ3CdSmq3bGYTLupojL1d05bDn6ItPC1pC8jHPAwqlBrVEa49uStJmrtQw/mG8sAi
	 yS0iugbRIPRV6W5FghQn5XGj89AJ1PM7ppxGpYmRdxr4EcupaSD5Lugm3r18PEY4rw
	 OETkIk8kDU4dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F71DF33A78;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
From: Cory Keitz via B4 Relay <devnull+ckeitz.amazon.com@kernel.org>
Subject: [PATCH 0/2] i2c: qcom-cci: Add DT property for SCL clock
 stretching
Date: Thu, 05 Mar 2026 14:40:11 +0000
Message-Id: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMuVqWkC/x3MwQpAQBCA4VfRnE2NtZa8ihw0BlNCO5KSd7c5f
 of/f8Akqhi02QNRLjXdt4Qiz4CXYZsFdUwGRy5QSR6ZFY1XtDPKyQuKIwoUmsrXAVJ1RJn0/o9
 d/74fBwln8WEAAAA=
X-Change-ID: 20260304-cci-scl-stretch-e20060685476
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cory Keitz <ckeitz@amazon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772721621; l=1527;
 i=ckeitz@amazon.com; s=20260304; h=from:subject:message-id;
 bh=T44TqUGQHAS6MoU9t8A/e6FFFdz/hXwGMdo23WQE5fA=;
 b=4cdbvmbs5JF2fGM4AsVaLsAJwz7x/99K89vsMzMIBe3uzJLDnKpaYrQM2WjRjawcAxknCZsS1
 T2VRxY6sYVBBQFvuZfouUC7BVpFz1zDInb9UXjMXYFOy4cTbCkpErUW
X-Developer-Key: i=ckeitz@amazon.com; a=ed25519;
 pk=IWSPbPI9mzOdPU5zG2ROe/O75E4ckVxuBLNJVYVZCag=
X-Endpoint-Received: by B4 Relay for ckeitz@amazon.com/20260304 with
 auth_id=662
X-Original-From: Cory Keitz <ckeitz@amazon.com>
Reply-To: ckeitz@amazon.com
X-Rspamd-Queue-Id: 26690213A6F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-95663-lists,linux-arm-msm=lfdr.de,ckeitz.amazon.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	HAS_REPLYTO(0.00)[ckeitz@amazon.com]
X-Rspamd-Action: no action

The Qualcomm CCI I2C controller has an SCL clock stretch enable bit in
the MISC_CTL register. Currently the driver hardcodes this off in
per-SoC hw_params tables, with no way to enable it from the device tree
on a per-master basis.

Clock stretching is required for GMSL configurations where the
deserializer uses it to absorb the latency imposed by forwarding I2C
transactions across the serial link. Without it, the CCI master exhibits
intermittent transaction failure.

This series adds a "qcom,scl-stretch-enable" boolean DT property to
individual CCI i2c-bus sub-nodes. The property ORs with the existing
hw_params default so it is purely additive and does not affect masters
that do not set it.

Tested on sa8775p using the qcom,sm8250-cci compatible string with two
CCI buses connected to one max96724/max96717 GMSL2 pair each. Enabling
this property eliminated intermittent NACK errors during serializer
and/or deserializer probe.

Signed-off-by: Cory Keitz <ckeitz@amazon.com>
---
Cory Keitz (2):
      dt-bindings: i2c: qcom-cci: Document qcom,scl-stretch-enable property
      i2c: qcom-cci: Add DT property for SCL clock stretching

 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 8 ++++++++
 drivers/i2c/busses/i2c-qcom-cci.c                       | 7 ++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)
---
base-commit: ecc64d2dc9ff9738d2a896beb68e02c2feaf9a02
change-id: 20260304-cci-scl-stretch-e20060685476

Best regards,
-- 
Cory Keitz <ckeitz@amazon.com>



