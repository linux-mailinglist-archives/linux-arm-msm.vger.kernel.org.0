Return-Path: <linux-arm-msm+bounces-4720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67341812C41
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 10:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 242D92827AC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Dec 2023 09:56:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972C935F13;
	Thu, 14 Dec 2023 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GADCLlq3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701F32E854;
	Thu, 14 Dec 2023 09:56:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7342C433C7;
	Thu, 14 Dec 2023 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702547792;
	bh=wGKhND1VfRS+D1xAwDoI8Hg7Nwb7ZoAYE7B0z+inPCM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GADCLlq3M+2WeHKjyGpBSbsGGuM6Aq3ZPmvdby8mBpQHiXZWnWRCCJI0UI7UedGtc
	 3WuWgWBoGU8ioevc1HxgM2lZmQJuS9Qy2a1ZqX322zNaD8sIy5R1yqrJ0DS1TZ4dpD
	 osLRPlatKi68ocGgfxrP9j9Ixoi8G+GYBlOzEzvh+1qJNVQ/+zCJRurIhZB2m87y1I
	 LVwyjP1rAUsMMU7GX8Q1uY6B3gi1KhRXs06VeRXhYnTIAZ6Ae2pMMgKroZtOF2ewqh
	 qUB62T45DB2cBOs4QRnFBYdiqgMm1jCBEakytBzQInGC2l0b42Phvrz/Cc2A9XnqUB
	 F6WKFeiXrSaRA==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1rDiSB-0007l7-1q;
	Thu, 14 Dec 2023 10:56:28 +0100
Date: Thu, 14 Dec 2023 10:56:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andy Gross <agross@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, quic_ppratap@quicinc.com,
	quic_jackp@quicinc.com, Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZXrRS7O0Cv1sAJdk@hovoldconsulting.com>
References: <20231211121124.4194-1-quic_kriskura@quicinc.com>
 <20231211121124.4194-2-quic_kriskura@quicinc.com>
 <24fb0b25-0139-4370-864c-839ae931f847@linaro.org>
 <c5d85c84-3783-4262-a379-1f28e13ae4ce@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5d85c84-3783-4262-a379-1f28e13ae4ce@quicinc.com>

On Wed, Dec 13, 2023 at 09:48:57PM +0530, Krishna Kurapati PSSNV wrote:
> On 12/13/2023 12:45 PM, Krzysztof Kozlowski wrote:
> > On 11/12/2023 13:11, Krishna Kurapati wrote:
> >> The high speed related interrupts present on QC targets are as follows:

> >> Classiffy SoC's into four groups based on whether qusb2_phy interrupt

typo: Classify

> >> or {dp/dm}_hs_phy_irq is used for wakeup in high speed and whether the
> >> SoCs have hs_phy_irq present in them or not.
> >>
> >> The ss_phy_irq is optional interrupt because there are mutliple SoC's
> >> which either support only High Speed or there are multiple controllers
> >> within same Soc and the secondary controller is High Speed only capable.
> >>
> >> This breaks ABI on targets running older kernels, but since the interrupt
> >> definitions are given wrong on many targets and to establish proper rules
> >> for usage of DWC3 interrupts on Qualcomm platforms, DT binding update is
> >> necessary.
> > 
> > This still does not explain why missing property has to be added as
> > first one, causing huge reordering of everything here and in DTS.
> > 
> > If pwr_event is required and we already break the ABI, reduce the impact
> > of the change by putting it after all required interrupts. Otherwise
> > please explain here and in commit msg why different approach is taken.
> > 
> 
> Hi Krzysztof. I don't know much about the effect of the ordering on ABI. 
> I will try to learn up on it. Would the series be good if we just move 
> the pwr_event to the end and keep everything in v3 as it is, and push v4 
> for now ?

Since all SoCs have the pwr_event (HS) interrupt, but not all
controllers have the SS PHY interrupt, this would prevent expressing
that the SS PHY is optional by keeping it last in the binding schema and
making sure that minItem = maxItems - 1.

And as we discussed, the aim here is to group the three classes of SoCs
(qusb2, qusb2+, femto) and fix the order of these interrupts once and
for all so that random reorderings, renames and omissions do not make it
into the bindings next time someone grabs a downstream DT and sends it
upstream.

Johan

