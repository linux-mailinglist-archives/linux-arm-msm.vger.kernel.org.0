Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E45CA4FB365
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Apr 2022 08:00:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234613AbiDKGDE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Apr 2022 02:03:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244815AbiDKGDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Apr 2022 02:03:03 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6BEE33E19
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:00:50 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c23so13007802plo.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 10 Apr 2022 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TOrz2TYyKKln5WCCmCjdg2Bgm93TEWKafFMisAhjfgo=;
        b=uDKUMuBk+Zr5/6D3mpQDlD7lWnjM89KGeJd7wpYHIbDzTCmMEEbv4gzYPu+mrFUF8R
         /e1fvzqQIFvgaWr7KJng5KPikVRqS07l2vmjsF39/9hj4FPS4yYnyWsHxpHkfgIjGLSq
         MofXjUkmxK6eTU1CXHQ5fZPtlHn75XefVY5TcSwrMUl92BhW7gcJQuW+FxItHDAX8Iz8
         rU42CvawGyfJuWNlfIcVZCKc0masTO59K91oGj0/sqWpHwEtoQa8CIqTLCXLGapsXTaA
         K+cAD46UoErUo6n5PAaZ1EFciGA9RRMdLcHi5BrYLP1baMkKyVNLnPx78ZwUoHc2T4zh
         NxRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TOrz2TYyKKln5WCCmCjdg2Bgm93TEWKafFMisAhjfgo=;
        b=razqnHMw1Nmngg7mPsDqALinZjnpWUR8oKs5q/aOk9h4SvhkdctY+/aS+e18i91K4+
         D+/uhzoIPNjxmkb+SnzJWCm/yF1PbCLgpfSZE/hmcb9UUhqOYELRacOGAqA+NgvK0V0S
         4ODc0hzqVl48N5/km7BqTbVMYyny8IVDWs+eectghe5w7puJvey0fQt2LXoFsGbEV9zx
         Bsg+Z8mpF8HczKOz/LWHoSBbmRmqkzabYBf394VVPlo5M6qG5UvbxBRkVJEuXKG/LnD6
         XEZjG1BNOSZJqT4ekT2+otPj8aQNxFGuidpPPDZiOTt24iF6BDFqKPW71gIMvyZhClvN
         GOEw==
X-Gm-Message-State: AOAM5335oHSn/W7E2lpZTKRJpJ6RO4drAnKeBiY3IMDWSnh+RwePsVw2
        vP3u16ES0Irq+E/HkBL5bGA4
X-Google-Smtp-Source: ABdhPJymr2uHiw3rePGk47HXX4/TNLZfo6i2NSiXElg+EFB7Li4XBX7woodET5r2u9jQxv/rOEU/tQ==
X-Received: by 2002:a17:90a:8591:b0:1b9:da10:2127 with SMTP id m17-20020a17090a859100b001b9da102127mr34902852pjn.13.1649656850143;
        Sun, 10 Apr 2022 23:00:50 -0700 (PDT)
Received: from thinkpad ([117.217.182.106])
        by smtp.gmail.com with ESMTPSA id f4-20020a056a0022c400b004fb2292cd74sm34245714pfj.206.2022.04.10.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Apr 2022 23:00:49 -0700 (PDT)
Date:   Mon, 11 Apr 2022 11:30:46 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mhi@lists.linux.dev
Cc:     quic_hemantk@quicinc.com, quic_bbhatt@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update Hemant's email id
Message-ID: <20220411060046.GA16845@thinkpad>
References: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404064226.59825-1-manivannan.sadhasivam@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Apr 04, 2022 at 12:12:26PM +0530, Manivannan Sadhasivam wrote:
> The codeaurora email domain is no longer available for Qualcomm employees.
> Qualcomm employees should now use the new email ids from quicinc domain for
> opensource contributions.
> 
> So let's use the new email id for Hemant.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Applied to mhi-next!

Thanks,
Mani

> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fd768d43e048..d714313d5cb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12793,7 +12793,7 @@ F:	arch/arm64/boot/dts/marvell/armada-3720-uDPU.dts
>  
>  MHI BUS
>  M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> -R:	Hemant Kumar <hemantk@codeaurora.org>
> +R:	Hemant Kumar <quic_hemantk@quicinc.com>
>  L:	mhi@lists.linux.dev
>  L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
> -- 
> 2.25.1
> 
