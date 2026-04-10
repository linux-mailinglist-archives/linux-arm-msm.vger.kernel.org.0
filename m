Return-Path: <linux-arm-msm+bounces-102667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONj+LMfM2GktiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:11:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EBB3D5756
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:11:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4E31E3051CA7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDBC34D911;
	Fri, 10 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D05yVftP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495DB34B404;
	Fri, 10 Apr 2026 10:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815518; cv=none; b=HhTTe4K7QyaNY4Ik5VcVd8qtQz4sW4C7e+nzaaG8BlEtCNrVuCao6dE5z2hxtZ055qW5wNWdKMDuPkxjdOD2G0j5yfrKdnMolonRJx493XtyHWL8AA3aLR3V0o4ZnzQiaqEszH5s+Vsq9p0rtBmOXo+lFqsssxfatTVHjcu1D6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815518; c=relaxed/simple;
	bh=KXjCQtgL9FPsC0AEjCbdzeqBPffhMonn5hXCzFQFHYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ChFvZX1XCkm76yyxn/lmAfvmOArUlRx9Olir7u1/IAjsdxNltVZC/SYMuiPQAH7tfdnadIQuehQliQuGkd+nMemJK5CnyfXV2xW9EyDVv2lTRUj4upKYuQnKOO093rJRxC13I4RcQbdAem/LM1X9kGY7cFSERY7oSrgqA7NhVyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D05yVftP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6328CC19421;
	Fri, 10 Apr 2026 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775815518;
	bh=KXjCQtgL9FPsC0AEjCbdzeqBPffhMonn5hXCzFQFHYA=;
	h=From:Date:Subject:To:Cc:From;
	b=D05yVftPfr+6DeOWrGOqtG1v2NtWnpZ9t2NbYUdPV9atWfs+cd4ICXAFpujmRTLSx
	 DOoZvqOTnLKd6BqOOKriZXXW3cpF773Tu7d+mBWSCuKc2NTRKktuQLxzZkS7fh2Ek3
	 bOwfDOPtrZ+qdWh2o8HU6K97B9Wsb/ITDQruCoO6P3LNBQkwMeNclaJ81TUIjUUz8P
	 KZ8yh32m+/MPh2M9DRSIN2cmnXkW1kJIxOom0mNya3z4MizE85YqZu1yMRdWtpFJ6O
	 jW9gdR4p44vVGMiENgJEO36AVleHjegpjAArOmS4OVQ9cyJoYaItkoMUu2Mb4VEYPW
	 EkatqLn/cPXSw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Fri, 10 Apr 2026 12:05:13 +0200
Subject: [PATCH] soc: qcom: socinfo: Add PMICs that ship with Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-topic-glymur_pmics-v1-1-26bdbb577000@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avErBMcixZdJSLCRhtIE60opLsnL
 d/i/wyJIlOCvsoQ6eLEuy/AugK9zt6S4KUYlFSdbFGKYw+shd0ed8YpONZJtEoZmjU2BhFKGCI
 Zvv/pML7vB9EU5GtkAAAA
X-Change-ID: 20260410-topic-glymur_pmics-422feac13f11
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775815515; l=908;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=49D6kYWHBLxCLhk7t9uYujvqE349Y+vihd/4tDR6kY4=;
 b=2v1q3reib00wkMKmev/TV7lk1ynIdKHDNX3TgdWuQeMX5jthjoP2+MqMpK2cvYi1CSCtyLXKz
 bbVtu754LT7DwnOeL43ME7RNrAF/4a1CroVCJrrLFuMw5LTW/67iKZY
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102667-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 19EBB3D5756
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Add the missing REVID_PERPH_SUBTYPE<->name mappings for PMICs that ship
with Glymur.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8ffd903ebddb..c77460fb28ed 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -188,7 +188,13 @@ static const char *const pmic_models[] = {
 	[80] = "PM7550",
 	[82] = "PMC8380",
 	[83] = "SMB2360",
+	[88] = "PMC1020H",
 	[91] = "PMIV0108",
+	[92] = "PMK8850",
+	[93] = "PMH0101",
+	[96] = "PMH0104",
+	[97] = "PMH0110",
+	[98] = "PMCX0102",
 };
 
 struct socinfo_params {

---
base-commit: db7efce4ae23ad5e42f5f55428f529ff62b86fab
change-id: 20260410-topic-glymur_pmics-422feac13f11

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


