Return-Path: <linux-arm-msm+bounces-20667-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8175F8D1114
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 02:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3CAEB2846C5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 00:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 232DE3D71;
	Tue, 28 May 2024 00:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jSur2PGK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CC21C2E
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 00:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716857120; cv=none; b=Txq+8z05wB54N3IusadWtEwlMZUyG9dDaHWEuztjudIUHQ/aae2QPGKd/l8FOqnCGNAvQIeKwnru+qTkm8TKXA3E5vbIjeEdLs9hE8m+Wg6FVcw6+P6loyjuHSkf/ZlSCdSSiB7vz4HdaY5fYQDcEziOWZXmgM1KDj5/RzRrHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716857120; c=relaxed/simple;
	bh=bVq4x2LV6HGCLh1bYMZgaAKOSOiIEQy6JvVmRQ7Pn3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAc2z+txSwTcnWOQy2MtnJKPaL9qOPUvzVr7Xt5kM0193DppTFd4GVJE2JgXdfXvVtRv3uKMNhdTSlUrhQrplFEGpkgORNNv0ZLqqLEQYe9/db3sMojFhshbDPZHxH5ifoPBPfi6X1qwpwtkMrSchodnscllLMznkHIUdPjXhAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jSur2PGK; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5238b7d0494so340169e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 May 2024 17:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716857116; x=1717461916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sDEXYOr9ZRI9mVDJZlpKwCWHY9LLs1Qpn4kLIQO8xs0=;
        b=jSur2PGKgcsz6kxi+QEbC91TNjFdDkqTu9yj8QWSMxHkiiIllxiK5kczX90QmkMc0y
         4pgfy9/Qn8D3GablTfyzmtzy9i5iox9R4D7iEF012k3y/kRZQVLpwAurlQi5pvrezZwm
         6GVHsZEnj4dbEiYJW54rmXcM++/ARSiP69FJnNxHUWHNpgwQjIDmA++VtIz355HwAd1Q
         c3Gb011RBxGnrOUZVKjrGs992pobd4NIaa7zBcOFACP2jMN2mG52lPwoj0Z/wU1kYMYe
         n72+3pT0mFxc2eZhYeQ5j8ZHHwDxOZNtvMKa76nc1D1ZenhWZ55dK1QRen02bhNDhb1V
         Yahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716857116; x=1717461916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDEXYOr9ZRI9mVDJZlpKwCWHY9LLs1Qpn4kLIQO8xs0=;
        b=mRglwhNDAIUWjd8YwAq25tVfe4CZjDQwNDKERBM8HaZHAj+IRcuxtS8RV6aAT8ohvr
         3UTTrNhCAncic94omweAZrFhZUL63SucYbDNbGKqG1XTN1F6+PbVbnPcZIRywPYFobv4
         jid08CxMJQe6WxYJPgh02EUoXjujns+nkIE9AKG3qtlJ8F04LbaDVVqeqWAIsOX4St8H
         L18uyFIiJtQ+sO7e9lCl7nEkG70uK6MqzMqqqUZRClfxDzBKvNbkjxbJiIjdvCx7u+lu
         qKVuMx0Gu4HvtthFiiNCcSbgD3IbLYg+x09zTsHGdyuRqWgIH8XvII1ixd2IxlBS7ZQN
         6Lgw==
X-Forwarded-Encrypted: i=1; AJvYcCUnmj0xIVx4LllqC8njdUN8PDIiq/jfYxX7uCfivJp3uLq/YJW4/KVJyXOJ19Y2Hevif1owsP89rg/ve9sOhFvCB6f1L3aUSYYp3AnILw==
X-Gm-Message-State: AOJu0Yx5qQ9TM4e4FL+fbONN9sR8iCLEpZyicYRIU6690qP4rDuy15oz
	fCZGm/XhUwfvf8qHaQjVT1lFKEmd5zhAhyAihw6ovQr8jQCks7wTuJrnz4HVQEE=
X-Google-Smtp-Source: AGHT+IFQbwGyYhw06bV37yCGvxaK6DxpXC4KtoQKfMU/u4tVq907cNkNr1yjasY/AoqLNokYrBaViw==
X-Received: by 2002:a19:6b0e:0:b0:51f:621:fdaa with SMTP id 2adb3069b0e04-5296547aafamr9470678e87.18.1716857116270;
        Mon, 27 May 2024 17:45:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5296ee4a90asm807192e87.77.2024.05.27.17.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 17:45:15 -0700 (PDT)
Date: Tue, 28 May 2024 03:45:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	MSM <linux-arm-msm@vger.kernel.org>, DT <devicetree@vger.kernel.org>, 
	Bryan O Donoghue <bryan.odonoghue@linaro.org>, Pierre-Hugues Husson <phhusson@freebox.fr>, 
	Arnaud Vrac <avrac@freebox.fr>
Subject: Re: [PATCH v1] arm64: dts: qcom: msm8998: add HDMI GPIOs
Message-ID: <o6wwzb4qblelfpfsrmqhoovjnyvymf42p2ilv4bzn4le3nklbv@kj3qklez7izy>
References: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8cc61db5-2920-4dd1-8132-5af434fb05b1@freebox.fr>

On Mon, May 27, 2024 at 05:40:15PM +0200, Marc Gonzalez wrote:
> MSM8998 GPIO pin controller reference design defines:
> 
> - CEC: pin 31
> - DDC: pin 32,33
> - HPD: pin 34
> 
> Downstream vendor code for reference:
> 
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/arch/arm/boot/dts/qcom/msm8998-pinctrl.dtsi#L2324-2400
> 
> mdss_hdmi_{cec,ddc,hpd}_{active,suspend}
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  arch/arm64/boot/dts/qcom/msm8998.dtsi | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)

While I don't see anything wrong with this patch, maybe it's better to
include it into the patchset that adds all HDMI nodes to the
msm8998.dtsi.

-- 
With best wishes
Dmitry

