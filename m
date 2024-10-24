Return-Path: <linux-arm-msm+bounces-35646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A27B9ADC52
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:39:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3499A284240
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 06:39:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72D2A187844;
	Thu, 24 Oct 2024 06:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TCp2vLs5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42294166F14;
	Thu, 24 Oct 2024 06:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729751951; cv=none; b=WAxYigtGCwLdcXoUf/He5MDVJvTtlfYg1xGa94urphUSarSEFh+HFysNwTEV5dBQLbMHiyIFqLrd3oylFRsCNMelA4Qh0E/KhZ2FHxIt9NJpab9icNWYz6p9wIH3E9k32wpI4i1aL7wSFhRdn745OemkbhanmwQxRK2Tixy3CZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729751951; c=relaxed/simple;
	bh=2bKNDUAIZb9oWcPV045oHohhSfP4ZSl2w1vDelsLi/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aYglnzkEykd/OiIZa4ksASQEbaX0lmqMcEc3n9VGRzvc6Xtt4kaP1Wva1zTuZBqoAxdS75yy4NBfvWNTv8lmgs45XKzNDnCLcGdBKlbaJXEsKXu6wF8EWarRT3fg/eRlQvHOtB5gZsCs665iM9P5GJxf/CPj3Rv8snopfN8hfyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TCp2vLs5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7442C4CEC7;
	Thu, 24 Oct 2024 06:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729751950;
	bh=2bKNDUAIZb9oWcPV045oHohhSfP4ZSl2w1vDelsLi/M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCp2vLs5JAPN1xc73whYor8p7xoe1OI/+7A0yu2fQ0V+qsJZ55q/lgnhFszmJG6Xq
	 N6zkGogRJMIw4Ad1K3N6XYu3R/Y/GXe4RmvQKzbPuITSjpA9rr7MMMlnd9t/1oxG9A
	 p/fxjynbVpiONjmYwiAi2AL/jhdW+J3nFBDZ7SSiDDtK0ZgaCq+9hQ9eX4LWbSx7Yc
	 sfjV2T4robg+OAZ+K28yRgyMAphT6hhG4ck/2h4NF74FqXryYydY4aj5sjo5yyk366
	 DDPHlADIenAenoPs34Q0CPB3MAggufBbpJANXCSLhH7Q3chr1sI5bju+0iwOBbeJsQ
	 JgOF5w4q8KaYg==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3rVF-000000006Mw-1vvY;
	Thu, 24 Oct 2024 08:39:25 +0200
Date: Thu, 24 Oct 2024 08:39:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH v2 2/2] soc: qcom: pmic_glink: Handle GLINK intent
 allocation rejections
Message-ID: <ZxnrnY0rMQRWmUtd@hovoldconsulting.com>
References: <20241023-pmic-glink-ecancelled-v2-0-ebc268129407@oss.qualcomm.com>
 <20241023-pmic-glink-ecancelled-v2-2-ebc268129407@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241023-pmic-glink-ecancelled-v2-2-ebc268129407@oss.qualcomm.com>

On Wed, Oct 23, 2024 at 05:24:33PM +0000, Bjorn Andersson wrote:
> Some versions of the pmic_glink firmware does not allow dynamic GLINK
> intent allocations, attempting to send a message before the firmware has
> allocated its receive buffers and announced these intent allocations
> will fail.

> Retry the send until intent buffers becomes available, or an actual
> error occur.

> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t
> Cc: stable@vger.kernel.org # rpmsg: glink: Handle rejected intent request better
> Fixes: 58ef4ece1e41 ("soc: qcom: pmic_glink: Introduce base PMIC GLINK driver")
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Thanks for the update. Still works as intended here.

>  int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
>  {
>  	struct pmic_glink *pg = client->pg;
> +	bool timeout_reached = false;
> +	unsigned long start;
>  	int ret;
>  
>  	mutex_lock(&pg->state_lock);
> -	if (!pg->ept)
> +	if (!pg->ept) {
>  		ret = -ECONNRESET;
> -	else
> -		ret = rpmsg_send(pg->ept, data, len);
> +	} else {
> +		start = jiffies;
> +		for (;;) {
> +			ret = rpmsg_send(pg->ept, data, len);
> +			if (ret != -EAGAIN)
> +				break;
> +
> +			if (timeout_reached) {
> +				ret = -ETIMEDOUT;
> +				break;
> +			}
> +
> +			usleep_range(1000, 5000);

I ran some quick tests of this patch this morning (reproducing the issue
five times), and with the above delay it seems a single resend is
enough. Dropping the delay I once hit:

[    8.723479] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.723877] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.723921] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.723951] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.723981] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.724010] qcom_pmic_glink pmic-glink: pmic_glink_send - resend
[    8.724046] qcom_pmic_glink pmic-glink: pmic_glink_send - resend

which seems to suggest that a one millisecond sleep is sufficient for
the currently observed issue.

It would still mean up to 5k calls if you ever try to send a too large
buffer or similar and spin here for five seconds however. Perhaps
nothing to worry about at this point, but increasing the delay or
lowering the timeout could be considered.

> +			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
> +		}
> +	}
>  	mutex_unlock(&pg->state_lock);
>  
>  	return ret;

Johan

