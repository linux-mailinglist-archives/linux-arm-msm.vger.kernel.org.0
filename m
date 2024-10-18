Return-Path: <linux-arm-msm+bounces-34876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A559A36CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC5801C235C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19970188739;
	Fri, 18 Oct 2024 07:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="huurD9kI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F3918452C;
	Fri, 18 Oct 2024 07:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235654; cv=none; b=RqhlV/vjj2VUWaxrVAgUR65h09JmDmhCuOsXLRcLwWOtu+Efizw27QiYG25Ua9LybDKqqFs/GB0bQofSvT4aCsGFETN6nbisXzr01oD1wcyoALhR4P5GAtbXm4G0oRB/BlEQmTMNm7XWuhc/fYOExltsE+9A4lcIJH2f87btMNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235654; c=relaxed/simple;
	bh=iqRqAYpTDNo9GyjaFpQYdE2Yp2QG7sSqBZVCBns8Kgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKfJJQ7Uj9Xfwwmznyj2Q4lP8lEoMW4ZTXJr8qhvxh09E7ZmfcC54gQo44UrB5z4p+E646PB7Fc31sC2XAtUcXtrtTnFpSJg5XhILPlHj/ai73010KfzYBZpFYxTsbR4I3tJQQbX/Oqhq4oOCLwy6RU/La99GOcLQ9pzVJHpyo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=huurD9kI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB3BC4CEC3;
	Fri, 18 Oct 2024 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729235653;
	bh=iqRqAYpTDNo9GyjaFpQYdE2Yp2QG7sSqBZVCBns8Kgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=huurD9kIebZynigf+6EB1hUvlmJRcBCTdBn8GG9iTm1e82727hi0nDFevZss/dSU6
	 Pw9R3FQP/ea/ptH0EfpcBaMThQDcYSb+oBrIIDF/hzyZzoTLlNfrs4acw/5CRZ7r3w
	 Wqjd4AZ73mpVpN5FZwBCzBuKU71pFdU43lRStrYnmUF/3rOTIXeH9Ckqi+qy3Zj659
	 vDlIhVqH1PehsGd0ooAG6JGasB3rZKhzWuDLJGfNAQOpWJDBd0GViv6+ouTZ4eU8vL
	 xKN7jo8bz350TNFwTbc5TCKpkpCeB4BRr0TmqA6QXkbJMVu+cJ3DLTrPCITphcmwnf
	 9Ms5XKp08cc/A==
Date: Fri, 18 Oct 2024 09:14:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: phy: qcom: snps-eusb2: Add SAR2130P
 compatible
Message-ID: <spoxmgw3jaynrdawyldzvtzj3w4qn2a7xpsl4q6h7q27nhqj2x@r6rcjafyhiyi>
References: <20241017-sar2130p-eusb2-v1-1-1cedd674ec64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-eusb2-v1-1-1cedd674ec64@linaro.org>

On Thu, Oct 17, 2024 at 08:42:56PM +0300, Dmitry Baryshkov wrote:
> Document the Synopsys eUSB2 PHY on the SAR2130P platform by using
> the SM8550 as fallback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


