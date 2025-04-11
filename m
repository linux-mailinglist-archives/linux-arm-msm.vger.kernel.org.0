Return-Path: <linux-arm-msm+bounces-54070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA60A86721
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 22:31:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 995A8465DAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 20:30:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D97F280CCD;
	Fri, 11 Apr 2025 20:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EPHH7uM/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA422D7AA;
	Fri, 11 Apr 2025 20:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744403455; cv=none; b=Ur/vSeM7ybgjiTk+LSXyO3M1Muq/qJyzgh8e4sQPrLbfz9BdWObbA+2rf48eJ4BHVp1NMtiYpkZBn5uQpTzxkOYPSckf8diub78LWaM07aSYu/ppxE2KbnDgLExG53PdeWc+D3MMZ1y6KReZQShZETbGyaL9um4AZgWgJwL1xI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744403455; c=relaxed/simple;
	bh=IgZpynRK7I4zg1Vh1VMqbr8T90CF+k7sF5KdcrTjxEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsT0MLieWeFJjucGMxlturPgoU6UPrHbhA5pgLhyex43Ab2UMwk8Da6NAQJmnXDD7xjEZuocIJTZiPz1cepDoz5n85Wr1j99JZsB28g8Ua4xzOO265pNBjqB7Mlh9qQyUasQBNowXa0rNgVn2q0Dkdp60NUOoab5MF7Zmn4411s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EPHH7uM/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5593BC4CEE2;
	Fri, 11 Apr 2025 20:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744403454;
	bh=IgZpynRK7I4zg1Vh1VMqbr8T90CF+k7sF5KdcrTjxEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EPHH7uM/Qu0KE1Ki08vAe0SQly95cP11L1X41U2O4z0rKo9qDBuZq1t1fEcwT56WS
	 +XXHKa4eFQF7zSPmePs+9eOm0wjvKz99exST793SpBJV4jYTvxUcWuMBgerq39Uw0R
	 sp5uB8Sb0QmWxWPYkuSaH8kMbZdfF30L5ExKDo45ftSOyEvduFHhqBra54sqwguyEq
	 2c5i+ynAjxai6Z+B+QQxR5a03vfjfx+10TpNaYi+l5ivxn6MMhFu2VRq9WLq134Zqk
	 4RAh7EW2X96oTj3NvM3urA8bCdDXBhZeeZjm15g4YJ6gwcL1m6diIgdHQGZFVoAsQj
	 GoWGDeU1Xc2Kw==
Date: Fri, 11 Apr 2025 15:30:53 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
Cc: alexandre.belloni@bootlin.com, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	andersson@kernel.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	konradybcio@kernel.org, jarkko.nikula@linux.intel.com
Subject: Re: [PATCH v4 1/3] dt-bindings: i3c: Add support for Qualcomm I3C
 controller
Message-ID: <174440334691.3918820.6898145674623743895.robh@kernel.org>
References: <20250411113516.87958-1-quic_msavaliy@quicinc.com>
 <20250411113516.87958-2-quic_msavaliy@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411113516.87958-2-quic_msavaliy@quicinc.com>


On Fri, 11 Apr 2025 17:05:14 +0530, Mukesh Kumar Savaliya wrote:
> Add device tree bindings for the Qualcomm I3C controller. This includes
> the necessary documentation and properties required to describe the
> hardware in the device tree.
> 
> Signed-off-by: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>
> ---
>  .../bindings/i3c/qcom,geni-i3c.yaml           | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/qcom,geni-i3c.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


