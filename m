Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CE7389EC9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 May 2021 09:20:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhETHVh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 May 2021 03:21:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:54886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229547AbhETHVh (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 May 2021 03:21:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 981BF610CB;
        Thu, 20 May 2021 07:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621495216;
        bh=WwbYgrhlIKqs0+H7q1qB+/RjJEU6KFhz7NlZxbWY6xE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mhA1iYXw9ta2tC34JfxHHePHZetDXh4z8I7KoM75S1uerx5ZJOsbvazoPHa/UfMau
         0rfD5jQLX5e/CrQTu4aFso7kT6hf/v5SnDqFNinNrEgpABlQmDdBQpSXClikp5Tutx
         knuu5Dd0ZXCyCno/Og/w8TO5XPJMqx3eigRTHl5W7P/u+7ZHyo1UWvOgAkYGVuvxOn
         zPTbeve/4K9bbvBqGMukqLOXxkZL6nBRIu0+hTn7WZkYbQ0LbHXAvHEdrGbUgPpQc1
         l/Knxfs32t1FRcQ4Qibo8n3h+uftKx3EM2dZglvNRX+a+yFPlVgEWfxOLxJEhHBaVw
         dv6bPE1W5kM3Q==
Date:   Thu, 20 May 2021 12:50:12 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     skakit@codeaurora.org
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 3/8] arm64: dts: qcom: pm7325: Add pm7325 base
 dts file
Message-ID: <YKYNrKFrGQlfUf4S@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-4-git-send-email-skakit@codeaurora.org>
 <YKOpE1V25rdDj4Tk@vkoul-mobl.Dlink>
 <YKPua2M6t9yIJ5uy@google.com>
 <52d277a8598277716f37ad0c1f724845@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52d277a8598277716f37ad0c1f724845@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 20-05-21, 12:02, skakit@codeaurora.org wrote:
> On 2021-05-18 22:12, Matthias Kaehlcke wrote:
> > On Tue, May 18, 2021 at 05:16:27PM +0530, Vinod Koul wrote:
> > > On 18-05-21, 11:50, satya priya wrote:
> > > > Add base DTS file for pm7325 along with GPIOs and temp-alarm nodes.
> > > >
> > > > Signed-off-by: satya priya <skakit@codeaurora.org>
> > > > Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> > > > ---
> > > > Changes in RESEND V4:
> > > >  - No Changes.
> > > >
> > > >  arch/arm64/boot/dts/qcom/pm7325.dtsi | 53 ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 53 insertions(+)
> > > >  create mode 100644 arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > >
> > > > diff --git a/arch/arm64/boot/dts/qcom/pm7325.dtsi b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > new file mode 100644
> > > > index 0000000..e7f64a9
> > > > --- /dev/null
> > > > +++ b/arch/arm64/boot/dts/qcom/pm7325.dtsi
> > > > @@ -0,0 +1,53 @@
> > > > +// SPDX-License-Identifier: BSD-3-Clause
> > > > +// Copyright (c) 2021, The Linux Foundation. All rights reserved.
> > > > +
> > > > +#include <dt-bindings/interrupt-controller/irq.h>
> > > > +#include <dt-bindings/spmi/spmi.h>
> > > > +
> > > > +&spmi_bus {
> > > > +	pm7325: pmic@1 {
> > > > +		compatible = "qcom,pm7325", "qcom,spmi-pmic";
> > > 
> > > where is qcom,pm7325 documented?
> 
> > 
> > good point, I missed that one.
> > 
> 
> Actually this point was discussed during V2(
> https://lore.kernel.org/patchwork/patch/1406186/#1607321 ).
> As far as I understand it is not mandatory to add "qcom,pm7325" as we are
> adding "qcom,spmi-pmic". It is just a good to have change.
> I could not find the documentation for pm8350c, pmk8350 and pmr735a as well.

Yes that is a miss too, IMO all of these should be added to
Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.txt or the yaml
file replacing this

Thanks
-- 
~Vinod
