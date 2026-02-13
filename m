Return-Path: <linux-arm-msm+bounces-92765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UKMJMGkBj2kAHQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92765-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F71353DA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:48:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 448F2306B092
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1B6C352936;
	Fri, 13 Feb 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XMtFayh5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF08A354AF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770979514; cv=none; b=I0cfQobVcNxM65d3ESl2ykRLyPi3uoivgDGKumaiN+UZjMU6b6gOJjHPeZbL1x0pOxhWntzImAsT88dcgYoLzP9cUf5gvRwZ7KMaq5FvLxSZw3C1o4cubymlzM2Z1/VH3/irhz/Z883Q9JeQPY06bwp+bhOH7vo1E/AsQ82+FEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770979514; c=relaxed/simple;
	bh=ae4YsFkRL4hT1bL9gebH9ppqG30GrKSaxvB14eYTi+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPW+SmD8S2xFVuZu/ToTSD7cXDB1yAkNBkD8mdD61UKI1Lr2UhOwacpwadn3L24eM0djWjj3kEK9IHfygRLCwtNNYB1JY4g9RLME31BVeZvkqKbtUMNrIS2pA85HLnb6xQw2/Fvx8P5VlMFmkxinw+JBMdyI7hz0jrwxfyk+M2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XMtFayh5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64611C116C6;
	Fri, 13 Feb 2026 10:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770979514;
	bh=ae4YsFkRL4hT1bL9gebH9ppqG30GrKSaxvB14eYTi+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XMtFayh5yjGVeQhZs9ejMf7qdV6Fwuh55BkTCd4cZYIOx2vfrHavqWT6QRGRpgzvY
	 /P2mRLr3ZYJ6Rl4qJ531LndLzA/lNna/c615XSbEEzG2T/JrybrXDMoe9xdlLP3pXy
	 aLQmpwH7dZtqgN4L5qpv1h2nAgo725QZDEcgbhJLyIracSsZW3NwtPHAbr+W9OIpZZ
	 VoaYV1gSdhc2hTClN09d3Olv2guQU+A0UFfLMqWfVj120PLjeNqM/qDNGQs2jvBiEn
	 felkYCHczgkXQTZJN+Khm1vJzPqOAsYBy6tzYB82Mvc33a/PTrGUcZBEntPU07w1hX
	 ubGyqSyv7f8CQ==
Received: from johan by rho.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vqqfa-0000000042q-0HiX;
	Fri, 13 Feb 2026 11:45:06 +0100
Date: Fri, 13 Feb 2026 11:45:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org, dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
	Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v3 5/5] phy: qcom: snps-femto-v2: Fix possible NULL-deref
 on early runtime suspend
Message-ID: <aY8Asvu-1u0e02oJ@hovoldconsulting.com>
References: <20260205160240.748371-1-loic.poulain@oss.qualcomm.com>
 <20260205160240.748371-6-loic.poulain@oss.qualcomm.com>
 <aY7pvakkOnaYsd5p@hovoldconsulting.com>
 <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-3yk3sPXj+hGuWvAFsFJAXjH4kWLV8k_5_v9Hax0XxaOg@mail.gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92765-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hovoldconsulting.com:mid]
X-Rspamd-Queue-Id: 2D9F71353DA
X-Rspamd-Action: no action

On Fri, Feb 13, 2026 at 10:45:32AM +0100, Loic Poulain wrote:
> On Fri, Feb 13, 2026 at 10:07 AM Johan Hovold <johan@kernel.org> wrote:
> >
> > On Thu, Feb 05, 2026 at 05:02:40PM +0100, Loic Poulain wrote:
> > > Enabling runtime PM before attaching the hsphy instance as driver data
> > > can lead to a NULL pointer dereference in runtime PM callbacks that
> > > expect valid driver data. There is a small window where the suspend
> > > callback may run after PM runtime enabling and before runtime forbid.
> >
> > So here too, the commit should reflect that this cannot really happen in
> > practice.
> 
> This happened  in practice in the qcom‑qusb2 PHY driver, with the same
> code flow.
> Bug: https://github.com/qualcomm-linux/qcom-deb-images/issues/208
> Patch: https://lore.kernel.org/linux-arm-msm/20251219085640.114473-1-loic.poulain@oss.qualcomm.com/

Thanks for the link.

> I know it may sound unlikely, but this crash has been reported
> several times during boot‑stress testing. I haven’t investigated
> deeply enough to determine whether it’s caused by an unfortunate
> preemption window or a racing CPU.

But I'm literally asking for *what* would trigger the suspend in that
initial window between enable() and forbid() cause I don't see it.

A racing user space daemon re-enabling runtime PM after forbid() is
the only thing I can think of that could trigger this.

Johan

