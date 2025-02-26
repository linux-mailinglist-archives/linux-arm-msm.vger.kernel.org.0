Return-Path: <linux-arm-msm+bounces-49444-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0366A458CA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 09:49:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEFC8166DA0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 08:49:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB591E1E16;
	Wed, 26 Feb 2025 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AInarJXT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77161E1E17
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 08:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740559787; cv=none; b=odHRqZ+po0JIqe9zqJHEjqJZXxpU39g1wjkvok0IhsRIALNMInsNu7PQv3G5l6JnBF/2mjcoYF3kO6+PQRLcWsWMLJd3uto3XU55rTiBvEn2eY7on59aYJMBDZagWnBer/UG8nWvYoyBArmZS4U9o49PjR33KYrChpjNntcga1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740559787; c=relaxed/simple;
	bh=gFxUO1ZJeey5NNh3RZFFk7xhQJI5Unus4snehkjECRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gjfsUuXkacQNj10HSHILasGYl1y/Bq94EgZvrQU+RXCHPqYRdE0u4ZgHwI+cApiuz/ujije2SgmfsiO7X817b7vf+3l6F7XYvaiT/15e0I7ps1gdkdfIrDwGVrvQRaZHWn/eCN5No0gbSpIeR+7op7Ioj+JDgyaxJ0Gn0MtRrqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AInarJXT; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5484fa1401cso2282160e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 00:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740559784; x=1741164584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iBWsqS/whIX9PLa8T/uKhxlw/cCkygdxChh7NsPf6v4=;
        b=AInarJXTMZDxDBEo2U6x70mCtm7WS2qwMXaab7xlEhkpkixqPPBkLrm1yifdtnHhYr
         5QNqFigmaxtiBaJc+Ll7gKvPUlSmt5CfGCJV5B+jgbz57QH4PNguoYvNCQE3K4KaPLRY
         Yzxi/xICFTvH2zhvmU6tGHkP/5XN3VqMUBgF2gD+jEla/uqxevJC+xQpGQoiy6UH2Awo
         Vxj5Kt3GJOxscsQCvTYzXLE9xTppQ5nW9h3SHhaIEnV42wIk2i8G84p3qGWUrFSqtEHn
         QCOnbGjNKW6DWPA8bHcvrPR8ufG0fKeH1wWqxeN9/RBa1Ltrtkz5WzhBWjzE3NTavwd6
         W4/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740559784; x=1741164584;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBWsqS/whIX9PLa8T/uKhxlw/cCkygdxChh7NsPf6v4=;
        b=JrAOxn1MtijEzQ0L7RUt//7X6OZLZG8kQYc+oikUBNOvv/M4ZLslgyxHy6fcZDjgTP
         /DbQZO/Ub5euO33mem4KOyr/TpeWaVzQ/ACvnD1Whxc9SFXW1E05CtVCw8ysqQRKyuMR
         HvH8i7i8yQ+7kgKry/dVY3Coz8RakL/EKQBimPdZIb1IcyDjJ4B/w6ZRldrzSAIGf8VG
         DwcgdJzZjXTe6874uCsixiUCE4kNYVAOT0Yk2l6EpG1ZMdeOehkP8y9JmSaaNzGl4GJt
         HUom7jQ/QqO7UubOtIF00YOOmD6riIrc0+IdxuEN3sDugxXxVX3TYaB7ZfslwRv8WlVj
         M0ww==
X-Forwarded-Encrypted: i=1; AJvYcCXxSTCxdEL6XE8IO2CJ/pL2Q4mNyecJADQAKk9nNrhAszPzM3ulWpYN9A7PXSvd7Asxu8VpT2ROhzqa06tO@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRiBxg1uYhk1DxIQCugqRBMgt+fQeklWomE4EBN2EStDgT4H3
	nRkTdrNCbMIRxl6ywx6HcF5tSV9LdtLFR+0pkemwyYDcTz0XrG/KnbKuE3wNUA0=
X-Gm-Gg: ASbGncvf2TuuFLFCoAsq5WEiAsKSOQcaD5jjGQvYPj8fOFtg6781EYo5kt818n45iAx
	kD4EvYcIqa2Feo3GERAlcRklvsD37dVOck2ESrwNq2wZmlTrLpH8RACXVbqRXdiC4xlcwohR9pU
	GgVpZryfLxBcSmqxnYsyzoO41/r3pkiOkMEx20EZrAeamb7vKKUkxsGMMHzwYMPYi5efMA1inci
	Fw64yC7XWaUzs6CWAoodT31WHRn4KiANRVbVl9sF4AwiVcSqiNODwocsDzWhNc9q/Ovg1r5Xbyf
	TlfEjaJyTOO27dIeMIO1KBF5+P0s+5Gk9s+BUeUFv3CXjKRt11vomixBhoi9tBbN96huMkbJzVP
	QaFI2oA==
X-Google-Smtp-Source: AGHT+IFmNXDufx/J57BTLJkr+VSf9kHXFB6UwcnIhCd9d3vLZPOjvq5ZmG+p9/djmOEH4ULjuzqc/g==
X-Received: by 2002:a05:6512:39c9:b0:545:e2e:843a with SMTP id 2adb3069b0e04-5493c5b85e0mr2175585e87.38.1740559783671;
        Wed, 26 Feb 2025 00:49:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-548514f724csm380300e87.207.2025.02.26.00.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:49:42 -0800 (PST)
Date: Wed, 26 Feb 2025 10:49:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, wctrl <wctrl@proton.me>
Subject: Re: [PATCH v2 2/2] ARM: dts: qcom: msm8960: Add tsens
Message-ID: <yuabzxapfn3xshnzicrgndcw4xnsgofpwfhqmzurhnfzeyjjbs@4awiletaxsna>
References: <20250226-expressatt-tsens-v2-0-7a4ce3a91f27@gmail.com>
 <20250226-expressatt-tsens-v2-2-7a4ce3a91f27@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250226-expressatt-tsens-v2-2-7a4ce3a91f27@gmail.com>

On Wed, Feb 26, 2025 at 12:11:09AM -0800, Rudraksha Gupta wrote:
> Copy tsens node from ap8064 and adjust some values

Which values?

> 
> Co-developed-by: wctrl <wctrl@proton.me>
> Signed-off-by: wctrl <wctrl@proton.me>

This doesn't look like a name.

> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 59 +++++++++++++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

