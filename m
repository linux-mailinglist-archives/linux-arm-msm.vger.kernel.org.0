Return-Path: <linux-arm-msm+bounces-57871-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72219AB70AF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 18:04:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A833BAD28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 16:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 129081B424F;
	Wed, 14 May 2025 16:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dljvHuXg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DBE18787A;
	Wed, 14 May 2025 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238599; cv=none; b=nG/fvVosylWctf7uLN0FEfpx0BbLWj/qnei7TJHZ9POxUpov6J6rLeRZP7R1K9OHSZ9Ggp1L/J21Av1NbvbpckN+Awr2JxrZrfH+Zpl4YeLsK1FLJf9P8RNC+c14IGUWT20TVzV2k0NizKuLgu7PAMTsOVyMszHDNax0PnQS1cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238599; c=relaxed/simple;
	bh=E/uPNr2Drrqwd9Qk8xjwfc5PbsvApW04uOmyoQnoWNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQLRPpLoaU2cRB5oW47geDUki92UJ9HbKBF2RY+i0fDGX+tNhuBcbncsY85EwCAIqhmpIV1Vc1ZqygnwUETQ0h2A13lW3dVlcAWSiOUqL5n5v/Gi/cotk/VkP9R2HsdVlfeEsR1Uy957RT8NlsD+1j9HilWqYIMsqvrjfi30Gtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dljvHuXg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AD4C4CEE3;
	Wed, 14 May 2025 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238598;
	bh=E/uPNr2Drrqwd9Qk8xjwfc5PbsvApW04uOmyoQnoWNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dljvHuXgTGmofArMWC1cgX9H3NKwD2u6BZ8YnbrwHXbOI0PCiiwNdOPBCC6moF481
	 qNW/CRpjlpVhs4Tm+0VPBUzNX68lZTlEpfQdtYB4x/VTyHXfvjYTDcrRIWlW15rdnx
	 YKk9Te87AiMfYPAbDkBT2/qxV76v38zCwIGjjwNtsEOKNjr+PsmIYohsn+ifPqKACk
	 GjHBpUrRCTjJFiDaG0sva57D36fImXxUTM00Kziyono2UxCuy8yx3tEwvLAAaWh/NU
	 GVBWdCp1dr8aAYLT0i5UEGPHh4dOCOfPXCrHsiKFeHbedLx16AOOFnIdjMjauzdzel
	 LaeJYfjOLqBjQ==
Date: Wed, 14 May 2025 11:03:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org, Luo Jie <quic_luoj@quicinc.com>,
	linux-clk@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: qcom: Add CMN PLL support for
 IPQ5018 SoC
Message-ID: <174723859613.2419683.5915733279552659071.robh@kernel.org>
References: <20250506-ipq5018-cmn-pll-v2-0-c0a9fcced114@outlook.com>
 <20250506-ipq5018-cmn-pll-v2-3-c0a9fcced114@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-ipq5018-cmn-pll-v2-3-c0a9fcced114@outlook.com>


On Tue, 06 May 2025 09:43:35 +0400, George Moussalem wrote:
> The CMN PLL block in the IPQ5018 SoC takes 96 MHZ as the reference
> input clock. Its output clocks are the XO (24Mhz), sleep (32Khz), and
> ethernet (50Mhz) clocks.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  .../devicetree/bindings/clock/qcom,ipq9574-cmn-pll.yaml  |  1 +
>  include/dt-bindings/clock/qcom,ipq5018-cmn-pll.h         | 16 ++++++++++++++++
>  2 files changed, 17 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


