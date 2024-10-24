Return-Path: <linux-arm-msm+bounces-35726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62339AEE93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 19:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B253282568
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 17:49:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 674EA1FC7F6;
	Thu, 24 Oct 2024 17:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="owYUupQZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B901F585D;
	Thu, 24 Oct 2024 17:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729792172; cv=none; b=eQRqWC03nHzO0gKmFT+EoLnhradT0Z1zQx7xQFHegL0LaRYy+bhblCcXp/R4SnGm9/oZTqa9pXvYnGyfdrJefWzTkOA0yBhvW2d+Am7UjFwQ8VerrOka0tKkAp7OaqS6/PH1vlR9db4WoFWfETPl36A6KiP1UTpMJuUP7dVNRpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729792172; c=relaxed/simple;
	bh=zhYWndttK/7xOoVyibLPyouE8AEyrLwPjBxjdEdHZmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2t2O2N9GUxEqUXYfV3Fo6kyAzAjwY0XT30JwYX/25slaXaDMj2sqPPtLjlCG4fK5kRug5xjJ++BCR0cLuVVedW2R+Y/0mZhb2NfKhRHmt+VdHhn4nQTQT8o0JV1DOLOkDo15MAVD4QV51o0pPwKXOPS4Z43GbxDnR9MC1Jyths=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=owYUupQZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6948C4CEC7;
	Thu, 24 Oct 2024 17:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729792171;
	bh=zhYWndttK/7xOoVyibLPyouE8AEyrLwPjBxjdEdHZmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=owYUupQZmFFMYFZyq/sNhN9t+gfp4Hil3ymUuZRoZl/SozSsXit9yb1V2m8OUU+Uz
	 w+4QNvsdXxAtMBR3QLo1BUbeyoqIUIWrEFkZNdow4d44a7Ib9UY/o6Y7uhtcLKTHk/
	 ENsupzMbapMYvkgBBczrHjE9L9J5ylZDOjgksWN3DBV37Y1ZOE3eLjxbzWArGiYxtE
	 RVeEzJW6L4LSBLR9I5tEEnzLp68JOdSfHfCD7Pv4dK1AtT6HxPTsZFnzCI9zBKIEug
	 XLnkYqf3WHwKg6CnXwSj3+QMde3uyPKuT0eLw2z8VcphAtEFMaZLB+Fy68L8r044r+
	 TIp0/5XnV2LIQ==
Date: Thu, 24 Oct 2024 12:49:29 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Chris Lew <quic_clew@quicinc.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
	Bjorn Andersson <quic_bjorande@quicinc.com>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Handle GLINK intent
 allocation rejections
Message-ID: <b7jydfdsyhn4xhrydsxmjayzvp3t3rwwrgnb45jzektbhotlmm@4czvpsdsjv4f>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
 <20241023-pmic-glink-ecancelled-v2-2-ebc268129407@oss.qualcomm.com>
 <ZxnrnY0rMQRWmUtd@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxnrnY0rMQRWmUtd@hovoldconsulting.com>

On Thu, Oct 24, 2024 at 08:39:25AM GMT, Johan Hovold wrote:
> On Wed, Oct 23, 2024 at 05:24:33PM +0000, Bjorn Andersson wrote:
> > Some versions of the pmic_glink firmware does not allow dynamic GLINK
> > intent allocations, attempting to send a message before the firmware has
> > allocated its receive buffers and announced these intent allocations
> > will fail.
> 
> > Retry the send until intent buffers becomes available, or an actual
> > error occur.
> 
> > Reported-by: Johan Hovold <johan@kernel.org>
> > Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
> > Cc: stable@vger.kernel.org # rpmsg: glink: Handle rejected intent request better
> > Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> > Tested-by: Johan Hovold <johan+linaro@kernel.org>
> > Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> Thanks for the update. Still works as intended here.
> 

Thanks for the confirmation.

> >  int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
> >  {
> >  	struct pmic_glink *pg = client->pg;
> > +	bool timeout_reached = false;
> > +	unsigned long start;
> >  	int ret;
> >  
> >  	mutex_lock(&pg->state_lock);
> > -	if (!pg->ept)
> > +	if (!pg->ept) {
> >  		ret = -ECONNRESET;
> > -	else
> > -		ret = rpmsg_send(pg->ept, data, len);
> > +	} else {
> > +		start = jiffies;
> > +		for (;;) {
> > +			ret = rpmsg_send(pg->ept, data, len);
> > +			if (ret != -EAGAIN)
> > +				break;
> > +
> > +			if (timeout_reached) {
> > +				ret = -ETIMEDOUT;
> > +				break;
> > +			}
> > +
> > +			usleep_range(1000, 5000);
> 
> I ran some quick tests of this patch this morning (reproducing the issue
> five times), and with the above delay it seems a single resend is
> enough. Dropping the delay I once hit:
> 
> [    8.723479] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.723877] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.723921] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.723951] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.723981] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.724010] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> [    8.724046] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
> 
> which seems to suggest that a one millisecond sleep is sufficient for
> the currently observed issue.
> 
> It would still mean up to 5k calls if you ever try to send a too large
> buffer or similar and spin here for five seconds however. Perhaps
> nothing to worry about at this point, but increasing the delay or
> lowering the timeout could be considered.
> 

I did consider this as well, but this code-path is specific to
pmic-glink, so we shouldn't have any messages of size unexpected to the
other side...

If we do, then let's fix that. If I'm wrong in my assumptions, I'd be
happy to see this corrected, without my arbitrarily chosen timeout
values.

Thanks,
Bjorn

> > +			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
> > +		}
> > +	}
> >  	mutex_unlock(&pg->state_lock);
> >  
> >  	return ret;
> 
> Johan

