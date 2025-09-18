Return-Path: <linux-arm-msm+bounces-74028-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8CDB82F5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 07:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF663B643E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 05:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A8327380C;
	Thu, 18 Sep 2025 05:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kVdicM2A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17EB288DA;
	Thu, 18 Sep 2025 05:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758172373; cv=none; b=odfQxPJndPmKdInoqdKCehvTeRk3sJLQcplS3pqRnFK/qeRmdLbD5UnioaXjlTzBCTC8oqFVB3EDvNMCJptw1wehMsG46oaswFWu3VYTfeUIRYLXenV9Qe4fcphUKr/pb6yeXmdLhx/5HHhpToE4WzF0Y5I+puXcNr2hnEoea7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758172373; c=relaxed/simple;
	bh=HFdqpdCVK4K8kf2it97XPQ/2ZzONliQ/Awo5whsmuUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IyLDSNE4P8T9tDFgF5O1nHjLI1FuJt+S5imjbNC++UUT/6fodW6z4w0S8Xe7y+p5q86AG7GXbLRgdphaBJsWh6cZQqXFiyiJodeKffg7Fn7FnsW/Eu3l4vDJu0ox+f6uaE8BW1CdAg/8xc0GLCq/VQ8lnts0Bc5Kd/mABA9meOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kVdicM2A; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758172371; x=1789708371;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HFdqpdCVK4K8kf2it97XPQ/2ZzONliQ/Awo5whsmuUE=;
  b=kVdicM2A84ZoYd6efUBP4D7eIehhGvlb+Hydjw6zRlbRTNdQMS/nj2oD
   2BCHACaYvRW4yYZuq0+g6F0uoMGUxhsU4RGZCqASoIXi7nz1TNujewybP
   bGT3hkF0FtvZ8y4LFvBcF5V+dYf1r4ROdofpq7sK79PMrGS52YFvJyZHS
   kwJQ9frKlxv3BNtrDc2DNU/kE8SyWrSgZ8XDy73+M4qlJY8zR47J+T2z4
   gWubyX3rVk++67sPu6nkZbETpEVEGqTP53Q58/YeorbhcFCbw174rJjNB
   3ngQ7Tx6yd7eO7gyQUy7gPG89YbjaVb+VKRtcFskBTOs+c4CkJ2LPbonz
   Q==;
X-CSE-ConnectionGUID: 86iFbsvPTa2NwRamuQCzrA==
X-CSE-MsgGUID: uA4E2NlrTeySC+ZMui1toQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="71858355"
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="71858355"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 22:12:50 -0700
X-CSE-ConnectionGUID: xmoM/zq4RwGkiiLdcsJZ6A==
X-CSE-MsgGUID: 6Rs0zsyfR6WDdwNAxkDL6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,274,1751266800"; 
   d="scan'208";a="175832723"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 17 Sep 2025 22:12:46 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AF47C95; Thu, 18 Sep 2025 07:12:44 +0200 (CEST)
Date: Thu, 18 Sep 2025 07:12:44 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	Jack Pham <quic_jackp@quicinc.com>,
	Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Mayank Rana <mayank.rana@oss.qualcomm.com>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: thunderbolt: Add Qualcomm USB4 Host
 Router
Message-ID: <20250918051244.GJ2912318@black.igk.intel.com>
References: <20250916-topic-qcom_usb4_bindings-v1-1-943ecb2c0fa7@oss.qualcomm.com>
 <20250917061236.GF2912318@black.igk.intel.com>
 <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e648a71f-a642-4f5d-bcf8-893484cfe601@oss.qualcomm.com>

Hi,

