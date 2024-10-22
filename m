Return-Path: <linux-arm-msm+bounces-35485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF0B9ABA42
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Oct 2024 01:54:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19A162817FF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Oct 2024 23:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2378E1CEE8F;
	Tue, 22 Oct 2024 23:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OcP08QOd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7291CDFC8;
	Tue, 22 Oct 2024 23:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729641279; cv=none; b=m0mhCk4B+5VGymUUL4fhJslfZ6x0JDzhTPNRZ0r8vCHXqQ1xuUx6JijSlMQChIAVwv+IU06AeW0OBKr1bWvrUrQPkNzE4JOnxANoojnAvXUQMwLUtIPK6n7GdaG5Gt8xFi1QrdRWdNvot18sB+xdLB3ZGMoveuGbO3qyf7X5j08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729641279; c=relaxed/simple;
	bh=oaIE2+YTrWvXAsSPmtB6UaYr/m5HRh9uVimWLPJIWbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JgMt8m6EQRMfVOKFvz/nluoVxyv+47TNlXLL2lk7OjLHDoyCM1Pzjf0s1Q5ARc0g0SqithFQOMcxr8RQXo+DhUqaGb7MTmSpgmCK52r56FceZEQuOcSIG6806MMgY/eDJ8DRksmoCbRJDT+2S6eutgEFAeH6XOBdS13NjsDsOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OcP08QOd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE47C4CEC3;
	Tue, 22 Oct 2024 23:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729641278;
	bh=oaIE2+YTrWvXAsSPmtB6UaYr/m5HRh9uVimWLPJIWbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OcP08QOd87Jy4tqgzPcNQocfXaI6m5TKxJNdb5sUJEs2hBqci6oE7PC37bJtiGHBf
	 4lny/crMdrWIc4rqRi6Il59V9bleDxhAguDXyxBWPdzW6gCgTPocjKxeTVpTUkeUjA
	 /sTNYStvRk5Zz0f2BAUmvyxNml+Y5gmSJQyb6Pqccfz3eitEPDmJaiSA5con76HtKe
	 lDzmWouRZit3+xkszrnRVC6nBK+Oyy0vnEfJblWq7UiGzp5A5fcyFQiPoIxHaao4ZW
	 Kd6X2dVd6TxxWGtGpyq0dbA0fH2ifRkzu4QEcrPfaa2w0+0hyWNtBoRA9MtwTfPlia
	 zr02eR09wWRWQ==
Date: Tue, 22 Oct 2024 18:54:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: krzk+dt@kernel.org, quic_krichai@quicinc.com, 
	quic_vbadigan@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sa8775p: Update iommu-map entry
Message-ID: <ndu3y3dk2zvezqqhczry24arai5gk6rqlghznxru3zcxevnmrc@jjrff25gzjq3>
References: <20241008121755.1174730-1-quic_skananth@quicinc.com>
 <70c2e4c0-aa5a-4d61-9b12-ee7cc5106ead@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70c2e4c0-aa5a-4d61-9b12-ee7cc5106ead@quicinc.com>

On Tue, Oct 08, 2024 at 05:55:27PM GMT, Subramanian Ananthanarayanan wrote:
> 
> On 10/8/2024 5:47 PM, Subramanian Ananthanarayanan wrote:
> > SA8775P has only support for SMMU v2, due to this PCIe has limited
> > SID entries to enable dynamic IOMMU mapping in the driver, hence
> > we are updating static entries.
> > 
> > iommu-map entries are added to support more PCIe device like switch
> > attach, SRIOV capable devices. These entries are specific to this
> > board as topology of PCIe devices can vary based on the end usecase
> > connected via PCIe. For other board files, these entries may
> > not be directly applicable.
> > 
> > Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> > ---
> > Changes in V2:
> > 	- Updated commit message.
> 
> forgot to add link to v1 : https://lore.kernel.org/lkml/20241001114601.1097618-1-quic_skananth@quicinc.com/
> 

Please use b4, as described on go/upstream, and you can not forget.

Regards,
Bjorn

