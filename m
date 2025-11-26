Return-Path: <linux-arm-msm+bounces-83489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C05C8ACF6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 17:05:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A6B63B7A7A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Nov 2025 16:01:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF46F304BA4;
	Wed, 26 Nov 2025 16:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="O3ig4MAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6133C1AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Nov 2025 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764172856; cv=none; b=CfUotXyii710S8SE6Gw5QeZNvjdBWdMzPtuV8xa1f9yETYxIuozkp0Zrge7qSSu/zwmYqkhahguLkL1OPspXwO2a+M29CwVai5QEnedHiR3YuTam5K3wkcjsnbg+giOyEPYcEmPFsw+8aS0v3OKl+H4dOuxr2lxMS8zmfNQwZ7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764172856; c=relaxed/simple;
	bh=4RJiVhWcuaqXKmj8YO26+FPIWFpSIHTCXUT0NJ4LllY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q6yxbICJQYM/bE0526FauQQeD5mZ4a0tuztbJfL5Av7c+EJLuIP67lVq+L+PKa5hiobACMAc/eqv4xlE/IWDkt6bCenGHq+q1yECSqGb1zp012oxXO2aoJiMPEkwW9TiUp8B4exVL4B6cHbTUSRkP2nDYXCdKO65w6EBIENxbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=O3ig4MAh; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <c198aeb1-6300-4905-88ce-f9af99495ac1@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1764172852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4RJiVhWcuaqXKmj8YO26+FPIWFpSIHTCXUT0NJ4LllY=;
	b=O3ig4MAhMbpUa+2slGkT49/UyoafduCws8DrwdPBWxg3DcBp/72o+LVcd/sJv8SSDL04XL
	DwHPfVVABNQ8v5x30MsYjnX9K3U3FLjtb4ffpehNPzoiA4xpbEWf62Kzy4+3dxwi8+Uufq
	8luev1pX5RnMvi5xPyMTjOxr3CEwPqgFQ4AJU2r1U3XaSHInDxDyszrX3Iwp/nDcnh80gG
	VFdC5PT6jxTG3c5el5+Ikbu9t2hjSKZNDknz+MeYj258E2Xyizh91t8bF3elUIz53gnh1H
	QtKnii8m+X9K6oBZS9si8WNGFXtFByF/9vDNT7Ts4YuhYnQMHiW9mOm1AXy0QA==
Date: Wed, 26 Nov 2025 13:00:38 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2] gpio: shared: handle the reset-gpios corner case
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
 <krzk@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20251125-gpiolib-shared-reset-gpio-fix-v2-1-4eb6fa41f1dd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT


On 11/25/25 7:19 AM, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's an unexpected interaction between the reset-gpio driver and the
> shared GPIO support. The reset-gpio device is an auxiliary device that's
> created dynamically and fulfills a similar role to the gpio-shared-proxy
> driver but is limited in scope to just supporting the "reset-gpios"
> property.
> [..]

Can confirm that this finally works!

Tested-by: Val Packett <val@packett.cool>

~val


