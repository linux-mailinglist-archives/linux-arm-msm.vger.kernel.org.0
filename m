Return-Path: <linux-arm-msm+bounces-114071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8TMmMMrjOWrHygcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114071-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:39:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 565686B3467
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 03:39:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RJwfHR7R;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114071-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114071-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 95FF93078E6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 01:34:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC818386450;
	Tue, 23 Jun 2026 01:31:54 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DAD35A39F;
	Tue, 23 Jun 2026 01:31:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178314; cv=none; b=Ca6MjVQemDmsZS1nG8nReHyJK6SfJvTrDU0KqfI1X9P3yN1pl/gHRR87mdjdZkIrp7QQM/8ljLW/qTuFYT1rBD1oYSlgStSNr6XH2UEVA8vfC6cMko5TImHTwBnUOMbjilpjOwoZHyaYk3vYlsRNrf0Xd89nL6spu5IQ41YtHAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178314; c=relaxed/simple;
	bh=k5OqXyZiKEUtLM5fVn6Rd3BDBTBrtVA5k4ZgVv+nGlE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HFUBO1r5RdFeJ77RtKxCq1twLGNRaPNYfziU9KJh8R0j2JcTAVNA9DWa/aARoXcXXE85YotsJSwgUHniLROYOaKKUZh+kEFHQJfoNbHp4Rl6H7AGHOoao4yR6lpCXS50bQS0wCTGcOBgav/PjLV1xYVNrUVg4xeDSFDDH7osqFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RJwfHR7R; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 015841F00A3A;
	Tue, 23 Jun 2026 01:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782178313;
	bh=KojvXlqED8tt0P793L+MzG0qf7ldG6y18ZWC4/cLgN4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RJwfHR7RdDlG09NLo874RxrLASrJpqcdMpzGaqgc3sD7YIv2FCftfIbhmsge+R8X2
	 LXaSIFdLGSvzjr8AbIc3pk8+VFR3sVg6Cn+a2qbPfkP7MKQANo/wDxV5C6UJ2jDj0l
	 s3up98GRQJG0RrcV2b+1Poceg7fiQHHIqUHlz1bMZbAq7SRjkGJzusItZktDo1goV9
	 +MYYeSjZnhRGBlPZ1gfIRRYCSitpTYlO4z0kw6q8/toEi3Q4AEJtqT8hr1nBsdeX5x
	 8Maaug2S3rhDzSsZ0GR3v7K1YkAh45waV0o38L6MP4paic1wfuzoG6zbX526Jqy3HL
	 6gvr+/5I7fsCg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Tue, 23 Jun 2026 01:31:49 +0000
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Add Asus Zenbook A14
 (UX3407NA)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-zenbook-dts-v1-1-3f80f680381d@oss.qualcomm.com>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
In-Reply-To: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782178312; l=981;
 i=bjorn.andersson@oss.qualcomm.com; s=20260623; h=from:subject:message-id;
 bh=edLANztp8dJP2OLhiYQaz1o1ffdo1ViXA9cKhJyTTaE=;
 b=l2+6r5gm9B6mMQRzdqFkBrAqGnjk9d7+IYX8EglMq0IQwkHlAxU3L2k6eUINzwvRDAsB9sgfb
 OSFlUg59nQzBo24Mhibr9OeLX6Db00oANaxkx9z3pwprhB/Km8HJhPT
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=NcABXERZwQW1ZuuTca83ns67voH6xv+CB55m7ZJPaRE=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:bjorn.andersson@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-114071-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,asus.com:url,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 565686B3467

From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, NVMe
storage, a WUXGA OLED screen, and the other typical Glymur platform
capabilities.

Add a compatible for this machine.

[1] https://www.asus.com/us/laptops/for-home/zenbook/asus-zenbook-a14-ux3407/techspec/

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..1a1cd5b0bf21 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -68,6 +68,7 @@ properties:
 
       - items:
           - enum:
+              - asus,zenbook-a14-ux3407na
               - qcom,glymur-crd
           - const: qcom,glymur
 

-- 
2.53.0


