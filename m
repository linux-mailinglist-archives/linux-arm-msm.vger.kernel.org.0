Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A16F146196
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jan 2020 06:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726061AbgAWFiQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jan 2020 00:38:16 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:38140 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbgAWFiP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jan 2020 00:38:15 -0500
Received: by mail-pj1-f65.google.com with SMTP id l35so714971pje.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jan 2020 21:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=u59zjSXS/XTq3y/VRi/ypiF6GVPni5LqrGm7pUdf9CE=;
        b=kgDZ3Ev4YhI8UWauD6wYC6ui+jiErE23+nYrenotZ35rNra4h+mVoeirGvXwdx6CKN
         77TGlhJY8iEJ62/2FuGOovMklg+H6b/iyel7P8It95jvfZBwE07PU3D9vxjmtSO6U53N
         LJpCPFfXIfHIGX30wrWCr6YhnnEescqs/XOwciVchmTCme+RjcrcDcmasWJ0EcVsgGqV
         9Yk5mBDbsKPzz81AT+jdVrmll9S6543DWkRp9I99ZpVJTp5xNT1TA5/mNzmxUKRuXPDT
         8aMdky9w8+/piEPQ2MqwrfQ8g2/Sg2OlgndjMBs33uaKlNOUnbVVIQ8VPtz/y+PmODbB
         XsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=u59zjSXS/XTq3y/VRi/ypiF6GVPni5LqrGm7pUdf9CE=;
        b=nhr+Wioomx6F5ye3JDZ+dDB56JzYymqnEMHiRZwHXZewZtsVn+i9t6/qBu6Sy43Hky
         OZtPK/G/QkZXUT7lDhvBF88HAYHfOjjrQvFtGYMEmyymra5ltPxtBGsnZncstlygfog/
         ase1G3QbD85Xre8sh7CXw4ADLfXOv1BVppGza0OMe3gcT00tkXm3vM2cHQi50YN0zJ07
         gqchG/5+Li2R00QXYV6OfAil6sMMFEVwmV6fvpZ9NrEOvxAn/GOSIExHQbkuuLslPDMw
         8+6KkkL5ZMWeB1q2Kvwk5b64dkZYlond4torHHln4S/LAGZvtgd8iOSTDFMDChq9iiP1
         CvGA==
X-Gm-Message-State: APjAAAUENpybDJbS/4CFJC4WxvpipAb2ejRrkibSwKqAEEhAM1aLS0HW
        bAQkJ8sIJTy3dpScvlLhSuCTlA==
X-Google-Smtp-Source: APXvYqxLeiUeWrnNMNt1yazM9GWw8JOan3GgSFOGMok29IKmjwN2od/hMqiGhQuqC29PZady7Iz9Bg==
X-Received: by 2002:a17:902:528:: with SMTP id 37mr15071319plf.322.1579757894919;
        Wed, 22 Jan 2020 21:38:14 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f8sm788874pfn.2.2020.01.22.21.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 21:38:14 -0800 (PST)
Date:   Wed, 22 Jan 2020 21:38:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     rishabhb@codeaurora.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sibi Sankar <sibis@codeaurora.org>
Subject: Re: [PATCH v2 2/8] remoteproc: qcom: Introduce driver to store pil
 info in IMEM
Message-ID: <20200123053811.GU1511@yoga>
References: <20191227053215.423811-1-bjorn.andersson@linaro.org>
 <20191227053215.423811-3-bjorn.andersson@linaro.org>
 <60c10082ba90fbba0f056df8575d205f@codeaurora.org>
 <20200122230849.GC3261042@ripper>
 <2ffeff6b57e6bb4567f00c09e5b82131@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ffeff6b57e6bb4567f00c09e5b82131@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 22 Jan 15:58 PST 2020, rishabhb@codeaurora.org wrote:

> On 2020-01-22 15:08, Bjorn Andersson wrote:
> > On Wed 22 Jan 14:56 PST 2020, rishabhb@codeaurora.org wrote:
> > > On 2019-12-26 21:32, Bjorn Andersson wrote:
> > > > diff --git a/drivers/remoteproc/qcom_pil_info.c
> > [..]
> > > > +static int pil_reloc_probe(struct platform_device *pdev)
> > > > +{
> > > > +	struct pil_reloc *reloc;
> > > > +
> > > > +	reloc = devm_kzalloc(&pdev->dev, sizeof(*reloc), GFP_KERNEL);
> > > > +	if (!reloc)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	reloc->dev = &pdev->dev;
> > > > +	reloc->map = syscon_node_to_regmap(pdev->dev.parent->of_node);
> > > If there are multiple entries like "pil-reloc" in the imem node
> > > mapping the entire imem multiple times may not work. Is there a way
> > > we can somehow just iomap the required region for pil?
> > 
> > With the entire imem being represented as a syscon this will be
> > ioremapped once and all callers of syscon_node_to_regmap() (or one of
> > the other syscon getters) will get a regmap back that reference this one
> > mapping.
> > 
> > So doing it this way allow us to "map" sections of imem that is smaller
> > than PAGE_SIZE.
> > 
> > 
> > That said, it means that all imem users/clients should access imem
> > through this syscon regmap.
> > 
> > Regards,
> > Bjorn
> Yes, the clients are spread around in different drivers currently.
> So accessing same regmap is not possible.

The few examples upstream are children of the imem simple-mfd/syscon and
will thereby naturally request the regmap of the parent syscon.

For driver that doesn't fit this model (I don't find one right now), or
if you have downstream drivers that are designed differently you could
use syscon_regmap_lookup_by_phandle() to acquire the imem regmap from
any device in the system.

Regards,
Bjorn.
