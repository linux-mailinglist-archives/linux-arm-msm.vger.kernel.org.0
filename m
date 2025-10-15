Return-Path: <linux-arm-msm+bounces-77458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 54575BE0417
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 20:50:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id F3D8B354AE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 18:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51AD530146E;
	Wed, 15 Oct 2025 18:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zQGngk2D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6BB2D6E72
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760554246; cv=none; b=jtNEt6+R+WWApbzMrKOG7pSHlk/2TbKhUil6SntMDfDnX3bCVXGZ/tvl6FLyifeLeD5dpXinQnxlXlFCnJHXn8WeIBr8MH3MU41bviPQXUW3+X6tGjpNQON1/LY8G6ni+D8pKWxqQF91+lqC+Y8D16JaPlhzkmNtfcdg+7h6BQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760554246; c=relaxed/simple;
	bh=swdv/wTY0LTvBv/YcthMcjAr/gt2RxtK+9y/lOz8BJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PAEDh9cCAs5yX9wa/7hSbqHUc5U3Hj7GCazriQL0dKJlICw3CaVduMsuz0+sntzkqX6B+Fj2/AmrjWne222a/0kLLaQbnNyAwhAEGTODc1ehsUvo2K/3CvSvFbGRQ9jJktWCmbAVueVwugRKovXJxRvjXSCDuP438sOt2HwyJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zQGngk2D; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-591b99cb0c4so475727e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760554243; x=1761159043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hukg1h3ozHOZYYKzu8a9q8XV+g6fS+oS92fdsP1ACq0=;
        b=zQGngk2DmzXh1R9zj8rYdKMA9zBpfYEb4NiHomF4okkjw2x3VAZwzsoyIKHCaIZMwQ
         UiqLBK/j5yeu28iAbi6dZMZ4FkaaFxNtMSj/+NmEM5+Alt3o75U91N/KaA6IYIJVFeI4
         1ihD1sRVH5x4oUcGyVPGHh4OuxFnNk6v7Tn+aw/uBuHCOSqDmtZoQse3wYAIEwlzWbDe
         2RgrvExnBd3CeejXUbzGWlAxKhiTJxMP75h9nLekzpMKKZZ7pgL/DVZMSNe/men5Mncv
         qoS0P4mcHe6sVvLcmdG5QRTqtUMclmF4Ire4AcSHf0NieCUdS3AM4bALOKbzG7Uiw1bQ
         tRhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760554243; x=1761159043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hukg1h3ozHOZYYKzu8a9q8XV+g6fS+oS92fdsP1ACq0=;
        b=c/4et4bKnISVm+/nqwvD+MFLesb9ARvndx1IG1i0HVQH11eGpwuE4xGmXOWS/YefM6
         hbCU75U7l5Q7ff4dphvnGBASfIgh8/R9slTaKaA2MQgBNju5dlYLD3rynT+gkZlBR11W
         max84j3/2zbHmLPTtVjs3tK/cPm1Aaf0E8ht3zIlvZau73Mzf2i5XvFWGTrfczP/EyOs
         lThCve4u+dDAjteNRBAnvgmtD4CF7f7JsV9IDNtUJUt8dEYO5er/r9ZSVx4onauRI8gd
         Ki6l4ht7pl3l33NMPKFxzaRv3RwZ7Fq+YrGhms0/hjvuFvUEaGG2WU952faV0qaNUThD
         dzQA==
X-Forwarded-Encrypted: i=1; AJvYcCUoKo8FSjtW3N8138qSaDm2GzJz4eCg7PUy0jP3NpQKY5oW/uSsGWtTZqLWxuVsOt3KcRpTsv/UfubDPdD9@vger.kernel.org
X-Gm-Message-State: AOJu0YzDhrlWf+7Qn5H/mt9U/7vRFRXWjNmdgEA/MTl6PhpVZsB/WL7n
	wzrdh9paV0EVC1LFstYr19abvi/6jHACgC222y8B6wcnlH3nhk/NRKSbFedBHSR0Msk=
X-Gm-Gg: ASbGnct6M16BAWD9vy08ZwlFGi7BX4SoC4wAv//nPojX7vqHvE9w08VoJLvtaP4+GZd
	6vasjhtRPqt0MRfJiC+xPPQVYMUuPyiDbyzc7NtlMXJS2veakfttZuD6AJwRioOpIW/HDHfJFXq
	wDV6MIm25RGQc53xkI4WZAPwQnejOVBeGU6OAy2B1KjtEfoyixILfk8hjD++3ZNUHEejxhhrdLJ
	EbW/qXe5dCZ/O2KO4z78mwv+o0DLscazADrcNcja+5gqGeXJQoh+CewracKZOCkOh7AixyWm6Ht
	UYQKDTPWmcHNVhME3Bwyr0Iiae31SeQZlglWa+NAX522RiCXKPT8wDsrOD101KxPS4wzN4Ny4ZG
	bNnxD2KZwvRhNFg6Sm692FqG87oHU3htk40y96xdXw+N+203jGsFEYpmArrIOxOBctxLCU/naDz
	pLox1Wv7av9wSzWYEUuZ7SO1l5faTb+FrT4DY=
X-Google-Smtp-Source: AGHT+IG+0JkONJK7diPS9LC4IMA7PvSE07P+bqP1KzE0xk93DSkWmTXn5VqwKTon3a4GXj+CVo91gA==
X-Received: by 2002:a05:6512:3b14:b0:581:9295:1b10 with SMTP id 2adb3069b0e04-591c9017360mr816502e87.5.1760554242641;
        Wed, 15 Oct 2025 11:50:42 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-590881e4e09sm6425776e87.23.2025.10.15.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 11:50:42 -0700 (PDT)
Message-ID: <365d2e55-8ed8-432a-964c-b57601fd2385@linaro.org>
Date: Wed, 15 Oct 2025 21:50:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
 mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 quic_nihalkum@quicinc.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
 <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/25 16:13, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> The three instances of CCI found on the QCS8300 are functionally the same
> as on a number of existing Qualcomm SoCs.
> 
> Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
> common fallback.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

