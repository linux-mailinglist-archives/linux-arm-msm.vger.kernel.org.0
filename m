Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC024A9EA6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 19:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377376AbiBDSIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 13:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377374AbiBDSIQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 13:08:16 -0500
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com [IPv6:2607:f8b0:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D286DC06173E
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Feb 2022 10:08:15 -0800 (PST)
Received: by mail-ot1-x32f.google.com with SMTP id w27-20020a9d5a9b000000b005a17d68ae89so5699895oth.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Feb 2022 10:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=g+GyvokC4JIDBfu1nlEt4yOnjvYWiAwVNgoY8pGa298=;
        b=htSvG/nD0gdatQ8XpszfTbcPx6WRvFhlRFuQ3/cGEtQTN9dVfk9EUexMtuaeZ3BigV
         89aPjTjyKyLzTqxjrjC4wQJGPhX3lFLKyX2JOfFlXnEXo2/MYjzT2wzUHbqxICU9pbgh
         YUl1j1rpY76n2d+KXGBrv5MCNHjiJx3pq1jlZI0CWCjXc6a9gpBLVR+ivGGawM9ahxkn
         Cla1/TZg/kBK09R8xShgA0Nh4+VbFZcsXlxYNeKOVQvX8vUVwp3U6T5HhuWnbZ4lHgoc
         MawFRhVIgOGJdhD94x2afKwZ/rGjQEoqBof8OLwI9Z2NBk2P3MgjJxAVOKgyhpoNi4P4
         kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=g+GyvokC4JIDBfu1nlEt4yOnjvYWiAwVNgoY8pGa298=;
        b=tz0x6i4l9KY+pZgb1rBehnyxFGwdYR+i3+zbEKSshK/8wphK3X/KiEHjC6m05RzcS4
         LDX4WkzxpuQLSt5YWXVr+A7WGpGOhhz37JImzgajBzk4RQ6TW8mRFCO64fG5U1MkG6W3
         GB+RWMcbTUypef6uhknhpYoRzXgPSrzNTatR1wAe/FDd/DYB5GFvxPeaxCQBo9nAs/J+
         v3N3C6CFbMOHe9hQIDuuNt/muyLE/++xfgAfivHbAEqlI4eJaA3z+S/HrZFX64tndgok
         2k84hRoo9HBX+zX7YjkDjSqFgRgVmdllrsBTcaqKdoSWGPiTOTpLxc4wTGimbc3BmpZ4
         6Mwg==
X-Gm-Message-State: AOAM530Mhvs8060AtTONxJTraPsZCDwgFCNFfi9rWXxDjGWaSbhvzKBc
        AhQDwX1YAXl/VGa9JtTdCXKrqA==
X-Google-Smtp-Source: ABdhPJwvwYm8p8ZLyMR7biGMJIl82SdfRuu3SbgGgQ4E+SI3CdLJ/0uYNZcyG2Fh4p6nkQzW4Onu2Q==
X-Received: by 2002:a9d:4f0b:: with SMTP id d11mr74438otl.239.1643998095150;
        Fri, 04 Feb 2022 10:08:15 -0800 (PST)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id z4sm769333oad.30.2022.02.04.10.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 10:08:14 -0800 (PST)
Date:   Fri, 4 Feb 2022 10:08:30 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/9] i2c: qcom-cci: don't delete an unregistered adapter
Message-ID: <Yf1rnkvfMGOHEeP+@ripper>
References: <20220203164629.1711958-1-vladimir.zapolskiy@linaro.org>
 <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220203164700.1711985-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 03 Feb 08:47 PST 2022, Vladimir Zapolskiy wrote:

> If i2c_add_adapter() fails to add an I2C adapter found on QCOM CCI
> controller, on error path i2c_del_adapter() is still called.
> 
> Fortunately there is a sanity check in the I2C core, so the only
> visible implication is a printed debug level message:
> 
>     i2c-core: attempting to delete unregistered adapter [Qualcomm-CCI]
> 
> Nevertheless it would be reasonable to correct the probe error path.
> 
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Fixes like this should either come first in the series, or be sent on
their own, as it could be merged without considering the remainder of
the series


Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index c1de8eb66169..fd4260d18577 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -655,7 +655,7 @@ static int cci_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error_i2c:
> -	for (; i >= 0; i--) {
> +	for (--i ; i >= 0; i--) {
>  		if (cci->master[i].cci)
>  			i2c_del_adapter(&cci->master[i].adap);
>  	}
> -- 
> 2.33.0
> 
