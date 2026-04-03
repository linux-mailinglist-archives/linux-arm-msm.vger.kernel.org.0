Return-Path: <linux-arm-msm+bounces-101695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8BXOF9zxz2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101695-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:59:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E550396B61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 18:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8294C305DD12
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 16:55:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E2003CEB98;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VOkSxSln"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5788C3126D6;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775235335; cv=none; b=d8IH83r6hsYYBclLM8zTKrBUdZyUe1OV1gZcKwD2HK762ueCc6ZH7+6pZa7g8OwX9Tb6SlYyrhUo+G9UXPUOmlq9a2sd0M7OY5xd0TvgXTXJo2PGtT+TxBbakh3zBXCOAZdYhyS27gwdWU7dyewRQvXdSQUg/ltiS538OGZA0VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775235335; c=relaxed/simple;
	bh=PJawrwdWFii6zmXAcGsX7OpTWZGyQf+ab+Ld5/TTfp8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JpLWzrmOoSdg4bcABbmhdOrVONpr6aQpz2F2BFS5oB+esaqn8wyzgmuZkIuyscBy5qBWvA19Bk/Z2vFRpUB+eUqtDuD1mVPJoYD0MrgxjNNiOiHNXWMgF5WzJPdHp9aWYgvPC48KiHxEljrcKmLAUp94wSpOtbIbT/IJjjJaaB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VOkSxSln; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16D52C4CEF7;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775235335;
	bh=PJawrwdWFii6zmXAcGsX7OpTWZGyQf+ab+Ld5/TTfp8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VOkSxSlnqeV7qw857s4rkvMvXkh2kICEsCz5IqEd3OvKp9F2BOp2jYEA0ieJ6TYRP
	 lLcZSTDB9/w2H2aicl/goNmDwVQV8TTZw2C0Xv657rAIP/9Hj+UxdSyh+MuAO0GvJu
	 SAyXGnBDPHgomtoCZXP4BmKMJotOREP1wf//0ER0K5i9t5z8AwE2akOu5c13TxNHFO
	 jOcZG3F1HsAmcdka0HKabF7GfZAWbEkY6z2erdZxpt1raFRzToVJuDYWTTeqtmcIUD
	 qtbPBbanlEJQwpthYzYg91syXJeXJIIQIicnF+kqDhKF21spTxtba4yls67BbBW0C8
	 tDqpUuQZybIwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CFB2E8537A;
	Fri,  3 Apr 2026 16:55:35 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 18:55:33 +0200
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Add Xiaomi Poco F1 Tianma
 variant bindings
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-beryllium-compat-string-v1-1-0a6b9cb55a20@ixit.cz>
References: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
In-Reply-To: <20260403-beryllium-compat-string-v1-0-0a6b9cb55a20@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1363; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=AtgDPB6o9zOT8gmNuMq9hNsNDcrlPLcnjmej/ulGt/g=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/EF/XHbZnknU2q9GYZE1b1+B+HQBIPS+BMAu
 FLyyc4yKkGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/xBQAKCRBgAj/E00kg
 cpeXD/9qfPaIKGyIFatNhQlvAxgq67x4QBtje0FIAW5zaF01DPyD5SluUuqyWDU5Qspv8UHOo16
 PmY/sqzltuBcMOQaLjkEKVjk9LfNWX28m2iovXJ9VSI8hL51qd3Ev7560Fu3SsvzTuVvcA2AQoG
 Cy+CKynm1+DvV83vCH98hz+OdiunZSkWbGpwO4BlHiHcJ6UDrHSX6ta8xRk5gBUNoteEloyIQxY
 P7A1Q87DrddWwey8vAwhYRV6tsuUEndBP39PPWf8PpdgCeknsnsKgzCeVfDcaLuD329IxdlYH6P
 WvFZTb7PMYToorhgO3nFLyAMMpGJ8JixLvUjUu6neK1BMQ/aPVm20ilIz0jrLNRsWTY9opqgRGG
 iXFruwNk1CnPSgP2HVX0ELW4Bd76yPZM6vyavs2RA5H8eVIKZiqcuSR7z730/9onybBcHn4C6qJ
 U6djopaSjBDLfr4xCRVMWwlIN4JKNigdMRDQRWFSit/wTyShu0hiKxsq+h0y4kyYiNDqILi/SeG
 kliRhWNYYoKG/anJTTujHZYZqVHjKQ8dnHb4flSUWFnnHI9jTrpDE1LfivszT5URklTJ7RpEHEE
 cN5F42Pe1H5psJB+IHJeXOx6lvRdTpxIteGxSzGqJWZgJqbQf31+A5fN00W3Lj/rDiW5fglUnbb
 ymvjge6fXsnNbHw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101695-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_CC(0.00)[protonmail.com,kernel.org,vger.kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 1E550396B61
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Add documentation for Tianma display and touchscreen variant.

While at it, correct binding documentation expectation.

Fixes: 341fdef8ea49 ("dt-bindings: arm: qcom: Add Xiaomi Poco F1 EBBG variant bindings")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 8c5fdd320cfcf..b412543f0afb8 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -822,6 +822,14 @@ properties:
           - const: google,zombie-sku514
           - const: qcom,sc7280
 
+      - description: Xiaomi Poco F1
+        items:
+          - enum:
+              - xiaomi,beryllium-ebbg
+              - xiaomi,beryllium-tianma
+          - const: xiaomi,beryllium
+          - const: qcom,sdm845
+
       - items:
           - enum:
               - lenovo,flex-5g
@@ -971,8 +979,6 @@ properties:
               - sony,akatsuki-row
               - sony,apollo-row
               - thundercomm,db845c
-              - xiaomi,beryllium
-              - xiaomi,beryllium-ebbg
               - xiaomi,polaris
           - const: qcom,sdm845
 

-- 
2.53.0



