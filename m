Return-Path: <linux-arm-msm+bounces-97736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0GFoARcAt2mKLQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97736-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B086E29213A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A16DB3017522
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 18:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3BE37C0FD;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ONygmPcn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B68E37BE67;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773600773; cv=none; b=KqNek7gxl28taKVN0PQNq6okipBa213vcA2l2DtGemnBUvHp/vHALagFOnDtNToWxP+/KZAbJCmghUC2JxpDbDv5WOJ8zgHti20jle/WaQ7JwiKDOBFu/uGr8Nb6VxLd8gJv3JoM/A684WTHa65Vy98a1dhaaLKdOTycdGFptG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773600773; c=relaxed/simple;
	bh=gra4pj1Pq/mWhGDEdvUlRiEZduuSA9cXp8GcAdn9E3U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j0DWrAGHsGsI7YK2gFB945t0GZdkK/UzoteNEbw3xbkYq4dhdOXY++d2pNW3A6eeNfc/UjWlsNBDrW9jZL/LgHuO9nm2h0moEkUttikXN+ktwr8UYpPabvKtkPSikYi0wfhlSDMrpcjrBx9TKjAIJf+zBuqovuhPmTnYO56PkuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ONygmPcn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56A36C2BCB0;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773600773;
	bh=gra4pj1Pq/mWhGDEdvUlRiEZduuSA9cXp8GcAdn9E3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ONygmPcn+ER7Jye9kx8Xo6tcsuP9eVl4SGYJoaXbhaAo+QczxjzRqF8it7wNtcgmG
	 7Ij/qT6vHuW7TjuLmKKYhhClAOAuV6m0Mt1+sD3BeDlERqNHutNyFSNtJEolzPb2/u
	 QtpQlCXnFN3BWMHtyty76XBzXLI++VDbuM1O9d7ke5XlvdkroJRzTpZ4DKbPtnbt8g
	 J1N03axDDHWm24QDJ3ZSMWR9FbeM+buO2hFsWxTI7w8CGlGJc4UQknJBzyeC5DV5zj
	 rNRt4TEV7mSxz7x+nFBMDzQJclH5aFp2GHUs29lDnnDY4v+uMJvvhTKcW8HKCalFP/
	 d6X42eS0+c7Yw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D362F30281;
	Sun, 15 Mar 2026 18:52:53 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 19:52:42 +0100
Subject: [PATCH WIP v2 06/11] Input: stmfts - use client to make future
 code cleaner
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-stmfts5-v2-6-70bc83ee9591@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=999; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=NjXdWrTyZ4AOoAMN8FANgtl5sLWDEzgbOr47MG8j63A=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptv/5qkGhTYBwGm6+n5LMbiGmaXgdSYsz1eYSE
 Ggl5zzA+sqJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabb/+QAKCRBgAj/E00kg
 ci4wD/9H+6EPZMql8Si2W9hkziJlAifuPuI48m3hQ6EaoLCn1JV/ScaxW4RY95HrYgT28xyfwKl
 JUqdOBiTgQJQdSV2Dsc0FyMTr06BnXnMYTQaXZ+Q4ZGsfuerdylxbJ19YOLA/3JMjw1CfJdsHy7
 /mK8gdJDc3oPr+6kyde3hk5afi90oYN8LTNdDcf2ldPgGAKhnOfHOtbXfQzuU+reSNEe0M8qClf
 dXe4eRsyFdpZeoiZsBSRrYaSR7QkCc+lFWoUJNNjHbJIrxkDH5EU30XWIN8j4PYz576GAbE3aWc
 wJNq3ZheYbryH7Eq+riMQqPtyefk1ns/ERBv09JZOSYz0crh/9URS4rwy8dVoIQDLn4nHivzWFb
 +cKwYH3O48NlBfCY9M/KxUmAGMPPN5yAnQr5ze3MdcywvDhkwClk6tmm9NoeihwxlcnxK4MmwdB
 h61mx+2tFkpQy1rimaDTLFFTCWfiSGxAaxBHUeKAyNRIGaD/B+4Mjw9kDh76eRPcgdOrdpJShUI
 9DJPtL5wbAg4Ecux3t1yqYBsAtU0BshwV0lgKNBOCtpZ0OoQYnDATMj5tb3dt3h0+KH30rTChxG
 YbaAN/GXoD1VtHqI+wpMurzeVO9v2OGEeYVsjjArog1FM7WYvpZISJ44Ok1fng1PV2pT3hJ3aCb
 duIgAnQjAEzvirA==
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97736-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[david@ixit.cz]
X-Rspamd-Queue-Id: B086E29213A
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
index bf176907177d0..4dfaf3a6077d9 100644
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
2.53.0



