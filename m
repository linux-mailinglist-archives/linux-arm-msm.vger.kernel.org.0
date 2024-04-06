Return-Path: <linux-arm-msm+bounces-16641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A9889ABED
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 18:08:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9B14BB218F0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 Apr 2024 16:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDE5B3BBF5;
	Sat,  6 Apr 2024 16:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVaYGjZN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E7B3FB9B
	for <linux-arm-msm@vger.kernel.org>; Sat,  6 Apr 2024 16:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712419681; cv=none; b=Z4Ok7qq4HUt2LUPGGCWEYW/zKXJHAcubz0WhqMDLEb6I2UxCUIi5aPB50chJQF/VVmhhTHNGIIC+E6ercDUn2OiKIFi1NwHZm1+Bki0WyoJg7zhHInpYBeVqOb7tCg1RJ+VIpO7FKyzm2LbuA3i7oL/cafkbznyrA+FXbG6EKRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712419681; c=relaxed/simple;
	bh=Re9aog4YI0eZKksmQyEgqtuyaTCf0OysxZQoXoVWlyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rxWTXYvBevR3D+7n2ow4MiKYaWP8ArXUwdolhCut3P/l+Q2FsfoFknzhcfudZI2sbNFqAv1LHeoILeusKxdxklJCUYIELfs7pSbCCarRq+YSb73wpLfoQbc2Rsx8eFFfwwCtNQX0WZUsTf12uX0Ga8EgkDeE88hemS5031Ngk3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVaYGjZN; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dd161eb03afso2926447276.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 Apr 2024 09:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712419678; x=1713024478; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=xxhiT4mz7EkwRe7mA3Y1GYf1RmoX1+AQ0pJ6CUbqHqM=;
        b=pVaYGjZNljmYK5haX5Hk9nYOp6BhsAH3mdQgdq+OqJyWFba0DR+R9VqzxnFXSdNclr
         d4P5/y466v75glXTyZK7fS69xlZyWkVb+Tl525LxKAJ8w7dwXijXva/CWI41ndNHwj+U
         qkj2yhQbRvZdxWFhO2Wgta9gaoWqkX31cdxhBA77XboKgU0xzLd8OqVYgTXEJN1M0Hn7
         KObLOcVso2E9XEcJUsdTazCSdr3EzTKdjWgK/D3mPuJsu8e4KMe/VemUM28yChFKQ8Hv
         5ApA/eeqDanfOr0JAroOuWl0/QxP4eCJHfdFH+ppepNL21sUscTrU9R3ZV/eomiLkuOh
         uD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712419678; x=1713024478;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxhiT4mz7EkwRe7mA3Y1GYf1RmoX1+AQ0pJ6CUbqHqM=;
        b=l0osd+vJEGq0BhWALtrXcOaldqetEgDmMLgUKCbXOe+V2lMlM3m3yAA9z/u7wdv2Pg
         xxfb05xa5tb8sSWkw7iJyfmKz5HEKu4i+YLvP0xQvGGYzbXPcYbywslxOWqXygcaRY/y
         MpjKdHdW9iQe+TM80wZ63jfHmFZuDbN5PrQnISyFUdw66Z39SL8yd4FpxB5VgHfivpes
         ty+dlTwR7IFyaXg85yM9MTjd8GymVV1me8EsfLjRFPWCmtL8MxZj6eYtXxmDnkxtGvN8
         TAbL+D1ECAHcddr1wxtd/6X7FT7Qka5h7Yx9yQCwyikawHrJn4ZX3kEj5EDI+iAoCJZR
         tqDg==
X-Forwarded-Encrypted: i=1; AJvYcCXZtjO2loWv8/jYBzBowzdlzqFgxmUX6NEvVYvWatLeOb0EgH++rKf8VeZS2hHs69wOjQjRXjtYzpqgV7dAVjjSy8Mu+8uuUz5jGfz6Hw==
X-Gm-Message-State: AOJu0YzNa/4nGG0lCNabl3rYuLxwsb3PvwlNaX7GL4N+m8lQyV5tcHTi
	jYAXSk77L3Bd4wQNlxPRpiOTMfz8shfX38vp5kYUqU2IoqpN5OZDsDoDyIEu3Q3uNAh3qqs2AbG
	7E2X0zSmxjLhg46pc2+VN+Z6z56NyhEexQN0+2g==
X-Google-Smtp-Source: AGHT+IHggO+6U20SEYFId9dF+T2+hCDTSyO2Vax1gDweglAaFNbjoPCJbiYC8M6TObeewBzJ5GyPc4eC7fPDozv2hHQ=
X-Received: by 2002:a25:6a46:0:b0:dc6:2e29:4262 with SMTP id
 f67-20020a256a46000000b00dc62e294262mr3611046ybc.58.1712419678311; Sat, 06
 Apr 2024 09:07:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240406-shinano-vib-v1-1-fdd02af39d56@z3ntu.xyz>
In-Reply-To: <20240406-shinano-vib-v1-1-fdd02af39d56@z3ntu.xyz>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 6 Apr 2024 19:07:47 +0300
Message-ID: <CAA8EJprxuhE5BNw4LMUkjF8WPi-oBzY5t6LrnN8yvjfguFPoig@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-sony-shinano: Enable vibrator
To: Luca Weiss <luca@z3ntu.xyz>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 6 Apr 2024 at 18:36, Luca Weiss <luca@z3ntu.xyz> wrote:
>
> Enable the vibrator connected to PM8941 found on the Sony shinano
> platform.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  .../arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-common.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

