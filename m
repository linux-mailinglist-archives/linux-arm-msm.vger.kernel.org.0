Return-Path: <linux-arm-msm+bounces-69137-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D4889B25E69
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 10:09:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD9852A111B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Aug 2025 08:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F7F2E1C7B;
	Thu, 14 Aug 2025 08:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AMbSvPVC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089BF27A12B;
	Thu, 14 Aug 2025 08:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755158868; cv=none; b=Togle0F3RUDUBf3L9FkVuyUtGfHjRUSejWLQ6lTojhkr+skG6pzAKQ5+HncZgklUI/TLGW7+KOz8gLX68IP6+PLG8pNTZBFVpahm2NpjFhmPFPUES5DKNQpkhS+NrSJETUS/OX9p/M6Ol/Jxn+br+z6iKIEkDCZ1KAXPRARDofg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755158868; c=relaxed/simple;
	bh=dfyZkSlhfRb8C+mRal/9hfwP4qe/7qNX1aM5rmGNAms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=md3adNuPyH6ZN0hT/+evISSFmJM9MMhkcK+OQrtaDBNukFopwTKLqxZcxF1E9dAVd16nDP7bNTDGfZ7SscXnfT5wqW37SolA3nz/cdVSrDKrZdP7ghKxS6E3WuyZpZRX8UQuozDY7CAlYJEMKEw3GC3INY0S/bliZOkIWR+dRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AMbSvPVC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 245D3C4CEEF;
	Thu, 14 Aug 2025 08:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755158867;
	bh=dfyZkSlhfRb8C+mRal/9hfwP4qe/7qNX1aM5rmGNAms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AMbSvPVCsrm1o+ZQ72m27MmwPONtPgbJGl5/sxesiw6pUBrGHBWUND1H+NchXqsNt
	 4q9+bGDANwK8dz2QSs04Bj3tmfp64+DeIXAfbcQ9FxQm5BW4NGcX/PHZ0EPLiSOIxd
	 a+MWDa5kgTzvSID98x1sUKDn3iQY+X8z9LBhniBsV4w8gr3HwmbeaWBtm39dUXggKT
	 YG8Tj+xTtvxC7CnUprOuCpxWhc4oQon9A1FkaqapiLjkt+kNyk6meOEASlAsuvlMkd
	 wTBoy7DiHKYm69yTLPOxFNOokrZkoxAu++IkGWXj4ol8aj3YGdak/uuC2Es6stlPqM
	 /73ecvVZ2TjEQ==
Date: Thu, 14 Aug 2025 10:07:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Jagadeesh Kona <quic_jkona@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/7] dt-bindings: clock: qcom: Document the Glymur SoC
 TCSR Clock Controller
Message-ID: <20250814-warping-hawk-of-brotherhood-0a34be@kuoka>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-2-a408b390b22c@oss.qualcomm.com>

On Wed, Aug 13, 2025 at 01:25:18PM +0530, Taniya Das wrote:
> The Glymur SoC TCSR block provides CLKREF clocks for EDP, PCIe, and USB. Add
> this to the TCSR clock controller binding together with identifiers for
> the clocks.

If there is going to be resend:

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof


