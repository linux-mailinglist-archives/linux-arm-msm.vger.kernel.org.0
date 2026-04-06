Return-Path: <linux-arm-msm+bounces-101960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHElJnbL02nomAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101960-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:04:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7113A480D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Apr 2026 17:04:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 29008301175B
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Apr 2026 15:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A42A3859CD;
	Mon,  6 Apr 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WaOFsieP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768B71DED40;
	Mon,  6 Apr 2026 15:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775487848; cv=none; b=qj0PmXLYe0u1XpspFhHdYLD5Kp6HSMYgWp23JRrUVgdtI93udb5/3pLBOqWuMI5ic2wWpajEegKqzKLnVw1pCbx8a4XqjLgX/OhaQ8jSkQ36yXH+/TdHFWbgWz/BQBc+2n0RX0EpNwzfTnThtMbkKlLzlRmxW3/UN+yzDR0lRJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775487848; c=relaxed/simple;
	bh=r6R7hZuPu015w2NK2QhBDMq8ygaJ1fnexwwDlsaFU+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbhoAK1rRncFAN30i7OSU1E6yASEk7oBmCD9jbDdhhKdrzKSiacfEXRRY0yTlbx73ge5DXO0z6y66Gkz4BDe0wV2CpWHh2dbZuHsfqtKp7dydyqF0teC6oOYRCXn+V5zs77TadymUlCT7zAQbo7CRTXaR21NNz/hSNlBQTPDXrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WaOFsieP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A051C4CEF7;
	Mon,  6 Apr 2026 15:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775487848;
	bh=r6R7hZuPu015w2NK2QhBDMq8ygaJ1fnexwwDlsaFU+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WaOFsiePOxquuVFbv6kGq5T/im+haH4hexvYmzAhq7Pc61NlgBhp2YIC7qnnwNnyR
	 FnAQqY+cmwpBmS9ISCjErpcLOFJV48q7A7MiwkTuMPpszYmqS3YPxavrMoDA13ao0U
	 1nzpuDQuHUCFIhnnQbswFXLp9txersyg9GhUTTesM+EORkRzbvbRUKkQ7UlMetEO/V
	 ltqa7RoeQXOCvO+5DR5ka/v2SbIIEgLyPYw/EolXfmv3tr35tnxjpB3Nf8PUc6XHqM
	 e0figdO4mkgKccLPQvi2auJgGrGwFmc+DBee8+eSLy5uvzZNGIF3wTqX5yjtu6n+ml
	 +yy1rkLC3Jm1g==
Date: Mon, 6 Apr 2026 10:04:03 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com, 
	trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 5/7] remoteproc: core: set recovery_disabled when
 doing rproc_add()
Message-ID: <adPLDWz6_QmBa8w1@baldur>
References: <20260310-knp-soccp-v4-0-0a91575e0e7e@oss.qualcomm.com>
 <20260310-knp-soccp-v4-5-0a91575e0e7e@oss.qualcomm.com>
 <CAMRc=MedT32COu-B_TsrN+jCrHjde2v5gnA6WOUmMQ2dEBY6WQ@mail.gmail.com>
 <ce24a2sgg4b6wymoxwgl2ve6np2nxn2wuxfqxfpmvqqrpvgouf@xihd6ziqwu4m>
 <CAMRc=MfRxhXXdAEX+Gm-vJbQGJZ7QRL6RM2CbhcLiqicyvftdg@mail.gmail.com>
 <ymo3kf4bsaz5yh4uwpk6dapfuzujepru3szaa4ujge7vtv43ka@skc5xgejj6aw>
 <9bdc6b6d-ddf0-47af-b1ed-8d1e75bf30c2@oss.qualcomm.com>
 <c6qnvfiknlaofts2kdahbaweiufqitnuni6bhqoxznhxp5zdto@m4i5thd57wx7>
 <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef36a946-ba7d-4588-b94f-4287f3ea6105@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101960-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3F7113A480D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 19, 2026 at 01:44:48PM +0800, Jingyi Wang wrote:
> 
> 
> On 3/19/2026 1:23 PM, Dmitry Baryshkov wrote:
> > On Thu, Mar 19, 2026 at 12:36:15PM +0800, Jingyi Wang wrote:
> > > 
> > > 
> > > On 3/13/2026 10:37 AM, Dmitry Baryshkov wrote:
> > > > On Wed, Mar 11, 2026 at 01:39:50AM -0700, Bartosz Golaszewski wrote:
> > > > > On Wed, 11 Mar 2026 03:11:42 +0100, Dmitry Baryshkov
> > > > > <dmitry.baryshkov@oss.qualcomm.com> said:
> > > > > > On Tue, Mar 10, 2026 at 06:50:30AM -0700, Bartosz Golaszewski wrote:
> > > > > > > 
> > > > > > > Ideally things like this would be passed to the rproc core in some kind of a
> > > > > > > config structure and only set when registration succeeds. This looks to me
> > > > > > > like papering over the real issue and I think it's still racy as there's no
> > > > > > > true synchronization.
> > > > > > > 
> > > > > > > Wouldn't it be better to take rproc->lock for the entire duration of
> > > > > > > rproc_add()? It's already initialized in rproc_alloc().
> > > > > > 
> > > > > > It would still be racy as rproc_trigger_recovery() is called outside of
> > > > > > the lock. Instead the error cleanup path (and BTW, rproc_del() path too)
> > > > > > must explicitly call cancel_work_sync() on the crash_handler work (and
> > > > > > any other work items that can be scheduled).
> > > > > > 
> > > > > 
> > > > > This looks weird TBH. For example: rproc_crash_handler_work() takes the lock,
> > > > > but releases it right before calling inspecting rproc->recovery_disabled and
> > > > > calling rproc_trigger_recovery(). It looks wrong, I think it should keep the
> > > > > lock and rptoc_trigger_recovery() should enforce it being taken before the
> > > > > call.
> > > > 
> > > > Yes. Nevertheless the driver should cancel the work too.
> > > > 
> > > 
> > > Hi Dmitry & Bartosz,
> > > 
> > > rproc_crash_handler_work() may call rproc_trigger_recovery() and
> > > rproc_add() may call rproc_boot(), both the function have already
> > > hold the lock. And the lock cannot protect resources like glink_subdev
> > > in the patch.
> > > 
> > > And there is a possible case for cancel_work, rproc_add tear down call
> > > cancel work and wait for the work finished, the reboot run successfully,
> > > and the tear down continued and the resources all released, including sysfs
> > > and glink_subdev.
> > > 
> > > Indeed recovery_disabled is kind of hacky.
> > > The root cause for this issue is that for remoteproc with RPROC_OFFLINE
> > > state, the rproc_start will be called asynchronously, but for the remoteproc
> > > with RPROC_DETACHED, the attach function is called directly, the failure
> > > in this path will cause the rproc_add() fail and the resource release.
> > > I think the current patch can be dropped, we are thinking about make rproc_attach
> > > called asynchronously to avoid this race.
> > 
> > Isn't this patch necessary for SoCCP bringup? If not, why did you
> > include it into the series?
> > 
> yes, will squash to soccp patch in next versoin.

I'm sorry, but that doesn't make sense to me.

The SoCCP patch adds support for attaching SoCCP. This change tries to
address a generic problem shared across all remoteproc drivers (that
does attach?).

I think you should interpret Dmitry's comment as "why is this part of
this series, please fix this problem in a separate series".

Regards,
Bjorn

