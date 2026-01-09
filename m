Return-Path: <linux-arm-msm+bounces-88151-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A0ED0697B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 01:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DEBE83004BBF
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 00:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9297E2745E;
	Fri,  9 Jan 2026 00:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jCPxMkmb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D7811F95C
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 00:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767917379; cv=none; b=t4Hb1RrvucrViwjVA2iTpnf0Dw20ZeBvEaLgiviYhd8dxQRlw6mAch9be/Eg/2ySBjA/5HrvSH8op4O+shOtRf/V3kXm5mQNPt+Cjj6xuOOWxl5YzZjSPsH4Kqa6VI/T2asPXc5GNxprrLehpybK3UXnhWLV/zMl6KTe/LSuAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767917379; c=relaxed/simple;
	bh=tfrXfpFvES9XZjLIOw7ts89hAIvMyB8rFddr9wCACfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ApQ/XYJ0EG3JzC3AksIpWqOLd1NgQ7IJnU0SQ/OjbqCPj0pukZbFYXuJENlJmRB1s0843C+l/xY3zdKdL6kTjhKtY5gIBh5JIzUakFPS4adc6hXFZrOmQncgDJ3WR70Fi/By23ZqoK1bigl7QbkiNTXXBOgMDZLRqA4FW5DR/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jCPxMkmb; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-88fcc71dbf4so24085576d6.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Jan 2026 16:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767917377; x=1768522177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=jCPxMkmbtsYaq/v8UQrFl4h3XYCyVJlkKLXAgZpnkN8wPBfSykXRmK+sGraT+Y1tTX
         Pwvc41aLcS955ahmtIDo+gi2R3/t6a3BzjtoM8E0m+HnJZIM93/Ckt39adU7x0THTPMS
         DfB7Kt+J1twta+1DdlUGtJW1W/mlXKi0jDKmOeZum17/lCXZFOEUxnyhOEk9LssYqB+V
         Tlt5UD/PPCWVvPZ9upgv/gDUOoCLpaEGLLsmycXlimazalx55HIRr+IeDOT2gQLEfD7X
         erQGW9wyt12Vsl8+woXlrcOHmQOr8cCY+g5ITYLWMFLzFZcedb7EwKpVoi4SV2trwgbs
         vixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767917377; x=1768522177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0X9PQa7fUGrEbdnnXe+R6baEV2kodyl2SCibPqNBU0=;
        b=f9wFsuYXMgLm0CKpa0atJpVjg0VyLukniGkQSRl6bAZ9bwlHZLWslMJSE5GWOl7Gm8
         zMKHtbV/v+MaCIpaj3qMr7lsibyUOuoPU578uVJ9y/aUpBTJjB9YhymucHu3xLglqerH
         72gDL64uL/2o8QepTQh476mt83vtFO9MiqYpXQ3fdYTtc8BdWbmFcAdkt6W5S5z3UFqs
         EHyxhTqz6bVSGsc6tHvriBBLvRqWqooou9klJN12YfC2TUyTTCneIyiTcac8FDGq/Rbb
         qbg9kcNIRITv89nRnLVQLTO4BjtowH44fayMzZkYNrft+3ILEsdRbPTewZVIIRT7GW7c
         q59Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/DF1u4Xn8Kvxd+Lz8gxnZQMKuA2+YqzGsCbgDoaqiV6xeF9Hr7Xi79KHxXXeHMe+9nQ0pGGY6M53Ygy6X@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3aJ9cOZNx7ehjJlBljsatnzw320l1Y18zg/VWnu4KfUi/XXq
	ynxJxpDpoAVvstKktuLnUyHkbOh1uj0ajAAiuEtsqfgYygP1uvoRNAf+
X-Gm-Gg: AY/fxX55Xo9jgSzlPdq2BZf/QP1f2oLmd37APeykjUOKEfHYcgW6ZmTCjB+UeXbk46U
	j5pvKYRHzZ2WpUoiF1DXPwDxQwSio87y12qup6WxWJL3wN83NRvGsn4bwzMr8D+W7tREd5+iiDA
	GchpasL1Yp16lZ3Z5xPUFYPxU1xJgMDwX6HJdBJJv9yuxSopq9PvRP3O4tEGz57Zq59u6rUv7yB
	1DSi/2uHp+0fI7hR42c3yyl8eJjF7CZVz+5M6xITOagbKhEsNNlCd7c11RYzhxfqC04ANmzQqJW
	wIJgGzH/GHQz+n4FjvpX2JePsvEDc+81jl/fufhdXL4EqzKkWOKDfi1w1gi+X4pXPmYGc4/DqJf
	EOvq0YxdJjFjgi6pPm1eyjkXToiT5dU5CQWKTC1BoYCZrNeNAj6UMrqeKd6jK0EqZ2pNLWMsPzd
	3aZDOwYpF6bsidkshzrdPZrDrL
X-Google-Smtp-Source: AGHT+IE53QNgO8H5ekocStQPoh1dkomyApC3B9GarKSN3SFKH4LWIoibjHSscmdkAjc4QCj5ErkGzw==
X-Received: by 2002:a05:6214:2347:b0:7f5:eda2:a54b with SMTP id 6a1803df08f44-890842e1b55mr117237186d6.62.1767917376936;
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077234ca1sm62882266d6.36.2026.01.08.16.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 16:09:36 -0800 (PST)
Date: Thu, 8 Jan 2026 19:09:57 -0500
From: Richard Acayan <mailingradian@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] dt-bindings: media: i2c: Add Sony IMX355
Message-ID: <aWBHVUBhPa6iZ0ib@rdacayan>
References: <20260107043044.92485-1-mailingradian@gmail.com>
 <20260107043044.92485-2-mailingradian@gmail.com>
 <20260107-aspiring-unselfish-dogfish-963c1e@quoll>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107-aspiring-unselfish-dogfish-963c1e@quoll>

On Wed, Jan 07, 2026 at 08:35:25AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Jan 06, 2026 at 11:30:40PM -0500, Richard Acayan wrote:
> > The IMX355 camera sensor is a camera sensor that can be found as the
> > front camera in some smartphones, such as the Pixel 3, Pixel 3 XL, Pixel
> > 3a, and Pixel 3a XL. It already has a driver, but needs support for
> > device tree. Document the IMX355 to support defining it in device tree.
> > 
> > Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> > ---
(snip)
> <form letter>
> This is a friendly reminder during the review process.
> 
> It looks like you received a tag and forgot to add it.
> 
> If you do not know the process, here is a short explanation:
> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
> versions of patchset, under or above your Signed-off-by tag, unless
> patch changed significantly (e.g. new properties added to the DT
> bindings). Tag is "received", when provided in a message replied to you
> on the mailing list. Tools like b4 can help here. However, there's no
> need to repost patches *only* to add the tags. The upstream maintainer
> will do that for tags received on the version they apply.
> 
> Please read:
> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577
> 
> If a tag was not added on purpose, please state why and what changed.
> </form letter>
> 
> Read carefully last sentence above.

You left some comments after tagging your Reviewed-by, so I was unsure
if this changed the tag:

- https://lore.kernel.org/r/bc831622-8cbb-4bc6-b96c-9b87fb414725@kernel.org/
  "Ah, here, this obviously was not ever [compile] tested."
- https://lore.kernel.org/r/fedeaca3-5549-4d57-8f13-f0ac58d1e4d0@kernel.org/
  "why do you need data-lanes if they are fixed?"

About the data-lanes, they are unused by the driver and can be dropped
next revision.

