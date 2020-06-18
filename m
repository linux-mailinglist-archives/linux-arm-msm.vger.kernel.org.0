Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF71A1FF9DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 19:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726573AbgFRRFk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 13:05:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732031AbgFRRFj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 13:05:39 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A73C0613ED
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:05:39 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id d10so784364pls.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2020 10:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AO2SIF4iY7sgxTuLuzUmwf7DkdmGysB0WQTalXPbMgs=;
        b=PjKtZNzrbelzn7kEW6flnrKRJfMx65kRbQIqwTIoA+/W1n8FQeiJfwdpuOV6x2R3mS
         XEO8LLqDs4LE7JAxtoXjAqdIN3Oc7zn+R5KYN4dgsUMhdoWSMTlwrchvmY8Z4t6chINu
         zxbq6KbAwGuUFAyndsYbnFFB7B6PaUN8tqoLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AO2SIF4iY7sgxTuLuzUmwf7DkdmGysB0WQTalXPbMgs=;
        b=W4qzdOvbgcmJRhVgj3TurKUt1f4rZCNFpxeVhXrdz1fMSGfeT7NVhkJwzdrkVwQ3Tu
         NeupFJGj/u532fmnWp1jD//2zJ0niRAamkIaugSQtRHZ/A4X9ngeL4fUX3mYF7zRQMMI
         YKDjS2xhTMQ+zhj9Zjs6RBymGQeM9yRgVPL9GB7UZtkFVp+78MBag6ACDLTxrmdWG3H+
         WVLMBh4dDXXaTj5wtm+B2U1c1kfJP76FMoOBqOUPeJ1TvfgsMkChHw5wfofpEytqTS8f
         lbxoTP9TXDndTkhySDPAP7gjlI6hfc3Thk6h6DhKkygPl5EGFzT67Yc+wY4wafYQ907o
         nZLg==
X-Gm-Message-State: AOAM532bCAh4GAl3P9Kbe7KtB3+7WCoJUgHmi93br5j+9eaPPNZ7cIQ4
        WJ1Yz/AuTn3gAXT7z3GywwRZEw==
X-Google-Smtp-Source: ABdhPJxaMrMstwhBsh7FtkQsh979iTm724MDzimjrNFiSDhToMWkLyBwqBleJt9mhy08j3fm2nlAKw==
X-Received: by 2002:a17:902:9687:: with SMTP id n7mr4557868plp.180.1592499938642;
        Thu, 18 Jun 2020 10:05:38 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id i63sm3094782pje.34.2020.06.18.10.05.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2020 10:05:37 -0700 (PDT)
Date:   Thu, 18 Jun 2020 10:05:36 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     viresh.kumar@linaro.org, sboyd@kernel.org,
        georgi.djakov@linaro.org, saravanak@google.com, nm@ti.com,
        bjorn.andersson@linaro.org, agross@kernel.org, rjw@rjwysocki.net,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, dianders@chromium.org,
        vincent.guittot@linaro.org, amit.kucheria@linaro.org,
        lukasz.luba@arm.com, sudeep.holla@arm.com, smasetty@codeaurora.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v6 4/5] cpufreq: qcom: Update the bandwidth levels on
 frequency change
Message-ID: <20200618170536.GF4525@google.com>
References: <20200605213332.609-1-sibis@codeaurora.org>
 <20200605213332.609-5-sibis@codeaurora.org>
 <20200615172553.GU4525@google.com>
 <e21f85d64d72ec637c10dae93e8323bb@codeaurora.org>
 <20200616221157.GA4525@google.com>
 <8a6ea89f41a3341e9d00ed9aa66355d6@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a6ea89f41a3341e9d00ed9aa66355d6@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Jun 17, 2020 at 10:13:21PM +0530, Sibi Sankar wrote:
> On 2020-06-17 03:41, Matthias Kaehlcke wrote:
> > Hi Sibi,
> > 
> > after doing the review I noticed that Viresh replied on the cover letter
> > that he picked the series up for v5.9, so I'm not sure if it makes sense
> > to send a v7.
> > 
> > On Wed, Jun 17, 2020 at 02:35:00AM +0530, Sibi Sankar wrote:
> > 
> > > > > @@ -112,7 +178,7 @@ static int qcom_cpufreq_hw_read_lut(struct
> > > > > device *cpu_dev,
> > > > >
> > > > >  		if (freq != prev_freq && core_count != LUT_TURBO_IND) {
> > > > >  			table[i].frequency = freq;
> > > > > -			dev_pm_opp_add(cpu_dev, freq * 1000, volt);
> > > > > +			qcom_cpufreq_update_opp(cpu_dev, freq, volt);
> > > >
> > > > This is the cross-validation mentioned above, right? Shouldn't it
> > > > include
> > > > a check of the return value?
> > > 
> > > Yes, this is the cross-validation step,
> > > we adjust the voltage if opp-tables are
> > > present/added successfully and enable
> > > them, else we would just do a add opp.
> > > We don't want to exit early on a single
> > > opp failure. We will error out a bit
> > > later if the opp-count ends up to be
> > > zero.
> > 
> > At least an error/warning message would seem convenient when
> > adjusting/adding
> > an OPP fails, otherwise you would only notice by looking at the sysfs
> > attributes (if you'd even spot a single/few OPPs to be missing).
> 
> I did consider the case where adjust
> voltage fails and we do report the
> freq for which it fails for as well.
> If adding a OPP fails we will still
> it being listed in the sysfs cpufreq
> scaling_available_frequencies since
> it lists the freq_table in khz there
> instead.

Ah, right, I missed that v6 added the error log to
qcom_cpufreq_update_opp(), please ignore my comment :)
