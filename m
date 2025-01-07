Return-Path: <linux-arm-msm+bounces-44170-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6744A045DC
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 17:19:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C49D188261C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2025 16:19:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEFB71F03DB;
	Tue,  7 Jan 2025 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFfCLCpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5E21E7668;
	Tue,  7 Jan 2025 16:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736266748; cv=none; b=TICBMCeY/CDWHvMQDkRAjGG54otJ2u24reC8uN6IadsINt7grtk7L9rRPa8qYYYPWefzABoYfLcppU7sNBusN9p7KICDkLANf7Nsxw8JCzqxiJKczN7h3evg2VODxAzbIapYLRsj8Xhz5KeUYK9vOGvGwAuCnD9XrZ6/QVqGsik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736266748; c=relaxed/simple;
	bh=gft34UBMEUSvS3bRuHDms8MxryrbWIHPY1TZqqoJMeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MsLLZ5kOO2JCJQ6pGRzUOiHFGvX4KcATvz+rxyjWIDR2IA2rZAY//HnixPFCFw+t1oTyBai1YgK3BnJc1HWHXttmEBmSqRQI9klt679X7cXadAq17WZn53oRrtEXszprtJEkNQoz0pUMMfT1xjvcg8LGlGB68q9x44+Jh+/bIKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFfCLCpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013F3C4CED6;
	Tue,  7 Jan 2025 16:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736266748;
	bh=gft34UBMEUSvS3bRuHDms8MxryrbWIHPY1TZqqoJMeM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YFfCLCpYFs6Hc2QvSEJH4Xnfgt1zHkl/GG4G6uRRvwSqIhw4IhESgvkrJO/riIojJ
	 PLBI+g4ZKf/J98R/mYDwqYCTRYmLD/Qb9axl1rzBfjfJl0q6bDVH7roTKs8rj+gUAC
	 4VHJ5tBkvAbQ9PWZgqeBQw+291CLEJg2AIlnWCoeY4mj7rLooq7Bx8PmPxV9Rmkvpv
	 KWaIFrFMn8Ew84i0qmopYuhmTG87RJPEH4BfqD2gT4JlK0cjYyIHsSIXSGaaQL3DD0
	 ewTyXClo+bnWMZJdEd8iCI3iWL7wFZ06eSz6Y5xcn30NAdtOGopf4fRcQH5c+rPa5B
	 SG9qezq2vqUPQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tVCIM-000000000n0-2Xok;
	Tue, 07 Jan 2025 17:19:06 +0100
Date: Tue, 7 Jan 2025 17:19:06 +0100
From: Johan Hovold <johan@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Fix usb_2 controller
 interrupts
Message-ID: <Z31T-pBnEDEc2l7K@hovoldconsulting.com>
References: <20250107-x1e80100-fix-usb2-controller-irqs-v1-1-4689aa9852a7@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107-x1e80100-fix-usb2-controller-irqs-v1-1-4689aa9852a7@linaro.org>

On Tue, Jan 07, 2025 at 03:15:16PM +0200, Abel Vesa wrote:
> Back when the CRD support was brought up, the usb_2 controller didn't
> have anything connected to it in order to test it properly, so it was
> never enabled.
> 
> On the Lenovo ThinkPad T14s, the usb_2 controller has the fingerprint
> controller connected to it. So enabling it, proved that the interrupts
> lines were wrong from the start.
> 
> Fix both the pwr_event and the DWC ctrl_irq lines, according to
> documentation.
> 
> Fixes: 4af46b7bd66f ("arm64: dts: qcom: x1e80100: Add USB nodes")
> Cc: stable@vger.kernel.org	# 6.9
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

