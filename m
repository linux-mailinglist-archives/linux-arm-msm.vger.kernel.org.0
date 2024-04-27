Return-Path: <linux-arm-msm+bounces-18724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DEB8B4640
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 13:50:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC3D1288117
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Apr 2024 11:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5164A4CB23;
	Sat, 27 Apr 2024 11:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fCX19/vm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220881E52C;
	Sat, 27 Apr 2024 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714218628; cv=none; b=QnI65UzEwBh4brAvbAzXpzMSoagxxDKDF33ycw5sHU9cc12tqQyRruEB0dFUz1Vyk+MXHV5VureOMktJ32hOWZe8bLwm/teosJT+xTGa6jrSlZcC+l7izQiGVFK3P+oiIwRy0xdT1hYQsTntRDu6zJlm/mTspv7l5YD1PI/OTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714218628; c=relaxed/simple;
	bh=LZMK4HbRTfxqa3gRwI16WSPLTvuwjhxJh1WI4AyThSw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTyem/v7ZAG3ZxJVLGuXZxrpQPzlSkR7/CTf3wvXd2p7g3SyyPk+ankEmeiWPPXsP88C2ErI8Rls45pZU26VHCNhSFFQbUpe+/mCwQadYEcZmPIfzexwTm6xowyr7Huw1s505Jywf9/1WFLaG6PyXjuZnOlFFeYWP1Ww3QNfTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fCX19/vm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D09DDC113CE;
	Sat, 27 Apr 2024 11:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714218627;
	bh=LZMK4HbRTfxqa3gRwI16WSPLTvuwjhxJh1WI4AyThSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCX19/vmWFL48Jp1eqNcO3KNb3UztNqF7QWFWcc00OYdfc5cnQG+n/rFo0cxsDe+t
	 LfeoNimf7QXVqHIJHYSXk6V5pLImfgSN/xgdkwOMyPCkGOnW/k0Z3+1Ame858mRmgm
	 UXcd4Al7KfXxZS79RaNrjiGUnGxG8D+xLqnJNM8Xf3oM0LYJOTHDsfvjTGQwVWdCt6
	 T5+PZwxU8sPPbPs4GQIp/cIhf1UcOg8Up8BwE1U123OmOTnscx5xJU78WGbD7+3/i1
	 Af/fihCfe2qI20h+uRD0OV2UWinLUjgQK4ugz3FHZ7R3zFBLvTcdQ5CcQygdelMhNS
	 eXq0z4Eko0l8A==
Date: Sat, 27 Apr 2024 17:20:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Qiang Yu <quic_qianyu@quicinc.com>, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v5 1/3] bus: mhi: host: Add sysfs entry to force device
 to enter EDL
Message-ID: <20240427115014.GP1981@thinkpad>
References: <1713928915-18229-1-git-send-email-quic_qianyu@quicinc.com>
 <1713928915-18229-2-git-send-email-quic_qianyu@quicinc.com>
 <20240425145450.GH3449@thinkpad>
 <e0fb41f3-3080-c1b5-ab7c-bcff8bbbe754@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0fb41f3-3080-c1b5-ab7c-bcff8bbbe754@quicinc.com>

On Thu, Apr 25, 2024 at 09:07:37AM -0600, Jeffrey Hugo wrote:
> On 4/25/2024 8:54 AM, Manivannan Sadhasivam wrote:
> > On Wed, Apr 24, 2024 at 11:21:53AM +0800, Qiang Yu wrote:
> > > Add sysfs entry to allow users of MHI bus force device to enter EDL.
> > > Considering that the way to enter EDL mode varies from device to device and
> > > some devices even do not support EDL. Hence, add a callback edl_trigger in
> > > mhi controller as part of the sysfs entry to be invoked and MHI core will
> > > only create EDL sysfs entry for mhi controller that provides edl_trigger
> > > callback. All of the process a specific device required to enter EDL mode
> > > can be placed in this callback.
> > > 
> > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> > 
> > All 3 patches are applied to mhi-next with my reported changes! Since you are
> > doing upstreaming for some time, you should know that the changelog _must_ be
> > present in the patches itself or in the cover letter.
> 
> It is/was in the cover letter.  Was the format not to your liking?
> 

Hmm, it didn't land in my inbox. Maybe my filter did something. Apologies for
the false statement.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

