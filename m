Return-Path: <linux-arm-msm+bounces-115794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LYU6GWN8RWrhAwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:45:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABCBE6F1912
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 22:45:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=S28tKo1j;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115794-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115794-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2D6B430686D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 20:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595AB394EB7;
	Wed,  1 Jul 2026 20:39:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F87F370AC5;
	Wed,  1 Jul 2026 20:39:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782938374; cv=none; b=AF8Y2w8WDtVb509XEcj4Z1570t2vVPFmIi/ceG808O96V5McoAOnMxprAvHD5sr+CUejIkhdFmHobfefE0slGj8OX5GYIyC1bjf8otEHANM0s/qo60i4f7RMb3NSwGtnOPMK/MYW1TF7rfznTgJib6ZkCMEguMMNzbV35xVbqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782938374; c=relaxed/simple;
	bh=cI13IgAY08jgulzV5Bp1DyMyj4EeyTUZlfrNWXhNLYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=c/ytMXabLObG6JNegSs4R5cGm1OTDOdXcMUrTT304t4rgG1keBeAhMDe/5vZCi67cNkRU7i18hye71m43D0HKjHp4D2c8BJQFvI+NTSa/NzL6FDVDXEmDNm0z4wzXb3FLFAjv+Pnih6pEIY90Oguk3rsG2efBU4pW8wgWlvzGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S28tKo1j; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FA61F000E9;
	Wed,  1 Jul 2026 20:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782938372;
	bh=/the5eZJbF98hP/D8p+N3EBSs0nvSErM37y6I0tK2pQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=S28tKo1jzZ0l8GvahhZZWEpckiOS9XDAaDZiVZ/NMgmpbWjK5XnQmctnykAbl7+xv
	 g/8L/nuLXz2U5AR+k/JdlEIrgamrmErGtmoYurVvNL3gjnaSne34KovTIPwB/MKCLT
	 /0lsZ0m0hgRBQcEKLYEJPavYskH7evo6jA+AC+UlXneEEscr/jpzNqcI06qs1By8SJ
	 XmcEPGJY113tSiJhtQx4lS9MJ9Awn7WwCpPaB7OlQ+zBSJdihU6rI2uXZHU3Lpk2GD
	 FaNVW0SYJtUjA25lqwfQJLxDsyZsV9ZY0GFKOcRy3wAZJ+bJ2f14AS824xYtRwPSpp
	 vQ1yTuMP3AgQA==
From: Srinivas Kandagatla <srini@kernel.org>
To: Amol Maheshwari <amahesh@qti.qualcomm.com>, 
 Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 ekansh.gupta@oss.qualcomm.com, quic_chennak@quicinc.com, 
 Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
In-Reply-To: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
References: <20260609025938.457-1-jianping.li@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v8 0/4] misc: fastrpc: Add missing bug fixes
Message-Id: <178293837074.11817.1152479238333767830.b4-ty@kernel.org>
Date: Wed, 01 Jul 2026 21:39:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115794-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:amahesh@qti.qualcomm.com,m:jianping.li@oss.qualcomm.com,m:arnd@arndb.de,m:gregkh@linuxfoundation.org,m:abelvesa@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ekansh.gupta@oss.qualcomm.com,m:quic_chennak@quicinc.com,m:jorge.ramirez@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srini@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ABCBE6F1912


On Tue, 09 Jun 2026 10:59:34 +0800, Jianping Li wrote:
> Add missing bug fixes in memory areas. This patch series fixes multiple memory
> handling issues in the FastRPC driver, primarily around the Audio PD remote heap.
> 
> The Audio PD uses a reserved memory-region that is shared between HLOS
> and the DSP. Allocating and freeing this memory from userspace is unsafe,
> as the kernel cannot reliably determine when the DSP has finished using
> the buffers.
> 
> [...]

Applied, thanks!

[1/4] misc: fastrpc: Fix initial memory allocation for Audio PD memory pool
      commit: 36090f35ca19c1422bd56f03cdc3b5703ca18a15
[2/4] misc: fastrpc: Remove buffer from list prior to unmap operation
      commit: 902b8ec9dd1098cc133cffa8be0b6378544f27ba
[4/4] misc: fastrpc: Allow fastrpc_buf_free() to accept NULL
      commit: a4f06f06c20a72b2ee96fd964ce93a18e321bd0a

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


