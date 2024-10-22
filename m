Return-Path: <linux-arm-msm+bounces-35437-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D81279AB229
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 17:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 054CB1C22790
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 15:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5B91B5EBC;
	Tue, 22 Oct 2024 15:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tp/B7uOv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9AC1A726D;
	Tue, 22 Oct 2024 15:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729611045; cv=none; b=U3eX/ai4C5OoPuarVyHTI0DfPIor+fD3LS5gFjGl4HuEPo5HwtA78c9n6VnMUMMkrsv47KhVqmB8VhwatVSNaeV6Nfx9NA2YTSSKCXJ/hTNecsBGaENz3CABKEZd07H7AfG7/Bv4hKs1wxfOtmQdYlQOXREeoORAbII4GIZiWf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729611045; c=relaxed/simple;
	bh=QaeEqdPFz3BRmov/AvOyAXOEIdoSrRqhJFtqE3JLuAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyc9rVW4WCU8TMbUnXieifkoP0MAa5dXIwSdrnJxKK8OP8ke0kfiwa8cjbJKsRR0QXBUGWoEArPuPTZOIrtotT7hKvm3QSkFF0FHbs5R2AbsqAjLLPPmblbWjaCH+Swp7RhOhRt8FPcJI0JdXB+WzXTQudUvYC/SJKotnWCvGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tp/B7uOv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865BEC4CEE7;
	Tue, 22 Oct 2024 15:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729611044;
	bh=QaeEqdPFz3BRmov/AvOyAXOEIdoSrRqhJFtqE3JLuAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tp/B7uOvvqVfphlIu5iRNu1Iqlkcy0OL/bvfWQsx4L9Ex2c180NZSD9NMHz+PfBjJ
	 wYWXq5pPpDQfQqy12cmgLElrZBfhTyBbQUFEhknHsyImQGdZRcAPkTI6zFBg0PBunG
	 A7Non5gcw9RviSwYgu3Dsjp0t/XCrn3447Aona4R4yBmRIAodpM8fEURBOG7RQRYMv
	 3LDJRpej4HS8B6hLP88B/5QnnotwzBMNjAizpONd97Qzk3OaQlz1qty4wDYYnPi7th
	 tKPEvDxV6ifNSWKPQ45PuDaodebiLYPmFQ/ty/Z7qen7lFZgU3zF2ZbLGDE00rC3PH
	 j/kxGPNlnJ8Jw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t3GqV-000000001By-4ABf;
	Tue, 22 Oct 2024 17:30:56 +0200
Date: Tue, 22 Oct 2024 17:30:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Chris Lew <quic_clew@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: Handle GLINK intent
 allocation rejections
Message-ID: <ZxfFL8eVs5lYCPum@hovoldconsulting.com>
References: <20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com>
 <20241022-pmic-glink-ecancelled-v1-2-9e26fc74e0a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-pmic-glink-ecancelled-v1-2-9e26fc74e0a3@oss.qualcomm.com>

On Tue, Oct 22, 2024 at 04:17:12AM +0000, Bjorn Andersson wrote:
> Some versions of the pmic_glink firmware does not allow dynamic GLINK
> intent allocations, attempting to send a message before the firmware has
> allocated its receive buffers and announced these intent allocations
> will fail. When this happens something like this showns up in the log:
> 
> 	[    9.799719] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to send altmode request: 0x10 (-125)
> 	[    9.812446] pmic_glink_altmode.pmic_glink_altmode pmic_glink.altmode.0: failed to request altmode notifications: -125
> 	[    9.831796] ucsi_glink.pmic_glink_ucsi pmic_glink.ucsi.0: failed to send UCSI read request: -125

I think you should drop the time stamps here, and also add the battery
notification error to make the patch easier to find when searching for
these errors:

	qcom_battmgr.pmic_glink_power_supply pmic_glink.power-supply.0: failed to request power notifications

> GLINK has been updated to distinguish between the cases where the remote
> is going down (-ECANCELLED) and the intent allocation being rejected
> (-EAGAIN).
> 
> Retry the send until intent buffers becomes available, or an actual
> error occur.
> 
> To avoid infinitely waiting for the firmware in the event that this
> misbehaves and no intents arrive, an arbitrary 10 second timeout is
> used.
> 
> This patch was developed with input from Chris Lew.
> 
> Reported-by: Johan Hovold <johan@kernel.org>
> Closes: https://lore.kernel.org/all/Zqet8iInnDhnxkT9@hovoldconsulting.com/#t

This indeed seems to fix the -ECANCELED related errors I reported above,
but the audio probe failure still remains as expected:

	PDR: avs/audio get domain list txn wait failed: -110
	PDR: service lookup for avs/audio failed: -110

I hit it on the third reboot and then again after another 75 reboots
(and have never seen it with the user space pd-mapper over several
hundred boots).

Do you guys have any theories as to what is causing the above with the
in-kernel pd-mapper (beyond the obvious changes in timing)?

> Cc: stable@vger.kernel.org

Can you add a Fixes tag here?

This patch depends on the former, but that is not necessarily obvious
for someone backporting this (and the previous patch is only going to be
backported to 6.4).

Perhaps you can use the stable tag dependency annotation or even mark
the previous patch so that it is backported far enough.

> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Tested-by: Johan Hovold <johan+linaro@kernel.org>
	
> ---
>  drivers/soc/qcom/pmic_glink.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/pmic_glink.c b/drivers/soc/qcom/pmic_glink.c
> index 9606222993fd78e80d776ea299cad024a0197e91..221639f3da149da1f967dbc769a97d327ffd6c63 100644
> --- a/drivers/soc/qcom/pmic_glink.c
> +++ b/drivers/soc/qcom/pmic_glink.c
> @@ -13,6 +13,8 @@
>  #include <linux/soc/qcom/pmic_glink.h>
>  #include <linux/spinlock.h>
>  
> +#define PMIC_GLINK_SEND_TIMEOUT (10*HZ)

nit: spaces around *

Ten seconds seems a little excessive; are there any reasons for not
picking something shorter like 5 s (also used by USB but that comes from
spec)?

> +
>  enum {
>  	PMIC_GLINK_CLIENT_BATT = 0,
>  	PMIC_GLINK_CLIENT_ALTMODE,
> @@ -112,13 +114,23 @@ EXPORT_SYMBOL_GPL(pmic_glink_client_register);
>  int pmic_glink_send(struct pmic_glink_client *client, void *data, size_t len)
>  {
>  	struct pmic_glink *pg = client->pg;
> +	unsigned long start;
> +	bool timeout_reached = false;

No need to initialise.

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
> +		do {
> +			timeout_reached = time_after(jiffies, start + PMIC_GLINK_SEND_TIMEOUT);
> +			ret = rpmsg_send(pg->ept, data, len);

Add a delay here to avoid hammering the remote side with requests in a
tight loop for 10 s?

> +		} while (ret == -EAGAIN && !timeout_reached);
> +
> +		if (ret == -EAGAIN && timeout_reached)
> +			ret = -ETIMEDOUT;
> +	}
>  	mutex_unlock(&pg->state_lock);
>  
>  	return ret;

Looks good to me otherwise: 

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>

Johan

