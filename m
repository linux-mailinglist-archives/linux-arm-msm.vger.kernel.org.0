Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFF3F39AEC7
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Jun 2021 01:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229610AbhFCXmv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 19:42:51 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:13529 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229697AbhFCXmu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 19:42:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1622763665; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Fz8Sw+CAHxzQ1wTzwGA8ftbArfy52ptDiPNLw8/pJ58=;
 b=fWcDAgTRjXHwxgyIwmdmffD1DnZugfzYvSJfvbHJofmZ7a8iGBcCMtmG5ryaB+J04Cn+GqUy
 zjnrNQE++ZZsgXopU1YV8dCHM8Z6sADRyAGUPbKPJ8TH2tsXK38erMhILJz7lJPUg6R/Aovh
 43FtuN1zQ5H7zBZ/AB7mxkaJWVA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 60b96875e27c0cc77f68319d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Jun 2021 23:40:37
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A73DBC43217; Thu,  3 Jun 2021 23:40:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7794C433F1;
        Thu,  3 Jun 2021 23:40:35 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 03 Jun 2021 16:40:35 -0700
From:   abhinavk@codeaurora.org
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Rob Clark <robdclark@gmail.com>, DTML <devicetree@vger.kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        David Airlie <airlied@linux.ie>,
        MSM <linux-arm-msm@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [Freedreno] [RFC PATCH 00/13] drm/msm: Add Display Stream
 Compression Support
In-Reply-To: <YLdlEB3Ea6OWaLw4@vkoul-mobl>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <CAOCk7Nqep_Db+z3fr5asHZ1u0j8+6fKkPFs2Ai8CbA_zGqV6ZA@mail.gmail.com>
 <YK3gxqXBRupN/N+Q@vkoul-mobl.Dlink>
 <CAOCk7NqvhGvYw8xCBctqj7H+o-Qwp2UuUJK1gatW9EWfXv56xA@mail.gmail.com>
 <CAF6AEGuoyPr8PgfwFX0JCYZ7S_pryn_OXacHBqoMAAPvSq6aRw@mail.gmail.com>
 <YLdlEB3Ea6OWaLw4@vkoul-mobl>
Message-ID: <a14c18a2545408e8156dcafc846b17a2@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-02 04:01, Vinod Koul wrote:
> On 27-05-21, 16:30, Rob Clark wrote:
>> On Wed, May 26, 2021 at 8:00 AM Jeffrey Hugo 
>> <jeffrey.l.hugo@gmail.com> wrote:
>> > On Tue, May 25, 2021 at 11:46 PM Vinod Koul <vkoul@kernel.org> wrote:
> 
>> > Frankly, I don't like the MSM ACPI solution that I've seen on the laptops.
>> > The ACPI assumes the entire MDSS (including DSI parts) and GPU is one
>> > device, and ultimately handled by one driver.  That driver needs to
>> > get a value from UEFI (set by the bootloader) that is the "panel id".
>> > Then the driver calls into ACPI (I think its _ROM, but I might be
>> > mistaken, doing this from memory) with that id.  It gets back a binary
>> > blob which is mostly an xml file (format is publicly documented) that
>> > contains the panel timings and such.
>> 
>> tbh, I kinda suspect that having a single "gpu" device (which also
>> includes venus, in addition to display, IIRC) in the ACPI tables is a
>> windowsism, trying to make things look to userspace like a single "GPU
>> card" in the x86 world.. but either way, I think the ACPI tables on
>> the windows arm laptops which use dsi->bridge->edp is too much of a
>> lost cause to even consider here.  Possibly ACPI boot on these devices
>> would be more feasible on newer devices which have direct eDP out of
>> the SoC without requiring external bridge/panel glue.
> 
> yeah that is always a very different world. although it might make 
> sense
> to use information in tables and try to deduce information about the
> system can be helpful...
> 
>> I'd worry more about what makes sense in a DT world, when it comes to
>> DT bindings.
> 
> And do you have thoughts on that..?

At the moment, I will comment on the bindings first and my idea on how 
to proceed.
The bindings mentioned here: 
https://lore.kernel.org/dri-devel/20210521124946.3617862-3-vkoul@kernel.org/ 
seem to be just
taken directly from downstream which was not the plan.

I think all of these should be part of the generic panel bindings as 
none of these are QC specific:

@@ -188,6 +195,14 @@ Example:
  		qcom,master-dsi;
  		qcom,sync-dual-dsi;

+		qcom,mdss-dsc-enabled;
+		qcom,mdss-slice-height = <16>;
+		qcom,mdss-slice-width = <540>;
+		qcom,mdss-slice-per-pkt = <1>;
+		qcom,mdss-bit-per-component = <8>;
+		qcom,mdss-bit-per-pixel = <8>;
+		qcom,mdss-block-prediction-enable;
+

How about having a panel-dsc.yaml which will have these properties and 
have a panel-dsc node to have this information?

I would like to hear the feedback on this proposal then the series can 
be reworked.

Thanks

Abhinav
