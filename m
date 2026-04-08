Return-Path: <linux-arm-msm+bounces-102370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFwEE/jT1mkoJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102370-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E31543C4676
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:17:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3092430859FA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAE993A5E9E;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4RCEQfR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4385C3A2577;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=CdXaTkAg/BfQsVCFvKMxEQKQjuHafci0jeJN3QqqGl83oSiufqBGEHPysVh/LcreS6vuz9cF75rQOuUIx83HKhFkNbknTc2gbsFBZ+4IdjTYGHHw+21nLa6q5yHYLxC07DIMvn7Lcz9cZa+wIloP6NYAHTqp5akhDOPybC2a0QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=ZLkarQW8/Az8rauhmR2HAn+rZrJRg5Nvg4DuBB8fGyg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG4cndDE9A4J0iidCqnf+WQZTw+/nmxvdINnUVW6FrK2ZZ6ctImEaRAqi7j2fj6LvJMD1KxVwm3XXbzgBVDiClaxGOw5XGYjF9ak9arqsA/Ea/IiMii+oCF5bzA3CGLPh0pEN09NBjOPPun7bAo1ES1k6iWodun6Fv6hwLEQCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4RCEQfR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEF17C2BCC7;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686551;
	bh=ZLkarQW8/Az8rauhmR2HAn+rZrJRg5Nvg4DuBB8fGyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=R4RCEQfRBQG3Jocz4jTbcIGP9WAfz5heuJgd5C57LX/dV9t0iZy5YJYZ+BHNnLNjI
	 vtOd7CmFnNBpRMtw6yaMZsRZZhqoFmO6I/UC9PKvwQGk93F3p5sHoBikw8puZ86dN8
	 SeB5c3LhesPxoN1XhJGPaeJke6UnMvO8c5HzKo6m3usZk6T2925Ox7+GALpn8JFp0j
	 qqG2Z2MVBfS5wyv6V+gVdZ2bVvtjqms1uZGMqIDx5/1nH+VwUdC69UiXUKeUVwcoWk
	 wk2fuITpB4+77KqAYxUhrgfN375O7Zw9uYkeoIUUX40gSj9vFdkRXtb1d2mLUEGNK/
	 bCOjZ4n0Zadzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E567A10FC456;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:49 +0200
Subject: [PATCH v4 06/11] Input: stmfts - use client to make future code
 cleaner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-6-64fe62027db5@ixit.cz>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
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
 bh=b/jklM1zbCQq0LgFU9O2NrDUidLzNIiCSesKs846UrE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSX/8wXIcBMj7wQU9sHsMyexCIa9bif82F+
 jn4O1E6y7uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cqcjEACw7KJL1B4IeGb5Y5BLhFGgrkasV9+ayx/oBWguyFHfkrIFB+xMFBltOu2p09IDBo1J4+p
 4qTRCWcb6YWbnDCLB9ROTbkJHB6FqnyqD0qHhzhCj6oe6bBX8VtwihwshYUqCMOiqYTPTfyZdYA
 zSPIchO03UcluHlUbSNzns5DBC8wz7OuPjcumDzo4Ookxf5SkDVFbL1jOsWIQaf9EV8NDTp0kYv
 Qd8zrfrmVJyd7TGsfqwYgEreMlu829h7AQSzyXM01kObdBqce32QrmXVCZvDMjTIXxkjy1YbmAJ
 gkWpCMn40rVe07LKoU1qu/Eur0SmHWQhrUqYTQP0NeUH9PpeQTOn7QqiY6cA2gGkzLLnt2KjDr3
 xlghMrox8RCtiMLMLcRJnJ26jJoDdxG+Omr8AE22F4bzHTUGQhZbBR/etFEzUAKKxXAxIu4By1X
 iReyQ06qNMqe2ZarSxS8YemKaFQa+TJ4kfHhjx/3k0v213zjyLkoRRBZxBy09lgIqJDCf9HsOpe
 fMArxmvZS0rqEKK82VhfTkuPnAPzTPV7FVjxCijX6gsJnS/DFfaqcIXXGWdnGAYnjby7VipMIz/
 lPcTzlVlCUbfVXC6WuirJsGcmE5Q+6v5jMgd1eq3D/gIEjipqbxu6SHj47+2DJ5T7zDrBW6FHh0
 a4CNzCUEFCnoVyQ==
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102370-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	FREEMAIL_TO(0.00)[gmail.com,foss.st.com,kernel.org,bitmath.org];
	RCVD_TLS_LAST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org,ixit.cz];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,protonmail.com:email]
X-Rspamd-Queue-Id: E31543C4676
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Petr Hodina <petr.hodina@protonmail.com>

Make code cleaner, compiler will optimize it away anyway.

Preparation for FTM5 support, where more steps are needed.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 290511dd69437..b61a19e954296 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -769,9 +769,10 @@ static int stmfts_runtime_suspend(struct device *dev)
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
2.53.0



