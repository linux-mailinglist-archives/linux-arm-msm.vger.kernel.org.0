Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FE2F2E118C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 03:02:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgLWCCP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 21:02:15 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:34331 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726313AbgLWCCK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 21:02:10 -0500
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.west.internal (Postfix) with ESMTP id 34223614;
        Tue, 22 Dec 2020 21:01:19 -0500 (EST)
Received: from imap6 ([10.202.2.56])
  by compute2.internal (MEProxy); Tue, 22 Dec 2020 21:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kdrag0n.dev; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm3; bh=AmAn74HloV/Wnje54cha8LvSBkLYxJQ
        MDWJX3ZXuIm0=; b=hADG5CIHDT3sw9fbiWF/9q5ZrxwKYT13iCg4PFlxR0Mo0bf
        ypubbYxNOO/zdpOztfCf0wXcZzY4I8gNWbNuB7xeaCHbbkpD32YvVlbMg/xAr/mA
        fewvkKk9w1OnxrTJ/UjdxaPH64sGDxBuvWFZ2XG3aacTLLJjAC1gvlOjhKxOql/9
        OF1xQs6tEJ24eLu9yYhTRpBubMFfzuQJRr3s4r5uOCu/dYW0rr8uIRRnmQkUVfXL
        RA0CrpDuNqG0GRn0rhmhUX5UGbSIrKYtdPc+7bJIKf1ZvKUSf2iOQj9nOagkYFdO
        yq3G0kai8y2LmDbCJY8TD9WgI7aV0ZfQA2m/qvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=AmAn74
        HloV/Wnje54cha8LvSBkLYxJQMDWJX3ZXuIm0=; b=Wj/PBUv9dBRMEr6RJijBG2
        ckH5FOgifJmIPRcop6uZ9mRz5bMdD0CCFCsLuqFkIF/GA5eK6Z7LRXoKVng6WGCt
        lLwFNeDy+nr0l5Fw4dAO73K9ketIGuuNGMqvFxj2S5xkumn1wq/AU77Qe46Gbfi6
        3MOuEWG5WoypJ1Rr/Lr2zLoVWPn1MvAv/oELQ0qT9/V2OCdMrn0jNNTXarv+w4Hs
        2mazCsxYGq5zKDkyG+a7/L7Ez0n+bzzbSKPI4lc6w+NMh7jWq0RtAZoa9ZlG9RLE
        cNUmxHZ0b7mvzFJsfheojSmuVbk8ofgG/QdGXstain4lZdoWw0LSJv0vwEjoJ95w
        ==
X-ME-Sender: <xms:7qTiXzKPft9iFFY23uok5HT9QO5Hm03RP81Mqc5vne6DMUjZYu1hrg>
    <xme:7qTiX3IAmIMBvQA8eCpyBmw7SzzTKZWhSWP--nIIH1jSAvezZaBo4nC08atflIEQN
    _tAUappT4pCdKqNIds>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvddtiedgtdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdffrghn
    nhihucfnihhnfdcuoegurghnnhihsehkughrrghgtdhnrdguvghvqeenucggtffrrghtth
    gvrhhnpeektdetjeffffeileektdfhgeevgfdttdfggedtueeihfejjeffheettdevtddt
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegurg
    hnnhihsehkughrrghgtdhnrdguvghv
X-ME-Proxy: <xmx:7qTiX7v0ltTgu1M2Dd1YLToL-tNWRboH2dGYh0B07uWqwl7otigJ5g>
    <xmx:7qTiX8ahbS-C3fkuP8tgm8BrkTE9FIv8EBCu7ZgF8Rmtvk6EBeX_MA>
    <xmx:7qTiX6aJ0cMyATsbGQLHAZ3kFB70cwz5yME8cSg8T4_REsFP9iAgCw>
    <xmx:7qTiX6FBya8WvsqKzLG6nwJVYqFJ-bWNsokA-MEEpSzqrq5WanHXRw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 42D821400A1; Tue, 22 Dec 2020 21:01:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.1-61-gb52c239-fm-20201210.001-gb52c2396
Mime-Version: 1.0
Message-Id: <e7776f3c-a517-4cf3-9265-92dc0ac09c88@www.fastmail.com>
In-Reply-To: <X+AbJvE7OGs3cRCw@ripper>
References: <20201221002907.2870059-1-danny@kdrag0n.dev>
 <20201221002907.2870059-3-danny@kdrag0n.dev> <X+AbJvE7OGs3cRCw@ripper>
Date:   Tue, 22 Dec 2020 18:00:54 -0800
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

