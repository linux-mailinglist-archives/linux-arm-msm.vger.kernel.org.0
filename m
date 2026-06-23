Return-Path: <linux-arm-msm+bounces-114143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hqaiEy1ZOmoB6wcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:00:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E9D6B6067
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 12:00:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=codethink.co.uk header.s=imap4-20230908 header.b=AzUwH0ZY;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114143-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114143-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=codethink.co.uk;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CF24B3022850
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Jun 2026 10:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E196436BCD7;
	Tue, 23 Jun 2026 10:00:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA44B36A37F;
	Tue, 23 Jun 2026 10:00:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782208809; cv=none; b=jmZ3Mb8dWFjONNwux/kT67FWbngWCQYg0d87D9/FHpnMQx5NSazMIWD/cqlk1+uevRRlHH9CAA8u1ELrVhhiFNcVNoWgRpVVuK3mNQhOX1VsTzx6GDMPA1B53bB3LHwVp6Vm1D6ll8wL0l8ynMd72B4yseChHjeBBpy6wLVdtls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782208809; c=relaxed/simple;
	bh=KjXfCBNkkmrvvbI3p/qmHanCDc/mMcNVJT66dGr92M4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jp8xHWn/3Kc9hMvENkn7XmQTx4GudF/VpqmGOIzhHFLitXYMt7qz+21/++mbknSvvJHzTBdjwAdInk0Fq0hpgHhKw1rZMaHiXzLVmQyawqGImvIBxZ1N2Dfi1XQG3DV6aC1zVERNliyWOTe5vR4RsNT6blaHWPmxI1iLY+TdPiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.com; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=AzUwH0ZY; arc=none smtp.client-ip=188.40.203.114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=xrzMZ838zznizuP/NjIMUQr6/Hnr4YbMXEaj1wp1UHI=; b=AzUwH0ZYG6tH/y
	eZFkb1+uux6zLE7cmZy1PWEgoK8g5I55KHcMa6dQTx/ZigrXpLhC4+RVYYZNQpDrRxb5ItmKehHk0
	n4MGVSZ4KS3TYaq/gyWJcxlYuVK/2CGzx35sPOJmoZ3MeXk8vu9QInWB9DmSFbbf5TE6fzDQiQA4p
	9MnY8hxXm6z2/XkuHoM8wBABEZ7iQtzSGwjIX3f02B7UnME+xmpcRS30q4AuA8E+LC/eyg+hz68CV
	QSjrMimClWdZk1QATTGUpEFXohZe5QEkLkZi7QKJvea2sjRNwk2OKnh3hzKZO6J6r8ciVkoh654vr
	vbmoLcaChFo4fSxHQGkA==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbxvF-00Fs45-Su; Tue, 23 Jun 2026 11:00:01 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbxvF-000000030pa-290J;
	Tue, 23 Jun 2026 11:00:01 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] usb: dwc3: qcom: make dwc3_qcom_glue_ops static
Date: Tue, 23 Jun 2026 11:00:00 +0100
Message-Id: <20260623100000.718126-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: srv_ts003@codethink.com
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[codethink.co.uk,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[codethink.co.uk:s=imap4-20230908];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114143-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:Thinh.Nguyen@synopsys.com,m:gregkh@linuxfoundation.org,m:linux-arm-msm@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ben.dooks@codethink.co.uk,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[codethink.co.uk:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ben.dooks@codethink.co.uk,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,codethink.co.uk:dkim,codethink.co.uk:email,codethink.co.uk:mid,codethink.co.uk:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 61E9D6B6067

The dwc3_qcom_glue_ops is not used outside of the file it is declared in
, so make it static to avoid the following warning:

drivers/usb/dwc3/dwc3-qcom.c:605:22: warning: symbol 'dwc3_qcom_glue_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index f43f73ac36ff..ac68b4218b56 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -602,7 +602,7 @@ static void dwc3_qcom_run_stop_notifier(struct dwc3 *dwc, bool is_on)
 	pm_runtime_mark_last_busy(qcom->dev);
 }
 
-struct dwc3_glue_ops dwc3_qcom_glue_ops = {
+static struct dwc3_glue_ops dwc3_qcom_glue_ops = {
 	.pre_set_role	= dwc3_qcom_set_role_notifier,
 	.pre_run_stop	= dwc3_qcom_run_stop_notifier,
 };
-- 
2.37.2.352.g3c44437643


