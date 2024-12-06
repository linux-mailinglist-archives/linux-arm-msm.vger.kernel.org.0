Return-Path: <linux-arm-msm+bounces-40771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38C9E6C70
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 11:40:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E40FA28381C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Dec 2024 10:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 525C01FCD01;
	Fri,  6 Dec 2024 10:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CX3U0otR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A131F8F13;
	Fri,  6 Dec 2024 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733481634; cv=none; b=Sws48m4+73uYGb/fVRykkba8oIUKNw3PYuDx0jNAsaQj1oMVKY37oXhz/aWa31uiZSwue6ZB7G6MI99uCBOQmCxaVDJD2hifrRGeClJJ/k5X1/F+RSTXVVhLnlLjppUu+QUnuL0vb/fzlH8m3R3j5tSWl1rg11pMSg22bJrVKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733481634; c=relaxed/simple;
	bh=DK0b1dwM5LeTVWALPJmNaBBZJ8WNAFHuj6zNDiCIlhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2Lc/CN7VTiEYSEHkRyI6bHcANsXoU+5vaK83AyoW7bkVL0POZyRqQ8OWZzTK9DoyA/V3fhpTnTFcTv+pgRY2JVG0/3TP2D82784nBPFy37IM5Dt65OaloqGImlc3QMeFBWm3jfCIJ/ADnnic6CMqS2DCyt+BZ+crhwCJDDepm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CX3U0otR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91BCEC4CEDE;
	Fri,  6 Dec 2024 10:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733481633;
	bh=DK0b1dwM5LeTVWALPJmNaBBZJ8WNAFHuj6zNDiCIlhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CX3U0otRjjdQdwg2xQAqHyWfA2NLYy9NGNUO4JxAUC8zgcgMkE06OQnXt15/+ifxi
	 jcvnTvdk5+Cwa6C5GiamP556Ey1sCfRdSgtTXlFqPhHzd5TvKQDsDbs1ekraS70DmU
	 UmezVgplVM8XToBFn6agJbDg1l9vngvcKqBr3/2HKYCC9OJxm1d2N9LQfzcN0xLj9l
	 DqivqW+PYsvnhe4G9guGZ16Rq9AwqRmGXRgfu3k2HegBV0Qhs6RwJ0fNrOJ4a5HmU9
	 mOxp3X/J8naZ9q2STsLIbjcJVa2fTyYRYl15OUx1UkPBD6OSuXWI52TtO3pc3VDUh9
	 ev0ZQuwhQE2ww==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tJVlB-000000000oV-1xv6;
	Fri, 06 Dec 2024 11:40:34 +0100
Date: Fri, 6 Dec 2024 11:40:33 +0100
From: Johan Hovold <johan@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	Jeykumar Sankaran <jsanka@codeaurora.org>, stable@vger.kernel.org,
	Leonard Lausen <leonard@lausen.nl>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 1/2] drm/msm/dpu1: don't choke on disabling the
 writeback connector
Message-ID: <Z1LUoSobMwsQER9y@hovoldconsulting.com>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-1-7eac9eb8e895@linaro.org>
 <Zz2gP5jDr4Jq1OyP@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zz2gP5jDr4Jq1OyP@hovoldconsulting.com>

Hi Dmitry,

On Wed, Nov 20, 2024 at 09:39:27AM +0100, Johan Hovold wrote:
> On Fri, Aug 02, 2024 at 10:47:33PM +0300, Dmitry Baryshkov wrote:
> > During suspend/resume process all connectors are explicitly disabled and
> > then reenabled. However resume fails because of the connector_status check:
> > 
> > [ 1185.831970] [dpu error]connector not connected 3
> 
> Please also include the follow-on resume error. I'm seeing:
> 
> 	[dpu error]connector not connected 3
> 	[drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> 
> and say something about that this can prevent displays from being
> enabled on resume in some setups (preferably with an explanation why if
> you have one).
> 
> > It doesn't make sense to check for the Writeback connected status (and
> > other drivers don't perform such check), so drop the check.
> > 
> > Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> 
> I noticed that the implementation had this status check also before
> 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to
> dpu_writeback.c").
> 
> Why did this not cause any trouble back then? Or is this not the right
> Fixes tag?
> 
> > Cc: stable@vger.kernel.org
> > Reported-by: Leonard Lausen <leonard@lausen.nl>
> > Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> 
> Perhaps you can include mine an György's reports here too.
> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> With the above addressed:
> 
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>

It's been over two weeks and I'm still waiting on a reply from you.

Can you please respin the patch as suggested above so that we can get
this merged ASAP to fix suspend on X1E which has been broken since at
least early summer.

Johan

