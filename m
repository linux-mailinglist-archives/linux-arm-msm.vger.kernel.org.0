Return-Path: <linux-arm-msm+bounces-117014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KUQQL68ATGrpeQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:23:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B5792714E8C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 21:23:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117014-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117014-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3C553018DA7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 19:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D0E13D7D87;
	Mon,  6 Jul 2026 19:22:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from MTA-15-3.privateemail.com (mta-15-3.privateemail.com [198.54.122.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978473D668F;
	Mon,  6 Jul 2026 19:22:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783365736; cv=none; b=DDzJCLPf68hkIbEwK6cO8r5n1lfzmEj+o0b7n23xLRGD7ZKH8brVi6CGnlLsNIBxC6WUJNdtBpaaU5ht8wzV+YrXPwLp3dY7k6RcpxVUXSLwQ66/SqfD3qiwgwjasfriE0z/wmg6zcIxgF4Zw+g0n/jZApuNJi1jgur1qNLTb7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783365736; c=relaxed/simple;
	bh=5nSxqCzGm/GZZBges3YFGnTjObWf+SZ290QFkpnWBaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmNibRvZnOsLW1oydzd50SqlHTRQ8F+/S8vJRgOtQBLkyPNHMk7fr7cuTnmurDhydPNQ4RvxeCpJopXuWMm4loehMSFFXtu4xuMfuC26h52SpATuIcoNA2gdTaEuGTtV1TzYjI2dzLJHEbPZySqzV/k9qO5xJvPf4tGNHPz2+74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=catcrafts.net; spf=pass smtp.mailfrom=catcrafts.net; arc=none smtp.client-ip=198.54.122.111
Received: from mail.privateemail.com (K8S-PROD-WORKER-01 [87.215.145.39])
	by mta-15.privateemail.com (Postfix) with ESMTPA id 4gvDkY5k9Gz3hhT6;
	Mon,  6 Jul 2026 15:21:57 -0400 (EDT)
From: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Srinivas Kandagatla <srini@kernel.org>
Cc: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Luca Weiss <luca.weiss@fairphone.com>,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] soundwire: qcom: add SCP address paging support
Date: Mon,  6 Jul 2026 21:21:50 +0200
Message-ID: <20260706192150.143921-1-jorijnvdgraaf@catcrafts.net>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:yung-chuan.liao@linux.intel.com,m:srini@kernel.org,m:jorijnvdgraaf@catcrafts.net,m:pierre-louis.bossart@linux.dev,m:luca.weiss@fairphone.com,m:mohammad.rafi.shaik@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[catcrafts.net];
	RCVD_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-117014-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jorijnvdgraaf@catcrafts.net,linux-arm-msm@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[catcrafts.net:from_mime,catcrafts.net:email,catcrafts.net:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B5792714E8C

The Qualcomm controller driver ignores the paging fields of struct
sdw_msg. For a paged access (register address >= 0x8000 on a
paging-capable peripheral, e.g. the SDCA control space at
0x40000000+) the core sets BIT(15) in the wire address and splits the
upper bits into addr_page1/addr_page2, but since the controller never
programmed the SCP_AddrPage registers the peripheral resolved every
such command against their reset value: reads and writes were
silently redirected to addr[14:0] in page 0.

Write the two SCP_AddrPage registers through the command FIFO before
the transfer, as cadence_master.c (cdns_program_scp_addr) and
amd_manager.c (amd_program_scp_addr) do. Like those controllers the
pages are programmed on every paged message rather than cached per
device; a cache can be a follow-up if the two extra FIFO commands
ever matter.

No peripheral on a Qualcomm bus sets prop.paging_support in mainline
today; the first user is the WCD9378 codec, whose driver is being
upstreamed separately - its entire register map, the
wcd937x-compatible analog core included, lives in the SDCA address
space.

Verified on the Fairphone 6 (SM7635): WCD9378 SDCA registers read
back their documented reset defaults and audio capture through the
codec works end-to-end; without this change every paged access landed
in page 0.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>
---
 drivers/soundwire/qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/soundwire/qcom.c b/drivers/soundwire/qcom.c
index 603f228f46b5..3562802f4204 100644
--- a/drivers/soundwire/qcom.c
+++ b/drivers/soundwire/qcom.c
@@ -975,6 +975,20 @@ static enum sdw_command_response qcom_swrm_xfer_msg(struct sdw_bus *bus,
 	struct qcom_swrm_ctrl *ctrl = to_qcom_sdw(bus);
 	int ret, i, len;
 
+	if (msg->page) {
+		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page1,
+						msg->dev_num,
+						SDW_SCP_ADDRPAGE1);
+		if (ret)
+			return ret;
+
+		ret = qcom_swrm_cmd_fifo_wr_cmd(ctrl, msg->addr_page2,
+						msg->dev_num,
+						SDW_SCP_ADDRPAGE2);
+		if (ret)
+			return ret;
+	}
+
 	if (msg->flags == SDW_MSG_FLAG_READ) {
 		for (i = 0; i < msg->len;) {
 			len = min(msg->len - i, QCOM_SWRM_MAX_RD_LEN);
-- 
2.55.0


