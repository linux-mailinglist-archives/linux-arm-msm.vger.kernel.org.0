Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A111B0252
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Apr 2020 09:08:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbgDTHIi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Apr 2020 03:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726036AbgDTHIi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Apr 2020 03:08:38 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62365C061A0F
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 00:08:38 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id d17so4622931pgo.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Apr 2020 00:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZFTvUBniMnOgkrRExu5askOEdn96R/KVp3qePoAVn6U=;
        b=QKp98wB9GMSRtHLO5NspGdujoHvPoUeArRvvkQZr2iHLy5rnm4LVW8/987njYm9uhj
         JdeZIF+IFQadILVdklQ34vEfxMxFRlZ+xsueOVmhrbOoFfl4h/38xxUBEMNv15CQ/lfc
         0YcmiWPgfXx0hNh9lK6Xf/9jEaz3MNFxbRJaKE4g5CElwqlIlKTpG7FLmGbnX9y9HYGK
         Q47tO0EXlEHxfHI5DISKBTyaVg7E8FZK8+JSMcmyB6aRIKDVxCUHGGeZovcZXj42zfPD
         XcYHL/f1TZJLkNYj23KrDftSqzJLxjinXHWmiOqKjrQP6cYEzifWlPyeJCpmqu6as7Ek
         GSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZFTvUBniMnOgkrRExu5askOEdn96R/KVp3qePoAVn6U=;
        b=XdRGlp/KmE95XK1NMU725Denv7qWJIUxtM9ymDnNx0r1qsiKjAl/cszcwwNlPOqmC9
         SuTZcGVw7c6g5sdaXSPwtGSh0v4mUbWW0dv7PRoQaeWHzrEVHNRmQHS0/i9vEOmMv9qV
         WZgRJ6m1dIAcNXuzWMa/2tfFiKpJfo+eAG7uZ35LjjVYmkLpcDkOikJuEmgsTRKyxtuk
         1SZGF3sgsYMH2F32Dgf9QUnFlpppDoy5+hyaVTHy9KRBxfUaTUN6/J4lOJDLnfC9RGfs
         bPQlitlJmYJ1B59F9+cSlxtnqWR3DOP0Osh8VvAwYKdxn4eZ3YnvxlWHoPRZ0iq9NtSB
         KNKA==
X-Gm-Message-State: AGi0PuaGD5AcgVbWru56y939AWd0mNHFTSOwUHvqlITrSZ8uC/Iag3dB
        gIPg49qUGelgFgZnxdQD6UfPkw==
X-Google-Smtp-Source: APiQypJb89c9hh/371YTa+qpdFRvONkeP4flf7SsLuGDCOwnaS/cwCoXUnWr/fgyMSNCByoC6M5H4w==
X-Received: by 2002:a05:6a00:a:: with SMTP id h10mr9544646pfk.160.1587366517818;
        Mon, 20 Apr 2020 00:08:37 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x185sm166115pfx.155.2020.04.20.00.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 00:08:37 -0700 (PDT)
Date:   Mon, 20 Apr 2020 00:09:00 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Siddharth Gupta <sidgup@codeaurora.org>
Cc:     agross@kernel.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
Subject: Re: [PATCH v2 3/6] remoteproc: sysmon: Inform current rproc about
 all active rprocs
Message-ID: <20200420070900.GF1868936@builder.lan>
References: <1586389003-26675-1-git-send-email-sidgup@codeaurora.org>
 <1586389003-26675-4-git-send-email-sidgup@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1586389003-26675-4-git-send-email-sidgup@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Apr 16:36 PDT 2020, Siddharth Gupta wrote:

> Clients/services running on a remoteproc that booted up might need to be
> aware of the state of already running remoteprocs. When a remoteproc boots
> up (fresh or after recovery) it is not aware of the remoteprocs that booted
> before it, i.e., the system state is incomplete. So to keep track of it we
> send sysmon on behalf of all 'ONLINE' remoteprocs.
> 
> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/remoteproc/qcom_sysmon.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/remoteproc/qcom_sysmon.c b/drivers/remoteproc/qcom_sysmon.c
> index 851664e..8d8996d 100644
> --- a/drivers/remoteproc/qcom_sysmon.c
> +++ b/drivers/remoteproc/qcom_sysmon.c
> @@ -453,10 +453,20 @@ static int sysmon_prepare(struct rproc_subdev *subdev)
>  	return 0;
>  }
>  
> +/**
> + * sysmon_start() - start callback for the sysmon remoteproc subdevice
> + * @subdev:	instance of the sysmon subdevice
> + *
> + * Inform all the listners of sysmon notifications that the rproc associated
> + * to @subdev has booted up. The rproc that booted up also needs to know
> + * which rprocs are already up and running, so send start notifications
> + * on behalf of all the online rprocs.
> + */
>  static int sysmon_start(struct rproc_subdev *subdev)
>  {
>  	struct qcom_sysmon *sysmon = container_of(subdev, struct qcom_sysmon,
>  						  subdev);
> +	struct qcom_sysmon *target;
>  	struct sysmon_event event = {
>  		.subsys_name = sysmon->name,
>  		.ssr_event = SSCTL_SSR_EVENT_AFTER_POWERUP
> @@ -464,6 +474,21 @@ static int sysmon_start(struct rproc_subdev *subdev)
>  
>  	blocking_notifier_call_chain(&sysmon_notifiers, 0, (void *)&event);
>  
> +	mutex_lock(&sysmon_lock);
> +	list_for_each_entry(target, &sysmon_list, node) {
> +		if (target == sysmon ||
> +		    target->rproc->state != RPROC_RUNNING)
> +			continue;
> +
> +		event.subsys_name = target->name;
> +
> +		if (sysmon->ssctl_version == 2)
> +			ssctl_send_event(sysmon, &event);
> +		else if (sysmon->ept)
> +			sysmon_send_event(sysmon, &event);
> +	}
> +	mutex_unlock(&sysmon_lock);
> +
>  	return 0;
>  }
>  
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
