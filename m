Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 481084B1D61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Feb 2022 05:36:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243623AbiBKEgG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Feb 2022 23:36:06 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbiBKEgF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Feb 2022 23:36:05 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157891105
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 20:36:04 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id y17so3701560plg.7
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Feb 2022 20:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sk8cBUsClIMlHaCL2xiX/fn2BgN7k5aajZKy4bUzDWU=;
        b=rVzmoeBiR80szTY6N896ECqw7acDDByGXYElcGhzJuhUfTY+Zecps99iu1c0WyVNJR
         Rv74e3KSpAx4v1GCSJTZfsw6utuuw0k7HdD47Zfg13LdStdoBiWS3cijsWi5WFvQxe5c
         TFPoYS9lqs9+jpHnwkEWdHW54/IQrmYrE4byV0FfvXgsPqW8C0W/eEpbuAGrqZ264xfW
         2Mah2fg3E4zNZl37hQo2y0G919NhGsXtlVIIC0O8BIW2liruTAczzhCvaZgPnr1GpeUq
         +M9TwCWFb1WDBaMRvQCiTfybBk5k+oWbyuV6D18zlCQGHYJRjdc4O73HBGushR5PoR+L
         38dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sk8cBUsClIMlHaCL2xiX/fn2BgN7k5aajZKy4bUzDWU=;
        b=nn8j7oauDK/oBUH2CD6hcDZujY4gvqVCVhI0m0IAzWzIS1OJIEB6kTDR0VSMO9inlj
         1/voAsE0w38+HyNZfQoy2zaPIQqdTCUKYCzG6P0Mh71VihhxJIJTx8WYmyIgtQCl3ABT
         f72tNztU+tGBjMUH5uN6qZM1YE7NROVlopeyvQfWtF891E2lJzuJsV87DPsIFjq6kCSr
         /EFGs8PYanR7Y6GPo491GkQwfx3rDa8goANx+aqe1mT/1eLUT8jQZG0or0IcAUGLaSiR
         7miGuBjTXf3P8zgsogVMbw4y2SqaW/+zEJ36T/eNDAHDfiUAxjAW4tIAXiCNvAnGVfGK
         Fe3A==
X-Gm-Message-State: AOAM531NcKj5u2ePHM1jPo9vPoX5E8puH8WWxhDaki5Ihz0JM2stzD5m
        nd/UUOvlC0dEWkajIWL4mwsFPw==
X-Google-Smtp-Source: ABdhPJxx1B1o6t/Ostlvejmx0MhqI7MtxjE79p9KUj/N2Tk+zNs3dvOqGSjMaw2qRrS1NSUf56Jv/w==
X-Received: by 2002:a17:90b:3ec8:: with SMTP id rm8mr797690pjb.207.1644554163558;
        Thu, 10 Feb 2022 20:36:03 -0800 (PST)
Received: from localhost ([136.185.132.167])
        by smtp.gmail.com with ESMTPSA id j14sm26371222pfj.218.2022.02.10.20.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Feb 2022 20:36:03 -0800 (PST)
Date:   Fri, 11 Feb 2022 10:05:59 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v3 0/7] dt-bindings: Convert multiple Qualcomm OPP
 and CPUFreq bindings to DT schema
Message-ID: <20220211043559.auwbykshxwkf43lx@vireshk-i7>
References: <20220203072226.51482-1-y.oudjana@protonmail.com>
 <YgWrufkNy3OfmV4o@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgWrufkNy3OfmV4o@builder.lan>
User-Agent: NeoMutt/20180716-391-311a52
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 10-02-22, 18:20, Bjorn Andersson wrote:
> On Thu 03 Feb 01:24 CST 2022, Yassine Oudjana wrote:
> 
> > This series is a compilation of DT schema conversions of multiple Qualcomm
> > OPP and CPUFreq bindings:
> > - qcom-cpufreq-nvmem (operating-points-v2-kryo-cpu)
> > - qcom-opp (operating-points-v2-qcom-level)
> > - qcom,cpr
> > 
> 
> Really nice to see these updates!
> 
> I'm going to pick up the patches that goes through the Qualcomm tree,
> but patch 3,4 and 7 would be better to take through Viresh's tree, so
> I've looped him in on this reply.

I believe all these need to go together, else you will start getting
schema errors ?

-- 
viresh
