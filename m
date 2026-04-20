Return-Path: <linux-arm-msm+bounces-103778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKKHDtxQ5mkDuwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:14:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id AB31542F2E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 18:14:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DD9B433F7BAC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2026 14:28:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEC148C8B8;
	Mon, 20 Apr 2026 13:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sR1996mQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1F448C8B3;
	Mon, 20 Apr 2026 13:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691933; cv=none; b=I+VQGnty7e6ddyzZwjhQ5nmcToi04zkW3h4HUb8OqC68fnu/MhILmD4RzbM51FUJR7eKlvvViOvPaLvk0EoUYEYvKM8o96UxXbqV9IjfbZvlIUiHPQnRmNSq/JL+5tVoBHqs2pR0rKykkeTy1unto3KQWR0erPQnz9jUY1EEhH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691933; c=relaxed/simple;
	bh=hl+3sKaVvUQLfIWyIJ+fL1QTLwfKTv+jZdwjsBhBzFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mWf9YeQqQ/cT4eDsQaFlOK/vNejOguahJP5KEqHrWSshae6PWqSNiBBUk00RXd1C/ZPkb5Wg+vuXPiGFd0mDRl6U4eRd/4IulO7CtTgkaAbLk+j6nUFYVuSjRpmcfHqd3KCAdqMUFGry/TlW+n0DVlH5IMuAotR5o0cGbWIYOu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sR1996mQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71101C19425;
	Mon, 20 Apr 2026 13:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691932;
	bh=hl+3sKaVvUQLfIWyIJ+fL1QTLwfKTv+jZdwjsBhBzFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sR1996mQhuwL0PRr6fsQ0Vwn3UW0l2QBPbSuuiC2J1Bq4WMaZQa0kemAa2hnQ2RO3
	 kA7IY7p3cg24EMa+P4KGgMBNtu7HEWLxiDi7mpVJ+IPFYlOkgy4IumnaKsmwroDHSN
	 KbvrIcMl8h3eGvv4h55roS/mROPk1E6RTsEK6f2zViW1Hw1MQBd6uiso/Zi2klvCNZ
	 8gyjxHPPEjNEL+YVUYDpXf+3QntDOndmvI0FDwusTl8VzkdaAcsrgPrhAs9/7nM1C9
	 aBnjnvTRAOtwDZmXNCFhqF8vzFpdjL3IgghOt94ZtCpvoBu46hu833VkD8T3T6PWsn
	 2wSfrhvRj7QgQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Bjorn Andersson <andersson@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	konradybcio@kernel.org,
	quic_clew@quicinc.com,
	lumag@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18] soc: qcom: pd-mapper: Fix element length in servreg_loc_pfr_req_ei
Date: Mon, 20 Apr 2026 09:21:11 -0400
Message-ID: <20260420132314.1023554-277-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420132314.1023554-1-sashal@kernel.org>
References: <20260420132314.1023554-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18.23
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103778-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: AB31542F2E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

[ Upstream commit 641f6fda143b879da1515f821ee475073678cf2a ]

It looks element length declared in servreg_loc_pfr_req_ei for reason
not matching servreg_loc_pfr_req's reason field due which we could
observe decoding error on PD crash.

  qmi_decode_string_elem: String len 81 >= Max Len 65

Fix this by matching with servreg_loc_pfr_req's reason field.

Fixes: 1ebcde047c54 ("soc: qcom: add pd-mapper implementation")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Nikita Travkin <nikita@trvn.ru>
Link: https://lore.kernel.org/r/20260129152320.3658053-2-mukesh.ojha@oss.qualcomm.com
Signed-off-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Error: Failed to generate final synthesis

 drivers/soc/qcom/pdr_internal.h | 2 +-
 drivers/soc/qcom/qcom_pdr_msg.c | 2 +-
 include/linux/soc/qcom/pdr.h    | 1 +
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_internal.h b/drivers/soc/qcom/pdr_internal.h
index 039508c1bbf7d..047c0160b6178 100644
--- a/drivers/soc/qcom/pdr_internal.h
+++ b/drivers/soc/qcom/pdr_internal.h
@@ -84,7 +84,7 @@ struct servreg_set_ack_resp {
 
 struct servreg_loc_pfr_req {
 	char service[SERVREG_NAME_LENGTH + 1];
-	char reason[257];
+	char reason[SERVREG_PFR_LENGTH + 1];
 };
 
 struct servreg_loc_pfr_resp {
diff --git a/drivers/soc/qcom/qcom_pdr_msg.c b/drivers/soc/qcom/qcom_pdr_msg.c
index ca98932140d87..02022b11ecf05 100644
--- a/drivers/soc/qcom/qcom_pdr_msg.c
+++ b/drivers/soc/qcom/qcom_pdr_msg.c
@@ -325,7 +325,7 @@ const struct qmi_elem_info servreg_loc_pfr_req_ei[] = {
 	},
 	{
 		.data_type = QMI_STRING,
-		.elem_len = SERVREG_NAME_LENGTH + 1,
+		.elem_len = SERVREG_PFR_LENGTH + 1,
 		.elem_size = sizeof(char),
 		.array_type = VAR_LEN_ARRAY,
 		.tlv_type = 0x02,
diff --git a/include/linux/soc/qcom/pdr.h b/include/linux/soc/qcom/pdr.h
index 83a8ea612e69a..2b7691e47c2a9 100644
--- a/include/linux/soc/qcom/pdr.h
+++ b/include/linux/soc/qcom/pdr.h
@@ -5,6 +5,7 @@
 #include <linux/soc/qcom/qmi.h>
 
 #define SERVREG_NAME_LENGTH	64
+#define SERVREG_PFR_LENGTH	256
 
 struct pdr_service;
 struct pdr_handle;
-- 
2.53.0


