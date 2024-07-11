Return-Path: <linux-arm-msm+bounces-25990-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 606FA92EAA2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 16:22:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9AA62B231F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jul 2024 14:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50F4D166309;
	Thu, 11 Jul 2024 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TaGDmrz9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B9B115ECCA;
	Thu, 11 Jul 2024 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720707724; cv=none; b=UcS7feD6U8/bpVfa83tFT9dO4dcWhQ5mLsrsPaw0kVfq0RfIphrdpNpja1p/6T6vR+vtY/gG2KGlnfvvvBMQZfSOsUKPPYFVfpNdrAArWYyCuOv4Tk9py6/8DSYp7C4rVIahh2p2oanHMz6yvQxU183vMP0fuWOL7mI9O2j2c1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720707724; c=relaxed/simple;
	bh=emm6+EbZItXrO7yF1WpnKGlUtBuKXqxxto8yU37Omr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG3pCulh1VvOg1uxuZYYS8rzJtr+6OCY7EGI/1XCTi1Kvr9rUjc23nN2+dPkT/+hPgw+WkrlmX2G+j68rxLy3YpnE5pqdpZ9OB+DucwkK2QUWNkWfZWWMJi0fnX/riKpibAqTRJVyfaHMdh643v5Wxp5hbkK56XQlnOrjORhWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TaGDmrz9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECD4C116B1;
	Thu, 11 Jul 2024 14:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720707723;
	bh=emm6+EbZItXrO7yF1WpnKGlUtBuKXqxxto8yU37Omr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaGDmrz9dCrSPEi9cqK180QE8Yu0jYyREA1wzAzLI9KaRQKX52HHnfSbBMmtFBqVM
	 95PggXLdNv4of7mH/W3Z0ytVboG5F3i7GSen8SwJc0ALuqFpDU3Qqf5VVwZDlUcQwj
	 7JwxgfFlaet4HaEq+IksUFJLTjgImva3jQFYQnMPJS4N2ysbOu3BhvwUbBMthhoSV8
	 10XIyeKleNGUgAoKK7FVopmmunruUyZPLKxbm1ZEQhAanyXPeoJG24kbhmPnpr+ksF
	 jJXVAsshooaG5lhXSSPQaHY8YLPfP4mGyOWY0vGAM/BsT5vrh3HT+bfYn9xu46VAzU
	 LH80ryIsDY8Bg==
Date: Thu, 11 Jul 2024 08:22:02 -0600
From: Rob Herring <robh@kernel.org>
To: Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: gregkh@linuxfoundation.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	andersson@kernel.org, konrad.dybcio@linaro.org,
	quic_wcheng@quicinc.com, johan+linaro@kernel.org,
	quic_kriskura@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v0 1/2] dt-bindings: usb: qcom,dwc3: Add minItems for
 interrupt info
Message-ID: <20240711142202.GA2256964-robh@kernel.org>
References: <20240711065615.2720367-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711065615.2720367-1-quic_varada@quicinc.com>

On Thu, Jul 11, 2024 at 12:26:14PM +0530, Varadarajan Narayanan wrote:
> IPQ5332 has only three interrupts. Update min items
> accordingly for interrupt names to fix the following
> dt_binding_check errors.

Patch version numbering starts at 1, not 0.

Rob

