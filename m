Return-Path: <linux-arm-msm+bounces-113887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d/nnLivQNmquFAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113887-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:38:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E606A962C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 19:38:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=etehtsea.me header.s=sig1 header.b=syF1GRKq;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113887-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113887-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B6A42300EC9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Jun 2026 17:38:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C231932AABA;
	Sat, 20 Jun 2026 17:38:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.pv.icloud.com (pv-2003f-snip4-11.eps.apple.com [57.103.66.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5EE233922
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Jun 2026 17:38:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781977126; cv=none; b=gxq3vBhbYWJZNaIqkVXqNNldeeD+GNc7hVg8K8yI2fxi2NJb+2C9uNeG/ISBx8mfW6GE5XWrvXoP8ICypdKqdLkHsfrlVAJTrdAfjSCnGJZJm6Fb+ztpx8rvwYx0Q6xJTKNigL9rAhbxUia4a24bJjEf/MXYuYvnj21nKZfzCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781977126; c=relaxed/simple;
	bh=ZxPCt/ZTVxIgIwrD2Rm5SERLkd0YwGXMlCCzI8LJ/LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IoxsnBecqeKjcR/1HVIEyil734mZ7LItHw54oA6Cp0xPXcJaJZK6wSVI3dIh3c7HByOvA8JkT90ue2sTngbXNiKXFXjfnzDzgmku2RwKpjncuylU8KtdbEE3QrW7a4ci5ammlK6RakriPpV5LGFpFQr18U77ksbomAo75GbajFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etehtsea.me; spf=pass smtp.mailfrom=etehtsea.me; dkim=pass (2048-bit key) header.d=etehtsea.me header.i=@etehtsea.me header.b=syF1GRKq; arc=none smtp.client-ip=57.103.66.23
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPS id 8648F1800117;
	Sat, 20 Jun 2026 17:38:42 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQ5AHVwDWxxBAFYHXxcOVk1UGVoBdw5GFVEMQAhWRV8VGR5XUFIfVxhNC1YMGQZXUEsbDlUXA1ccVkVcGEMJXQVXHB0dQUVbE1UXRgkZCF0dGQhHHwowA0IOVgNDB0UALRkcV1BSH1cYTQtWDBkGV1BUEVdQC1kCQg9IBV8HWgVDAUsAQwZcBUIBVQJAWgpbHHkdRwhfH0EVWFZeCAlLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1; t=1781977124; x=1784569124; bh=ZxPCt/ZTVxIgIwrD2Rm5SERLkd0YwGXMlCCzI8LJ/LM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=syF1GRKqgxphthgSLelbLVQwFkQoygGxR6qDTcEHC+oR8CYKfFBFLz3qcvPYAq6hNrWYsmpQDLr95GLUieMpWhqDYfmpGXxZHTaLeCk5tudRl2JxSJGKoD3lTBvRCBXE+TrKOJxieG9AX/qVT4ZbNgZ0lAxGDhNpuxGtoh4BHrE1UBoxSxQCMnNNflNJhpi++5iohMwSG0kIt797xiQaisCppHkdBRxYFC3YIKKQp9YuG8YkwxWloVag+rkiZ9wV3RKhRAotDyBvlUTTeLSH+2Milr171+V/XlURGPMP8pkv4VhIldj51XPkKkDE0qX8X0iHxEYNi/mv6vEgRStohw==
mail-alias-created-date: 1634905887181
Received: from localhost (unknown [17.56.9.36])
	by p00-icloudmta-asmtp-us-west-1a-60-percent-7 (Postfix) with ESMTPSA id 3E1AA180019E;
	Sat, 20 Jun 2026 17:38:41 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: Add HONOR MagicBook Art 14 device tree
Date: Sun, 21 Jun 2026 00:38:33 +0700
Message-ID: <20260620173833.17728-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
References: <593b7024-e986-484d-8837-17f08990575e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 7k1HEHTzXKcAzsqdpCMgRzW_wfjDJWG6
X-Proofpoint-ORIG-GUID: 7k1HEHTzXKcAzsqdpCMgRzW_wfjDJWG6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE3OSBTYWx0ZWRfX3OavNogJFzjo
 Q/1UXYCszNlympM+qgL0hzz2SkOIbp4kwgL9MyNq6JVp13qxrJa/ffLLm9294sjv1f1tvqLTulA
 XTG9O4ubgWhXZsyqPoj+fYp/x/DOVhIc59VMre2pCdBW/wAcKP+AnBM273miYICODVubYJv+QJ8
 DUPhaLE6jeMoaJXfhSzsRq/mGQC/l8pMd54rpvqxJRBCwdMx7ZSTz1chVXBAwgFqKWlubOCajWK
 NX/PsSEP39mTpDfaxHL6pBM6UNlqoX1cyq+Mo+SL1jIVIQienjpjo6Y1VwnxwNQN9Avo2o3aZfm
 xD3aVJ8Z2UNXPlhwAgQ
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[etehtsea.me:s=sig1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[etehtsea.me:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113887-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DMARC_NA(0.00)[etehtsea.me];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mail@etehtsea.me,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22E606A962C

On Tue, 16 Jun 2026 14:37:13 +0200 Konrad Dybcio wrote:
> > +/* MP0 goes to the USB-A port(USB3) and FPC */
>
> "MP0" refers to the first USB3+USB2 port on the multiport controller.
> Is there a hub inbetween? Should we describe it? Do we know if VBUS on
> the USB-A port is controllable?

Unfortunately, I couldn't find any documentation for this laptop, and
all I can tell is that the USB-A port seems to work and the FPC is
recognized:

Bus 005 Device 002: ID 10a5:9924 FPC FPC L:2407 FW:3334147

