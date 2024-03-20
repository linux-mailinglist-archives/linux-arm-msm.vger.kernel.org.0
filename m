Return-Path: <linux-arm-msm+bounces-14682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA41881824
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 20:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84FD21F212DF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Mar 2024 19:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29A2A85644;
	Wed, 20 Mar 2024 19:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="4DfYpmxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAFC6A34D
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Mar 2024 19:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710964211; cv=none; b=YrJqpEnAQKSf/xB+E69NVBbbh9e0sd1ur8IJrluiMbDWToFIBtxJ2JLnYT7dGyHnMRCFNJbdmhgwNx6yVYussKLF80bmyxo+Z7MpX9YYyNspJOBDcMN9uyILAsMRT9hDfZHsYo4s3tT/E/dAZw/GWut47Lx31ib+DhP+yrFgymc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710964211; c=relaxed/simple;
	bh=xcFHxhN8Oae0n0FGmnwYLDwR9iw/gIqIjV3s2djWmk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWibk4y3s+u8LjUHg1SyqA3rfATITHHtsV93wYZXypdycPBRvSRhKL75yaQ007CCZIyJUM8BHJKBm4PLyYhIaoIUMio9/ET4H1Mfj4NDkelOj81D7IVIhnGfWcBxX8Obc47bnm5Let0HXLDuhGCXDshDVb57lp+byR3Fv3G00D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=4DfYpmxT; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710964207;
	bh=xcFHxhN8Oae0n0FGmnwYLDwR9iw/gIqIjV3s2djWmk8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=4DfYpmxT/0K2fGyEB77eudotA10IBp+oPjOTw1qbS32dZEOl7s9sDhJHB5/9DbdYa
	 MfoNlhrNa+cYxUAkDrrga/kaw7kLtxaZRQs5Chr3+CeTYfzQWmFzkE/gPg8g4Q+5m2
	 VRcTdtpu3hYOFCBhSOU5nWAOmpbAmQfXEraIqplw527OND+VxsKINNUww1OGvTKukT
	 l+iWHHvey6iV+zhJOcvVrWNuU8OoEo6ZOQ94oymlh7N+5Db6IDSNksMyqiMYWaVI2H
	 GowCsQPqzmt6/HU/yANMxRpaSIldd+6gLz9uE2iJOJ5sONVyGTFF30rg+HfHLTXIxS
	 xZokiNesYj/Lw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 38125378148F;
	Wed, 20 Mar 2024 19:50:06 +0000 (UTC)
Date: Wed, 20 Mar 2024 15:50:04 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wens@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	dri-devel@lists.freedesktop.org, kernel@collabora.com,
	linux-arm-msm@vger.kernel.org
Subject: Re: Missing commits from drm-misc-next on linux-next
Message-ID: <a5691f16-5283-47b7-ba50-3b9dcbee283c@notapiano>
References: <39ad88fa-449a-4aa9-ac6a-902d8d531984@notapiano>
 <20240320-sticky-shiny-mussel-5da3cf@houat>
 <613c60d8-2652-451d-91f3-bde84219bf48@notapiano>
 <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v65Te6hsPvB7nQjGTAm0x9nurq7Kcdpjtb-MvQ-a1hxqYQ@mail.gmail.com>

On Thu, Mar 21, 2024 at 02:08:59AM +0800, Chen-Yu Tsai wrote:
> On Thu, Mar 21, 2024 at 1:59 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
> >
> > On Wed, Mar 20, 2024 at 04:19:51PM +0100, Maxime Ripard wrote:
> > > Hi,
> > >
> > > On Wed, Mar 20, 2024 at 11:07:34AM -0400, Nícolas F. R. A. Prado wrote:
> > > > I noticed that there are some commits from drm-misc-next [1] that haven't been
> > > > added to the for-linux-next [2] branch, and consequently haven't made their way
> > > > into linux-next.
> > > >
> > > > Namely, commit bf0390e2c95b ("drm/panel: add samsung s6e3fa7 panel driver") and
> > > > commit 2689b33b8864 ("dt-bindings: display: panel-simple-dsi: add s6e3fa7
> > > > ams559nk06 compat") which have been applied almost a month ago [3].
> > > >
> > > > I noticed because running 'make dtbs_check' on today's next is showing new
> > > > warnings, but with these commits applied there shouldn't be any warning.
> > > >
> > > > Could you please take a look? I'm guessing a merge was forgotten somewhere along
> > > > the line on the for-linux-next branch.
> > >
> > > Those commits are in drm-misc-next which is now targetting the 6.10
> > > merge window. In order not to disrupt the oncoming 6.9 release though,
> > > drm-misc-next is removed from the for-next branch, it will be
> > > reintroduced after 6.9-rc1.
> > >
> > > Maxime
> >
> > I see. I didn't realize that's how drm-misc-next worked.
> >
> > Interestingly enough, the reason why this happened is because the for-next
> > branch on the qcom tree [1] also includes changes that are queued for 6.10. So
> > it seems that every subsystem has a different view of whether linux-next should
> > include only changes for the next (or current) merge window (6.9 in this case),
> > or if it should also include changes for the following merge window (6.10 in
> > this case). The end result is that in the time period leading to, and during,
> > the merge window, linux-next might be in an inconsistent state - it's neither a
> > snapshot for this release's rc1, nor a snapshot for the rc1 of the following
> > release. This seems to me to partially defeat the purpose of linux-next, so I
> > wonder if it's just a matter of better documenting the expectations for
> > linux-next.
> 
> AFAIK 6.10 material should not be included in -next until after the merge
> window has closed. If they are including it then they are doing it wrong.

+CC QCOM folks

Indeed I was just pointed out by a colleague to this message from Stephen
clearly stating linux-next should only contain commits for v6.9. [1]

QCOM folks: FYI there are commits scheduled for 6.10 in your for-next branch,
which is not supposed to happen according to Stephen.

Thanks,
Nícolas

[1] https://lore.kernel.org/linux-next/20240319164505.485b3801@canb.auug.org.au/

> 
> ChenYu
> 
> > Anyway, at least for now I'll keep in mind that linux-next can be inconsistent
> > when looking through future results.
> >
> > Thank you both for the insight.
> >
> > Thanks,
> > Nícolas
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/log/?h=for-next

