Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A00A24FED4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Apr 2022 05:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231911AbiDMDIN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Apr 2022 23:08:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbiDMDIL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Apr 2022 23:08:11 -0400
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B380DF66
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 20:05:51 -0700 (PDT)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-df02f7e2c9so714410fac.10
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Apr 2022 20:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AV6FQDX1VthlUISCOaITepsyFEcrXTvSkcCNqe+B3tw=;
        b=E6KSGvCZ4UHSODXO9nxeZChlUplaA9i4B1QYOam6+4278CsUiLU5LcBIn169PPDzym
         v/D8ojd/cgw+lFqEPBEOtjnj6iWV7tlqtlpjWwBWwraTQstI1lodiPiSVE89tHmGI+mx
         BRZgs9A3ZBckCpmRgvPBLQYiBO76j+AEjgqByCaVdoST33mdduP8CJmrhkMaZFNea7uj
         N+dTXriBAYumEMmEPRLj18TMpyWZdT/WmwExHA1lOA/6HEljgUb1CLxHRoAbttnYoR7e
         5ywvPyQArrlwc9Sa4n8ZxhPmyKvd0ytW5Y0tFVfAsuRQJ7GjHQBRrmiKIeuR8WXCD7Bo
         CorA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AV6FQDX1VthlUISCOaITepsyFEcrXTvSkcCNqe+B3tw=;
        b=C+1fLafhvoxLbyuqgxIzr1fCjNMWiJ5gjc1uUjiVx/gdrVGO8F7oxeo4vmu0H93YFe
         /9D3EZupJVaRGVxYyTp1bYh3SLHxzmnEZYEFVOzqPGo2HpueJrNdYAlY4lnMFfBDP+66
         GmK7ai7VJxNzZ0zFkscJPYIFuVyynmgt0/cxbS1IZh4x26VNe/PUuIH1IGAfHo0Gi+ZI
         3iwlZZGp/q6qYLE8mL2HoJtFnyKTcxko4ZelV6xsG/WyJG2pb7khq00fscMCJGvFc5Aq
         tTFm1VZ7mO5rwwoEK84LyemKGqRMpINgmF6t4gsY/H1Evz9785eDO4wVtRyhm32vmjZj
         757w==
X-Gm-Message-State: AOAM533dbv9iY8nJ4GikiQOhDsW8AXvMVfsxCO3UKbInTl3lD/zRYFIp
        GQ7rqc5JpZbRw86OlBWBsIX6Pg==
X-Google-Smtp-Source: ABdhPJxumK4dt0tVoaXDimHUGuwrLIfEWXKVWiNm5tfkC5WXO+tBrY8ncF8eOu5OoJuK0uw/PwENnA==
X-Received: by 2002:a05:6870:a40e:b0:e2:c51f:1c49 with SMTP id m14-20020a056870a40e00b000e2c51f1c49mr3358424oal.263.1649819150541;
        Tue, 12 Apr 2022 20:05:50 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id i4-20020a4addc4000000b00324bd261e5fsm12957289oov.11.2022.04.12.20.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 20:05:49 -0700 (PDT)
Date:   Tue, 12 Apr 2022 20:08:03 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jonathan Cameron <jic23@kernel.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Caleb Connolly <caleb.connolly@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        sumit.semwal@linaro.org, amit.pundir@linaro.org,
        john.stultz@linaro.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v13 5/9] iio: adc: qcom-spmi-rradc: introduce round robin
 adc
Message-ID: <YlY+k4FcWoT/jEkJ@ripper>
References: <20220323162820.110806-1-caleb@connolly.tech>
 <20220323162820.110806-6-caleb@connolly.tech>
 <20220327160329.6a3866d7@jic23-huawei>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220327160329.6a3866d7@jic23-huawei>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun 27 Mar 08:03 PDT 2022, Jonathan Cameron wrote:

> On Wed, 23 Mar 2022 16:28:16 +0000
> Caleb Connolly <caleb.connolly@linaro.org> wrote:
> 
> > From: Caleb Connolly <caleb.connolly@linaro.org>
> > 
> > The Round Robin ADC is responsible for reading data about the rate of
> > charge from the USB or DC input ports, it can also read the battery
> > ID (resistence), skin temperature and the die temperature of the pmic.
> > It is found on the PMI8998 and PM660 Qualcomm PMICs.
> > 
> > Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> Whilst I said this patch was fine a few versions ago I didn't add a tag
> on basis I would probably end up picking it up.
> 
> To make things more flexible, I'll add one and either Lee or I can
> do the immutable branch once Lee has had a chance to take a look and
> is happy with the mfd parts.
> 
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 

Are either of you planning to pick up the driver changes?

The dts changes can be merged independently, so I would prefer to pick
those through my tree. But I would like to know that the binding and
implementation is agreed upon before doing so.

Thanks,
Bjorn
