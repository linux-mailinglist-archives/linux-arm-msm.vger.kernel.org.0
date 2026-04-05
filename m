Return-Path: <linux-arm-msm+bounces-101850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBqvNYY/0mnOUgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101850-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:55:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B4A39E11F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 05 Apr 2026 12:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 997CB3008798
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2026 10:54:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB3233E345;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGYZk26Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942D830F548;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775386497; cv=none; b=nyAzVG40dsYdj4J7Xwimz3brFyIqAxjplAd747lpCJ5WkbGJ3xFHumic3grNkbNSGjh84YHDtm2rd4jabwXqzcRxZKYNF5ujLg9DCf8CjNFeK/LPOt2jXf9DwBrIN62kN9YnD07eeK4Heq/Is15a6Dtjk35LE/tYnojFM37Uf0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775386497; c=relaxed/simple;
	bh=XcLEKrizb5C+gi7ndYHP4fWrE4G0A945eXJeCxp9qgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u8nLLsHKtowwjEJSgbUBh4fAAH5tDHCFi65z1fowUX3XAf0CvNozn4jNHSGgz2eghj2FQFDXDxdybFZ46pLQnsBpWQEKfhUp33SR7krh1S5Ro4HaQCKswlrRZvuNcNStcwMO2mpqLWLcOGpFaXhDtGeSLrPAx49w4OgXo6c5zuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pGYZk26Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 46806C2BC9E;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775386497;
	bh=XcLEKrizb5C+gi7ndYHP4fWrE4G0A945eXJeCxp9qgI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pGYZk26YU7013BISne/gFXIUyhGVdvOOzZEK2R4SeePZhOLNgDCtfOqoldZ/CZrGY
	 /6IYzFXw1jIYXo+xmJDMl4PrjMrI4E5Lxhlckm83r5iUvURVTJIVxygKubwJsep//M
	 RQkuUz/5qRfAQYjLneKGBdN4BeYypG8ztHYV6LY8RNk2cwAIyib/tXUSsJx3t6BYAF
	 b9B9gYpe5w5i6WY3HdnHdFk3CJNoVQSF42JhfkWneCRHflV0mZpTBqZX56aZfF+1+4
	 MmMHV+ubnSwl3XTursWrD77xqzZqAjUs9jyZM4VT4FvDjytYu41OgutPqdFHRNnHKT
	 2Vc+n6J7m5GMQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5CCE6401A;
	Sun,  5 Apr 2026 10:54:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 05 Apr 2026 12:54:55 +0200
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom: Document Xiaomi Poco F1
 Tianma variant
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260405-beryllium-compat-string-v2-1-91149be07835@ixit.cz>
References: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
In-Reply-To: <20260405-beryllium-compat-string-v2-0-91149be07835@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Joel Selvaraj <joelselvaraj.oss@gmail.com>, 
 Jens Reidel <adrian@travitia.xyz>, Arnaud Ferraris <aferraris@debian.org>, 
 Marco Mattiolo <marco.mattiolo@hotmail.it>, 
 Petr Hodina <petr.hodina@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1912; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=3okoeHHsLKYkc9npC24SfpxwXKr1llfhyo8vc91adjk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp0j9/J+BdQUFAeWoPoVuMTDi5PhyzqApcMWxdd
 PtYGm792pKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadI/fwAKCRBgAj/E00kg
 chgRD/9Wv8KpzXdWLygz7fFRVQKLarIowcySGNeUuzMgHB9qZnaJY+3gs5qZ9HzuUbGa0Ex3GK6
 sadTr0xdWzeqsdTtRHA1jQHBB7VNjrV0ubZoprphQ4uANE07R/fPSQzW3+HOng8bhlKtJIsTVpA
 EBi+HAqICw5d96W806Kb1bhRq2dFcV/8pQJLsRPU7NLuupbH0V5Qg4BJB3G0vVSHk0wuIOG/ZYg
 xvrS3m4KaFe1iMVI77taMa+BewNriqAsoppZFmGcT3fOcmRfIGyMswz1COho1DB18sIZH7pXWQR
 OCrdnr2QJLv0S9Ck4DkikkKAJb5229ITH4LaOoIZPRZiIc6ebTsgLGqkLbP4rrmbW/pgrtYJvWx
 ofBcBvJNntREklIufXCcSB8Uf0YB0j25+4dXM+U6uy3huXBkQZi1KfbKtxZkay6+slNwf2l/oWd
 8dxt1w3xQgOUMqFbTCzoCDnQRKzCp3IdgHylV1CwiPYqp9vaXvfOv41K0/w9exdRIdji7eMliMx
 7NgYt3gk6xMF8rb3LfKm3nK9MnR7HiFrkRJ3IvztGvQVOmi4wCE5Mhc569AEqfrdhOScPgF2sdz
 vfnXQxhvf7kOAh4NzBpgD5UBMSWPjjbRq1viTWAtdtA43OuwAcZ5yOI6k4V93QiaHqgJDj/ms9D
 EFF72lg9RTcZkpw==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101850-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,somainline.org,linaro.org,gmail.com,travitia.xyz,debian.org,hotmail.it,protonmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 82B4A39E11F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Document the panel-specific compatible string for the Tianma variant
of the Xiaomi Poco F1:

  - "xiaomi,beryllium-tianma"

and require the generic fallback compatible:

  - "xiaomi,beryllium"

Update the binding to clarify that all panel variants must list the
variant-specific compatible first, followed by the generic device
compatible, in accordance with DT matching rules.

The previous binding documentation did not describe the Tianma variant
and did not clearly specify the required fallback compatible, which
resulted in inconsistent DTS implementations.

No functional differences are currently exposed between Tianma and EBBG
variants at the binding level; both rely on the same generic device
compatibility for software support.

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



