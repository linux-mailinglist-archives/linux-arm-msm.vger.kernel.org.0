Return-Path: <linux-arm-msm+bounces-42529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E44809F4AA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 13:09:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 36A4D16549C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 12:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C23E81F12E4;
	Tue, 17 Dec 2024 12:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AZ/ACVu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E73FF1D47A2
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 12:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734437369; cv=none; b=K7ByWtrG8qvxI1ILPad1z1FOUa3n8O+s1/yktyNM/rrbOP+owymH7LyxfAILYepqK1qNXkNZHaJjN8ze6CY0yJwgTIaViQov+pFjDtbsQn+BmGe/B8ccUhi84oVARMhlSEuywobIphwf82bTLkSnb6IyXF2v/Thqtmv7Ac9wBEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734437369; c=relaxed/simple;
	bh=16XPmy2jH/zD27A72OtSAQ/rMDX0OJmNbRLWaTM298k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKLioWhzIMfAEHplYg89JxuqPQNX9qWL8giwn3UB33DkwHvd7+IXPEru+01wPZwyZYlU2dNV2CRoqmbed2dw+5K1IXBP4+u7jreC4cJtRkxw6vHUOLcxHgW0XKG3saDIDjnuKeAJITH9QS5N9TTHtsW0Gh7WYISNDu37aGNQS7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AZ/ACVu5; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3043e84c687so13216891fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2024 04:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734437364; x=1735042164; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2zlUatx24q8uGjuBR7tMIQ8jxT+mtpak1Ok6qCQguw=;
        b=AZ/ACVu5PIcKCEJuyLrxVKh99Uzm4W0y/ASGt7tFbau/Ph2Bhdd4Ric3mCzeviMIrD
         SGailBdErUEih2AuvFQgjAdlu/TB3yWnrtFH0e9y+sg2EJhCJ1a9XXZ4aWYxUYCBoQ9J
         yn+u6soIQ5MLvQHZkPYmRCEH92kQpzEpVJ2PSqj+r1vLUy+LktqEgvgQ4oj+CuIMeQSd
         HZxVg1EC2tDdERs9FMq1+qOCyR16gL+GRYsh6L2nFVomXL5DbtUqXaQiZcPWhhrPF5FX
         evzkNV/WL3E0VZi0yaGsva1sD7V8y4RNnSrWG3FueKCjwTlbrxzBeztRx84QWStI6GIQ
         bfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734437364; x=1735042164;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2zlUatx24q8uGjuBR7tMIQ8jxT+mtpak1Ok6qCQguw=;
        b=IU3IvXk2ulSZDp9GpztVehnc8rLcC29WuXc91H/d0PuW1L75er3y00Kh8u4q9VVsKD
         m9wDWFYVs4nWm65aSNI8pmrmbuJtARtoi92sDZsdo3r9fXUKZhYLNb5kMbrcVhf4Oz0v
         iUnguxsd1HaHuvRlJ5fmwxDpxKp3kV8fLKpb8ISbCk1tJlIdbB9WDMb5NDfMIZDAeX3n
         EH2Eivr190SudjQNnexKnTl5jWkCtnHhrrzmj6uWME4JD0EOgN1ejO6qnbqxPjvn/OX6
         RBHZmAAMkFFiqbMGxFasZPhQ+iKPXRKPFVc876UN79+PvUVir0kDn7SlulvLKTlv3Nmf
         1OlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFON2UnR36y+bPKtGIsAKBVYuPvmz8ddX6hX2yZ9KURUik41qZ/VJ0WYa+kWKG8Kzgay21jkmKV9iuTY49@vger.kernel.org
X-Gm-Message-State: AOJu0YxqABcPoOM2yteA+eAMF/B8gT3UTHJIXlQUXzgetkf60TP0mz6o
	1JNsEdx5bBv9CZ+/UGWcRth7yk8c+xFfMBs6d2LKfTppAV2X7gH6K3Edpf/l7z0=
X-Gm-Gg: ASbGnctWlbSy+ejzY1PrJmNQWMBAe9ChoTXKm+JN8fBCAg02/2ZBIZOB4uKhGlrDUE/
	32KkdOhTgxzYIVQVr5Z0u7znFWQvQsHwYjmUYLogFrmmPjWcSfpgerPayZCM3lR+c+3M0fYw50W
	WCZ67jseTVPTk7idVxHA8MfxaEYl18y2b2rwpA0TbQHZrvDlYUYGzGUYE748FVCCLx6AIsmJRzT
	W7LYMcXFVGnjDc9Hi0lPDnKkybS2FbJn/arW44lt2UjDEjm0iZ7UDygvMgx0c1t18251VivvO7x
	RgCCwNUehFh7+9F19YCB7cHKB7rUivdH2dRW
X-Google-Smtp-Source: AGHT+IH3yIaXKqPUlVfDov4PSCpBT+vDZFRyKj3waNb6em6MSG5hbhb05XacOHw8jeYisHOZJ9kJTg==
X-Received: by 2002:a05:6512:6cf:b0:540:1f67:689f with SMTP id 2adb3069b0e04-54099b72cb6mr5558607e87.56.1734437363989;
        Tue, 17 Dec 2024 04:09:23 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344045d28sm12351511fa.49.2024.12.17.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 04:09:23 -0800 (PST)
Date: Tue, 17 Dec 2024 14:09:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH v5 3/4] arm64: dts: qcom: qcs615: add venus node
Message-ID: <hu5nkn34gkx5x4wdtpvstf5atrgl533vynlgvjec4z3jdo4rac@yt6t5mmfcwtm>
References: <20241217-add-venus-for-qcs615-v5-0-747395d9e630@quicinc.com>
 <20241217-add-venus-for-qcs615-v5-3-747395d9e630@quicinc.com>
 <83fcb683-d610-4e47-bcce-128453a0afef@linaro.org>
 <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3cb0d715-3756-4cef-bcc0-3bb550811c73@quicinc.com>

On Tue, Dec 17, 2024 at 05:54:57PM +0800, Renjiang Han wrote:
> 
> On 12/17/2024 5:38 PM, Bryan O'Donoghue wrote:
> > On 17/12/2024 09:17, Renjiang Han wrote:
> > > +
> > > +            video-decoder {
> > > +                compatible = "venus-decoder";
> > > +            };
> > > +
> > > +            video-encoder {
> > > +                compatible = "venus-encoder";
> > > +            };
> > 
> > I gave you feedback on this in v4.
> > 
> > Could you please provide some commentary on why you're persisting with
> > this ?
> > 
> > - Driver configuration should not live in dts
> > - A patchset exists to mitigate this
> > - If you don't want to use that series, what do you propose
> >   to resolve this ?
> > 
> > Please don't just ignore feedback, either act on it or add to your
> > commit log _why_ you didn't act on it.
> > 
> > ---
> > bod
> 
>  Thanks for your review. You pointed it out correctly. As replied in v4,
> 
>  I also think your change is a good change, but your change involves many
> 
>  platforms.

You can help it by reviewing it and then providing a Tested-by tag for
it.

P.S. Something is wrong with your emails, I see a lot of lines separated
by empty lines. It makes it harder to read.


-- 
With best wishes
Dmitry