On Sun, Dec 20, 2020 at 7:48 PM, Bjorn Andersson wrote:
> On Sun 20 Dec 16:29 PST 2020, Danny Lin wrote:
> 
> > Like other Qualcomm SoCs, sm8150 exposes CPU and cluster idle states
> > through PSCI. Define the idle states to save power when the CPU is not
> > in active use.
> > 
> > These idle states, latency, and residency values match the downstream
> > 4.14 kernel from Qualcomm as of LA.UM.8.1.r1-15600-sm8150.0.
> > 
> > It's worth noting that the CPU has an additional C3 power collapse idle
> > state between WFI and rail power collapse (with PSCI mode 0x40000003),
> > but it is not officially used in downstream kernels due to "thermal
> > throttling issues."
> > 
> 
> Thanks Danny for this series, very happy to see this kind of additions.
> Just one small question about the cluster param below.
> 
> > Signed-off-by: Danny Lin <danny@kdrag0n.dev>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi | 50 ++++++++++++++++++++++++++++
> >  1 file changed, 50 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > index 75ed38ee5d88..edc1fe6d7f1b 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
> > @@ -50,6 +50,8 @@ CPU0: cpu@0 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x0>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_0>;
> >  			qcom,freq-domain = <&cpufreq_hw 0>;
> >  			#cooling-cells = <2>;
> > @@ -67,6 +69,8 @@ CPU1: cpu@100 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x100>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_100>;
> >  			qcom,freq-domain = <&cpufreq_hw 0>;
> >  			#cooling-cells = <2>;
> > @@ -82,6 +86,8 @@ CPU2: cpu@200 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x200>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_200>;
> >  			qcom,freq-domain = <&cpufreq_hw 0>;
> >  			#cooling-cells = <2>;
> > @@ -96,6 +102,8 @@ CPU3: cpu@300 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x300>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&LITTLE_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_300>;
> >  			qcom,freq-domain = <&cpufreq_hw 0>;
> >  			#cooling-cells = <2>;
> > @@ -110,6 +118,8 @@ CPU4: cpu@400 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x400>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_400>;
> >  			qcom,freq-domain = <&cpufreq_hw 1>;
> >  			#cooling-cells = <2>;
> > @@ -124,6 +134,8 @@ CPU5: cpu@500 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x500>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_500>;
> >  			qcom,freq-domain = <&cpufreq_hw 1>;
> >  			#cooling-cells = <2>;
> > @@ -138,6 +150,8 @@ CPU6: cpu@600 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x600>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_600>;
> >  			qcom,freq-domain = <&cpufreq_hw 1>;
> >  			#cooling-cells = <2>;
> > @@ -152,6 +166,8 @@ CPU7: cpu@700 {
> >  			compatible = "qcom,kryo485";
> >  			reg = <0x0 0x700>;
> >  			enable-method = "psci";
> > +			cpu-idle-states = <&BIG_CPU_SLEEP_0
> > +					   &CLUSTER_SLEEP_0>;
> >  			next-level-cache = <&L2_700>;
> >  			qcom,freq-domain = <&cpufreq_hw 2>;
> >  			#cooling-cells = <2>;
> > @@ -196,6 +212,40 @@ core7 {
> >  				};
> >  			};
> >  		};
> > +
> > +		idle-states {
> > +			entry-method = "psci";
> > +
> > +			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
> > +				compatible = "arm,idle-state";
> > +				idle-state-name = "little-rail-power-collapse";
> > +				arm,psci-suspend-param = <0x40000004>;
> > +				entry-latency-us = <355>;
> > +				exit-latency-us = <909>;
> > +				min-residency-us = <3934>;
> > +				local-timer-stop;
> > +			};
> > +
> > +			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
> > +				compatible = "arm,idle-state";
> > +				idle-state-name = "big-rail-power-collapse";
> > +				arm,psci-suspend-param = <0x40000004>;
> > +				entry-latency-us = <241>;
> > +				exit-latency-us = <1461>;
> > +				min-residency-us = <4488>;
> > +				local-timer-stop;
> > +			};
> > +
> > +			CLUSTER_SLEEP_0: cluster-sleep-0 {
> > +				compatible = "arm,idle-state";
> > +				idle-state-name = "cluster-power-collapse";
> > +				arm,psci-suspend-param = <0x400000F4>;
> 
> How come this is 0xf4?
> 
> Isn't downstream saying that this should be either 0x1 << 4 or 0xc24 <<
> 4, depending on how deep we want to go? Could we at least mention why
> this is 0xf4?

I'm not sure where 0x400000F4 originally came from. I noticed that
sdm845 uses the same 0xc24 mode in downstream, but Qualcomm used
0x400000F4 in mainline.

I did some testing on a downstream kernel and found that the real value
it uses on sm8150 is 0x4100c244, but the idle state doesn't work at all
if I use the same value on mainline. The logic appears to be the same in
the downstream sdm845 kernel. Maybe it has to do with how downstream has
"notify RPM" before attempting to enter the idle state?

In downstream, the final PSCI value is calculated as the sum of:

1. (cluster-mode & cluster-mode-mask) << cluster-mode-shift = (0xc24 & 0xfff) << 4 = 0xc240
2. (is-reset << 30) = 0x40000000
3. (affinity level & 0x3) << 24 = 0x1000000
4. (cpu-mode) = 0x4

so 0xc240 + 0x40000000 + 0x1000000 + 0x4 = 0x4100c244.

It's also possible that the problem comes from the cluster idle state
needing all CPUs in the cluster to be asleep (as far as I know), since
it doesn't look like mainline handles that.

> 
> Regards,
> Bjorn
> 
> > +				entry-latency-us = <3263>;
> > +				exit-latency-us = <6562>;
> > +				min-residency-us = <9987>;
> > +				local-timer-stop;
> > +			};
> > +		};
> >  	};
> >  
> >  	firmware {
> > -- 
> > 2.29.2
> > 
>
