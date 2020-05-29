Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30F41E729F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 04:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405144AbgE2Cen (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 22:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404312AbgE2Cem (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 22:34:42 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C60C08C5C6
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:34:42 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id bg4so424607plb.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2020 19:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=e+KZFh3ujHdsBWvwWKGN7nRmTYaLk3nxkrRoIJL6IxE=;
        b=AKbdZk+PWThhLXUOfG6ps5WyQiKJNO5Zlixyub3IIYDY19VXdLq7gJV6bajW7loVIw
         JqzI1OKLcUYqigrx2uhxYzaPG74K3eYjcziNXFPOOxdWLCLhK9r1SUuYSyxzJHLWrJv0
         A2cedtrNIPeRTP1JD1KUoXDiIu+2kF3H4FvhNE9D1uOWayPR5odwSE8XYR+qaCp9taIh
         DOXCiVshMQHd/ILVvmgGcUq8P0xYoL/4KR3xfFEuNNIwg6E9vN38tJJPbMr21jKmFvhO
         CYs+Jt0jKw33TKdaqmVQwsyoLUGgD4KqhGbCDi3Ig6beDV235p9+1aCrNSS1Fx5bhIza
         P9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=e+KZFh3ujHdsBWvwWKGN7nRmTYaLk3nxkrRoIJL6IxE=;
        b=L93sTsSuGHedrsd3VDcsQQrSKeeiJYJ/Hubz+N0mDfybAn/7Sfd26R1ALI522/XEeH
         2IGF1Jsu0Bk29YLFHjmLzbl1SYNGcOVGnB8LbiywVuGFE1Aq38vRHLWzeGu4hqAnUYDp
         seEAEecem+fwgoSJ6q8ohUwiPKNNLLcs9FMl6lXpDD11KQnEFNKlZYoBexfkI9kj20I6
         QkFNef9ptsDnDegoU4ApdBoG5pzS6urqOsQwRoSbI9dHROECc0SYxpkmriI6keY2kEVz
         WXMmrWDse5TC+97rVB7oL/6r2Z5WcYwCqvNOcLz7GYylCWN6SNwVsY/P8p1wT2x34kPq
         Rguw==
X-Gm-Message-State: AOAM532nDyKD/6Ueq+yLiBt8kuFEwlqm+y2f+I48ViW8miOR1sM2xGQ9
        a5B/pbMUK2+jbdWgDgQ8YHJyOQ==
X-Google-Smtp-Source: ABdhPJzWuXw1Stft7QC2ZScu0Veql2U5xahAs285PQUV4xB49W8fUDlfttKlD8N9VoFa0zSluAiLig==
X-Received: by 2002:a17:902:9e8d:: with SMTP id e13mr6824688plq.234.1590719681879;
        Thu, 28 May 2020 19:34:41 -0700 (PDT)
Received: from builder.lan (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a7sm5968052pfa.187.2020.05.28.19.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 19:34:41 -0700 (PDT)
Date:   Thu, 28 May 2020 19:33:36 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH] defconfig: enable Global Clock Controller for SM8250
Message-ID: <20200529023336.GP279327@builder.lan>
References: <20200525164928.2938829-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200525164928.2938829-1-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon 25 May 09:49 PDT 2020, Dmitry Baryshkov wrote:

> Enable GCC by default.
> 

Thanks for the patch Dmitry, this was however already resolved by
'f7a8bc1cf0b2 ("arm64: defconfig: Enable SM8250 GCC driver")' which
should show up in v5.8-rc1.

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 24e534d85045..72da59bbecad 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -806,6 +806,7 @@ CONFIG_SDM_GCC_845=y
>  CONFIG_SDM_GPUCC_845=y
>  CONFIG_SDM_DISPCC_845=y
>  CONFIG_SM_GCC_8150=y
> +CONFIG_SM_GCC_8250=y
>  CONFIG_QCOM_HFPLL=y
>  CONFIG_HWSPINLOCK=y
>  CONFIG_HWSPINLOCK_QCOM=y
> -- 
> 2.26.2
> 
