Return-Path: <linux-arm-msm+bounces-51244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEACCA5ECF7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 08:26:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21F416A82A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Mar 2025 07:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB1E9225390;
	Thu, 13 Mar 2025 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L7bJrknu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD5622422E;
	Thu, 13 Mar 2025 07:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741850775; cv=none; b=sEsXhviiNWWdCyRSnVVvrCEqAC53WPqXxD0llew/tWQ085FKv6UQFJCOBnRKMjEmf+6wyqmOg2T1cSs3ClhdNJIwEshGALAiA4fC2VqBksCuk046p6rxxP0AIXQgnewR29ZGoijVa7OyyKrHugFv9A87l1k8PNrwVxurfWOiDiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741850775; c=relaxed/simple;
	bh=sZaq7o/FrpqVjIEe2is9ecGfi7yAHQfNu4BMeutjnUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZK29GIXIBG+oOjqLp5t+phVsJMo9AbMaXm7Ebwkba7bY9PDtLrvPEtvjf8t5oFYBW7OoIm9/x1VClbSuft8pKoD9qyWtBi4GeRkbH51qYEJ+x3NE2g3TyYV6MPUejigjBJa7FXIIFKZkEU3AzDBD3jFeA5IRM4MKdZ64sQ4lPXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L7bJrknu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E000FC4CEDD;
	Thu, 13 Mar 2025 07:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741850775;
	bh=sZaq7o/FrpqVjIEe2is9ecGfi7yAHQfNu4BMeutjnUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L7bJrknuOulkADbDANAb1ME695KpQChnFbM7j9iQgSv0EEag5Z6kv81WC6aIzmaeL
	 wCSQxy0J18O1ZKQwc75e+MI0qVDZK3QPPXk3yqwb4tdl5ftTMeBuoB6g2h2JSuYh1j
	 sox9yBpJ3tqgXGwzqarl84Nwvb7mdfTfCo2vPralbrNmvNMvFYq3nzB2mi9pd4j7Kh
	 YDlZH+NqZ5/betd1xN3Xl4Cm0MGA2xSYclMvE9fP4lxS3SCT0xKD8fbCvQ8nOzXwF5
	 H5eCnJ+y/OFJohYQPhNeheGrJJyvsm7yBSHYMMN27pwL/tEo3AlHg+cSxPXBY/h571
	 avmc5ecpmx2mA==
Date: Thu, 13 Mar 2025 09:26:09 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
Message-ID: <eoqqz5hyyq6ej5uo6phijbeu5qafbpfxlnreyzzcyfw23pl2yq@ftxnasc6sr2t>
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>

On Thu, Mar 13, 2025 at 10:09:05AM +0530, Taniya Das wrote:
> 
> 
> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
> > On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> On 3/4/25 01:53, Dmitry Baryshkov wrote:
> >>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
> >>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
> >>>> domains.
> >>>
> >>> Are those really required to access the registers of the cammcc? Or is
> >>> one of those (MXC?) required to setup PLLs? Also, is this applicable
> >>> only to sm8550 or to other similar clock controllers?
> >>
> >> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
> >> not on any SM8450 or SM8650 powered board for instance, however it does
> >> not exclude an option that the problem has to be fixed for other clock
> >> controllers, but it's Qualcomm to confirm any other touched platforms,
> > 
> > Please work with Taniya to identify used power domains.
> > 
> 
> CAMCC requires both MMCX and MXC to be functional.
> 
> >> for instance x1e80100-camcc has it resolved right at the beginning.
> >>
> >> To my understanding here 'required-opps' shall also be generalized, so
> >> the done copy from x1e80100-camcc was improper, and the latter dt-binding
> >> should be fixed.
> > 
> > Yes
> > 
> 
> required-opps is not mandatory for MXC as we ensure that MxC would never
> hit retention.
> 
> https://lore.kernel.org/r/20240625-avoid_mxc_retention-v2-1-af9c2f549a5f@quicinc.com

Yes. And the code in genpd_set_required_opp() tolerates not seting the
extra opps. However I'd certainly suggest not doing that (I think
passing <0> should work). Having different number of items in
power-domains and required-opps makes it harder to read the DT.

-- 
With best wishes
Dmitry

