Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EB7121A220
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 16:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726836AbgGIO2x (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 10:28:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726795AbgGIO2x (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 10:28:53 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DA0DC08C5DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2020 07:28:53 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id k71so1199275pje.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2020 07:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=HWC78hpJQQDCeHA6IuilFEneJMSNBCuYQgG09IJpy9s=;
        b=pUlRLM/GeGFm+ciW2dDWqMTNeSAi+EfSiV9WiHR0x0tV4bi54L9WkTBO6dlp+YfGAM
         kbp3sjr986yeTK91dFmwiESmK5roKf3zaySaS6xAcxrs4xnZfgqRZTKcD03Iz6AWv1TR
         OrcmG09LtnRRAO0BSTfqwA8VUmPeoFsSCb7i7VlY9Xc2HQE8ho6s3sgEIW5CRUK9Ijca
         5srPrm++J4nSrkaPgy32pJsX+F1ND+DPR76o5JQVvEegUhRh/KNvCe03Rll6HaUm2b6N
         sDxYW1fd0fXkNtex6LG55EjJtiYmN+G9YEdA0+/0vSd1vhrTgqAeD4/g2HlyHJdjsCFV
         GNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=HWC78hpJQQDCeHA6IuilFEneJMSNBCuYQgG09IJpy9s=;
        b=XXxa25rymQjtzejyxs0IccsXcdxyBTBCK8X5NuGPUP3xbpIIwIId3HYB2kRLFl8Moy
         7S+tLqJoiDvjnyMYGX8aqOZfxUVLHro+HjJlh7HDJu5WhqVoxBP9IAj9Zu3iQnX2Nrmh
         oQq78F2prX+n3oPdZOLQNrWon9Pm8tecaNhKpQb9CDgkPS+jtQakiKCx30yN7Dk/csHh
         R/PjsOeESZ2CcFqvXvF35VvJ7UKYUqelXUb6iDT1oay07a2JJjDIEkHRGs7C14FCJQGn
         Q4JRC00Ce5Dy9oYek8s2U1abRuaK+KcnWHiyMds4bImdLjvWSBVCwl2QIWeOPg+nHPRe
         F2Xw==
X-Gm-Message-State: AOAM530TPS04qMQyPjJdK0V+d+RhH0qaS2lyESZ2ifdC+R1I779OGjcM
        Ef+WQIOHYRpvPREby7WIIDigeQ==
X-Google-Smtp-Source: ABdhPJx97HWjYNHwiwwN3GUeiKldr7LAIlxI7ISxb8HW+KyBLZ+xDyPE49kRA2Vi7Iz0sTwD1sKmwQ==
X-Received: by 2002:a17:90a:9d84:: with SMTP id k4mr246096pjp.227.1594304932578;
        Thu, 09 Jul 2020 07:28:52 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id x10sm2898644pgp.47.2020.07.09.07.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 07:28:51 -0700 (PDT)
Date:   Thu, 9 Jul 2020 07:29:18 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Sibi Sankar <sibis@codeaurora.org>, viresh.kumar@linaro.org,
        sboyd@kernel.org, georgi.djakov@linaro.org, agross@kernel.org,
        robh+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        saravanak@google.com, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        robdclark@chromium.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sdm845: Add cpu OPP tables
Message-ID: <20200709142918.GA3521288@ripper>
References: <20200702204643.25785-1-sibis@codeaurora.org>
 <a61c5656-e21f-f071-1149-a3357fe2684e@kali.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a61c5656-e21f-f071-1149-a3357fe2684e@kali.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Jul 19:22 PDT 2020, Steev Klimaszewski wrote:

> 
> On 7/2/20 3:46 PM, Sibi Sankar wrote:
> > Add OPP tables required to scale DDR/L3 per freq-domain on SDM845 SoCs.
> >
> > Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> > ---
> 
> 
> Hi Sibi,
> 
> 
> Bjorn asked me to give this patch a whirl, and I have to say, I like it
> but I'm not sure if I'm missing a dependency somewhere...
> 
> 
> In 5.8.0-rc4, I'm seeing a couple probe defers
> 
> [    0.131341] cpu cpu0: _allocate_opp_table: Error finding interconnect
> paths: -517
> 
> [    0.132694] cpu cpu4: _allocate_opp_table: Error finding interconnect
> paths: -517
> 
> And then a bit later on,
> 
> [    0.625837] cpu cpu0: failed to get clock: -2
> 
> 
> If these aren't anything to worry about, you can throw my Tested-by on
> 
> Tested-by: Steev Klimaszewski <steev@kali.org>
> 

You need to enable:
CONFIG_INTERCONNECT=y
CONFIG_INTERCONNECT_QCOM=y
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
CONFIG_INTERCONNECT_QCOM_SDM845=m

With this I can see the interconnect_summary in debugfs change with the
CPU frequency.

Regards,
Bjorn
