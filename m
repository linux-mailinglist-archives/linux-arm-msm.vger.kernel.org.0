Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3A922B4406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 13:52:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbgKPMuz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 07:50:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727165AbgKPMuy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 07:50:54 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F65C0613D1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:50:54 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id c66so14033209pfa.4
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2020 04:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7NVm9BvVBmYQCNgQQp74TAPMn1leWF3FM+2xta7hMuY=;
        b=jqyvXFfl+7++6tAN4nsmYV/Vt2ZGxvJTlGOaaEObz412JIHQQY68RJkBSqxaUclPRA
         ZaxiXY9MMjUW/WGriIlsiScJtBY4ygzFiY2VVJp9pV87f7306H+iM3dBrozfyl4+jIt/
         QqKreLaHrK7EIIx98mhDKzvYgg6enTpPX0XYNSDlgzShhbbydx+OiJuujcSf0xiAjQBB
         JzXvofs7vO5LvlIQiFlRVG2mUw8hX0f0oTvtIRfM0io5gGEy0JTaUwDXA4zcB9JEUg7m
         BUCQwq7sQdn0rnfd5glXYsaqmhtqyTY8Kql26/tQIRqDIUqTxF2h15GuiIi430m57rQl
         PsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7NVm9BvVBmYQCNgQQp74TAPMn1leWF3FM+2xta7hMuY=;
        b=O+TnhnpASWmKp8W4DJ6xDDAh9HehqjtyG6I6gj4LoYhi7+GTX4gk39Se7cChLoEH7e
         3yBxOCuZMOd7JmbsM4LTCPZwma28zqF07KZmdpU2N5NtCzSN1A34E6W1BTcYmw3lELYU
         389arEq1uwTU2zwkmSU4s3iU4w6tWEIgSTymqivvuSmRlm5YBCX7qqHSP/ziePbqnZeI
         PgqvnvJIBuYsZHDCuwqI3/2OIKr35dlbbBpeMH3EvW2QUyr0VK/gt2mvirzyV3m6uAl9
         KBFtM9Ox7eiSyXLMlIFIJqX8D5UanDusdJJP386OCOtzBfwc6Z6rsPMx1KdxxSP+/W3R
         CWRw==
X-Gm-Message-State: AOAM532/vmTbSlYoftTTD5/miA9bVfWs1H2qzFYqJmdO4//7s+i6gHMY
        ZwsFSTo+qGE5qjUk59/kUzdr
X-Google-Smtp-Source: ABdhPJyAd3BVLnbppj5wJg+HV0XFLwniSB69CJoXOJklFmzPByWfddmVxqOzbRzyy0eKopea8f0nwA==
X-Received: by 2002:a17:90a:e646:: with SMTP id ep6mr5281350pjb.218.1605531054291;
        Mon, 16 Nov 2020 04:50:54 -0800 (PST)
Received: from Mani-XPS-13-9360 ([2409:4072:618e:9b0a:75fd:1290:bf5c:a350])
        by smtp.gmail.com with ESMTPSA id w13sm18151680pfd.49.2020.11.16.04.50.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 04:50:53 -0800 (PST)
Date:   Mon, 16 Nov 2020 18:20:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] bus: mhi: Improve documentation on channel
 transfer setup APIs
Message-ID: <20201116125045.GM3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-7-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605122473-12179-7-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 11, 2020 at 11:21:13AM -0800, Bhaumik Bhatt wrote:
> The mhi_prepare_for_transfer() and mhi_unprepare_from_transfer()
> APIs could use better explanation, especially with the addition
> of two new APIs to start and stop the transfers on channels. Add
> better set of information for those APIs to avoid confusion going
> forward.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  include/linux/mhi.h | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index aee8494..ee9537f 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -690,13 +690,27 @@ int mhi_device_get_sync(struct mhi_device *mhi_dev);
>  void mhi_device_put(struct mhi_device *mhi_dev);
>  
>  /**
> - * mhi_prepare_for_transfer - Setup channel for data transfer
> + * mhi_prepare_for_transfer - Setup UL and DL channels for data transfer.
> + *                            Allocate and initialize the channel context and
> + *                            also issue the START channel command to both
> + *                            channels. Channels can be started only if both
> + *                            host and device execution environments match and
> + *                            channels are in a DISABLED state.

It'd be good if you can add a note about how this API differs from
mhi_start_transfer() API. The content says the difference but an explicit
comparision would be good.

Thanks,
Mani

>   * @mhi_dev: Device associated with the channels
>   */
>  int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>  
>  /**
> - * mhi_unprepare_from_transfer - Unprepare the channels
> + * mhi_unprepare_from_transfer - Reset UL and DL channels for data transfer.
> + *                               Issue the RESET channel command and let the
> + *                               device clean-up the context so no incoming
> + *                               transfers are seen on the host. Free memory
> + *                               associated with the context on host. If device
> + *                               is unresponsive, only perform a host side
> + *                               clean-up. Channels can be reset only if both
> + *                               host and device execution environments match
> + *                               and channels are in an ENABLED, STOPPED or
> + *                               SUSPENDED state.
>   * @mhi_dev: Device associated with the channels
>   */
>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
