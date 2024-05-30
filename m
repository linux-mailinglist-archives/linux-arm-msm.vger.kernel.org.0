Return-Path: <linux-arm-msm+bounces-21156-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C18798D53F4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 22:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D48F283CA7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 20:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5953F6A8D2;
	Thu, 30 May 2024 20:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A/dmQNd+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7B425634;
	Thu, 30 May 2024 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717101656; cv=none; b=U57MMDbrFtkFlr4kyFOWtXqRtI+KZ92hCa4bk2G037Aycde7uDZCn+zXWycAXO4i8lVVNQ30i+jJwXUD8YoTPZnWBlheRQ23cGrlQftX2BQkxbk2woj7+5/2O4AChac+MJ5vGiEkGmrEQg4HSSNkDzlG/XUgrscVgxDJtzijFDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717101656; c=relaxed/simple;
	bh=WnrKe/9pHs5nuVA9Y9cr8+yFs4LEuqdMGeXWbC5IBRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRMBtrU61cBCRQNjG6ROLygcmjtS669SfAMQejc0g8jxP5GL4SylcY6dDNInR+DgSfWyPZYDYK8l30itgRVhjr74dMTf5h/tgBu/GGNsMMJDVVYBgbZNl7FFasAUrH1Uo9uTqqyNHN6BO2G26cyG+65J5Gx5negvbvX25b+YV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A/dmQNd+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B775AC2BBFC;
	Thu, 30 May 2024 20:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717101655;
	bh=WnrKe/9pHs5nuVA9Y9cr8+yFs4LEuqdMGeXWbC5IBRY=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=A/dmQNd+wVul3Ok9rrYia9eqQpGIAtHMtr3VwMyZskZiiJGxI9+1iTTaXt2+GV2ny
	 rfSwaYzND+LspQW3M1xP2YlLvJOzHtFcsDOhMl9596b4cecPJnsaTYwJa5WgeVYKnN
	 17Xiu8kTZxTw1s2CN+7fgE8w1+mNtokEVyOHEmFpbgjlFtnMhjGYk3xaf8UEC6rTI5
	 qXWyDCJTxHp6fzAwtQbzSqZ9TwG12Z9nORp6nlD07CAxbUBhPc7l/RV+z2CNMC05km
	 8JZ2AhBZV2hQPmLZdMCPtnyzZQ3mD5g7AUzBCicP/qmNfDZqUl+hNHEfhauRobbzDp
	 7/d1kyIAWAJ7A==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 03FC5CE095C; Thu, 30 May 2024 13:40:55 -0700 (PDT)
Date: Thu, 30 May 2024 13:40:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, sfr@canb.auug.org.au,
	Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <72a4d07d-3ac8-4c39-8501-b3f93a26654a@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
 <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
 <D1N6WYWR463J.3UVC2PP2CUIY4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <D1N6WYWR463J.3UVC2PP2CUIY4@gmail.com>

On Thu, May 30, 2024 at 08:28:17PM +0200, Thierry Reding wrote:
> On Thu May 30, 2024 at 6:55 PM CEST, Paul E. McKenney wrote:
> > On Fri, May 24, 2024 at 12:57:58PM -0700, Abhinav Kumar wrote:
> > > Hello
> > > 
> > > On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> > > > Hello!
> > > > 
> > > > I get the following allmodconfig build error on x86 in next-20240523:
> > > > 
> > > > Traceback (most recent call last):
> > > >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
> > > >      main()
> > > >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
> > > >      parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> > > > AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> > > > 
> > > > The following patch allows the build to complete successfully:
> > > > 
> > > > https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
> > > > 
> > > > As to whether this is a proper fix, I must defer to the DRM folks on CC.
> > > 
> > > Thanks for the report.
> > > 
> > > I have raised a merge request for
> > > https://patchwork.freedesktop.org/patch/593057/ to make it available for the
> > > next fixes release for msm.
> >
> > Thank you!
> >
> > This still is not in -next, so I am putting it into -rcu just to silence
> > the diagnostic.  Or should I push this to mainline via -rcu?
> 
> I pushed this to drm-misc-fixes earlier today, so should show up in
> linux-next soon and hopefully in v6.10-rc2.

Thank you, Thierry!

							Thanx, Paul

