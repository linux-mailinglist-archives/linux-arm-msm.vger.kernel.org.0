Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 909B66167F9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Nov 2022 17:14:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231410AbiKBQNI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Nov 2022 12:13:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231559AbiKBQMC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Nov 2022 12:12:02 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973492B1AF
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Nov 2022 09:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1667405458;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=818fkauCT2wdZz4+yrO04ax3xbhchL67Khz2gBKnDvo=;
        b=cpTfzeMF/jyFZiVa7xy+nMaE24YgZbQYdy4NDwu/hKSuEZTUA1w4eRTQlCYWLUzsS5FGkv
        Rfor/3NvfODt8rah0vGspM5P0ixc58OD5+pzZLV/XepqM0kWk8ss1WBJZ/4e37/ojHr79A
        d9M1cQm3yIXLi1p9xJWRdBD+nh2jlWY=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-400-0aaR8DPZOziJl7_nfZmzMg-1; Wed, 02 Nov 2022 12:10:57 -0400
X-MC-Unique: 0aaR8DPZOziJl7_nfZmzMg-1
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-13d553369a0so2234227fac.22
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Nov 2022 09:10:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=818fkauCT2wdZz4+yrO04ax3xbhchL67Khz2gBKnDvo=;
        b=eEQNtB4fPXdU7xfRAX3q7kwq0gpcmWs3g7hvTGOBapConPh90XIZAihQvRUEfwYGdW
         VqhsRwNZX/PZ+snU3OheqNKWsg/ZTKAhyhpLu2jY9ucEfMv6niXBmpqD/FdWAwBgpa1v
         rke2n2sS8jjYY/zlCR1LvlW/sgPbGkCiG4KAactifw4zlaWN3LugXAnvSIXlbRoZ7cqN
         0EuoIZGCC2KFEhPEa4loKl2mfii38xoYk97QtPbH1TiPAdcj2bxEV+3uJFQKqQy6Vngq
         JgRE/f/YWAVaTTKj6y+Eo66vMZg6t1c+tu6Dx/47x/hYdHfI1L3ExqLN3zpv2zb+U+a1
         afdA==
X-Gm-Message-State: ACrzQf3Y+6aILB6T4AnBGFSyJ3zIKrZ4nxtZ6BKAa06bc5j0RdyDc/lP
        74aD3dI5uGLGq19FoA+LsgsW/d/kHgqpAyv7mE4N8laM7CZLifEsnYTEqRJi2Th5OwHvHzRSmzQ
        tEIZqsJgCiA8bTotHDZtt8/rhmA==
X-Received: by 2002:a05:6870:d107:b0:13c:b7de:ed24 with SMTP id e7-20020a056870d10700b0013cb7deed24mr13325201oac.41.1667405455667;
        Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4FieKkr532FessZ6Ca/K73+gPVeRaDL1sIRNXwQUYUk+qc5sJ3R2bzyDCiDORWw+yibzS7Nw==
X-Received: by 2002:a05:6870:d107:b0:13c:b7de:ed24 with SMTP id e7-20020a056870d10700b0013cb7deed24mr13325186oac.41.1667405455472;
        Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id bx25-20020a056830601900b0066c312b044dsm5207253otb.27.2022.11.02.09.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 09:10:55 -0700 (PDT)
Date:   Wed, 2 Nov 2022 11:10:52 -0500
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal: qcom-spmi-adc-tm5: suppress probe-deferral
 error message
Message-ID: <20221102161052.eox4sxhvfzl6dhfn@halaney-x13s>
References: <20221102152630.696-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102152630.696-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Nov 02, 2022 at 04:26:30PM +0100, Johan Hovold wrote:
> Drivers should not be logging errors on probe deferral. Switch to using
> dev_err_probe() to log failures when parsing the devicetree to avoid
> errors like:
> 
> 	qcom-spmi-adc-tm5 c440000.spmi:pmic@0:adc-tm@3400: get dt data failed: -517
> 
> when a channel is not yet available.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Andrew Halaney <ahalaney@redhat.com>

> ---
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> index a3310bf061cb..c70615d2d771 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -1031,10 +1031,8 @@ static int adc_tm5_probe(struct platform_device *pdev)
>  		return irq;
>  
>  	ret = adc_tm5_get_dt_data(adc_tm, node);
> -	if (ret) {
> -		dev_err(dev, "get dt data failed: %d\n", ret);
> -		return ret;
> -	}
> +	if (ret)
> +		return dev_err_probe(dev, ret, "get dt data failed\n");
>  
>  	ret = adc_tm->data->init(adc_tm);
>  	if (ret) {
> -- 
> 2.37.3
> 

