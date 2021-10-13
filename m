Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4366242B81A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Oct 2021 08:56:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238064AbhJMG6E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Oct 2021 02:58:04 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27963 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhJMG6E (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Oct 2021 02:58:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634108138;
    s=strato-dkim-0002; d=gerhold.net;
    h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=eVaM/sE/W1e6RoqK5iJqALt9ftWlGfTmK4eVBSoXqq8=;
    b=aeBWkdidVK9WDFiLuDzNXHsJ8n2sbwN26a19NhJ1bk1J4/NmaAqaC9FvMfNZP2iIHi
    RvQ8Ogy02faojb5PXfQK3GY/S5UBoteOJkybRXJ3ftcGoh0kb3jeEVeyN41NJSDE6mzH
    8RAfw6o5xAXk34w15i0Kru4Z48mB5kDDSvgzGt3NXOxnOE1/EbLpZh9sKcm4z/JG7SVv
    ANsg1N7xsW3Kh/Oz/D1zCWyJvmhwEHDbzX05MNwRGw7f4Rn/Q6Ac691BK69w7k6em6c+
    VfhPXmC9YOOFRrPlnlJm8o/kXilJg6DhHZOwHFgECocssceQVAC6teY205qzyPMF9caJ
    qcSQ==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u267FZF9PwpcNKLVrK86+6Y="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9D6tb5Ro
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Wed, 13 Oct 2021 08:55:37 +0200 (CEST)
Date:   Wed, 13 Oct 2021 08:55:31 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Maulik Shah <mkshah@codeaurora.org>
Cc:     swboyd@chromium.org, mka@chromium.org, evgreen@chromium.org,
        bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, linux@roeck-us.net, rnayak@codeaurora.org,
        lsrao@codeaurora.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 1/5] dt-bindings: Introduce QCOM Sleep stats bindings
Message-ID: <YWaC43o8ZR6zrthh@gerhold.net>
References: <1633600649-7164-1-git-send-email-mkshah@codeaurora.org>
 <1633600649-7164-2-git-send-email-mkshah@codeaurora.org>
 <YV9PN1JNPhVQb8jN@gerhold.net>
 <b4c26217-67b1-516a-325f-a58e321c4e09@codeaurora.org>
 <YWAkgdViDtv60PCM@gerhold.net>
 <c22d57cc-025b-5a8c-91d5-5385292da49f@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c22d57cc-025b-5a8c-91d5-5385292da49f@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Maulik,

On Wed, Oct 13, 2021 at 11:27:30AM +0530, Maulik Shah wrote:
> On 10/8/2021 4:29 PM, Stephan Gerhold wrote:
> > On Fri, Oct 08, 2021 at 02:20:24PM +0530, Maulik Shah wrote:
> > > On 10/8/2021 1:20 AM, Stephan Gerhold wrote:
> > > > On Thu, Oct 07, 2021 at 03:27:25PM +0530, Maulik Shah wrote:
> > > > > From: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > > > 
> > > > > Add device binding documentation for Qualcomm Technologies, Inc. (QTI)
> > > > > Sleep stats driver. The driver is used for displaying Sleep statistic maintained
> > > > > by Always On Processor or Resource Power Manager.
> > > > > 
> > > > > Cc: devicetree@vger.kernel.org
> > > > > Signed-off-by: Mahesh Sivasubramanian <msivasub@codeaurora.org>
> > > > > Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> > > > > Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > > > ---
> > > > >    .../bindings/soc/qcom/qcom-sleep-stats.yaml        | 47 ++++++++++++++++++++++
> > > > >    1 file changed, 47 insertions(+)
> > > > >    create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > > > 
> > > > > diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > > > new file mode 100644
> > > > > index 0000000..5213daf
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/soc/qcom/qcom-sleep-stats.yaml
> > > > > @@ -0,0 +1,47 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/soc/qcom/qcom-sleep-stats.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Qualcomm Technologies, Inc. (QTI) Sleep stats bindings
> > > > > +
> > > > > +maintainers:
> > > > > +  - Maulik Shah <mkshah@codeaurora.org>
> > > > > +
> > > > > +description:
> > > > > +  Always On Processor/Resource Power Manager maintains statistics of the SoC
> > > > > +  sleep modes involving powering down of the rails and oscillator clock.
> > > > > +
> > > > > +  Statistics includes SoC sleep mode type, number of times low power mode were
> > > > > +  entered, time of last entry, time of last exit and accumulated sleep duration.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - qcom,rpmh-sleep-stats
> > > > > +      - qcom,rpm-sleep-stats
> > > > > +
> > > > > +  reg:
> > > > > +    maxItems: 1
> > > > > +
> > > > > +required:
> > > > > +  - compatible
> > > > > +  - reg
> > > > > +
> > > > > +additionalProperties: false
> > > > > +
> > > > > +examples:
> > > > > +  # Example of rpmh sleep stats
> > > > > +  - |
> > > > > +    sram@c3f0000 {
> > > > > +      compatible = "qcom,rpmh-sleep-stats";
> > > > > +      reg = <0x0c3f0000 0x400>;
> > > > > +    };
> > > > > +  # Example of rpm sleep stats
> > > > > +  - |
> > > > > +    sram@4690000 {
> > > > > +      compatible = "qcom,rpm-sleep-stats";
> > > > > +      reg = <0x04690000 0x400>;
> > > > > +    };
> > > > 
> > > > Does this region really only contain "rpm-*sleep*-stats"? AFAICT this is
> > > > really a more generic memory region where various offsets are read from.
> > > 
> > > Right the area contains all kind of sleep stats/logs.
> > > 
> > > > 
> > > > These are all the offsets in msm8998-pm.dtsi downstream [1]:
> > > >     ...9000c: rpm-rail-stats offset
> > > >     ...90014: rpm-sleep-stats offset (RPM_DYNAMIC_ADDR in your driver)
> > > >     ...90018: rpm-log offset
> > > >     ...9001c: "RPM FREE HEAP SPACE"
> > > > 
> > > > How would you set up any of the other drivers if the entire region
> > > > is declared as "rpm-sleep-stats"?
> > > 
> > > We don't need to setup other drivers.
> > > The idea is to have single stats driver (qcom_sleep_stats) that can be
> > > enahanced to to read other stats also on both RPM/ PRMH targets.
> > > 
> > > Today this driver reads only sleep stats from offset 0x90014.
> > > if in future say, we want to read rpm-rail-stats from offset 0x9000c then it
> > > can be added in the existing driver.
> > > 
> > > In the rpm data, add one more entry to indicate reading rpm-rail-stats,
> > > something like below and add new compatible flag for the target, may be
> > > "qcom,rpm-sleep-stats-legacy" and should work like,
> > > 
> > > #define RPM_RAIL_STATS_ADDR 0xc
> > > 
> > > static const struct stats_config rpm_data = {
> > >          .stats_offset = 0,
> > >          .num_records = 2,
> > >          .appended_stats_avail = true,
> > >          .dynamic_offset = true,
> > >          .rpm_rail_stats = true,
> > > };
> > > 
> > > and check in driver probe like
> > > 
> > >          if (config->rpm_rail_stats) {
> > > 	//create rpm rail stats related files.
> > >          }
> > > 
> > > Similarly for other rpm-logs / any other stats can be added in same driver.
> > > 
> > > Hope this clarifies.
> > > 
> > 
> > Having the same driver for all this sounds good, thanks for clarifying!
> > 
> > > > 
> > > > Perhaps this region should have a more generic name that represents what
> > > > it actually is and not only one of the information it contains, similar
> > > > to "qcom,rpm-msg-ram"?
> > > 
> > > sram looks good to me. Actually on RPM targets its RPM data ram and RPMH
> > > targets its msgram. To keep the name common sram is used here.
> > > 
> > 
> > The node name (sram@...) is fine. I was actually referring to the
> > "compatible". Given what you have written above there is more in that
> > region than just "qcom,rpm-*sleep*-stats". There are also logs and other
> > stats there. Perhaps "qcom,rpm(h)-stats" (without -sleep-) would already
> > be more clear.
> 
> ok updated in v12 to name it qcom,rpm(h)-stats. similarly driver name also
> updated from qcom_sleep_stats to qcom_stats.
> 