On Wed, Sep 17, 2025 at 08:36:19PM +0200, Konrad Dybcio wrote:
> On 9/17/25 8:12 AM, Mika Westerberg wrote:
> > Hi Konrad,
> > 
> > On Tue, Sep 16, 2025 at 10:06:01PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> [...]
> 
> >> P.S.
> >> The driver part (which has quite some dependencies) is not yet 100%
> >> ready to share and will be published at a later date.
> > 
> > Okay, I think it is beter to submit the bindings with the driver changes so
> > that we can see the big picture.
> 
> We're not going to do that just yet, but I'll give you the gist of it
> (partially also responding to Dmitry's other reply to this email):

Fair enough.

> - The current thunderbolt implementation is almost entirely reused
> 
> - Our HR is MMIO-mapped and always present (i.e. it's not a PCIe device).
>   Since the NHI code already uses I/O accessors, we simply ioremap() the
>   NHI region and feed the existing code the __iomem ptr (really cool)
> 
> - Because it's not a PCIe device, all the places where the code assumes
>   it can freehand dereference nhi->pdev are altered to instead consume
>   a struct device *, i.e.:
> 
> diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
> index 75247486616b..d05f8d6896e7 100644
> --- a/include/linux/thunderbolt.h
> +++ b/include/linux/thunderbolt.h
> @@ -493,22 +493,37 @@ static inline struct tb_xdomain *tb_service_parent(struct tb_service *svc)
>   *                 MSI-X is used.
>   * @hop_count: Number of rings (end point hops) supported by NHI.
>   * @quirks: NHI specific quirks if any
> + * @is_pci: Whether the NHI is a PCI device
>   */
>  struct tb_nhi {
>         spinlock_t lock;
> -       struct pci_dev *pdev;
> +       struct device *dev;
>         const struct tb_nhi_ops *ops;
>         void __iomem *iobase;
>         struct tb_ring **tx_rings;
>         struct tb_ring **rx_rings;
> -       struct ida msix_ida;
>         bool going_away;
>         bool iommu_dma_protection;
>         struct work_struct interrupt_work;
>         u32 hop_count;
>         unsigned long quirks;
> +       bool is_pcie;
>  };
>  
> +struct tb_nhi_pci {
> +       struct pci_dev *pdev;
> +       struct ida msix_ida;
> +       struct tb_nhi nhi;
> +};
> +
> +static inline struct tb_nhi_pci *nhi_to_pci(struct tb_nhi *nhi)
> +{
> +       if (WARN_ON(!nhi->is_pcie))
> +               return NULL;
> +
> +       return container_of(nhi, struct tb_nhi_pci, nhi);
> +}
> 
> I suppose I can probably get this decoupling sent in advance of the rest..
> It's quite delicate so I'm hoping I won't cause any random nullptrs for you

Instead of the above is_pcie thing, can you split it so that the PCI parts
live in pci.c and the "platform" parts live in platform.c (or perhaps this
is fauxbus now). Then the core part of the NHI code (nhi.c) just works
regardless of how the controller is wired to the SoC.

There are plenty of examples in the kernel how to do this.

> - Additional steps are necessary to take the hardware out of reset, set
>   some magic values here and there, load the firmware (i.e. memcpy_toio())
>   wake up the MCU and perform Type-C magic (more on that below), all of
>   which is handled in a new qcom_usb4.c, which does that and ends its probe
>   function with a nhi_probe_common(). PM of the hardware and its providers
>   also takes place in Linux, just like with any other IP block on embedded
>   systems

Call it qcom.c. But please try to move all the non-PCI generic parts into
platform.c and then only the Qualcomm specific things live in qcom.c. Idea
is that we can re-use all that when for example Apple Silicon support is
added and so on.

> - Because the Type-C pipeline varies wildly across Qualcomm SoCs and even
>   devices using the same SoC, we need to register a typec_mux to receive
>   generic (alt)mode notifications. The is more or less:
> 
> pmic_glink_altmode/ucsi (altmode notification provider)
> |-> QMPPHY (Qualcomm proprietary USB4/TBT3/USB3/DP mode switchable PHY)
>   |-> (optionally) Onboard switch (e.g. FSA4480)
>     |-> (optionally) Onboard retimer (e.g. Parade PS883x)
>       |-> USB4 HR (pinging the MCU with some mode/cable info)
> 
> The actual entry logic (sanity checking, magic VDMs, SOP/'/'' comms)
> happen on a remote processor - Audio DSP (yes) in the case of X1E and
> the OS is graciously presented with a trimmed-down notification that
> the altmode has been entered and it better cooperate

Okay.

> [...]
> 
> >> +  reg-names:
> >> +    items:
> >> +      - const: router
> >> +      - const: router_config
> >> +      - const: tmu_config
> >> +      - const: port_group
> >> +      - const: sideband
> >> +      - const: uc_ram
> >> +      - const: uc_per
> >> +      - const: uc_mbox
> >> +      - const: nhi
> >> +      - const: cfg
> >> +      - const: debug
> >> +      - const: usbap_config
> >> +      - const: pcieap_config
> >> +      - const: dpap0_aux
> >> +      - const: dpap0_config
> >> +      - const: dpap1_aux
> >> +      - const: dpap1_config
> > 
> > Are these the specific to the host controller? I mean route_config sounds
> > pretty much like Router Config space and that is available through the USB4
> > fabric so not sure why this is listed?
> > 
> > Also this does not list the standard Host Interface registers, is that on
> > purpose?
> 
> The 'nhi' region contains the entire spec-standardized set of registers,
> everything else is qc-specific. The host router has internal connections
> to the native protocol controllers, so the XXXap_config regions include some
> tunables related to that.
> 
> The uc_ regions relate to the block's MCU.
> 
> router/router_config refer to top-level tunables or control/state registers.
> 
> tmu_config is the same, for the internal timing management unit.
> 
> debug/cfg are self-explanatory
> 
> Most of those will be left unused, but the binding has to be forward
> looking, in case some sort of a software workaround is required down
> the line

Got it, thanks for the explanation.

> >> +
> >> +  interrupts:
> >> +    items:
> >> +      - description: Combined event interrupt for all three rings
> >> +      - description: OOB Firmware interrupt
> > 
> > No MSI? If not then at least I suggest to support it in the DT description.
> 
> No, it seems like across the SoC we only have MSIs on the PCIe RCs
> 
> Because I don't know what a valid MSI setup would look like, I'd like
> to defer adding that description to when a platform with them pops up

I it hard to change these DT bindings later on? If yes then I would
definitely think forward and make this support MSI from the get-go.

> [...]
> 
> >> +  wakeup-source: true
> > 
> > What about the "power contract"? Are you using the existing we have for
> > ACPI:
> > 
> > https://learn.microsoft.com/en-us/windows-hardware/drivers/pci/dsd-for-pcie-root-ports#map-native-protocols-pcie-displayport-tunneled-through-usb4-to-usb4-host-routers
> > 
> > It was designed DT in mind but I don't think we have DT bindings for it.
> > This is needed to make sure the driver (Connection Manager) creates the
> > tunnels before the native protocol stacks get enumerated (e.g during power
> > transitions).
> 
> I added a custom entry to drivers/of/property.c, matching that name.
> Seems to work fine (tm) so far, but then we haven't yet tested sus/res
> much.. 
> 
> Just to make sure - are we expected to ensure that the NHI device is
> resumed before any protocol controller drivers (at runtime), or do the
> latter have to *probe* only after they're necessary? I firmly believe
> the former, but doesn't hurt to ask..

The former. The TB driver needs to setup tunnels before native protocol
stacks and their drivers (e.g PCIe and the like) resume. We have the
device_link from the native "port" / device to the NHI that deals with it
but it expects the property to be there.

> [...]
> >> +            port {
> >> +                usb4_0_mode_in: endpoint {
> >> +                };
> > 
> > This describes the Downstream Facing Port (e.g USB4 port), right? We have
> > something similar used in Chromebooks so it would be good if we can make
> > the bindings close to each other if possible. This allows binding firmware
> > description to retimers (and also to "fixed/embedded" device routers as
> > recent changes to the USB4 spec makes possible).
> > 
> > See drivers/thunderbolt/acpi.c::tb_acpi_find_companion().
> 
> Yes, this binding assumes the Host Router has precisely 1 DFP (Linux
> Type-C infra isn't ready for anything more, at least not on the DT side
> to my knowledge) and this port (which isn't necessarily the same as a
> connector, i.e. a physical receptacle in DT speak, it simply refers to
> an abstract data connection between two devices)

Okay I'm not too familiar with the current DT bindings.

> Notably, I don't think we currently describe the USB4 port (as in, the
> usb4_port.c meaning of it) at all, but for on-SoC HRs we know all about
> them, so perhaps a subnode description could make sense. This way we
> could also point them to the compatible = "usb-c-connector" node

It should be something (eventually at least :-)) that allows us to describe the
USB4 ports and on-board retimers (to make it possible to upgrade firmwares
on those even if there is no link). But also if there is "embedded link"
device router.

