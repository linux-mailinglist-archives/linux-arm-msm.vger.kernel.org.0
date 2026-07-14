Return-Path: <linux-arm-msm+bounces-118960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7Fe8NBHZVWowuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:37:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC867518A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:37:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Khae6BAj;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118960-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118960-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 02A4C3022853
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 06:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2673DB992;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A322137AA95;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784011015; cv=none; b=u8Faq6lHZLh9BLSjLiBC/Ff9cGtGcFJ9Dduq/tEm82n6KH5QIZSk3hANinR6+s0N0U7kcH9dn0wDa/RDvzeZXc3R7h3sQUc9ZDGvUHnHMNyOFMcrg+j0uHCAJ4HCrIk6tsX3J35+e9kmw6cGISjbTSUHivlnJuQknkZEbcVIfcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784011015; c=relaxed/simple;
	bh=eE76d1JQqEwXOlMK3ZwMoU4LF2A2iHX+muW73XX2laM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tk1KpgLFNGV+h8ovnKFbyFFL6fJNQ4N4fmeRrewAoi0YvonlDGyHei/CLqlA9TKNOtZON7iDEO1HmwPIVU0JB+kCzH3hm4SfJktwvBbNsPTFUhSfjGhOSA1be1WM5WeW9V6MuvnRFu6tRXb9eP99HPIJWIeYUz7i2w9jCOALFS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Khae6BAj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D547C2BCFD;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784011015;
	bh=eE76d1JQqEwXOlMK3ZwMoU4LF2A2iHX+muW73XX2laM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Khae6BAjyZ9FOO3NfJGaxhYCn8TYrezIHtk1eEW1BrCmCJvv+UdoUzZfCEBBR8M6G
	 FIFnNORsHs00uCDE+seKLz1GnJ/q6jd+yfMKwk4N6UliraoS5BI1VJzbFWcNmtvf8G
	 Wd2JUCyu88RdFRmRwJyuDlttTZbeukC0eR9aMwBWFUvQPjM1DMSiXXlOoi+wKfZpjd
	 9HwClkh7puPAGdCf6jIo74fpBVmEqkjRYbW0aq38CJ/WGy1TsASWEa6z/Xwffwfwzt
	 6wFFYzxW+92k1ck0we6BBhQSD5U9/P+8q9sD+EWASvqFteIhk4f9CVX68Mo/vlfeyN
	 8jMUrmbpuzRrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575A3C43458;
	Tue, 14 Jul 2026 06:36:55 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Tue, 14 Jul 2026 02:36:42 -0400
Subject: [PATCH 4/6] dt-bindings: phy: qcom,sc8280xp-qmp-usb43dp-phy: Add
 SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-sm8475-bup-v1-4-b2871be2b4ec@proton.me>
References: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
In-Reply-To: <20260714-sm8475-bup-v1-0-b2871be2b4ec@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784011013; l=1034;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=PFP6IUISjVGd8cu9nI1mb8qZCo6FrND8DguB7XWFWvU=;
 b=Knlwubmm3cj+tjfc+xBpN8HYB1V46nzV6q3q+6JzCvyRUeRuUxRW9y10afVId2G8FiX1ImDZ6
 KipU2bPxOM6CpEpyjm4CljVsDSfrZV8o0mJIHoVfVGhl+VcTHijG28d
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118960-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:esteuwu@proton.me,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[esteuwu@proton.me];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,proton.me:mid,proton.me:email,proton.me:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7EC867518A6

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 init sequence for this PHY varies significantly and can't be used in
SM8475.
Add proper init sequence and bindings for the PHY found in this SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
index 4eff92343ce4..b9d0de25f43c 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,sm8250-qmp-usb3-dp-phy
           - qcom,sm8350-qmp-usb3-dp-phy
           - qcom,sm8450-qmp-usb3-dp-phy
+          - qcom,sm8475-qmp-usb3-dp-phy
           - qcom,sm8550-qmp-usb3-dp-phy
           - qcom,sm8650-qmp-usb3-dp-phy
           - qcom,sm8750-qmp-usb3-dp-phy

-- 
2.55.0



