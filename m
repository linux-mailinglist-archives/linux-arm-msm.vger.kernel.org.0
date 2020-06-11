Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EDE01F6D59
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 20:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgFKSWf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 14:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725869AbgFKSWf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 14:22:35 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15CFCC03E96F
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 11:22:35 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id m2so2711171pjv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/jrot9jiACQp7hlN4Y0oUkRnraQD0PhZgjleZb5KOTo=;
        b=aHf9Jp2vfXTkGatdBWzbMDHy8FhElvKkFuYFE25BSuaXxzgSoLmFV95BN4WDehHUk4
         5m8N8AioXPZgZ4yXaEyHbzsYARgX7ACT2qOoQhxjE22Y3gugq9OqJ/oiqu8nGdwUIjLp
         ygHW9s3IPOIp68PvgF3ktrwcVpl0yo6J4KFF79Zxv1w93drrxWbFH7aDsXTKmAWTDl2I
         sMijFuKfbnMoe7SMqG8wYkKerIUQBOXIwG3bwTs39dNo3wmEmD80xiGRKQjTzFjKFGGE
         X4JUCM9VZOEP7OWpyxGHTcSlMg8sxy2ZJKYjRaiybkQC6v7TngKrKdcMj1MvTG+D274m
         Ftug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/jrot9jiACQp7hlN4Y0oUkRnraQD0PhZgjleZb5KOTo=;
        b=MWYR0LfA5oXihFbp1b7snT/Rv8HNUm/RCpdh8kWkjbKJsaiS2Yj1QUIk2OhLsiCf3E
         xULZZ3qXidvwwdyE9BA5FCHOxX6Ldbroe/m4uUNoz7I/PcKKQvxTogju/pOUW0LTCS0d
         OeC3JEZcSRbGfSEWAG3XDS0QcFxTFIOK9iIPcwhkfM4OKwlHvC41Esk6UanBVKegHcG3
         k4WMjsQL9io0PFW2f8qJLJrIGq+3APm5PYLaSAiVs3LfIxctO3KPtC/7ciNvHreAwQ9o
         X48rCdUOttYgLUw0Sz6NEENbqJGEFl6vYK7flG2vTyy7k5HosGF/IBL4QKA1c90YItJp
         1IkA==
X-Gm-Message-State: AOAM532RMSJeHRT4TKoJbKMQAf+XexBLrcGjEKt/g9yIY2urPEeV706g
        499UHTufGx9aSS2QTfykZyhw
X-Google-Smtp-Source: ABdhPJweg/YmGBjZaH0+SEhkuyw3OfsGOu38/MkdBIo9BJyK7LZrm09LuM3FkeHJmP4mfy4PnjxO1g==
X-Received: by 2002:a17:90a:e50b:: with SMTP id t11mr9488829pjy.109.1591899754317;
        Thu, 11 Jun 2020 11:22:34 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:c:23ea:6d6a:61cf:2fc0:2486])
        by smtp.gmail.com with ESMTPSA id r24sm3166759pgm.25.2020.06.11.11.22.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 11:22:33 -0700 (PDT)
Date:   Thu, 11 Jun 2020 23:52:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 0/6] arm64: dts: qcom: smmu/USB nodes and HDK855/HDK865
 dts
Message-ID: <20200611182227.GA4811@Mani-XPS-13-9360>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200604135221.GH16719@Mani-XPS-13-9360>
 <20200611180503.GA22890@Mani-XPS-13-9360>
 <cf3ccc5f-cdc5-71f5-60e0-7ae44952c667@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf3ccc5f-cdc5-71f5-60e0-7ae44952c667@marek.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 11, 2020 at 02:14:43PM -0400, Jonathan Marek wrote:
> On 6/11/20 2:05 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jun 04, 2020 at 07:22:21PM +0530, Manivannan Sadhasivam wrote:
> > > Hi,
> > > 
> > > On Sat, May 23, 2020 at 10:38:06PM -0400, Jonathan Marek wrote:
> > > > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > > > 
> > > 
> > > I've tested this series on an SM8250 based board and able to get Type C (USB0)
> > > working. There are also couple of Type A ports (USB1) on that board behind a
> > > USB hub. It is probing fine but I don't see any activity while connecting a
> > > USB device. Will continue to debug and once I get them working, I'll add my
> > > Tested-by tag.
> > > 
> > 
> > So it turned out that I forgot to enable one regulator which kept the USB hub
> > powered down. After enabling that, both Type A ports are working. Hence,
> > 
> > Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
> > Thanks,
> > Mani
> > 
> 
> Thanks for testing it. Your Tested-by only applies to the relevant patches
> (patches 2 and 4 in this version) right? And can I also add your Tested-by
> tag to my other series (https://patchwork.kernel.org/cover/11567095/) which
> this depends on?
> 

Sure. You can add it for all SM8250 USB patches.

Thanks,
Mani

> > > Thanks,
> > > Mani
> > > 
> > > > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > > > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > > > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > > > 
> > > > Jonathan Marek (6):
> > > >    arm64: dts: qcom: sm8150: add apps_smmu node
> > > >    arm64: dts: qcom: sm8250: add apps_smmu node
> > > >    arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> > > >    arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> > > >    arm64: dts: qcom: add sm8150 hdk dts
> > > >    arm64: dts: qcom: add sm8250 hdk dts
> > > > 
> > > >   arch/arm64/boot/dts/qcom/Makefile       |   2 +
> > > >   arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
> > > >   arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
> > > >   arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
> > > >   arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
> > > >   5 files changed, 1384 insertions(+)
> > > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> > > > 
> > > > -- 
> > > > 2.26.1
> > > > 
