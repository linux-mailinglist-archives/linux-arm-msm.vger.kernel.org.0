Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA5C422205
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 11:19:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232773AbhJEJVn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 05:21:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233449AbhJEJVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 05:21:41 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 723ADC061745
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 02:19:51 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id u18so36138626wrg.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sgme58XakllSj9npFXaeBA3cw6vVO83akOhfX0eHKfw=;
        b=uoiz2oJxxZjuTdZXn7O67GKuC2XUOWVoBpHCneamxTXlWnlrvU2mDATwraEjGtJkXi
         X1lm/CWROGOkmDlxbhbICP+FZBzYA6/Nv6dxFCuDBuxjmHTjA7POutk/BfOY4G0D6DIT
         9LFz8pEZydjOZ+GPGBlgrKp5aj7GXKI+4MTddIaIYsPRWyW2hgsZ1F5KZtXSInWE2hTG
         Io7z3MDvr0ZkAKCkyiVs2+t5Vg2nUsEiyCwe645SwlGZgjNt2uAdj9fzaxa0ZRuGeBe6
         6JyFQHhc4Vrl8Vtyxe7JE/VLFEU/1CPYhUqyy0fGJ2NhtToTxLPDeVsYt7rLlhF02mJu
         pJWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sgme58XakllSj9npFXaeBA3cw6vVO83akOhfX0eHKfw=;
        b=uDgZ9ck+xdt+UzkzRFKpQs0kMcJrlALR6ytioIOVm5aXJBgd0pdzMwmz1K7oehIH9x
         amp91qbXiOn8WC8xT/06tlzAEeIzORNyABg07WRgOPAiBPMYB01QNFd6dKMjE0zVVvNi
         FncOuP4XevP7p3bLzdVoz6m/wGtugTkL7QougUaR2wFvtcPxUgeUPScPAQSpOFINupk4
         siz5Ei+kuID62Rr0L78RQPiy/o9USruhTNwmfd7cfFzo9EAZ5REzLpZHgSO69usQamtK
         PVow4EIg4KNXh+Wy+hTSLK7c+T0Ov2KQbrqWOnHIsHkZ44jWtbbtJl1KvsX5bM/A/tC8
         g9vA==
X-Gm-Message-State: AOAM5339QFno1VseDUsb0dqxIKi7ybnCkwhZdKRWm6kQdIsJAexrGzmX
        3mdQeuG1FJ0rFvPFoAEyYozSnQ==
X-Google-Smtp-Source: ABdhPJyZnQOqu7fXdS98rC026pAM+JdquNgLKmO38nrv/eJ42HE6wjoW6+H8ZbF2SoXa0QsMBDih9g==
X-Received: by 2002:a5d:64c3:: with SMTP id f3mr20657757wri.73.1633425589968;
        Tue, 05 Oct 2021 02:19:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net. [80.7.220.175])
        by smtp.gmail.com with ESMTPSA id b6sm1207085wmb.1.2021.10.05.02.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 02:19:49 -0700 (PDT)
Date:   Tue, 5 Oct 2021 10:19:47 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Kiran Gunda <kgunda@codeaurora.org>,
        Courtney Cavin <courtney.cavin@sonymobile.com>,
        Bryan Wu <cooloney@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/10] backlight: qcom-wled: Fix off-by-one maximum with
 default num_strings
Message-ID: <20211005091947.7msztp5l554c7cy4@maple.lan>
References: <20211004192741.621870-1-marijn.suijten@somainline.org>
 <20211004192741.621870-6-marijn.suijten@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004192741.621870-6-marijn.suijten@somainline.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 04, 2021 at 09:27:36PM +0200, Marijn Suijten wrote:
> When not specifying num-strings in the DT the default is used, but +1 is
> added to it which turns wled3 into 4 and wled4/5 into 5 strings instead
> of 3 and 4 respectively, causing out of bounds reads and register
> read/writes.  This +1 exists for a deficiency in the DT parsing code,
> and is simply omitted entirely - solving this oob issue - by allowing
> one extra iteration of the wled_var_cfg function parsing this particular
> property.
> 
> Fixes: 93c64f1ea1e8 ("leds: add Qualcomm PM8941 WLED driver")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> ---
>  drivers/video/backlight/qcom-wled.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
> index 27e8949c7922..66ce77ee3099 100644
> --- a/drivers/video/backlight/qcom-wled.c
> +++ b/drivers/video/backlight/qcom-wled.c
> @@ -1255,17 +1255,17 @@ static const struct wled_var_cfg wled5_ovp_cfg = {
>  
>  static u32 wled3_num_strings_values_fn(u32 idx)
>  {
> -	return idx + 1;
> +	return idx;
>  }
>  
>  static const struct wled_var_cfg wled3_num_strings_cfg = {
>  	.fn = wled3_num_strings_values_fn,
> -	.size = 3,
> +	.size = 4, /* [0, 3] */

0 is not a valid value for this property.


>  };
>  
>  static const struct wled_var_cfg wled4_num_strings_cfg = {
>  	.fn = wled3_num_strings_values_fn,
> -	.size = 4,
> +	.size = 5, /* [0, 4] */

Ditto.


>  };
>  
>  static u32 wled3_switch_freq_values_fn(u32 idx)
> @@ -1520,8 +1520,6 @@ static int wled_configure(struct wled *wled)
>  			*bool_opts[i].val_ptr = true;
>  	}
>  
> -	cfg->num_strings = cfg->num_strings + 1;
> -
>  	string_len = of_property_count_elems_of_size(dev->of_node,
>  						     "qcom,enabled-strings",
>  						     sizeof(u32));
> -- 
> 2.33.0
> 
