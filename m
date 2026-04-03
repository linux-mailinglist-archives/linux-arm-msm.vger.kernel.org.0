Return-Path: <linux-arm-msm+bounces-101705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFxBOtj0z2lT2AYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101705-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:11:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EEC396DBC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 19:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74357306B0BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18E883D47A7;
	Fri,  3 Apr 2026 17:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUdvSzmc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E209B3D4116;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775236118; cv=none; b=pyqEhrh+TwvvUYIF2mumj/LMxWqtznyO8HSmTflF4cNqYC+fzeE0l+WB5Gj3Vi5nT0Pb4arm+EAjSInmCfK8cAgSNm9FsfXr2XakAehorKKZbPhIHYVdamoG7r0EjelItDrCL8bh2GL1bvL0V9tTKb1CVpRAsRndd7qcw1Ver+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775236118; c=relaxed/simple;
	bh=rKnHwYgLNi3sMebAsDDIpMCpmbnS/3URMebyTSVFWZ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLgM+y1iZtJQlWe88QBDdhHTG6qbFNYP9lGzHlaxBS4d+oZHz86TatApWdG7wr/P7JtSoXVgbrsOBtVcMLf/7/bb4FBQ6EM/TXKGk5+2lJJYWYbbFfcBnrMDhQhSERX8UxSF+in/7/IwEC4mE3O1yrGip7+M1s856WM/Ae0TKaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUdvSzmc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7D35C4CEF7;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775236117;
	bh=rKnHwYgLNi3sMebAsDDIpMCpmbnS/3URMebyTSVFWZ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KUdvSzmc2KdFS/vapGWLhldul49tbG1X8VrpflhOl8CJ5l73H2d6q0oJRFbqRpxcP
	 JSq6LC83BMNyhPYeh6qL0bbw7EUjovIZ4xm6v6D4easReC21zNOJ48xuuoyVW3CWn+
	 sCNPMy5dV4j/lucnfZADBh8X98Lj2ALq5KG9mTwL0lPodqhI3OSRV5SeZjEhOCL+t2
	 qt/CYMHDsBv4xGmWMRxiHPp0aCg6515w24sGknLBu7A0MbT/vLdytWlGej0M7DOKrj
	 aoRW5sLcVaAigplIfs8CcaQQfNrwd4U5XLvndH+1qTlaOlwjqIbxeOrntV2lBFJgVK
	 PLVZ5SCO4mkDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A63C7E85387;
	Fri,  3 Apr 2026 17:08:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Fri, 03 Apr 2026 19:08:35 +0200
Subject: [PATCH WIP v3 06/11] Input: stmfts - use client to make future
 code cleaner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-stmfts5-v3-6-5da768cfd201@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=lbYMNOyikKvzSOq1O72SDp83zLBiEDw5AionEdJRDJQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpz/QQADNC8bWKbBtksX+13HyaXLaUKZUVfxXHk
 07gDDNOQnGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCac/0EAAKCRBgAj/E00kg
 cmJ+D/9IK24uy72rHSw+JqStVL356K7AGLtPpHDc95QFrDKE2f2kUT+x6P7o9SqSBP3I1N76QCD
 6yV7c32f1U/8vgx4zNLD4Z/3ncV94IaEAwfxLB5SiG2Hxe7NC4JQZAzTQCIBIfl3u8wlZFxqf1H
 uqfRt5Cu0hJDH1+51p/pvBrcIiAjdCd0zAKDO9tAk4HLkjTF9VJvgZF55DdNjWpZSeyv+ePxStR
 E4J1l7kvFvA2mOdFGhSQVlc5RGZjgHHRRIcPx5mUNk/nqqeTUBgNMGcnp9r/KTS/T0O4FqKkizw
 eLFz0q7mwyUfBhGKdC699DKtT4EwoLROVYBnzx2DvWjKfizwj4B8BRuR2/ULcVP0wh68zGBVg3c
 QtwgVIbgSKH0g9FKBVNDUxNT/WmTXzoPvuON8IhKMGOFAtBcuRJ3YyXrTvr/hMhKK5e10Gy6JJu
 VGzMtIsdysc4tjxbl2xGjR7XcxH/cJ4R/YdVoogMS1hBceSFnXYJJA/HpF+lVmeNvOJQeP2EAgY
 eGgxMZQG8fbvXLYwtDTbdUTlAExnFHsd1Ap/m9RochKmbCPILoxPmm9qcDE2o9BvwuPNJ8lbAhG
 da801WhDMPR1dUkdi8ANdK4IQHZxs+WDmQnBUfQ7G8s5hKPVI9gLbN0grqKm+agBqRZw8ZK+G7t
 KxJYscsQBkZfYKw==
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
	TAGGED_FROM(0.00)[bounces-101705-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonmail.com:email,ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 47EEC396DBC
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
index a90528b76f52b..5f7de5e687da2 100644
--- a/drivers/input/touchscreen/stmfts.c
+++ b/drivers/input/touchscreen/stmfts.c
@@ -763,9 +763,10 @@ static int stmfts_runtime_suspend(struct device *dev)
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



