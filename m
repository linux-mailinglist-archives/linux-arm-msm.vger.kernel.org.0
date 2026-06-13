Return-Path: <linux-arm-msm+bounces-113018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LE8QHP6nLWpCiQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 20:57:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE8967F5E9
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 20:57:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=shazbot.org header.s=fm3 header.b=cciQe5mQ;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="C PGd77q";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113018-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113018-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=shazbot.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A06643022607
	for <lists+linux-arm-msm@lfdr.de>; Sat, 13 Jun 2026 18:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52F0B3911AD;
	Sat, 13 Jun 2026 18:56:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E7282F12;
	Sat, 13 Jun 2026 18:56:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781377018; cv=none; b=iyj3h+ebyNd1Pu/eSFGI5c/iWcpsDOetDeV58zPQc7rEX650yB2Dpr3t4G34+8HhP5ugQibHyaisd0sBhNE6FLEhsnwaNuChrHiSzMLUaJ8YWrFR5V/oo52JEO2ijAe93Zr96zgomIGaVnq/houThy0TdbmdtLgMO7Vq3bKNoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781377018; c=relaxed/simple;
	bh=6g/hcspqmnzDpTPyOXVCXQgi33ZrKlPFvAoor5/tz90=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Pf7P7z67ff9qEE2b5IdJiHWcKjhPbM2KslN/cNzFqhg0sh6qhzaKvLnF0d6uagjpjNEcTS/3/MUVN8x999MbbQikcQOdvo5iTw0T7B6nQWXCzFx5Q6S/pZoghw28OnHRNuB1C9V1+VcYCukvrInhreD6O7BeRTERMpIkHvd/2OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=shazbot.org; spf=pass smtp.mailfrom=shazbot.org; dkim=pass (2048-bit key) header.d=shazbot.org header.i=@shazbot.org header.b=cciQe5mQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=CPGd77qI; arc=none smtp.client-ip=103.168.172.145
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id 421FAEC0110;
	Sat, 13 Jun 2026 14:56:52 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-02.internal (MEProxy); Sat, 13 Jun 2026 14:56:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shazbot.org; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781377012;
	 x=1781463412; bh=DedA66i8NGg0cgs5rpe5hEwK9Jl8E+D2eWj+aYyb91k=; b=
	cciQe5mQO2LKhZGSuGKmn8ZJrD0b9X80caZcjawDjGZS4s/TBE4NBgCB6Anpcqt8
	w0hh9XZRI9KHJoe2M0s5Kcke4y4UanUCOcdxSOUmmaRLcgAxjMyUZTQAFxPNOfXq
	wD5tR9+KUHeya/yF9n6p+VsBRvvbd0fJOD/lQ6p1SXE/Fj4wrRdH+/gf/y57iME6
	3H2ADc2bVS5kQllbuVLnLdZk2S1JpNo+uNGD6og7ECSd6ZgoQQYmNduRmKdQl6mc
	b2plnxQ+7TNjyj1i+lULK6bWMTz5Rz3m4/LOIJbzzBBZUxnSfzBhojGPgUX19Pl9
	eBQWrSjxsbFu5b/zF1s0dQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781377012; x=
	1781463412; bh=DedA66i8NGg0cgs5rpe5hEwK9Jl8E+D2eWj+aYyb91k=; b=C
	PGd77qIABBYAreVnqRwjGYigZP/aHbb6CqO1e6em5wGI0bReVsslTCMjO0sLPIih
	W7QL9UL/bN0x9ATo+j2kWse6GaunYzCkj7J9UDHuxFRg6KQ1iIxtGsUXKA0ATREM
	1aRFpuL4q/wYztptt4ar/9j6uuk1930yPGdLqLfPlKa26GRzNSNfVQx6qZfKWRLn
	70ccWe08JloRaqD59NdemUpqn0OSn3YVggztWJ7vUVJnco2oHYrOecFfkbVeroOs
	PEa/QdGnGNtinq/PVeebFbxqUSnFTQxIOGidv5TdjB1a4etbjxhGI7itRG3Nn5sl
	P3bK6rZ1771HiWq3qyi1A==
X-ME-Sender: <xms:9KctanAPKTiPOZ1I3qovOj3sBLv5Ubj7J4LCbN9nJITGBA2lRu3q6Q>
    <xme:9KctaoUGKQQPTytPiDBPyg8GHRa27R6_L5cUFayWB4d5DXUXPZfRbTlN7pvooTYxe
    jmBuyLIcQyakUcLSWGHv0S1I1JSFOu18pkaswSLJqNsXb-C-PeeuA>
