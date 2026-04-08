Return-Path: <linux-arm-msm+bounces-102369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLB5IMTT1mkoJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102369-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAD43C45F9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06D28305B280
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A913A5E9B;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LFtLkyc5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4538C3A3806;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=dEi4Z0iBAW2ygPyEKdk+2jpKM6NmNbw5DosYykbY9AGWbSCMUXmcxO7eNLdxP4fx1yA6tAlIiX7gSlrjnX524KmhBEHPcPPg57QuCpb7H/klmCndkO3KnoIVNxPZwhnySrB1yvEnGyhFgc3Usc+1ymdxHA0ZfRFKSamQ/xVMD7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJc8oeyoccJoBtl9uphvRDKqdtIML/W7U3l1MTwBcOKl4ZMpsro9djkmycNO1OUaKwRnlFFSLTqCNnwinaF4SkM7SX0nck6MvInqRajWNXLNi9JSbTroGJfeqPbEfJEDZ/nnU5vIjMaV9gFaAO1JFVC3T4G+JzLDCzeRoCrQa9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LFtLkyc5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D56B6C4AF11;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LFtLkyc5y3Y4zaUhkX9mFib8lqm3w0H6It8p0Uoeeu3JR6kSzM2i5Z/upk5ejlGd0
	 508BKqA2F7BXJRPfKKkHMTUYr/Rq36NWJCEdgp/mAX11VM2lWiEueRuaz9VfLUjL0N
	 QeB++/1sewqYrEzN5peujgE4KeL7o1E+mbCM8tls4tECiK8PkhN8qfMaAwadPYR8v7
	 7D0FaMooXP8h3QZzbPejjFvmyLTK2sSehKFyoGvc53PLZSeUYmJmOFRZZdshPiTgFY
	 imz4txeF2iXgc18fJ+q+qXMQJzmidZrPgw/ZPabcIp3HwpebTPMVgVNdXZwR3JzaHR
	 N/g7heHDojI6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C688E10FC453;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:47 +0200
Subject: [PATCH v4 04/11] Input: stmfts - abstract reading information from
 the firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-4-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MRRMNTeMVS8qh5Y3wcBKjF6ySEKPpTml4To4kFWgqxE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSDBefFkQ6pmg/ESv1rmphll3moGBi4877/
 AdaIOG9cUOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 ci2eEADECFzczHHY3Pw3nIE/rotnNSqUwkRYNMEFGe9E4VNC5iFgbpJXPFfYNTTC4gXdevtmLO1
 7QJz6f+uU0/a3G2yD3nPkQS83GYu4J7uDTFtkuQsDQ18s53YPBE8qSYkQXoJPPpd2DHPbdq5YKe
 0jIKBqpffX5dmbgcc2eRxHV5gV97Sw7cgl9VKNxanE9NWpZr3NV5fc7MsrcKWSwaljGS43jDCIY
 KEf9IyFIfwtdSymkLbG3JTHR6JfQYoTpeXAbG6pjARjAclR/w1o8Vz79Ywj757eGg6Eg+MyQjPk
 sg5GdSWX2qjTaxMaiUjXoXjG/ZHqp8Y5RbH+wGxA6wYgq4Y7/4D/QqG2tWSqVzSCrY4feS7/6s0
 JGAdBH5Yz6UslhhAmjf5WM99L7LfvmCzoXdTu3XZupZ2G+VXs8C4NxsYMjEdcDjJaabDo7P0xfd
 Zzl/UgcHiMIgvEiYrYJOX9LdVyplaOE4sHSKD4nfallEMxdDX+XeMIYEAtFMDjCbVk5X+j+Vz41
 X7BSz4YcnVUuenHs66nZRHYyIl3RH8oyAnoIeeHg2jK9gjV3PuxDzCQ5ADe6rgC8KSW/SI340vc
 AWWcgF7gyLrOQVjwJadnY1XIvwgrAkfOZMPD3HQ5mtlmbLawInYnA+Aq1p4tBv3NGyfahtAAu6N
 WampsCjGPsTGc0A==
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
	TAGGED_FROM(0.00)[bounces-102369-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DCAD43C45F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

Improves readability and makes splitting power on function in following
commit easier.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index ff884e04ad4c8..71d9b747ccfc5 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -518,22 +518,11 @@ static struct attribute *stmfts_sysfs_attrs[] = {
 };
 ATTRIBUTE_GROUPS(stmfts_sysfs);
 
-static int stmfts_power_on(struct stmfts_data *sdata)
+static int stmfts_read_system_info(struct stmfts_data *sdata)
 {
 	int err;
 	u8 reg[8];
 
-	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
-				    sdata->supplies);
-	if (err)
-		return err;
-
-	/*
-	 * The datasheet does not specify the power on time, but considering
-	 * that the reset time is < 10ms, I sleep 20ms to be sure
-	 */
-	msleep(20);
-
 	err = i2c_smbus_read_i2c_block_data(sdata->client, STMFTS_READ_INFO,
 					    sizeof(reg), reg);
 	if (err < 0)
@@ -547,6 +536,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	sdata->config_id = reg[4];
 	sdata->config_ver = reg[5];
 
+	return 0;
+}
+
+static int stmfts_power_on(struct stmfts_data *sdata)
+{
+	int err;
+
+	err = regulator_bulk_enable(ARRAY_SIZE(stmfts_supplies),
+				    sdata->supplies);
+	if (err)
+		return err;
+
+	/*
+	 * The datasheet does not specify the power on time, but considering
+	 * that the reset time is < 10ms, I sleep 20ms to be sure
+	 */
+	msleep(20);
+
+
+	err = stmfts_read_system_info(sdata);
+	if (err)
+		return err;
+
 	enable_irq(sdata->client->irq);
 
 	msleep(50);

-- 
2.53.0



