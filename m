Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99A9A5BE32F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Sep 2022 12:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229540AbiITK2L (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Sep 2022 06:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbiITK2K (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Sep 2022 06:28:10 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F98771997
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 03:28:07 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id w2so2373594pfb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Sep 2022 03:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=TcKUfJUCCOHTt6fn38EmcwoVIyI3UzCr5ChNl1GM+/4=;
        b=H09M6qwa+9VSmywU31/7TR0CMSMpMjxVwKxascARmgmZH5aTqDvkCcYQ6dCKtuXnDZ
         3P9q7oCP1POU+EuA0XJlffC8rU8PXBey2Cj9HBklpwC1YN3K4PGpMNeMv5IPCjY7GZgw
         dYVEA7+3EYio0butF+EJ+cMNCY2Ga583g+uFLn9EfvYAVXqqf2DRudZPQo1Uop1RUnEn
         sVMZCVkgaRb2zDVuSEdwuhjq2kZmxm9lOWSF7Mp/e2fM8SfK79vnMRsnTnDMZpMGSupr
         pbDkRAv6+TuSp6cu5VYw1uEksDZXIkXAS1d5s0ucavEmWhP041aq5jA9ggap6X9jSgSf
         HiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=TcKUfJUCCOHTt6fn38EmcwoVIyI3UzCr5ChNl1GM+/4=;
        b=kktgM+SFPxygPEsnUYcJa9Dfq4yxSYnC6eDl9mBbdEWok6H2RKZoIjBttHA1uxpqMy
         siEa9jxA0vCG6M33tcJFOSxCazeJOCb32cAID1JTiTViNNN0vghP7kfuWaFc15vAFGxg
         Ypbe6Qo17lUn7rJ6eBcDxYq/7D+y4ZhvfdL5kbSaN/VDGWZXAxEw+dKm1RMdOAjcbZBS
         DqGKHZLvFVHSNlHBh1OUgMqvNqDizcMNmyJ+eLxKLrQIdhy8EtEbyT5TPXLS8bs/vwtp
         f6Ai5tHdQ1OAsTyVELSEMKEtlinSXm0dW7LvvWk8RieiqOg+4hu2gxAjOzepzBAEZf2R
         6TDg==
X-Gm-Message-State: ACrzQf2tX5RQsXQifYO4rW3ojdEjVGZm6DXjpfE2ua20syuw9R7JcE8s
        c0ar80OU2IyYWg6Tjdram45ExA==
X-Google-Smtp-Source: AMsMyM760oD16hXPs+4JP05QAFv5/6I/Juk3967sI0Zs6Yd78edT73FvzRS2x3JB8oI+CSc0kKkYgA==
X-Received: by 2002:a05:6a00:158f:b0:546:b777:af17 with SMTP id u15-20020a056a00158f00b00546b777af17mr22701543pfk.51.1663669687117;
        Tue, 20 Sep 2022 03:28:07 -0700 (PDT)
Received: from localhost ([122.171.20.238])
        by smtp.gmail.com with ESMTPSA id s17-20020a17090302d100b0016c9e5f290esm1089268plk.10.2022.09.20.03.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 03:28:06 -0700 (PDT)
Date:   Tue, 20 Sep 2022 15:58:03 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Manivannan Sadhasivam <mani@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Johan Hovold <johan@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [RFC PATCH 0/4] cpufreq: qcom-hw: Move clocks to CPU node
Message-ID: <20220920102803.rqj44xrz2szj3tqi@vireshk-i7>
References: <cover.1657695140.git.viresh.kumar@linaro.org>
 <20220715160933.GD12197@workstation>
 <20220718015742.uwskqo55qd67jx2w@vireshk-i7>
 <20220801023756.76jswkbwivuntqof@vireshk-i7>
 <20220830032456.z4olnogsyg32vhiz@builder.lan>
 <20220830054042.akj7pf366inelvpo@vireshk-i7>
 <20220830062050.GA7066@workstation>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830062050.GA7066@workstation>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-08-22, 11:50, Manivannan Sadhasivam wrote:
> On Tue, Aug 30, 2022 at 11:10:42AM +0530, Viresh Kumar wrote:
> > On 29-08-22, 22:24, Bjorn Andersson wrote:
> > > Conceptually, it sounds like a good idea to express the clock feeding
> > > the CPU clusters, which is controlled by the OSM/EPSS.  But do you
> > > expect the OPP framework to actually do something with the clock, or
> > > just to ensure that the relationship is properly described?
> > 
> > No, the OPP core will never try to set the clock rate in your case,
> > though it will do clk_get().
> > 
> 
> Okay. Then I think it is a fair argument to make qcom-cpufreq-hw as the
> clock provider for CPUs.
> 
> I will send the RFC soon.

Ping.

-- 
viresh