Thanks!

> > 
> > Or, my other suggestion was to not make any assumption about particular
> > contents of the data RAM in the device tree. The compatible could also
> > be called simply "qcom,rpm-data-ram" (just like "qcom,rpm-msg-ram") and
> > the assumption what it contains (e.g. sleep stats) could be made in your
> > existing driver.
> > 
> > This is probably a matter of preference at the end and won't make a big
> > difference but I just wanted to mention it.
> > 
> > For example, to make your driver work on MSM8916 I had to declare a much
> > larger memory region (e.g. 0x10000 vs 0x400):
> > 
> > 		sram@290000 {
> > 			compatible = "qcom,rpm-sleep-stats";
> > 			reg = <0x00290000 0x10000>;
> > 		};
> > 
> 
> the driver can not be as is enabled for MSM8916. Actually on MSM8916 (even
> though its RPM target) it uses fixed offset 0xdba0 from the base address in
> the devicetree.
> 
> > This is because RPM_DYNAMIC_ADDR contains the offset 0xdba0 instead of
> > e.g. 0x020c on newer SoCs and the memory region must be large enough to
> > cover the offset.
> 
> On all other RPM targets followed by MSM8916 the address for soc sleep stats
> is present at offset 0x14 (RPM_DYNAMIC_ADDR ) from the base address but not
> on MSM8916. so MSM8916 is a special case to enable for for RPM stats
> 

I already tested it on MSM8916 and this is only partially true. :)

It looks like the RPM_DYNAMIC_ADDR was added together with some firmware
update. I tested on several devices and on most of them RPM_DYNAMIC_ADDR
reads 0xdba0 (that is, there are no changes necessary in the driver).

So far I have only found one single device with fairly old firmware
where RPM_DYNAMIC_ADDR reads 0x0.

> To enable this for MSM8916, dynamic_offset need to be false and stats_offset
> need to be given directly as 0xdba0, something similar as RPMH targets.
> 
> static const struct stats_config rpm_legacy_data = {
>         .stats_offset = 0xdba0,
>         .num_records = 2,
>         .appended_stats_avail = true,
>         .dynamic_offset = false,
>         .subsystem_stats_in_smem = false,
> };
> 
> { .compatible = "qcom,rpm-legacy-stats", .data = &rpm_legacy_data },
> 
> and then add
> 
>                 sram@290000 {
>                         compatible = "qcom,rpm-legacy-stats";
>                         reg = <0x00290000 0x10000>;
>                 };
> 
> which should work fine.
> 

But yeah, I guess we might need the fixed offset anyway at some point
for even older targets than MSM8916, so it is probably safer to add it
like this. Will investigate it some more once your patch is accepted.

> I donot have MSM8916 to validate this but when this driver boots up it
> should create "vlow" and "vmin" files at /sys/kernel/debug/qcom_sleep_stats/
> if that is done, it means you are reading stats from correct address since
> the file name is read from the memory itself.
> 

Almost, it's "vmin" and "xosd" ("XO Shutdown" I guess) on MSM8916. :)

Thanks,
Stephan
