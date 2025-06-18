Return-Path: <linux-arm-msm+bounces-61653-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 039B3ADE150
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 04:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6DC0A1894B53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jun 2025 02:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B10701A841F;
	Wed, 18 Jun 2025 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQIftKpT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805771990D9;
	Wed, 18 Jun 2025 02:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750215041; cv=none; b=Z/xfn4gHevec1yfKuLegBGgxD06tF+2UZBc/i+m/8E+e/RkVjFP8l2twONvTLYrnsHZcQ7Hynt3/IKZyjVgUSBnXLdZfOB8ESMD1vHrNYtl7mAi4YM/nk3XChPSfOthvuZ5lcN6n7cW9iZZpBlGqKxIO8XB8fNpP90btDhtBPNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750215041; c=relaxed/simple;
	bh=ejx7I7UTyAGVPPKElZ3HdFB2xhpKbAHNV3sEAMqZn/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/bYfiid8Rep1HCmzbboNzodPpCWhlFFgkID0sMvzK7ONEb+wAvTJE3YwvOIO69PrAgFSXSkkP42hBSrV0cwKaYLAR6+VrSSSNxtCwV62ovRQ0oua+pzpytLHOPE4SHuUYE/sjMcN5l81/qVNmTMwrRFxBerwH30w+DoiweA2jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQIftKpT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3676EC4CEE3;
	Wed, 18 Jun 2025 02:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750215041;
	bh=ejx7I7UTyAGVPPKElZ3HdFB2xhpKbAHNV3sEAMqZn/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PQIftKpTIy1bSt9jmlonpcq4T0n2bn3RRTFUIepdNBXTba+jihH3hRaB181dpXhRp
	 YZIbdIM8rVebD1L/8m/8EGuH2lSUKP+lmf47gM7qHillYUIUms3Hpt07WgplkEPh6K
	 x5koAiRrCw6S5kMF65dUQOr541MZPVKfAuUQgMw8MjHyqZDyEz2LwgQ6L9B4qtS292
	 dXueM7DtFGdO9UNF4V2keyCtiOwxHgSq0szAi8oqNKDFHeQYuSYd4ALyv+3m3VdZNN
	 wElqr60b5Eej5iyJ62tWTEk589sAkxkfgjB5InoxUiHdQqQGL2fqVadOnf0RWLm3V3
	 AizwkjOx8hO6g==
Date: Tue, 17 Jun 2025 21:50:38 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jie Gan <quic_jiegan@quicinc.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <quic_tingweiz@quicinc.com>, Jinlong Mao <quic_jinlmao@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] Enable CTCU device for QCS8300
Message-ID: <yiz7tewisidbzztbcwc7v2sac4lv2lom5kv4a4rubdfcr73flt@rcga4a6fxhdv>
References: <20250327024943.3502313-1-jie.gan@oss.qualcomm.com>
 <d87a6bba-eaed-4ac4-a272-3bb38b1607dc@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d87a6bba-eaed-4ac4-a272-3bb38b1607dc@quicinc.com>

On Wed, May 14, 2025 at 04:00:12PM +0800, Jie Gan wrote:
> 
> 
> On 3/27/2025 10:49 AM, Jie Gan wrote:
> > Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
> > the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
> > configurations as SA8775p platform.
> > 
> 
> Gentle ping for the series.
> 
> dt-binding patch has been reviewed by Krzysztof.
> dts patch has been acked by Konrad.
> 

You don't seem to have the Coresight maintainers among the recipients of
the binding patch, so that's probably why it hasn't been merged yet -
and I can't merge the DTS change until the binding is accepted.

Please apply Krzysztof's R-b and send the binding alone to Coresight
maintainers, once they have accepted the binding please resubmit the dts
change and I'd be happy to merge it. (v2 sounds good on both)

PS. Please see go/upstream on how to adopt b4; "b4 prep --auto-to-cc"
would have saved you from this mistake.

Regards,
Bjorn

> Thanks,
> Jie
> 
> > Jie Gan (2):
> >    dt-bindings: arm: add CTCU device for QCS8300
> >    arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes
> > 
> >   .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
> >   arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
> >   2 files changed, 160 insertions(+), 2 deletions(-)
> > 
> 

