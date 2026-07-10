Return-Path: <linux-arm-msm+bounces-118184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 50sZNhWpUGoe3AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118184-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:11:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D3D7384DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 10:11:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=MfN7BqOd;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=K1WwsP5d;
	dmarc=pass (policy=reject) header.from=mailbox.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118184-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118184-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86833300574E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 08:06:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 290083E7166;
	Fri, 10 Jul 2026 08:06:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C628360EEA;
	Fri, 10 Jul 2026 08:06:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783670771; cv=none; b=or9Hlo75942MovGNImxhNu4yJTg5at+DvK+YVL7Zco1gzRZSovwee0xB8M4xlNvvXHdIiZrBHKNYAJpltJq9+AA7AmrxHpfaMRfKUOm/rQIqfHI+jzCicuTNQxq+QdMjFnSeT4ic9WeqVPxjE8DCJKOBWFsjJx2Jtji0JglESKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783670771; c=relaxed/simple;
	bh=0zNFU/tESqT2WCBUBLBXE4gHeSZK6Xh+50AlNFfLRMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/zDMunenhURQIdr+YB5DeX6v57ugrWh4WcOo5yPqKU8aRKy5ovr6HlKIP4s2S3QHrSJs0BpatCV6ZnGjLSf+QodEptmRJ9L5bNxQSqjJ41DrBxEZ7XBcKdn7g2DzoGqDeDHkRizA4YUgIItf3dwgo7gDO8vJg77wVkziNbg3CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=MfN7BqOd; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=K1WwsP5d; arc=none smtp.client-ip=80.241.56.171
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4gxPXp4PsKzMlD6;
	Fri, 10 Jul 2026 10:06:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=MfN7BqOdvkXRAwHYVggjudjUT83XMF6Aac5V8ZO2AG+jOSxw5Am5MJ1BM3ivw0FW1z+2QV
	qIqdbiRJnAlBQoTUwU8SZ0hcNUwXo9ZVb+mEAtWQ4KKsSx3hyVcQfcceq/vIjnvyAMGxVW
	bClU4ryzfrWDKlyeyaqbu2z64yZ7jsXuHF5r9EUmROV8eDT4ev6cTaAf5FW85DlNaV0R4T
	DcO3+EMtx55LwZw3RfyTVLr32ZQdfRAD9pYWxjaF8awuDgJ4z5TqJ9BYQzvA7Ivl/ZQZ8X
	MnoMbn011YaZAu1begaKhH9tNkdtkYGznwjD4VKYH68WEneO8crKTQrUoqhL4w==
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783670761;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lyxUPIeDkpDMidFf33+3wv8CyYFxfYhNTbsG0K4gHWI=;
	b=K1WwsP5dJcKOSlOvbW/CsZ6nITchfBE7LQ7V6HlMcjTcZs0Xi0LDDM2ld9uESXPmtbGF7m
	g4IQoPhp72mBHFvHVdaMKbrTcUNWNKZFobtBAbfViH1Wdh5arzzRPYz1FV/8GivnsnrZGj
	MatGw9ZS2xKqGGYaimoIj99UtZih9SwQTi4GGpqouKni4kw07TTfFS9p8ca2QcxOmxf0/a
	X1IYEaYDiPhFc+tmXawWFmFFZQKjBv9yQpg2Ew3YoARXOkZHVN5x+pg9EFW7pc/qckVSLl
	a4iqNRQOtzZv4CdwSvvOfoJ2DYsFLZ9yp8X2YPFjvY7JQM2Rb3ivMdYzu6SOOQ==
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
	Tao Zhang <tao.zhang@oss.qualcomm.com>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
	linux-arm-msm@vger.kernel.org,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: arm: qcom,coresight-tpdm: fix bracket
Date: Fri, 10 Jul 2026 10:05:23 +0200
Message-ID: <20260710080523.428548-2-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e08c77fdbb62919aa1a
X-MBO-RS-META: uswnj341qs38uwohh85538f4dgj84hr5
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[mailbox.org,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[mailbox.org:s=mail20150812];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jinlong.mao@oss.qualcomm.com,m:tao.zhang@oss.qualcomm.com,m:manuelebner@mailbox.org,m:linux-arm-msm@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118184-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[manuelebner@mailbox.org,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[manuelebner@mailbox.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[mailbox.org:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mailbox.org:from_mime,mailbox.org:email,mailbox.org:mid,mailbox.org:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 57D3D7384DF

Remove needless '('.

Fixes: 6c781a35133d ("dt-bindings: arm: Add CoreSight TPDM hardware")
Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
index 152403f548c3..c7301f1b28c1 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-tpdm.yaml
@@ -9,7 +9,7 @@ title: Trace, Profiling and Diagnostics Monitor - TPDM
 
 description: |
   The TPDM or Monitor serves as data collection component for various dataset
-  types specified in the QPMDA spec. It covers Implementation defined ((ImplDef),
+  types specified in the QPMDA spec. It covers Implementation defined (ImplDef),
   Basic Counts (BC), Tenure Counts (TC), Continuous Multi-Bit (CMB), and Discrete
   Single Bit (DSB). It performs data collection in the data producing clock
   domain and transfers it to the data collection time domain, generally ATB
-- 
2.54.0


