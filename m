Return-Path: <linux-arm-msm+bounces-16924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 007B589DD83
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 17:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFADA28B854
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Apr 2024 15:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9817131736;
	Tue,  9 Apr 2024 15:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rbJZz6pd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C509612FB38
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Apr 2024 15:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674847; cv=none; b=O/v423x2qTYwy6wDAX8L4MBRiVKNJe+ciyP6ghrOK6aNhLc/E7wc+p/kUqF4vMjOmV/1gOUtplahhFXIKSXrzKWe0PHYnoAzNLfy5YHoZr7EHfAzcemIkSGrvh9+sgpkvJXYWpyeNmpz4zqVO0iCksPJK+eagPYsyVbmibqb70g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674847; c=relaxed/simple;
	bh=vDiJeOU8oPrybmyV4Svv3/9T3kTe6c6c++lJ8EMYnHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5CLIijy4ySbTGzJnKpjzezo2NQdquSHp+rLxD3vnPwlnziCprpZWVNbhSVSMejTYhE6xINynP4zLg/nosYDtAPwXsbWQEuXSC+eR7plSsjj8Rj6AFkNaakcD4xW1BpEVV6eAkD8hzGBTNBvwPNe7DkQbJhXrUlCvov7KyvVlXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rbJZz6pd; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-516d6e23253so4366248e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Apr 2024 08:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712674843; x=1713279643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0OrLZIf4Y0ZsYq3tuArNOXJoRjnrpN5lmgiiz9JN9Mw=;
        b=rbJZz6pdQGvAzZ2AaMBEJHIYgIJfQOzFD50lTGl9V7AteEtxwCL007GJGhvfKJqeWZ
         19pEHDeIQIoKnyQMtoBVyh03YhpshERSx7vDc3TLdHjDs9vxuVguTAo1voo+JcnMlgKA
         4dXPNybUfIkEPex8w6eII/m6oVcY71VKgSLj4Iil3PkdyW0C70I5KOfPQooyzVqYyBNL
         Q2kzpTMlsuGUK7fpCrzdcUfy5BpvD0y0FXrGctHjMLvt83oJ9y7LEEx5Oz1b1lUUZtC/
         aG1AcXIEvZCMHfMA0p4r6FoSUBP8/ED4nyIyTtD6bq4xGcqsX+AYljAH3Qr2OWXXwJaX
         IMXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674843; x=1713279643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0OrLZIf4Y0ZsYq3tuArNOXJoRjnrpN5lmgiiz9JN9Mw=;
        b=xHLcKDFdXxA4gSdoOIJ23JmoqrJMrCEOGRfhL/0utsDy9yFHKM3aHux+aWuDfFcEl9
         TffrR7/qISongP7r+bGdhLfAPA1ozk9uKbwsMm7M0xDeEGKfPXzu//n8SC0z8vf8nkID
         ATWk3H2/ni9h0FFr9xKeFbsFGcvDE2X8Z2ikLaIoLb2yWpemfgf/VJ8WBo6Pcwjtf/Ej
         PW/Q4qsXZfggcZ3qVBfR09Q38y64dOSlSxLAoZ40M2P3LRZf/TiCzyoFS19xkYMN6ZCP
         yuXX6fGvHWdTeb3x0nEjg/e4rmec/PyWYe1ovJ3tyuBV5B1HSXGFKdssUXtiXMUUYdwm
         IENQ==
X-Gm-Message-State: AOJu0YzoufvA7Xt+k8oCFdtlec2Y41g30tFcsoDXTXV8ALPNSvjdcRjy
	ZLUCAg4UKWc+AYVzBXCXBc/BgfpwU+pEcob7IRnDBQ+SvprDA3lpwySVBjNtrHE=
X-Google-Smtp-Source: AGHT+IHFSkujnLiGfg0zj7o0sYrHt/dlIb5YcMlONLlY0P5vlqEwj2C5/f5YPk+0wgnL1I4Yy0CneA==
X-Received: by 2002:ac2:5462:0:b0:513:9e44:c68c with SMTP id e2-20020ac25462000000b005139e44c68cmr9111012lfn.6.1712674842945;
        Tue, 09 Apr 2024 08:00:42 -0700 (PDT)
Received: from [172.30.205.99] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id f9-20020a193809000000b00516aff23fc1sm1607617lfa.138.2024.04.09.08.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 08:00:42 -0700 (PDT)
Message-ID: <03c0617e-726a-4807-a19a-bffc5dfc2599@linaro.org>
Date: Tue, 9 Apr 2024 17:00:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] arm64: dts: qcom: sc8280xp-lenovo-thinkpad-x13s:
 add USB-C orientation GPIOs
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240409-hdk-orientation-gpios-v2-0-658efd993987@linaro.org>
 <20240409-hdk-orientation-gpios-v2-4-658efd993987@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240409-hdk-orientation-gpios-v2-4-658efd993987@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/9/24 16:28, Dmitry Baryshkov wrote:
> Define the USB-C orientation GPIOs so that the USB-C ports orientation
> is known without having to resort to the altmode notifications.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

