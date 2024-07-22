Return-Path: <linux-arm-msm+bounces-26779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EAE938D1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 12:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6AB161C22FEC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jul 2024 10:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E3C16CD0A;
	Mon, 22 Jul 2024 10:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aaAxhXMr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D33316C87B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 10:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721642618; cv=none; b=L4pPZnJ/WKI/aCMEsDk+FoYECqgH05qUFF0pWeV6ulaYOqqBUwlOWVRGGIti8m2s5tH+MXhy45i4wiJUdtc6aKVkFRMDqaxP4/r81ZpgxrObISFmv42LrOo/J2mKzLafCgtg8Wbsn3tp6IrHfAdVXjRdr4GYXlvEXIDt3e7SXbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721642618; c=relaxed/simple;
	bh=lu2Q+C4DLQknPj9Jd3QaCOX77D2WkgzO3Ghf/vqXz2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qn59z/xw7NJJROw1fZLjM+H3f9SDKYm7X6wE1iXx9ELtveHZFT/QYkSGH9et8epaFkuOWVzzJ95E5qwO40v6tsVAICIsGA1Ht//EWhECdAjQIlrLxVQEmT64Ep1rd2hUgXJDSge3GIpOrnEqmyLy6wGo30BiT/AnIuo0ZEmnbik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aaAxhXMr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-427cede1e86so28721995e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jul 2024 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721642615; x=1722247415; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6uoyFxG/Oeo0kR6xNOcEuL8BAzXUSym52tPAVq2QShk=;
        b=aaAxhXMrprH12SBi/5bnCcVnORAtsz98CZVnnRhmcn/vnG7Ln0LloqTlIVjmWLP8/e
         OkAIAQsoPVyeyM8uItyH6Vkqc6+4FCyN10kzLZHZDYC/DW18bENXXGlmuHY3EvFAoQR1
         mcI1y1SodWorATOcvsdQQ6r6mZdcm2cvMtddgusH+UgFz5dQ9Rpv1JetCqnjHJ5Ytpno
         9wD4vX84jb//dlt75J52A+iwh4NQ26nG7VXrv6XqCpups47wniVo9UgClGvw9dRBwL8R
         rl2V51vPWjXtpfELTLYWF3CW3Z259C/Ahyumc57yCP9iyDghzM2yPKxAvyT/YEeqd1TW
         iQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721642615; x=1722247415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uoyFxG/Oeo0kR6xNOcEuL8BAzXUSym52tPAVq2QShk=;
        b=ilDM/reWZxIwo5uwetm+2qOxaOy6JhWmJ9k3pCDxLAG+IvaO5GDKBqO4xoT2VjDdo7
         G5PRRUls7DHbgfFiw7lxe6BW7nzGJBt01c85/yj/qa3MzoyQ+dnVioWSwUB6WssGFfhi
         ZtFqLsJiGg83PCrekMzh+HW2rTAKkTDUccRct3OtfYn5FSQnjic1zoofss3BHwN6WsPG
         aZ8DtpNMXjF199IFcia//m26BsDeVIgXUHrReEgdBfeZc1P7gxPiQiiCrElrRWn+s2Xq
         67wjr+TLZ6znbV+4yCSra0wbPJrcHRQ+lVYuRYiSpqhGTKiWFWCqgfTUVC0o6te9xOz/
         PZkA==
X-Forwarded-Encrypted: i=1; AJvYcCWc35YnkFqpRi+HZJ7+gKjAo+XBU9oED6MyW/UDLNzTfjywDBKXcZq/knoOWulGWC00wIphvK+pm0+Xu1IIzZbyL70HhGcgoYh0kUtmfQ==
X-Gm-Message-State: AOJu0YyX0jnL9dUD+Nxr9VjQ2mGrwOtE6BoZglEHnpxHMwhtxISYKioH
	dfhtgEN7C+6lUUQNvkUIEayxVdv8NKOHyLzK+KTzoLplUJnHAE5weRFr0NrxkVk=
X-Google-Smtp-Source: AGHT+IFWzprnWm+pL78dRwSRImwbVjoIRaMgo/29lHWg1qiPposyS2Y1JXm0YZFvsOy3bHUjyofnZQ==
X-Received: by 2002:a05:600c:154e:b0:426:68f2:4d7b with SMTP id 5b1f17b1804b1-427dc5153f3mr39961415e9.3.1721642615431;
        Mon, 22 Jul 2024 03:03:35 -0700 (PDT)
Received: from linaro.org ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d6906c77sm121641415e9.23.2024.07.22.03.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 03:03:34 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:03:33 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Rajendra Nayak <quic_rjendra@quicinc.com>,
	Xilin Wu <wuxilin123@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/12] arm64: dts: qcom: x1e80100-qcp: disable PCIe6a
 perst pull down
Message-ID: <Zp4udVkE0Ts1H+AW@linaro.org>
References: <20240722095459.27437-1-johan+linaro@kernel.org>
 <20240722095459.27437-4-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240722095459.27437-4-johan+linaro@kernel.org>

On 24-07-22 11:54:50, Johan Hovold wrote:
> Disable the PCIe6a perst pull-down resistor to save some power.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> index 86735f07fbb5..998e5ea2f52e 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
> @@ -677,7 +677,7 @@ perst-n-pins {
>  			pins = "gpio152";
>  			function = "gpio";
>  			drive-strength = <2>;
> -			bias-pull-down;
> +			bias-disable;
>  		};
>  
>  		wake-n-pins {
> -- 
> 2.44.2
> 

