Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7690A735702
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 14:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229683AbjFSMkx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 08:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229636AbjFSMkx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 08:40:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50625D7;
        Mon, 19 Jun 2023 05:40:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C46DB60BFF;
        Mon, 19 Jun 2023 12:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 216BFC433C9;
        Mon, 19 Jun 2023 12:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687178451;
        bh=fHn3j7JDGruB0b35e3ystzKwAQyitAIm+XUJzpDo7XE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=c3MrkHD6pLv16fyMdny0V4Wy295aYVx4hBpchrDdzMvuLvh5YHOX5BHGBgySo1Zck
         kWVvk4Hg1J0FADnVQdOKvl3rg9BJCSmax2gnX8yieO0ZKv4TyEwuEccyV2KFdxACK+
         C0IlNF5AR7je0biR7hsbVNmdjTnDqiKafFi8LzjsWomc5Ykw/GSe/EMVhln3bI/nhC
         OfelTxUdfEgArRZ4GEwwtS2G1+KECW906oVr6S7WwrEXgQvWbwKOfxapxQWSfo2ZxR
         cGfAzUd2I9LikC2FfPi/KQEeArCa4cIc3eRSR7ccUlnEOHfsnfM85FysCp2KC7BkVQ
         SBPA2QC7T00QA==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1qBEBc-00015W-Ar; Mon, 19 Jun 2023 14:40:48 +0200
Date:   Mon, 19 Jun 2023 14:40:48 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Polimera <quic_vpolimer@quicinc.com>,
        Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dp: Drop aux devices together with DP controller
Message-ID: <ZJBM0E0vfeLXCw0W@hovoldconsulting.com>
References: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612220106.1884039-1-quic_bjorande@quicinc.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 12, 2023 at 03:01:06PM -0700, Bjorn Andersson wrote:
> Using devres to depopulate the aux bus made sure that upon a probe
> deferral the EDP panel device would be destroyed and recreated upon next
> attempt.
> 
> But the struct device which the devres is tied to is the DPUs
> (drm_dev->dev), which may be happen after the DP controller is torn
> down.

There appears to be some words missing in this sentence.
 
> Indications of this can be seen in the commonly seen EDID-hexdump full
> of zeros in the log,

This could happen also when the aux bus lifetime was tied to DP
controller and is mostly benign as dp_aux_deinit() set the "initted"
flag to false.

> or the occasional/rare KASAN fault where the
> panel's attempt to read the EDID information causes a use after free on
> DP resources.

But this is clearly a bug as there's a small window where the aux bus
struct holding the above flag may also have been released...

> It's tempting to move the devres to the DP controller's struct device,
> but the resources used by the device(s) on the aux bus are explicitly
> torn down in the error path. The KASAN-reported use-after-free also
> remains, as the DP aux "module" explicitly frees its devres-allocated
> memory in this code path.

Right, and this would also not work as the aux bus could remain
populated for the next bind attempt which would then fail (as described
in the commit message of the offending commit).

> As such, explicitly depopulate the aux bus in the error path, and in the
> component unbind path, to avoid these issues.

Sounds good.

> Fixes: 2b57f726611e ("drm/msm/dp: fix aux-bus EP lifetime")

This one should also have a stable tag:

Cc: stable@vger.kernel.org      # 5.19

> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 14 +++-----------
>  1 file changed, 3 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3d8fa2e73583..bbb0550a022b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -322,6 +322,8 @@ static void dp_display_unbind(struct device *dev, struct device *master,
>  
>  	kthread_stop(dp->ev_tsk);
>  
> +	of_dp_aux_depopulate_bus(dp->aux);

This may now be called without first having populated the bus, but looks
like that still works.

> +
>  	dp_power_client_deinit(dp->power);
>  	dp_unregister_audio_driver(dev, dp->audio);
>  	dp_aux_unregister(dp->aux);

I know this one was merged while I was out-of-office last week, but for
the record:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Johan
