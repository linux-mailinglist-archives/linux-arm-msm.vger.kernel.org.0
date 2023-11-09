Return-Path: <linux-arm-msm+bounces-307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBF57E6D23
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 16:17:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBDB81C209E7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Nov 2023 15:17:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D31C200B8;
	Thu,  9 Nov 2023 15:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oV2OIafN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78ED2200A0;
	Thu,  9 Nov 2023 15:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7C7C433C9;
	Thu,  9 Nov 2023 15:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699543054;
	bh=1ab0r9i5DGuvYPCtoOMvG0eN/rc1s2wBDkNDgZtjLaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oV2OIafN06s2eNWEnx2dUQ2XeJPPPjUEg/Xor9hSnD42l4Z1HVTC0N63HY7bPT8wq
	 eRh1IWQZh9vwcqCRUoijvuvThcU5EN9TpqzTMKbDQ6CDc0qM6WNUgwutlIs+ozIl+f
	 cGzgzUZK4y/+h9zhXAwoTUmiYTFDO2/TuzJhR1/k1/0Fj13/WVv3Eisk28ONoVXvr1
	 xckjTAIZttYj1gus28Wf7p1O50XX8ioRTjCT9UvxL2mNcdIqthNkQlBTh2n7M9fNol
	 zFwmBJEb/dKfo+j9v8yJ6oTFk8Wo/se69MJH18aVQaf+A1OkUjQy/ZZBZfj91UEcTv
	 EvVwapb+mGTUw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1r16nc-0007Re-2M;
	Thu, 09 Nov 2023 16:18:28 +0100
Date: Thu, 9 Nov 2023 16:18:28 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Felipe Balbi <balbi@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, quic_pkondeti@quicinc.com,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com,
	ahalaney@redhat.com, quic_shazhuss@quicinc.com
Subject: Re: [PATCH v13 05/10] usb: dwc3: qcom: Refactor IRQ handling in QCOM
 Glue driver
Message-ID: <ZUz4RD3MjnLlPn6V@hovoldconsulting.com>
References: <20231007154806.605-1-quic_kriskura@quicinc.com>
 <20231007154806.605-6-quic_kriskura@quicinc.com>
 <ZTJ_T1UL8-s2cgNz@hovoldconsulting.com>
 <14fc724c-bc99-4b5d-9893-3e5eff8895f7@quicinc.com>
 <ZTY7Lwjd3_8NlfEi@hovoldconsulting.com>
 <cabf24d0-8eea-4eb5-8205-bf7fe6017ec2@quicinc.com>
 <ZTZ-EvvbuA6HpycT@hovoldconsulting.com>
 <fb5e5e1d-520c-4cbc-adde-f30e853421a1@quicinc.com>
 <ZTdqnSHq_Jo8AuPW@hovoldconsulting.com>
 <04615205-e380-4719-aff1-f32c26004b14@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04615205-e380-4719-aff1-f32c26004b14@quicinc.com>

On Fri, Nov 03, 2023 at 03:34:52PM +0530, Krishna Kurapati PSSNV wrote:
> On 10/24/2023 12:26 PM, Johan Hovold wrote:
> > On Mon, Oct 23, 2023 at 10:42:31PM +0530, Krishna Kurapati PSSNV wrote:
> >> On 10/23/2023 7:37 PM, Johan Hovold wrote:
> > 
> >>> Right. And I assume there are hs_phy_irqs also for the first two USB
> >>> controllers on sc8280xp?
> > 
> >> There are, I can dig through and find out. Atleast in downstream I don't
> >> see any use of them.
> > 
> > Yes, please do post how these are wired as well for completeness.

Did you find these two interrupts as well?

