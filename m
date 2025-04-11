Return-Path: <linux-arm-msm+bounces-54072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 195D7A867CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 22:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 15B8C16FAB4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 20:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6DC290BC8;
	Fri, 11 Apr 2025 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9G11EzI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF9E28F93B;
	Fri, 11 Apr 2025 20:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744405175; cv=none; b=horVmRzUpeJNI9kK8gHbh84dZiFxDT4Iiha/SK1Un4HfOWwhfeqr8mRsZuJJ6QTriIlv6IDEbwuwi1W+vcD4sxHQy/c8HXXjwhWWWGQzSVVImOSTI1V4F5rcJK91432uARlUfUu/uYuHd/T3wPsH8SZONqu8K6Kg92NVApSiY6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744405175; c=relaxed/simple;
	bh=UFmG9Cb1iuD+WB2whCArKkcNXxcT0k0VHxP1bG2JaYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzvH7r0AQy8tKgrJvtPPsxdkW+cZKADQZa20KEyabN/TAL+KRWTVZF4g6JrF4OaxjA/AkF+6Jw+jD6ifsKQWDvfcOeCmDImGGekCoeQpVJKpwgSLHvtEQjHxWk2c2CS1yYNSzVvh5D2VM5tr9f9ZeGGFEK+FaM9jl+z/MW408Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o9G11EzI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6E6C4CEE2;
	Fri, 11 Apr 2025 20:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744405175;
	bh=UFmG9Cb1iuD+WB2whCArKkcNXxcT0k0VHxP1bG2JaYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9G11EzIoCVarbi6i+RjudnG5oXmixtJI/CJeQQDsxcnNiot3PCmoUX0eVVxpu1aS
	 gXbSBVNlUbBHZEI+zJ2XgIUsxvdDSCq0A3h6z487HHPwMW49ox1Sxave9q8GHXC2Yu
	 QoDZa3SBpexx4TbpzNMLUEcmesPpseo4Y34HMBnVSvteHFt7O16EHisY+N4S3TZ/kB
	 PDd2ZEIUpTBt8kz0nS8xFI9YpeGmuR7ty9ogLLu51gloILxGUBSXmrbB21MbAp960b
	 qPMuP4TFGiowltyyYfvMyOTiQiIHbiJh5slsEiVqXrIeDYso8KixXXdFpXAdngscZi
	 tg7pOiv1Yjy5w==
Date: Fri, 11 Apr 2025 15:59:33 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luo Jie <quic_luoj@quicinc.com>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	quic_kkumarcs@quicinc.com, linux-clk@vger.kernel.org,
	quic_suruchia@quicinc.com,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-msm@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, quic_linchen@quicinc.com,
	quic_leiwei@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>,
	quic_pavir@quicinc.com, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5424 SoC
Message-ID: <174440517329.3991355.13202379998472873935.robh@kernel.org>
References: <20250411-qcom_ipq5424_cmnpll-v2-0-7252c192e078@quicinc.com>
 <20250411-qcom_ipq5424_cmnpll-v2-1-7252c192e078@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411-qcom_ipq5424_cmnpll-v2-1-7252c192e078@quicinc.com>


On Fri, 11 Apr 2025 20:58:10 +0800, Luo Jie wrote:
> The CMN PLL block in the IPQ5424 SoC takes 48 MHZ as the reference
> input clock. The output clocks are the same as IPQ9574 SoC, except
> for the clock rate of output clocks to PPE and NSS.
> 
> Also, add the new header file to export the CMN PLL output clock
> specifiers for IPQ5424 SoC.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---
>  .../bindings/clock/qcom,ipq9574-cmn-pll.yaml       |  1 +
>  include/dt-bindings/clock/qcom,ipq5424-cmn-pll.h   | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


