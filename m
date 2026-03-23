Return-Path: <linux-arm-msm+bounces-99088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gPIEJOyfwGmJJQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 031732EBCBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 03:05:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD9063007E20
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 02:05:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A68F51E98E3;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hJdVFO5a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C4540DFBE;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774231524; cv=none; b=VLkAvNnfiBFi9WBaRYTZX+V9aR5ArZ1ItpZO2EqTm5eabE5zgkXToTZIub9SHnrwpoNsxWt9L4knxKbD83WjurXyNywV+PQPeWnetUC/MWC8vckbcYqRymnSxQ79+w48kSoOfpW/06fRTiYcHM6U2/zgxIAqCCFFabgWCUNBceE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774231524; c=relaxed/simple;
	bh=cmIstEkgZHkl7nI0XHk8Wfo6Sy+xy6Y1FEIfgq12ZXo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WoKH0dawzOLdg0z/dwMUOHKfQIhrSKR1GMH4wftZln02PoXrlOso+ChAWxcLtZgwkaOIKSQIl9Z739zxvXk005k84jw6X4OxTe4WgRJzG3wk5PXD9x9RRB5qFXdbZmSd3juvBaN1gvmkdkl5kMEqnw2i6fX7ajsDMEP86Ye7+k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hJdVFO5a; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 44F13C2BCB2;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774231524;
	bh=cmIstEkgZHkl7nI0XHk8Wfo6Sy+xy6Y1FEIfgq12ZXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hJdVFO5aVzKMxjitngzYOmYb4G78cSC92Qu7VJz6Fez0NmvXv3zpbr6Bf6x1NjJlM
	 RfQwvad42isTqlQ+SD8khqHrBSxWWGgjHj9K8wfw9cREogTfyZrwAbMnpgmmtnr1r1
	 toVIrGlLfV4s8MBPCo6lcXLQj5jT/iQhKi0bsI3nR5ivJlVqtGJjTfdr5nI54Orojd
	 HAWXGXaiiCNzsBwn+Wvax62omXn7IHhE4vOzPnTKCerUr7qFkH7i8uSw/+/qcvr3i1
	 9uh+Sn/0R82NNkJGuYhCr8OARUapszVYpUqS0QBGMIHp5KVVV9qdywf71f+ABnZpMK
	 ZKuv+fsE4Wumw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C203D58CBE;
	Mon, 23 Mar 2026 02:05:24 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sun, 22 Mar 2026 21:05:18 -0500
Subject: [PATCH v3 1/5] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-ayn-qcs8550-v3-1-4afa89c20888@gmail.com>
References: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
In-Reply-To: <20260322-ayn-qcs8550-v3-0-4afa89c20888@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774231523; l=969;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=DfsqQ0wDc2yOsy9voxxx432RV1f7d+80L5/Qm5JGb0w=;
 b=yVc0EqDvGQgP86e/D0vKeeccfnBFJaSHVO/ZhNlpB3dAoRLwgrJKn+IXjfMMUNhUgmjzFMivT
 roAP3GjA2LZBtYB1rI2HNEVWBW9tOs32J6clfqcO+5yjCgh+sRnzRM7
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Spamd-Result: default: False [-0.16 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99088-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com]
X-Rspamd-Queue-Id: 031732EBCBE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Aaron Kling <webgeek1234@gmail.com>

Namely:
* Odin 2
* Odin 2 Mini
* Odin 2 Portal
* Thor

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index d054a8f5632d853509b7cd37f07f02473cf6bf71..ee68963c30eae10fd3b3a5e21bda63ab941893fa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1075,6 +1075,15 @@ properties:
           - const: qcom,qcs8550
           - const: qcom,sm8550
 
+      - items:
+          - enum:
+              - ayntec,odin2
+              - ayntec,odin2mini
+              - ayntec,odin2portal
+              - ayntec,thor
+          - const: qcom,qcs8550
+          - const: qcom,sm8550
+
       - items:
           - enum:
               - qcom,sm8650-hdk

-- 
2.53.0



