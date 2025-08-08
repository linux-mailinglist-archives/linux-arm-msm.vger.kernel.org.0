Return-Path: <linux-arm-msm+bounces-68081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16579B1E360
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 09:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ED07D1AA2A51
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Aug 2025 07:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC04227BB5;
	Fri,  8 Aug 2025 07:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dayFCIAA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B012264B0;
	Fri,  8 Aug 2025 07:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754638161; cv=none; b=dvlw6CZcyPeEzyBtjWUwJzmLpHWCmickWjbk0ou1COo99g74FXQelKMV7fAIj2ullYDc9vEtPsXfYhmzhjbYh+kP5q/I+p4cbaMrvJ1L9d5go1oohLyEoqrfBNqUSWnPOTpQlnwKZQuX+959QV6+Y4isMjrtVpmTpWENagqKLs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754638161; c=relaxed/simple;
	bh=Mk0AwKBJB1G02alhUoj1s2//Zir6rQq1FnyFyjJ8uug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYwYSrwBWn0QMQPWJlpcBCYCAo98oZ/Dyu0sI+9ZtSZeVV/zhYP5kmt9Hh/jqOoGsn4/HQdn0aSgNeu9qACtV9cjHaomr1DTgE/gXRU0lr2DZ3nF3iCgwcjzyfCqVvucuOAn6vCAUZwq9edrgED9UoHU7DFYr7iL8qBfRSUwBuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dayFCIAA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BD8EC4CEED;
	Fri,  8 Aug 2025 07:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754638158;
	bh=Mk0AwKBJB1G02alhUoj1s2//Zir6rQq1FnyFyjJ8uug=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dayFCIAABjhGsQl3gRNSkUBbATIoynyV8lNeOkq2M8g/Fb5dIQjUqfOOGXIAwGnDK
	 uFazo4qToFaLnkYW2gUdxEdtItxXTBkGJvyb4aYsxqRWBYw78mTPQhCtAd/YpJz+44
	 /p7GvnQWMOI+5MJqS5JcLFH1YuOWr2XECHGWWLzze+p0jH7fmafQ74BfzjaAztJtF3
	 oPrbthQDpHJ+pe+USD6MC9ldFo9q0vI2BxOzOYWGY70hNtFE/lHYdhD1U9JJcf8TC5
	 JFfhRN/F8x2GPlrPHfOsOfLxDlodPm8RoVQjiQTXCl1or42JqNWIv/PuoOnB/Jp7B6
	 lump98/ZfuMKQ==
Date: Fri, 8 Aug 2025 09:29:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, mani@kernel.org, 
	conor+dt@kernel.org, bvanassche@acm.org, andersson@kernel.org, 
	neil.armstrong@linaro.org, dmitry.baryshkov@oss.qualcomm.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH V1 2/4] arm64: dts: qcom: sm8750: add max-microamp for
 UFS PHY and PLL supplies
Message-ID: <20250808-calm-boa-of-swiftness-a4a7ce@kuoka>
References: <20250806154340.20122-1-quic_nitirawa@quicinc.com>
 <20250806154340.20122-3-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250806154340.20122-3-quic_nitirawa@quicinc.com>

On Wed, Aug 06, 2025 at 09:13:38PM +0530, Nitin Rawat wrote:
> Add `vdda-phy-max-microamp` and `vdda-pll-max-microamp` properties to
> the UFS PHY node in the device tree.
> 
> These properties define the maximum current (in microamps) expected
> from the PHY and PLL regulators. This allows the PHY driver to
> configure regulator load accurately and ensure proper regulator
> mode based on load requirements.

That's not the property of phy, but regulator.

Also reasoning is here incomplete - you just post downstream code. :/

Best regards,
Krzysztof


