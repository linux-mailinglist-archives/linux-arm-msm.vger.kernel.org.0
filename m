Return-Path: <linux-arm-msm+bounces-82682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED06C7448D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 14:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4354B355633
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B5A533A006;
	Thu, 20 Nov 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DnClM+ww"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709A0258EFC;
	Thu, 20 Nov 2025 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763645455; cv=none; b=Q9hFlakf8nI5g9Ckznqk6I1MWBSausHeWvHnMXMImYkhvry+WXB3YtMtl+iuYHhvTA749BB0VojKyxU1QpB0Gj83iP5M7zcqEZYU6hTg23F6ap06izuMcpK8Qp/o4A7B+wYW45Zgz9G99Us1j4dxgOMx8XgthtwnKQOh/WHSb00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763645455; c=relaxed/simple;
	bh=Givm/hktJ8XSzaSQNKnhwSeeHNx1dcVC53O89fZfg6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CipBTk91B2frwhn+1psu1j92Bh6Kq3UZ9SgXWJz2APDx7/z3oF68eoFhTlAMMjMf4NxWsdW6RSbNzElZ9dxX9eSzPMGa4t3KWtnJRabfgX0ILZkYmoXwCIQ0Etdu0SbIMM0ETyHd5PkrgDpH0JYET1lQq8JTG/pEQtS+8nnwv7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DnClM+ww; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4507CC4CEF1;
	Thu, 20 Nov 2025 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763645455;
	bh=Givm/hktJ8XSzaSQNKnhwSeeHNx1dcVC53O89fZfg6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DnClM+wwarsTProD+7NUyjlc5fgHa5SgEkXIFjaXSNfy8M66Owmq1aZ5ELy7yVhdv
	 z8MrlkMeu/A0+6xICp/VftWIW3p0R0vvWcDZhhE+rgz4ZibQGAkpqz4fHwyserz3qk
	 h/GjUcp8ANBOIYmdBKX7jot2MayDLXPuqTrAMI0P6x4wMVHzzu7p9d2UgQIDyB6UdJ
	 P5yH6j3jCc8HsR+pav3X+vBtHtZxhbjfV+Qs2gqXS6Hglw6Q+iyL1FDDJENBDaCEtz
	 l0ThkGH5RjUSvX+8BTgfSOXkerjrpBVmVbfXtZPmqJSSlh7+gK0CLSxU5aIFMSjCf+
	 GePly+1K8Lyww==
Date: Thu, 20 Nov 2025 07:35:53 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Jianping Li <jianping.li@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	ekansh.gupta@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: kodiak: Add memory region for
 audiopd
Message-ID: <i6dkxjngvfk4gotrtm4ompcfouppk57glngbiydnxjdstv24jw@ggsalbe4vqj2>
References: <20251114055639.1050-1-jianping.li@oss.qualcomm.com>
 <20251117070819.492-1-jianping.li@oss.qualcomm.com>
 <mnmfh22usps4xy4hdck4ts2p6rej7iynsifzrqtmlklffnxrwh@f3gn5hz6yemx>
 <63fea0e6-1ce5-4f71-8531-a01535326374@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63fea0e6-1ce5-4f71-8531-a01535326374@oss.qualcomm.com>

On Thu, Nov 20, 2025 at 05:08:37PM +0800, Jianping Li wrote:
> 
> On 11/18/2025 11:39 PM, Bjorn Andersson wrote:
> > On Mon, Nov 17, 2025 at 03:08:19PM +0800, Jianping Li wrote:
> > 
> > Please don't send new versions as replies to older ones, and please
> > adopt b4, it will take care of these practicalities for you.
> 
> Ack. I'll fix this going forward.
> 

Thank you. FYI, There are instructions on go/upstream on how to start
using b4 for patches in-progress.

> > 
> > > Add reserved memory region for audio PD dynamic loading and remote
> > > heap requirement. Also add LPASS and ADSP_HEAP VMIDs.
> > > 
> > > Signed-off-by: Jianping Li <jianping.li@oss.qualcomm.com>
> > > ---
> > > Patch v1: https://lore.kernel.org/all/20251114055639.1050-1-jianping.li@oss.qualcomm.com/
> > > Changes in v2:
> > >    - Fixed the alignment issue of the qcom,vmids properties, aligning
> > >      the values in the second row with the first row.
> > > ---
> > >   arch/arm64/boot/dts/qcom/kodiak.dtsi | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > index 3ef61af2ed8a..7957a9151055 100644
> > > --- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
> > > @@ -190,6 +190,11 @@ rmtfs_mem: rmtfs@9c900000 {
> > >   			qcom,client-id = <1>;
> > >   			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> > >   		};
> > > +
> > > +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@9cb80000 {
> > > +			reg = <0x0 0x9cb80000 0x0 0x800000>;
> > > +			no-map;
> > > +		};
> > Is the placement of this carveout hard code somewhere in non-HLOS
> > software? If so, its location and size universal across all Kodiak-based
> > devices?
> 
> This information is not hard-coded on non-HLOS. Any region(irrespective of placement)
> allocated by fastrpc is moved to LPASS using qcom_scm calls.
> 

Then you can replace reg = <0x0 0x9cb80000 0x0 0x800000> with size =
<0x0 0x800000>.

I'm assuming that this is subject to address-bit restrictions, so you
probably need alloc-ranges = <0 0 1 0> as well though.

> > Also, the presence of arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> > tells me that we have different audio stacks in play on Kodiak. Does all
> > of them have the same PD loading capabilities/needs?
> 
> This DT looks to be audioreach specific. The one I'm adding is mostly used for audio PD
> dynamic loading purpose. Adding @Mohammad Rafi to give more details about audioreach.
> 

So, you're saying that we do dynamic audio PD loading in all Kodiak
devices (LA, LC, LE, WP), and they all use about 8MB of RAM for this?

Regards,
Bjorn

> > 
> > 
> > PS. Others might ask these same questions in the future (I will probably
> > wonder in 6 months from now...), so let's make sure the git history
> > carries the answers to why things look the way they do.
> 
> Ack.
> 
> > 
> > Thanks,
> > Bjorn
> > 
> > >   	};
> > >   	cpus {
> > > @@ -4139,6 +4144,9 @@ fastrpc {
> > >   					qcom,glink-channels = "fastrpcglink-apps-dsp";
> > >   					label = "adsp";
> > >   					qcom,non-secure-domain;
> > > +					memory-region = <&adsp_rpc_remote_heap_mem>;
> > > +					qcom,vmids = <QCOM_SCM_VMID_LPASS
> > > +						      QCOM_SCM_VMID_ADSP_HEAP>;
> > >   					#address-cells = <1>;
> > >   					#size-cells = <0>;
> > > -- 
> > > 2.43.0
> > > 

