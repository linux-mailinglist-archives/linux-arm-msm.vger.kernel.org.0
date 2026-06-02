Return-Path: <linux-arm-msm+bounces-110839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id GT81KiYoH2rwiAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:59:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E4A631425
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 20:59:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=web.de header.s=s29768273 header.b=ci4F2xwO;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110839-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110839-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=web.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1CB633016EFA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 18:52:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A13639A070;
	Tue,  2 Jun 2026 18:52:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F791363C64;
	Tue,  2 Jun 2026 18:52:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780426345; cv=none; b=bu0G6MmHPdbC/vepSKpXsWQkBG1YHuCQVF0q+O4/zfFhxxVs3qiV7++BVFJtTeZbnTRUIFQGHRRuxPSOrfwgGTorGbEZvqfoh++7DPiCkAz3W3yYH5olzzs/zuIafkWEWaQrj7BAAFn69iAayJ6gDfN/CgRr72RUnUQ45pV/2IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780426345; c=relaxed/simple;
	bh=P18+MolSDqD504w87LT81UQXk1hghN0KHhZZgtX9/A8=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YqSZyXcBF9JRqxuhRdw6W92QaOSXx+jRL8w8uMGbxkGdcbiwfXyDPFSDd7UpoqCoXrb29x+kiSBHvOUM0B38FI///95n+zUckXMwM4zIIkSeSj9SgBKBwcvlv2QMZodFBMZV/+lx1Lo33P/PlUibIuG+bFwFKieheauzlt7nVuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ci4F2xwO; arc=none smtp.client-ip=212.227.15.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780426341; x=1781031141; i=markus.elfring@web.de;
	bh=HhBgtsNQoRwpzYU1yb7fP6Pi0sH3HNiE1N1abgF2rC0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ci4F2xwOS2EG9V8fJzVocf79Z3j9EIP/SQVgGYw/Uzf3DxDTRtBM0uLuLcP1VOs6
	 7zFbXcMMgK243Ha4K8d0eKPAjMEkUOpPXDTRlUg16YJut3inBCwNm+mvesv+pxuqM
	 MR9BFdV3M6538zWtdgNFQ8ubARHQFnYiID1kjF8LchRywFLTcTv0pY0gK11lR0vC5
	 VS7q7ouw5uDVnmANMhFBqXRXZEjTEVXdFte6JUKvExthZCPN+UfiFilPeFFdcYkii
	 cFq5STyy5oJFdbBU21pYTepfqym4k8Iu0LCRy4g7V2illtdoyghi1WzMV6smxm7CR
	 7u96BTNRdFUsnfj+ZA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1d7s-1xS3zB1CRs-00zLcl; Tue, 02
 Jun 2026 20:52:21 +0200
Message-ID: <39c49c28-0674-43a2-8048-6687f9a3bace@web.de>
Date: Tue, 2 Jun 2026 20:52:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: patchwork-bot+netdevbpf@kernel.org, vulab@iscas.ac.cn,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Simon Horman <horms@kernel.org>
References: <178036982189.224606.10962942847177813465.git-patchwork-notify@kernel.org>
Subject: Re: [PATCH] net: qrtr: fix node refcount leak on ctrl packet alloc
 failure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <178036982189.224606.10962942847177813465.git-patchwork-notify@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:XFp8xKx8EAXM2lIE53MRcMUCTsaMKzRuQUjtOBdoVgGrkQw7P5u
 gPEIQlzosv04I4BYaonJ6whGI/iDXtSatVj/irsaUmfa944c5hwkBzKtqo94un+MQDGX/ty
 iIWHN1ZicUbxiXGXVGJ5U+1Y3fYA2/zF8VpOTdPivebMz6K6aa3D5bsHb3S83EjsgnQnc5Z
 AUyuVjBW5uxKeuD8Myc2g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7ZQrpN1cAgs=;HCDvzQ+mI4Vst5oZ5Jow/fQsOqJ
 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
 NYTTqphakbO4Lqrx/6haC68s2ZU=
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[web.de,quarantine];
	R_DKIM_ALLOW(-0.20)[web.de:s=s29768273];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110839-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:patchwork-bot+netdevbpf@kernel.org,m:vulab@iscas.ac.cn,m:netdev@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:mani@kernel.org,m:pabeni@redhat.com,m:stable@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:horms@kernel.org,m:patchwork-bot@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[web.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Markus.Elfring@web.de,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[web.de:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdevbpf];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,bootlin.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 01E4A631425

=E2=80=A6
> > Add qrtr_node_release(node) before returning on the allocation failure
> > path to properly release the reference.
=E2=80=A6
> Here is the summary with links:
>   - net: qrtr: fix node refcount leak on ctrl packet alloc failure
>     https://git.kernel.org/netdev/net-next/c/3b09ff541145

Would it have been possible to avoid a bit of duplicate source code
by using an additional label in the implementation of the function =E2=80=
=9Cqrtr_send_resume_tx=E2=80=9D?
https://elixir.bootlin.com/linux/v7.1-rc6/source/net/qrtr/af_qrtr.c#L998-L=
1024
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/coding-style.rst?h=3Dv7.1-rc6#n526

Regards,
Markus

