Return-Path: <linux-arm-msm+bounces-55909-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED54BA9EECA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 13:17:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55B6617DE88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Apr 2025 11:17:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A47267B9B;
	Mon, 28 Apr 2025 11:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r9ojCpq2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592F6267B67;
	Mon, 28 Apr 2025 11:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745838993; cv=none; b=GuntIc3x2bHRHg3rLXLDcRLaWs5ytTRX8HcBmE7S58F+RZ6iC2xIbOyNP/I9KKXvIMVr1S8WRds+mDPCLmFbblX96n7OFQmzcz9GoePLGJwlBzDTfWPOIJEt8Gx3n7Q4qS82igQIcivrsM9IXFragc13Lkhdv/DPfy6GmJSXKhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745838993; c=relaxed/simple;
	bh=ZHlHP1G+yKLerL6A3JQMfI+d7AtCg+sYXv3msXk4+Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKt7W7LttTcPEWIYqvI6S5RGeVeuDC6x8gQv9eh6n9Zxkzp0cOwnq5IyRL0RcyUA6JdaSp2KQNQRRZxc4nBZ/8+aqbc1xXwBSYsw7wEBo/+g0zBwTlAu7PLeS31c7usWj+B1nQHLb0olgcq8MY4JEEBr00ezWfJe1cfVYSEFMWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r9ojCpq2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAE14C4CEE4;
	Mon, 28 Apr 2025 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745838990;
	bh=ZHlHP1G+yKLerL6A3JQMfI+d7AtCg+sYXv3msXk4+Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r9ojCpq2Ycbah3dnNCGr/ENC8EAMQvNr7f1MbLb/7XVh4MvrZcaUCJGriFFkbOzRY
	 yhxKDx7v5wQNhYiSaWRfpy4FHJJsyjodIC44J/+jfe5cTcPi+pMqZXQPrJgl/SR+UX
	 H/i3ynfhzP4JOxDVvE1xG3/3Lmq6fUrXNtIkeHNOb1Sw3q5KTNZv6IvmnYI0bGQ/SP
	 q2rmj19Q6+hnAlPGLmoEaaEX7X8Wgk4SUMqbJl6ToJr59gWHgGj3rwRhS4Ij3yqIJE
	 eJ/g3z7ceN8yajGbUc9DhjJMwkOKyvezN8t5fjLMWj8dz6RdZAdxZ84mx3tywbYKzH
	 eHAqjBpWVa9hw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u9MTP-000000002X9-11Rt;
	Mon, 28 Apr 2025 13:16:31 +0200
Date: Mon, 28 Apr 2025 13:16:31 +0200
From: Johan Hovold <johan@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Wenbin Yao <quic_wenbyao@quicinc.com>, catalin.marinas@arm.com,
	will@kernel.org, linux-arm-kernel@lists.infradead.org,
	andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
	quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
	quic_cang@quicinc.com, quic_qianyu@quicinc.com
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: x1e80100: add bus topology for
 PCIe domain 3
Message-ID: <aA9jjyBR5DZcSbyQ@hovoldconsulting.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
 <20250425092955.4099677-3-quic_wenbyao@quicinc.com>
 <4bb58766-a080-4351-87f5-79a98219171c@oss.qualcomm.com>
 <aAt4TBrekUqyTjfi@hovoldconsulting.com>
 <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <306ce1fa-be83-4f13-bedd-97a20448d162@oss.qualcomm.com>

On Sat, Apr 26, 2025 at 12:44:57PM +0200, Konrad Dybcio wrote:
> On 4/25/25 1:55 PM, Johan Hovold wrote:
> > On Fri, Apr 25, 2025 at 12:22:56PM +0200, Konrad Dybcio wrote:
> >> On 4/25/25 11:29 AM, Wenbin Yao wrote:
> >>> From: Qiang Yu <quic_qianyu@quicinc.com>
> >>>
> >>> Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
> >>> voltage rails can be described under this node in the board's dts.
> >>>
> >>> Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> >>> Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
> >>>  1 file changed, 11 insertions(+)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> index 46b79fce9..430f9d567 100644
> >>> --- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> +++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
> >>> @@ -3287,6 +3287,17 @@ opp-128000000 {
> >>>  					opp-peak-kBps = <15753000 1>;
> >>>  				};
> >>>  			};
> >>> +
> >>> +			pcie3port: pcie@0 {
> >>
> >> @0,0 for PCIe adressing (bus,device)
> > 
> > No, the bus number is not included in the unit address, so just the
> > device number (0) is correct here (when the function is 0) IIUC.
> 
> Some DTs definitely have that, but I couldn't find any documentation to
> back the syntax up or explain it properly

It's part of the spec:

	http://www.devicetree.org/open-firmware/bindings/pci/pci2_1.pdf

The first number is the device number and the second is the function
which can be left out if zero.

Johan

