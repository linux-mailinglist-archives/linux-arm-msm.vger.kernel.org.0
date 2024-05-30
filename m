Return-Path: <linux-arm-msm+bounces-21144-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8118D504A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 18:56:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF293B22EE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 16:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA5ED45BF3;
	Thu, 30 May 2024 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwjFQjzh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13E545BF0;
	Thu, 30 May 2024 16:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088156; cv=none; b=nqzr+EZIQPO/aEXwXudp4yGag1C1rVuiTSgrJjqM2tSCtyc656aEAd58YCqK+nxM2vKZBLW8IKAmqQKExHhU8D1yXhy1Xk9OLUESb9ZJYvxta6DuwPeF7IHyeO1SnVExlYs9CSmn10nYwwvOfJ70RbuBXZGFpRPRV9dN1OZn3UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088156; c=relaxed/simple;
	bh=y9NCFZ2r7d1RUlF0MdnMJsnplEp0MXxCrVSUOSZQRC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYKczpVxjs3lsd1bjJwoAY3crkjJGkB73QNGhdtpZvM5tWJpKhvyPEaFH4jyEOsODaqV2gn1YwyKaFfcW87tnTD1rSyOZ+bjCBw4jknF8E1sdU2+05qha+RpvcjoXw9jM/XgUp1m3VdByMBDtSOx0FE9fc5oCXhxTYwa6Ta5y40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwjFQjzh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350D5C2BBFC;
	Thu, 30 May 2024 16:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717088156;
	bh=y9NCFZ2r7d1RUlF0MdnMJsnplEp0MXxCrVSUOSZQRC4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=HwjFQjzh27GeUw64vzkp+R2RQfD9cS2BWClNN+muvviU1GUsUzKkxI6aLXiCXvj5O
	 6kzm0mkIhqbpis4AUlw5nRtjE2SCflJCCEQAiZka/7S1olX/wppKf/2b8lqO9skDDi
	 ExSsfy7wj2x9f6qhRTyKt7UnrmIX1sEjcZhfeblJhcGfsFH+AUF3D0kG8zmswE1oVp
	 zOeqfX/u7L0eLHRCNJJI7UQ8uvtEFUtXWiWzDdwzhT0BWyP2cJ3TeJBNKnK2Yhe8hn
	 C/Ce7G1Qnd+OSiI4PAtFA6LJCZpYkiYXEbyY2IdVZhTjmimLE+Ffcuw14kYIvlYCDS
	 TzI1P3eULcFgQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 32A06CE075F; Thu, 30 May 2024 09:55:55 -0700 (PDT)
Date: Thu, 30 May 2024 09:55:55 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: sfr@canb.auug.org.au, Rob Clark <robdclark@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jon Hunter <jonathanh@nvidia.com>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [BUG] Build failure and alleged fix for next-20240523
Message-ID: <4f821c7f-6201-470f-b39d-ba689ca027d9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <287206c0-b53d-4aa1-b35c-0725adc5e9ef@paulmck-laptop>
 <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28db820c-860d-be1c-bb94-ed534622fdc8@quicinc.com>

On Fri, May 24, 2024 at 12:57:58PM -0700, Abhinav Kumar wrote:
> Hello
> 
> On 5/24/2024 12:55 PM, Paul E. McKenney wrote:
> > Hello!
> > 
> > I get the following allmodconfig build error on x86 in next-20240523:
> > 
> > Traceback (most recent call last):
> >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 970, in <module>
> >      main()
> >    File "drivers/gpu/drm/msm/registers/gen_header.py", line 951, in main
> >      parser.add_argument('--validate', action=argparse.BooleanOptionalAction)
> > AttributeError: module 'argparse' has no attribute 'BooleanOptionalAction'
> > 
> > The following patch allows the build to complete successfully:
> > 
> > https://patchwork.kernel.org/project/dri-devel/patch/20240508091751.336654-1-jonathanh@nvidia.com/#25842751
> > 
> > As to whether this is a proper fix, I must defer to the DRM folks on CC.
> 
> Thanks for the report.
> 
> I have raised a merge request for
> https://patchwork.freedesktop.org/patch/593057/ to make it available for the
> next fixes release for msm.

Thank you!

This still is not in -next, so I am putting it into -rcu just to silence
the diagnostic.  Or should I push this to mainline via -rcu?

							Thanx, Paul

