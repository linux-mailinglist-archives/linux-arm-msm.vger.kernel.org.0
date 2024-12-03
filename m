Return-Path: <linux-arm-msm+bounces-40118-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E01BE9E28C1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87BFABC25E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 15:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 295131F8F0D;
	Tue,  3 Dec 2024 15:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgIgt+mD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA99D1F8AFA;
	Tue,  3 Dec 2024 15:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733239955; cv=none; b=oDoUMj3p77OEgcP8zbMzs3NLnFg6PFpooAUzvC4JIS0QUa60I0USQ93JjTaq+SRxWhLUoota90ccG9EuLt5BCW1XHiVGtbs/wEl7/iTqGvllrA+sCYRyHrXdQe7fdw3yc/5EaeN466k1EOxxw74q8abnR63BWeNw85vv7oRRDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733239955; c=relaxed/simple;
	bh=9dyobPuiAigqFkgy1nXf6Wr/bRq7fJo42aRsWAsXsgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PJZRjqTaHDElOutYO/m0dZn/DwENUpPo+s8+lw+25AugtLr+9Cs6LX5kbROrM7eubNA+ENTsRcLmSqJ67kCIFFKK4CrvVUH/ufqTOVgiiwcg83LtlNylNRMhR+crtit2ES3tQUS1KRe70P18b5YzxZl8++Zwc2KD4Xmv4/NPSRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgIgt+mD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F2A1C4CECF;
	Tue,  3 Dec 2024 15:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733239954;
	bh=9dyobPuiAigqFkgy1nXf6Wr/bRq7fJo42aRsWAsXsgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FgIgt+mDsPsf122bbvT7gowNtGD6kjdn6EEl6x0FUr0CUyTUYIJteho8ZB7nVavOP
	 lt70sI7leixdD4LrqXBoBSVEyjXfKTToeyBirNZ51JgaRyLg3r6zwpAWb4IDTtJTgS
	 k/8gyMVgex2SMy5t47Yt1bCmq+cQ3+vZzqvPpsLIaz6+vGPAWHB6BbkAaY0ca59U2Y
	 qkWOihUmIblKZd9MCQ9NIWUuL775HQYE5q/5UAtOp/PxvaYMb1oUVcIsuspo5tZYH1
	 OeUHN02rqALZzqHEFZNACYGMvkz2kSYOApIOwBWTDVXTuvS6cSpf9i5dYmSENSkOJj
	 F5LDvT6ys9pLA==
Date: Tue, 3 Dec 2024 09:32:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, quic_imrashai@quicinc.com, quic_jkona@quicinc.com, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ajit Pandey <quic_ajipan@quicinc.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: sa8775p: Add support for clock
 controllers
Message-ID: <gpikswuggsfnfu5ay3se46ah6rdehaeu5ylaa5aidmqtcejoo2@um7inmnjrcvq>
References: <20241025-sa8775p-mm-v4-resend-patches-v6-0-329a2cac09ae@quicinc.com>
 <20241025-sa8775p-mm-v4-resend-patches-v6-2-329a2cac09ae@quicinc.com>
 <e810ab3d-a225-4c85-a755-3aa18c311cc5@oss.qualcomm.com>
 <9e0f200b-53dd-4dbf-8b0d-1a2f576d3e3f@oss.qualcomm.com>
 <97c6ef74-7ce8-4e67-85f9-d5452678f45f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97c6ef74-7ce8-4e67-85f9-d5452678f45f@quicinc.com>

On Tue, Dec 03, 2024 at 10:04:13AM +0530, Taniya Das wrote:
> 
> 
> On 10/26/2024 12:12 AM, Konrad Dybcio wrote:
> > On 25.10.2024 8:42 PM, Konrad Dybcio wrote:
> > > On 25.10.2024 10:52 AM, Taniya Das wrote:
> > > > Add support for video, camera, display0 and display1 clock controllers
> > > > on SA8775P. The dispcc1 will be enabled based on board requirements.
> > 
> > Actually, why would that be? CCF should park it gracefully with
> > unused cleanup
> > 
> 
> Yes, CCF should take care to cleanup. But I am of an opinion that as we are
> aware that this platform do not require the dispcc1 so we could avoid the
> clock driver initialization and help in boot KPI.
> 

Does that imply that we're guaranteed that the bootloader will never
configure any clocks in dispcc1 that needs to be gracefully parked from
the OS? Is this guaranteed to be the case for all QCS9100 boards?

IMHO we should default to correctness, and then make product-specific
boot time optimizations from that starting point.

Regards,
Bjorn

> > Konrad
> > 
> > > > 
> > > > Reviewed-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> > > > Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> > > > ---
> > > 
> > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > 
> > > Konrad
> 
> -- 
> Thanks & Regards,
> Taniya Das.

