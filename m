Return-Path: <linux-arm-msm+bounces-112571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HGVODUkUKmqQiQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:50:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DFF66DB2B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 03:50:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=YdKUn2DX;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112571-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112571-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 57C07301B1C9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 01:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4819F2C326D;
	Thu, 11 Jun 2026 01:47:59 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFBB2C15B0;
	Thu, 11 Jun 2026 01:47:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142479; cv=none; b=XWJzgf1SdVi3tinRCa6pKU8fh7PqTeACS4ea55SDGAzfIDBYlKDbSIOXBtTDm0K/0PxK1cbiwvVjqLH0s68d3tLo+QFySQ3M28QO7ey42a5XJmqX00DTfcQ36yzTDHUi9+G9X1hNDcQ6tKLdncby03CkHy5Xi4bDXFwS6oe0Sdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142479; c=relaxed/simple;
	bh=dzBk7prgTeHurgs0Yq8Z9Rgbj3Uhnq1b24s1GJ/YfS8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ooOhcZEiBqkS1jO3Q886XNCs3ARf3VLspWdfVhg5YFOKOXhOZBscd/5CMLL42nh/HypjJCtomngTbeTDL8zfnyAr/nGFJ4SikO5nLCfZE/BQI1d47AWKx4H2iHAizs64S8IvKKUmZTlfwRFXEyJYJwnpvj/lkFqbR+kqTVyGDjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YdKUn2DX; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80B981F00899;
	Thu, 11 Jun 2026 01:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781142478;
	bh=un34XBgT0G3YiBTAlZ+qrAEFJFzAbCGVvZ1t/TnRfVc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YdKUn2DX4sZeGjPjKUlrmOpTlWrvQgnA5V4ts5thBZrZTyHjx1UV5LJS/e09cmIco
	 NeVCLEetr4HxKRclBJ5yLIBbLz3UghOoeYk/14Z0aZ1PKlHi1l8RnkjgxxQVOa40CX
	 fFVIwOiayJ3X+kbpTMGKAt313FaAIp9U14NAPcLkPxRkQTuhUIZY1O5k5dmRkXLrjq
	 R98MyTPQz1HzJheTxpgXZUuvbDLhMDsoVSUzlxN+b28ODG6LRxYdszPrunPdiRAiXM
	 PLidYtypey3yBYFs//myJprgxVTsLLzKuPBVphr1R3RhIjfgJwnuklRAJVVVnrCVEW
	 pWccQQ0xKuyaA==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-remoteproc@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Andy Gross <agross@codeaurora.org>,
	Ohad Ben-Cohen <ohad@wizery.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH RFT v2] hwspinlock: qcom: avoid uninitialized struct members
Date: Wed, 10 Jun 2026 20:47:47 -0500
Message-ID: <178114245720.590736.6389542077403038558.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
References: <20260512091339.31085-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112571-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-remoteproc@vger.kernel.org,m:wsa+renesas@sang-engineering.com,m:baolin.wang@linux.alibaba.com,m:jeff.hugo@oss.qualcomm.com,m:agross@codeaurora.org,m:ohad@wizery.com,m:linux-arm-msm@vger.kernel.org,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm,renesas];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 78DFF66DB2B


On Tue, 12 May 2026 11:13:03 +0200, Wolfram Sang wrote:
> The reg_field is allocated on stack, so using the REG_FIELD macro will
> ensure that unused members do not have uninitialized values.
> 
> 

Applied, thanks!

[1/1] hwspinlock: qcom: avoid uninitialized struct members
      commit: 8752c396ce3b2136b3d4c906fe103f6efb6782d9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

