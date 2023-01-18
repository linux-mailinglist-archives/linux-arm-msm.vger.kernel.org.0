Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1C01672637
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 19:04:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230390AbjARSER (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 13:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230134AbjARSDt (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 13:03:49 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11F8C3B672;
        Wed, 18 Jan 2023 10:01:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 206F4CE1E40;
        Wed, 18 Jan 2023 18:01:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48D8C433F0;
        Wed, 18 Jan 2023 18:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674064896;
        bh=gvRzqX5c+28PmnZhvOtWcJ7GQGOihNbrABlCgVGDkD4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fiiZICdzsthqKSjk5ftb3bEMraUciIgjR59ZXXX89tGKCO8JXSIhzUWq6ZpdYcqOY
         7sD0irlFK0ZFpoNZwpzsInWQCRJuYuxgUuXgZULubUHW7OtECM4Kpmfj5NC3DNTsCn
         bnN5VnPsO4JEQSxiNgels1/gdkwgpDQQINuG09Wxomf8j/vQMFQ7GXE2qpNiQs29BW
         tKFO8D+HJqXty4NtpLT4yCdjo/I9PLAdiVJq2QlDgom7wogRbt4fzIcqN38GL+6BRC
         LuRPMzsuLb8PoExB+TG/POspTgewZXxp9w8pDmwMd4ZTe8QBwams4Jtju/LARlM9XZ
         KfZ2Q8rpC+rwA==
Date:   Wed, 18 Jan 2023 12:01:33 -0600
From:   Bjorn Andersson <andersson@kernel.org>
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Chris Lew <quic_clew@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH] rpmsg: qcom: glink: support waking up on channel rx
Message-ID: <20230118180133.vdfjkoxjb3hhdkjk@builder.lan>
References: <20230117142414.983946-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117142414.983946-1-caleb.connolly@linaro.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 17, 2023 at 02:24:13PM +0000, Caleb Connolly wrote:
> Configure all channels as wakeup capable and report a wakeup event
> when data is received.
> 
> This allows userspace to "subscribe" to a particular channel where
> it is useful to wake up to process new data. The expected usecase
> is to allow for handling incoming SMS or phone calls where the only
> notification mechanism is via QRTR on the IPCRTR glink channel.
> 
> As this behaviour is likely undesirable for most users, this patch
> doesn't enable a wakeup_source for any channels by default.
> 

This looks reasonable to me.

One suggestion that came up as we discussed this problem (elsewhere) a
while ago was the idea of using EPOLLWAKEUP to control the wakeup source
on a per-socket basis.

Would that suite your userspace?

Regards,
Bjorn

> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  drivers/rpmsg/qcom_glink_native.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/rpmsg/qcom_glink_native.c b/drivers/rpmsg/qcom_glink_native.c
> index 115c0a1eddb1..1a96a7ae23bb 100644
> --- a/drivers/rpmsg/qcom_glink_native.c
> +++ b/drivers/rpmsg/qcom_glink_native.c
> @@ -914,6 +914,9 @@ static int qcom_glink_rx_data(struct qcom_glink *glink, size_t avail)
>  		channel->buf = NULL;
>  
>  		qcom_glink_rx_done(glink, channel, intent);
> +
> +		pm_wakeup_ws_event(channel->ept.rpdev->dev.power.wakeup, 0,
> +				   true);
>  	}
>  
>  advance_rx:
> @@ -1510,6 +1513,17 @@ static int qcom_glink_rx_open(struct qcom_glink *glink, unsigned int rcid,
>  		if (ret)
>  			goto rcid_remove;
>  
> +		/*
> +		 * Declare all channels as wakeup capable, but don't enable
> +		 * waking up by default.
> +		 *
> +		 * Userspace may wish to be woken up for incoming messages on a
> +		 * specific channel, for example to handle incoming calls or SMS
> +		 * messages on the IPCRTR channel. This can be done be enabling
> +		 * the wakeup source via sysfs.
> +		 */
> +		device_set_wakeup_capable(&rpdev->dev, true);
> +
>  		channel->rpdev = rpdev;
>  	}
>  
> -- 
> 2.39.0
> 
