Return-Path: <linux-arm-msm+bounces-50323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C11AA4F929
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 09:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A73F18928B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Mar 2025 08:52:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70B81FDA79;
	Wed,  5 Mar 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fJz61KAk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1951FDA66
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Mar 2025 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741164726; cv=none; b=gznARL4MoJ8JZc/y6TLgntYqisdJ60Q1sozHtBmf/mkFEXEFsY0SHBcQGZfcUEljlUzTY1pd0QmUsBPVNrJaYheUHbfSfhEZ+e73tfpTdsO2RlxVowFA4/4r04d0FYyp7Ga/hjl2duBeTBVSg3si4OeQUs9YvO31giG6e0TXk0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741164726; c=relaxed/simple;
	bh=O0QRoKZcDQVvvwhI9GzXiPZKl6x9HLIATyWqGNzkV8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XV+qL3BIw3YJ42S8UTZYrgsTYA+uyrZEACQGE/QwNRUkDwgUqOh/VvuAXy99h/TmVFrBAdJIdusI9II8tgT/dh9nSxmk6SmG+g9lvLJ2nMd9vqAUD9r8YDxRcZ38m6yBQwe8Tt5j3FKR6v/JWSWJ4VKFDuZ8FxaQvJdXrdmXrWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fJz61KAk; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4394a823036so60156455e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Mar 2025 00:52:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741164723; x=1741769523; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
        b=fJz61KAk5QIfT3g1TNA8cOON4DTmwuPinelHzOFbOxLyLgYwZpce6FgeFI0kPu96pM
         Tr1Bp6PAbemGQwbsuuNnwZCFVOgC9jt7r5/8+0C4UaeMiC8ggcZa0rBiIlgNSLWmenPt
         SxPTIaR0BapUUEPHUawxQ8ilxodTcHYXMdYTcu5dHMt7nXXvCsq2zh16CGk461XFo93E
         S9cuVAgCRs9I00uN6pOcMeSN4SW6OjC10c9aHLEIgiVFjX0SHcRqK13Dgvhuu86MQSeu
         vhLZwjtyx0glU7AL13xGJe3C6v1/gFz4Zi8MwK4gKMCOloI34AO9jv7wg4UtnAzQYsSd
         Vgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741164723; x=1741769523;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC/qen37fd4vBSgLI91hwOumJ/Sl+TjsYB6y5Vr5M7A=;
        b=kpPfn8UlrnS2y7ooMv5NK5+41omPluqkpotaLZPRfxHSDojJI8cYtR7OSQeQ3EsBev
         mGp3nBcukkcb3NlCRkdmmw0Sx7ZKA9eYOwQpc8YYZYMQY0OLSLncuSyZx2KHmjhWAE+R
         TaS6EVYjXYFTkNntkMFlmLgQW7dkR0TGrutZxDaEPP7VoZUL60i86NRsnO51zDkl8SUG
         bMFtJSil4ebGZ+7o5JmB0eEDNOn20FUxMSQKrHWnbrH1ka7dQd4je9G/79Olswdxuy/G
         Mcf1giygP7g/c63/4ICHf8SqERvUID4XbDDdEEyjw0KlgMXnwndwz024cVUhqO/HtkmU
         tu2w==
X-Forwarded-Encrypted: i=1; AJvYcCUgLskpQxIZtwogt5j4OFHbyVBOwKQY20UengBsbEU0Yh2O9FSuLgaBei6cNnSH/gkmwU9FXsgQ1ErxQ/y5@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu3ImoPSrY3CVonJWEvI+U9teczltYSsnmgoNw0SggmAAC23YQ
	QcWIqeVVEK0jaDop2CqgSfACKJEdsDHK9s7nyBrHy/GjEQLc32wzH3D98SL0Sw4=
X-Gm-Gg: ASbGnctXY/i98jnI6wtiQGmlghOsFWx0tSDRL/E4h0UOb0S2QVcx2mWbu9Uclia1Rjk
	KnomZUZln2YxHOvxVxup45VwR2DbzKwtxKgUTQUK6icr32GtTAVBbW/xNCKwvFtt+Zslxfyv4/y
	S2aoYYQTubdnkqceCBAmw5JqHKwiH96RGsV1FW6hhVKvdtsWXzGF1lv8YWAlrR0HL0x9bhHDK/E
	t7g9mJXJEKVTzr78BnVXKE144F7YukdRX/P9Jxzw/Us2zxC+mbL58uearDcFWrlZrCKCxFBIlxg
	z73KWHwpvP6mVuMv6uCBVq7hG+YH+o7Mi81EZr+hKe1OEt7IZA==
X-Google-Smtp-Source: AGHT+IEnll5wrK+ucj99FN5wPB9IJR42RFtfAed9YIQq8iwKwZ5zCrl027CguxNQpWhglI/cbwh/2Q==
X-Received: by 2002:a05:600c:548c:b0:43b:c284:5bc2 with SMTP id 5b1f17b1804b1-43bd28a3847mr16238155e9.0.1741164722999;
        Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485d8e4sm19946896f8f.85.2025.03.05.00.52.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 00:52:02 -0800 (PST)
Date: Wed, 5 Mar 2025 11:51:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	kernel-janitors@vger.kernel.org, freedreno@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Archit Taneja <architt@codeaurora.org>,
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
	Jeykumar Sankaran <jsanka@codeaurora.org>,
	Jordan Crouse <jordan@cosmicpenguin.net>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
	cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Clarification for =?utf-8?B?4oCc?=
 =?utf-8?Q?undefined_behaviour=E2=80=9D=3F?=
Message-ID: <4c489b64-4c25-43e3-90d3-37f2f335d665@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <e665514b-5a62-4afb-b267-7c320e4872af@web.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e665514b-5a62-4afb-b267-7c320e4872af@web.de>

On Wed, Mar 05, 2025 at 09:40:43AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> > There is no undefined behavior here.
> 
> Is there a need to improve the wording precision?
> 
> There are words which denote a special meaning according to aspects of
> the programming language “C”.
> https://en.cppreference.com/w/c/language/behavior
> 
> Dereferences of null pointers are treated in special ways.

This not a dereference.  It's just pointer math.

regards,
dan carpenter