> -Subramanian
> 
> > ---
> > ---
> >   arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 62 ++++++++++++++++++++++
> >   1 file changed, 62 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > index 0c1b21def4b6..05c9f572ae42 100644
> > --- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
> > @@ -675,6 +675,37 @@ &pcie0 {
> >   	pinctrl-names = "default";
> >   	pinctrl-0 = <&pcie0_default_state>;
> > +	iommu-map = <0x0 &pcie_smmu 0x0000 0x1>,
> > +		    <0x100 &pcie_smmu 0x0001 0x1>,
> > +		    <0x101 &pcie_smmu 0x0002 0x1>,
> > +		    <0x208 &pcie_smmu 0x0003 0x1>,
> > +		    <0x210 &pcie_smmu 0x0004 0x1>,
> > +		    <0x218 &pcie_smmu 0x0005 0x1>,
> > +		    <0x280 &pcie_smmu 0x0006 0x1>,
> > +		    <0x281 &pcie_smmu 0x0007 0x1>,
> > +		    <0x282 &pcie_smmu 0x0008 0x1>,
> > +		    <0x283 &pcie_smmu 0x0009 0x1>,
> > +		    <0x284 &pcie_smmu 0x000a 0x1>,
> > +		    <0x285 &pcie_smmu 0x000b 0x1>,
> > +		    <0x286 &pcie_smmu 0x000c 0x1>,
> > +		    <0x287 &pcie_smmu 0x000d 0x1>,
> > +		    <0x288 &pcie_smmu 0x000e 0x1>,
> > +		    <0x289 &pcie_smmu 0x000f 0x1>,
> > +		    <0x28a &pcie_smmu 0x0010 0x1>,
> > +		    <0x28b &pcie_smmu 0x0011 0x1>,
> > +		    <0x28c &pcie_smmu 0x0012 0x1>,
> > +		    <0x28d &pcie_smmu 0x0013 0x1>,
> > +		    <0x28e &pcie_smmu 0x0014 0x1>,
> > +		    <0x28f &pcie_smmu 0x0015 0x1>,
> > +		    <0x290 &pcie_smmu 0x0016 0x1>,
> > +		    <0x291 &pcie_smmu 0x0017 0x1>,
> > +		    <0x292 &pcie_smmu 0x0018 0x1>,
> > +		    <0x293 &pcie_smmu 0x0019 0x1>,
> > +		    <0x300 &pcie_smmu 0x001a 0x1>,
> > +		    <0x400 &pcie_smmu 0x001b 0x1>,
> > +		    <0x500 &pcie_smmu 0x001c 0x1>,
> > +		    <0x501 &pcie_smmu 0x001d 0x1>;
> > +
> >   	status = "okay";
> >   };
> > @@ -685,6 +716,37 @@ &pcie1 {
> >   	pinctrl-names = "default";
> >   	pinctrl-0 = <&pcie1_default_state>;
> > +	iommu-map = <0x0 &pcie_smmu 0x0080 0x1>,
> > +		    <0x100 &pcie_smmu 0x0081 0x1>,
> > +		    <0x101 &pcie_smmu 0x0082 0x1>,
> > +		    <0x208 &pcie_smmu 0x0083 0x1>,
> > +		    <0x210 &pcie_smmu 0x0084 0x1>,
> > +		    <0x218 &pcie_smmu 0x0085 0x1>,
> > +		    <0x280 &pcie_smmu 0x0086 0x1>,
> > +		    <0x281 &pcie_smmu 0x0087 0x1>,
> > +		    <0x282 &pcie_smmu 0x0088 0x1>,
> > +		    <0x283 &pcie_smmu 0x0089 0x1>,
> > +		    <0x284 &pcie_smmu 0x008a 0x1>,
> > +		    <0x285 &pcie_smmu 0x008b 0x1>,
> > +		    <0x286 &pcie_smmu 0x008c 0x1>,
> > +		    <0x287 &pcie_smmu 0x008d 0x1>,
> > +		    <0x288 &pcie_smmu 0x008e 0x1>,
> > +		    <0x289 &pcie_smmu 0x008f 0x1>,
> > +		    <0x28a &pcie_smmu 0x0090 0x1>,
> > +		    <0x28b &pcie_smmu 0x0091 0x1>,
> > +		    <0x28c &pcie_smmu 0x0092 0x1>,
> > +		    <0x28d &pcie_smmu 0x0093 0x1>,
> > +		    <0x28e &pcie_smmu 0x0094 0x1>,
> > +		    <0x28f &pcie_smmu 0x0095 0x1>,
> > +		    <0x290 &pcie_smmu 0x0096 0x1>,
> > +		    <0x291 &pcie_smmu 0x0097 0x1>,
> > +		    <0x292 &pcie_smmu 0x0098 0x1>,
> > +		    <0x29d &pcie_smmu 0x0099 0x1>,
> > +		    <0x300 &pcie_smmu 0x009a 0x1>,
> > +		    <0x400 &pcie_smmu 0x009b 0x1>,
> > +		    <0x500 &pcie_smmu 0x009c 0x1>,
> > +		    <0x501 &pcie_smmu 0x009d 0x1>;
> > +
> >   	status = "okay";
> >   };

