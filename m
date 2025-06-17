Return-Path: <linux-arm-msm+bounces-61602-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 267A3ADCD84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 15:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60DF43A218D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 13:30:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D63412E2660;
	Tue, 17 Jun 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixr6ZHvj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B992D0289;
	Tue, 17 Jun 2025 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166867; cv=none; b=ZMq1AvgPcA3yTAnn9uPyBjIthn7vBCX/dGOBHoE6uKQpko4djPC/n+Sh0lFwW0/Eh+heoRBYm3cFz9UcMWzMrPokPW8VSsyO1EbCKIwTQicrhNUgCBD+RQEi3WPhZF2hR9hRgt3uNekyWu3sP0JFQaOBH9nQ16WbklbAww9v0nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166867; c=relaxed/simple;
	bh=UO6DltEcFmOtT7v55Hv8JTY23RWYaSkglV0z5dSo/ps=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbjY6pEtymRgHF+lMyglaDFeiLh2KLt8WzTgqkPe0tOz1pj6Jy9atzqNLij+tvxwMdlmUnqL86BfnVVoQ5FUXydqRi2k5gxBxOHrSvXvzl4rvmir3sadHTTPxjkJhdecM+8h1qSX5g/Hk/R/FPFMDsOPPztoDGqPA6dfjJ73pR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixr6ZHvj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D0CC4CEEE;
	Tue, 17 Jun 2025 13:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750166867;
	bh=UO6DltEcFmOtT7v55Hv8JTY23RWYaSkglV0z5dSo/ps=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ixr6ZHvj/y2d9XOFh+UH8xpKton11gccdWwtmWElF33BpT6mQBtqHaGoB3IwOC90M
	 9ZCWNR4EJywf1jQX56Lh7nUoToJfgb4CkKaatcYdlv1/LD3wXu5PFVumT+a+ECw2yX
	 Yc/bLneQ1uMlEgl3Slp77eX3HRkf957IY41D+lfFPFYZwxV2/ybHniEZo0c7e8l1cT
	 u7b1SbxPeOs1SFQbC0wuwzzqimbm4O9k6uvFM+DCYoR+gJG40uw5rzg8xWITNx4twJ
	 l5tri/YSi/7J5MOwQLmFObTktP6ZfoXs0g1MuEFs8DnQ1yUvVl6PEXBpP49zNf/WJV
	 KPdwzO/uu916w==
Date: Tue, 17 Jun 2025 08:27:43 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v5 00/18] clk: qcom: Add support to attach
 multiple power domains in cc probe
Message-ID: <wew4ptjmsugbahtpxe3z6647mapp5k6fyhajdzkd75ml6cqwaz@ulwhe6ikkb6m>
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <174970084192.547582.612305407582982706.b4-ty@kernel.org>
 <65828662-5352-449b-a892-7c09d488a1f4@quicinc.com>
 <91c11e62-b0d4-40e9-91a1-20da9973e415@linaro.org>
 <0d9846f8-da23-4f2a-a593-35350c026b44@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d9846f8-da23-4f2a-a593-35350c026b44@quicinc.com>

