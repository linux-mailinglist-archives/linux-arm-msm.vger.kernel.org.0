Return-Path: <linux-arm-msm+bounces-119156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id E6/YJVkrV2oxGgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0001675B232
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 08:40:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=qJSONXgf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119156-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119156-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 99ECF3061624
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 06:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D8513164D8;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D0A3128C6;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784097547; cv=none; b=CCLh4AVJfIbwEq07qavF/pdGvCIzKrZt6S6xLZ4ak4Nh9ftKCLRMW2PPBdfXXrvvIA0nQy8aLplkSdyhjSq9sMjBgGdfgf/88TX3h+dML4Kbd3PBvgp1UPmhFbLi3hZfkKu9D1e0OgNUPA7ueSAMgurPh5MwzMuITAjOLjuqZhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784097547; c=relaxed/simple;
	bh=M0RTFSLiMdB54hWo7CvBKBA6KLRs2mkAXPGv9anQlng=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W2txtVLdikOAtKbuCk4HD5OQRsGreHQ817YVGkfKfLjZXVS4lovN+3mz10+XDb0xc3gY3IuwE/5odb+sZFBxb+HP7GXh0ID1XhsMqwcjgrnhbeBXq5PzHw/QVQPRWZyZhXl3VNEkxU0KqzBm7eghDqpL0WFXe/M3mSoJTFpJvC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qJSONXgf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31535C2BCB9;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784097547;
	bh=M0RTFSLiMdB54hWo7CvBKBA6KLRs2mkAXPGv9anQlng=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qJSONXgfXbNlP07tVpFRBvOk07ykv/vCPJ6/ekZRVep77WO+WxNEodW9U4irgfAN7
	 X9j8AXEowKoJ9ewfgIA7szAJ7mbhdllqyir5kntB/6ZzKQYX8IxA2cMuVPtb7sUfGR
	 CCDEwLl7OWcsXBVqoQCfI+vpc1rSgrOn8/illHWwSvGHX0HpswaPCAW2Fh0eZY9R6H
	 cgHOdBKClxrxF41vtkDOljwwmPii6EK96hEq49bmSzSDDAOa+rKVPhCKFKE+0rQGXt
	 pNj0owRYRHIOpJSBT4NdhVOthXAitkpsGsUH23RlcXGROR3dnxtvlR/sXhisJnmmKn
	 e2QImjjB43s9g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0763FC44508;
	Wed, 15 Jul 2026 06:39:07 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Date: Wed, 15 Jul 2026 02:37:46 -0400
Subject: [PATCH v2 1/3] dt-bindings: phy: qcom,sc8280xp-qmp-pcie-phy: Add
 SM8475 QMP PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260715-sm8475-bup-pcie-v2-1-48bd91a19abf@proton.me>
References: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
In-Reply-To: <20260715-sm8475-bup-pcie-v2-0-48bd91a19abf@proton.me>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784097545; l=1376;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=bLFIXxi0mjZfBPT4pjXHMUjEF5YF+fmxsIeBl21k8TQ=;
 b=4S6iTuTNBIWEcmltrDDzXdRp+F20EuVr2wpwnU32oM/Ftv7u8FHqHd2YAQmX6UmIZQx81MSQF
 jTTJEIqnC48BGyWMkAONFDoQEbMSRYoiC/Y1VgRCYRhmyLeZH7nHQy5
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119156-lists,linux-arm-msm=lfdr.de,esteuwu.proton.me];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[proton.me:mid,proton.me:email,proton.me:replyto,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0001675B232

From: Esteban Urrutia <esteuwu@proton.me>

SM8450 init sequence for this PHY varies significantly and can't be reused
in SM8475.
Add bindings for the PHY found in this SoC.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
 Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
index 108cf9dc86ea..8850d5ebac03 100644
--- a/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
@@ -43,6 +43,7 @@ properties:
       - qcom,sm8350-qmp-gen3x2-pcie-phy
       - qcom,sm8450-qmp-gen3x1-pcie-phy
       - qcom,sm8450-qmp-gen4x2-pcie-phy
+      - qcom,sm8475-qmp-gen3x1-pcie-phy
       - qcom,sm8550-qmp-gen3x2-pcie-phy
       - qcom,sm8550-qmp-gen4x2-pcie-phy
       - qcom,sm8650-qmp-gen3x2-pcie-phy
@@ -175,6 +176,7 @@ allOf:
               - qcom,sm8350-qmp-gen3x2-pcie-phy
               - qcom,sm8450-qmp-gen3x1-pcie-phy
               - qcom,sm8450-qmp-gen3x2-pcie-phy
+              - qcom,sm8475-qmp-gen3x1-pcie-phy
               - qcom,sm8550-qmp-gen3x2-pcie-phy
               - qcom,sm8550-qmp-gen4x2-pcie-phy
               - qcom,sm8650-qmp-gen3x2-pcie-phy

-- 
2.55.0



