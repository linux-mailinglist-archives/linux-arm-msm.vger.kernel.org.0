Return-Path: <linux-arm-msm+bounces-101700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAo4Dxj0z2mt1wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED98396C69
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:08:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86D3A3011A72
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B60F3D1CCC;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZtX1+FF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73AE371D0B;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236116; cv=none; b=S2qhQeiC5ViXBh8U54PzSW12SpKVlekIvR3zhcB6U/BjBzaNH6eoBuat+XbofgSuPvPmTI5D2iSl3YMoDroixa+ai2R5pRqSrMFVRIH4QSU/BlKGEIr8uBzTy8Ml6hwA9cppFMLKrtpjb1bwq/9r1TZJ8fdYCXOFVcAWJp6Cmj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236116; c=relaxed/simple;
	bh=qd97gSvYOsCinrKqjfSpyQyyC3+0l1mQqK8cxyagYwE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVjNOtTQ3veMbZlCguiIuB0Mjg08w3yahGYINTOcPX3ZYwSs+vmUrEeEEH8eJAM/cziFH+h5mkh5pWkLqzgKjqWi2mZ8LGNu8CgyNHJJXpo7V8LtbGI5/owE3PKYgjCP5kT68UkAMpC2evY/9bZGTxfjgBVVeqtT695Vc75tsac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZtX1+FF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1F1DC19421;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236116;
	bh=qd97gSvYOsCinrKqjfSpyQyyC3+0l1mQqK8cxyagYwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EZtX1+FF2tGM6CRGb83ZYMsZrgEG6h47onkhhKC52alNGLQ2L6yBUoR8iMuKjs28/
	 CWbfzbkUzSauBqJG+7Cfs+LrupT0LFRpheDSSy6LY5WkDEwiT9KJMmShP6AtrtqBUw
	 npKabIadrXybvOatWRkeCsfjI3jhy68ZUAPRTDUNa8RlVZU2AH1ul/P4QkdN3U8C9m
	 F5b3kJKlOYVgIQrVB9vwceXRADeQYd0wM3eWvAZnUWis9qp0d28X2hO/B4xt8FTnFA
	 yBOxFetKufv9EkHn5nvj58ZsGcUYZ7DJKVD+BPgdLnXQm/OLcxgMtjPaRxnUpvYYnf
	 4kUnfePW7wxLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FF3E85385;
	Fri,  3 Apr 2026 17:08:36 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:30 +0200
Subject: [PATCH WIP v3 01/11] Input: stmfts - Fix the MODULE_LICENSE()
 string
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-1-5da768cfd201@ixit.cz>
References: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
In-Reply-To: <20260403-stmfts5-v3-0-5da768cfd201@ixit.cz>
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
 bh=QDQEyb6yQN5WPWE8pVdtCQECptdn8p6xNSQzeqr7Q2U=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QPfJpOVCbfnnCtwRQ25JsCdJwSaQ1DCEJ1z
 w4fa/zpwnGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cq5mD/4yTLw1YnM4rI+iACitacCxgW0nmVtCq9jvEjg0eRc+Doih2LUZDIgT2hoGxStWlH9z3TU
 mTNEOe3T1xOHCG/tQHkqAb/IW9B/dKO7mjFFjCfCFKh8J2Z/kZz57hlSwJh8M79zezOCUPY+PHj
 vD8JoniSzdu2vjO3oV/UmglrT9BpZ3rOAQX1wOKkiVtyDj8P6p/a9wMY0yaJq3gqKMmj5TdC8NH
 h30Pbc2q2hcHmlew8HVX5uzH8CBqcE/M/0v/ngcqfha3mxPJ0GgelOsofM62TO75oH2vmyJtbdf
 6++KrthcQl0u0XtPs50kKUSBYgK1SlmFXJjTRVWvrlATqME7HKdlKLCWaZkHCFbCdg8xrIl2Snf
 +DFfqrCA338TmpVIiUG1MSvwSvkMGsvWfSMj5T3WSeSXyuLEX2N4Yq3qRStUGNavfKvDFdGQDRu
 h6yZUvoyQnaHkyt+wEs6qfpsCs1uN2yJeWMr/fKp6sKjmq9dIPiMN0yRl4lC/5eNIruMCZeCgFF
 dgfuqiMuZ0rEC8O9kWUshsp/XU0XBO6vYMunqsaLWp18/44ZdRKFLxpJfbb5GRolXc1cyqJiEX6
 HMFV1zfu1GqR7Xf+BDp8hQ0B/+qYoDM54sWZHsqyujpsQKaFJN7q03bEi+UWvjQD0dhl/okRJjp
 nD6jaImfTZCUfAw==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101700-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,samsung.com:email]
X-Rspamd-Queue-Id: 9ED98396C69
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
index 8af87d0b6eb64..def6bd0c8e059 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -807,4 +807,4 @@ module_i2c_driver(stmfts_driver);
 
 MODULE_AUTHOR("Andi Shyti <andi.shyti@samsung.com>");
 MODULE_DESCRIPTION("STMicroelectronics FTS Touch Screen");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.53.0



