Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA9052A8EE3
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 06:28:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725837AbgKFF2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 00:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbgKFF2T (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 00:28:19 -0500
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB46C0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 21:28:19 -0800 (PST)
Received: by mail-pf1-x443.google.com with SMTP id o129so282668pfb.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 21:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=OOcN4BNPyXTHMSpm63hO7cTUf2XQEv3jCKsUPwLNmug=;
        b=Y7ZgkhOdLrtV1Enu9riK+1TBgAX/8eIKbJV674tYALCyHuSr3JuSMCZ4mnrT6jVgRo
         DT2WqYENUNwCv57p2yjgNjdKakdLuxs71Cu0Plx+UQiL9E/ATJgbT36imJUlWEnaoRM0
         By/oIoUovsdds0grG2Cp65+SVGu6GS4M8WQLWIqaBiqWQJvYIph61SLgmeWgx6HR2KVg
         d57bbpIvNDAo5cxv5jqb0xPgboTwnSveNPN4HJGbx8ouM4dRiG2vMZ8+oqCo/XHVX2Tn
         Gi2+kbKZQCq4A6sZRS0B1cqgd6U4S3pg691zMIlGtkE3rkuLF9oh9QIahqiV5HaGWXQn
         h6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OOcN4BNPyXTHMSpm63hO7cTUf2XQEv3jCKsUPwLNmug=;
        b=m+R1BLI8iOR5gR1kLFbXKTjemv0LrgGbQtRqLBqwfonHKxzuf9ennqUdqT9lN5AV0U
         4wMkr5Y2eWqyBHxMIp3ZPkQrQHnZ/duVwWNwS/Aia6XOt+gvATP/ICcK9tjA39b6ZlDp
         EVSKarTjnIMWQF7x3RGCHlciDuOTPPhwVJJLoTKVbWVV1+agayfy30pnQQ113WMFLjbW
         G+R5JC5VB4OSMBbEe0gdEHYlRZz5e9bhDuYUPWEU1EcYu1ds3BzS6XbqBLHqRne9mWAg
         YEzflow8nNXlSrMJGKf9SzJpNypHZWA6F4gu9hM1GMrVVx9zOEK66kEZNmygbxHKuaVz
         y+aQ==
X-Gm-Message-State: AOAM531m+kpLrkIZjEr16y+2PXorgUXY2ATpqkFvpJVJipOz8fEin07q
        XAndTEL05rO91X2+ewmFdkWzJSe3LsvR
X-Google-Smtp-Source: ABdhPJxtFmNzir+/fBNbA0FwQt9/9e+PN/h3yB4p8sIGlYA0K54jZhwVe95wtODJMNVpHK1rTUgRCg==
X-Received: by 2002:a62:2c16:0:b029:15d:8d2:2e6d with SMTP id s22-20020a622c160000b029015d08d22e6dmr492985pfs.52.1604640498801;
        Thu, 05 Nov 2020 21:28:18 -0800 (PST)
Received: from work ([103.59.133.81])
        by smtp.gmail.com with ESMTPSA id k25sm426009pfi.42.2020.11.05.21.28.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2020 21:28:18 -0800 (PST)
Date:   Fri, 6 Nov 2020 10:58:12 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/6] bus: mhi: core: Add missing EXPORT_SYMBOL for
 mhi_get_mhi_state()
Message-ID: <20201106052812.GC3473@work>
References: <1604622869-40212-1-git-send-email-bbhatt@codeaurora.org>
 <1604622869-40212-3-git-send-email-bbhatt@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604622869-40212-3-git-send-email-bbhatt@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Nov 05, 2020 at 04:34:25PM -0800, Bhaumik Bhatt wrote:
> Add missing EXPORT_SYMBOL_GPL() declaration for mhi_get_mhi_state()
> API.
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/bus/mhi/core/main.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 2cff5dd..778897e 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -132,6 +132,7 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl)
>  				     MHISTATUS_MHISTATE_SHIFT, &state);
>  	return ret ? MHI_STATE_MAX : state;
>  }
> +EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>  
>  int mhi_map_single_no_bb(struct mhi_controller *mhi_cntrl,
>  			 struct mhi_buf_info *buf_info)
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
