Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9FF42E7533
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Dec 2020 00:20:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgL2XUm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Dec 2020 18:20:42 -0500
Received: from wout5-smtp.messagingengine.com ([64.147.123.21]:59567 "EHLO
        wout5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726158AbgL2XUh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Dec 2020 18:20:37 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 8C82A814;
        Tue, 29 Dec 2020 18:19:24 -0500 (EST)
Received: from imap6 ([10.202.2.56])
  by compute2.internal (MEProxy); Tue, 29 Dec 2020 18:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=X8JjLKTzxPlMmcPcU4nO/utDw356gR9
        db/irIXsYAqw=; b=nj423ISJqaZkzLjeb8BCfXLypxop2LvCpDz/RnAQISKxbET
        YfTUslptbyQ+TktxMYg4SDWS9/fi7CwDEENIwXWLK6JeWLDAG5ZYLVOdOOx7W5PF
        K5mywgjtMjFMIyMW0x8AwThYqcLqkR4UluvgsiLXoqkEKy4amgR6AbSZxWj76rZ4
        CXzJg+bOdrIO4ims+R13vxGNHGyBXThrXx/8h+pun/aC+A1KRyzvuU98t+O3BqMw
        l32umwHAB8J5lgvQUcMVl+lt1BAub3MrtlQJEHyLsnv4nvpD7AnNk/Z2lBsEvnNA
        UcvLvPvr3zGL5wCgvoV29eZgRC6KeNs1ASSCVOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=X8JjLK
        TzxPlMmcPcU4nO/utDw356gR9db/irIXsYAqw=; b=MsBQR0rDjFO+QbXWw+y3kq
        V/b7WkEeVzN8ybCl9q7YbHtBfbv7i4MLkF4Xpo+XCZmgt/8FZPImO7/kWSJXBHgb
        dJSw/mFiMrBNCL3W/MB6ry60A7gQCIyPWYw6gGJdOQhcfuJTtJL4lqKUb3ug1y1l
        27G0qS7Rlg5M8o/QfBem+fspysnxRFoAgwxsjjEFmk+N1V8yIEWY6DuCBS9aOkG/
        lZ/CNUoBPLveFdltAVA/dTcElLycv/iawTRsnlJw5IrpM+bhEHPt98SYVYNMlQLp
        tBfZOkQq+esv6nLrBA+kPvW6x7Vg5kiJH2T4X4PU9sVHhGGgwtBw9NJSfKLdaEnw
        ==
X-ME-Sender: <xms:e7nrX8GbFfNGMxKSlgHgC2Mri_QWlKzVJ1GT43VKjd_Ju-iiOoxj-A>
    <xme:e7nrX1XTBCZdbfg_ceQ607Hv0EkMmcaDS6GqMOgDfeAs6XwCR6pta7MsbKFNyd8y3
    6-8_RbeeEg3KDYRDpk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddvvddgtdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
    nhihucfnihhnfdcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtth
    gvrhhnpeektdetjeffffeileektdfhgeevgfdttdfggedtueeihfejjeffheettdevtddt
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurg
    hnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:e7nrX2KxqAUfipDEWaVIzTxqH1cfVNf3roASkX3YMdO2l4Uawf_vhg>
    <xmx:e7nrX-H-bL_qp9GiOWpuMKx0QDIifIdTrLS_KCPmVM2nLEoeSkOZRA>
    <xmx:e7nrXyVwFsAGSr-8jaWz2TxbO6_7HnzVXU0MLAee_XOCepkHzY5SaA>
    <xmx:fLnrXxQPnvupQ9f_Jfedt9bwmi5RsL7DhGaMVdD_GUO5a5RjkqKlhA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 6D5B71400A1; Tue, 29 Dec 2020 18:19:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <52495cb9-6230-4f7f-b138-83e74d2834cc@www.fastmail.com>
In-Reply-To: <X+odnnZYFW3qpubJ@builder.lan>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
 <20201221002907.2870059-3-danny@kdrag0n.dev> <X+AbJvE7OGs3cRCw@ripper>
 <e7776f3c-a517-4cf3-9265-92dc0ac09c88@www.fastmail.com>
 <X+odnnZYFW3qpubJ@builder.lan>
Date:   Tue, 29 Dec 2020 15:19:03 -0800
From:   "Danny Lin" <danny@kdrag0n.dev>
To:     "Bjorn Andersson" <bjorn.andersson@linaro.org>
Cc:     "Andy Gross" <agross@kernel.org>,
        "Rob Herring" <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add PSCI idle states
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Dec 28, 2020 at10:02 AM, Bjorn Andersson wrote:
> On Tue 22 Dec 20:00 CST 2020, Danny Lin wrote:
> 
> > On Sun, Dec 20, 2020 at 7:48 PM, Bjorn Andersson wrote:
> > > On Sun 20 Dec 16:29 PST 2020, Danny Lin wrote:
> > > 
> > > > Like other Qualcomm SoCs, sm8150 exposes CPU and cluster idle states
> > > > through PSCI. Define the idle states to save power when the CPU is not
> > > > in active use.
> > > > 
> > > > These idle states, latency, and residency values match the downstream
> > > > 4.14 kernel from Qualcomm as of LA.UM.8.1.r1-15600-sm8150.0.
> > > > 
> > > > It's worth noting that the CPU has an additional C3 power collapse idle
> > > > state between WFI and rail power collapse (with PSCI mode 0x40000003),
> > > > but it is not officially used in downstream kernels due to "thermal
> > > > throttling issues."
> > > > 
> > > 
> > > Thanks Danny for this series, very happy to see this kind of additions.
> > > Just one small question about the cluster param below.
> > > 
> > > > Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> > > > ---
> > > >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 50 ++++++++++++++++++++++++++++
> > > >  1 file changed, 50 insertions(+)
> > > > 
> > > > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > index 75ed38ee5d88..edc1fe6d7f1b 100644
> > > > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > > > @@ -50,6 +50,8 @@ CPU0: cpu@0 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x0>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_0>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 0>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -67,6 +69,8 @@ CPU1: cpu@100 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x100>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_100>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 0>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -82,6 +86,8 @@ CPU2: cpu@200 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x200>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_200>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 0>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -96,6 +102,8 @@ CPU3: cpu@300 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x300>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_300>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 0>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -110,6 +118,8 @@ CPU4: cpu@400 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x400>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_400>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 1>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -124,6 +134,8 @@ CPU5: cpu@500 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x500>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_500>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 1>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -138,6 +150,8 @@ CPU6: cpu@600 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x600>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_600>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 1>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -152,6 +166,8 @@ CPU7: cpu@700 {
> > > >  			compatible = "qcom,kryo485";
> > > >  			reg = <0x0 0x700>;
> > > >  			enable-method = "psci";
> > > > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > > > +					   &CLUSTER_SLEEP_0>;
> > > >  			next-level-cache = <&L2_700>;
> > > >  			qcom,freq-domain = <&cpufreq_hw 2>;
> > > >  			#cooling-cells = <2>;
> > > > @@ -196,6 +212,40 @@ core7 {
> > > >  				};
> > > >  			};
> > > >  		};
> > > > +
> > > > +		idle-states {
> > > > +			entry-method = "psci";
> > > > +
> > > > +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> > > > +				compatible = "arm,idle-state";
> > > > +				idle-state-name = "little-rail-power-collapse";
> > > > +				arm,psci-suspend-param = <0x40000004>;
> > > > +				entry-latency-us = <355>;
> > > > +				exit-latency-us = <909>;
> > > > +				min-residency-us = <3934>;
> > > > +				local-timer-stop;
> > > > +			};
> > > > +
> > > > +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> > > > +				compatible = "arm,idle-state";
> > > > +				idle-state-name = "big-rail-power-collapse";
> > > > +				arm,psci-suspend-param = <0x40000004>;
> > > > +				entry-latency-us = <241>;
> > > > +				exit-latency-us = <1461>;
> > > > +				min-residency-us = <4488>;
> > > > +				local-timer-stop;
> > > > +			};
> > > > +
> > > > +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> > > > +				compatible = "arm,idle-state";
> > > > +				idle-state-name = "cluster-power-collapse";
> > > > +				arm,psci-suspend-param = <0x400000F4>;
> > > 
> > > How come this is 0xf4?
> > > 
> > > Isn't downstream saying that this should be either 0x1 << 4 or 0xc24 <<
> > > 4, depending on how deep we want to go? Could we at least mention why
> > > this is 0xf4?
> > 
> > I'm not sure where 0x400000F4 originally came from. I noticed that
> > sdm845 uses the same 0xc24 mode in downstream, but Qualcomm used
> > 0x400000F4 in mainline.
> > 
> > I did some testing on a downstream kernel and found that the real value
> > it uses on sm8150 is 0x4100c244, but the idle state doesn't work at all
> > if I use the same value on mainline. The logic appears to be the same in
> > the downstream sdm845 kernel. Maybe it has to do with how downstream has
> > "notify RPM" before attempting to enter the idle state?
> > 
> > In downstream, the final PSCI value is calculated as the sum of:
> > 
> > 1. (cluster-mode & cluster-mode-mask) << cluster-mode-shift = (0xc24 & 0xfff) << 4 = 0xc240
> > 2. (is-reset << 30) = 0x40000000
> > 3. (affinity level & 0x3) << 24 = 0x1000000
> > 4. (cpu-mode) = 0x4
> > 
> > so 0xc240 + 0x40000000 + 0x1000000 + 0x4 = 0x4100c244.
> > 
> > It's also possible that the problem comes from the cluster idle state
> > needing all CPUs in the cluster to be asleep (as far as I know), since
> > it doesn't look like mainline handles that.
> > 
> 
> Thanks for the explanation. I believe we have the code in place to do
> OSI sleep using the "psci domain cpuidle" driver, but I'm not entirely
> sure about the details about it - perhaps it's just a matter of wiring
> it all up(?).
> 
> Let's go with your current patches and then swing back to this once
> we've figured out the remaining details.

Following your hint, I was able to get cluster idle working using power
domain idle states. The cluster idle state is now successfully using the
same value as downstream with no apparent issues, and individual CPU
idle states are still working. Time spent in the cluster idle state
increases when and only when all CPUs are idle, which matches the
expected behavior.

Should I send a separate patch for it or revise this series? It might be
helpful for future reference to keep a record of how to convert the
current 0xf4 cluster states on modern Qualcomm SoCs in the commit
history.

>
> Thanks,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > +				entry-latency-us = <3263>;
> > > > +				exit-latency-us = <6562>;
> > > > +				min-residency-us = <9987>;
> > > > +				local-timer-stop;
> > > > +			};
> > > > +		};
> > > >  	};
> > > >  
> > > >  	firmware {
> > > > -- 
> > > > 2.29.2
> > > > 
> > >
>
