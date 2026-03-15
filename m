Return-Path: <linux-arm-msm+bounces-97742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +MWZOScLt2mnLwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 20:40:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7032923D4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 20:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89A8A300C302
	for <lists+linux-arm-msm@lfdr.de>; Sun, 15 Mar 2026 19:40:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92911379EEA;
	Sun, 15 Mar 2026 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="svMSw9i7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D471192D97;
	Sun, 15 Mar 2026 19:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773603618; cv=none; b=SrRuIIfS36/dj2KJPruTui077NvJ/ek9QeCX/wBzyaupP+i79cFrcdHnVmL89/BZIFqPm4/o6A0aMaO0dcp+Y1tUaQgwAFSC5khRK4IT/cp+q979uv3l/3xutBSsfWbLyS02TzJHEyRimRgND8z5TYuAxIZoh0SnaGoiOWoVm7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773603618; c=relaxed/simple;
	bh=fesAHPKNbUs9hVBXGq+5vFg6Af/I3x1FzOPH/+s5Nh8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=k/A0cK1nN/UuHt7ZJnSpvIoj/iJULmHmhvO4wfTb3oA/N0ztFi087TDhDBAlvsg1UGCvcfjw9c1s9ji6ybR+3hgnYz92DRsSfKQE9mG4Ke+vbCvwO5S+kxm9CUUNRwvRGuF0sHpaGfg5o8Ua6gsWrVKQs2jN0WbqX+iIZC+AtoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=svMSw9i7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13477C4CEF7;
	Sun, 15 Mar 2026 19:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773603618;
	bh=fesAHPKNbUs9hVBXGq+5vFg6Af/I3x1FzOPH/+s5Nh8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=svMSw9i7qXnati9XP9eIfXCZBkyysXiqlc2aSS0oWQW+dea6yENARFfqa3jwjCq59
	 41stdRjDrQJm/pL90PLqSd/7wOBWpEOqIldK58YAus2mZPfEfFT0xw+CPUtg3BBkSb
	 XHpuYyWOs0eZKJ5zmmvGHmqLMZ5QFKWEcrn8QG/ApRZfzfiHELh38kaXKYT+TTPRPL
	 cweIQbUSMJUktt5oaQXcNQ4bgPghgeVya0ZdMJBmlQ1bI9gs8HMfNLsLHzyDE4hs3y
	 FKnKVdNrzVA/xQ0W5+oEPKWmROdihEiaGTLu38pR4+5hQVFz62apZm4aSQDx6zTvw2
	 OWFraqqG+d7kg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C35FF30282;
	Sun, 15 Mar 2026 19:40:18 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 15 Mar 2026 20:40:16 +0100
Subject: [PATCH] power: supply: qcom_smbx: allow disabling charging
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260315-smb2-cherry-pick-v1-1-b2710e470490@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAB8Lt2kC/x3MSQqAMAxA0atI1gZqHBZeRVzYNtogDqQgivTuF
 pdv8f8LkVU4Ql+8oHxJlGPPqMoCXJj2hVF8NpChztRVi3GzhC6w6oOnuBUb65i8p9lbhpydyrP
 c/3IYU/oAQZYYgmIAAAA=
X-Change-ID: 20260315-smb2-cherry-pick-4bce2dd2fdbe
To: Casey Connolly <casey.connolly@linaro.org>, 
 Sebastian Reichel <sre@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1907; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4AjGJKwbJXe+JB86/acJqUuqP6FV9Wr+oAVrVaq0fiI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBptwshPIdiXezEZzCVg9hmuCN0irJHRc9S1JKO8
 J7d6Gt30iWJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCabcLIQAKCRBgAj/E00kg
 cj0OD/wNTfuFuEMJsk5ORkTHCYwFuvW/caJm+clwHiwTJyjDjmOFg31ilRGxWEil0ZymBh9WiC2
 S1t0ydvEC9JVrHIrXC5CsJCuugFxuRDGmPlWagNhYQgHtkz65H9jFgbtCQLkc7OpN8bBcAzGn1+
 +tFiNt7MbutiIn1ZZ/WeZCm4U3k+Jbo2tvYHLZqjBsrBRJNh4mbYKK0l99r/29lQOvX7lpoGtTh
 kgW5KDEWIl0FCqodmmTI6ELsLPekaDZX+mZuFlqYkturHE3C2L6xfktdHRdN+0WbDDr4ylYA49U
 gCXHEygE6VNwPn2bsZtEJD8+/1+RUDXEjts3HGz+W2Jcr+TKHeOhI935PKZYpV70gCJpw13S7K3
 NnVlQoqpJR0lTKdNtHwDP0g9YqrOItx6mZTzL95DatWTsj+8IF1Qvc5151XNcjhvImxUjBm/6Kz
 boxeSXnVIFoT3/RinblE3YgqcYFV7E+9OwKGIdLU4Em8oc6fnEJ0EgcPxgUVizK9pxDBXQHOlRt
 7+EKR6Pvq7R0dBIrjP6Mmr2tIsdCydkbU+aAPI/kgZIYouzftHI+s+yykxqRuV2727IcosT7zl8
 bOk99aY7D8ml21Mxm4q4CbmJOpKBtglkLvCcExsTP78bL41b+mj1J3rWirAKeNxaeJZsexi3nJB
 6cKB3OZJohwWO4A==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97742-lists,linux-arm-msm=lfdr.de,david.ixit.cz];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[8];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:email,ixit.cz:replyto,ixit.cz:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 7F7032923D4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Casey Connolly <casey.connolly@linaro.org>

Hook up USBIN_CMD_IL so that writing "0" to the status register will
disable charging, this is useful to let users limit charging
automatically.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
[David]
 - adapted from:
 https://lore.kernel.org/all/20250619-smb2-smb5-support-v1-5-ac5dec51b6e1@linaro.org/
 - moved USBIN defines into the right place inside this patch
---
 drivers/power/supply/qcom_smbx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/power/supply/qcom_smbx.c b/drivers/power/supply/qcom_smbx.c
index b1cb925581ec6..bf2e2ccc454a6 100644
--- a/drivers/power/supply/qcom_smbx.c
+++ b/drivers/power/supply/qcom_smbx.c
@@ -134,6 +134,9 @@
 #define OCP_CHARGER_BIT					BIT(1)
 #define SDP_CHARGER_BIT					BIT(0)
 
+#define USBIN_CMD_IL					0x340
+#define USBIN_SUSPEND_BIT				BIT(0)
+
 #define TYPE_C_STATUS_1					0x30B
 #define UFP_TYPEC_MASK					GENMASK(7, 5)
 #define UFP_TYPEC_RDSTD_BIT				BIT(7)
@@ -693,6 +696,9 @@ static int smb_set_property(struct power_supply *psy,
 	struct smb_chip *chip = power_supply_get_drvdata(psy);
 
 	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
+		return regmap_update_bits(chip->regmap, chip->base + USBIN_CMD_IL,
+					  USBIN_SUSPEND_BIT, !val->intval);
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
 		return smb_set_current_limit(chip, val->intval);
 	default:
@@ -705,6 +711,7 @@ static int smb_property_is_writable(struct power_supply *psy,
 				     enum power_supply_property psp)
 {
 	switch (psp) {
+	case POWER_SUPPLY_PROP_STATUS:
 	case POWER_SUPPLY_PROP_CURRENT_MAX:
 		return 1;
 	default:

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260315-smb2-cherry-pick-4bce2dd2fdbe

Best regards,
-- 
David Heidelberg <david@ixit.cz>



