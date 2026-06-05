Return-Path: <linux-arm-msm+bounces-111433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ycCGIZvNImqIdwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111433-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:22:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA43F648807
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 15:22:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Zu87s7KW;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111433-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111433-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F030C3012367
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 13:19:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B6C840E8E5;
	Fri,  5 Jun 2026 13:19:23 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0BA40E8C9;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780665562; cv=none; b=pRQGMrIPx1H/JRLFxNfgjq4izmDz1zuwFjAqf9OqZE4KXXttiS2eOK+MjVLxcpGVxZylUVpOHveRueJOiFZIeKMlb7XEirp64QXh/219UEARqMwHOW7Rl0C4b8u41sLSsGnmNv8xcTWq0uUk9xi134nAGVcuT4NIZxYFAonEh8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780665562; c=relaxed/simple;
	bh=AibvCBZ8Yr4YAy8YqBvl7h6bbfZ1zXprocEIa1dOlVo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DIXqCtA2zlglWXx4v6vKY4lzgBer72nq5fWWBncs7T9J/WURvhP9x9px36B5h21hsJjl4gukgBX0t3o4XSa32OOnFQSWITkoE2H2tlfBL/foPVip1inHLjq3tSZyHj8zolOvOC3SfdYDxbTYtB/QF10IrUtdTpYIxy+9Z0/BDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zu87s7KW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 80340C2BCC4;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780665562;
	bh=AibvCBZ8Yr4YAy8YqBvl7h6bbfZ1zXprocEIa1dOlVo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Zu87s7KW7LU2GDWszePJeTuMTj7FXM19dhs2jOpuJhukz9X8qareLWbyd4+8S/FcP
	 QvlJrrDf/Pal/PQG95iCltNkSgWh5ok019T7i/V1ddE2bvslRGTXWtw/5LxpfQbA5c
	 CbGkxkxtkcrqf/lIrlUxEk5eJv1VL/UfpAoEqOQ1tAHscQ396i6zbQs+qP9cvHJIZ8
	 RmU0T8JRLhTvYe+exP33z+tJt6eknfgjWsm64hh+idiHBaifdzfYYS7k5iJpSLwFbP
	 wOveRnd2PQN8aQcNywqMBzqZudRPo7NXUf1krKteN8DBJcLgplpoST3bJ32lyJOK1k
	 mnObnnSK/ERVg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 677D4CD6E7D;
	Fri,  5 Jun 2026 13:19:22 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Date: Fri, 05 Jun 2026 23:19:11 +1000
Subject: [PATCH v4 1/2] dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260605-device-motorola-titan-mainline-v4-1-08a7be31f05c@disroot.org>
References: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
In-Reply-To: <20260605-device-motorola-titan-mainline-v4-0-08a7be31f05c@disroot.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=871;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=jBv/WRLzVN0AQTAYpLJKebbhWke/WqhwJrSIev0LDSE=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBqIszXdatheWB4D+GMsg3dy2VNNVFI9RNKhj8vE
 aao/Uf6bvuJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCaiLM1wAKCRBtY1eBRvSh
 ZurpB/9crbf6RjfUb+3kGTIEenHrWZGD5rbK3BaKczpRvVbEO23nAEzycPVUh7bBslnamz1ev5a
 mnRCBOiV058RFyUFqdeiHYCMUE/nPOlEYMjI4eBl5fli1asnq2yxjC8Q5WjCdZv8qdsI1bWJdRO
 oRZgQf5s+z242yDy5DiKrk0dAmoY4LQsNxrlRi3GTRxpxFheHFHzDtdBYT4gegZqeky2VRGCYRx
 X1Ovgl5eFNv71T+hML+vDgSVsO7pGeFGbzKsbUAFIdhPBj5uD7YedCtGArBi6Tz4jQK2fRYbypL
 f8ZF3NEuDB0qbobe5BD+TpIDkY4e7aUHDspUMWNyqhlRxuKj
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111433-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:daviewales@disroot.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,disroot.org:mid,disroot.org:email,disroot.org:replyto,qualcomm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA43F648807

From: David Wales <daviewales@disroot.org>

Document the Motorola Moto G2 (2014), which is a smartphone based on the
Qualcomm MSM8226 SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: David Wales <daviewales@disroot.org>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d48c625d3fc4..3dec521bfd11 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -72,6 +72,7 @@ properties:
               - microsoft,makepeace
               - microsoft,moneypenny
               - motorola,falcon
+              - motorola,titan
               - samsung,ms013g
               - samsung,s3ve3g
           - const: qcom,msm8226

-- 
2.54.0



