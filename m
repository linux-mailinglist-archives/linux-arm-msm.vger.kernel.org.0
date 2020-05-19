Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4339C1D8E36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 05:29:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726532AbgESD3k (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 May 2020 23:29:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726293AbgESD3k (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 May 2020 23:29:40 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54CCEC061A0C
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 20:29:40 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id z15so679172pjb.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2020 20:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=teKNNdHb4OAKCHGA4AObm/yuMFkkrUmSWGWrFxvkG1w=;
        b=DrMapenFGkod0r1x7ItV8RkiSd36NSSCW1CcO65eY1VnbtP1Zv6gDs80JS33UbhqLv
         ynjSLpvNxoCeeyaqii0Sxy70ZA7qprLMi0ZotgtQ0j2EKEkzawlyovllXzsqygRJwUZB
         MZewekr8sO14kGg+v4ABPYvJ1apXrKL1xk4nTr9V97+QdDUL1HzjdlsURWPS8R/xRZ0/
         ahjxNcgNEqc+JzGtBZSBtJfCczc8ZhpbuLhARGdQKMVZPBeDo+z4vAYV9orh8L7MO9cU
         sJSG5+m+jbdleq5elHPUbrHiktliDf426Mq+Fo2Ld0u0/4d4EmEzCN6sfMFZJ5OzDXGw
         AkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=teKNNdHb4OAKCHGA4AObm/yuMFkkrUmSWGWrFxvkG1w=;
        b=kWZPBrhzd3qs6DR290u4omZNeTbjmebOL722UK2IHMuGHgS4gzEbEG6qOa6gtgiwym
         Gb5B7+75ZYsAl/AnGKmmkGQ1h7s+zW6b/CP/3ZU1uHgyrKWYpTnYT3w92sc+uBhaaujQ
         d7NDT9epBNyRRXfaDko+gAf3093Zh1n6Cqhse8/12g/a+x0Y4lqv3qvl3cYNkJbBnOWF
         38Knu6+2nf4ifeWQKVi60pBNsmpKbAaxdXF3GbsZ4ZudG5HMExmFWkV19/r1NUrTjgMm
         zuZ+XQf6mBaajPtazU9PiBpYVMnIxV/X7DgGzXxhL1OimPSxG/hTxNDuU0yRNGJyuq2M
         sw3w==
X-Gm-Message-State: AOAM532fg/+ZZ857UePNDdTRKiBZLVVS2ZXF1fU2C3aYoFE4DO/HpMnq
        e+gN1JNzLSFjxzulRrJO3anpyQ==
X-Google-Smtp-Source: ABdhPJwjxI3l6U2qt94l02aexiZPoNOcltypCPfolN3XhTFb4hcyKIrokK75fp0OVGGIT1nEgyCiRA==
X-Received: by 2002:a17:902:b712:: with SMTP id d18mr19724087pls.304.1589858979832;
        Mon, 18 May 2020 20:29:39 -0700 (PDT)
Received: from localhost ([122.167.130.103])
        by smtp.gmail.com with ESMTPSA id z5sm9794188pfz.109.2020.05.18.20.29.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 18 May 2020 20:29:38 -0700 (PDT)
Date:   Tue, 19 May 2020 08:59:36 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: Re: [PATCH v7 2/4] usb: dwc3: qcom: Add interconnect support in dwc3
 driver
Message-ID: <20200519032936.jyav3fhopumymo4h@vireshk-i7>
References: <1585718145-29537-1-git-send-email-sanm@codeaurora.org>
 <1585718145-29537-3-git-send-email-sanm@codeaurora.org>
 <878shu4uwk.fsf@kernel.org>
 <875zcy4uuj.fsf@kernel.org>
 <20200514171352.GP4525@google.com>
 <abbc3f8c-c8c9-c189-735e-f8058dab3e40@linaro.org>
 <87tv0h3fpv.fsf@kernel.org>
 <090e48d7-7988-eea1-bf39-f6820578d354@linaro.org>
 <87r1vl3e42.fsf@kernel.org>
 <20200518183512.GE2165@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518183512.GE2165@builder.lan>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-20, 11:35, Bjorn Andersson wrote:
> This misses the case where INTERCONNECT=n and USB_DWC3_QCOM=[ym] which
> I don't see a reason for breaking.
> 
> But if only INTERCONNECT where a bool, then we don't need to specify a
> depends on, because it will either be there, or the stubs will.
> We've come to this conclusion in a lot of different frameworks and I
> don't see why we should do this differently with INTERCONNECT.

INTERCONNECT is a bool now and the patch has been pushed to linux-next
already.

-- 
viresh