X-ME-Proxy-Cause: dmFkZTENY/k1unTZtgfGRIcYYqnjKx4tZRQ36/irkP+VyjvaKGjbe+ykCPnqkTu5C24Wy2
    XzZvF3UzKLg4+GPpMh0i+q13uJsSlmGCjMqcZcSXp+USlTRu99yQxUuFai8vdIZW70CV7R
    EkWyV3EfMhf1DrurgEeS/dU3PHz5qed88G7UKKVjlPZSsCoDmKPD2kb5oTi02+/B05iACH
    kMFDKkWeOAEzfI+UE4ByBqpu854AnecEmtljaHnTYkIVif//R5rThJDDMe/6GqlN7rh8ni
    ZEyByJYQVSpU4fouRm4gKBhpLj/+FPOlUm0SfC1QnGHHXh6thsHLhqRmte0NGS6t2svLhm
    5TlRp8g/ybuMdTnWplxgegc3ymH7up8vy6DB0Ct9OEOXLY9II3VwyXD2WxFX37/vP1LCRT
    KTRCvUdxfjlfFDU6W2Ecnz5rUQLtqos+fVqEhs+S8xABq3DB/2NA/cua1CV1MiAi79eT+p
    9Ld9qywvcRI1hOKcJqy+Fdkmh9H1MjdnPkzNDBF25bDNCFViytgi9yhLGHL8EEhdKnWQTE
    amZ0wkKBRgvaXBObG3jRHaDScMONFSsqxlbe8OcvlhZap0O5a4WkH+8Ivy0NrkGc/4ffHv
    I2WTNeOU/O41NrFEN0KmarRjcyKq6Wq25ROw9iIMdCBI6M0PnoUD/MSAZpSg
X-ME-Proxy: <xmx:9Kctaq-s1IMBfq8MjAeWMaxyy5aQtpc9JzPLgOYyB9FNHPxppU_fUA>
    <xmx:9KctahE_cXouBnp3dU5nWCnb4lN7U6iCcc0jN4-cBvWrYphk8gqOpg>
    <xmx:9KctasRBfT93PBjQf8X9WgnjYDXC8_K_DIPJAjJ3gDGMzhpq36wbIg>
    <xmx:9KctagS4iI8IbouAknygapDcaetJcWqDtilRuKCKT0fg6p_XFg4Ocw>
    <xmx:9KctavT4CeUohXy6K3x3Jg5zrpifjXigco7PD5cVQPWmPgVKxGMR-plA>
Feedback-ID: i03f14258:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 0081E15C008C; Sat, 13 Jun 2026 14:56:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A4YpCjS-paqo
Date: Sat, 13 Jun 2026 12:56:31 -0600
From: "Alex Williamson" <alex@shazbot.org>
To: "Pranjal Arya" <pranjal.arya@oss.qualcomm.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "David Matlack" <dmatlack@google.com>,
 "Shuah Khan" <shuah@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kselftest@vger.kernel.org, "Pranjal Shrivastava" <praan@google.com>,
 "Manivannan Sadhasivam" <mani@kernel.org>
Message-Id: <13c56a19-aabe-40c7-b9a6-96c8d1a8a102@app.fastmail.com>
In-Reply-To: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
References: <20260613-pcie_vfio-v1-0-09168188f3f2@oss.qualcomm.com>
Subject: Re: [PATCH RFC 0/3] vfio/pci: Hide and optionally override the PCIe Device
 Serial Number
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.15 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[shazbot.org,none];
	R_DKIM_ALLOW(-0.20)[shazbot.org:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-113018-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[alex@shazbot.org,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pranjal.arya@oss.qualcomm.com,m:bhelgaas@google.com,m:dmatlack@google.com,m:shuah@kernel.org,m:linux-arm-msm@vger.kernel.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:praan@google.com,m:mani@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[shazbot.org:+,messagingengine.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alex@shazbot.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,shazbot.org:dkim,shazbot.org:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDE8967F5E9



On Sat, Jun 13, 2026, at 11:43 AM, Pranjal Arya wrote:
> vfio-pci has no perm_bits entry for the PCIe Device Serial Number (DSN)
> Extended Capability, so guest reads of the serial
> number currently fall through to the physical device.  The DSN is a
> unique, persistent hardware serial number that identifies the physical
> component (the functions of a Multi-Function Device report the same
> value; Root Complex integrated Endpoints may implement it independently),
> so exposing it lets a guest fingerprint the host hardware and correlate
> it across VMs.  For multi-tenant passthrough this is an unnecessary
> host-identifier leak.

This sounds like a userspace problem, QEMU can virtualize the capability and manipulate it as it sees fit.  Thanks,

Alex

