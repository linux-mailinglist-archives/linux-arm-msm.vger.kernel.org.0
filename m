Return-Path: <linux-arm-msm+bounces-52666-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A116A7361F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 16:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB36E3BDFAE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Mar 2025 15:54:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670791A5B98;
	Thu, 27 Mar 2025 15:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SPw0/0q7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8862F19CC11
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 15:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743090864; cv=none; b=bSBAcQpZw+w22h/wDNdHnL/h+L7n0qkjqxwqNfjNRwzHeygsiJiYwaAsqrbF/yzJ+VOFqXHD8qbrwGait00K4ymOsISmGLu9b9tiIajd4J+ZnylFX6cQAN9Xj2pms5IP+Jn6BOmRXnfmXHn6NbhGwPXkw2i0RPNlB9TAXbmhOxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743090864; c=relaxed/simple;
	bh=Xn+hqAJcwF4LrOcw3aw2H3+w6fmBJDHufrOGSfYCVhY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RR4aSkAHAN+9EaQqKVc+WmjzdMJJPg0tMsotvG7Nebfwe0TRcYoDrwN1UbvP/FiO8wOVXrOYHdDNcFoy5vb5fWlAmMJAqgDLOCV0hsHGIX60rwMSdd+mgDMsGhMWfshHTamJlZtny6kfCYkrzfig8CQOlu2/psqyhEgWnihLCrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SPw0/0q7; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-307bc125e2eso11088021fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743090858; x=1743695658; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
        b=SPw0/0q7EZ69fGBoGxpE8lzfVCkaePV1/wnhmNA4XMTr4GumSPL9oJGIgUtvh4Pkhn
         KumNI8+I2ziu9ioj9bVHZwCnYxXfD7RhEywfsxIXToJWIAzKBNlGamgUWMOXKkS82Ptf
         TYGTUIgv/mdGDh3oDv1QVzJ+9WCVoIUc0Ra8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743090858; x=1743695658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CZv00/ePRkrRXDyY8uRk/fzDNtpq9RLmjZL7rRlPdfo=;
        b=kyj1hhp8Y06lVUh9T0ZaEo2Vk8m2F9Hmq/aEQDAoZ9aL6IwR+DdCLVjkud9XOxWE3h
         8vLd0E4L0Umy3oJ0puACstDTXAm5AnnD6dzeKgDasLJuuq7mGpAhfTu3JIHNSX5PYFex
         irxiNCtUzN6R4YkJgJhU0YphwFEZa7sP1/yRY31XojffqREhfgwQpBu5J2dqPepLN1P/
         XMyeNw2KJykD/KmmAZHL1l3+Y+S1CrobQlRbdJ5t4u9yVqIzxJ/fK7Rec9xApimri0lo
         q5qmzRkxAOYAwSi/gi2dsiGBCEbAPMZTBoHykD0rP+4ygnN23+EOEOU0LIGm/u963HeS
         gA0g==
X-Forwarded-Encrypted: i=1; AJvYcCXqWsMk830wGsEHwB6dcvFn3qiVi6wMInUfaUJRINQWBGmwz8ISNokX+8tWlac2EIQ3aT8/AFTIr3HpjrHN@vger.kernel.org
X-Gm-Message-State: AOJu0YyuMnXWgGRVUcj2WNFsUzdndwfBzOOIOQzBw5vBhXiCo1OAkFNL
	pW5RRj/wRXOctbmArhT9kzI37H5uOSJMyNb/WcD3BeHy6MjTlHL6qNIUwN0LOPHcgg2UY2sK1IQ
	Hxw==
X-Gm-Gg: ASbGncuVitEyQlitBCPWhsD8918BDs0D3V5v92UrICepK+M4fieeVtCQnqWDxp3HKi3
	gcPLlRltimUUYOtAoqQix+PiPaNtZ/fROz2Dq80fX1MRkLS1P33lj+N6jgJc9s1ui53pFF16dNh
	0RJHD4PFl4M/6CV4F+oSdGeNVBp+qXTJDfo+4RfLIuqofc1gAG2dYGZ7wrJYD1OuW9dvfoQGOqN
	OwVIorfywRSz60ZM7jjS2Q07fq+hdxtv5h4MH47PdUXCcz5H2EkFR9MmXCHxhsub9QdqpX7Jow4
	YC5lsd7BmkO72AAOf+MIRJV7hD3MRhhLBO7MvlzX6hUEKpFDhiNtMSmAI1pKNgZFHWCtWwQGcJX
	lbo5GiB732AxH
X-Google-Smtp-Source: AGHT+IEdPhicm7PTQ1hd0Xk3NF0j7ViyJPLV75IqqF2FSu9pFyuNqrCtkXpIJvfo21IBOouiGCgrbQ==
X-Received: by 2002:a05:6512:3086:b0:549:91c6:96a8 with SMTP id 2adb3069b0e04-54b011ce297mr1681096e87.7.1743090858093;
        Thu, 27 Mar 2025 08:54:18 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30d7d910dbbsm25349361fa.95.2025.03.27.08.54.15
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 08:54:17 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-30db3f3c907so12181911fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Mar 2025 08:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVzqnQfERHaJ8gUSqUBna5gJ9ze8eoPD6jF94YOUsD/U7qBhHXSmRTRaL6+qgMSO2SHpMICgdrmDR/cHsJK@vger.kernel.org
X-Received: by 2002:a05:6512:23a9:b0:549:8f21:bc0e with SMTP id
 2adb3069b0e04-54b012201cemr1799007e87.32.1743090855396; Thu, 27 Mar 2025
 08:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-0-e9bc7c9d30cc@linaro.org>
 <20250325-wip-obbardc-qcom-t14s-oled-panel-v2-1-e9bc7c9d30cc@linaro.org> <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
In-Reply-To: <20250326-foxhound-of-nonstop-temperance-6f5a67@krzk-bin>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 27 Mar 2025 08:54:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jr0GBzGsFAxBQlSMWFiKpwbfZWxF1im_nyKl3vKfJiviUfLFt-4zl7_mZE
Message-ID: <CAD=FV=V4bA-kGs+qBfTJ2+zayGr1ndDMiT6Gc0d8ZCxxYLCZVQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: display: panel: samsung,atna40yk20:
 document ATNA40YK20
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Christopher Obbard <christopher.obbard@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Johan Hovold <johan@kernel.org>, Rui Miguel Silva <rui.silva@linaro.org>, 
	Abel Vesa <abel.vesa@linaro.org>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 26, 2025 at 1:08=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Tue, Mar 25, 2025 at 07:21:26PM +0000, Christopher Obbard wrote:
> > The Samsung ATNA40YK20 panel is a 14" AMOLED eDP panel. It is
> > similar to the ATNA33XC20 except that it is larger and has a
> > different resolution.
> >
> > Signed-off-by: Christopher Obbard <christopher.obbard@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/panel/samsung,atna33xc20.yam=
l | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Pushed this patch to drm-misc-next:

[1/4] dt-bindings: display: panel: samsung,atna40yk20: document ATNA40YK20
      commit: 1822532477cb5f007313de4c70079c09aaa270d5

