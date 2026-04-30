Return-Path: <linux-arm-msm+bounces-105414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WDT8Oumi82ly5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:43:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 901FF4A7172
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 20:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C452D3002B3C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 18:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0F747D921;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dls7W1r+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A7C45BD45;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777574630; cv=none; b=FSGey7+XCR4cRy/s0L/nBuKrU0J2vi5WIC3uPTZPLzZACmZgy4yzChrw4YfGOrxBJZeAwZy3/A8MaJGN3aV/hbYHg7vSmOfK7Kkgu52mkCgKJQyakFvaK9ISBPXD3RW4oIwGeX8Nw8YN0Q3ng6i0vhaTiusogFxYe+9ixdiqTB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777574630; c=relaxed/simple;
	bh=1Y/LPpbwhO7cv9vEDbyRgvJvnMnKJWgfUgBbXdmBVdI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVxq680JXfJ48jI+/vYp0Ut3A9PIZuqroNqFrQy8lEQrykq7B2eWUJHjaRk7nwkBDZpUL3cKP8a6eK9NikGwMhQFVKHGTCnmj0Os4s2tjK3yAfDjZseOXXxngFMwXhHzVYC1LkXTh0H4lIKv+6NZUSFiL1uN7kx+HvGCg155I88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dls7W1r+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64D7EC2BCB9;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777574630;
	bh=1Y/LPpbwhO7cv9vEDbyRgvJvnMnKJWgfUgBbXdmBVdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Dls7W1r+hFX7Z455TJ8qT3sp/Kb1rgK+zBFx+HRa+ev+gzZ7QpXD53OxQmAhqKWvC
	 I7bNY5MLzqabytuKimLYEbqHFhyuVwR66g6l75kYsxxMM1vnOvspI2DrjVuHZ3wAuT
	 jZWZlcZ7uBPWZqp9S/wa86KSeBoDlxMMD6tPUuLX0FOglZl1YXyjDzv4Y1Brcl2iDf
	 KuoaNvdJKU+vN4tlU7kUXsgY2AubR/eYsM0QZ2Wk4vrzRf3MuwMl6aKLPfLcQ9sSJS
	 Gb/iJdN9gXp1Byz2bKZ52VO8DfYnUbFFiEgSNy2SAskDWH4Usb2A4J8kOMhRd/wjKW
	 Rz+K//An23Btg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574E2CD13DF;
	Thu, 30 Apr 2026 18:43:50 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Thu, 30 Apr 2026 13:43:37 -0500
Subject: [PATCH v7 2/6] dt-bindings: arm: qcom: Add AYN QCS8550 Devices
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-ayn-qcs8550-v7-2-591a96735fa3@gmail.com>
References: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
In-Reply-To: <20260430-ayn-qcs8550-v7-0-591a96735fa3@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aaron Kling <webgeek1234@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777574629; l=991;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=2rGqOlPqgBo2SVV0is/nScu9jSlRs3IsGD1uogdg7P8=;
 b=/lij3UsSBQRv/qHu/2g5276as2tHB5mceFtu5y/372FVjb6aizahdZ39zoJtWHfqMLlqGTzE1
 x7SJxOumCMOCruywycT/UKc0afTwdbKjz7fpikswos8v4p+QnbS50dC
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
Reply-To: webgeek1234@gmail.com
X-Rspamd-Queue-Id: 901FF4A7172
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	FREEMAIL_REPLYTO_NEQ_FROM(2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105414-lists,linux-arm-msm=lfdr.de,webgeek1234.gmail.com];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_REPLYTO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,oss.qualcomm.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[webgeek1234@gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email]

From: Aaron Kling <webgeek1234@gmail.com>

Namely:
* Odin 2
* Odin 2 Mini
* Odin 2 Portal
* Thor

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e425..4a6733eaa8b14d 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1099,6 +1099,15 @@ properties:
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
               - ayaneo,pocket-s2

-- 
2.53.0