> >>> Can you find out anything more about what hs_phy_irq is used for? It
> >>> appears to be an HS wakeup interrupt like the dp/dm ones, but there are
> >>> not really any details on how it is supposed to be used.
> >>
> >>    This IRQ is really not used in downstream controllers. Not sure if its
> >> a good idea to add driver code for that. I did some digging and I got
> >> the reason why I first said that there is only one hs_phy_irq for
> >> tertiary port of controller. The hardware programming sequence doesn't
> >> specify usage of these 4 IRQ's but the hw specifics mention that there
> >> are 4 of them. Adding driver support for these IRQ's is not a good idea
> >> (atleast at this point because they are not used in downstream and I am
> >> not sure what would be the side effect). For now I suggest we can add
> >> them in bindings and DT and not handle the 4 hs_phy_irq's in the driver
> >> code (meaning not add the hs_phy_irq to port structure we plan on adding
> >> to dwc3_qcom).
> > 
> > But there is already support for these interrupts in the driver. You
> > work for Qualcomm who built the thing so surely you can figure how they
> > intended these to be used?
> > 
> > You need to provide this information so that we can determine what the
> > binding should look like. The implementation would also be simplified if
> > we don't have to add random hacks to it just because we don't know why
> > the vendor driver you refer does not use it currently on this particular
> > platform.

> Regarding the points of discussion we had last week on [1], here are 
> some clarifications:
> 
> 1. We do have hs_phy_irq 1/2/3/4 for tertiary port of Sc8280 as 
> mentioned. Why do we need them and would we use it in multiport targets ?
> 
> DPSE and DMSE are single ended line state of DP and DM lines. The DP 
> line and DM line stay in steady High or Low during suspend and they flip 
> when there is a RESUME or REMOTE WAKE. This is what we do/check in 
> dwc3_qcom_enable_interrupts call for dp/dm irq's based on usb2_speed.

Right, this bit is clear.

> Initially in QUSB2 targets, the interrupts were enabled and configured 
> in phy and the wakeup was interrupt was read on hs_phy_irq vector - [2].
> In that case, we modify DP/DM interrupts in phy registers, specifically 
> QUSB2PHY_INTR_CTRL and when wakeup signal comes in, hs_phy_irq is 
> triggered. But in femto targets, this is done via DP/DM interrupts and 
> there is no use of hs_phy_irq. Even hw folks confirmed they dont use 
> hs_ph_irq in femto phy targets.

Ok, thanks for pointing to QUSB2. The same mechanism is apparently used
in phy-qcom-usb-hs-28nm.c as well (even if the dtsi currently does not
define the wakeup interrupts).

Furthermore, that implementation is broken and has never worked due to
another half-arsed, incomplete Qualcomm implementation. Specifically, no
one is changing the PHY mode based on the current speed before suspend
as commits like 

	3b3cd24ae61b ("phy: Add USB speed related PHY modes")

and

	891a96f65ac3 ("phy: qcom-qusb2: Add support for runtime PM")

depend on. Guess I should go revert that mess too...

> As an experiment, I tried to test wakeup by pressing buttons on 
> connected keyboard when in suspend state or connecting/disconnecting 
> keyboard in suspended state on different ports and only see dp/dm IRQ's 
> getting fired although we register for hs_phy_irq as well:
> 
> / # cat /proc/interrupts  |grep phy_
> 171:   1  0   0   0  0  0  0  0       PDC 127 Edge      dp_hs_phy_1
> 172:   2  0   0   0  0  0  0  0       PDC 126 Edge      dm_hs_phy_1
> 173:   3  0   0   0  0  0  0  0       PDC 129 Edge      dp_hs_phy_2
> 174:   4  0   0   0  0  0  0  0       PDC 128 Edge      dm_hs_phy_2
> 175:   0  0   0   0  0  0  0  0       PDC 131 Edge      dp_hs_phy_3
> 176:   2  0   0   0  0  0  0  0       PDC 130 Edge      dm_hs_phy_3
> 177:   2  0   0   0  0  0  0  0       PDC 133 Edge      dp_hs_phy_4
> 178:   5  0   0   0  0  0  0  0       PDC 132 Edge      dm_hs_phy_4
> 179:   0  0   0   0  0  0  0  0       PDC  16 Level     ss_phy_1
> 180:   0  0   0   0  0  0  0  0       PDC  17 Level     ss_phy_2
> 181:   0  0   0   0  0  0  0  0     GICv3 163 Level     hs_phy_1
> 182:   0  0   0   0  0  0  0  0     GICv3 168 Level     hs_phy_2
> 183:   0  0   0   0  0  0  0  0     GICv3 892 Level     hs_phy_3
> 184:   0  0   0   0  0  0  0  0     GICv3 891 Level     hs_phy_4

