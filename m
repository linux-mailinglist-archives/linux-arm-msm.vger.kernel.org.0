Return-Path: <linux-arm-msm+bounces-46413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70796A20FAE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 18:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9879166E90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 17:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFA1F1D515B;
	Tue, 28 Jan 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pdy+m9ai"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBB51BDA91;
	Tue, 28 Jan 2025 17:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738085949; cv=none; b=sSd9lkF86lozAnUL+zdRvsuJCXbYfAbj6x8DjU4K90HTLuXMs3okkYZoVPfZk7eIDFRKc12TP9xVPvG3anBQmlYXnUnXOg4rsmykNOjgyP9qkJSiVRNvewUqwKi3QwVGtJ56xkO/o2oSY1tnBEMh4YLrM07WChsDe8Tp3SWkUfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738085949; c=relaxed/simple;
	bh=jjeI4vwu2iND+mSguPTJSTWaIvWFuRgs4M594184mbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WgqdDq/xqWoFZeXbiEG5r+zH+uIm6AB8kmYURFR+9az8pwkkPPVD6ETGI4lWftTgP0niIhR+hPDF34+ftyRKZrHJB2Ag/FZsy6bJ6zYPXw2FFqO/KTYRe6YEVXxN1LcDw35Raorhf9WNP36Kohb58cEcHon7/S4viXIvlmva5SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pdy+m9ai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FFC2C4CED3;
	Tue, 28 Jan 2025 17:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738085949;
	bh=jjeI4vwu2iND+mSguPTJSTWaIvWFuRgs4M594184mbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pdy+m9aiWaJ/5lwS/fspPrSkiIdjkugamqy269xrv+LCCC9inYpUsFjBqWwy60+Cy
	 Kj1mby5Gpz4umZUm2gsuECX6Uul7b7VMD6pQ4yFWS+VkdjKGOHv9e/ljgyY244RhY2
	 pyR2BIo+IvnmbRE3TRkQTRATvID14T7gNYtGImVVdv7yI6gmAdOIWlq5D6elEwdVQY
	 QuXLqRs1NK9zKvTtYVY3EoDhsOtq9R6tui5JBohfJnBELy4qZpCYEfhX2Mbh08b+P4
	 +0n83a3XIwfaxQr+AzMDsDs9+7BYeeTpwpoyJ06ZpT1jVw5B8Jo3RWx0GLjsk+WOk2
	 S8elNmAkeEaJg==
Date: Tue, 28 Jan 2025 11:39:08 -0600
From: Rob Herring <robh@kernel.org>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ajit Pandey <quic_ajipan@quicinc.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Jagadeesh Kona <quic_jkona@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v4 0/6] Add support for GPUCC, CAMCC and VIDEOCC on
 Qualcomm QCS8300 platform
Message-ID: <20250128173908.GA3705252-robh@kernel.org>
References: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-qcs8300-mm-patches-new-v4-0-63e8ac268b02@quicinc.com>

On Thu, Jan 09, 2025 at 02:27:43PM +0530, Imran Shaik wrote:
> This patch series add support for GPUCC, CAMCC and VIDEOCC on Qualcomm
> QCS8300 platform.
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> ---
> Changes in v4:
> - Updated the commit text as per the comment from Bjorn.
> - Fixed the CamCC QDSS clock offset.
> - Link to v3: https://lore.kernel.org/all/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com/
> 
> Changes in v3:
> - Added new GPUCC and CAMCC binding headers for QCS8300 as per the review comments
> - Updated the new bindings header files for GPUCC and CAMCC drivers. 
> - Added the R-By tags received in v2.
> - Link to v2: https://lore.kernel.org/r/20241024-qcs8300-mm-patches-v2-0-76c905060d0a@quicinc.com
> 
> Changes in v2:
> - Updated commit text details in bindings patches as per the review comments.
> - Sorted the compatible order and updated comment in VideoCC driver patch as per the review comments.
> - Added the R-By tags received in V1.
> - Link to v1: https://lore.kernel.org/r/20241018-qcs8300-mm-patches-v1-0-859095e0776c@quicinc.com
> 
> Signed-off-by: Imran Shaik <quic_imrashai@quicinc.com>
> 
> ---
> Imran Shaik (6):
>       dt-bindings: clock: qcom: Add GPU clocks for QCS8300
>       clk: qcom: Add support for GPU Clock Controller on QCS8300
>       dt-bindings: clock: qcom: Add CAMCC clocks for QCS8300
>       clk: qcom: Add support for Camera Clock Controller on QCS8300
>       dt-bindings: clock: qcom: Add QCS8300 video clock controller
>       clk: qcom: Add support for Video Clock Controller on QCS8300

I've applied the bindings patches because the .dts files using them are 
already in Linus' tree.

Bjorn, please stop taking dts changes without the bindings.

Rob

