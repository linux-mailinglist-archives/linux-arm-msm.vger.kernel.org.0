Return-Path: <linux-arm-msm+bounces-97730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cOswAA0At2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:01 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9552B2920C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5E11A300E3B6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:52:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B5F337B00C;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTso/KlA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DA135B62F;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=EgiVhSXsbNLUPi31bBfijvDL4bQDR39HWUF+3BoYmgqutwD4AQ1t12kbFp6YMXodE2AtZ8v3IsjIvO41qVmguzEisHVP5/nnA9H+tsz0tve1VQkldSx/dABETkcCnC7h7R+EMPk8weBuoCQFw1QfWgPZxkD0QJEvrPOrdWSRW84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=q/R0p0BBSpFGp9pfP3i3fxeJFYjOlSeBAM9KVLktOck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UnQbpyeJ1FUtid0+qeZiiSFViLPCJ5Amt35B4LPc8qo7bXb3P/kPlO+UpEB+IGLJI83xqoLrNDWGZWZYVyWILXB474XndTCODBhY4byxqZMoZWUB3o+/77mpD9REJ5jNaYS7C+AZtp+GptAgujNHJ1MmA30lN4GIgWV9Si2MfyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTso/KlA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6F03C2BC9E;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600772;
	bh=q/R0p0BBSpFGp9pfP3i3fxeJFYjOlSeBAM9KVLktOck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTso/KlAHe1umY5FUohDkj5962qo+Q9jDizBO2BhRYKngpzth1WPDjBBdUMWAOZAy
	 KGAdboFdTMbs6oMGr4FjlXAntbt9ZnIY1v1+ZYmU9WA0nbIhtYuwBC+4yzkQnPucgK
	 fNgcTJsHo1h4hA0fEmq8o5+//sYBfYCt9ypArQWXYgWDcepTp3+t1W5P+QCoXmubBx
	 rZREfVJIiYN3H72A8VKUeEjFMWe672L8qnzaudz0zTXgL7kbL8DCG3yiWhc5DYJIlt
	 agz3coUCbOG7SkeuMIADnTV0n0pSnsJWXhCmny0n+y30g67QtEZhoL9aG3fkiNhgpN
	 ca3gtl9OiYHwg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4F03F3027F;
	Sun, 15 Mar 2026 18:52:52 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:37 +0100
Subject: [PATCH WIP v2 01/11] Input: stmfts - Fix the MODULE_LICENSE()
 string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-1-70bc83ee9591@ixit.cz>
References: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
In-Reply-To: <20260315-stmfts5-v2-0-70bc83ee9591@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=GOG7YJ3B7o+VT+w4GnBTqkhN1kux8Pdc+XTRfCEP/IA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5xvA2jZDZpaThkHd5fIt1f849y0fCPUsnG
 hXLFU7Ybe+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cj3kEAC8flFyko3KgokdqnmsqY30E4QKqug+jx+R+RaNVCkI8FpRbdis6TXn7uLQqCrJdikYBPf
 KxcunVIjVjt/bDknbO2VRkUEd5Dh01Pvvqb6VBXSOW+jpRZB8OPPWttqhJC62jZaaIk2rGC8/yp
 8zg2zQslbVuiYN8BwH0EDPDYLGargId3yIAIvv8BZWiMCvox7BSSybfgJGx4iRs8aQndby1tReH
 qv0npS/Fm8lu/kRU9U84JPz2RBE82C4ktfIpDD+cV49ZWEvnLKatY3st5QCNaejIFrDXPJvE2jg
 JgjM6DNev53ejSSjK/ABnf0Z0vQ31+XcpKkgHrbpjuf41mChPzoq6FdgGXkqc3/ymN26Oymjrgi
 a5FzqJ/s3+nZwP+/Yo62Ao8EDUJfSD9vRXYOZKBnOLc+RZSj2x5Kd+2uBdaFYX4te8hpZKcKSkY
 pZtPRjblQ2WHvr2yvGZfn6SKCVQOrkvwgDJGmlyTNlK4Y5W/gf2iIKXHNpkBSkmTjkkTlMIQDS5
 zdeuGtNMKzoXYCANxYXga3Zo9I5uXaOH91S/4zYtpN8v3BzC+GlE2Bo+wJha6EBV6Ox2f3RB1rq
 uJk5xaWLKB2WfZnP6VV0rLXvgwv99SbqUB2WgjIwjKUvkmFHOiTGoejGCGGo4khGH6EnMs5OSEY
 E/x5OZYOTeloq5g==
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
	TAGGED_FROM(0.00)[bounces-97730-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: 9552B2920C8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Replace the bogus "GPL v2" with "GPL" as MODULE_LICNSE() string. The
value does not declare the module's exact license, but only lets the
module loader test whether the module is Free Software or not.

See commit bf7fbeeae6db ("module: Cure the MODULE_LICENSE "GPL" vs.
"GPL v2" bogosity") in the details of the issue. The fix is to use
"GPL" for all modules under any variant of the GPL.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 4b166b0a9a5a6..d93ce68feca51 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -808,4 +808,4 @@ module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.53.0



