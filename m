Return-Path: <linux-arm-msm+bounces-34443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F96699ED66
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 15:27:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 652CA287B1B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 13:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95FC13F435;
	Tue, 15 Oct 2024 13:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g+67O5yB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2E51B21B7
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728998674; cv=none; b=PulVKyooZIPdRbSOltuzKkw8CySIFb8E9zaznVaQpVGZVbY7wNY5Ef3AqeYFPbN9jr8b549IoDITnWmetW3fAuOZwz9k8bYQ/fcTQ6iT008fMx166TqGoiaKj/qfW+E0BEu31Mcy4YMwQCQe8Hs+Zev57hiohy00x8tWUwj96HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728998674; c=relaxed/simple;
	bh=Yto6XsPX307BnN/gUZ9s+Z2mufkFGjyCQ15rsIyKa1w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYVsoPBUu/lDaU81Gsk9jsPfurU1NpmBryIyVGsOIXgxU+VHyOFJ2lSdWiQjbekLPs2A80KwCz1oH3fQRZ9Y8+PfmeRnz+IkomNn2bKZx8fc6Bph5zgC620GD4UJQOvXpWfLlSSIaJ/8QYX1yzT3w6vGdqwmujWGSVOuCH69PGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g+67O5yB; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-539e1543ab8so6091072e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 06:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728998671; x=1729603471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f3HPN0Wb5LO49XK1vdWh1amy3jYUqFLvzrYUchAGQ7w=;
        b=g+67O5yB5L8zA2+1QlEO/4X/VEUb3Z+jlvH4C/kkQ5dbnJfJ6GHZ4iiqV6CSEyzUmm
         6C4gBGmblv+rvE2NzeMNpkVDJMON1dPoI1/MITAS4PNKHrd+kQgOHjbbEW0xq1YaOs/1
         2lCSzAwpcsBeC1hSdnCXB3dsBjCG7cbh0AIi1c1RyvFr9930+6o8N5i5WibndFvKgPzk
         GowlAL4vMoG7P9abF6xf0OLBx2NxdS+YzL8zMVn2acmYGZ2XAdXFwPjw492DRaznJB8v
         K1ZY1xbyAloT7WD1yo2TXwlAtAfqqwhFxWsMDfeLTYiEdjUo2XsW4WHeLAsxw+UwBTMG
         9YLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728998671; x=1729603471;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3HPN0Wb5LO49XK1vdWh1amy3jYUqFLvzrYUchAGQ7w=;
        b=Md9Qp5BzntPppH2cpy0X5RWAF+Amb9OoDW0N/VXfkXNOFUGSArfIvFgOpCXlUfd22M
         Kcu+BTX4wO9PeET15EZ4HRwx6JowL38xJ9bcM4LZbnuychaMZq8PwuzaU01dYu74XDll
         VeoDxaVgJcXg+2FxYFPrnDuDrOeJVhbK6ZTPJIhAQcnJ4RwhlMIBFFbfVu+gAD4Zb075
         imF+/MCcU3JqvENtErJM24LotBypsLi9uf7r7CgNPer/K+gj27hqo3TzWYQO9/CqD4F4
         r9QB6nuvb4g1GT9ae5G2boq2yTVpP8pQmLLvRcnZamBbnjf0iyift4QZeXRaLIk4wtzF
         IqCA==
X-Forwarded-Encrypted: i=1; AJvYcCVPPoc9LvwRMFQnm81W9ysivuxF4aFFft3YcseLSx9bVS4/bQnNBgNNmOP/a5IYruv+eNXEhP3jygsEQNNN@vger.kernel.org
X-Gm-Message-State: AOJu0YxS+mVJqK2w1YnqjL6McAvs5clgEJdwjKJCuufwhiLJOHjqintx
	rqBbYU7+s/HehB8RgrA+iPpnY/7FxmudU0Q8XjdKCsUca7ETUx2KPIxNHqE3QOI=
X-Google-Smtp-Source: AGHT+IHgr9LmpYpCXWcLMeJQh5/sdLZ7i0a0+HgofYe7nVBOCqrwB/tlVIYrp4mOmwYvq5oHjf6buA==
X-Received: by 2002:a05:6512:3402:b0:539:9ee4:baab with SMTP id 2adb3069b0e04-539e55187c4mr7106085e87.30.1728998671049;
        Tue, 15 Oct 2024 06:24:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a00006dc0sm168280e87.205.2024.10.15.06.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 06:24:30 -0700 (PDT)
Date: Tue, 15 Oct 2024 16:24:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: x1e80100-crd: describe HID supplies
Message-ID: <oj73sm4mrcdcvntyzk5pab57j7xt6x67uftt7znsc5hc66vlpx@rtzvks73hlyy>
References: <20241015122427.15995-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241015122427.15995-1-johan+linaro@kernel.org>

On Tue, Oct 15, 2024 at 02:24:27PM +0200, Johan Hovold wrote:
> Add the missing HID supplies to avoid relying on other consumers to keep
> them on.
> 
> This also avoids the following warnings on boot:
> 
> 	i2c_hid_of 0-0010: supply vdd not found, using dummy regulator
> 	i2c_hid_of 0-0010: supply vddl not found, using dummy regulator
> 	i2c_hid_of 1-0015: supply vdd not found, using dummy regulator
> 	i2c_hid_of 1-0015: supply vddl not found, using dummy regulator
> 	i2c_hid_of 1-003a: supply vdd not found, using dummy regulator
> 	i2c_hid_of 1-003a: supply vddl not found, using dummy regulator
> 
> Note that VREG_MISC_3P3 is also used for things like the fingerprint
> reader which are not yet fully described so mark the regulator as always
> on for now.
> 
> Fixes: d7e03cce0400 ("arm64: dts: qcom: x1e80100-crd: Enable more support")
> Cc: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

