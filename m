Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405B644BA08
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 02:43:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbhKJBqZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Nov 2021 20:46:25 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:54161 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhKJBqZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Nov 2021 20:46:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636508618; x=1668044618;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=sw54K/SWEgyU/PILOHMJkEGdQgNQqIYwhTc3smmV7CQ=;
  b=p0nOEZzHczUNvL0rMDXI4rgn6yQVX/x4q1+2eynIFx4WsCYfgmwN2pEp
   XCV+ba+ttjBvG1v/32X8lbLhArS6z2Y7gLsN23YUYLeH/N5Wk+ywAZUh3
   K1/r8/8OkKl1UU7KQo8b6yDL72+vfnBJdPlWscQ3TeTGy9V10e9Bmikij
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 09 Nov 2021 17:43:38 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2021 17:43:37 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Tue, 9 Nov 2021 17:43:37 -0800
Received: from [10.38.246.189] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7; Tue, 9 Nov 2021
 17:43:35 -0800
Message-ID: <8d29f45e-c703-83a1-799e-c708b9f1f7b7@quicinc.com>
Date:   Tue, 9 Nov 2021 17:43:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Avoid unpowered AUX xfers that
 caused crashes
Content-Language: en-US
To:     Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>
CC:     David Airlie <airlied@linux.ie>, <freedreno@lists.freedesktop.org>,
        <dri-devel@lists.freedesktop.org>,
        Stephen Boyd <swboyd@chromium.org>,
        "Kuogee Hsieh" <khsieh@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        <linux-arm-msm@vger.kernel.org>, Sean Paul <sean@poorly.run>,
        <linux-kernel@vger.kernel.org>
References: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
From:   Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20211109100403.1.I4e23470d681f7efe37e2e7f1a6466e15e9bb1d72@changeid>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Doug

On 11/9/2021 10:04 AM, Douglas Anderson wrote:
> If you happened to try to access `/dev/drm_dp_aux` devices provided by
> the MSM DP AUX driver too early at bootup you could go boom. Let's
> avoid that by only allowing AUX transfers when the controller is
> powered up.
> 
> Specifically the crash that was seen (on Chrome OS 5.4 tree with
> relevant backports):
>    Kernel panic - not syncing: Asynchronous SError Interrupt
>    CPU: 0 PID: 3131 Comm: fwupd Not tainted 5.4.144-16620-g28af11b73efb #1
>    Hardware name: Google Lazor (rev3+) with KB Backlight (DT)
>    Call trace:
>     dump_backtrace+0x0/0x14c
>     show_stack+0x20/0x2c
>     dump_stack+0xac/0x124
>     panic+0x150/0x390
>     nmi_panic+0x80/0x94
>     arm64_serror_panic+0x78/0x84
>     do_serror+0x0/0x118
>     do_serror+0xa4/0x118
>     el1_error+0xbc/0x160
>     dp_catalog_aux_write_data+0x1c/0x3c
>     dp_aux_cmd_fifo_tx+0xf0/0x1b0
>     dp_aux_transfer+0x1b0/0x2bc
>     drm_dp_dpcd_access+0x8c/0x11c
>     drm_dp_dpcd_read+0x64/0x10c
>     auxdev_read_iter+0xd4/0x1c4
> 
> I did a little bit of tracing and found that:
> * We register the AUX device very early at bootup.
> * Power isn't actually turned on for my system until
>    hpd_event_thread() -> dp_display_host_init() -> dp_power_init()
> * You can see that dp_power_init() calls dp_aux_init() which is where
>    we start allowing AUX channel requests to go through.
> 
> In general this patch is a bit of a bandaid but at least it gets us
> out of the current state where userspace acting at the wrong time can
> fully crash the system.
> * I think the more proper fix (which requires quite a bit more
>    changes) is to power stuff on while an AUX transfer is
>    happening. This is like the solution we did for ti-sn65dsi86. This
>    might be required for us to move to populating the panel via the
>    DP-AUX bus.
> * Another fix considered was to dynamically register / unregister. I
>    tried that at <https://crrev.com/c/3169431/3> but it got
>    ugly. Currently there's a bug where the pm_runtime() state isn't
>    tracked properly and that causes us to just keep registering more
>    and more.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
> 
>   drivers/gpu/drm/msm/dp/dp_aux.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index eb40d8413bca..6d36f63c3338 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -33,6 +33,7 @@ struct dp_aux_private {
>   	bool read;
>   	bool no_send_addr;
>   	bool no_send_stop;
> +	bool initted;
>   	u32 offset;
>   	u32 segment;
>   
> @@ -331,6 +332,10 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   	}
>   
>   	mutex_lock(&aux->mutex);
> +	if (!aux->initted) {
> +		ret = -EIO;
> +		goto exit;
> +	}
>   
>   	dp_aux_update_offset_and_segment(aux, msg);
>   	dp_aux_transfer_helper(aux, msg, true);
> @@ -380,6 +385,8 @@ static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
>   	}
>   
>   	aux->cmd_busy = false;
> +
> +exit:
>   	mutex_unlock(&aux->mutex);
>   
>   	return ret;
> @@ -431,8 +438,13 @@ void dp_aux_init(struct drm_dp_aux *dp_aux)
>   
>   	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>   
> +	mutex_lock(&aux->mutex);
> +
>   	dp_catalog_aux_enable(aux->catalog, true);
>   	aux->retry_cnt = 0;
> +	aux->initted = true;
> +
> +	mutex_unlock(&aux->mutex);
>   }
>   
>   void dp_aux_deinit(struct drm_dp_aux *dp_aux)
> @@ -441,7 +453,12 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>   
>   	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
>   
> +	mutex_lock(&aux->mutex);
> +
> +	aux->initted = false;
>   	dp_catalog_aux_enable(aux->catalog, false);
> +
> +	mutex_unlock(&aux->mutex);
>   }
>   
>   int dp_aux_register(struct drm_dp_aux *dp_aux)
> 
