Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD44F177CB8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 18:03:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729717AbgCCRDL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 12:03:11 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:18755 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729148AbgCCRDL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 12:03:11 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583254990; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=t7pxhES6CtD8FX+tKI1sCtQUz5kRFPV7u657mPloMv4=; b=l5bYhPsH8oeJoyAPftr1HYaxZmgGGNgVDOk8THK04PSm/1rmyOmnlPJr/TNu2fkH+XPGWlC0
 Eg2ajcW0EmkPyKGLMYJ2QbeF6hqnJZ0E9pxBORNmFaIuhwNz5FPjAq2+tCuzfJQMqFf3QlHX
 hcbyS4HT7Ygs+pzFp6g9RkzWag0=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5e8d8c.7f5d3b7dece0-smtp-out-n01;
 Tue, 03 Mar 2020 17:02:04 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7BD26C447A2; Tue,  3 Mar 2020 17:02:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 85D94C43383;
        Tue,  3 Mar 2020 17:02:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 85D94C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Tue, 3 Mar 2020 10:01:59 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Brian Masney <masneyb@onstation.org>
Cc:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        DTML <devicetree@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [PATCH v3 1/2] dt-bindings: display: msm: Convert
 GMU bindings to YAML
Message-ID: <20200303170159.GA13109@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Brian Masney <masneyb@onstation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        DTML <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Rob Herring <robh+dt@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>
References: <1583173424-21832-1-git-send-email-jcrouse@codeaurora.org>
 <1583173424-21832-2-git-send-email-jcrouse@codeaurora.org>
 <20200302204906.GA32123@ravnborg.org>
 <20200303154321.GA24212@jcrouse1-lnx.qualcomm.com>
 <CAOCk7NpP8chviZ0eM_4Fm3b2Jn+ngtVq=EYB=7yMK0H7rnfWMg@mail.gmail.com>
 <20200303155405.GA11841@onstation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200303155405.GA11841@onstation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Mar 03, 2020 at 10:54:05AM -0500, Brian Masney wrote:
> On Tue, Mar 03, 2020 at 08:50:28AM -0700, Jeffrey Hugo wrote:
> > On Tue, Mar 3, 2020 at 8:43 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
> > >
> > > On Mon, Mar 02, 2020 at 09:49:06PM +0100, Sam Ravnborg wrote:
> > > > Hi Jordan.
> > > >
> > > > On Mon, Mar 02, 2020 at 11:23:43AM -0700, Jordan Crouse wrote:
> > > > > Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> > > > > text bindings.
> > > > >
> > > > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > > > ---
> > > > >
> > > > >  .../devicetree/bindings/display/msm/gmu.txt        | 116 -------------------
> > > > > -
> > > > > -Required properties:
> > > > > -- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
> > > > > -    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
> > > > > -  Note that you need to list the less specific "qcom,adreno-gmu"
> > > > > -  for generic matches and the more specific identifier to identify
> > > > > -  the specific device.
> > > > > -- reg: Physical base address and length of the GMU registers.
> > > > > -- reg-names: Matching names for the register regions
> > > > > -  * "gmu"
> > > > > -  * "gmu_pdc"
> > > > > -  * "gmu_pdc_seg"
> > > > > -- interrupts: The interrupt signals from the GMU.
> > > > > -- interrupt-names: Matching names for the interrupts
> > > > > -  * "hfi"
> > > > > -  * "gmu"
> > > > > -- clocks: phandles to the device clocks
> > > > > -- clock-names: Matching names for the clocks
> > > > > -   * "gmu"
> > > > > -   * "cxo"
> > > > > -   * "axi"
> > > > > -   * "mnoc"
> > > > The new binding - and arch/arm64/boot/dts/qcom/sdm845.dtsi agrees that
> > > > "mnoc" is wrong.
> > > >
> > > > > -- power-domains: should be:
> > > > > -   <&clock_gpucc GPU_CX_GDSC>
> > > > > -   <&clock_gpucc GPU_GX_GDSC>
> > > > > -- power-domain-names: Matching names for the power domains
> > > > > -- iommus: phandle to the adreno iommu
> > > > > -- operating-points-v2: phandle to the OPP operating points
> > > > > -
> > > > > -Optional properties:
> > > > > -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > > > > -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> > > > This property is not included in the new binding.
> > >
> > > Yeah, that guy shouldn't be here. I'm not sure how it got there in the first
> > > place but I'll update the commit log. Thanks for the poke.
> > 
> > I thought this was something Brian M added for older targets (A4XX?).
> > Perhaps he should chime in?
> 
> Yes, this is needed for older systems with a3xx and a4xx GPUs.

Okay, this got added to the wrong place.  The GMU is a specific entity only
valid for a6xx targets. From the looks of the example the sram should be in the
GPU definition. Do you want to submit a patch to move it or should I (and lets
hope Rob doesn't insist on converting GPU to YAML).

Jordan

> Brian

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
