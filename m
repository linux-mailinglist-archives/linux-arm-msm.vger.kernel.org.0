Return-Path: <linux-arm-msm+bounces-97734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJMBMiYAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97734-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 785AF292182
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 499C1303CA50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:52:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C94B37BE78;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pY1yDYvH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C6037B03E;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=mes0Nq3DzcKWKMHlZq8wXYm5Cz7fh34yxEWo8mwMU+07Xur3F/ttr2oqigiUmSYoBLcK6JzcXgljZ4hdV7NqzSWqntoeBoOB9T87KbC7LMCz/VeymIXCtFpL+Ax7/Tc1PKNMwksmcjZyuWZ75FeK523CHL+FAVMOX51FhZTn94w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=AHcrVyLFhsqV2czjvo1gRKaS1rJDhDM0kX8i4qEwEug=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aeZPbGTq/h6dVNj2ADmeN9AcIeiPhG3f0CPjb4yU2RvsUxwUvLu6gFpFTYUb1jwkII7FI4aV31Mlmdf8whgOcvkqgapo5LSC5DhaWsnmTTU9I1kCcpKIPpsUfij434lDTSkwqFRifzuYjiCldlyGZcwacY5dzp36YjuGja4C4bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pY1yDYvH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E80BC2BCC6;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=AHcrVyLFhsqV2czjvo1gRKaS1rJDhDM0kX8i4qEwEug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pY1yDYvH/Nd8aj5Hphd0fw9cRtkyRnX9JnlF72vB1FcZbTBCpo73X5piAUX57SntM
	 GeahEL5LevmG1m3Gx0jZ7J2SOnTod02uHQyWSE+c+QgrMEjiHZz+Ced2ZKpnWGIOXr
	 Cl1Z4QhpLR6LwIeBxgNOsdW/2xMh3rtZHMNZbn12LMe6+7CngkufVYusXKvSiwOMw9
	 Yn+1fvZSD4DgzZG2PO5POe4mLaTbOHUPbMEJzfyBbmVDidAZOTuDAtKFPYv9W/plc4
	 3nNXPZ0+cu6c6w/1sljXSPUmxfpswCpCe6jur6HRh810XPnm10Mvm7iRwhbHmUD+Y5
	 O4XBWytHzl4Ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C10F30280;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:40 +0100
Subject: [PATCH WIP v2 04/11] Input: stmfts - abstract reading information
 from the firmware
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-4-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=XFaZaPRkaLRohySBuoaYMFPtZGjmqJauWlqz/Xv2L/c=;
 b=owEBbAKT/ZANAwAIAWACP8TTSSByAcsmYgBptv/5kO5OknDi5IJov8Qfi+fjgPxHlqfISspUX
 9v9Jtcd20eJAjIEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 cklID/iclHlpBybWVTbVwtV9yu6KKK2NHsWvquiTMXw5Q2Bq3saKr8FtQtKP9L/2czJtn0NRkqN
 o+ewo546H4IC6GRCwDi/h7E78jmmSCEOZQ/TqJwtfHkiy7NlEQkh7PzGicEf0aWiFUWtZU7R5Qb
 heSr3eDWJ5lEmYkVWnKhPPW5qkgMFYAGflkF/AgAt2NW/teJZDBRPVCyejI61nm+9GNElmDU7kD
 npbdeNTOrE8bSa0ARIe5hNA8wWB8HQXOeHj7M1rrqxkpzQektIEnzAUzsChiRWeOt+8okL1nynJ
 t/q9051yzuuRApWOig8y1Vx1GGqXrbTCWYQdxcAvxT9C6nAJVuUjRtKSFNCni8utJDzdbGtDgmb
 NwmKCZ3gcInJWgypcE6Eq82HgJfyadW7zyDcRcoQtsGYJ7iySa64gAMPr7HnMHiqmspE7WsYMme
 OduxikMWh8kZkndd/2/XSEJnImGBacrGKNEj5UKBRziPeZ9jgQy0hgncm+iu9mCSQ92GydHM8JG
 MY90UJTp9MgyZSyIbqe5x9qmKtGm4Oi36bDD35ukl11KKbVcMzOh2ZXwIuk6nWBGwrtPBP2sti4
 5vl1kOqbOdbCsu3xG4zrh4CEDMqh0+L2+bwzg7rWQNBwpfaR6LQjKwR0HqhF1V0RLWhiF2T4pZi
 KKyZBG7ctPyMH
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
	TAGGED_FROM(0.00)[bounces-97734-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
X-Rspamd-Queue-Id: 785AF292182
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
index a9f240bac201e..c1c9570ddea2d 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -519,22 +519,11 @@ static struct attribute *stmfts_sysfs_attrs[] = {
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
@@ -548,6 +537,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
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