On Mon, Jun 16, 2025 at 12:55:47PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 6/12/2025 4:22 PM, Krzysztof Kozlowski wrote:
> > On 12/06/2025 12:03, Jagadeesh Kona wrote:
> >>
> >>
> >> On 6/12/2025 9:30 AM, Bjorn Andersson wrote:
> >>>
> >>> On Fri, 30 May 2025 18:50:45 +0530, Jagadeesh Kona wrote:
> >>>> In recent QCOM chipsets, PLLs require more than one power domain to be
> >>>> kept ON to configure the PLL. But the current code doesn't enable all
> >>>> the required power domains while configuring the PLLs, this leads to
> >>>> functional issues due to suboptimal settings of PLLs.
> >>>>
> >>>> To address this, add support for handling runtime power management,
> >>>> configuring plls and enabling critical clocks from qcom_cc_really_probe.
> >>>> The clock controller can specify PLLs, critical clocks, and runtime PM
> >>>> requirements using the descriptor data. The code in qcom_cc_really_probe()
> >>>> ensures all necessary power domains are enabled before configuring PLLs
> >>>> or critical clocks.
> >>>>
> >>>> [...]
> >>>
> >>> Applied, thanks!
> >>>
> >>> [01/18] dt-bindings: clock: qcom,sm8450-videocc: Add MXC power domain
> >>>         commit: 1a42f4d4bb92ea961c58599bac837fb8b377a296
> >>> [02/18] dt-bindings: clock: qcom,sm8450-camcc: Allow to specify two power domains
> >>>         commit: a02a8f8cb7f6f54b077a6f9eb74ccd840b472416
> >>> [03/18] dt-bindings: clock: qcom,sm8450-camcc: Move sc8280xp camcc to sa8775p camcc
> >>>         commit: 842fa748291553d2f56410034991d0eb36b70900
> >>> [04/18] clk: qcom: clk-alpha-pll: Add support for common PLL configuration function
> >>>         commit: 0f698c16358ef300ed28a608368b89a4f6a8623a
> >>> [05/18] clk: qcom: common: Handle runtime power management in qcom_cc_really_probe
> >>>         commit: c0b6627369bcfec151ccbd091f9ff1cadb1d40c1
> >>> [06/18] clk: qcom: common: Add support to configure clk regs in qcom_cc_really_probe
> >>>         commit: 452ae64997dd1db1fe9bec2e7bd65b33338e7a6b
> >>> [07/18] clk: qcom: videocc-sm8450: Move PLL & clk configuration to really probe
> >>>         commit: 512af5bf312efe09698de0870e99c0cec4d13e21
> >>> [08/18] clk: qcom: videocc-sm8550: Move PLL & clk configuration to really probe
> >>>         commit: a9dc2cc7279a1967f37192a2f954e7111bfa61b7
> >>> [09/18] clk: qcom: camcc-sm8450: Move PLL & clk configuration to really probe
> >>>         commit: eb65d754eb5eaeab7db87ce7e64dab27b7d156d8
> >>> [10/18] clk: qcom: camcc-sm8550: Move PLL & clk configuration to really probe
> >>>         commit: adb50c762f3a513a363d91722dbd8d1b4afc5f10
> >>> [11/18] clk: qcom: camcc-sm8650: Move PLL & clk configuration to really probe
> >>>         commit: 3f8dd231e60b706fc9395edbf0186b7a0756f45d
> >>> [12/18] clk: qcom: camcc-x1e80100: Move PLL & clk configuration to really probe
> >>>         commit: d7eddaf0ed07e79ffdfd20acb2f6f2ca53e7851b
> >>>
> >>> Best regards,
> >>
> >>
> >> Hi Bjorn,
> >>
> >> Thanks for picking these patches. However, the dt-bindings patches are closely linked with
> >> the DT patches in this series and needs to be picked together. The dt-bindings changes adds
> > 
> > DT bindings are the DT patches. What do you mean by DT? DTS? If so, then
> > you introduce regressions without explaining this at all in cover letter
> > or patches.
> > 
> >> multiple power domains support for clock controllers, and without the corresponding DT
> >> patches, dtbs_check will give warnings.
> >>
> >> Can you please help to pick DT patches as well?
> > 
> > Please read soc maintainer profile explaining how DTS is being organized.
> > 
> 
> I apologize for not mentioning this details in cover letter. Here the dt-bindings documentation
> changes(patches 1-3) are only applied and the corresponding DTS changes(patches 13-18) are not
> yet applied via DTS tree, leading to dtbs_check warnings.
> 

Mentioning this in the cover letter wouldn't change the fact that the
binding is changing in an unexpected way.

As the binding now express that 2 power-domains is required, the driver
author would be free to expect that the loaded DTB has 2 power-domains
specified. But the user might still have an older DTB on their system
(exactly what dtbs_check is complaining about now).

A quick look makes me think that it's because you removed the maxItems:1
which means that the properties needs to match completely. Changing this
to minItems:1 should allow for both cases, I think.


Can you please send a patch that fixes up the bindings to allow both the
old and new case?

Regards,
Bjorn

> Thanks,
> Jagadeesh
> 
> > 
> > Best regards,
> > Krzysztof

