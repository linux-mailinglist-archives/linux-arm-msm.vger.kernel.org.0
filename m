Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB105421ACA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Oct 2021 01:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229836AbhJDXms (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Oct 2021 19:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbhJDXmr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Oct 2021 19:42:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14A0C061745
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Oct 2021 16:40:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id x27so78500660lfu.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Oct 2021 16:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AtMTm1MnsDT5pzdVB4o/P5uPpfU+IlPYrcGMZB3cOyY=;
        b=EiLUYPRK/HzKXCwETY0OH11oqYUMD0FpP0U6IziHikw2TPtMRRkm2WodanP9v0QtdH
         +nkgrs8Zw40MM9iIgwerENnvmo05BJhfCIMRpkxMQlWMqvuNJxEBvgHdw2f+Grm7LRJo
         A1PrxtblvFM82MBN6JWlZMQhP3Bel8BIYb8um/2zdo7av992+FIhldl2I7TszqeTwBoK
         EeLyDkVcssY0et8eBYP+ut+NHEmw/j3CHPFnB0dkWYyne2pviTIkJXS/Oc6FjQlJB8lP
         cRhpOn9nsshQ7oA1dfBSZS//HNtO3BdNkClwNNuddYoMH/IYA3l1o6GXQ3m5V/szExJ0
         u4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AtMTm1MnsDT5pzdVB4o/P5uPpfU+IlPYrcGMZB3cOyY=;
        b=M95q9T4VB9wpRCJJb5k8p9hp/9qGIHWCS5psfp1Xq2Bx8+dE+PqQ3qoLDR3GEJItCo
         gl9Ykcet8Xc5w+I28UMMIjCrBHF5JIUvaSaiqvqut0OOM6cLg608eKYGwD5ugTxp/WHB
         bxoYfrE0Rs0YxlOnoHMN6Uq64A3PUCCQN+6g+o5L71Oe/qIa/lf8CfnC4nJn2zfnIgYd
         5X3J7bd16jSZW8+xyB3YjwtCBw7UjvmQTBoN4QzSxMIY7kmK+sTSXrcZZbDgUoHAvjJs
         3+rzhqhV6hF2HRISunrdAyHrLQDTMzxy3YFnG0jDkn+uZHqTBqm4itbEmMmFxOYCF6Dc
         JYVA==
X-Gm-Message-State: AOAM533190oskVjF4XTBxnzh/U3mTPEI/Gjdwma496D0PE46b1GhH2Fd
        oFVL8HVQT2cRIf5/aXc9SV5sTf/U1vjiZQ==
X-Google-Smtp-Source: ABdhPJzMna1s03gA6lFSdD6SoLltxFESklbLYBytEcVYcvO9pdq5Nu7yIi6pqu8DHJ+KPPYjgrRLOQ==
X-Received: by 2002:a2e:8041:: with SMTP id p1mr18758737ljg.158.1633390855896;
        Mon, 04 Oct 2021 16:40:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id v138sm1905263lfa.120.2021.10.04.16.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 16:40:55 -0700 (PDT)
Subject: Re: [bug report] drm/msm/dsi: Split PHY drivers to separate files
To:     Dan Carpenter <dan.carpenter@oracle.com>, hali@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org
References: <20211004103711.GB25015@kili>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5a8d25b8-6725-5f91-a622-6e8e70a11d8c@linaro.org>
Date:   Tue, 5 Oct 2021 02:40:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211004103711.GB25015@kili>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/10/2021 13:37, Dan Carpenter wrote:
> Hello Hai Li,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch 5c8290284402: "drm/msm/dsi: Split PHY drivers to separate
> files" from Aug 13, 2015, leads to the following Smatch complaint:
> 
>      drivers/gpu/drm/msm/dsi/phy/dsi_phy.c:812 msm_dsi_phy_enable()
>      warn: variable dereferenced before check 'phy' (see line 809)
> 
> drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
>     805  int msm_dsi_phy_enable(struct msm_dsi_phy *phy,
>     806                          struct msm_dsi_phy_clk_request *clk_req,
>     807                          struct msm_dsi_phy_shared_timings *shared_timings)
>     808	{
>     809		struct device *dev = &phy->pdev->dev;
>                                        ^^^^^^^^^^^^^^
> "phy" is deferenced without checking
> 
>     810		int ret;
>     811	
>     812		if (!phy || !phy->cfg->ops.enable)
>                       ^^^
> Too late.  The fact that no one has complained in six years suggests
> that the NULL check can be removed but it wasn't 100% to obvious from
> reading the code.

Yes, phy can not be NULL, since otherwise dsi_get_phy would make 
dsi_init return -EPROBE_DEFER.

> 
>     813			return -EINVAL;
>     814	
> 
> regards,
> dan carpenter
> 


-- 
With best wishes
Dmitry
