Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 044E93379CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Mar 2021 17:45:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbhCKQpD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Mar 2021 11:45:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbhCKQoi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Mar 2021 11:44:38 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94988C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:44:38 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id u198so18817895oia.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Mar 2021 08:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=J+E1F/+CiA7MmEzXg0Znv2knht7eIpGyzsrriFW2HGk=;
        b=cs2kVuytYqxJ9KakFv0ZZQAgoQOx4A52b8Zrxo8PGgjL80JKRkvoZ+9PABtYtSBojE
         o++daOW2u7+jhc1V39aUNORA5OHxoMS3CGPHdo738R60ruInqTf4Uv6DZFO8sxeFPQPI
         ym4uG7QKaWO2uEo+1buqQzmm5qNBNmnyaxgUftaUemwk648Up+D94Ghx84gtzR375G1O
         Cf5qY6eq9OBu2OHYcQWZnU+ow3TdNJnm8Hb7XXwh3wgSq0zcWDHsISw/nWc3XZo/si2a
         3VrW6OWD/bDXP6tiGGkNJFEjK8qaIlJP6vlx5V9JNbpb8dxdQFIKLjQH2HIWeT+jqZhS
         EPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=J+E1F/+CiA7MmEzXg0Znv2knht7eIpGyzsrriFW2HGk=;
        b=pWHY4ht8bAQaq70Hz2OnV0gCCtubq4bzzuOJIJKz3vv+ZDOa0G6TiEeH/zogkkqFqg
         trtu3gZyvovedqVcUYbWYKfFvvj2MdtiJFBs9W8cqcp9Bl+4kEbmWXnPKORGJC4zXjr1
         P2XaWPBJomPdHJeJgBblMMitDhynDel1RnNtmVaoEEVKfIswaLDe29ceGgu9te3E/TjO
         sfQ6YCDM1mHaTiRoaPu6mb9DjWPtlAb7L9Vi4h5mCtNuvbsQ9GLafB81ux/4Bq/eWynA
         tFPXCq2yCDOudoE9aqX0X0OB6pZnSnqfqlcNcS+ShQDuGEtpUK70NdrdxtlrvNWa+746
         53iQ==
X-Gm-Message-State: AOAM5319SuhIzmuktExD+H/fAJYqqBMXpCiMYQE/UAkWug+Nosjlz9zT
        unuVlcBQa1bb1pyNSMwPogE3Nw==
X-Google-Smtp-Source: ABdhPJzxpBo1bZwp9c8FuB1BjCg5KpytgCQLbbT248Rai4InOAwjPbVhSZYP2qm1ZvxKSVowvjeQOg==
X-Received: by 2002:a05:6808:bd2:: with SMTP id o18mr6843514oik.7.1615481078054;
        Thu, 11 Mar 2021 08:44:38 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n22sm644375oie.32.2021.03.11.08.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Mar 2021 08:44:37 -0800 (PST)
Date:   Thu, 11 Mar 2021 10:44:36 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     agross@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/13] Add binding updates and DT files for SC7280 SoC
Message-ID: <YEpI9MSK74faK03R@builder.lan>
References: <1613114930-1661-1-git-send-email-rnayak@codeaurora.org>
 <YElgnuH6ZEoMOgdj@builder.lan>
 <a4f03a1c-880b-ebf5-ad7e-387e1b5c61e4@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4f03a1c-880b-ebf5-ad7e-387e1b5c61e4@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu 11 Mar 03:15 CST 2021, Rajendra Nayak wrote:

> 
> On 3/11/2021 5:43 AM, Bjorn Andersson wrote:
> > On Fri 12 Feb 01:28 CST 2021, Rajendra Nayak wrote:
> > 
> > > This series includes a few minor binding updates and base device tree
> > > files (to boot to shell) for SC7280 SoC and the IDP board using this SoC.
> > > 
> > > The series is dependent on a few driver patches to merge first, for
> > > gcc, rpmhcc and pinctrl
> > > https://lore.kernel.org/patchwork/project/lkml/list/?series=484517
> > > https://lore.kernel.org/patchwork/project/lkml/list/?series=484489
> > > https://lore.kernel.org/patchwork/patch/1379831/
> > > 
> > 
> > I'm not able to find v2 of this series, but plenty of patches that
> > depends on its content. Do I somehow miss it, or is it coming?
> 
> I did post v2 [1], and will post v3 shortly addressing some of
> the feedback from Stephen on v2.

Sorry, I had filtered my inbox view a little bit too hard and missed it.

v3 looks good to me, so I'll pick it to allow me to land other pending
patches on top.

Thank you,
Bjorn

> I was waiting on the rpmh clock fix to come out [2], which addresses
> the question about the XO clock frequency [3] in DT
> 
> [1] https://lore.kernel.org/patchwork/project/lkml/list/?series=487403
> [2] https://lore.kernel.org/patchwork/patch/1393159/
> [3] https://lore.kernel.org/patchwork/patch/1389019/
> 
> > Regards,
> > Bjorn
> > 
> > > Maulik Shah (3):
> > >    arm64: dts: qcom: sc7280: Add RSC and PDC devices
> > >    arm64: dts: qcom: Add reserved memory for fw
> > >    arm64: dts: qcom: sc7280: Add cpuidle states
> > > 
> > > Rajendra Nayak (5):
> > >    dt-bindings: arm: qcom: Document SC7280 SoC and board
> > >    dt-bindings: firmware: scm: Add SC7280 support
> > >    arm64: dts: sc7280: Add basic dts/dtsi files for SC7280 soc
> > >    dt-bindings: qcom,pdc: Add compatible for sc7280
> > >    arm64: dts: qcom: SC7280: Add rpmhcc clock controller node
> > > 
> > > Sai Prakash Ranjan (4):
> > >    dt-bindings: arm-smmu: Add compatible for SC7280 SoC
> > >    arm64: dts: qcom: sc7280: Add device node for APPS SMMU
> > >    dt-bindings: watchdog: Add compatible for SC7280 SoC
> > >    arm64: dts: qcom: sc7280: Add APSS watchdog node
> > > 
> > > satya priya (1):
> > >    arm64: dts: qcom: sc7280: Add SPMI PMIC arbiter device for SC7280
> > > 
> > >   Documentation/devicetree/bindings/arm/qcom.yaml    |   6 +
> > >   .../devicetree/bindings/firmware/qcom,scm.txt      |   1 +
> > >   .../bindings/interrupt-controller/qcom,pdc.txt     |   1 +
> > >   .../devicetree/bindings/iommu/arm,smmu.yaml        |   1 +
> > >   .../devicetree/bindings/watchdog/qcom-wdt.yaml     |   1 +
> > >   arch/arm64/boot/dts/qcom/Makefile                  |   1 +
> > >   arch/arm64/boot/dts/qcom/sc7280-idp.dts            |  47 ++
> > >   arch/arm64/boot/dts/qcom/sc7280.dtsi               | 596 +++++++++++++++++++++
> > >   8 files changed, 654 insertions(+)
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp.dts
> > >   create mode 100644 arch/arm64/boot/dts/qcom/sc7280.dtsi
> > > 
> > > -- 
> > > QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> > > of Code Aurora Forum, hosted by The Linux Foundation
> > > 
> 
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
