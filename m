Return-Path: <linux-arm-msm+bounces-86646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E6117CDEB8F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 14:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6CDF8300163C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Dec 2025 13:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AE72253B0;
	Fri, 26 Dec 2025 13:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VO0jH6aL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C1809463;
	Fri, 26 Dec 2025 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766754930; cv=none; b=qXRgTJ5YS3j3WMzJJsDq+3TXQzCqe6LO0unS8aAI4MvyBnRZHBBpSjWG4sHIoU1aXsy4AMOJ1tQML7vClnC+E0Yupyuhs2UhVfjgxtr1a6OCSRpILrw9rA+Sfx2ujZMe5ISpm1Q+1/qm33oIdBws7sP3s8D/FbwcuGrrnO6gv64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766754930; c=relaxed/simple;
	bh=v2Mn6c3roKtxw3hca1vr+fY06DpaAFNgenlq088f6kE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD9cgS14KqmEIK1OUgIEPmfoqJtwLDoo+Lnub7lVCRjPK+xrHYUM9UhLpNKOhb0RHR71kd5A0KLc28dupl204zYw1x1TJlYfBhlzAqwqDr9g2Gy4VOCx+P3Aqykd/SZqKp8RWiwvNLnD1isYwB6vOGo0GBh/rAB7/doXVlWsmf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VO0jH6aL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A806C4CEF7;
	Fri, 26 Dec 2025 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766754929;
	bh=v2Mn6c3roKtxw3hca1vr+fY06DpaAFNgenlq088f6kE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VO0jH6aL/19kJz3ocxHgh3FO8dA1qdI4iYNVvftQBJGjflI5Jk3chM5v5HXLyqPwy
	 xB14o86LBH+0eyrRemXbK2YUKYSQYJqpN6leMFcyQzb186eR31IiCjCBKlayqO7BzE
	 b1bVhCOyfM0W3E4t6LIDWKmNY03iulDyemYCNRwokUa+FI13Z2AksM35gJO9TEahfq
	 B4rwED4uu0+gvtSuwakOtUg1AXCUW4RqLE7nAX4mxFlP3AUG0zmiDTUWthR4oIZHUI
	 ELeGVRSG5/Bje7Y6NTGwf3ZqwHgFDs9XSVnScv7TYdwjw9wMA+GKKtZNjm8JN4qf9+
	 Pia763dq1Gv5w==
Date: Fri, 26 Dec 2025 21:15:23 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: jens.glathe@oldschoolsolutions.biz,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@gmail.com>, Jos Dehaes <jos.dehaes@gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x: add
 retimers, dp altmode support
Message-ID: <aU6Ka6elOYfYbflG@dragon>
References: <20250417-slim7x-retimer-v2-1-dbe2dd511137@oldschoolsolutions.biz>
 <CAAQ0ZWT=s2BdobfkKuBAhw5H761ZH7uCH70i_UOR+wJ6cjSZJA@mail.gmail.com>
 <7283e3e7-54f6-4946-b526-2fa180f15c50@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7283e3e7-54f6-4946-b526-2fa180f15c50@kernel.org>

On Thu, Dec 25, 2025 at 09:33:59AM +0100, Krzysztof Kozlowski wrote:
> On 25/12/2025 04:29, Shawn Guo wrote:
> > On Fri, Apr 18, 2025 at 12:35 AM Jens Glathe via B4 Relay
> > <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org> wrote:
> >>
> >> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >>
> >> comparing with CRD and other dts for a more complete support of the 7X
> >> only retimers, gpios, regulators, dp outputs
> >>
> >> Tested-by: Rob Clark <robdclark@gmail.com>
> >> Tested-by: Jos Dehaes <jos.dehaes@gmail.com>
> >> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> >> ---
> >> This patch adds the required nodes to support DP Altmode on all three type-c
> >> ports. The definition is derived from the CRD. Since they are all marked 40Gbps,
> >> I assume there are 3 PS8830 retimers.
> >> This modification is now for ~8 weeks in my tree with little to no complaints. I
> >> don't have access to a Yoga Slim 7X, however many people on #aarch64-laptops do
> >> and some are using this patch.
> >> ---
> >> Changes in v2:
> >> - removed changes not relevant to retimers and dp altmode (thanks Johan)
> >> - Link to v1: https://lore.kernel.org/r/20250417-slim7x-retimer-v1-1-5813a7835903@oldschoolsolutions.biz
> >> ---
> >>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 476 ++++++++++++++++++++-
> >>  1 file changed, 470 insertions(+), 6 deletions(-)
> > 
> > Hi,
> > 
> > I'm running a Slim7x China variant (Yoga Air 14s) with Debian 13.
> > While the Debian stock 6.12 kernel works fine to bring up the display
> > (AMOLED eDP panel), newer kernels like 6.18 loses display during boot.
> > I can do either of the following to get the display back to work.
> > 
> > - Enable PS883X driver (Yes, CONFIG_TYPEC_MUX_PS883X is missing from
> > Debian config [1])
> 
> Obviously.
> 
> > 
> > OR
> > 
> > - Revert commit 299038d82418 ("arm64: dts: qcom:
> > x1e80100-lenovo-yoga-slim7x: add retimers, dp altmode support")
> > 
> > My understanding is that a PS883X driver is required only for external
> > DP support.  Why would the driver missing impact/break the internal
> > panel support?  Do you guys have any insight on this?  Thanks!
> > 
> 
> You need all drivers to avoid probe deferrals.

Ah, yes!  The display subsystem/card is wired up with all 4 eDP/DP
ports.  A probe failure on any of the ports will cause the display
card fail out, even though the eDP port has all the dependencies in
place.

Shawn

