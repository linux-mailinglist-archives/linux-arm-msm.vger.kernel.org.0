Return-Path: <linux-arm-msm+bounces-52590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E77A72AFE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 09:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B11921891604
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 08:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5EA81FFC41;
	Thu, 27 Mar 2025 08:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QpwLfDs/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FE1FF7D0
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743062702; cv=none; b=MicUId1k+6mJny5bGdBningRnX+I1BJDce6ww6YqPrtCBq/W4JKu/Fh1P9U+DxHXt6D22n/lxxppCsITz8V2PI2YiajRobNf8UVksr+J3ddJ3N7GJ0llrgvln6JDT0LDTsBwKogBfSEvyXEcp8l52OLIGjLo2wp3vGbspSafmTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743062702; c=relaxed/simple;
	bh=dTqlr2hjR451m79Zo3X+DOyCdBNrJpzm94od0/6b/aA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQySjeAKP8HRkUvetrlCThKwgnORSpoTgWb2Ub9R9FQA4QrB8aw8Mmmwis3OlZZbLcYTdB6BbjMXWbCd8SivXd9soWFawVhR5yWz58eKvLqwR5/ahTLU52RFMKUrRayFvAEr9SawdU7tcdCvbj53mFgwg/d+6Q5d84Z66zWRwFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QpwLfDs/; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso99544466b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743062699; x=1743667499; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
        b=QpwLfDs/PMtUgcjUxc3AWrvbdVc94Y3qap3sajT363/vtEc9wh7m0iTR0KwsDy/79S
         XU5ehF9hlOp2yLUO/Zz1U7ZQ2jcP4obtIaLKmxQZft2l3ijN0+IAeMDlHck0A+7ZQp/c
         gxmEsxFM8tcMOdqWQaxM/PaXcQyP2Efh0Iiq0gIa9oq3akZVa1SJLLlmD3ivUoQvVOOq
         ckx5uaIN+JeywcL+6fhz2pmbdUTBWh7lzt9lm0LAdhlPBkf91fxJUFX/XJTQrnJAShwv
         uu0K0Ek1jv2jkKei4OGZcM0sSyaJhWcF8o/TglMOAuFgzKsNKTGTHSjguz6ob+TZUMhy
         7VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743062699; x=1743667499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4HEgztO8bDb8osaU3P7mi3hTF/hZput8WpT0jCkOJM=;
        b=F2JJrRsKzZNNRxPEWUO+kLRp9SOa4uMq5n3p7vnatdywogyR6TIepBWFN263j/YLxY
         tJX59PYf/12/UKk5wUEXxRsVSx2Oiex7luyTV7KvUpzuzP/e0/ezuJtpqTjKIyNES7m2
         Xun3F91cG5hzJ0/aOarzCDVDXupnFi2ineMJEFLj3EJ/42+SBB9dG3pKNYkcguHyYHQ6
         gQBX3bFV2yzzDn/Y49esSUZTthW+Uor/vCAQJiBXnVAsbDk2BpzjL+9yPWxclVayHh7k
         q8JIyRlKIUDtxkDOa6bWT8Ddk3/LoEx5w6t8a4sb1VIkXKq7qJAPbkp3gOiiPU09khof
         VwTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWglqoDA7BrF/RmNMNtwUf1qOq6K08xqb5x4U0ApqTU5tdRg9wio/PqQmnBV+hxs0tD246hhD58bw/MgVfG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg5a62KBtB4oRO5A/JeFJk5kaPrWsylpH3U2mz/4rW8lKCQ44/
	asBqfrtbBqkr0/k2IxDuqHKgr6mIzBHLvsKd1Obcg2p+a/VrYDvMkctDwYFZrKw=
X-Gm-Gg: ASbGnctNYAWAbSByUwrYoCK2HsrD7i6HnwGY967kWpJOTBZR1P5Nt3iKpVHOKRHqNVs
	FqM1/aXzTekbHq4webT+/7If9VGFXki8+kskoeAfniW7pukYfEBoS+jnJPvqpEpAYlUm+RmJA+1
	moJ7bdqKW0ob1NKGpmWXpM958LDRrp3LAQU0Ve1uJTJfD4Mf8x3UsUJ/8M/ugA3H/0POfvD6VyQ
	Mqly1wcsctWv/w+gAerR5sTUI33ax+OmBL25yODa/4VBcL9GwH5FbsYN83WOL79gMm2HfktVgYR
	lsWPcxk02egIFVcN8IAiBwQEvYQg0DDjBz9g4AKlIA==
X-Google-Smtp-Source: AGHT+IHnwu/C7hwA35ZgXejtLeIFJKtAHLhv7l8qMYpyk9Q+W2Ud9zHdHAz/RjHL1R8rTdvL+rtmag==
X-Received: by 2002:a17:907:6eab:b0:ac3:8790:ce75 with SMTP id a640c23a62f3a-ac6fae47cfbmr238239666b.10.1743062699159;
        Thu, 27 Mar 2025 01:04:59 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ecf76fcbedsm5182752a12.67.2025.03.27.01.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 01:04:58 -0700 (PDT)
Date: Thu, 27 Mar 2025 10:04:56 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Christopher Obbard <christopher.obbard@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is
 zero
Message-ID: <Z+UGqItLubQ9kwF+@linaro.org>
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org>

On 25-03-25 19:21:29, Christopher Obbard wrote:
> Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> valid non-zero MIN and MAX values. This patch reworks the logic to
> fallback to the max value in such cases, ensuring correct backlight PWM
> configuration even when the bit count value is not explicitly set.
> 
> This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> values.
> 

Nit-pick: AFAICT, there is no relationship between this patch and the
rest. So it should've probably not be part of this patchset.

