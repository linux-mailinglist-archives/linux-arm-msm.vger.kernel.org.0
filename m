Return-Path: <linux-arm-msm+bounces-34881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEC59A36EC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 09:19:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D7E7280AAB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 07:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D665183CD6;
	Fri, 18 Oct 2024 07:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOJnUToW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0029C187322;
	Fri, 18 Oct 2024 07:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235986; cv=none; b=EKesRCvA7rKH8IWiqcQimylOkg1l3RGpQpUHmkvCkeBENA+X2ZFisGdGjdPB+ZLHU4qPbg87puxFfdyqwxXNeScT1B0/ROrnrNqJHhsZkO2jyS+hWDonlIkfJ9BZ1OhjcNy+JUI/jX8/l93W0XaP/EWGoRD8k7NFhC8aAv3UDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235986; c=relaxed/simple;
	bh=bCp0SFamEvfbrQZJY6bHizCX8CrMR44M0NkWE5Mr9JM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkgjzMyfut2jbchWcFZjd0TN/YKp5WxMdGB90RxS1sXzWzwKdK4QiuUd/VJpL3HDm1ddALFte6nJO/AnnfOuQASMVXGl4XHI8GMOX5rTUxBwXAecsZ+BuZGIw2RWchI0N2KgxEQh/nHmS8zIS9RRDo2sPrEWfjNx/T9m5n8WuHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOJnUToW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C56C4C4CEC3;
	Fri, 18 Oct 2024 07:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729235985;
	bh=bCp0SFamEvfbrQZJY6bHizCX8CrMR44M0NkWE5Mr9JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mOJnUToWPtpkHrvcbXgOqcPm891VJGcxelFJIfiez5zzYG1pwm7HN+Ax1xK37TE+m
	 OtK6QUfmTKfXzXfbQYldbarcyG6NZZjC31IGCUQsK9XXNQ30kMhujbtF/Xy7fnD9Uk
	 +R4ivfuH5XCH3N9sRKdanPI5lenWaeRkvD8kWuEscQe+ERlXgyHjsycwWNwIo9e60/
	 x/dNWFuKgNOZ2F/Qj8e3kThnX6WupC9akAo9oLQz4boNxMXnkdypWeIXM4RkbVw4OE
	 ucA3ReP6D47FXlYmAICRVpyu1HZ3VZcjB/9G56pOhBjC7bT2i1pGgboQS8F9j50Tck
	 asVY6Jt0lwH/g==
Date: Fri, 18 Oct 2024 09:19:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: qcom,pdc: Add
 SAR2130P compatible
Message-ID: <offdcgni7pr433jozldgvzkubr6gvb635odlopgrweitiynaky@kvbgg4xd7g5k>
References: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017-sar2130p-pdc-v1-1-cf9ccd9c37da@linaro.org>

On Thu, Oct 17, 2024 at 09:13:01PM +0300, Dmitry Baryshkov wrote:
> Document compatible for PDC interrupt controller on SAR2130P platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/interrupt-controller/qcom,pdc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

This will be picked up by Bjorn, so should be part of patchset
targetting SoC (just like few others, e.g. firmware). Please target same
maintainer tree/subsystem within one patchset.

Best regards,
Krzysztof


