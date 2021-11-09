Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3E9544B8F1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Nov 2021 23:47:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243179AbhKIWuN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 17:50:13 -0500
Received: from m43-7.mailgun.net ([69.72.43.7]:58009 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242214AbhKIWsz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 17:48:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1636497967; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=v9VczQnFx9xswdyxP7IiTRh0CLZMg/o04Xjcgs+tOZg=;
 b=eOlkCxCPWn5JCgkiPkxpCly3ImHXfYjlv0Bp/168CJetAmxzTdSrQs4txF1zdrhmTS8NAAlk
 Y4cZRDPH9U8yiXUn649/9rJAL9Q7wU3254FfBvtBdEfV7bMeRyr5mi7xfTjdrbuLCcjOLIWW
 7TB6qtYprjdKryvK9u87gewvtfI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 618afa2f332b6b6db47227ed (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Nov 2021 22:46:07
 GMT
Sender: khsieh=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 44DD0C37A20; Tue,  9 Nov 2021 22:46:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: khsieh)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F11E3C359EE;
        Tue,  9 Nov 2021 22:46:01 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 09 Nov 2021 14:46:01 -0800
From:   khsieh@codeaurora.org
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Avoid unpowered AUX xfers that caused crashes
In-Reply-To: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
References: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
Message-ID: <bc63c12983fd05bfb97e9a2ce00b0bd6@codeaurora.org>
X-Sender: khsieh@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-11-09 10:04, Douglas Anderson wrote:
> If you happened to try to access `/dev/drm_dp_aux` devices provided by
> the MSM DP AUX driver too early at bootup you could go boom. Let's
> avoid that by only allowing AUX transfers when the controller is
> powered up.
> 
> Specifically the crash that was seen (on Chrome OS 5.4 tree with
> relevant backports):
>   Kernel panic - not syncing: Asynchronous SError Interrupt
>   CPU: 0 PID: 3131 Comm: fwupd Not tainted 5.4.144-16620-g28af11b73efb 
> #1
>   Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>   Call trace:
>    dump_backtrace+0x0/0x14c
>    show_stack+0x20/0x2c
>    dump_stack+0xac/0x124
>    panic+0x150/0x390
>    nmi_panic+0x80/0x94
>    arm64_serror_panic+0x78/0x84
>    do_serror+0x0/0x118
>    do_serror+0xa4/0x118
>    el1_error+0xbc/0x160
>    dp_catalog_aux_write_data+0x1c/0x3c
>    dp_aux_cmd_fifo_tx+0xf0/0x1b0
>    dp_aux_transfer+0x1b0/0x2bc
>    drm_dp_dpcd_access+0x8c/0x11c
>    drm_dp_dpcd_read+0x64/0x10c
>    auxdev_read_iter+0xd4/0x1c4
> 
> I did a little bit of tracing and found that:
> * We register the AUX device very early at bootup.
> * Power isn't actually turned on for my system until
>   hpd_event_thread() -> dp_display_host_init() -> dp_power_init()
> * You can see that dp_power_init() calls dp_aux_init() which is where
>   we start allowing AUX channel requests to go through.
> 
> In general this patch is a bit of a bandaid but at least it gets us
> out of the current state where userspace acting at the wrong time can
> fully crash the system.
> * I think the more proper fix (which requires quite a bit more
>   changes) is to power stuff on while an AUX transfer is
>   happening. This is like the solution we did for ti-sn65dsi86. This
>   might be required for us to move to populating the panel via the
>   DP-AUX bus.
> * Another fix considered was to dynamically register / unregister. I
>   tried that at <https://crrev.com/c/3169431/3> but it got
>   ugly. Currently there's a bug where the pm_runtime() state isn't
>   tracked properly and that causes us to just keep registering more
>   and more.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
Reviewed-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> 
>  drivers/gpu/drm/msm/dp/dp_aux.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c 
> b/drivers/gpu/drm/msm/dp/dp_aux.c
> index eb40d8413bca..6d36f63c3338 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -33,6 +33,7 @@ struct dp_aux_private {
>  	bool read;
>  	bool no_send_addr;
>  	bool no_send_stop;
> +	bool initted;
>  	u32 offset;
>  	u32 segment;
> 
> @@ -331,6 +332,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	}
> 
>  	mutex_lock(&aux->mutex);
> +	if (!aux->initted) {
> +		ret = -EIO;
> +		goto exit;
> +	}
> 
>  	dp_aux_update_offset_and_segment(aux, msg);
>  	dp_aux_transfer_helper(aux, msg, true);
> @@ -380,6 +385,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux 
> *dp_aux,
>  	}
> 
>  	aux->cmd_busy = false;
> +
> +exit:
>  	mutex_unlock(&aux->mutex);
> 
>  	return ret;
> @@ -431,8 +438,13 @@ void dp_aux_init(struct drm_dp_aux *dp_aux)
> 
>  	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
> +	mutex_lock(&aux->mutex);
> +
>  	dp_catalog_aux_enable(aux->catalog, true);
>  	aux->retry_cnt = 0;
> +	aux->initted = true;
> +
> +	mutex_unlock(&aux->mutex);
>  }
> 
>  void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> @@ -441,7 +453,12 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> 
>  	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> 
> +	mutex_lock(&aux->mutex);
> +
> +	aux->initted = false;
>  	dp_catalog_aux_enable(aux->catalog, false);
> +
> +	mutex_unlock(&aux->mutex);
>  }
> 
>  int dp_aux_register(struct drm_dp_aux *dp_aux)
