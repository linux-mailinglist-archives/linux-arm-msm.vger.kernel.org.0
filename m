Return-Path: <linux-arm-msm+bounces-61553-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFE8ADC59C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 11:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7825B16AF6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9150629008E;
	Tue, 17 Jun 2025 09:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RF8fAesh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E3923B613
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 09:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750150962; cv=none; b=IqONpN3X5cVurReObAVBbkYIPP+C1KqmqsHxMA4eedfHl213edeE+Q0VrnmcVPWYPXjCaFGizNr8RWhUVSk5pxarpQRIzeZapLyV4j4XgwcKa2BveyVZWh4Nmz9+ket1tEAkOAAhyjj0TMHDABdeyKqD3aZnpAsLg/PZ1/HSOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750150962; c=relaxed/simple;
	bh=hZpp8NilOYk4lk2aLMATM3rJ4jK41OW6tkT22EaNR68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RemLtLV4uI8eQEjxEY+sIP9ldUG3PH9x7XD64IWtnoLBFcXKsGdDtvat3QIkxaGyTS4FSbyjXDgrNDVG4W5h5GE+d9Vzrp6GpH/f6PndBw9eWtgSOvrPX8ILR7qkwPUGuJvVETvpbmfsQQoNc7qvJg7fEJ91S2ClSASYoJHvIg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RF8fAesh; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553645133f0so402251e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Jun 2025 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750150959; x=1750755759; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6FSyDeLV5tNzI8jmBk6dfrtvJpCsYW4RkOqJj3Og0s=;
        b=RF8fAeshrVI5aNgHBrI+v4jsYBHw1T9TD5djqPMGUlFm9/QOZIFOQsBrO2Yn0hX3Rl
         roiEWZIuHYWaCHMhuc63tY1pv7QaKRKspyOfCvs/XRavK0914EP2W3ngmawnWJitf9PH
         30kvNGLLToIcYLnzQVXR8Rgf1/Nse8O9ZnJIA/dxdfzHtj1T/9mlZU6A5ZydQdCs4eQF
         AXFxgEO3j4vOGd9utqYFz5N7Ci8+9d+OmEgP3n626UqRTba28hHEZvCtBquVP4dlLXHh
         niTU0CZ7vOiPlN29KE7H8PdX6ArvIUsVaQGbdJOyAZ9YAcjuS87uWp2JlI5hnG0XzblK
         kW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750150959; x=1750755759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6FSyDeLV5tNzI8jmBk6dfrtvJpCsYW4RkOqJj3Og0s=;
        b=EX+ccQsIeLy7kqhHZ8s1ldeZ0UBlB2c29eVqE7QCc72R2mOH6hAHSODaINw86cCGPL
         0H1u1Vac44bn85uDUqNE3Qk4W7pzIKfEaSON2TzBE9Wvc4f5wMTr06q5SSUudL6KXRbD
         iQfNwbB2sj3lqxtpsXtDWguQ+D56TUNHb200vsEq50Q0I8hkbgQWo1HBcrjk7RCPD3D+
         wwhlPRXPMUVoEzu2UegJZzmu4qJUNMlH4ewdvgZ+1M/Mzkc9sexqCC3Znaug6ovP2dAQ
         7MjB25BjO/iQ2iCW3vvHIK23pgNaurcs2+zCE0RTLdRlH4cJFmON9wN3jPbFuUJfDE4p
         miMw==
X-Forwarded-Encrypted: i=1; AJvYcCUKgtDbp57OVdltI/UqLAOT919Xya77/QjErOJWsNoam0/dX401Uv9YLATmWwPrztRhFhV9nuwgFzpgCoBz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9u7oJ7o2a78sK4VWjnwqjCzy/KQj/DqEJGE68OOoUR05DApSg
	lBk3cP5WzbUPluxjjEfyH3fUTAC7sDKGu/vuxwU6Jvx1YJBvHWH1TjFrecnfXSlmgbA=
X-Gm-Gg: ASbGncuGlYuqAJwgzODfw17vDHo+mzzCWA75A+AhYzg3SN43HEhND1xrfM/ddhrUMU0
	7PDCXcODYJVtCfudxfQzhqDv0rHqe5OpX76KCgfxUSuTlobWHgT67IN/aDc/08s7dG2cvt94wf9
	P1xVe17XBzLZNyDeJGEKUxYrFfFXKf0t3dogKqxNvVd4lAkz4IYa7Fgfjrl9lc52m+VjHu1SmQW
	s3dcAvCimyWrxG9wStdnbQqGEs6xTpIqHIVEWhwqc/TuNf3U+D3ezW94vr6rrCCAOJL8L7/Xt8V
	3Da/B/XUgsyOxCGNCNcMDRhZXE2V/lwPVpR7cpplG0A6eHA/LIamhWt6b1iRXV4OtgTw31c2388
	qyBVpT+M2hRtkGROMeLUVRcbY12otRErdqMXVqAVe
X-Google-Smtp-Source: AGHT+IEv7meiVd5tMWXL+doCxvXY8Z6vYW1YGEvunNjM0gGLHZU0DJ0LcAS77/p7fgnwyjuHi+JcZw==
X-Received: by 2002:a05:6512:691:b0:553:2a11:9cce with SMTP id 2adb3069b0e04-553b6f4cc69mr1044756e87.14.1750150958516;
        Tue, 17 Jun 2025 02:02:38 -0700 (PDT)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553ac120167sm1823733e87.20.2025.06.17.02.02.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:02:38 -0700 (PDT)
Message-ID: <3b2f1bba-6dde-4f7d-ad87-219306e37829@linaro.org>
Date: Tue, 17 Jun 2025 12:02:37 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: camss: csiphy-3ph: Fix inadvertent
 dropping of SDM660/SDM670 phy init
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Depeng Shao <quic_depengs@quicinc.com>,
 Hans Verkuil <hans.verkuil@cisco.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250612-linux-next-25-05-30-daily-reviews-v1-0-88ba033a9a03@linaro.org>
 <20250612-linux-next-25-05-30-daily-reviews-v1-1-88ba033a9a03@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20250612-linux-next-25-05-30-daily-reviews-v1-1-88ba033a9a03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 11:07, Bryan O'Donoghue wrote:
> The moving of init sequence hook from gen2() to subdev_init() doesn't
> account for gen1 devices such as SDM660 and SDM670. The switch should find
> the right offset for gen2 PHYs only, not reject gen1. Remove the default
> error case to restore gen1 CSIPHY support.
> 
> Cc: stable@vger.kernel.org
> Fixes: fbce0ca24c3a ("media: qcom: camss: csiphy-3ph: Move CSIPHY variables to data field inside csiphy struct")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

--
Best wishes,
Vladimir

