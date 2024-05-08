Return-Path: <linux-arm-msm+bounces-19523-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC2ED8C03C9
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 19:53:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A73F1F216D2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 17:53:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5369912B153;
	Wed,  8 May 2024 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z3I5vugc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8A512A142
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 May 2024 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715190816; cv=none; b=mtb2y5ZuGL7swyqrAWhYecyMTIHxZUD3WmNNw0BFZen8L0DQj0E/G8Hw56k7vxYv9Gm9z8yUA3NBMcm44RV4IAuQyNw2WOs6uE0NkXXosDBgiUQpr2GFxtuKctOFVCOY0m7NwgDwYJ4f8MHYhDxf+0H1w274O+BR9SeF7I/lqHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715190816; c=relaxed/simple;
	bh=HXVW8h5p3JlTih8gUxuhHHUusD8gorkN4xSmGzUCymw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Juk+bTw9M1XD5TvcgDJeTYWMWfcIwVqup0rI5bV8m5skGdLeVu5RwHLQZKLY3kqyi0TGu1piz9h9PaKPIOI06ssOn6KPaKffqrCQ6bVfMSMygoeVvNVj3RJ+SIbDjMjY8k3D1SBWmAor6by+Dj3fCeLWOCfsnoNBDNT07Py6MGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z3I5vugc; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2e242b1dfd6so632521fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 May 2024 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715190813; x=1715795613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2vH4bNd6Ss0R422TZj0wAc00Y2LU/Z/9oAmYOP5+g0=;
        b=z3I5vugcrxwKKVNljde2uGKdCz5e1lece186rznyzUoAWTjcFspW73CSjOCEB0V79i
         1c8VxYIz9ism7HR+lQwDchbjnCs9rs47QX0BaHOWlEyRowLFYU4M1usjK0yt8NtIVL7C
         Q/O11nRqCzyh+fPfp6D6mrTy1MHEjZLlTYIbfGT6eZxVXWx1+ucgkTImwRXzC7ToKOaP
         YdwJzKA9QsuxnsfO+WbBFJfmmkjNSTVjdYOdPC57rhWpt3/UXpaQCcjaYFTnlwi/qE5Q
         bvQNvQEciyVhffFF1LBuBRZKC2HyfYVpoX6M7wxknTEHNrrUWMTTFXoMDWpFrH9TRo4t
         b42Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715190813; x=1715795613;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2vH4bNd6Ss0R422TZj0wAc00Y2LU/Z/9oAmYOP5+g0=;
        b=KINWK1JE880qTLqEBAYmxEWYq48dHr8X0f9JUNGqqWLMAYXEQ9U7vv/lthgaj4mXLb
         Tjo7rFu3o+YPXgc1omEOaqRECDbLfU40MvjqJsTtbtvU3VRLmzNUsYhypTJ0VHg/LhoJ
         WFTLg9vL8CwH7UlkYUteX7oCv7CbbZ9PqvxuNuWEhvkHKro1eku9ts2blH6WRtMm9Ju5
         5/DaoGwZNq0Z7DJk3+d4D/NX/5uyT9oI7+JlrkGdJIqJuQycjcxKrmBQRW5qkmyIuZLW
         xcrx55qIAvZ/lxi2HoToYCKgX8nB2QpsNZI9EYnNNtmgT3PvhMhtJs8LsZd0mdaWsyck
         N9zA==
X-Forwarded-Encrypted: i=1; AJvYcCVArJyZTQFasw209/57lW0JPwsvj69e1CTPIFWRX7/1u0W8bQxqqFP4FlUPruYTPbQl6mlK1FM0ge6L9DgdBKvxIFJQnlnDoBTQrJsxmQ==
X-Gm-Message-State: AOJu0Yxb0PqZiwiwX0ipkkHYjNofE8+09x0B++EN+iAJgVfHXCWzKbIO
	/5y6I79Gs2KHRAqM7+c9g9kbDNi2VoAmgMe0qKj1CdYoTDN7c5nJuLjFYXCzp9E=
X-Google-Smtp-Source: AGHT+IF2J+4cHJzRkZkOke7CEGfqkv9jue8DGyFyfN7rnlviR2OAOQp+F+Jb2MFYGSJCq+ODh52Ncw==
X-Received: by 2002:a05:651c:228:b0:2e1:c6bd:ebba with SMTP id 38308e7fff4ca-2e446d83be8mr19651601fa.1.1715190812970;
        Wed, 08 May 2024 10:53:32 -0700 (PDT)
Received: from [192.168.0.3] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f882085a4sm30541715e9.39.2024.05.08.10.53.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 10:53:32 -0700 (PDT)
Message-ID: <b372c0a3-facf-4576-91b8-acabef270d87@linaro.org>
Date: Wed, 8 May 2024 18:53:31 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] arm64: dts: qcom: sc8280xp-x13s: enable pm8008
 camera pmic
To: Johan Hovold <johan+linaro@kernel.org>, Lee Jones <lee@kernel.org>,
 Mark Brown <broonie@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Das Srinagesh <quic_gurus@quicinc.com>,
 Satya Priya <quic_c_skakit@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20240506150830.23709-1-johan+linaro@kernel.org>
 <20240506150830.23709-14-johan+linaro@kernel.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20240506150830.23709-14-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/05/2024 16:08, Johan Hovold wrote:
> Enable the PM8008 PMIC which is used to power the camera sensors.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>



