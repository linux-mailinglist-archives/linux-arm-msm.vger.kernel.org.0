Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85D5E573E75
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Jul 2022 23:02:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbiGMVC5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Jul 2022 17:02:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbiGMVC5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Jul 2022 17:02:57 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1BF032B91
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 14:02:55 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso84257fac.7
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Jul 2022 14:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IK7HzOOjB/YRFSR7VtNB/n1Tcb53AZBNpdOAwR1E0eE=;
        b=n/06Hkl30Gvy7TKjCGQan1GIKtORgd1KXX1HcjZ6llewGOvbkjS1MGOvilFTZh3kMO
         RAQ2vRNRynCmaKT5+s9DdytQf0ZbI6uJ+Za7Vev1VqOoemL9A/RlV1TsvqX4b42ncu+0
         pGUaxcb2ALQS3cy4RfL3kI77J0P+DErzEe9sSs1BMEPeakBV+UCg8crfcrpLqKd7X+tl
         0AUmmaimfftnv2UxndJVwT3WFCcE1rufdCYHYPwaWZdM8C9C85kHW6WigKZNx4wuc/Zx
         7yld8N25N9FQ5fC+o8NmItuSxHjNR8/b9bdK05x8Chmwdz77yOc1VnIzhoaN0Z2+p558
         ngSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IK7HzOOjB/YRFSR7VtNB/n1Tcb53AZBNpdOAwR1E0eE=;
        b=Q2Gql3BPx84i4gkkdkFrChF8A3slCDnyZQ0mt/M7FvwD74HYETRDAG0BWQcbYUj0xn
         x++UhdRxbL+H1sr/euQQ6TWsH8azX02mxyt5VJpPnV373WSGo/SChK4VP93O3u1xUjZo
         /7I1cGbRXr9R8X+kiadMaSz88Gbsho38cYhcc/kJIliNXwl0I8RE97XswWjVbWJuuHoM
         kyslP2XbVVXPjPKQo/OamtXXap6mG7gqClgMCE+1fhGtHSYWAfl6Eedv74PNcJ/nrEZ0
         CgKy43qvUPNbXo/c7h5vs6gxUrFXWIcWqyFTPVfYuyj79uDdPEn9lvvivYcNVNchQE6t
         YLqA==
X-Gm-Message-State: AJIora8g7YmFfb9IoM3MZ77xsZBgxio+/8XIskYcjlPhEHfpPThEQsMM
        nigrYtBlWMXDyEVAgZa9Vt5ZTA==
X-Google-Smtp-Source: AGRyM1uAB82b7HJZhMHsI15ICK/mZgZgMu+xab6E2swRNoGW92ufBzJOT+w8X4NyhfNKiAdV3gkmfw==
X-Received: by 2002:a05:6870:558b:b0:101:d77c:3369 with SMTP id n11-20020a056870558b00b00101d77c3369mr2932757oao.213.1657746175273;
        Wed, 13 Jul 2022 14:02:55 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id r13-20020a056870438d00b0010c33621645sm6413069oah.55.2022.07.13.14.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 14:02:54 -0700 (PDT)
Date:   Wed, 13 Jul 2022 16:02:52 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Marko <robimarko@gmail.com>
Cc:     agross@kernel.org, konrad.dybcio@somainline.org, amitk@kernel.org,
        thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] drivers: thermal: tsens: allow configuring min
 and max trips
Message-ID: <Ys8y/HRtdgD1f3uH@builder.lan>
References: <20220708132930.595897-1-robimarko@gmail.com>
 <20220708132930.595897-3-robimarko@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708132930.595897-3-robimarko@gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 08 Jul 08:29 CDT 2022, Robert Marko wrote:

> IPQ8074 and IPQ6018 dont support negative trip temperatures and support
> up to 204 degrees C as the max trip temperature.
> 
> So, instead of always setting the -40 as min and 120 degrees C as max
> allow it to be configured as part of the features.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
