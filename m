Return-Path: <linux-arm-msm+bounces-104334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAyfOkYf6mntuQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104334-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:31:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2B452F6A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:31:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 964CA300A391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EFA13F0A9B;
	Thu, 23 Apr 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="syJ5tKoY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3AA355F3E;
	Thu, 23 Apr 2026 13:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776950712; cv=none; b=FOEZwUN0sOUwgcmHQVDPxTmBb73YOcdF9y9IH3eIW2gOv1pWivGlAdsd5R//MwWf1wkeA7eKeCYFHTUF3UoLnnlOC8eL9d6uRtE6OtCBEYvMEq8TNnhBvirrw78mqSWDxuko69IqULfgGafDxJucrVggHVQPt9fI9sGVwrwLNRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776950712; c=relaxed/simple;
	bh=DNgHtlNMFeLZZcnjfbOkjAjPInI/34SrkWeC1TkHIfs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELANwqA4IFpG1eqfl63rbwg0Rr9H/OfS8XPJWaK09gWyNiXYAenxsZ58fVbc/J6pCNdu9JD6YW6+nUZRSzZd39BpACDBN2jOTmrsBxKUmVTk3owUNrObnzk9GDZP9gpboTtyZB0oW1AEsjowjHLsqaRIQFGb/tokrg2HmKRcTuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=syJ5tKoY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1632C2BCB4;
	Thu, 23 Apr 2026 13:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776950711;
	bh=DNgHtlNMFeLZZcnjfbOkjAjPInI/34SrkWeC1TkHIfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=syJ5tKoYST1VygW26Sd2PnZRR8bxy6gRsQRDNQpgVT9Rzgf5svu34Gkta3w1mvOKj
	 CN79CVuI5xkhAJOOLlMjmsiaKJvYr5m7I8et6XMoi7KM6sL8zwsR4LobV40dC+AmP5
	 AN/9Q0inUVi3vMCXStW7PqD/MSu+BwSc0YvglZr+6THTu8I/M7k4B95eYEnz9zqRyF
	 zfS0nM7zOk9k0MTXnyAYR/oRSJwHP7odomuHSBWCcmpSqCHSoQWrlv0JjZGzSbfn1K
	 WwocPiKSh80OknywcPp82qT7DMF50E575EtkGCZps6dpKFE9+6rCbzuzJbDZdblwMT
	 ml7KRDmcZWB2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C95F589D0;
	Thu, 23 Apr 2026 13:25:11 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Date: Thu, 23 Apr 2026 23:24:50 +1000
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Motorola Moto G2 (2014)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-device-motorola-titan-mainline-v1-1-e1813a028cc8@disroot.org>
References: <20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org>
In-Reply-To: <20260423-device-motorola-titan-mainline-v1-0-e1813a028cc8@disroot.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=801;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=oFKMnqsDC3T2vvql9PrtiyhX6OueJR2YWdPHmaYDyKw=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp6h21+MI3k23WugEGLKIOeUacwyhuwOczLBd+k
 71Qy9HAYhGJATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCaeodtQAKCRBtY1eBRvSh
 Zql4B/40y3fcHWmF+Agq2WgZ/e4pDF9Yw7W4G/wM29JWSg8M+f5Xs/yq40Y9q3GJoMwZjBrBt15
 NsM0kVMz4tYoHE3FIxTg2FfShX4l9KUaRYxKRPAbSbQ7NsPKrO/eupQ41fjRrGCRWa5HzsVx+z8
 cISu/qB3fhmifzC0DKMcjHwbpEgE5yaBys4j3KCjIINeVFQVTnfK9crYBLZ4+4dWafNwtsFRN0y
 /rcWlMFa55M2UIxxGhvdhnv7965fJspIMBvSjNblei5TEpqX0Z6Rajc8t004bMjejSg+RU5Ejq5
 zc6l9NHIYmnK8PkhcX7zgwTi3pZUyJzUi0naKKgogo53h+7Q
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-104334-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	MAILSPIKE_FAIL(0.00)[2600:3c0a:e001:db::12fc:5321:server fail];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[disroot.org:email,disroot.org:replyto,disroot.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4DE2B452F6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Wales <daviewales@disroot.org>

Document the Motorola Moto G2 (2014), which is a smartphone based on the
Qualcomm MSM8226 SoC.

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
2.53.0



