Return-Path: <linux-arm-msm+bounces-52648-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 96231A73334
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 14:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 60E3F177ABC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 13:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D683205503;
	Thu, 27 Mar 2025 13:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l88Xhatj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BCE1175BF
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 13:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743081571; cv=none; b=a1fqpPEpvMn3oyZK9GTdcS5R8RGORl4bw0dYAzDBwh2qDCj/yr29KAZrCMZ/Pp7ILPkXCHIGTitkg6plO2BPIXWgRe4axpsN+irFvLcTjZIIdtXEHfCe8twmfbNngO0/8kzFAoKIEv4VDCY1xHCZt1k44Z2fRks2z7/HGi8W1C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743081571; c=relaxed/simple;
	bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmBAif5T5ehwHq0CiZgFqs2aWkUS/efEtO7RxcwJl8PO8x4SwYUDyL79xxtheTfmnL3XhyrEUCsdJmPm8lSQ1+ntB+8pu1y32878rk4ZzpxUw/Db+u0G3m03bO+9QAB1gVBUP1IYOHhHzz+m9Nya1k4bAeC5HZgwAbPdD2OIOdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l88Xhatj; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso7248295e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 06:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743081568; x=1743686368; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
        b=l88XhatjItdc1Nd11pSCbNKycW48/hq1OgaNpVcsu+ierfQHfLzwwMpS7OvEw3/qYy
         KuiuoILkZF6RP89SPgwYjD/XAiQL0KZVuQl9rLIbqiBpg5IUYrFW+ggxLyj05+aTn14I
         BpvNNmxNoxq02Uw+FcPq7yfI9FdPkE9yAI8RMr302/93m1XODBPcY8g7waCUJE4+KJV3
         u9ZI3hUvpcPnAI6TM7rIabZbnj2n6BtMFuX/x2AYJQ4h66T0XqbnkM4euB3EvI34xjvi
         GmOWYKKpm8OgkZsza27aN2KcnSOfF7xRcGP/NA7XciOTy4aNvNJQj0DMdHuavEJnHUlk
         rlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743081568; x=1743686368;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cDdIOswm/cyDdBII0iuR2QdTuXYbEwDjifjrlArm8o=;
        b=leWmYqtFOSJCtafKQ4C79GqE8f66er0kcZ4MAguzE6M4q/Pd6uRsGu71I/AUHLYlUa
         59IPEci7AUWD8QjKSvEfMlTNDY/JNL6Sq/6XQ9IvAn4Ie/yD7SdJ9mj2J2KHsXR+KXNJ
         BZPF2lGwfQKRMMdLPxI4LkcpLUZdIs5MBtAvgKQ3mESz5vYlrgbta4dgje2Re7GxDKYb
         7y+kGk3bStK1hUTfwxmpTQFGHQe4i6RjOCbruZblyTRh0rLWDRrFQaOTSTRkRXuSeYXl
         sxZVmwxyf0t8wD6uKKfmvkfesTUkm4Yl7XIrbpG9GKUXOrxirte4jyZVzvDv4jZq2QN9
         xoYQ==
X-Forwarded-Encrypted: i=1; AJvYcCU11B11B7fZ/u1h+nWhPMBrbv42njwJss2Wra9a3ZJXUVmMPoLx9RgVJTKxECTsS1bjryzFHkNOAZX8l/7Z@vger.kernel.org
X-Gm-Message-State: AOJu0YwBxoE6UTV4I4KQvtV7nipANmmGj6ytlJitlZK83yf1ND2kBrhe
	ax98mKtHpw5gqQQFZLrxSj1mN1NU+1MPUYsOknrAT9ZlA10vZFURazUftCzSpPx1NjURpzuYxxQ
	jN702PKdfndtqx5wqj7n/y+q3j4J+c/Ut8wegUw==
X-Gm-Gg: ASbGncv9enOjbyaTrirBK6dC0vM7Y0IQNxZNFYdlrL+UKcYMRmFBCLQwO3J89V7z+gL
	lLfh+JXRIJdMoCvkMdBQQSzbHvP7UCQDAzIdkI5m3JVmQ0CqmDFWE8hR7nmGQ5x0FiATKqYA9uS
	/0Y7YlDIzzp0e0UO/2dTHr3INzW+3W//WfVU0E4bys/NSY2nVcty/lx8w7pL8=
X-Google-Smtp-Source: AGHT+IHs5VZplywxnxEi47k8pf3rZnEm/7qBpY3Ioc8amqZO6vhJqMiAOdf0vB5bQQTzKsXVOl4SWXK8fz/Hde+Ezy8=
X-Received: by 2002:a5d:6487:0:b0:385:ee40:2d88 with SMTP id
 ffacd0b85a97d-39ad1740bd5mr3141625f8f.3.1743081567876; Thu, 27 Mar 2025
 06:19:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-4-e9bc7c9d30cc@linaro.org> <Z+UGqItLubQ9kwF+@linaro.org>
In-Reply-To: <Z+UGqItLubQ9kwF+@linaro.org>
From: Christopher Obbard <christopher.obbard@linaro.org>
Date: Thu, 27 Mar 2025 13:19:16 +0000
X-Gm-Features: AQ5f1JqvG9Z_EF7biygLKr6lcDhPMwDOinSPLyFBaGcwOFtc4jXqvP1t5fWsCZ0
Message-ID: <CACr-zFAVDhDvWupMMCe5ttpCU8+NSD0XK1tS=TsstM1znhDHNA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] drm/dp: fallback to maximum when PWM bit count is zero
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Right, the reason this was included in this series is because without
this patch the panel's backlight doesn't actually work. So for me it
was natural to include it. But happy to split it into its own series.

On Thu, 27 Mar 2025 at 08:05, Abel Vesa <abel.vesa@linaro.org> wrote:
>
> On 25-03-25 19:21:29, Christopher Obbard wrote:
> > Some eDP devices report DP_EDP_PWMGEN_BIT_COUNT as 0, but still provide
> > valid non-zero MIN and MAX values. This patch reworks the logic to
> > fallback to the max value in such cases, ensuring correct backlight PWM
> > configuration even when the bit count value is not explicitly set.
> >
> > This improves compatibility with eDP panels (e.g. Samsung ATNA40YK20
> > used on the Lenovo T14s Gen6 Snapdragon with OLED panel) which reports
> > DP_EDP_PWMGEN_BIT_COUNT as 0 but still provides valid non-zero MIN/MAX
> > values.
> >
>
> Nit-pick: AFAICT, there is no relationship between this patch and the
> rest. So it should've probably not be part of this patchset.

