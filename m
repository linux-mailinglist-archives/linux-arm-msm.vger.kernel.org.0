Return-Path: <linux-arm-msm+bounces-94756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QDA0JM18pGl5iQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94756-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01B11D0F2E
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Mar 2026 18:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFBD930238D8
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2026 17:51:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27A3E33C536;
	Sun,  1 Mar 2026 17:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NpCIwspC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B875B337BBD;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772387479; cv=none; b=GZeUFZy0fCRq1TrfRijYizpinV87ohDT21NzLocL4I7mvj6pbzW9xaKr/2Icx5OV5rZhUBkCo49kDiRCSh2EC5aj7BaJdQUszKk/f8kF/hEPx/7chqwcuse2TAIa4VFiOAi7ueLaVluLsfXLKTPYYc2VDATFP7AQ5AXJNefctzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772387479; c=relaxed/simple;
	bh=EEDR+B/u70Hi5MKRcWvqfizpDa9OzsP0bN0/LeEmdjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MLx+vSZNBKNeQ4XMoXhTdxSUtlDL7j1lMBUTlpEf9HZg3wfhMwv+oyA4yI+0h15/3Rt3nxfwpvtvzyjfLEFAv9Py6T2hXbzPU/7GiRVB5Ba5oNaA289+hNGzR2cHGAph6NKWWc37Mjre8hfmoF/hwP/NApkMwa/X51nxzBUacl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NpCIwspC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 960F7C2BCB9;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772387479;
	bh=EEDR+B/u70Hi5MKRcWvqfizpDa9OzsP0bN0/LeEmdjw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpCIwspCDQBcXxr2XaO6mLILh5eR6xrpmzKPx767QEnDzCj867iwTG7i4g75fIwbD
	 d5UOKnvJ8Bqc22BTBl1iSUPDNHOyM/l3CX767lP4S4mKktj3RPWkOSpIyuEmp3qrdz
	 sqROVfUvBUXgVotAvlPuUYQ6LjQRSLg0QforfZkr8zVTCKp0YocY01KDLNzESHqTcQ
	 EDE2yHqhZwwCA0Fsrz+T5UB0tyR11WPRRnpVJTeVB8k4ucmLgYEinbJt/kmnWzKsfU
	 StcM9QWIUKtzX2/f5ui8rBbxy/yCaV4uDS5KSTorumARIXrK1D/3WFLu2lWhepsbhC
	 ut+tGyXzsEA1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAF0FD0075;
	Sun,  1 Mar 2026 17:51:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 01 Mar 2026 18:51:19 +0100
Subject: [PATCH 05/10] Input: stmfts - use client to make future code
 cleaner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-stmfts5-v1-5-22c458b9ac68@ixit.cz>
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
In-Reply-To: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=J6AT4NhPh73qOCpvlr3elkk31hc657GgBpzGKxirckY=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBppHyUhUCNk886i9UHnFeU9WfswQgQdF4RB0CFY
 hE1WxDMyVSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaR8lAAKCRBgAj/E00kg
 cv3hEADLtufWl141f1f1h14sRKMAUQ/PoEqhqbwRFbpVBK0+19MxXs+qgfz3O2zFaj2jijCLVtW
 ZuPmjvRGgQ/fZr3VS5JKnRSuWVxqrIWc7uYf0WO3UDw6VVzaTGkrJ5fdNPbHZAIH0jzaaDQAnfy
 z1stmZk9RWS0BVPkaz9C55qxwBVdATfJTb7+87BmRFJixu1WJeK/JWDgc+XrwOxtpFI3hQKSrH3
 oPNlm7ns/UbaS1gryeiXLSaXHl93B6IGwgDOouIJ7MHTIguincDwKfwoPOfekXpt0OUhyu5o9Tp
 JhD9BzftvNYOsZp4wfG0yngoJO2FWuROEF+aEqllVpgOar3RnbOkNOWImVHMWPLKRxLaj8uqYrK
 wfpier9Akmd0orG5s1TeqBhU7t1tqmChv2kOsXXgoYAKoMJU6/mUAZLISuDOa5p92//0j7MKDXs
 ADXPvTgxdunq9J/WL/tijtxwDfpDSvyoTxXsHMOvYuifChd+ZfnriG+xTQP+8iTpiNLSrHccI6y
 6pYEzSqcEWmGNjlEOad/2yS9DWnT/YRHAvMnlacgIjv6CJJou2PHt70CjY7xc2rPuA+ts/VBUNT
 lxrA/GIhYjS3Ufckok889Myqg6VupZ57VWysTrDxEKyfjgESgD/Hs/sKzQmNEUb4I3XIK2gEVRx
 FvYqik3DCVMk6OA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94756-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,protonmail.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F01B11D0F2E
X-Rspamd-Action: no action

From: Petr Hodina <petr.hodina@protonmail.com>

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index f4e5f1b3ce796..9dedccbb183ed 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -764,9 +764,10 @@ static int stmfts_runtime_suspend(struct device *dev)
 static int stmfts_runtime_resume(struct device *dev)
 {
 	struct stmfts_data *sdata = dev_get_drvdata(dev);
+	struct i2c_client *client = sdata->client;
 	int ret;
 
-	ret = i2c_smbus_write_byte(sdata->client, STMFTS_SLEEP_OUT);
+	ret = i2c_smbus_write_byte(client, STMFTS_SLEEP_OUT);
 	if (ret)
 		dev_err(dev, "failed to resume device: %d\n", ret);
 

-- 
2.51.0



