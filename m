Return-Path: <linux-arm-msm+bounces-106735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id LyqRGRw+/mmHoQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106735-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:48:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A783C4FB3FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 21:48:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56E363014C31
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 19:48:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86BB9357A25;
	Fri,  8 May 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jackmatthe.ws header.i=@jackmatthe.ws header.b="eNcsieeA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from outbound.st.icloud.com (p-east2-cluster4-host12-snip4-4.eps.apple.com [57.103.78.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D822D351C06
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 19:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.78.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269712; cv=none; b=awzHplA58qkByiBV6642gP5bJqflY9qxJEklaI6OsPXoeu1bwjRjl0WwG8YTXdqQ5g5r/WpHNhE1/jkgekJcuq1fI0XFEnqV7kd+LpZ4vcdevce4S+FC17DaUjoa37y6GYTh/RYLSUpDTCTHizhTk/WY9+DYnMfuBGyoVnZ5g3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269712; c=relaxed/simple;
	bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=mQSQbLS0uGmQnWWToCgYQeYmtsX373bQjUrNDQTeRv/2ijuk/+Vj3W/5dZiYmjL6OPCSNbFYNRhSnhx26YFRtJ8sO20sJ+MnS/OFqjJPtbK2Ye0iMidSGLUJYzb7m3PGQLzVfDX+9QrVJYbsB5WTBUmuf76AVNQ2uQWDhAwpyxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jackmatthe.ws; spf=pass smtp.mailfrom=jackmatthe.ws; dkim=pass (2048-bit key) header.d=jackmatthe.ws header.i=@jackmatthe.ws header.b=eNcsieeA; arc=none smtp.client-ip=57.103.78.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jackmatthe.ws
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jackmatthe.ws
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPS id DFA9E180033E;
	Fri, 08 May 2026 19:48:26 +0000 (UTC)
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQBOHV8DWRxBAEkdXAJZEhVdRVkMVAByGlgbWABWH0YYXFZEHhcNVk1TGVAGdwFTE1IVUhlDA1deTgsTH1RWBFBRHV8CCgRHBFsXRgNTRUEEFxFQAVgeVl5aF15NRx9ATWJJAVoZWxxAF0puTVMPDxpYG1gAVh9GGFxWRB4XBlsUBEQHW3ZZAjYBQR4oBVsKXQ1IClwaU3BGfFVxWHRYCjJ/QAEvA1lyGlgbWABWH0YYXFZEHglLRglJHQ4OQhhGH1QnVwJaClse
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jackmatthe.ws; s=sig1; t=1778269710; x=1780861710; bh=FBvpAEZMyf6KAW0FZ8+arbkw6G0iVCl9h8X++Dsym24=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=eNcsieeABmpQUM8GgihjGZDprv7OCoAnJpW5sYYv6KLHZFzh11g7NO94mycfS5v0ycTEz5Za8Paeirq4uAKPAylYZyTw+aEZNse+7GFQapqJxUYOdNz0ZelpT0OyzCaXlOStK5lXUOyU1vqK7+UQTpkG84KIu+HazAwOWfTXNs4XDBi+I/oV7R3lXRp43cjfwpx2MrgRd9YDsBGj2parM7u9swiKhGEa8VEnLaEXQiDC+fc47m5shmZNS3XvhgHhDm5k/WQ+hf56qUhnVaoKFYt+jwjDn7lQYVAb5gVeoPxAn6wtzXZm5ejXtfOErZ6c+pASIU4HneJan2NPjEig1A==
mail-alias-created-date: 1756088113082
Received: from smtpclient.apple (unknown [17.42.251.67])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-1 (Postfix) with ESMTPSA id 96F5218006D5;
	Fri, 08 May 2026 19:48:25 +0000 (UTC)
From: Jack Matthews <jack@jackmatthe.ws>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Regression in split ARM MMIO timer driver
Message-Id: <46A20F89-E208-4091-8B6E-B5C38BF82B42@jackmatthe.ws>
Date: Fri, 8 May 2026 15:48:14 -0400
Cc: linux-arm-kernel@lists.infradead.org,
 regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
To: Marc Zyngier <maz@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDE5NiBTYWx0ZWRfX1cSdufuGzJGk
 MsMfGVzylnzT3W9mXQO0C6c+96va1ZMnU3x50t2Ps4UGj+2ueM8fjwcz19LEkKbdR/Co0Lsk2zU
 zR8ye8kDHbB6zaGKj7yrBoPQYCNJ+LsQ010z6FlpFGhLJ31G7pkZj+/eD/iXH4M8WO9M8GvBYHS
 uT4QgSanR8H+Sd1FCYOaLugIirNtWWgUrXckpnoYX/Okh4ozZK2ivU3m/QWvyP9OwUUwBpPUcj6
 eyo+fofExIQ45itVYBVy6JRcb7S61DRtD50296kg7zPdA6oz845nOR6F1N9bqHPzmjGg4c94Lry
 3S9NC9hR6Wj+KuPkB5y/WAmKMZVQYjqMO0vyzZKc0VtGWEv6L1d4VtimnAjI68=
X-Proofpoint-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB
X-Authority-Info-Out: v=2.4 cv=LKNrgZW9 c=1 sm=1 tr=0 ts=69fe3e0b
 cx=c_apl:c_pps:t_out a=YrL12D//S6tul8v/L+6tKg==:117
 a=YrL12D//S6tul8v/L+6tKg==:17 a=kj9zAlcOel0A:10 a=MKtGQD3n3ToA:10
 a=1oJP67jkp3AA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=NEAV23lmAAAA:8 a=KQRe4iotet5z0gzynocA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: MGjV3gISKmJDCMzW_07TH-QR8qCxeuOB
X-Rspamd-Queue-Id: A783C4FB3FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[jackmatthe.ws:s=sig1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[jackmatthe.ws:+];
	TAGGED_FROM(0.00)[bounces-106735-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[jackmatthe.ws];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jack@jackmatthe.ws,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Action: no action

Hello,

I am working on mainlining an old chip, Qualcomm's MDM9625 modem.=20
I had previously booted 6.17-rc3 before putting this project to the =
side, but when I restarted work on 7.0 I was unable to boot.=20
I have bisected this to commit 0f67b56d84b4c49adfd61f19f81f84ec613ab51a =
(https://lore.kernel.org/all/20250814154622.10193-4-maz@kernel.org/) and =
reverting this commit makes the device boot successfully. Unfortunately =
I do not have access to low level debugging such as UART so I have not =
been able to pinpoint exactly what is missing.
My changes for this chip are all available here in case it is an issue =
of my own doing: =
https://github.com/jackmthws/linux/commits/mdm9625-latest/
I apologize if I this isn't the proper way to submit a regression =
report, this is my first time doing so.

Thanks, Jack=

