Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91E661F6D2C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2020 20:05:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727059AbgFKSFM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Jun 2020 14:05:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726926AbgFKSFL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Jun 2020 14:05:11 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F58AC08C5C1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 11:05:11 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id b7so3318062pju.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2020 11:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/Bq+Y46DbuB7fegNcUlJlA3+5rgMyxwf1ZUkLK7/qjM=;
        b=R7Gv3fE98ru+DOk/HmBKIZiD4prougIBei/WKg3Uv1jP/K/uQk0OHgsEbuebHBTQlq
         NIrQYcXeASZP6XsiN2ZkVKTTPNL3SH4BjYmAx6t4RXlIWs/vl9R8l40chko3hjLoeOgS
         mBS2jM9HXU2HvunsDVWIhcls/c8VXN5+yKBIq2GTk+lCPn82yYz6yudWU1/OPqYzrocf
         8xfYVogCi1sek36jmgI8BIy4opiUNqpMWOxxW69XPiBthR8ajFxkCvug6UzmkN02maCY
         kWkl5DH37s470oczuWU6G7hFydtBmT2dHO8llaPQ96Z/oFStimg1pVJz3xRTMhUgQVDN
         jX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/Bq+Y46DbuB7fegNcUlJlA3+5rgMyxwf1ZUkLK7/qjM=;
        b=JCI7Y3jheUoVSRTWfYzBLaAUZ+mGKj2LjLMmBfUa5XVpFwAaFkP52isYRveXUwm6bf
         wSzsBUUcOamJJZBVmaWiOwArOqMbKrEIvjgNr4kTL87eyVjrC/cG1xAEqP8Hc8TS7SLd
         OgXu3FwXDpJfM8IJwruhEFvxcMm4RuZyX63djCGw3lafGSNcF+Xd0D5ks7trZu3TT9/+
         9Ip3CV9HQfVKWw9kfFWEYpBw9KSDEjnPxVCPZUzwZTkOuQIOQ6z2HoAYkq1d8eNct+Sg
         1AW6UStETAo9cxhWgCcQK7GbgB5TY8iWCIxD3tiJlM6AOUYrooOG1EpII+W2I13ycP3/
         4QEg==
X-Gm-Message-State: AOAM532LLUEIOOAbyq2m5S1mvlC1mczRiT/FVGyrhk9VO/x4ahh6EohY
        fquAnHatz3QQLi2LeK+8SKdP
X-Google-Smtp-Source: ABdhPJxHypyc6iCgv22ctsppmva0DV430xWYsodx9eTuESqdAVw10oT5wjFanhmVDUQbz9Y0YTVDGA==
X-Received: by 2002:a17:90a:4809:: with SMTP id a9mr9236473pjh.196.1591898710845;
        Thu, 11 Jun 2020 11:05:10 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:c:23ea:6d6a:61cf:2fc0:2486])
        by smtp.gmail.com with ESMTPSA id o18sm4077768pfu.138.2020.06.11.11.05.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 11:05:10 -0700 (PDT)
Date:   Thu, 11 Jun 2020 23:35:03 +0530
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
Message-ID: <20200611180503.GA22890@Mani-XPS-13-9360>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200604135221.GH16719@Mani-XPS-13-9360>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604135221.GH16719@Mani-XPS-13-9360>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 07:22:21PM +0530, Manivannan Sadhasivam wrote:
> Hi,
> 
> On Sat, May 23, 2020 at 10:38:06PM -0400, Jonathan Marek wrote:
> > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > 
> 
> I've tested this series on an SM8250 based board and able to get Type C (USB0)
> working. There are also couple of Type A ports (USB1) on that board behind a
> USB hub. It is probing fine but I don't see any activity while connecting a
> USB device. Will continue to debug and once I get them working, I'll add my
> Tested-by tag.
> 

So it turned out that I forgot to enable one regulator which kept the USB hub
powered down. After enabling that, both Type A ports are working. Hence,

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> Thanks,
> Mani
> 
> > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > 
> > Jonathan Marek (6):
> >   arm64: dts: qcom: sm8150: add apps_smmu node
> >   arm64: dts: qcom: sm8250: add apps_smmu node
> >   arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> >   arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> >   arm64: dts: qcom: add sm8150 hdk dts
> >   arm64: dts: qcom: add sm8250 hdk dts
> > 
> >  arch/arm64/boot/dts/qcom/Makefile       |   2 +
> >  arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
> >  arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
> >  arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
> >  5 files changed, 1384 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> >  create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> > 
> > -- 
> > 2.26.1
> > 
