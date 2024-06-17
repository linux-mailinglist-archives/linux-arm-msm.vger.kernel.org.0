Return-Path: <linux-arm-msm+bounces-22930-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 152A490BA26
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 20:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C3D282F52
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Jun 2024 18:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C78371991AC;
	Mon, 17 Jun 2024 18:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="adwwQhkU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCBF198A0D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 18:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718650388; cv=none; b=mt3O8vOavbao6O2GzanLovsJV7jpQJHge+VEHU0fyNIuA+yu6j357o2NpgONykGPxgzoZ3upHn4iF0r3/S+3Stq70z4yxEyDiqm9dF2v8a7+kyZYaGslOMzQWiSkkv+oBYjRYGFCxLlQ6pSPeqn4v8frB3hgrWfgmUn/OzfGEfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718650388; c=relaxed/simple;
	bh=K9KjBKCkpXLAqOUVTwlZWowQdOkv1eWRfWuRpNdDdC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YQAWVO5fNBj2iOyA9dCxIfvei74y7upiKTpbwA3aT0Sli8kacEzYl4L79sKSaoGYsb7z72sOTov2jdRrfCdU0w9h+pRNj5P5YrMaCSesSaIp+uge+XzxapUf5IS5u6f240nVqOWfvsJtBMljJdeQb0tE73SfVnZHYMORwTrvPFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=adwwQhkU; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52bc035a7ccso4967880e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Jun 2024 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718650385; x=1719255185; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MWy7ZuXKNt2Ozc+a401wysn7JDFxJ4mbR0Kx2EK+fP0=;
        b=adwwQhkUT9dibSw8WUspUawD54qOfBWo96bBCEI7559GbXPD74Kvd5JXSEe8VreSkp
         y6z6DNdPkwQfaJ3zaQa4BTWfN2lq/u7rU2SK77AbQfIL+p06CcgiiqS0EakfDlv47xVq
         CjLcK4xWw5SdYmYln47YNo2BaVadWx7bWBwDKZfkNQZOpofNv4eygYWQAiw1FN8BuPFt
         WGenlCkKhvMUcNF9RVq7e6pPnNqM0+00SSdQXOaDLblEn7mvJGj9tU43imBebP3C9Plc
         Xkl+FGdbWfna2Js8UbVYt4OxFZ/kKT5KBXA0WnHjjrXaueRotmURX/H6xuDAfoB0bAAy
         58Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718650385; x=1719255185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MWy7ZuXKNt2Ozc+a401wysn7JDFxJ4mbR0Kx2EK+fP0=;
        b=A++xt9i8qD51u4y5NVxLrOrPCdHvIljBt5Ff2rSoCkgXHYjqmg1I3/uWc8h2zFtsFe
         r9bwRX+vA0bz8YEcPgs3wTifmxOfXI/fchM5kD+jb7EiyhhKSrZLkP3KV8NaCVvZpU3P
         GfY+lUvzXnX9a8bJ1tgHsAkh0NluEAYyFCruyyw3CJM5kEQYWWPXBqIJB2u/oG7tXpC8
         /3Er94atp4+WQC9vOBVsXlaNhVUPAyakLlZH8H/R2QpwkoqIyxwoPdN+EGPkk7zl9D64
         /4sB0peDzEKghI+wdsjVrakhTEYYltmfA9HkZv4sxBCNoTsWI6HnFCBzsG6MGfQ6ER1f
         lGmw==
X-Forwarded-Encrypted: i=1; AJvYcCVJD7iLpfKwln1fbBIw+iKHN8Zrb1o0I/i2E2LdiF/wuh8T7Toph3RmkhZNJwTuHzzulq1mOqRMA97ajhWJSimVlYxt1JSAGGkshW8m3A==
X-Gm-Message-State: AOJu0Yz5Ej4haaLYo+WIK8Bs+AepYwLzFOxp5DpuK/vLAQGn9TyrzD88
	rQ7+PkjQn1MT26dOlWDNP76pKAsQURifaEy+a1zxOb7DQNb0Fo4g45u2P/1NgxMnnZLb2VReMYk
	4
X-Google-Smtp-Source: AGHT+IEWLFZZ0jt8SRhky/z9Jh7PVDX3/2EZDQYZkcA5mbEYl1CnAWhQD/l67EYmxT3DLAleDU3ugg==
X-Received: by 2002:ac2:43d6:0:b0:52c:a9c2:d363 with SMTP id 2adb3069b0e04-52ca9c316abmr5936135e87.10.1718650385024;
        Mon, 17 Jun 2024 11:53:05 -0700 (PDT)
Received: from ?IPV6:2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59? ([2a00:f41:cb2:a9df:9f88:17b:c7e7:fa59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca2825b43sm1301472e87.12.2024.06.17.11.53.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 11:53:04 -0700 (PDT)
Message-ID: <c45cc12e-40e2-4a1b-8055-b3e956ba2a24@linaro.org>
Date: Mon, 17 Jun 2024 20:53:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] serial: qcom-geni: Introduce
 qcom_geni_serial_poll_bitfield()
To: Douglas Anderson <dianders@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>, Tony Lindgren <tony@atomide.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Johan Hovold <johan+linaro@kernel.org>,
 John Ogness <john.ogness@linutronix.de>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Stephen Boyd <swboyd@chromium.org>, linux-serial@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Rob Herring <robh@kernel.org>,
 Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>
References: <20240610222515.3023730-1-dianders@chromium.org>
 <20240610152420.v4.5.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240610152420.v4.5.Ic6411eab8d9d37acc451705f583fb535cd6dadb2@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/24 00:24, Douglas Anderson wrote:
> With a small modification the qcom_geni_serial_poll_bit() function
> could be used to poll more than just a single bit. Let's generalize
> it. We'll make the qcom_geni_serial_poll_bit() into just a wrapper of
> the general function.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

