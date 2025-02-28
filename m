Return-Path: <linux-arm-msm+bounces-49837-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5523A496DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 11:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D32C1881F26
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 10:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74D5255E58;
	Fri, 28 Feb 2025 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raxQR0X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB86225DAF4
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740737849; cv=none; b=kpNzEfx6j8hQ4ETbqqkQejwihzyS9yLTb70V7+ezlTmJBwLoFCon6AUyAKuCvz6FMJLdC9mNX0lPFvmnRloxFh2hPkgaFDPHpeFNbOq87z5/lgSvLyF3VFpKVRNC2pVIhVkvVAjHhG/DpKesde68Sbd5Z4qIpkKXaRQjMaARkrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740737849; c=relaxed/simple;
	bh=b9yW9aKaAj0vv2X4pBwVEAQJxZ6g3pOXCix4VsedwdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nhaz5Eb4d+pkBO/H89sE7h9u2QHOQVz8GVWA0/7LXrf3IEbj2LaMmj13sPMIXgSldxaB/g/vnzB15kTe+svJh6Ot5ZOA4H/PdEma+QZVvRBqVEZWPX+TuJFqz4hk/V0yFyBtRlUR3w1egmqybpGkh3AcPHacYt+LnwkUMe1jjqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=raxQR0X/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5494bc4d796so1027474e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 02:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740737846; x=1741342646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BtF5m7Eo7tw5lbKf+07cY2Tp/XNLgGV8I/BZlAp6LwE=;
        b=raxQR0X//11z6BewOta7agfUypiDhK4ApQngGZqwK+M/3S2fl4OV8WSIpzq8OPdwtN
         YMmQnIEa9idk8m+Lg15ITcP+7txroImhd/spu9J3hzPt3njZlZwwSTDZirviFGVvLHq4
         LgK3UXtjhnpBiFWB9hFhw+Az+OVik7TZWbmJiK2v8nLlICYhec6ODatU4mwlSTiBT7uT
         HBUPBrWymsDYnxgmvn393qOrpJmFlLV5kpTHlZDCwp84Gge5dB621/Mf77BlTB1ughfd
         TNY0ZcBQPYTPA/zp+C/AcVMGgL70cvPpL2bmzR8DQzYARGqDIbSjL75siqrpZiEfpR9L
         nbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740737846; x=1741342646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BtF5m7Eo7tw5lbKf+07cY2Tp/XNLgGV8I/BZlAp6LwE=;
        b=SYtdbuGgsvz7jq5wgZtcFZ4iZkVztm2QOPHWPrzB6uUlQ6VZP0ZU1fxW7XohvlpXG4
         gP18xz3AWQizsGLXNOp+bz6fcK/qTOinETQdkEtQvEfI3Tynb5saoUXFDFYmumtJ4cwy
         kg81YhWm4h6OSZmOW1k1JqdqPG2UtZQtwSISOFnRSUappxiGQtts9PdL36HtYTVEo2aN
         pKk4byluI4EJlf3/jN5aEDzVTKa8fFM9CcVKRYJymOKYjnpROr2sKfsSrPNppuVGcs53
         y63xqhUOamr10KKKoDJJGEqbsPvHPKYxuoGxuSqvtUV2wA4l7pKULUV9spi489bGdvgN
         05AQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVrJYA+BqTM9AMrtleQMRGBNpu75kQclwFxAq9mFYuBhjdNsxO80CIwmFIWikHDWZVJpSOdUqTxnL0Rqzq@vger.kernel.org
X-Gm-Message-State: AOJu0YzfKmgP9bH08LMXenreXK5VBd75EexWzWfZBPfm0NK8SKMX67jM
	1lA5FQkVnA2zvuBd+cnebpCroIr39thdUe00AS4XHOVPGuJhqyq7Nk7ncLNesMc=
X-Gm-Gg: ASbGncvo7cqZXrnQfHNpfTD3PFpOt/UizV2S78yfo22TXpVo+uTomNm51ibWyRiA3KE
	QxJbA4dGk0KHN8oVYXkX2rAI1mqHaWSXfBEIxm+sSmhvPGPt8VwHGWtYOArHREUxA7z2fLuElLu
	yyMhO0u3cK2c19e3MsTIs9ZAJ3HGJ6YijMrMlQxzXG1/XvzdKb2LKCQARUmgAglJGoJ7/OHzVbj
	sHyv1k/m5udE/p5RUNOoSZMUD2QrEBHtZ35pqZYeNh1MsBM7d8STyvKe6XiA87oAzyKV16ZEG7/
	8EINWCqnOQsuSB4Lr2ZMUdc2AgKBjbLYw/wsFuWAmfDo3zNwNHc6w52Zwl8/WD58MWhRL5ua4/b
	p4lGt0g==
X-Google-Smtp-Source: AGHT+IGumV9C8K5BUf/QNt3duu1Cz/DHryWxGnIRVWU5r5VemArqgE7BiCYNujMBRO+d3tj1JXx2Sg==
X-Received: by 2002:ac2:4641:0:b0:549:54f7:e54 with SMTP id 2adb3069b0e04-54954f70ecfmr305434e87.50.1740737846015;
        Fri, 28 Feb 2025 02:17:26 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549443cc9d3sm440219e87.224.2025.02.28.02.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:17:24 -0800 (PST)
Date: Fri, 28 Feb 2025 12:17:22 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J . Wysocki " <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom-spmi-temp-alarm: drop unused driver
 data
Message-ID: <u6h3ekbyhlscbf75wz5zc7pusizky4o34i5h3uluch5xi22oba@x7y4mhohlvgx>
References: <20250228082936.5694-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228082936.5694-1-johan+linaro@kernel.org>

On Fri, Feb 28, 2025 at 09:29:36AM +0100, Johan Hovold wrote:
> The platform device driver data has not been used since commit
> 7a4ca51b7040 ("thermal/drivers/qcom-spmi: Use devm_iio_channel_get") so
> drop the unnecessary assignment.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
> 
> I noticed this when doing some rework for pm8008 last year that I have
> yet to finish.
> 
> This can go in meanwhile.
> 
> Johan
> 
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

