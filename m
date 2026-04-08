Return-Path: <linux-arm-msm+bounces-102368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDmRB8jT1mktJAgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102368-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5EF3C4607
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 00:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 892FC305E334
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 22:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD4D3A4F20;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANjq9x/u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBE3A254E;
	Wed,  8 Apr 2026 22:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686551; cv=none; b=kOTarVN8vjFvI0zZUwCHGVb+xL0Hu+2nnPH8aUb0FFzB481zGLvWlMePKHUDwb0JrAjVSzMl0trS6asW6FsH++c5nNbqV3Mdn7PUKOeHbSv1HmJTPNDmLecaP0q4au4tQK1EVMj03zIOJI0fe7R12k2jlzYSpdZqVxOHDTxEE1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686551; c=relaxed/simple;
	bh=bqHJlgvFMDOO/lnNU/fWghkOHQbJPVEBKj2oKZvCSNA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsK6qvBfuYJQrqumSgSIzA3LrvYjK3VDdABkzFQ4dnqS9mLi5b2aerQI+g0jfP10sm0XFMYQQ51OP8F088X30QzlsHMJa1X6msbbWTfBjO+QX0IZN1XjJ7LeL4x2P+WrdU/5Q6lYfVkeoayIgxD5/Nplwfoh9cE0qg3mcY+J1a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANjq9x/u; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDA38C2BCC6;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775686550;
	bh=bqHJlgvFMDOO/lnNU/fWghkOHQbJPVEBKj2oKZvCSNA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ANjq9x/uvYB8wOkN1F5FOWVCAzVzYlW8w3sY4HH8Gxg3xXBY2br3EbI1cgMDhLRwZ
	 t4oOXJFdrFN8uHtods2lCUE7X5+TJZizqdUUv1PJn4869YNjqCNoyaafC2c3Ej0ygh
	 nm4LJeuzA9loKSltfg4BNfs6fMxWctY8dTOM6ij/xerOmzCY/gw2vugr+MWaOvg6lH
	 ydrHyuTV90ekDGuwukxenYAgjXzPvWmFsl2qn2rqMAJlWkaavaghzetOEENVp2u6u9
	 Yy8hL2uxm+NDKuBeg6OfsAzq4qzaiLDE/2uemNlLgGGb2Ax9HsMzRVL+Zc/yS5S210
	 voGsDZ9JclZLg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D570A10FC45A;
	Wed,  8 Apr 2026 22:15:50 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 09 Apr 2026 00:15:48 +0200
Subject: [PATCH v4 05/11] Input: stmfts - disable regulators when power on
 fails
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-stmfts5-v4-5-64fe62027db5@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1834; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=otDxlvvUy+vHqWnlpecsigv9uo2JKsE9RKwSL0jKxqM=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp1tOSqxbb22SJazyTsOITYMHjjDrzpzJN7VpNu
 4ltZ1OQGniJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadbTkgAKCRBgAj/E00kg
 cmzrD/4tZ0pmiTNrRcm3Y2eAc1o7V/ba3zu0DiVu8JqUrJ1yR3ITurB98GgXril/pT5MbPi9Z/C
 29ddmYiNjNewyip5qQD7oGYtlKx9peclhWk37mV1OsbrGScrmFPMbayNpwtXJY827ep2dfVZIlK
 8I4GyUUgZyTP8IDJ2g7oeudDLZVXV8vSMX5s4+6qMHecpp3/U3Kj49/LL88Xc9CvNc1aPzY87lZ
 Xm3hwBHlvRj7sEhxUv4sTgQWT/8YohJkA+srZfOJlAxhK1SBVlKATd1X100W3cNHaoakVtxDivh
 l/uTAX1FW5BxVxdzXhgWvbrqvwpGeGZUmlti/gbjpmL+ysz3ANWaW8gUNEFVYHbMS6jOzzj3d9S
 KQQbLDAREvM/D7c6XoA29y7dCjNjoYyyMPubUi9RgBhSX3DRKGtMif5WyUhl2h+3kSC6hSEIkn5
 Uqgk45GsgTtEdB2syjwbLPkaYGY/LXw9wsc5ONduLLTd2q3m52FThLf0LyxdK+7tNsz9qYKsLEc
 pZtK9QG+DfIJaFnY2GtewcKK+6TyZ+/ySIVMmxQo3O0vpafq1OYLi75OkEEJQ4lTlqOJ7jUqG2X
 bleIhh88KpQVs2DBplB5bMLJWyitMYGasnl7c0NY/mvy/mDIdiMQC/En//3ubLhHTxW2ppuEtm0
 ePllMuTArMZK1xw==
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
	TAGGED_FROM(0.00)[bounces-102368-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BB5EF3C4607
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: David Heidelberg <david@ixit.cz>

We must power off regulators after failing at power on phase.
Create stmfts_configure function, so we don't have to use goto.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/input/touchscreen/stmfts.c | 37 ++++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/input/touchscreen/stmfts.c b/drivers/input/touchscreen/stmfts.c
index 71d9b747ccfc5..290511dd69437 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -539,22 +539,10 @@ static int stmfts_read_system_info(struct stmfts_data *sdata)
 	return 0;
 }
 
-static int stmfts_power_on(struct stmfts_data *sdata)
+static int stmfts_configure(struct stmfts_data *sdata)
 {
 	int err;
 
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
-
 	err = stmfts_read_system_info(sdata);
 	if (err)
 		return err;
@@ -596,6 +584,29 @@ static int stmfts_power_on(struct stmfts_data *sdata)
 	return 0;
 }
 
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
+	err = stmfts_configure(sdata);
+	if (err)
+		regulator_bulk_disable(ARRAY_SIZE(stmfts_supplies),
+				       sdata->supplies);
+
+	return err;
+}
+
 static void stmfts_power_off(void *data)
 {
 	struct stmfts_data *sdata = data;

-- 
2.53.0