Yes, but that doesn't really say much since you never enable the hs_phy
interrupt in the PHY on suspend.
 
> Since the hs_phy_irq is applicable only for qusb2 targets, do we still 
> need to add it to DT.

Are you sure there's no support for hs_phy_irq also in the "femto" PHYs
and that it's just that there is currently no driver support for using
them?

And why is it defined if there is truly no use for it?

Also, if hs_phy_irq and dp/dm_phy_irq were mutually exclusive, why does
the following Qualcomm SoCs define all three?

              - qcom,ipq4019-dwc3
              - qcom,ipq6018-dwc3
              - qcom,ipq8064-dwc3
              - qcom,ipq8074-dwc3
              - qcom,msm8994-dwc3
              - qcom,qcs404-dwc3
              - qcom,sc7180-dwc3
	      - qcom,sc7280-dwc3
              - qcom,sdm670-dwc3
              - qcom,sdm845-dwc3
              - qcom,sdx55-dwc3
              - qcom,sdx65-dwc3
              - qcom,sm4250-dwc3
              - qcom,sm6125-dwc3
              - qcom,sm6350-dwc3
              - qcom,sm8150-dwc3
              - qcom,sm8250-dwc3
              - qcom,sm8350-dwc3
              - qcom,sm8450-dwc3
              - qcom,sm8550-dwc3

Some of those use QUSB2 PHYs and some use "femto" PHYs.

And this comes from Qualcomm through commits like:

	0b766e7fe5a2 ("arm64: dts: qcom: sc7180: Add USB related nodes")
	bb9efa59c665 ("arm64: dts: qcom: sc7280: Add USB related nodes")

> 2. BAM Irq usage (u_usb31_scnd_mvs_pipe_wrapper_usb31_bam_irq[0]):
> 
> BAM IRQ is not needed in host-only controller. It was just added in 
> process of porting/deriving code from DRD controllers and is 
> non-functional (confirmed by HW team here). We can skip this from DT of 
> multiport.

Ok, good.

> 3. ctrl_irq[1] usage:
> 
> This is a feature of SNPS controller, not qcom glue wrapper, and is 
> present on all targets (non-QC as well probably). As mentioned before on 
> [3], this is used for HW acceleration.
> 
> In host mode, XHCI spec does allow for multiple interrupters when 
> multiple event rings are used. A possible usage is multiple execution 
> environments something like what we are doing on mobile with ADSP audio 
> offload [4]. Another possibility could be some of virtualization where 
> host/hyp would manage the first interrupter and could allow a guest to 
> operate only with the second (though current design does not go far 
> enough to offer true isolation for real VM type workloads). The 
> additional interrupts (ones other than ctrl_irq[0]) are either for 
> virtualization use cases, or for our various “hw offload” features. In 
> device mode, these are used for offloading tethering functionality to 
> IPA FW.

Ok, thanks for clarifying what you meant by "HW acceleration".

> Since the DeviceTree passed to the OS, should describe the hardware to 
> the OS, and should represent the hardware from the point-of-view of the 
> OS, adding one interrupt (ctrl_irq[0]) might be sufficient as Linux 
> would not use the other interrupts.

I've only skimmed the virtualisation bits in xHCI spec, but it seems
Linux as VMM would still be involved in assigning these interrupts to
VMs.

This may possibly be something that we can ignore for now, but perhaps
someone more familiar with the hardware, like Thinh, can chime in.

> Furthermore AFAIK even UEFI/Windows 
> also use only ctrl_irq[0] for host mode in their execution environment 
> today. Do we still need to add this to bindings and DT ?

But the second interrupt is described in the ACPI tables, which means
that a simple driver update could (in theory) allow for it to be used.

You need to get into the same mindset when it comes to devicetree. Even
if Linux currently does not use an interrupt, like the pwr_event_irq,
you should still add it so that when/if someone implements support for
it, an older platform using the original dt may also take advantage of
it.

Sure, there are complications and we sometimes break DT backwards
compatibility, but this is the goal that you should strive for.

Johan

