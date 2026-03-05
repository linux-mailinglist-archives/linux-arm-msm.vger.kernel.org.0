Return-Path: <linux-arm-msm+bounces-95664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MWTOsKWqWlKAgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:44:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCE1213B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 15:44:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 133693022993
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 14:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081803A7F69;
	Thu,  5 Mar 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQ0hachb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF083A7F4E;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772721622; cv=none; b=fc4RVLpYytgapfe6yrja1qGS0NPEoTeNQ4aud+LfhtSKLOOc1UyqRlVmUTparVFqpthiz2sbrH045307vffaaL4QV7o6VnTmekByHJn+ueywyW3+jPOdKKgMPUQ7se5CUq64e8cpkZ5sGawoszOkCtR2CNiEBVXB6gVo0ScyvOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772721622; c=relaxed/simple;
	bh=PbM85mGsMx4OQAX2YfPD5JAa646G0nfY5iMdJuDOzTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mn6unmIVlHTRXFf2DP7GePVb3HJlNzffF2Xy2DW9n4q1zlmbLeA1E3F7CSBizXnXwalKZCRTr8yinWr4kC+ud61BKXAb4vpSJz6ETxBWawV4Z1mxtOQ7gibPvXFN25aZXnPHz5BTSxIMbvpuXEHHPn7C7jg9p15WEnPXZiqHUhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQ0hachb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A98FC2BCB0;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721622;
	bh=PbM85mGsMx4OQAX2YfPD5JAa646G0nfY5iMdJuDOzTY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HQ0hachbv1K+WvoM4jqgkusyS72URaHgr27aw9UZJXOg15kj+KDS/DHDvYNTwAosB
	 33Cuh23mLIf06/ubKtC8s0fVeElbbTFlQA7AQWjdWKCvxrLwGUcZiyzp+I5Z9p0DEU
	 j2P6QVlIMa89tuaCvjY9CffHUf0uUKbi2X5+GmCqjAvMaXvhfahRmikjpLztmCSui6
	 0WbGb6XrNwkv9tHnY7e20e65YGNEh/aN89+qjY+yZuMm57Yd4SNWA+L7CZzrzz5Ips
	 w/GAB4zXFDBKPIUTezrZUahWgsFCAxTtMYpOs3OhjMt0kgJGZZ+AbM2zOWAP4ftKWH
	 Oa3zlQGGyXBTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78C91F33A79;
	Thu,  5 Mar 2026 14:40:22 +0000 (UTC)
From: Cory Keitz via B4 Relay <devnull+ckeitz.amazon.com@kernel.org>
Date: Thu, 05 Mar 2026 14:40:13 +0000
Subject: [PATCH 2/2] i2c: qcom-cci: Add DT property for SCL clock
 stretching
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-cci-scl-stretch-v1-2-8412abc65745@amazon.com>
References: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
In-Reply-To: <20260305-cci-scl-stretch-v1-0-8412abc65745@amazon.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Cory Keitz <ckeitz@amazon.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772721622; l=1731;
 i=ckeitz@amazon.com; s=20260304; h=from:subject:message-id;
 bh=OwT3G4Wpy7L8KSSJSz2LODppXx7Vr9o7XgiwykQqPqU=;
 b=Y/sFC7CPtrdfbIbHxNIKks1+lYC88LTW/5BKg8Nn+9ZeRLLWP+0geVubpKbswUAB3aHUnX7iR
 rKHVbnFZCpIDswR5NiCI6o6VOHOHtmBR5msi55ZTF6iU5XHPID42C/Q
X-Developer-Key: i=ckeitz@amazon.com; a=ed25519;
 pk=IWSPbPI9mzOdPU5zG2ROe/O75E4ckVxuBLNJVYVZCag=
X-Endpoint-Received: by B4 Relay for ckeitz@amazon.com/20260304 with
 auth_id=662
X-Original-From: Cory Keitz <ckeitz@amazon.com>
Reply-To: ckeitz@amazon.com
X-Rspamd-Queue-Id: 8BCE1213B9D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-95664-lists,linux-arm-msm=lfdr.de,ckeitz.amazon.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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

From: Cory Keitz <ckeitz@amazon.com>

The CCI hardware supports an SCL clock stretch enable bit in the
MISC_CTL register, but the driver hardcodes it off for most SoC
variants. This makes the bus driver unstable for configurations which
rely on clock stretching. Notably, GMSL uses clock stretching to absorb
the latency of transaction forwarding across the link.

Add a per-master "qcom,scl-stretch-enable" boolean DT property that
ORs with the existing hw_params default, allowing clock stretching to
be enabled on individual CCI masters without affecting others.

Signed-off-by: Cory Keitz <ckeitz@amazon.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 884055df1560..022c10b310a0 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -111,6 +111,7 @@ struct cci_master {
 	struct i2c_adapter adap;
 	u16 master;
 	u8 mode;
+	bool scl_stretch_en;
 	int status;
 	struct completion irq_complete;
 	struct cci *cci;
@@ -284,7 +285,8 @@ static int cci_init(struct cci *cci)
 		val = hw->tbuf;
 		writel(val, cci->base + CCI_I2C_Mm_SDA_CTL_2(i));
 
-		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
+		val = (hw->scl_stretch_en | cci->master[i].scl_stretch_en) << 8 |
+			hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
 	}
 
@@ -572,6 +574,9 @@ static int cci_probe(struct platform_device *pdev)
 				master->mode = I2C_MODE_FAST_PLUS;
 		}
 
+		master->scl_stretch_en =
+			of_property_read_bool(child, "qcom,scl-stretch-enable");
+
 		init_completion(&master->irq_complete);
 	}
 

-- 
2.47.3



