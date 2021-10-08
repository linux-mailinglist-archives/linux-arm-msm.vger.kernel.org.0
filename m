Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E64BD42685C
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Oct 2021 12:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240084AbhJHLBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Oct 2021 07:01:33 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:36073 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239650AbhJHLBb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Oct 2021 07:01:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1633690755;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=UEDRWns1yOp2nVjlH/jrkwDdQK8YUtsE71i4A/dhzUs=;
    b=AXEc5C6DWTwrhwn2qiif3q8XnMpA9AlbE+MZA/paytkZcIGJNnSv8E2uttBTZ3LunD
    YfLiKP5PcGq2PG4mLvwc7KO9U89wqBcxqxAi2h8kmEc4Whq0hmyjk1BbTDzqfddXvSq5
    ndxmrAGZLvYOQxgX7zYtqbjCcmTK4MdhAytkLpsrhv5efDwST3SH8USWKnEUOojw4UX6
    jBZcBsQm89snHlwfHH6W8Mxm5oJJIUZLiLLg3cIaKijEVZU4X1fU1pOLVj4V7Cg3KKzw
    7anyrnNzKqBKFT/MDlMG/TFgcxPKV4yFbVDFimeQhqdCJKpTXvKbPMlWqqO2+6dImQoP
    m0Gg==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u261EJF5OxJD4pSA8p2M1A=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 DYNA|AUTH)
    with ESMTPSA id 301038x98AxEhbF
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Fri, 8 Oct 2021 12:59:14 +0200 (CEST)
Date:   Fri, 8 Oct 2021 12:59:13 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/5] dt-bindings: Introduce QCOM Sleep stats bindings
Message-ID: <YWAkgdViDtv60PCM@gerhold.net>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
 <YV9PN1JNPhVQb8jN@gerhold.net>
 <b4c26217-67b1-516a-325f-a58e321c4e09@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4c26217-67b1-516a-325f-a58e321c4e09@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 08, 2021 at 02:20:24PM +0530, Maulik Shah wrote:
> On 10/8/2021 1:20 AM, Stephan Gerhold wrote:
> > On Thu, Oct 07, 2021 at 03:27:25PM +0530, Maulik Shah wrote:
> > > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > 
> > > Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> > > Sleep stats driver. The driver is used for displaying Sleep statistic maintained
> > > by Always On Processor or Resource Power Manager.
> > > 
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > ---
> > >   .../bindings/soc/qcom/qcom-sleep-stats.yaml        | 47 ++++++++++++++++++++++
> > >   1 file changed, 47 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > new file mode 100644
> > > index 0000000..5213daf
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > @@ -0,0 +1,47 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/qcom/qcom-sleep-stats.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Qualcomm Technologies, Inc. (QTI) Sleep stats bindings
> > > +
> > > +maintainers:
> > > +  - Maulik Shah <mkshah@codeaurora.org>
> > > +
> > > +description:
> > > +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> > > +  sleep modes involving powering down of the rails and oscillator clock.
> > > +
> > > +  Statistics includes SoC sleep mode type, number of times low power mode were
> > > +  entered, time of last entry, time of last exit and accumulated sleep duration.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - qcom,rpmh-sleep-stats
> > > +      - qcom,rpm-sleep-stats
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  # Example of rpmh sleep stats
> > > +  - |
> > > +    sram@c3f0000 {
> > > +      compatible = "qcom,rpmh-sleep-stats";
> > > +      reg = <0x0c3f0000 0x400>;
> > > +    };
> > > +  # Example of rpm sleep stats
> > > +  - |
> > > +    sram@4690000 {
> > > +      compatible = "qcom,rpm-sleep-stats";
> > > +      reg = <0x04690000 0x400>;
> > > +    };
> > 
> > Does this region really only contain "rpm-*sleep*-stats"? AFAICT this is
> > really a more generic memory region where various offsets are read from.
> 
> Right the area contains all kind of sleep stats/logs.
> 
> > 
> > These are all the offsets in msm8998-pm.dtsi downstream [1]:
> >    ...9000c: rpm-rail-stats offset
> >    ...90014: rpm-sleep-stats offset (RPM_DYNAMIC_ADDR in your driver)
> >    ...90018: rpm-log offset
> >    ...9001c: "RPM FREE HEAP SPACE"
> > 
> > How would you set up any of the other drivers if the entire region
> > is declared as "rpm-sleep-stats"?
> 
> We don't need to setup other drivers.
> The idea is to have single stats driver (qcom_sleep_stats) that can be
> enahanced to to read other stats also on both RPM/ PRMH targets.
> 
> Today this driver reads only sleep stats from offset 0x90014.
> if in future say, we want to read rpm-rail-stats from offset 0x9000c then it
> can be added in the existing driver.
> 
> In the rpm data, add one more entry to indicate reading rpm-rail-stats,
> something like below and add new compatible flag for the target, may be
> "qcom,rpm-sleep-stats-legacy" and should work like,
> 
> #define RPM_RAIL_STATS_ADDR 0xc
> 
> static const struct stats_config rpm_data = {
>         .stats_offset = 0,
>         .num_records = 2,
>         .appended_stats_avail = true,
>         .dynamic_offset = true,
>         .rpm_rail_stats = true,
> };
> 
> and check in driver probe like
> 
>         if (config->rpm_rail_stats) {
> 	//create rpm rail stats related files.
>         }
> 
> Similarly for other rpm-logs / any other stats can be added in same driver.
> 
> Hope this clarifies.
> 

Having the same driver for all this sounds good, thanks for clarifying!

> > 
> > Perhaps this region should have a more generic name that represents what
> > it actually is and not only one of the information it contains, similar
> > to "qcom,rpm-msg-ram"?
> 
> sram looks good to me. Actually on RPM targets its RPM data ram and RPMH
> targets its msgram. To keep the name common sram is used here.
> 

The node name (sram@...) is fine. I was actually referring to the
"compatible". Given what you have written above there is more in that
region than just "qcom,rpm-*sleep*-stats". There are also logs and other
stats there. Perhaps "qcom,rpm(h)-stats" (without -sleep-) would already
be more clear.

Or, my other suggestion was to not make any assumption about particular
contents of the data RAM in the device tree. The compatible could also
be called simply "qcom,rpm-data-ram" (just like "qcom,rpm-msg-ram") and
the assumption what it contains (e.g. sleep stats) could be made in your
existing driver.

This is probably a matter of preference at the end and won't make a big
difference but I just wanted to mention it.

For example, to make your driver work on MSM8916 I had to declare a much
larger memory region (e.g. 0x10000 vs 0x400):

		sram@290000 {
			compatible = "qcom,rpm-sleep-stats";
			reg = <0x00290000 0x10000>;
		};

This is because RPM_DYNAMIC_ADDR contains the offset 0xdba0 instead of
e.g. 0x020c on newer SoCs and the memory region must be large enough to
cover the offset.

It just feels a bit weird for me to describe such a large region as only
containing "qcom,rpm-*sleep*-stats". "qcom,rpm-data-ram" might better
describe it what it really is and then your driver can decide what to do
with it.

But, as I said, this is just naming which is always subjective. :)

Thanks!
Stephan
