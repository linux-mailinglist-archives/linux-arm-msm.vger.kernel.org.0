Return-Path: <linux-arm-msm+bounces-101703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPqiKpv0z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101703-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:10:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B3B396D9E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 537303057EB9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67F43D3D03;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9r1H7+C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14963D34BE;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236117; cv=none; b=OzVH8IHlwH5v2mStEf5wqgeJanzKneXtF6/Uwo1offSIpsPMT4QKx8mil2K8Dq2/3IooWRfR/vxkPwngUoRbHB2NLytrU9/rmgF+qeA77XG6cqA1MzkEJ3DeDpeuOgvfSYWISumahkdPsUAkIVA47EpN6mVBeiveG1SP8hXqG8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236117; c=relaxed/simple;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kP7JLrLEp94FdKhWaMpOFpj2pHh4Z4Ts7t5sPdboXjLLaqoTCSFwL7nSwpe10/UAVPS0g723fsZhvouns5HyBD5xlCFhoAGiBiSd1BKL2ieSn5QG+EXhn/4WPLVvBmr9hUwZat6o0SVCope4rK3u27/11zyvErFz5DpMzTuuCmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9r1H7+C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 761A8C19421;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=3YxUzY2Fah3UfJvijShkLXUQPt/K+SOukUffoWVie/8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=i9r1H7+CaM1hDNBecApzx7e/wR0FTmx6yf98FKydwxv80CbKQYRmRxWCSDSdheTij
	 OgVVgjZ94Zev12EC/eca/aD8MK8sgX+gjD+mehYT9Jw4JjuX7KGRXHx5vmF7BuTXE4
	 xZsXPZ/DHz8eUFjphpRktwr5bTdZGYXJvJeMESn8K3SONLKlhblTGmIs9lCPueoPn2
	 hQhF8vrXdNweiqVjYBfhzrqXF+506WZ2F9DG+IU7JwEULSVlGqkTRMUycmmi42RwQF
	 OH6L8o2Wjhl6Tg2kVKbC7RW0exLoSLZBJ+DpyUuj+1oDqAHnZnWaAX7KXjjE44xuPk
	 Ttl7eDd1JHW7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 675C2E85386;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:33 +0200
Subject: [PATCH WIP v3 04/11] Input: stmfts - abstract reading information
 from the firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-4-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=MRRMNTeMVS8qh5Y3wcBKjF6ySEKPpTml4To4kFWgqxE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QP8lvBsnSoeLNS3kLwHE+ukHByluvgg4CGH
 EA7ol5HaTKJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0DwAKCRBgAj/E00kg
 cjEPEACEeES+cw8KrgQ/FkfT1rtg5xVKw3K0g/1FQOBWO8wkru/JjO+YXcrkgneK1vfWuwF87zc
 Jx5q093Hyvr+oAqzHxo9tajfJt1ttI7IZ9NQPh9tPq/eWS9sumDxgE0riV//WpGhTjKvlrqKRej
 nlk41+OHeaR52WwJYXmlOYg2j/SJbr06YNs/U1K7HPmq1nZ/BJH9cpWCGQIUfPB4bDdr/R4oeI+
 frr1ZOhxVGQTkovkACicfhJ4zPVlSs7Yd3k8GzP8X1iC8/ZfnMudVWylSHoWjvBLmKZKgs8XIFT
 wAXxXDGxclf8alyObmGkAP/zSSumROCFcYd+STcIiybrI5IVuzTixaxpjBlHVJwQEilg9hGoF4r
 p0YrvNvu4QWpgQfGbDJvyBRBi10WIV8APkI/UhGLBg46NIHoC5WVxFNBrkUlqHhMvIj4YkYt5nc
 R6ZBL98/LraxqN3FhJc7KEFRj9P2xyLT0E7sxu5a/NKPdWLfOQ4jN1GHevzje8uBFC9uiku4Xbg
 r3MEWm03+AuzWJNim0h4suzJpMy+2M+P6bFH107s1yitNrI8YTgp2r1Vgi9IL5rB1NLHoj3VspC
 8PVo5OIrYihhKZflTWtCXCTHWCVO9zWCH/LWamEGjFxcIpKAYES2ztxzeBID1Ye7W2DQfGkBGTP
 X31kyDI8n5jo+4A==
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101703-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 05B3B396D9E
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



