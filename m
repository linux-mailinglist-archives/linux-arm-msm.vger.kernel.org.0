Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D89871EE81B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 17:58:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729635AbgFDP6e (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 11:58:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729560AbgFDP6e (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 11:58:34 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88AEEC08C5C2
        for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jun 2020 08:58:34 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id t7so2356263plr.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2020 08:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=06qJ6cVTAC2pzO5b4lUgwr6Obth7V4o6CCI1s1HWoM8=;
        b=o2sza3EQSLRpzYpN/X7lDFGDRPvpEz9QvrHcKU9aufszRXcw9xjtiCVookzX0NuO71
         I4RJ/AyC+4SHMIN4ZUu5Ar0q/0/iCsnmH6Y5QzXW3Cw+fDMhflNHieI603MW4ow4WAp+
         VI/wtC5hGyhYPIfwR4gM9TDTe6lIPx8PwfUCn+Kbj31paIPXMHKJRw0sHbWQ3ikvpfbz
         cuOKYz5cxAZYnA0xyd6ersRU9IxJuH9pJQuA5gIiWqgfiOO+XGJK8wWWnAQJn9Rd5Pkv
         LYMJjBcKuS98wj3YXnK7tez4VcVLdO1FPfq16IifN3SQNjW8yoz3mNkHPkn4NWshCiRN
         Eq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=06qJ6cVTAC2pzO5b4lUgwr6Obth7V4o6CCI1s1HWoM8=;
        b=fRTFKeHo3sOH2NyuLYMQpnkbdiHjtqbPotaGl0hTL0bKhma9/ylNMvY9cNWrNb54EK
         ggaQVII1kc30NAGDwgs/DTj0wmBdC7i4/+iollugquS+mA4nwDDuvnwxC1OR6EYZcjq2
         RCw7zRuaOqM6i4abriwlSuAZTsswGAiboqNcmgV+QsjtZ1wHKjo15YS6xQo3y8juxzkN
         mF9VHvbQGwMzDDHFd+UEs/CG8oRzwr31LMECPKzopHGSKFeuleKiJHPfSoWss2urrndS
         xuMfxZvNH2Xkw6S83j+laMpXM8QTRRtB7rrpjqCEPSIHEaDFuDGqDNaw9KHfY/a4v215
         DZ7g==
X-Gm-Message-State: AOAM530lscB2aq8A+51Qzy4tJZfEUU29kRrwKxaptWpMfccB4wGI8eqy
        d+ZTAo1ofBdVky0HovJGIZgq
X-Google-Smtp-Source: ABdhPJyBwhHPj0fPhtcHnXiEtDj84r5PWyFiNtW5durTy+YJ+7hFi+XbAAHDjmE/3/Hwpe99teUIkQ==
X-Received: by 2002:a17:90a:64c9:: with SMTP id i9mr6902073pjm.135.1591286313848;
        Thu, 04 Jun 2020 08:58:33 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:6211:4cea:c404:4d38:8396:d1ee])
        by smtp.gmail.com with ESMTPSA id r1sm4410185pgb.37.2020.06.04.08.58.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 08:58:32 -0700 (PDT)
Date:   Thu, 4 Jun 2020 21:28:25 +0530
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
Message-ID: <20200604155825.GI16719@Mani-XPS-13-9360>
References: <20200524023815.21789-1-jonathan@marek.ca>
 <20200604135221.GH16719@Mani-XPS-13-9360>
 <200d1f60-781b-51c7-1a38-c955f59919de@marek.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200d1f60-781b-51c7-1a38-c955f59919de@marek.ca>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 04, 2020 at 10:06:19AM -0400, Jonathan Marek wrote:
> On 6/4/20 9:52 AM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > On Sat, May 23, 2020 at 10:38:06PM -0400, Jonathan Marek wrote:
> > > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > > 
> > 
> > I've tested this series on an SM8250 based board and able to get Type C (USB0)
> > working. There are also couple of Type A ports (USB1) on that board behind a
> > USB hub. It is probing fine but I don't see any activity while connecting a
> > USB device. Will continue to debug and once I get them working, I'll add my
> > Tested-by tag.
> > 
> 
> HDK865 also has a couple Type A ports, I am using them with devices already
> plugged in during boot and I haven't hit a problem like that, but I think
> I've seen the same issue when hotplugging. IIRC the behavior was a bit
> weird, like plugging a device in the Type A port (USB1) nothing would
> happen, but unplugging/replugging the type C port (USB0) would cause the
> Type A port device to start working..
> 
> Have you tried with the devices already plugged in before booting?
> 

Tried it but no luck :/ Also plugging and removing Type C doesn't make any
difference.

Thanks,
Mani

> > Thanks,
> > Mani
> > 
> > > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > > 
> > > Jonathan Marek (6):
> > >    arm64: dts: qcom: sm8150: add apps_smmu node
> > >    arm64: dts: qcom: sm8250: add apps_smmu node
> > >    arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> > >    arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> > >    arm64: dts: qcom: add sm8150 hdk dts
> > >    arm64: dts: qcom: add sm8250 hdk dts
> > > 
> > >   arch/arm64/boot/dts/qcom/Makefile       |   2 +
> > >   arch/arm64/boot/dts/qcom/sm8150-hdk.dts | 461 ++++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sm8150.dtsi    | 180 +++++++++
> > >   arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 454 +++++++++++++++++++++++
> > >   arch/arm64/boot/dts/qcom/sm8250.dtsi    | 287 +++++++++++++++
> > >   5 files changed, 1384 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8150-hdk.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sm8250-hdk.dts
> > > 
> > > -- 
> > > 2.26.1
> > > 
