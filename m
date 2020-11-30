Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F3052C8FEE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 22:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729351AbgK3VX1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 16:23:27 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:37669 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729334AbgK3VX0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 16:23:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606771381; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jNW1t6Se5Ktv+ohrHgjF3LLGgAEq4iiGmKww3uVyBZQ=;
 b=l7akcEPm1UGFCIRMt/q3djL83H28GuOtco02iG8iWNFi8kFQWt1YYS+pp3lxZT0mvABOV0nV
 ofOEW/zeb7wv8mBV7q1bI76R2WMOM93XVOKJtVlWaJyzH4ciZC69O/3hjf8ozQ8lzuUnK2ZY
 gU41fxZOwPDGm+q4MtTftEwxLM4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5fc5629951762b188667f332 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 21:22:33
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 85142C43463; Mon, 30 Nov 2020 21:22:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81D48C433C6;
        Mon, 30 Nov 2020 21:22:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 30 Nov 2020 13:22:31 -0800
From:   abhinavk@codeaurora.org
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Lee Jones <lee.jones@linaro.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] msm/mdp5: Fix some kernel-doc warnings
In-Reply-To: <20201129181243.1091742-1-robdclark@gmail.com>
References: <20201129181243.1091742-1-robdclark@gmail.com>
Message-ID: <2a4ac82e8f904e2b8aeee0d6718a1ac0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-11-29 10:12, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'ctl' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'pipeline' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'enabled' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess
> function parameter 'enable' description in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'ctl' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'start' not described in 'mdp5_ctl_commit'
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> index 030279d7b64b..81b0c7cf954e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> @@ -216,7 +216,9 @@ static void send_start_signal(struct mdp5_ctl *ctl)
>  /**
>   * mdp5_ctl_set_encoder_state() - set the encoder state
>   *
> - * @enable: true, when encoder is ready for data streaming; false, 
> otherwise.
> + * @ctl:      the CTL instance
> + * @pipeline: the encoder's INTF + MIXER configuration
> + * @enabled:  true, when encoder is ready for data streaming; false, 
> otherwise.
>   *
>   * Note:
>   * This encoder state is needed to trigger START signal (data path 
> kickoff).
> @@ -510,6 +512,13 @@ static void fix_for_single_flush(struct mdp5_ctl
> *ctl, u32 *flush_mask,
>  /**
>   * mdp5_ctl_commit() - Register Flush
>   *
> + * @ctl:        the CTL instance
> + * @pipeline:   the encoder's INTF + MIXER configuration
> + * @flush_mask: bitmask of display controller hw blocks to flush
> + * @start:      if true, immediately update flush registers and set 
> START
> + *              bit, otherwise accumulate flush_mask bits until we are
> + *              ready to START
> + *
>   * The flush register is used to indicate several registers are all
>   * programmed, and are safe to update to the back copy of the double
>   * buffered registers.
