Return-Path: <linux-arm-msm+bounces-103458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EK0dL5Rl4WlyswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ED46415484
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 00:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C2CCF3083804
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Apr 2026 22:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B663D3914F7;
	Thu, 16 Apr 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="RCK1HdBg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7325438237F;
	Thu, 16 Apr 2026 22:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776379253; cv=none; b=MvZUFoGbVdlIsQVBgLZiTbTenZejSXYJywPB+w5eoY1eCLgcXFyy9BlkX5PPEMh9gdo1dnEQYLNf5fUKCRYJaxhs3l107JXIS0JF7uWoSuGsfKc88OUr4zoUMGLXJF1zWyVn9tPBX7JG2WxHg5O6n1cwHi8B6YiyE+AXNeF1N3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776379253; c=relaxed/simple;
	bh=sC+zcrByO+PGlqBAQ8rYqYYaIL1rr++mYDDrX4PXZgs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=H+onEJEA7u2vI35gfkOT4bPPwiZcs/ADvGajc7fvr57HNOLm5bBKr2ly0JCfzJgW65jyxNrIFRXtWXTxsoWs8CGNHZ0Y6PTX70yoAvdCeIQr1ZTDUXVaSSZUYKdkvgZvLKaVeuDKWdZC9RbKmYzFlK30GnyJS3jYCPfEgt4I0eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=RCK1HdBg; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1776379250; x=1776638450;
	bh=+hcirqWTitm0iG+vWSxCcCrg9AcXPeBecN4cQG5hBU0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=RCK1HdBgleK7OAkuLRCOP6pIHQVCGyf+HYKXEmAOCrBdVLq4MoJZY9KIrwsEByXjm
	 xWQsUeQWBG09dTeGHYfYDEqIHPiKZcNR/2r+hShkyihRPcWFsvtFQUaor4U8vIqfoe
	 5beR5ELzUD3LyExV48e/RTHsiGr3lwxg0qyShXHHXBJxXRR9rHV+JRgtf9Zj8BXdIg
	 Ff0heUIb0kGTzfBjpYzRCxHbcNAPuC2hlso11kKyTku8GKgo6Jik4zwvNNGz6fdszz
	 LVTH3dBD1/s48ofVYpAi2dAYQCpzk57vGTjqIVSqYrbxZn1AaDDOqlJvnjy2sMmABZ
	 10VeXGHNxRJ0g==
Date: Thu, 16 Apr 2026 22:40:48 +0000
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@kernel.org>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Koskovich <akoskovich@pm.me>
Subject: [PATCH RFC 1/4] dt-bindings: net: qcom,ipa: document Eliza compatible
Message-ID: <20260416-eliza-ipa-v1-1-f4109a8e43c4@pm.me>
In-Reply-To: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
References: <20260416-eliza-ipa-v1-0-f4109a8e43c4@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: b1235ab0014dab494a1ff26196651d0f34457f5b
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[pm.me,quarantine];
	R_DKIM_ALLOW(-0.20)[pm.me:s=protonmail3];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103458-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akoskovich@pm.me,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[pm.me:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3ED46415484
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the IPA on the Eliza Platform which uses version 5.5.1,
which is a minor revision of v5.5 found on SM8550, thus we can
use the SM8550 bindings as fallback since it shares the same
register mappings.

Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
---
 Documentation/devicetree/bindings/net/qcom,ipa.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/qcom,ipa.yaml b/Document=
ation/devicetree/bindings/net/qcom,ipa.yaml
index fdeaa81b9645..38a5a337c34f 100644
--- a/Documentation/devicetree/bindings/net/qcom,ipa.yaml
+++ b/Documentation/devicetree/bindings/net/qcom,ipa.yaml
@@ -60,6 +60,7 @@ properties:
           - const: qcom,sc7180-ipa
       - items:
           - enum:
+              - qcom,eliza-ipa
               - qcom,sm8650-ipa
           - const: qcom,sm8550-ipa
=20

--=20
2.53.0



