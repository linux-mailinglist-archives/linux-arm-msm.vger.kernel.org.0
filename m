Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52FC1611FDD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 05:47:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbiJ2Drv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Oct 2022 23:47:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiJ2Drv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Oct 2022 23:47:51 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2141CD6BD
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 20:47:49 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id m6-20020a17090a5a4600b00212f8dffec9so6147708pji.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Oct 2022 20:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHHuVIPCzYs7vFmo8UtoBL7CxgkvRSRe5+6DkfW68II=;
        b=I4+9NGTpHkN9TQzvwFMlgL1TXIJuXtWwAqK78qqc3zF+sNmjB3S55ZfzRd49mF2xlC
         Z+gZl2Vyoe25nuhYnO3/mw4dYexkH4PUoS+YSooCQPyH2dWOL19alcDoIuf0EHAxsoYS
         WfuO/3lml48WNuWYE3wBzChjkYcaMWFWPh6TwzIQKr9JXiQNMMUaetRgHFrpZeunWwqY
         mDn9/MzQeW2Lo9qve8OSQyup1FwEJ9v0zPu8jaQFThOy+gpd8I96JgYwMdsNBGeI8zsn
         NXzGRFZjXW6YP7u7LSifJhNMCddWJ9hYIO/jO5jgBxehUiDy2kttBUf5i6lk9kRYf0kO
         i3mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHHuVIPCzYs7vFmo8UtoBL7CxgkvRSRe5+6DkfW68II=;
        b=4gUucMG7EWnYo0zhf1kLdPjiXcbzmIarINGJ+5RGztiwqOFrLaGhvdm2zurY3esX/f
         N7Q8LNYW0CoGptiJNdZ9yuLLUjUGH0jNYEv9NsJs4wI+mKAu7sqRFYdnVcEXnE0pTQj8
         +JgVO5xrxxNTMKzxSPqQGHcrdW9AhxWGwhM1QRWRSLbOm0ZemJ0ECGXdHJbcUeUrRPAa
         QenehZ5Zi+ttveAnJ7sgZZpWhe6OlQpaJREOpanuQ6QStWPqltJqO08BMwcycFaLDpGz
         NDaANI81iBVDRTRPFmx8dkv/sdURaGxyxfU5kzTcG6cCQqByC0ZHBfLOSFTlpwBDrz8R
         ohoA==
X-Gm-Message-State: ACrzQf1nu80FJu8C6CYbOIxQTqW7LzO+Wj852xWAjg5fEZBIW0gIACtc
        vhsyHM2fuOij/R6mLg1c8tAkW45lR+CH
X-Google-Smtp-Source: AMsMyM5Zcg3AuhBsfjwRtrcFrektA3tWfdXZQtZBW8NNlwtdTNgJimcz25+wKdzPhml1gPJQufMDzg==
X-Received: by 2002:a17:90b:17c3:b0:213:2578:e5ce with SMTP id me3-20020a17090b17c300b002132578e5cemr20042047pjb.231.1667015269407;
        Fri, 28 Oct 2022 20:47:49 -0700 (PDT)
Received: from thinkpad ([59.92.103.167])
        by smtp.gmail.com with ESMTPSA id y28-20020a634b1c000000b004393c5a8006sm195286pga.75.2022.10.28.20.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 20:47:48 -0700 (PDT)
Date:   Sat, 29 Oct 2022 09:17:43 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Remove Hemant from MHI bus
Message-ID: <20221029034743.GA5362@thinkpad>
References: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221028174257.52525-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 28, 2022 at 11:12:57PM +0530, Manivannan Sadhasivam wrote:
> Hemant moved out of Qualcomm and expressed his wish to not continue doing
> any reviews for MHI patches. So let's remove him from MAINTAINERS file.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cf0f18502372..ad9279218885 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13395,7 +13395,6 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>  
>  MHI BUS
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -R:	Hemant Kumar <quic_hemantk@quicinc.com>
>  L:	mhi@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்
