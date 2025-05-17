Return-Path: <linux-arm-msm+bounces-58289-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C93AABACDF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 18 May 2025 01:49:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D2DF17CD54
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 23:49:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F151DF968;
	Sat, 17 May 2025 23:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mj4EFy+e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047188F58;
	Sat, 17 May 2025 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747525794; cv=none; b=D0Vmb62eR3BjFSMMUI9HHkFh41OXl5G2rZYanJiAJGXtCOxv2BMJRWd4w83NgXNg8cB0qp5MHKB6wOFwQfmgGUPNxyo37a84mPWMQVmhqAzSPKb3WcIIFDr7gpFPSIWnrPow8qICJk1rOLZURFi5WbamC2jgbcC28oKw7rya4zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747525794; c=relaxed/simple;
	bh=yj7jL01qlTU0tyKVX/W2yTouWGscqqVS68dM03uOvzI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sqk9Qu1jYQcrnWSWCEPCHVQahal1ekZ6iLkbQJIopumk/DCFd7nJbJ5Zap1HxLdWaQ7ppcVcJ1wghWvoIqtc+CHVj4nSFW6194JPCUhehA9J2Lhv1ad9JJwyELDuK1d9h/rvSZ8du/D7NnGaaY/8NgD9ShXQ8FItOgArQGxp0+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mj4EFy+e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA96AC4CEE3;
	Sat, 17 May 2025 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747525793;
	bh=yj7jL01qlTU0tyKVX/W2yTouWGscqqVS68dM03uOvzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mj4EFy+eGyxcscPnLgYOHgrnt3GHnq7aKp6GTu5kJl7bad5P84TXtuRyFTXRH+dmg
	 8duiSo7IHmBkKFszIL9HExqqY5LsPvOJ3KL6vqKktMzR6DpzhqHHh2t3jtItsxdcv1
	 +oAgJmgggVnyWwYfCAPF8l1WorCCbR51dws/8vORxxnBdQ+DWyKg0ABZI68OXo8e/C
	 j0g3S4luCxJxNyeq2xTknS0jCG3oJKWeyIgt5UwHY/6EccHJ/LcObzGE5s2Ib29HnH
	 g2ZiZKXU184yeYQRpxw5HUX2k4rjVmkNZQRyS2yxli2lbC/TY2x/7tyCFTq04JYFpw
	 CpQCB1s/B+FIQ==
Date: Sat, 17 May 2025 18:49:35 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	quic_srichara@quicinc.com, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_varada@quicinc.com
Subject: Re: [PATCH v2] arm64: dts: qcom: ipq5424: fix and relocate uart1
 gpio configurations
Message-ID: <iunafkwsdnr3c7tyzotxuv7wfg3restfhtms6clg27uxderp4l@bj4gnkqstwt7>
References: <20250318064939.3638381-1-quic_mmanikan@quicinc.com>
 <a80b5d0c-8e45-4b48-a160-3dce84479601@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a80b5d0c-8e45-4b48-a160-3dce84479601@oss.qualcomm.com>

On Wed, Apr 09, 2025 at 09:36:00PM +0200, Konrad Dybcio wrote:
> On 3/18/25 7:49 AM, Manikanta Mylavarapu wrote:
> > Update the bias configuration for UART1 TX and RX pins to ensure correct
> > settings for RDP466.
> > 
> > Additionally, move the UART1 GPIO configurations from the common .dtsi
> > file to the RDP-specific .dts files to account for differing bias
> > configurations across RDPs of IPQ5424.
> > 
> > Fixes: 1a91d2a6021e ("arm64: dts: qcom: add IPQ5424 SoC and rdp466 board support")
> > Signed-off-by: Manikanta Mylavarapu <quic_mmanikan@quicinc.com>
> > ---
> > Changes in V2:
> > 	- Consolidated uart1_tx_state and uart1_rx_state nodes into a
> > 	  single qup_uart1_default_state node, which includes the
> > 	  configuration for both UART1 TX and RX pins.
> > 	- Inserted a blank line before the status property in the UART1
> > 	  node.
> > 	- Fixed review comments from Kathiravan Thirumoorthy.
> > 
> >  arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts | 19 ++++++++++++++++++-
> >  arch/arm64/boot/dts/qcom/ipq5424.dtsi       |  7 -------
> >  2 files changed, 18 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > index b9752e8d579e..f0cba6b2be70 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > +++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
> > @@ -102,6 +102,22 @@ &ssphy_0 {
> >  };
> >  
> >  &tlmm {
> > +	qup_uart1_default_state: qup-uart1-default-state {
> > +		uart1-tx-pins {
> > +			pins = "gpio44";
> > +			function = "uart1";
> > +			drive-strength = <8>;
> > +			bias-pull-down;
> 
> Pull*down* on TX? Are there noise issues or similar?
> 

Pull down doesn't make sense to me either but I don't see any answer to
the question. If this is correct, please add a line/paragraph in the
commit message describing why this should be pulled down.

Dropping this from my review queue now.

Thanks,
Bjorn

> Konrad

