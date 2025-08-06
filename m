Return-Path: <linux-arm-msm+bounces-67928-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0EDB1C8BA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 17:29:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0E98F16BAE1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 15:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C207529116E;
	Wed,  6 Aug 2025 15:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u7P08CXk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A92C290BAB
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 15:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754494139; cv=none; b=kphJPyTYPxel8mQnLbrG491v3wO+d09zYD+LNrdxgjIjO8N99Px2T0E21FB0cQ+O7SYwodT90q2TUooLZxr62V+l0OZwQfwH0t2w0fiR0F6mAObPTH+SRqH7QBhOahp165T5Eykx/FOXCe0XTwZpVflJ6QFs7egoF6PhX4bNfjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754494139; c=relaxed/simple;
	bh=njnkMeXbBDfv59fZU5JyPP1/vQsmLknJZSUpgVpQIic=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=bSS3uu/elkvUFT9h6M/WAIe1hkn9JzB+2QmE9e9OM5hu6yTzoC8VAleQpAOGDOcdr1wonSnZIhrDuU9aiUZLiOBqjaPLBfJ5YaOk2RtHyeAOu9YdVFYrb3FZ3ASRK76SsppCp9swEQbsVt10mSNlMy/BXp8d9IGXRWlCzywvIT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u7P08CXk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b782cca9a0so4082950f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 08:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754494136; x=1755098936; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ASSxJEQXfE633CevXWqyyh5f9WPRpCDbV8wTQIWfMY=;
        b=u7P08CXklqtrakIE7WQtSZt9fTEh9XfBYF0vu9B6liWJjyNQ5Wef+qDfYQQUnHl7E3
         qrdIp7Uo9nBrQ9VP2ldUknh2jA88XN/TPUqu0sfePGGNMQDAhGrVaMLEZaCF9yK7KL+F
         Fb2f2GxF/eTd3d00nk9Ryji0lqW4vFhO/bT3Rd0Bxs8/jwXj5j+TUvcxTEVWta+pp1qX
         IgTU68NoEA7ABggj0D25BhvBfjhO/8u4j5Tmy7Qpsa21hDrDwZt6BgMJbIFpbms9GPj6
         8667NnK52xUICloHNOtOSOrRRpvBQbt3gwFR/XKuRkqdSpiqEcO+e1zJblVfNZ+z4J5t
         aBfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754494136; x=1755098936;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ASSxJEQXfE633CevXWqyyh5f9WPRpCDbV8wTQIWfMY=;
        b=hxxMPtZif+tavX3FZlTWc50Imo7jVns39DajDHnjyAgfWH/E4urwkENAa7aDUPXlmv
         jiEwOMYpUwY7iTpE25AjUe2kAqVELyIrEt8d3LsHTrLjnshYjthNt96RV/gWQhKXkrK1
         rMgVL/LbG7DgPJuFbKH2T/7k4luI70geR4lTIGEkzVHvKnerERrkng4a/fil32eXdz1r
         E4b+HwMDCFWr+6lHSawsOeoiez251LhHQqtt1PR6/LQ2aPhya/aNDQcWdRKg4D2G8vo9
         1ohSjQo/tE+cN5SP/uaSwUKyj2W4ZhFC7hBRW/FDkvsTXuvCmD7skPiUOE1Mr370rwZq
         4VkA==
X-Forwarded-Encrypted: i=1; AJvYcCXYuIvbDzt+5+rF5F/PWw2mVuhOXdeOVptznlyKhwK3Gt3oHsLFsZG96byst9xSjwe9J0k1fUZFW79WEYtr@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZ72f3xzgC1nRKe/lZS3nyvCqghjnhuV+5pYEt1kUKt8dhslW
	/iX1o6wFMwqze34xrCNkjLf91vMljvUg50qaOu8xLC5kMaR2nRYTGGNUJTzJpxMWxo0=
X-Gm-Gg: ASbGncsxY6Am3hxikNBJuXjCjrAGIXa2EmyL/8U44uqELqfsVRlmDXcdsg0tgw4WIrR
	gSaqs7H8J2IjBy9p5Zr6cqlM+1k5tGjNhIBLc8oVdX+oSN1NdlHjp3GhyLAC8MrUlP0nWSiMWWm
	psVCeFIrrBr9pFVQ40bF/r1YaGXKI7S78vWB6GtLXw841SskeYXvWzUcEiyGJJCNRrPzX0UjAQJ
	T/UGfic+v2MlMQUG2r1hzEU6urvNgB98ZG12C3nSbXjmel17QzXTWkRMShpGTGm8k52sqR8na6Y
	TMZftN+ntPK28R3nKZnefIE6S0T39M/mpv0C+yWJMo7uLnIxtP2ZUt/z8aSNlOHCRfCT3gxjjCj
	aMJNEWWdOtFkozaWmZkfCHpF3FuI=
X-Google-Smtp-Source: AGHT+IGms6BpP/B6mpjSuEArIcBP3P6tAGM77/jKb6ok4h3wKMwoMthR/0suEVsblhKxO8hTtm5llg==
X-Received: by 2002:a5d:64e8:0:b0:3b8:d3cc:8dc with SMTP id ffacd0b85a97d-3b8f491cc2emr2641189f8f.28.1754494135791;
        Wed, 06 Aug 2025 08:28:55 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:6c39:59e6:b76d:825])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm23490188f8f.67.2025.08.06.08.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Aug 2025 08:28:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 Aug 2025 16:28:54 +0100
Message-Id: <DBVG9ID1KS59.27QTXCZOWJVNM@linaro.org>
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Griffin Kroah-Hartman" <griffin.kroah@fairphone.com>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Luca Weiss" <luca.weiss@fairphone.com>
Cc: <linux-input@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH 2/3] Input: aw86927 - add driver for Awinic AW86927
X-Mailer: aerc 0.20.0
References: <20250806-aw86927-v1-0-23d8a6d0f2b2@fairphone.com>
 <20250806-aw86927-v1-2-23d8a6d0f2b2@fairphone.com>
In-Reply-To: <20250806-aw86927-v1-2-23d8a6d0f2b2@fairphone.com>

Hi Griffin,

On Wed Aug 6, 2025 at 4:10 PM BST, Griffin Kroah-Hartman wrote:
> Add support for the I2C-connected Awinic AW86927 LRA haptic driver.
>
> This driver includes a hardcoded sine waveform to be uploaded to the
> AW86927's SRAM for haptic playback.
> This driver does not currently support all the capabilities of the
> AW86927, such as F0 calibration, RTP mode, and CONT mode.
>
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  drivers/input/misc/Kconfig   |  11 +
>  drivers/input/misc/Makefile  |   1 +
>  drivers/input/misc/aw86927.c | 841 +++++++++++++++++++++++++++++++++++++=
++++++

[...]

> +static int aw86927_probe(struct i2c_client *client)
> +{
> +	struct aw86927_data *haptics;
> +	unsigned int read_buf;
> +	int err;
> +
> +	haptics =3D devm_kzalloc(&client->dev, sizeof(struct aw86927_data), GFP=
_KERNEL);
> +	if (!haptics)
> +		return -ENOMEM;
> +
> +	haptics->dev =3D &client->dev;
> +	haptics->client =3D client;
> +
> +	i2c_set_clientdata(client, haptics);
> +	dev_set_drvdata(&client->dev, haptics);
> +
> +	haptics->regmap =3D devm_regmap_init_i2c(client, &aw86927_regmap_config=
);
> +	if (IS_ERR(haptics->regmap))
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
> +					"Failed to allocate register map\n");
> +
> +	haptics->input_dev =3D devm_input_allocate_device(haptics->dev);
> +	if (!haptics->input_dev)
> +		return -ENOMEM;
> +
> +	haptics->reset_gpio =3D devm_gpiod_get(haptics->dev, "reset", GPIOD_OUT=
_HIGH);
> +	if (IS_ERR(haptics->reset_gpio))
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->reset_gpio),
> +				     "Failed to get reset gpio\n");
> +
> +	/* Hardware reset */
> +	aw86927_hw_reset(haptics);
> +
> +	/* Software reset */
> +	err =3D regmap_write(haptics->regmap, AW86927_RSTCFG, AW86927_RSTCFG_SO=
FTRST);
> +	if (err)
> +		return dev_err_probe(haptics->dev, PTR_ERR(haptics->regmap),
> +					"Failed Software reset\n");
> +
> +	/* Wait ~3s until I2C is accessible */
> +	usleep_range(3000, 3500);

3 ms or 3 seconds?

[..]

Best regards,
Alexey

