Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 316CC21978C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 06:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726352AbgGIEnz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 00:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgGIEny (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 00:43:54 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D9B9C061A0B
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2020 21:43:54 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id b9so320043plx.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2020 21:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=uYFWXsn6/lmz5ncMBjNDIoIoMFK4tdm/Q5x2mlsCoiI=;
        b=EaBPBeSfNjYdLPMxKFn3vKHHQTk5DSQ1a6GPgTC0RJBdk3vV5Rz4W5hW1lxLQTcKee
         SQiBOIbmK4ZEu66KcjHN93aQcF3i+4Y0HkohdNaED7tbe1nNfNA/Je0FMcyEXbEYbwZz
         yGLL9ktIkHKt3RAYVIW4mdMZEwF87KWgALxa5rFAzeBB9izvi00SM8sXpB+bj5NC3HBO
         UZlZ9hKFDUZ7F4qkTRn6hSj6Yr6ZPRir36NPKvxiwoP9tDRiXg9ADUi6RCffMQ1XHnNg
         WkRko8g50tJwH7rXSdhWz61K8WZZv04UhednMu0IK/LAJNzubu0wSqiHsE9NO6WPtLF6
         JMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=uYFWXsn6/lmz5ncMBjNDIoIoMFK4tdm/Q5x2mlsCoiI=;
        b=bTBFM6tAHh2EDtgFn6auhHyPVTu86f/V7iXPLW8zrCenyzjV1+NWclfqQfQxZ2UBmG
         PkBysufkYqcaTLZXAy07h+wx02DK9P09qiSkx+AJv5d/KH4K7VVA+Uzwm2Cp980Havi3
         ZUNmhNHPBXVHWEj8hLKsBT/SHgWivh5PBc3IEkPN4hDZNcGIcliV9j7pUQHp8ggZIsPn
         DT7j7BErN1qlgVb90bCr+tAgtS4BwwCIWMNB6+QvmzJd0P8QAOsa2w33vcp5LGrMxtfS
         VlsVXyWaM3ISy7UShvl4hAoEaP2xBIQBEvxpx0UXTJC+oc8MM2/IeMDO4qD5EVmtsEHH
         pzaQ==
X-Gm-Message-State: AOAM531R7gOZHoaZjhYKOeDtwNod9U8+oxMPct341zG1VY1PMAQHr5U0
        UILN7GmOkQs+tJB0f7ceDWDE6g==
X-Google-Smtp-Source: ABdhPJxJHTDRM74uOKDi3SikC5ArM6o0/DCY1lNNoz2eFTGKxdAZS39R0GDvGntXe5ZbIYSVT0WPQw==
X-Received: by 2002:a17:902:d698:: with SMTP id v24mr22151646ply.163.1594269833703;
        Wed, 08 Jul 2020 21:43:53 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j26sm1152574pfe.200.2020.07.08.21.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 21:43:52 -0700 (PDT)
Date:   Wed, 8 Jul 2020 21:44:20 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Will Deacon <will@kernel.org>
Cc:     Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        "moderated list:ARM SMMU DRIVERS" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 0/8] arm64: dts: qcom: smmu/USB nodes and
 HDK855/HDK865 dts
Message-ID: <20200709044420.GB3453565@ripper>
References: <20200609194030.17756-1-jonathan@marek.ca>
 <20200703123113.GA18953@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703123113.GA18953@willie-the-truck>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri 03 Jul 05:31 PDT 2020, Will Deacon wrote:

> On Tue, Jun 09, 2020 at 03:40:18PM -0400, Jonathan Marek wrote:
> > Add dts nodes for apps_smmu and USB for both sm8150 and sm8250.
> > 
> > Also add initial dts files for HDK855 and HDK865, based on mtp dts, with a
> > few changes. Notably, the HDK865 dts has regulator config changed a bit based
> > on downstream (I think sm8250-mtp.dts is wrong and copied too much from sm8150).
> > 
> > V2 changes:
> > * Added two patches for sm8150 and sm8250 iommu compatibles
> > * Changed apps_smmu node patches to use new compatibles
> > * Updated commit messages for apps_smmu patches to be more correct
> > * Updated HDK dts patches based on Bjorn's comments
> > 
> > Jonathan Marek (8):
> >   dt-bindings: arm-smmu: Add sm8150 and sm8250 compatible strings
> >   iommu: arm-smmu-impl: Use qcom impl for sm8150 and sm8250 compatibles
> >   arm64: dts: qcom: sm8150: add apps_smmu node
> >   arm64: dts: qcom: sm8250: add apps_smmu node
> >   arm64: dts: qcom: sm8150: Add secondary USB and PHY nodes
> >   arm64: dts: qcom: sm8250: Add USB and PHY device nodes
> >   arm64: dts: qcom: add sm8150 hdk dts
> >   arm64: dts: qcom: add sm8250 hdk dts
> 
> What's your plan for merging this? I can take the first two patches
> via arm-smmu, if you like. Please just let me know.
> 

Please pick up the binding and driver patch through your tree.

Regards,
Bjorn
