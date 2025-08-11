Return-Path: <linux-arm-msm+bounces-68531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D675B2120E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 18:33:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 607A23E6ACE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 16:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AAB229BDAB;
	Mon, 11 Aug 2025 16:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyaJ67lY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F9311C3B;
	Mon, 11 Aug 2025 16:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754928658; cv=none; b=KO3GbOgKJpd74saFJMDIsBGVWl5B9kCqm6P/7d4pn1Pa/uEnccZucReoRD3cwLjVY0/Cl5LKH40AaCxqynEnvDcn3GXxBNkb7NzynJ1SiC6m+3FsjvGF+4KXCY1sic0fTaduBxukd6bvDlIBT7lby0dTCWKgTFrLCDSBaruAZqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754928658; c=relaxed/simple;
	bh=hHJy35yKZJZVzNggfD6kViB08vigIgMmo5+Qvfy2IBY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHAzqYmpZ3x9bYd8oluDFADlGWfeVIC0+txSQ7xHcl45r1N7pAKtkR/7f2xJUArdbVl6oyE+5PnQpx7zXGsUxvKC5EnT0cBhPbB6df9ZdS0svx75MmwY8/RCyYUi02wnXjfj/HY2HC+j8Eogq7M01cprve16HWWtvD/3oA/JeJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyaJ67lY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C93BEC4CEED;
	Mon, 11 Aug 2025 16:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754928657;
	bh=hHJy35yKZJZVzNggfD6kViB08vigIgMmo5+Qvfy2IBY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyaJ67lYujFWIIAzpumQaZs8SozpKagcGxCDLLO7z0kZJgjINW/3FNnW/S4THCEfP
	 2tKHIvD/iuk5MYgaunn3lLYf5kurTGe+xmG+cyh8hnVFoli/uQWqUpYCcjLC3lIixp
	 Ts2SQ3kR9b3j6yaFgZS3w9yd3/qE0cZcNJc1K9IDGoemChxJE4AmazMCnoBWiWKQg5
	 fq8/6m2Ev+7zgFvI0rHSYj8ZuYcKDThoqMRVKTf7tveZSfHwhzky2aKYs7DNQQvDZb
	 utNtN30x9o06oZlsd8358ioqyLmJt8LOPJtrEAQuDO2ogkPN+Z2wmj5G3eosuXbi/G
	 ycTZRNjA9uGAg==
Date: Mon, 11 Aug 2025 11:10:55 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH DO NOT MERGE RFC v2 2/3] arm64: dts: qcom: sm8750-mtp:
 Enable Iris codec
Message-ID: <f2k2z7tlm23bftjnvtnswwglravbjmiuihv5fpf2g2b6hl6mti@m5ldrmxpbspp>
References: <20250806-b4-sm8750-iris-dts-v2-0-2ce197525eed@linaro.org>
 <20250806-b4-sm8750-iris-dts-v2-2-2ce197525eed@linaro.org>
 <pb3yyyjpffjb5u4oorv2rfo634h6v52gytmevn36k5xeqxhjwn@xj7x3dmaxwv3>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <pb3yyyjpffjb5u4oorv2rfo634h6v52gytmevn36k5xeqxhjwn@xj7x3dmaxwv3>

On Sat, Aug 09, 2025 at 12:42:16PM +0300, Dmitry Baryshkov wrote:
> On Wed, Aug 06, 2025 at 02:38:31PM +0200, Krzysztof Kozlowski wrote:
> > Enable on SM8750 MTP the Iris video codec for accelerated video
> > encoding/decoding.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Do not merge because firmware (hard-coded in the driver) is not released.
> 
> I don't think we have been delaying enablement of the hardware for these
> reasons. The user might have other ways to get the firmware (or to
> disable the device) in DT.
> 

At least with the venus driver, missing firmware would result in
sync_state never happening. I see there's some changes in that behavior
lately, so perhaps this has changed?

But I agree with you that it would be preferable to deal with this
shortcoming in the implementation, rather than holding back the hardware
description.

Regards,
Bjorn

> -- 
> With best wishes
> Dmitry

